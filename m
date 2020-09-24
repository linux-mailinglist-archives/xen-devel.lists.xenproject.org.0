Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24F9276F26
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:58:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOxF-0008DE-Q0; Thu, 24 Sep 2020 10:58:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLOxE-0008Ch-Pl
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:58:24 +0000
X-Inumbo-ID: c13c8d44-9ef2-4a83-972a-d8a668c998b7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c13c8d44-9ef2-4a83-972a-d8a668c998b7;
 Thu, 24 Sep 2020 10:58:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600945103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAS4zM5kZYnhnKp2fdMkHJxSYQ/OqQPGi+eFo0llCtI=;
 b=ejhqsHpL/Ob01V5XqQPCNTAZQc0sbmGscyf7QA81D+cc3FKp38AX8SD9q0ANOtFMO9e00X
 xZ0xTSz8yGVsBOq4AracXquh/q2A6sxI3UU/z+ujRP8fQ9Zd40x0sdTyrquI0HWHKSAxjE
 TKh9BpmiIWHYARQ75DkxtwYoqgT4ykY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CFFCBB18A;
 Thu, 24 Sep 2020 10:59:00 +0000 (UTC)
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <decab3dd-c754-1c50-6630-95e60ba5eef4@suse.com>
Date: Thu, 24 Sep 2020 12:58:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9ebdca87-4105-c27b-635d-7a1b6d4cde82@gmail.com>
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

On 23.09.2020 14:28, Oleksandr wrote:
> On 22.09.20 18:52, Jan Beulich wrote:
>> On 22.09.2020 17:05, Oleksandr wrote:
>>> 3. *arch.hvm.hvm_io*: We could also use the following:
>>>
>>>      #define ioreq_get_io_completion(v) ((v)->arch.hvm.hvm_io.io_completion)
>>>      #define ioreq_get_io_req(v) ((v)->arch.hvm.hvm_io.io_req)
>>>
>>>      This way struct hvm_vcpu_io won't be used in common code as well.
>> But if Arm needs similar field, why keep them in arch.hvm.hvm_io?
> Yes, Arm needs the "some" fields, but not "all of them" as x86 has.
> For example Arm needs only the following (at least in the context of 
> this series):
> 
> +struct hvm_vcpu_io {
> +    /* I/O request in flight to device model. */
> +    enum hvm_io_completion io_completion;
> +    ioreq_t                io_req;
> +
> +    /*
> +     * HVM emulation:
> +     *  Linear address @mmio_gla maps to MMIO physical frame @mmio_gpfn.
> +     *  The latter is known to be an MMIO frame (not RAM).
> +     *  This translation is only valid for accesses as per @mmio_access.
> +     */
> +    struct npfec        mmio_access;
> +    unsigned long       mmio_gla;
> +    unsigned long       mmio_gpfn;
> +};
> 
> But for x86 the number of fields is quite bigger. If they were in same 
> way applicable for both archs (as what we have with ioreq_server struct)
> I would move it to the common domain. I didn't think of a better idea 
> than just abstracting accesses to these (used in common ioreq.c) two 
> fields by macro.

I'm surprised Arm would need all the three last fields that you
mention. Both here and ...

>>> @@ -247,7 +247,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct
>>> hvm_ioreq_server *s)
>>>        for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
>>>        {
>>>            if ( !test_and_clear_bit(i, &d->ioreq_gfn.legacy_mask) )
>>> -            return _gfn(d->arch.hvm.params[i]);
>>> +            return _gfn(ioreq_get_params(d, i));
>>>        }
>>>
>>>        return INVALID_GFN;
>>> @@ -279,7 +279,7 @@ static bool hvm_free_legacy_ioreq_gfn(struct
>>> hvm_ioreq_server *s,
>>>
>>>        for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
>>>        {
>>> -        if ( gfn_eq(gfn, _gfn(d->arch.hvm.params[i])) )
>>> +        if ( gfn_eq(gfn, _gfn(ioreq_get_params(d, i))) )
>>>                 break;
>>>        }
>>>        if ( i > HVM_PARAM_BUFIOREQ_PFN )
>> And these two are needed by Arm? Shouldn't Arm exclusively use
>> the new model, via acquire_resource?
> I dropped HVMOP plumbing on Arm as it was requested. Only acquire 
> interface should be used.
> This code is not supposed to be called on Arm, but it is a part of 
> common code and we need to find a way how to abstract away *arch.hvm.params*

... here I wonder whether you aren't moving more pieces to common
code than are actually arch-independent. I think a prereq step
missing so far is to clearly identify which pieces of the code
are arch-independent, and work towards abstracting away all of the
arch-dependent ones.

Jan

