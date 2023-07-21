Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE62675CB0C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 17:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567596.886860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMrkm-00087i-Sh; Fri, 21 Jul 2023 15:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567596.886860; Fri, 21 Jul 2023 15:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMrkm-000859-Q0; Fri, 21 Jul 2023 15:09:12 +0000
Received: by outflank-mailman (input) for mailman id 567596;
 Fri, 21 Jul 2023 15:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bkvi=DH=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qMrkk-00084n-SZ
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 15:09:10 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8948728c-27d8-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 17:09:06 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9924ac01f98so322997166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jul 2023 08:09:06 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 mc13-20020a170906eb4d00b00988c0c175c6sm2272381ejb.189.2023.07.21.08.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 08:09:05 -0700 (PDT)
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
X-Inumbo-ID: 8948728c-27d8-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689952146; x=1690556946;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sjpbD0hG/VdEHDmZOuXkIsY3klgYFoxMw8k6FKHZP9U=;
        b=MyAYXrHvai4a/9WEWdysYfhGPcaCuYRMV97SKbI/QWvxhpHs6HTjgDy4k9wiPobbid
         y7DJ1kH7bornFFl93ssHpR8La/cJClaqPuFblcxnK7tTkgbAZn0qfef7Bzoce2p+NX5J
         ktv1imIgzXkYEPJ5jtZCiGk3TPOFrBbDY0EU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952146; x=1690556946;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjpbD0hG/VdEHDmZOuXkIsY3klgYFoxMw8k6FKHZP9U=;
        b=YigrHTp98P9Bq7vnDe/jABDvbKthCEJC1rPG/G5KeJuanuwTwpRe/k7MxcMB5xMv75
         WA9zDrxh0kuWZ9R6S0bGR7JQ+d4I45CA7FV/RdvzF+M2tEzMFZSli15lUsjvo9jHwLhD
         zrRC+FKUabrTEVydACcaltPnjjQB2pfTD3qCIF4gmsMuqKBwezIevVOzNlHggg/qPnoj
         6nthg+dD5uUPKCfdU+XFuYUmGT8ObAQBgNmtR2KTQjBh115b+Ch1zS/J9nIZu1edgyWs
         +ZXXsbbla9et22fQObI1KaRTRR+X3MFanEhT93gGXwO2ORQK5E24O8iSvrwmxBvf94qQ
         uqWw==
X-Gm-Message-State: ABy/qLYoxID3ekGhfBWa8S569n/MnhphSyXr0SEL4b/cZ705fK8asEZy
	p8uFBhiPDCpP3JN5DqN1giiA8g==
X-Google-Smtp-Source: APBJJlH1J3YPLMiCB/DBWu0AwIq4O9qygcgKGmPSsMVOD7Wg0SCWeorfMYih1h+1jYQWvaIen37t5A==
X-Received: by 2002:a17:906:8e:b0:99b:5689:1331 with SMTP id 14-20020a170906008e00b0099b56891331mr1863257ejc.59.1689952146037;
        Fri, 21 Jul 2023 08:09:06 -0700 (PDT)
Message-ID: <64ba9f91.170a0220.bad4d.8728@mx.google.com>
X-Google-Original-Message-ID: <ZLqfjirJEZKZZpJ4@EMEAENGAAD19049.>
Date: Fri, 21 Jul 2023 16:09:02 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/8] arm/mm: Document the differences between arm32 and
 arm64 directmaps
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-3-alejandro.vallejo@cloud.com>
 <437849e6-08a3-8fac-a594-2003d5b94b41@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <437849e6-08a3-8fac-a594-2003d5b94b41@xen.org>

Hi Julian,

On Thu, Jul 20, 2023 at 09:05:55PM +0100, Julien Grall wrote:
> Hi Alejandro,
> 
> On 17/07/2023 17:03, Alejandro Vallejo wrote:
> > arm32 merely covers the XENHEAP, whereas arm64 currently covers anything in
> > the frame table. These comments highlight why arm32 doesn't need to account for PDX
> > compression in its __va() implementation while arm64 does.
> > 
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> >   xen/arch/arm/include/asm/mm.h | 27 +++++++++++++++++++++++++++
> >   1 file changed, 27 insertions(+)
> > 
> > diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> > index 4262165ce2..1a83f41879 100644
> > --- a/xen/arch/arm/include/asm/mm.h
> > +++ b/xen/arch/arm/include/asm/mm.h
> > @@ -280,6 +280,19 @@ static inline paddr_t __virt_to_maddr(vaddr_t va)
> >   #define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
> >   #ifdef CONFIG_ARM_32
> > +/**
> > + * Find the virtual address corresponding to a machine address
> > + *
> > + * Only memory backing the XENHEAP has a corresponding virtual address to
> > + * be found. This is so we can save precious virtual space, as it's in
> > + * short supply on arm32. This mapping is not subject to PDX compression
> > + * because XENHEAP is known to be physically contiguous and can't hence
> > + * jump over the PDX hole. This means we can avoid the roundtrips
> > + * converting to/from pdx.
> > + *
> > + * @param ma Machine address
> > + * @return Virtual address mapped to `ma`
> > + */
> >   static inline void *maddr_to_virt(paddr_t ma)
> >   {
> >       ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
> > @@ -287,6 +300,20 @@ static inline void *maddr_to_virt(paddr_t ma)
> >       return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
> >   }
> >   #else
> > +/**
> > + * Find the virtual address corresponding to a machine address
> > + *
> > + * The directmap covers all conventional memory accesible by the
> > + * hypervisor. This means it's subject to PDX compression.
> > + *
> > + * More specifically to arm64, the directmap mappings start at the first
> > + * GiB boundary containing valid RAM. This means there's an extra offset
> > + * applied (directmap_base_pdx) on top of the regular PDX compression
> > + * logic.
> 
> I find this paragraph a bit confusing to read because it leads to think that
> pdx_to_maddr(directmap_base_pdx) will return a GiB aligned address.
> 
> The base PDX corresponds to the start of the first region and the only
> requirement is it should be page-aligned. However, when mapping in the
> virtual address space we also offset the start to ensure that superpage can
> be used (this is where the GiB alignment is used).
> 
> That's why XENHEAP_VIRT_START points to directmap_virt_start rather than
> DIRECTMAP_VIRT_START. I think it would make sense to have the logic
> following what you suggest as it would remove a memory read. But I would
> understand if you don't want to take that extra work. :)
> 
> So for now, I would suggest to remove "GiB boundary containing".
> 
> Cheers,
> 
> -- 
> Julien Grall
Just to make sure it's the wording and not my understanding at fault
(definitely having DIRECTMAP_VIRT_START != directmap_virt_start doesn't do
any favours cognitive load).

/GiB boundary
|
|   /offset=address of 1st region of RAM % 1GiB
|   |
|---------|
V         V
--------------------------------------------------------------------------
| padding |                           directmap                | padding |
--------------------------------------------------------------------------
^         ^
|         |
|         \directmap_virt_start=pdx[directmap_base_pdx]
|
\DIRECTMAP_VIRT_START

In actual words, I considered DIRECTMAP_VIRT_START the beginning of the
directmap, not directmap_virt_start.

If this is it, you probably want to document somewhere what's what. In
particular, you want a big scary message in DIRECTMAP_VIRT_START stating
that it merely delimits the virtual range where the directmap can be, not
where the directmap is, with a "See directmap_virt_start for the address
where the directmap actually starts" message attached.

With that considered I'm happy to amend as you suggested on v2.

IMO, the ARM port should not keep that base pdx variable around, but
integrate it in the pdx logic, so the first valid address always
corresponds to pdx[0]. Then given a pdx it's immediate to find frame table
entries and directmap frames. It would also greatly simplify the definition
of a pdx.

Alejandro

