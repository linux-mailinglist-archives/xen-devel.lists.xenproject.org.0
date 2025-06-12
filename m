Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3F5AD74C6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 16:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013191.1391708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjLp-0006Bp-O0; Thu, 12 Jun 2025 14:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013191.1391708; Thu, 12 Jun 2025 14:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjLp-00069K-LE; Thu, 12 Jun 2025 14:56:21 +0000
Received: by outflank-mailman (input) for mailman id 1013191;
 Thu, 12 Jun 2025 14:56:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPjLn-00069E-V3
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 14:56:19 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 658afb1a-479d-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 16:56:18 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4530921461aso9573565e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 07:56:18 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532de8c50esm23272785e9.4.2025.06.12.07.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 07:56:17 -0700 (PDT)
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
X-Inumbo-ID: 658afb1a-479d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749740178; x=1750344978; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzAxw4g7I4dYiT8/iJYFidK4yM4v8KtCoZu0xbs4GfI=;
        b=rFXga8T5goTgjjtNlB+91rmnfOkiOko3jVTJMPpJPX09oLYdW7pq9Kqcs4a8z1/1cS
         MXygWEDruLpTq/MPwgecjDFo2N2tPFMY9PnsHhfDw3x+GhBVJjNf+RGKvJxgrAiOdbHE
         irbw3GNhxQhFU2pGmMRt10hi26sBJfn/zDFhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740178; x=1750344978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzAxw4g7I4dYiT8/iJYFidK4yM4v8KtCoZu0xbs4GfI=;
        b=R3plwN/N0oC/QUJdg62eDzRo73GPVzVgKvETi6EvRdEX6M3UAPZOFSs+6c5YGDLsbr
         yHXh9jHzaiKvx7ipTIYB+d2qfxhTG0YOYH8xaDvrVaE+h8NXpu9NcBvnXM/LLNncq3Rh
         G+3/kDIAtHVZyLfg5j2vPKe4VsHT02wwfr+q4YXH7J4e8n/fXKQ9XBbgdf1uK7EHXcHj
         F4yyRPhPrnlBWvEcGcrtWPsuLbIRiScspoD9BG58I4HcNUVNlvfpta0Vkg7jvayujtxr
         584ru3KTxThR2jmlMuluYf4LDeb0cy8cjJfIYD3tN18/Sq/FF8IssUfIsPQaefIFwclH
         kQcA==
X-Gm-Message-State: AOJu0YwqKRRziWvZ3opawvnTl4/S4B2fghej506A2/l4UEk3k3b9Bkwo
	73nvPINI+HzG/oAmWfnPzu0mhqlvZpnYj3hSqMwa3CZPrl/kUbVWmSXWsDfuuVrrHFE=
X-Gm-Gg: ASbGncuOAzn7FkjLt+L7h5496nhUJ+3qQNTEa2ItEjon7n1vrVq5DqNdA1+ZD+pqs/g
	AMGnvZqf7LoIkLDKXq0poXUEhWvtF3I05IcPzmV6eqIlFzTpP6hxTqRrtayDn+Fc6jvUrBIwwma
	o0NPSPkGJSAHqv+zI5uEay6rRWVIeb2bqvelVSra/IqADfr0y1O9QNBxt24LCMbVbCL+cqDU8tF
	TRSMrcJGOKfLahyEHReKoGLQmy5Th95vuc9rUJ2b4O3kZ2PRiaX1R2N7kOmstZphBzfx5Srx+qP
	GSgSLaX6cAAS/rywRlZOHTg83AqGv/4wY/CbZBHSfoSCc06adjPrVpBYsSRO9gjxmznfN5e/DrT
	Dg//4u0bTGhKECcAUnPWRe9P9TIKteL119MM=
X-Google-Smtp-Source: AGHT+IGnToZ44MVthPVSE7NpRGPmQKCl0CMCdOn5DcQwfzy3zXlGLAERhGMcKm8e7vyZepR+WeJrVg==
X-Received: by 2002:a05:6000:22ca:b0:3a3:648e:1b74 with SMTP id ffacd0b85a97d-3a558691a65mr6125896f8f.6.1749740178104;
        Thu, 12 Jun 2025 07:56:18 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:56:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: Re: [PATCH v4] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
Message-ID: <aErqkcLYqTkykpp5@macbook.local>
References: <20250610162930.89055-1-roger.pau@citrix.com>
 <aEm8LuDrNBqjgaWF@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aEm8LuDrNBqjgaWF@l14>

On Wed, Jun 11, 2025 at 07:26:06PM +0200, Anthony PERARD wrote:
> On Tue, Jun 10, 2025 at 06:29:30PM +0200, Roger Pau Monne wrote:
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index c388899306c2..ddbff6fffc16 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -2351,6 +2351,14 @@ Windows L<https://xenproject.org/windows-pv-drivers/>.
> >  Setting B<xen_platform_pci=0> with the default device_model "qemu-xen"
> >  requires at least QEMU 1.6.
> >  
> > +
> > +=item B<xenpci_bar_uc=BOOLEAN>
> > +
> > +B<x86 only:> Select whether the memory BAR of the Xen PCI device should have
> > +uncacheable (UC) cache attribute set in MTRR.
> 
> For information, here are different name used for this pci device:
> 
> - man xl.cfg:
>     xen_platform_pci=<bool>
>         Xen platform PCI device
> - QEMU:
>     -device xen-platform
>     in comments: XEN platform pci device
>     with pci device-id PCI_DEVICE_ID_XEN_PLATFORM
> - EDK2 / OVMF:
>     XenIoPci
>         described virtual Xen PCI device
>         But XenIo is a generic protocol in EDK2
>     Before XenIo, the pci device would be linked to XenBus, and
>     loaded with PCI_DEVICE_ID_XEN_PLATFORM
> - Linux:
>     Seems to be called "xen-platform-pci"
> 
> Overall, this PCI device is mostly referenced as the Xen Platform PCI
> device. So "xenpci" or "Xen PCI device" is surprising to me, and I'm not
> quite sure what it is.

I can do xen_platform_pci_bar_uc, but it seems a bit long.

> 
> > +
> > +Default is B<true>.
> > +
> >  =item B<viridian=[ "GROUP", "GROUP", ...]> or B<viridian=BOOLEAN>
> >  
> >  The groups of Microsoft Hyper-V (AKA viridian) compatible enlightenments
> > diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> > index cc67b18c0361..cfd39cc37cdc 100644
> > --- a/tools/firmware/hvmloader/pci.c
> > +++ b/tools/firmware/hvmloader/pci.c
> > @@ -116,6 +116,8 @@ void pci_setup(void)
> >       * experience the memory relocation bug described below.
> >       */
> >      bool allow_memory_relocate = 1;
> > +    /* Select the MTRR cache attribute of the xenpci device BAR. */
> > +    bool xenpci_bar_uc = false;
> 
> This default value for `xenpci_bar_uc` mean that hvmloader changes
> behavior compared to previous version, right? Shouldn't we instead have
> hvmloader keep the same behavior unless the toolstack want to use the
> new behavior? (Like it's done for `allow_memory_relocate`,
> "platform/mmio_hole_size")
> 
> It would just mean that toolstack other than `xl` won't be surprised by
> a change of behavior.

My plan was that we didn't need changes to XAPI to implement this new
mode, but given the comment I will change to keep the previous
behavior in absence of a xenstore node.

> 
> >      BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO !=
> >                   PCI_COMMAND_IO);
> > @@ -130,6 +132,12 @@ void pci_setup(void)
> >      printf("Relocating guest memory for lowmem MMIO space %s\n",
> >             allow_memory_relocate?"enabled":"disabled");
> >  
> > +    s = xenstore_read(HVM_XS_XENPCI_BAR_UC, NULL);
> > +    if ( s )
> > +        xenpci_bar_uc = strtoll(s, NULL, 0);
> > +    printf("XenPCI device BAR MTRR cache attribute set to %s\n",
> > +           xenpci_bar_uc ? "UC" : "WB");
> > +
> >      s = xenstore_read("platform/mmio_hole_size", NULL);
> >      if ( s )
> >          mmio_hole_size = strtoll(s, NULL, 0);
> > @@ -271,6 +279,44 @@ void pci_setup(void)
> >              if ( bar_sz == 0 )
> >                  continue;
> >  
> > +            if ( !xenpci_bar_uc &&
> > +                 ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> > +                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
> > +                 vendor_id == 0x5853 &&
> > +                 (device_id == 0x0001 || device_id == 0x0002) )
> 
> We don't have defines for 0x5853 in the tree (and those device_id)?
> Maybe introduce at least one for the vendor_id:
> 
> These two names are use by QEMU, OVMF, Linux, for example.
> 
> #define PCI_VENDOR_ID_XEN           0x5853
> #define PCI_DEVICE_ID_XEN_PLATFORM  0x0001
> 
> There's even PCI_DEVICE_ID_XEN_PLATFORM_XS61 in Linux

You mean in the public headers?

For Device IDs we have ranges allocated to downstream vendors, I'm not
sure we want to keep track of whatever IDs they use for their devices.
OTOH, not tracking those IDs here means OSes are likely to miss
additions of new Xen platform PCI devices?

I could introduce public/pci.h to contain those IDs, but I would like
consensus on what should be there, otherwise this patch will get
stuck.

> 
> > diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
> > index 79c0e6bd4ad2..31b4411db7b4 100644
> > --- a/tools/firmware/hvmloader/util.c
> > +++ b/tools/firmware/hvmloader/util.c
> > @@ -867,7 +867,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
> >          config->table_flags |= ACPI_HAS_HPET;
> >  
> >      config->pci_start = pci_mem_start;
> > -    config->pci_len = pci_mem_end - pci_mem_start;
> > +    config->pci_len = RESERVED_MEMBASE - pci_mem_start;
> >      if ( pci_hi_mem_end > pci_hi_mem_start )
> >      {
> >          config->pci_hi_start = pci_hi_mem_start;
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > index 8bc768b5156c..962fa820faec 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -313,6 +313,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
> >          libxl_defbool_setdefault(&b_info->u.hvm.usb,                false);
> >          libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true);
> >          libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true);
> > +        libxl_defbool_setdefault(&b_info->u.hvm.xenpci_bar_uc,      true);
> >          libxl_defbool_setdefault(&b_info->u.hvm.pirq,               false);
> >  
> >          libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
> > diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> > index 4d67b0d28294..60ec0354d19a 100644
> > --- a/tools/libs/light/libxl_dom.c
> > +++ b/tools/libs/light/libxl_dom.c
> > @@ -819,6 +819,15 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
> >              goto err;
> >      }
> >  
> > +    if (info->type == LIBXL_DOMAIN_TYPE_HVM &&
> > +        libxl_defbool_val(info->u.hvm.xenpci_bar_uc)) {
> 
> I think this condition is wrong. You should always write the value of
> xenpci_bar_uc into xenstore, or only write it if a value have been
> selected. But I guess we already lost the information here about whether
> the value is the default or not, and it's probably not important, so I
> think you should always write the value.

Indeed, whether the value is the default or the user-selected one is
lost by the time we get here.

I would adjust according to the above comments, but I would suggest we
leave out the addition of the Xen platform PCI device IDs to a
separate patch, as I fear it will block the patch otherwise.

Thanks, Roger.

