Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E0325F97
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 10:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90152.170578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZ22-0007nY-Uw; Fri, 26 Feb 2021 09:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90152.170578; Fri, 26 Feb 2021 09:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZ22-0007n9-RE; Fri, 26 Feb 2021 09:03:30 +0000
Received: by outflank-mailman (input) for mailman id 90152;
 Fri, 26 Feb 2021 09:03:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFZ21-0007n4-J7
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 09:03:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da0ca2f5-670c-4ea6-920e-6fb2e91452da;
 Fri, 26 Feb 2021 09:03:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6335AC6E;
 Fri, 26 Feb 2021 09:03:27 +0000 (UTC)
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
X-Inumbo-ID: da0ca2f5-670c-4ea6-920e-6fb2e91452da
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614330208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLHHBQG+gRZqFcvISMbHh8pjmJkAMVV34j7OAarnsCE=;
	b=JY6v5gY+OguB/NB9fr1bs9t7kv9takJj6m6xunZgVYZIy4bv6UCdiRaM3cE0GwT0sRhF4G
	H94cauVIGQkSVfG+sLVONRC/9lDfihqOvGGzQQ6OIl7/Hea7TkdJuTLKoQhmG3NGxq5Ivc
	7cDzV1+4a+fWkkCO/IO0M+tMDFP7Aoo=
Subject: Re: [PATCH] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, julien@xen.org, xen-devel@lists.xenproject.org
References: <20210225012243.28530-1-sstabellini@kernel.org>
 <96d764b6-a719-711c-31ea-235381bfd0ce@suse.com>
 <alpine.DEB.2.21.2102250948160.3234@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe4f0f87-0b6a-c37a-7f17-e3cf40f739f1@suse.com>
Date: Fri, 26 Feb 2021 10:03:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102250948160.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 21:51, Stefano Stabellini wrote:
> On Thu, 25 Feb 2021, Jan Beulich wrote:
>> On 25.02.2021 02:22, Stefano Stabellini wrote:
>>> --- a/xen/include/public/features.h
>>> +++ b/xen/include/public/features.h
>>> @@ -114,6 +114,13 @@
>>>   */
>>>  #define XENFEAT_linux_rsdp_unrestricted   15
>>>  
>>> +/*
>>> + * A direct-mapped (or 1:1 mapped) domain is a domain for which its
>>> + * local pages have gfn == mfn.
>>> + */
>>> +#define XENFEAT_not_direct_mapped       16
>>> +#define XENFEAT_direct_mapped           17
>>
>> Why two new values? Absence of XENFEAT_direct_mapped requires
>> implying not-direct-mapped by the consumer anyway, doesn't it?
> 
> That's because if we add both flags we can avoid all unpleasant guessing
> games in the guest kernel.
> 
> If one flag or the other flag is set, we can make an informed decision.
> 
> But if neither flag is set, it means we are running on an older Xen,
> and we fall back on the current checks.

Oh, okay - if there's guesswork to avoid, then I see the point.
Maybe mention in the description?

>> Further, quoting xen/mm.h: "For a non-translated guest which
>> is aware of Xen, gfn == mfn." This to me implies that PV would
>> need to get XENFEAT_direct_mapped set; not sure whether this
>> simply means x86'es is_domain_direct_mapped() is wrong, but if
>> it is, uses elsewhere in the code would likely need changing.
> 
> That's a good point, I didn't think about x86 PV. I think the two flags
> are needed for autotranslated guests. I don't know for sure what is best
> for non-autotranslated guests.
> 
> Maybe we could say that XENFEAT_not_direct_mapped and
> XENFEAT_direct_mapped only apply to XENFEAT_auto_translated_physmap
> guests. And it would match the implementation of
> is_domain_direct_mapped().

I'm having trouble understanding this last sentence, and hence I'm
not sure I understand the rest in the way you may mean it. Neither
x86'es nor Arm's is_domain_direct_mapped() has any check towards a
guest being translated (obviously such a check would be redundant
on Arm).

> For non XENFEAT_auto_translated_physmap guests we could either do:
> 
> - neither flag is set
> - set XENFEAT_direct_mapped (without changing the implementation of
>   is_domain_direct_mapped)
> 
> What do you think? I am happy either way.

I'm happy either way as well; suitably described perhaps setting
XENFEAT_direct_mapped when !paging_mode_translate() would be
slightly more "natural". But a spelled out and enforced
dependency upon XENFEAT_auto_translated_physmap would too be fine
with me.

Jan

