Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A82A60F2E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 11:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914343.1320132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt2Rn-00007x-Q8; Fri, 14 Mar 2025 10:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914343.1320132; Fri, 14 Mar 2025 10:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt2Rn-00004z-Mx; Fri, 14 Mar 2025 10:39:23 +0000
Received: by outflank-mailman (input) for mailman id 914343;
 Fri, 14 Mar 2025 10:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt2Rm-0008Vd-Mq
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 10:39:22 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96c23a09-00c0-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 11:39:22 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2255003f4c6so34450635ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 03:39:22 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6bd4b30sm26180485ad.235.2025.03.14.03.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 03:39:20 -0700 (PDT)
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
X-Inumbo-ID: 96c23a09-00c0-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741948760; x=1742553560; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z/s3kf1LnoKkq+QgQqWhOPCisDs2xQNI8h+forCSQYg=;
        b=so/yhjDUeZwL15EvXgh426JVcIu6gX84BB5L44KDM+MHhyMiBVXOZtpskh3jb+cfMe
         MQfU19KIHmn0qz7EC9oG9a6Un/aAbstj4TIS6poAkvRy0wGnQVrfVvEsWY+Gk/DlChZo
         fY/p7ENFKuNzPNY95/eHFreYtWeR04iIQuWao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948760; x=1742553560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/s3kf1LnoKkq+QgQqWhOPCisDs2xQNI8h+forCSQYg=;
        b=YQiPAJ7q+k0AYBV3iqvBp9Ndl6YZeNQPqN2ETZdLoskBdRWNMibch1Y/wUL7i6P5vl
         6lQGLjYfp95f0jN0uTr7IC7JYJQHPUyTzahGZcN/qEBCnr/rEpjduOll1fwxI8ef5xx7
         OQUozRaB81pTkTCMYpnb+OwhhsrRU5LDroS6e0XPUTsoRHx51l7frrenBAqOMWfd86Ps
         wCbVN5ZPswHFfXCbHrpMr9Anf34SGC6LNIoCqiSVXxhlSG6mw+bwcKJOnI8GDMO4opbx
         j3PDk1cPd8a/vRf8k+5yn6jb3VHVXyKTsKZzP+BpVDVaec8MxFOWaoT3hfTZPC0RF2QM
         shxg==
X-Gm-Message-State: AOJu0Ywx65cHlBXwbVs7cNnXDS+OdN8Q4/cCbZ/jEKj5iim1tNZ9YJH2
	YuyXPyhHa7cVnLg1f4BUAK5SvzJtJwqwRnYnX94jgihj1Bbkiz4kDIlmAV8PI4s=
X-Gm-Gg: ASbGncuxX5djDYonJMEIjTD5w5OfcFrz+DEd6qhXMlBTbC2NA6f3fbp2ub8GD6k2upv
	ESUKvzx1sPInCF2ynXMROZK5biwZ5SL6NA9mIlX9K4+nvH0kHmnNrPZIQFLuSiUJodU76YZEMRr
	7IDhqKDfZty6UoFmXf+2hdYx6TQebAS/bU0etoMB6zrjEcdlak063XIpUzcEejElzyUjaZOCywK
	Zf14omaYaR2Hh9IAtdUS5cy1iArLL07hGR0+8dQ0C+Z1+oGiEDwoB6BTueoYF4wfkPxkx4Iuq5d
	3Je6hoKbZSvjxOeG3tWuuVm+iuJHwKkwriDk26FDnbvwFeK12Q==
X-Google-Smtp-Source: AGHT+IEr6wSoWexutMvaj64VhJ3L4RtCHqbym5PMJ2yCLaYu+ljq2AfzozKJJuEpGnql6WSxwxbTzg==
X-Received: by 2002:a17:902:c948:b0:223:501c:7576 with SMTP id d9443c01a7336-225e0a546dbmr28041465ad.12.1741948760522;
        Fri, 14 Mar 2025 03:39:20 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:39:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 6/7] x86/vga: fix mapping of the VGA text buffer
Message-ID: <Z9QHU-KozrXR95sL@macbook.local>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-7-roger.pau@citrix.com>
 <8ce7caae-8bf6-4ba2-8705-399129a411b6@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ce7caae-8bf6-4ba2-8705-399129a411b6@citrix.com>

(resending because I seem to have inadvertently corrupted the Cc field)

On Thu, Mar 13, 2025 at 07:39:58PM +0000, Andrew Cooper wrote:
> On 13/03/2025 3:30 pm, Roger Pau Monne wrote:
> > The call to ioremap_wc() in video_init() will always fail, because
> > video_init() is called ahead of vm_init_type(), and so the underlying
> > __vmap() call will fail to allocate the linear address space.
> >
> > Fix by reverting to the previous behavior and using the directmap entries
> > in the low 1MB.  Note the VGA text buffer directmap entries are also
> > adjusted to map the VGA text buffer as WC instead of UC-.
> >
> > Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/boot/x86_64.S        | 10 +++++++---
> >  xen/arch/x86/include/asm/config.h |  5 +++++
> >  xen/drivers/video/vga.c           | 11 ++++++++---
> >  3 files changed, 20 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
> > index 26b9d1c2df9a..07f4bdf46e31 100644
> > --- a/xen/arch/x86/boot/x86_64.S
> > +++ b/xen/arch/x86/boot/x86_64.S
> > @@ -84,15 +84,19 @@ ENTRY(__high_start)
> >  /*
> >   * Mapping of first 2 megabytes of memory. This is mapped with 4kB mappings
> >   * to avoid type conflicts with fixed-range MTRRs covering the lowest megabyte
> > - * of physical memory. In any case the VGA hole should be mapped with type UC.
> > + * of physical memory. VGA hole should be mapped with type UC, with the
> > + * exception of the text buffer that uses WC.
> >   * Uses 1x 4k page.
> >   */
> >  l1_directmap:
> >          pfn = 0
> >          .rept L1_PAGETABLE_ENTRIES
> > -        /* VGA hole (0xa0000-0xc0000) should be mapped UC-. */
> > -        .if pfn >= 0xa0 && pfn < 0xc0
> > +        /* VGA hole (0xa0000-0xb8000) should be mapped UC-. */
> > +        .if pfn >= 0xa0 && pfn < 0xb8
> >          .quad (pfn << PAGE_SHIFT) | __PAGE_HYPERVISOR_UCMINUS | _PAGE_GLOBAL | MAP_SMALL_PAGES
> > +        /* VGA text buffer (0xb80000-0xc0000) should be mapped WC. */
> > +        .elseif pfn >= 0xb8 && pfn < 0xc0
> > +        .quad (pfn << PAGE_SHIFT) | __PAGE_HYPERVISOR_WC | _PAGE_GLOBAL | MAP_SMALL_PAGES
> >          .else
> >          .quad (pfn << PAGE_SHIFT) | PAGE_HYPERVISOR_RWX | MAP_SMALL_PAGES
> >          .endif
> 
> We have to be careful doing this.
> 
> It probably is safe to use WC in the pagetables.  We don't start using
> the pagetables until after we're sure we're on a 64bit CPU, which means
> WC is available.
> 
> However, doing so now means that we need explicit SFENCE's when using
> this, even in places like early_error.  The IN/OUT instructions do flush
> WC buffers, but the UART is written to before the screen, so there's a
> chance that you'll lose the final character of the message on the screen.

I don't think early_error will ever use this mapping.

`vga_text_buffer` contains the address 0xb8000, and AFAICT it's
exclusively used with paging disabled (as the multiboot2 efi path
explicitly sets vga_text_buffer = 0).  The WC mapping created above is
on the directmap, so va > DIRECTMAP_VIRT_START.

vga_text_puts() might need such SFENCE, but arguably that should be a
different patch IMO.  Might be best to ask Jan whether this is on
purpose?

My hypothesis is that the SFENCE might only be needed in
video_endboot() and before reboot if Xen crashed ahead of
relinquishing the VGA console.

Thanks, Roger.

