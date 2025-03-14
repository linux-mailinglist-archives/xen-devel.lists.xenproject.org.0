Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F322A6107F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 12:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914483.1320232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt3fx-0000jL-Db; Fri, 14 Mar 2025 11:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914483.1320232; Fri, 14 Mar 2025 11:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt3fx-0000hR-AL; Fri, 14 Mar 2025 11:58:05 +0000
Received: by outflank-mailman (input) for mailman id 914483;
 Fri, 14 Mar 2025 11:58:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt3fw-0000hL-Be
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 11:58:04 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9538a44f-00cb-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 12:58:03 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso410437766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 04:58:03 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac314a481absm213702966b.155.2025.03.14.04.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 04:58:02 -0700 (PDT)
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
X-Inumbo-ID: 9538a44f-00cb-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741953482; x=1742558282; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=diYV6dIuO25gXeIAUwd6amf3ebUeI4QccQeZLYBE8jQ=;
        b=tXIjd3EaxWnhNCW2yA0VzXhnAff4bWsvJF9/ADeaKoqxImzJYtiy981Q+3JKYpKO6/
         WZr1fREscxvGlbnfcKcwoYZq7VeAX5NYOQ7yvKarXpy1dvBSMCT2z5KRo4fpVv2y0gLY
         Zw/XByr1XBcujIy1p/9zj+aco/3xQx/ovIkKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741953482; x=1742558282;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diYV6dIuO25gXeIAUwd6amf3ebUeI4QccQeZLYBE8jQ=;
        b=U2qBjU11I6SUSyR5JRzhH50yIaRvZiGxIQfkrIYiq/wVMaV6vIfAFJhr6iOskdkf4E
         DY9/fDXbdMlCshMAmpQbHJx6mBGwsK57kRATlE7GwaeubssY2ruPBQ6Okjbmln6C33X8
         PvE6ZPT1d1HrfJEWnIG5Ee8fnH5BpAQcfY0E82v9YLFAPipmAND6WhL68lT+gtPwXrpo
         vIU5TGarPmn/YxSaBgDpWUZybaFRl+NT9RRtqzVUNs6B60oi7dhicvyoDB2VrJxsHnMP
         GRWqWBEtkjhm8SoirOtIee1wzPJG0Gy/kBxQVtBj9QZgE4Up8NeJWPgnJlAb04NtkSad
         NXGQ==
X-Gm-Message-State: AOJu0YwqIW1plMg1Ng5Q2NYMiC1luSg8SpMMyMBA5YxEN/sdzu6cIA6s
	fH2Evljx2pcIjRioQAXezk8emGVffRR5qTFN59DXcXIqquzlS1Dd7O2AZIO3vmo=
X-Gm-Gg: ASbGnct6KlYh7VY3bWqVhQIJwuVF+5zrN/km1mb/XQ5uwoDV7UI4wMsPMBGxNaPjjmr
	chejoP+OwNJscavHna71I8Kz8ovEUUozx92znlwymMbVwq3USn0Yy65dedym4QQc0anSYHc5APt
	PjPdPoZM7BWOiV4SH22Y1PmLIjcNYpjGFgYA340qSiTOU3Z2xt2AFQiXNiAjz7BNZiHS1mxLVCR
	wM7xsko0wv4mf8CD6Z3fMaUTl7uMM71EkKSTIOSZ/5sN7gd3AkRhql/CAq88uXBaa6IUNMS3c3L
	KAB0bWgCStNB2Gq9f/5ylNgRydfAKcmVwCFNRrEFuphkmoAqzQ==
X-Google-Smtp-Source: AGHT+IGokwH9TN2+OP4RunZx7cQfcyuwNl8HrCXUjT8j8RbmCR1BAbRxF6n36P6EtF1tKuLZL3U9HQ==
X-Received: by 2002:a17:907:9694:b0:abf:72c1:6e6c with SMTP id a640c23a62f3a-ac3303bce6bmr289987466b.45.1741953482521;
        Fri, 14 Mar 2025 04:58:02 -0700 (PDT)
Date: Fri, 14 Mar 2025 12:58:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/7] x86/vga: fix mapping of the VGA text buffer
Message-ID: <Z9QZyYUz2qJxjUmp@macbook.local>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-7-roger.pau@citrix.com>
 <8ce7caae-8bf6-4ba2-8705-399129a411b6@citrix.com>
 <Z9QHU-KozrXR95sL@macbook.local>
 <16149a89-4b77-4498-84a7-66810e6f0815@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16149a89-4b77-4498-84a7-66810e6f0815@suse.com>

On Fri, Mar 14, 2025 at 12:23:32PM +0100, Jan Beulich wrote:
> On 14.03.2025 11:39, Roger Pau Monné wrote:
> > (resending because I seem to have inadvertently corrupted the Cc field)
> > 
> > On Thu, Mar 13, 2025 at 07:39:58PM +0000, Andrew Cooper wrote:
> >> On 13/03/2025 3:30 pm, Roger Pau Monne wrote:
> >>> The call to ioremap_wc() in video_init() will always fail, because
> >>> video_init() is called ahead of vm_init_type(), and so the underlying
> >>> __vmap() call will fail to allocate the linear address space.
> >>>
> >>> Fix by reverting to the previous behavior and using the directmap entries
> >>> in the low 1MB.  Note the VGA text buffer directmap entries are also
> >>> adjusted to map the VGA text buffer as WC instead of UC-.
> >>>
> >>> Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>>  xen/arch/x86/boot/x86_64.S        | 10 +++++++---
> >>>  xen/arch/x86/include/asm/config.h |  5 +++++
> >>>  xen/drivers/video/vga.c           | 11 ++++++++---
> >>>  3 files changed, 20 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
> >>> index 26b9d1c2df9a..07f4bdf46e31 100644
> >>> --- a/xen/arch/x86/boot/x86_64.S
> >>> +++ b/xen/arch/x86/boot/x86_64.S
> >>> @@ -84,15 +84,19 @@ ENTRY(__high_start)
> >>>  /*
> >>>   * Mapping of first 2 megabytes of memory. This is mapped with 4kB mappings
> >>>   * to avoid type conflicts with fixed-range MTRRs covering the lowest megabyte
> >>> - * of physical memory. In any case the VGA hole should be mapped with type UC.
> >>> + * of physical memory. VGA hole should be mapped with type UC, with the
> >>> + * exception of the text buffer that uses WC.
> >>>   * Uses 1x 4k page.
> >>>   */
> >>>  l1_directmap:
> >>>          pfn = 0
> >>>          .rept L1_PAGETABLE_ENTRIES
> >>> -        /* VGA hole (0xa0000-0xc0000) should be mapped UC-. */
> >>> -        .if pfn >= 0xa0 && pfn < 0xc0
> >>> +        /* VGA hole (0xa0000-0xb8000) should be mapped UC-. */
> >>> +        .if pfn >= 0xa0 && pfn < 0xb8
> >>>          .quad (pfn << PAGE_SHIFT) | __PAGE_HYPERVISOR_UCMINUS | _PAGE_GLOBAL | MAP_SMALL_PAGES
> >>> +        /* VGA text buffer (0xb80000-0xc0000) should be mapped WC. */
> >>> +        .elseif pfn >= 0xb8 && pfn < 0xc0
> >>> +        .quad (pfn << PAGE_SHIFT) | __PAGE_HYPERVISOR_WC | _PAGE_GLOBAL | MAP_SMALL_PAGES
> >>>          .else
> >>>          .quad (pfn << PAGE_SHIFT) | PAGE_HYPERVISOR_RWX | MAP_SMALL_PAGES
> >>>          .endif
> >>
> >> We have to be careful doing this.
> >>
> >> It probably is safe to use WC in the pagetables.  We don't start using
> >> the pagetables until after we're sure we're on a 64bit CPU, which means
> >> WC is available.
> >>
> >> However, doing so now means that we need explicit SFENCE's when using
> >> this, even in places like early_error.  The IN/OUT instructions do flush
> >> WC buffers, but the UART is written to before the screen, so there's a
> >> chance that you'll lose the final character of the message on the screen.
> > 
> > I don't think early_error will ever use this mapping.
> > 
> > `vga_text_buffer` contains the address 0xb8000, and AFAICT it's
> > exclusively used with paging disabled (as the multiboot2 efi path
> > explicitly sets vga_text_buffer = 0).  The WC mapping created above is
> > on the directmap, so va > DIRECTMAP_VIRT_START.
> > 
> > vga_text_puts() might need such SFENCE, but arguably that should be a
> > different patch IMO.  Might be best to ask Jan whether this is on
> > purpose?
> 
> I think that was wrongly omitted before already.

OK, so we should likely have an SFENCE in vga_text_puts() then.

> > My hypothesis is that the SFENCE might only be needed in
> > video_endboot() and before reboot if Xen crashed ahead of
> > relinquishing the VGA console.
> 
> This might suffice for being able to see the final picture, but it may
> result in display artifacts earlier on.
> 
> Question is whether simply undoing the ioremap_wc() (for not functioning
> correctly) isn't going to be good enough.

Yeah, that was indeed my first approach, as I was under the impression
that not use WC wouldn't make that much of a difference in the text
buffer (as opposed to not using WC for the frame buffer).  But then I
saw that making the directmap mappings of the text buffer WC wasn't
that complicated.

> Prior to the change to use that,
> we had been using UC- quite okay (even if a bit slow). An option may be
> to make a WC mapping a little later, when __vmap() is usable.

Hm, yes, that's another possibility, albeit it seems to add even more
complexity, for a display mode that I assume is not that used anymore.
Otherwise someone would have complained of not getting any output
since 81d195c6c0e2?

If there are no further objections I will just revert to use ioremap()
and leave it like that.

Thanks, Roger.

