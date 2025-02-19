Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B77A3BC60
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 12:05:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892667.1301626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhtU-0004xZ-S6; Wed, 19 Feb 2025 11:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892667.1301626; Wed, 19 Feb 2025 11:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhtU-0004vT-PT; Wed, 19 Feb 2025 11:05:32 +0000
Received: by outflank-mailman (input) for mailman id 892667;
 Wed, 19 Feb 2025 11:05:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbWK=VK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tkhtT-0004p6-Ax
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 11:05:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e0bd842-eeb1-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 12:05:30 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 509A44EF40C8;
 Wed, 19 Feb 2025 12:05:29 +0100 (CET)
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
X-Inumbo-ID: 6e0bd842-eeb1-11ef-9aa8-95dc52dad729
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1739963129;
	b=fenD8PJxLdgdC0HKSveWJeys4vUsE36or2wnkBEVELyk2r6HjYAFC/rUl9QT82Mz8rN7
	 BE6qMODzj/+pay79jiMInQtJXgo9vxYNbdNL5vBRs23IYRmrz3j4wxS7vAfmf3CBfjVqp
	 u3er8sZah5jJiMlDwHZmx7U/JfoADharr6pJfvisUjYyQytBuihCXiY0t/3GceLakYZU9
	 47lTO5vNjyTbRHpqEjLwrHDw6KAiw/GwW2n09aJyBGe3Vm+szvXixnzIugxmUrfbweSCS
	 UQl0zHBqBB8c2Jr2qU+xOqLOIB6Y6Mrkt/W0LN1a7RIIEUf5YMETyoMQz+40Em3yxo+Rw
	 5dHq8cAunR+j14imau+UO1mdGJYI4/+fRX1cOQaFyEXrd8Q+XuiMtcLaVT99G+ZGjq+54
	 67BPIsAGwkYi7g+2Z5FXWD8bMNz9aQ/vUbIIy1zzyv2q+ijYmwjJpPYOnxhxCorP0KKS1
	 fnBIkMkmq13Zn5nVXDPyPsYIP4MQs2eyj+2RziuBIpM1d1ZXhcZKcCr4EQxlOissUpq/B
	 kLNErnnuNJNNp4UjmFf2ub4juUDTA0fv2I+eyDOIrRYdwtmtvuf/SXoBqZbKfnLszrT6J
	 LZGZ2HsVLD2TEUtTUC/BQLfp1P1/rLVKFc5Vuq6mCAiCk1IvPmI9yNGo3vAXh/s=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1739963129;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=aTPvMzyPiaSGWHn90YGHNUYH02p239jA7/gQGM5p1TQ=;
	b=36jHj1moNWiw6lTwwhd1j+MOruCxwCIWPTLHM0sSwflqCJCaHadgzKasdymhrRh1tqVr
	 jl1flsrj8O/vymGN2TEaZwA3JnTaVgpoDmObL+jsn0PN5g9bgA45YeLfwIhqCkN4Xg+2m
	 f3++34NxFTvKVQN6BUsJb3YXwS7I1vjZrrcR+H8ofQeRlNntsfpcogJ5gyIlTrijxkmId
	 vDyaa1XXhVDavVg/sqNOGK0iA9E8dOUuB40aRKYWpGkJiGbS7wxEXNroD/UKjX9g/8eV1
	 pLMcmLKPf8sRDaT2IoGEWQ7AQgOmOcE/wiz0NPrRYrWnbhAD3TKkH5CntHzeaZwV7xX0O
	 ILyi0TsbncQ3ecHsbtLZeYHQLUbej1Q+bul4qqNfvzIolPLm5Yutl4I+Fknvq6Q1DIrdh
	 Z720h0/6Dx93dYgeyB1vyruFkZp8B/Nxew+3XQ/wl391AOeog0Zt2P76sr090ZDD/ODNU
	 XppUPAd1DLSlyQFhnh7oNJ9YEiIgwSBTYEXIfE+TKJwegpkMghZmGMYpV7QFECeg/iUih
	 p1pu6sYifu2zfeEoNgT7ibbw9TLntjaNM+OOVRXwEgZngzUfCbImj/E9mIzvx7RAk+UT9
	 pyST0UlllB/CyYZcmRfbt/EOSiJ1j5AJxLgg9x9dVlR2TVwzSOP4/JUnnz5j+R8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739963129; bh=6lZ3UB6RU6sRFrvfo107k53vORWltXw1FwtTNRpQEzE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zP6Baq1cOFUitVP4wM9u/PVoPYTg0Pe7HJZljha38ezpsRBFxkwao0EHeL3iveXCr
	 KVwhCUJmZ4i+Ha1x9vbwmkTM+JDfDsRcsKsClFjrNUZKffQNmpwwX+BVxUzPJ+CS92
	 U6A2CFfFw03FLV/WMAlluPOJ3YKa0VRjYh7taJ+eS4jQpMI+aAvcXqPFNsCAbu0/IL
	 wyCo7cO1MW0djGuWYVzmdW92vUuMseCcbgtQ9ylGv4OnL0ED+qy7iDR6yOSale613T
	 DBxGfhzwe+37Rdu0baKFKw3bHXNWk8JV9yUVG6kcowRqz9wwMd6+QWHFKZySzZzXhj
	 ZWacf5xn5sVyA==
MIME-Version: 1.0
Date: Wed, 19 Feb 2025 12:05:29 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: struct mctelem_cookie missing definition
In-Reply-To: <alpine.DEB.2.22.394.2502181330360.1085376@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
 <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
 <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
 <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop>
 <3c883b4587d750c2723637a037fb46b4@bugseng.com>
 <69a70bfa-203c-44f9-99ea-60a674e36442@suse.com>
 <alpine.DEB.2.22.394.2502141245150.3858257@ubuntu-linux-20-04-desktop>
 <c7f35e1a8a14eb5ffb19d67bbc63036b@bugseng.com>
 <cc9d0a73-f189-403e-9ea4-bcd961ce3c44@suse.com>
 <alpine.DEB.2.22.394.2502171837170.1085376@ubuntu-linux-20-04-desktop>
 <9d966b20-18c4-49ac-8007-95bac3a95b51@suse.com>
 <alpine.DEB.2.22.394.2502181330360.1085376@ubuntu-linux-20-04-desktop>
Message-ID: <67f796ff8151fde3791154e23dc5c7c1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-18 22:37, Stefano Stabellini wrote:
> On Tue, 18 Feb 2025, Jan Beulich wrote:
>> On 18.02.2025 03:45, Stefano Stabellini wrote:
>> > On Mon, 17 Feb 2025, Jan Beulich wrote:
>> >> On 15.02.2025 09:59, Nicola Vetrini wrote:
>> >>> On 2025-02-15 00:04, Stefano Stabellini wrote:
>> >>>> On Fri, 14 Feb 2025, Jan Beulich wrote:
>> >>>>>> Would deviating macros "COOKIE2MCTE" and "MCTE2COOKIE" work?
>> >>>>>
>> >>>>> If it did, COOKIE2ID and ID2COOKIE would likely need including as
>> >>>>> well.
>> >>>>
>> >>>> I wrote this patch. Nicola, can you please check the changes to
>> >>>> deviations.ecl, this is the first time I try to write the deviation
>> >>>> myself :-)
>> >>>>
>> >>>> ---
>> >>>> misra: add 11.2 deviation for incomplete types
>> >>>>
>> >>>> struct mctelem_cookie* is used exactly because it is an incomplete type
>> >>>> so the pointer cannot be dereferenced. This is deliberate. So add a
>> >>>> deviation for it.
>> >>>>
>> >>>> In deviations.ecl, add the list of macros that do the conversions to
>> >>>> and
>> >>>> from struct mctelem_cookie*.
>> >>>>
>> >>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> >>>>
>> >>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> >>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> >>>> index a28eb0ae76..87bfd2160c 100644
>> >>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> >>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> >>>> @@ -366,6 +366,14 @@ constant expressions are required.\""
>> >>>>  }
>> >>>>  -doc_end
>> >>>>
>> >>>> +-doc_begin="Certain pointers point to incomplete types purposely so
>> >>>> that they are impossible to dereference."
>> >>>> +-config=MC3A2.R11.2,reports+={deliberate,
>> >>>> "any_area(any_loc(any_exp(macro(^COOKIE2MCTE$))))"}
>> >>>> +-config=MC3A2.R11.2,reports+={deliberate,
>> >>>> "any_area(any_loc(any_exp(macro(^MCTE2COOKIE$))))"}
>> >>>> +-config=MC3A2.R11.2,reports+={deliberate,
>> >>>> "any_area(any_loc(any_exp(macro(^COOKIE2ID$))))"}
>> >>>> +-config=MC3A2.R11.2,reports+={deliberate,
>> >>>> "any_area(any_loc(any_exp(macro(^ID2COOKIE$))))"}
>> >>>> +}
>> >>>
>> >>> -config=MC3A2.R11.2,reports+={deliberate,
>> >>> "any_area(any_loc(any_exp(macro(name(COOKIE2MCTE||MCTE2COOKIE||COOKIE2ID||ID2COOKIE)))))"}
>> >>>
>> >>> Note however that there is also this deviation in place
>> >>>
>> >>> -doc_begin="The conversion from a pointer to an incomplete type to
>> >>> unsigned long does not lose any information, provided that the target
>> >>> type has enough bits to store it."
>> >>> -config=MC3A2.R11.2,casts+={safe,
>> >>>    "from(type(any()))
>> >>>     &&to(type(canonical(builtin(unsigned long))))
>> >>>     &&relation(definitely_preserves_value)"
>> >>> }
>> >>> -doc_end
>> >>>
>> >>> I was a bit confused by Jan's remark, which seemed correct, but I
>> >>> couldn't see any violations in the report, so I dug a bit deeper.
>> >>> ID2COOKIE and COOKIE2ID, which operate to/from unsigned long are already
>> >>> excluded due to being safe. If you envision those macros to be used with
>> >>> other types, then your deviation should mention them, otherwise they are
>> >>> already handled.
>> >>
>> >> Yet then can't we leverage that deviation to also make the other two
>> >> covered:
>> >>
>> >> #define	COOKIE2MCTE(c)		((struct mctelem_ent *)(unsigned long)(c))
>> >> #define	MCTE2COOKIE(tep)	((mctelem_cookie_t)(unsigned long)(tep))
>> >
>> > Jan is asking why ID2COOKIE and COOKIE2ID are considered safe, while
>> > COOKIE2MCTE and MCTE2COOKIE are not. I think the reason is that
>> > ID2COOKIE and COOKIE2ID convert to/from unsigned long and that falls
>> > under the other deviation we already have:
>> >
>> > -doc_begin="The conversion from a pointer to an incomplete type to
>> > unsigned long does not lose any information, provided that the target
>> > type has enough bits to store it."
>> > -config=MC3A2.R11.2,casts+={safe,
>> >    "from(type(any()))
>> >     &&to(type(canonical(builtin(unsigned long))))
>> >     &&relation(definitely_preserves_value)"
>> >
>> > On the other hand COOKIE2MCTE and MCTE2COOKIE convert to/from another
>> > pointer type, so they don't fall under the same deviation.
>> 
>> And then the adjusted forms suggested above ought to also be covered,
>> I would have thought.
> 
> I understand your point. I tried it, but it does not work. I do not 
> know
> why. Someone with more knowledge of ECLAIR internals than I have might
> be able to explain.
> 
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/my-eclair-11.2-4-1/X86_64/9176469474/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}
> 

The reason is quite simple: the deviation is for casts from any type to 
unsigned long. It would need a similar configuration 
from(type(canonical(builtin(unsigned long)))) to(any()) in order to 
catch those.

> 
> I suggest we go with this patch instead.
> 
> ---
> misra: add 11.2 deviation for incomplete types
> 
> struct mctelem_cookie* is used exactly because it is an incomplete type
> so the pointer cannot be dereferenced. This is deliberate. So add a
> deviation for it.
> 
> In deviations.ecl, add the list of macros that do the conversions to 
> and
> from struct mctelem_cookie*.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index a28eb0ae76..d33b777e6a 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -366,6 +366,10 @@ constant expressions are required.\""
>  }
>  -doc_end
> 
> +-doc_begin="Certain pointers point to incomplete types purposely so 
> that they are impossible to dereference."
> +-config=MC3A2.R11.2,reports+={deliberate, 
> "any_area(any_loc(any_exp(macro(name(COOKIE2MCTE||MCTE2COOKIE||COOKIE2ID||ID2COOKIE)))))"}
> +-doc_end
> +
>  -doc_begin="Conversions to object pointers that have a pointee type 
> with a smaller (i.e., less strict) alignment requirement are safe."
>  -config=MC3A2.R11.3,casts+={safe,
>    "!relation(more_aligned_pointee)"
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index fe0b1e10a2..04ffc62f44 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -324,6 +324,13 @@ Deviations related to MISRA C:2012 Rules:
>         semantics that do not lead to unexpected behaviour.
>       - Tagged as `safe` for ECLAIR.
> 
> +   * - R11.2
> +     - Certain pointers point to incomplete types purposely so that 
> they
> +       are impossible to dereference, since they cannot be 
> dereferenced,
> +       pointers alignments considerations do not apply.
> +     - Tagged as `deliberate` for ECLAIR. Such pointer is struct
> +       mctelem_cookie \*.
> +
>     * - R11.2
>       - The conversion from a pointer to an incomplete type to unsigned 
> long
>         does not lose any information, provided that the target type 
> has enough

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

