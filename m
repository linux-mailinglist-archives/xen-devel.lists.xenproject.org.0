Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886882775D8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 17:51:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLTWw-0004ny-2P; Thu, 24 Sep 2020 15:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLTWu-0004nE-Qu
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 15:51:32 +0000
X-Inumbo-ID: 186f353a-31e8-4a98-9076-4db38e59f626
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 186f353a-31e8-4a98-9076-4db38e59f626;
 Thu, 24 Sep 2020 15:51:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600962691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9i+i7BpJXewFBZJM7NI3pPS3XI3GQf9hKyQzLllgNDo=;
 b=jVJRbF9TDZydOh//b4dlgvKLJzk31riIQuT30bygcZT25NJa96VUE9cBwLEt+AXRDJ94SG
 QxRu+i4CH7YkadGwXhGWCIx47UChGAP10D4Jio4TEzIy7b+eAYn/izBWys1Q3XdjLOlQ4F
 0/MaLabmRJ6hqG3ZrzXpiUT9ZpdkbVY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB4D0ABD1;
 Thu, 24 Sep 2020 15:51:30 +0000 (UTC)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
 <51856cdc-54b4-3d39-bd7b-1b6ac3fc1736@gmail.com>
 <bf128337-699f-5942-b387-aa896000700c@suse.com>
 <97b48017-55e1-8464-031a-b54dd8e4e474@gmail.com>
 <d7d6d211-1a24-b452-d1ea-efb0105995b7@suse.com>
 <7bffd6ec-8c41-202a-655d-df2240c1491a@gmail.com>
 <5e59dd52-71ea-6c63-8f63-13928813bb2f@suse.com>
 <9ebdca87-4105-c27b-635d-7a1b6d4cde82@gmail.com>
 <decab3dd-c754-1c50-6630-95e60ba5eef4@suse.com>
 <2109292f-bdf8-d17d-2563-aa99e39e7c2f@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cbc10740-d8e2-dc03-a0ab-845a456514c4@suse.com>
Date: Thu, 24 Sep 2020 17:51:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2109292f-bdf8-d17d-2563-aa99e39e7c2f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.09.2020 17:38, Oleksandr wrote:
> On 24.09.20 13:58, Jan Beulich wrote:
>> On 23.09.2020 14:28, Oleksandr wrote:
>>> On 22.09.20 18:52, Jan Beulich wrote:
>>>> On 22.09.2020 17:05, Oleksandr wrote:
>>>>> @@ -247,7 +247,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct
>>>>> hvm_ioreq_server *s)
>>>>>         for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
>>>>>         {
>>>>>             if ( !test_and_clear_bit(i, &d->ioreq_gfn.legacy_mask) )
>>>>> -            return _gfn(d->arch.hvm.params[i]);
>>>>> +            return _gfn(ioreq_get_params(d, i));
>>>>>         }
>>>>>
>>>>>         return INVALID_GFN;
>>>>> @@ -279,7 +279,7 @@ static bool hvm_free_legacy_ioreq_gfn(struct
>>>>> hvm_ioreq_server *s,
>>>>>
>>>>>         for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
>>>>>         {
>>>>> -        if ( gfn_eq(gfn, _gfn(d->arch.hvm.params[i])) )
>>>>> +        if ( gfn_eq(gfn, _gfn(ioreq_get_params(d, i))) )
>>>>>                  break;
>>>>>         }
>>>>>         if ( i > HVM_PARAM_BUFIOREQ_PFN )
>>>> And these two are needed by Arm? Shouldn't Arm exclusively use
>>>> the new model, via acquire_resource?
>>> I dropped HVMOP plumbing on Arm as it was requested. Only acquire
>>> interface should be used.
>>> This code is not supposed to be called on Arm, but it is a part of
>>> common code and we need to find a way how to abstract away *arch.hvm.params*
>> ... here I wonder whether you aren't moving more pieces to common
>> code than are actually arch-independent. I think a prereq step
>> missing so far is to clearly identify which pieces of the code
>> are arch-independent, and work towards abstracting away all of the
>> arch-dependent ones.
> Unfortunately, not all things are clear and obvious from the very beginning.
> I have to admit, I didn't even imagine earlier that *arch.hvm.* usage in 
> the common code is a layering violation issue.
> Hopefully, now it is clear as well as the steps to avoid it in future.
> 
> ...
> 
> 
> I saw your advise (but haven't answered yet there) regarding splitting 
> struct hvm_vcpu_io in
> [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for IOREQ/DM 
> features. I think, it makes sense.
> The only remaining bits I would like to clarify here is 
> *arch.hvm.params*. Should we really want to move HVM params field to the 
> common code
> rather than abstracting away by proposed macro?

I don't think I suggested doing so. In fact I recall having voiced
my expectation that Arm wouldn't use this at all. So yes, I agree
this better wouldn't be moved out of arch.hvm, but instead accesses
be abstracted by another means.

Jan

