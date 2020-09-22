Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADAC2748A7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:57:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKnSo-00043a-Ur; Tue, 22 Sep 2020 18:56:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKnSn-00043V-Kp
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:56:29 +0000
X-Inumbo-ID: 1079b949-e67c-4816-9983-0560fcac0db0
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1079b949-e67c-4816-9983-0560fcac0db0;
 Tue, 22 Sep 2020 18:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600800988;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6LL/C1juBq9l/QonhL1W32QFlYby26Q95TFXZ9chZOo=;
 b=LCuo974XssX1OyG/evUiBhM5Nk4OUPzeunMhAujxn/X7KOEWvvF9FWOm
 1wyqWGQiqa1bkm7g8SGFp45qc4fLvzLd8J/0hKO5mIK6y6x87oOta2Mzo
 1aK1fTWJlTMhbfddXQ8IjpJ4mPUAXwEnKlBl4Zr3mZuE/vPahMvhNGGsJ k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UE+4foj0CQnB0HR1lPo1a+wXCSRwgwaPasZcum5xe77oZuBHjTO53lekCnmfLLidtKw6EIjW1b
 aSotJDJntf5WPX9Ys0akmuz2PbTlF+8pSw8xOSFc4WlWgUlIXOWkWm26FuoiXejIcFoKgBE5r3
 +4AsQ6k7kuiGJxgNPZFa6UXDpGWHs0SS+n8ZJOmp6FZ3depXrG41YpTY8HiAgXBOXQDaBs8u4w
 VMp+axVswT/4Hql122ewAmjTMJqI6M5J/1eAaApVUbiTsc3GMtxJC51T+ib7JjnIU1hpL1aIcQ
 X34=
X-SBRS: 2.7
X-MesageID: 27585138
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27585138"
Subject: Re: [PATCH v4 2/4] xen: Introduce HAS_M2P config and use to protect
 mfn_to_gmfn call
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-3-julien@xen.org>
 <a2e1773d-cb01-fa02-334a-a642f9316b57@citrix.com>
 <d80519d8-6699-7beb-9192-0e87623b0b62@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bc50c5cd-d239-60a4-0a66-790717de5815@citrix.com>
Date: Tue, 22 Sep 2020 19:56:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d80519d8-6699-7beb-9192-0e87623b0b62@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 22/09/2020 19:20, Julien Grall wrote:
>>> +
>>>   #endif /* __ASM_DOMAIN_H__ */
>>>     /*
>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>> index 5c5e55ebcb76..7564df5e8374 100644
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -136,6 +136,12 @@ struct xen_domctl_getdomaininfo {
>>>       uint64_aligned_t outstanding_pages;
>>>       uint64_aligned_t shr_pages;
>>>       uint64_aligned_t paged_pages;
>>> +#define XEN_INVALID_SHARED_INFO_FRAME (~(uint64_t)0)
>>
>> We've already got INVALID_GFN as a constant used in the interface.  Lets
>> not proliferate more.
>
> This was my original approach (see [1]) but this was reworked because:
>    1) INVALID_GFN is not technically defined in the ABI. So the
> toolstack has to hardcode the value in the check.
>    2) The value is different between 32-bit and 64-bit Arm as
> INVALID_GFN is defined as an unsigned long.
>
> So providing a new define is the right way to go.

There is nothing special about this field.  It should not have a
dedicated constant, when a general one is the appropriate one to use.

libxl already has LIBXL_INVALID_GFN, which is already used.

If this isn't good enough, them the right thing to do is put a proper
INVALID_GFN in the tools interface.

>>>       uint64_aligned_t cpu_time;
>>>       uint32_t nr_online_vcpus;    /* Number of VCPUs currently
>>> online. */
>>> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
>>> index cde0d9c7fe63..7281eb7b36c7 100644
>>> --- a/xen/include/xen/domain.h
>>> +++ b/xen/include/xen/domain.h
>>> @@ -131,4 +131,16 @@ void vnuma_destroy(struct vnuma_info *vnuma);
>>>   static inline void vnuma_destroy(struct vnuma_info *vnuma) {
>>> ASSERT(!vnuma); }
>>>   #endif
>>>   +#ifdef CONFIG_HAS_M2P
>>> +#define domain_shared_info_gfn(d) ({                            \
>>> +    const struct domain *d_ = (d);                              \
>>> +    gfn_t gfn_;                                                 \
>>> +                                                                \
>>> +    gfn_ = mfn_to_gfn(d_, _mfn(__virt_to_mfn(d_->shared_info)));\
>>> +    BUG_ON(SHARED_M2P(gfn_x(gfn_)));                            \
>>> +                                                                \
>>> +    gfn_;                                                       \
>>> +})
>>
>> ... this wants to be
>>
>> #ifndef arch_shared_info_gfn
>> static inline gfn_t arch_shared_info_gfn(const struct domain *d) {
>> return INVALID_GFN; }
>> #endif
>>
>> with
>>
>> gfn_t arch_shared_info_gfn(const struct domain *d);
>> #define arch_shared_info_gfn arch_shared_info_gfn
>>
>> in asm-x86/domain.h
>>
>> and the actual implementation in arch/x86/domain.c
>
> What's wrong with implement it in xen/domain.h? After all there is
> nothing x86 specific in the implementation...

d->shared_info is allocated in arch specific code, not common code. 
This macro assumes that __virt_to_mfn() is safe to call on the pointer.

For an approaching obsolete part of the API/ABI (particularly given the
new HVM plans), I'd just stuff it in x86 and call it done.  Its easy
enough to re-evaluate if a second appears.

~Andrew

