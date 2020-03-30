Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3001975DE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 09:41:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIp0e-0002cw-UX; Mon, 30 Mar 2020 07:39:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jIp0d-0002cq-Op
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 07:38:59 +0000
X-Inumbo-ID: 8467b01a-7259-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8467b01a-7259-11ea-b34e-bc764e2007e4;
 Mon, 30 Mar 2020 07:38:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 17DF1AE99;
 Mon, 30 Mar 2020 07:38:58 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-2-julien@xen.org>
 <4896eacc-10ce-5db9-3990-d74fb05e2ef0@suse.com>
 <6d544a04-72a2-0407-64da-789f9a82b0e0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfa94f76-8e6e-4e17-9173-bb210e60eadd@suse.com>
Date: Mon, 30 Mar 2020 09:38:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6d544a04-72a2-0407-64da-789f9a82b0e0@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 01/17] xen/x86: Introduce helpers to
 generate/convert the CR3 from/to a MFN/GFN
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.03.2020 11:14, Julien Grall wrote:
> On 25/03/2020 14:46, Jan Beulich wrote:
>> On 22.03.2020 17:14, julien@xen.org wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Introduce handy helpers to generate/convert the CR3 from/to a MFN/GFN.
>>>
>>> Note that we are using cr3_pa() rather than xen_cr3_to_pfn() because the
>>> latter does not ignore the top 12-bits.
>>
>> I'm afraid this remark of yours points at some issue here:
>> cr3_pa() is meant to act on (real or virtual) CR3 values, but
>> not (necessarily) on para-virtual ones. E.g. ...
>>
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -1096,7 +1096,7 @@ int arch_set_info_guest(
>>>       set_bit(_VPF_in_reset, &v->pause_flags);
>>>         if ( !compat )
>>> -        cr3_mfn = _mfn(xen_cr3_to_pfn(c.nat->ctrlreg[3]));
>>> +        cr3_mfn = cr3_to_mfn(c.nat->ctrlreg[3]);
>>
>> ... you're now losing the top 12 bits here, potentially
>> making ...
>>
>>>       else
>>>           cr3_mfn = _mfn(compat_cr3_to_pfn(c.cmp->ctrlreg[3]));
>>>       cr3_page = get_page_from_mfn(cr3_mfn, d);
>>
>> ... this succeed when it shouldn't.
>>
>>> --- a/xen/include/asm-x86/mm.h
>>> +++ b/xen/include/asm-x86/mm.h
>>> @@ -524,6 +524,26 @@ extern struct rangeset *mmio_ro_ranges;
>>>   #define compat_pfn_to_cr3(pfn) (((unsigned)(pfn) << 12) | ((unsigned)(pfn) >> 20))
>>>   #define compat_cr3_to_pfn(cr3) (((unsigned)(cr3) >> 12) | ((unsigned)(cr3) << 20))
>>>   +static inline unsigned long mfn_to_cr3(mfn_t mfn)
>>> +{
>>> +    return xen_pfn_to_cr3(mfn_x(mfn));
>>> +}
>>> +
>>> +static inline mfn_t cr3_to_mfn(unsigned long cr3)
>>> +{
>>> +    return maddr_to_mfn(cr3_pa(cr3));
>>> +}
>>> +
>>> +static inline unsigned long gfn_to_cr3(gfn_t gfn)
>>> +{
>>> +    return xen_pfn_to_cr3(gfn_x(gfn));
>>> +}
>>> +
>>> +static inline gfn_t cr3_to_gfn(unsigned long cr3)
>>> +{
>>> +    return gaddr_to_gfn(cr3_pa(cr3));
>>> +}
>>
>> Overall I think that when introducing such helpers we need to be
>> very clear about their intended uses: Bare underlying hardware,
>> PV guests, or HVM guests. From this perspective I also think that
>> having MFN and GFN conversions next to each other may be more
>> confusing than helpful, the more that there are no uses
>> introduced here for the latter. When applied to HVM guests,
>> xen_pfn_to_cr3() also shouldn't be used, as that's a PV construct
>> in the public headers. Yet I thing conversions to/from GFNs
>> should first and foremost be applicable to HVM guests.
> 
> There are use of GFN helpers in the series, but I wanted to avoid
> introducing them in the middle of something else. I can try to
> find a couple of occurences I can switch to use them now.

With your proposal below splitting patches at the HVM/PV/host
boundaries may make sense nevertheless.

> Regarding the term GFN, it is not meant to be HVM only.

Of course, hence my "first and foremost".

> So we may want to prefix the helpers with hvm_ to make it clear.
> 
>>
>> A possible route to go may be to e.g. accompany
>> {xen,compat}_pfn_to_cr3() with {xen,compat}_mfn_to_cr3(), and
>> leave the GFN aspect out until such patch that would actually
>> use them (which may then make clear that these actually want
>> to live in a header specifically applicable to translated
>> guests).
> 
> I am thinking to introduce 3 sets of helpers:
>     - hvm_cr3_to_gfn()/hvm_gfn_to_cr3(): Handle the CR3 for HVM guest
>     - {xen, compat}_mfn_to_cr3()/{xen, compat}_cr3_to_mfn(): Handle the CR3 for PV guest.
>     - host_cr3_to_mfn()/host_mfn_to_cr3(): To handle the host cr3.
> 
> What do you think?

Maybe some variation thereof:

 - hvm_cr3_to_gfn()/hvm_gfn_to_cr3(): Handle the CR3 for HVM guest
 - {pv,compat}_mfn_to_cr3()/{pv,compat}_cr3_to_mfn(): Handle the CR3 for PV guest
 - cr3_to_mfn()/mfn_to_cr3(): To handle the host cr3

? This is because I'd prefer to avoid host_ prefixes (albeit I'm
not entirely opposed to such), and I'd also prefer to use xen_
prefixes as they're generally ambiguous as to what aspect of "Xen"
they actually mean.

Jan

