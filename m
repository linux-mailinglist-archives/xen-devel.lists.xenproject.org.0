Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8778C2690A8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:52:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqlM-0004ZF-E2; Mon, 14 Sep 2020 15:51:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odsp=CX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kHqlK-0004ZA-Oj
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:51:26 +0000
X-Inumbo-ID: 47c26fe6-7880-45dd-89f6-ee9df3a38919
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47c26fe6-7880-45dd-89f6-ee9df3a38919;
 Mon, 14 Sep 2020 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600098685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zNmAcsDde02wdiZpyIQRwEpgrcg5DjLMnBO5JvDuNL4=;
 b=YutmchZhEYNdU7mQM7NfW/E+fLRYM2X8kvkcDWSFI7pxSAVcWOgnHTi6
 nyJsgEdVSe/ES44EBxqxNDumyv7mYJqNFKhztu6vNolj/7ELw+ppxqNIB
 FnBVHy2v3UsPzV7VmYK2OS8UlU6nzB+Eut+EtWZMKuSSrc4age4z4PXEI s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0CqRPi2S669xpTIWZ/nP3l/+62Zwd6UTPATkRLXXgeo4+eg2ZJty4teA/udU5ti5rT99+WVvoD
 hmhTcdn9c2qcIDHraq7yv3bGfqo+Gi79l/G8+eSKEzC8QdQK9DxgycFCd21Y1qkjw6Y3y9I5pg
 E/4b3ePcuvjtg/3NJdQW5vaZ5x/5kveaQwE6kyWB33BttLo5kQ9XsI4V/ATeGTNySgboyFN/Fq
 rPJ95/bpkWAgtKTBhc2Yik+p6ZeGl8HOKWd4RP6sI2wZSzfcNJDSxU88q6v6Vac/7m6UUIn0fe
 zJU=
X-SBRS: 2.7
X-MesageID: 26767350
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,426,1592884800"; d="scan'208";a="26767350"
Date: Mon, 14 Sep 2020 17:51:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@citrix.com>, "Julien
 Grall" <julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
Subject: Re: [PATCH v2 2/2] EFI: free unused boot mem in at least some cases
Message-ID: <20200914155116.GH753@Air-de-Roger>
References: <5dd2fcea-d8ec-1c20-6514-c7733b59047f@suse.com>
 <f474ff55-cd39-fd6e-f96e-942a17e959ee@suse.com>
 <20200914151608.GF753@Air-de-Roger>
 <bd8eaf14-0668-003e-d58d-2633e5a22c15@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd8eaf14-0668-003e-d58d-2633e5a22c15@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Mon, Sep 14, 2020 at 05:26:57PM +0200, Jan Beulich wrote:
> On 14.09.2020 17:16, Roger Pau Monné wrote:
> > On Mon, Aug 24, 2020 at 02:08:11PM +0200, Jan Beulich wrote:
> >> Address at least the primary reason why 52bba67f8b87 ("efi/boot: Don't
> >> free ebmalloc area at all") was put in place: Make xen_in_range() aware
> >> of the freed range. This is in particular relevant for EFI-enabled
> >> builds not actually running on EFI, as the entire range will be unused
> >> in this case.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks much.
> 
> >> @@ -1145,7 +1146,8 @@ void __init noreturn __start_xen(unsigne
> >>  
> >>          /*
> >>           * This needs to remain in sync with xen_in_range() and the
> >> -         * respective reserve_e820_ram() invocation below.
> >> +         * respective reserve_e820_ram() invocation below. No need to
> >> +         * query efi_boot_mem_unused() here, though.
> >>           */
> >>          mod[mbi->mods_count].mod_start = virt_to_mfn(_stext);
> >>          mod[mbi->mods_count].mod_end = __2M_rwdata_end - _stext;
> > 
> > I find this extremely confusing, we reuse mod_start/mod_end to contain
> > a mfn and a size (in bytes) instead of a start and end address (not
> > something that should be fixed here, but seeing this I assumed it was
> > wrong).
> 
> While perhaps somewhat confusing, I still think it was a fair thing
> to do in favor of introducing a completely new way of propagating
> respective information, and then having the consumer of this data
> look at two different places.

Maybe we could add a union there so that mod_end would alias with
mod_size or something.

> >> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
> >> +{
> >> +    *start = (unsigned long)ebmalloc_mem + PAGE_ALIGN(ebmalloc_allocated);
> >> +    *end = (unsigned long)ebmalloc_mem + sizeof(ebmalloc_mem);
> >> +
> >> +    return *start < *end;
> >> +}
> >> +
> >>  void __init free_ebmalloc_unused_mem(void)
> >>  {
> >> -#if 0 /* FIXME: Putting a hole in the BSS breaks the IOMMU mappings for dom0. */
> >>      unsigned long start, end;
> >>  
> >> -    start = (unsigned long)ebmalloc_mem + PAGE_ALIGN(ebmalloc_allocated);
> >> -    end = (unsigned long)ebmalloc_mem + sizeof(ebmalloc_mem);
> >> +#ifdef CONFIG_X86
> >> +    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
> > 
> > Could you make the ebmalloc size (EBMALLOC_SIZE) 2MB (and aligned), so
> > that you would only shatter the malloc'ed pages but not the
> > surrounding mappings?
> > 
> > That would be a good compromise IMO.
> 
> Yes, that's what I've been considering as a compromise as well. In
> fact I was further thinking whether to allocate the space from the
> linker script instead of having a global/static object. Maybe by
> extending into the .pad section, which is already 2Mb aligned anyway.

We would have to adjust the calculations then, but would be fine IMO
as it won't require poking a hole in the bss section. I assume we
would need to then move _end to cover it.

> Another option is to not further align the whole blob at all and
> merely free whatever comes past the next 2Mb boundary (and is not
> in use). This would avoid having an up to 2Mb block of unused, not
> freed memory ahead of the ebmalloc one.

I would just place it at the end of the loaded image (after bss) as it
seems simpler.

Roger.

