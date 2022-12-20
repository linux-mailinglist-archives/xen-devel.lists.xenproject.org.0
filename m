Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA72652491
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 17:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467195.726222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7fNx-0000py-5I; Tue, 20 Dec 2022 16:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467195.726222; Tue, 20 Dec 2022 16:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7fNx-0000ni-2T; Tue, 20 Dec 2022 16:22:33 +0000
Received: by outflank-mailman (input) for mailman id 467195;
 Tue, 20 Dec 2022 16:22:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7fNv-0000nc-S1
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 16:22:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7fNv-0005tN-CI; Tue, 20 Dec 2022 16:22:31 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7fNv-0001A4-6T; Tue, 20 Dec 2022 16:22:31 +0000
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
	bh=9Dxj2dYWB0r0CKG1CsBAV8K2a1ApM568hkKenPYfW0c=; b=IJSV0T7PboXOMjvDuiUxMteztL
	u71F/1Xw7zbqb7YUbYgZ4l3duG1G7JnefaX1ofE46IPWWiDXxDROly0cJToLw0j2MQ40ptfal5H85
	Ixxg10uI2a7vhB9Gb2X6AtefRC+2YMPQhqxgv7JuzwmW7mUyFPL5Fl2BIs/FSX2sr0Rc=;
Message-ID: <3fe5846a-b4f4-7fbd-6745-78f1c20f11f7@xen.org>
Date: Tue, 20 Dec 2022 16:22:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v1 8/9] xen/arm: Other adaptations required to support 32bit
 paddr
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-9-ayan.kumar.halder@amd.com>
 <45f897bc-3700-d3f0-4f4b-43598c0b8560@xen.org>
 <41b5c4f5-aa95-5dec-55c8-4e1f1654f8a1@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <41b5c4f5-aa95-5dec-55c8-4e1f1654f8a1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 20/12/2022 15:24, Ayan Kumar Halder wrote:
> On 16/12/2022 10:23, Julien Grall wrote:
>> Each adaptations are distinct, so I would prefer if they are in in 
>> separate patch.
>>
>> This will also make clear which components you touched because I would 
>> be surprised if this is really the only place where we need 
>> adaptation. Maybe that's because you didn't compile everything (which 
>> is fine).
>>
>> On 15/12/2022 19:32, Ayan Kumar Halder wrote:
>>> 1. Supersections are supported only for paddr greater than 32 bits.
>>
>> Two questions:
>>  * Can you outline why we can't keep the code around?
> 
> For PA_32, the following bitoperation will overflow :-
> 
>              *ipa |= (paddr_t)(pte.supersec.extbase1) << 
> L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
>              *ipa |= (paddr_t)(pte.supersec.extbase2) << 
> L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;
> 
> Also, pte.supersec.extbase1 and pte.supersec.extbase2 are not valid for 
> PA_32. Refer xen/arch/arm/include/asm/short-desc.h

You are right about extbase1 and extbase2. See below for the 
supersection support.

> 
> unsigned int extbase2:4;    /* Extended base address, PA[39:36] */
> 
> unsigned int extbase1:4;    /* Extended base address, PA[35:32] */
> 
>>  * Can you give a pointer to the Arm Arm that says supersection is not 
>> supported?
> 
> I could not find any sentence in Arm Arm which says supersection is 
> **not** supported on 32 bit PA.
> 
> However,
> 
> Refer"ARM DDI 0487I.a ID081822", G5.4 "The VMSAv8-32 Short-descriptor 
> translation table format", G5-9163
> 
> "Support for Supersections is **optional**, except that an 
> implementation that supports more than 32 bits of PA must also support 
> Supersections to provide access to the entire PA space."
> 
> Also, G5.1.3 "Address spaces in VMSAv8-32", G5-9149
> 
> "AArch32 defines two translation table formats. The Long-descriptor 
> format gives access to the full 40-bit IPA or PA space at a granularity 
> of 4KB. The Short-descriptor format:
>     Gives access to a 32-bit PA space at 4KB granularity.
>     Gives access to a 40-bit PA space, but only at 16MB granularity, by 
> the use of Supersections."
> 
> from the above 2 snippets, I inferred that supersections are only 
> supported for PAs greater than 32 bits.
> I could not find any evidence of supersections supported for 32 bit PA.

 From what you quoted above supersection is optional unless the 
processor support more than 32-bit PA. IOW, an implementer is free to 
implement the feature even if it is not strictly necessary when the 
processor only supports 32-bit PA. This because it is useful to reduce 
the TLB contention.

So if we want to #ifdef some code, then only the two lines using 
L1DESC_SUPERSECTION_EXT_BASE{1, 2}_SHIFT should be protected. The rest 
should stay as-is.

Cheers,

-- 
Julien Grall

