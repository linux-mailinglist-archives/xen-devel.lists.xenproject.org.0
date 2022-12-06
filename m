Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3783D644B7E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 19:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455453.712928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cZt-0007NE-7c; Tue, 06 Dec 2022 18:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455453.712928; Tue, 06 Dec 2022 18:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cZt-0007KL-4o; Tue, 06 Dec 2022 18:22:01 +0000
Received: by outflank-mailman (input) for mailman id 455453;
 Tue, 06 Dec 2022 18:21:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2cZr-0007KF-NP
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 18:21:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2cZr-00072V-8j; Tue, 06 Dec 2022 18:21:59 +0000
Received: from [54.239.6.185] (helo=[192.168.22.87])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2cZr-0003Wu-2l; Tue, 06 Dec 2022 18:21:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=lGZYx/PoYXTAgI1I/5gJZi2SQsgXcVeIbp0Q8gp47ZE=; b=l0xBhcU7ZGM21LTCX/AJmgfZgy
	5KtjsnCkVhBq7Y1On9B/Oa6/wDuu0++yNiIjCfv1EBUus+Lb98MPGunLh0KgbWFk4crGTDZ87qjCM
	Ghzdm7fwXvHlzy5D929e7vFo1udHQGRnMjFPcuciP/SFA1kQA6vf0VBLJjDEBHRbYQZA=;
Message-ID: <56584174-ffe6-1f35-4da8-251ff67b2112@xen.org>
Date: Tue, 6 Dec 2022 18:21:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v5 1/2] xen/arm: vpl011: emulate non-SBSA registers as
 WI/RAZ
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Jiamei Xie <jiamei.xie@arm.com>,
 xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221205072640.2092473-1-jiamei.xie@arm.com>
 <20221205072640.2092473-2-jiamei.xie@arm.com>
 <6ab96cd0-9b9a-6ad4-50b1-ed5e02812696@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6ab96cd0-9b9a-6ad4-50b1-ed5e02812696@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/12/2022 12:39, Michal Orzel wrote:
> On 05/12/2022 08:26, Jiamei Xie wrote:
>>
>>
>> When the guest kernel enables DMA engine with "CONFIG_DMA_ENGINE=y",
>> Linux SBSA PL011 driver will access PL011 DMACR register in some
>> functions. As chapter "B Generic UART" in "ARM Server Base System
>> Architecture"[1] documentation describes, SBSA UART doesn't support
>> DMA. In current code, when the kernel tries to access DMACR register,
>> Xen will inject a data abort:
>> Unhandled fault at 0xffffffc00944d048
>> Mem abort info:
>>    ESR = 0x96000000
>>    EC = 0x25: DABT (current EL), IL = 32 bits
>>    SET = 0, FnV = 0
>>    EA = 0, S1PTW = 0
>>    FSC = 0x00: ttbr address size fault
>> Data abort info:
>>    ISV = 0, ISS = 0x00000000
>>    CM = 0, WnR = 0
>> swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
>> [ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803, pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
>> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
>> ...
>> Call trace:
>>   pl011_stop_rx+0x70/0x80
>>   tty_port_shutdown+0x7c/0xb4
>>   tty_port_close+0x60/0xcc
>>   uart_close+0x34/0x8c
>>   tty_release+0x144/0x4c0
>>   __fput+0x78/0x220
>>   ____fput+0x1c/0x30
>>   task_work_run+0x88/0xc0
>>   do_notify_resume+0x8d0/0x123c
>>   el0_svc+0xa8/0xc0
>>   el0t_64_sync_handler+0xa4/0x130
>>   el0t_64_sync+0x1a0/0x1a4
>> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
>> ---[ end trace 83dd93df15c3216f ]---
>> note: bootlogd[132] exited with preempt_count 1
>> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon
>>
>> As discussed in [2], this commit makes the access to non-SBSA registers
>> RAZ/WI as an improvement.
>>
>> [1] https://developer.arm.com/documentation/den0094/c/?lang=en
>> [2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2211161552420.4020@ubuntu-linux-20-04-desktop/
>>
>> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
> As I wrote in v4:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

