Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7363B62F061
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 10:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445504.700695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovxGr-0007qj-GJ; Fri, 18 Nov 2022 09:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445504.700695; Fri, 18 Nov 2022 09:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovxGr-0007oN-DV; Fri, 18 Nov 2022 09:02:49 +0000
Received: by outflank-mailman (input) for mailman id 445504;
 Fri, 18 Nov 2022 09:02:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ovxGp-0007oD-LI
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 09:02:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ovxGp-0004dr-67; Fri, 18 Nov 2022 09:02:47 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.85.33.185])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ovxGo-0003hK-Uy; Fri, 18 Nov 2022 09:02:47 +0000
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
	bh=fNipC4p7+64jqKHpA0sK+fqI67xo6vHno8aq1XrXGTE=; b=ezjODNjL6XdcAs1AOp+DSpxSHm
	cHZTJKgwbW3J5cxEGqQ+u5BaYnc/JhR1jcMTs0Rrt9GNLlmHMxzZyw7qL0AMMkZwZ51tpYcwsDGgJ
	Vg6CQ6FXBy9lTSUQwnet5ZZkrCugX0Kks5RBOheVuiL9xrDjfVm1GZJySDxUvkovAorg=;
Message-ID: <00538b43-fe66-5817-c9c9-738421441e85@xen.org>
Date: Fri, 18 Nov 2022 09:02:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re:
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Jiamei Xie <jiamei.xie@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20221118020013.125987-1-jiamei.xie@arm.com>
 <647f254d-0af6-ea2c-f15e-bcab5a611a98@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <647f254d-0af6-ea2c-f15e-bcab5a611a98@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/11/2022 07:47, Michal Orzel wrote:
> On 18/11/2022 03:00, Jiamei Xie wrote:
>>
>>
>> Date: Thu, 17 Nov 2022 11:07:12 +0800
>> Subject: [PATCH] xen/arm: vpl011: Make access to DMACR write-ignore
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
>> As discussed in [2], this commit makes the access to DMACR register
>> write-ignore as an improvement.
> As discussed earlier, if we decide to improve vpl011 (for now only Stefano shared his opinion),
> then we need to mark *all* the PL011 registers that are not part of SBSA ar RAZ/WI.

I would be fine to that. But I would like us to print a message using 
XENLOG_G_DEBUG to catch any OS that would touch those registers.

Cheers,

-- 
Julien Grall

