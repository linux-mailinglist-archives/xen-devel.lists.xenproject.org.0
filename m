Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD461CD080F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 16:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190761.1511029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWcQe-0004iI-7k; Fri, 19 Dec 2025 15:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190761.1511029; Fri, 19 Dec 2025 15:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWcQe-0004gt-4X; Fri, 19 Dec 2025 15:30:04 +0000
Received: by outflank-mailman (input) for mailman id 1190761;
 Fri, 19 Dec 2025 15:30:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vWcQc-0004Pg-NK
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 15:30:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vWcQb-0000Po-0h;
 Fri, 19 Dec 2025 15:30:01 +0000
Received: from [2a02:8012:3a1:0:95e7:8e47:abb2:3b42]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vWcQb-00EIyP-0b;
 Fri, 19 Dec 2025 15:30:01 +0000
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
	bh=aN+HWSIKnpLs5ZpvMVRHCHtVAG9kyx3KSXmrayZykww=; b=x9o9jjlLhevEHYZq0EHlOedNb3
	26jq1Ov6tF2iE7cGPlc+gL/5MiKjNnrUEW8+VfiT23Npe/0l2k75MWin6M9UfFlVR3Uz9Yr9726ci
	WYC+SuP3mei8VA/d2JViIBI1EWmJNtlG1slfFplPWRxH1ZtOwxxhHmGsQTV9KRSFZKUY=;
Message-ID: <98aa56bf-11bf-4585-be92-1603238826b6@xen.org>
Date: Fri, 19 Dec 2025 15:29:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <946a1c2cfaf4157074470a653bba5baa8561ebbf.1766053253.git.oleksii.kurochko@gmail.com>
 <ea01af72-c94e-4203-90c4-eaf68174b576@citrix.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <ea01af72-c94e-4203-90c4-eaf68174b576@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 18/12/2025 18:15, Andrew Cooper wrote:
>> diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
>> index f8d7d3a226..67f297797f 100644
>> --- a/xen/arch/arm/vgic/vgic-init.c
>> +++ b/xen/arch/arm/vgic/vgic-init.c
>> @@ -241,10 +245,12 @@ void domain_vgic_free(struct domain *d)
>>   
>>   int vcpu_vgic_free(struct vcpu *v)
>>   {
>> -    struct vgic_cpu *vgic_cpu = &v->arch.vgic;
>> +    struct vgic_cpu *vgic_cpu = v->arch.vgic;
>>   
>>       INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
>>   
>> +    xfree(vgic_cpu);
>> +
>>       return 0;
>>   }
> 
> Not in your part of the change, but this is bogus.  It's not remotely
> safe to init the list head like that.
> 
> The list is either already empty, in which case it's a no-op, or it
> corrupts the list.  It appears that the list mixes entries from other
> vCPUs, and from the domain.
> 
> I think this is further proof that NEW_VGIC should be deleted
> wholesale.  It's clearly not in a good state, and I get the impression
> that a badly timed evtchn sent to a domain in the middle of being
> cleaned up will cause Xen to trip over the corrupted list.

I am probably missing something. What other issues are in the NEW_VGIC?

But note, if we delete the NEW_VGIC then we are back to a situation 
where the vGIC implementation we have is not even remotely spec 
compliant (no level support, not pending/active clear/set support) and 
from previous discussion it was not possible to rework the default vGIC 
implementation to make it compliant.

I was going to say that the NEW_VGIC is meant to be experimental. But I 
see, it can selected without EXPERT :(. Thankfully it is marked as not 
security supported at least in the Kconfig doc.

Cheers,

-- 
Julien Grall


