Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DDC63A4B5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 10:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448828.705380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozaK6-0002sm-Qe; Mon, 28 Nov 2022 09:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448828.705380; Mon, 28 Nov 2022 09:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozaK6-0002pK-NF; Mon, 28 Nov 2022 09:21:10 +0000
Received: by outflank-mailman (input) for mailman id 448828;
 Mon, 28 Nov 2022 09:21:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ozaK5-0002pE-63
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 09:21:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ozaK4-0002nv-PY; Mon, 28 Nov 2022 09:21:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ozaK4-0002lB-In; Mon, 28 Nov 2022 09:21:08 +0000
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
	bh=3ww8fGtytXPmltC7cOiENBggor30iFa/jfrKd95/wD8=; b=Tpu60dp6fGYa7CqHmH+fyr1vsE
	s0/qL0aKDIwOs1cLqPJb+KughH6oSD0n+iy5nUD3xNpz9eUDrExZw2BaBjTBZck+S01TgWRO8301A
	bnFO8Ic7nk28btNJPJeDbYU2qQUiXFgW5JMT4Ia7J8Fme4V5hrrDF/Bjkn/v+LuQ2wNU=;
Message-ID: <d26f1f6b-f7f0-c6aa-1d73-3b85687000b9@xen.org>
Date: Mon, 28 Nov 2022 10:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v3 02/12] xen/Arm: GICv3: Adapt access to VMPIDR register
 for AArch32
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, jgrall@amazon.com, burzalodowa@gmail.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-3-ayan.kumar.halder@amd.com>
 <8086e3ac-445b-17a1-bba3-078024ab2579@amd.com>
 <382e5e7d-5bb3-7d7f-913f-842407d9414b@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <382e5e7d-5bb3-7d7f-913f-842407d9414b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/11/2022 14:32, Ayan Kumar Halder wrote:
> 
> On 17/11/2022 13:39, Michal Orzel wrote:
>> Hi Ayan,
> Hi Michal,
>>
>> On 11/11/2022 15:17, Ayan Kumar Halder wrote:
>>> Refer ARM DDI 0487I.a ID081822, G8-9817, G8.2.169
>>> Affinity level 3 is not present in AArch32.
>>> Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106,
>>> Affinity level 3 is not present in Armv7 (ie arm32).
>>> Thus, any access to affinity level 3 needs to be guarded within
>>> "ifdef CONFIG_ARM_64".
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> although, IMO the commit msg does not reflect the change (i.e. you do 
>> nothing
>> related to accessing MPIDR, but instead you are just not taking the 
>> Aff3 into account for AArch32).
>> Also, I'm not sure why you used VMPIDR and not MPIDR.
> 
> Actually MPIDR in EL2 is known as VMPIDR. So I used this name.

Quoting the Arm Arm: The VMPIDR, holds the value of the Virtualization 
Multiprocessor ID. This is the value returned by Non-secure EL1 reads of 
MPIDR.

The code you are touching is looking a the pCPU information. Therefore, 
the correct name of the register is MPIDR.

Cheers,

-- 
Julien Grall

