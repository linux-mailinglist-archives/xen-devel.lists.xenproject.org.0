Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1021AD0315
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 15:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008557.1387831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNX2O-000348-6k; Fri, 06 Jun 2025 13:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008557.1387831; Fri, 06 Jun 2025 13:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNX2O-00031G-47; Fri, 06 Jun 2025 13:23:12 +0000
Received: by outflank-mailman (input) for mailman id 1008557;
 Fri, 06 Jun 2025 13:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNX2M-00031A-Mi
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 13:23:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63bc92bc-42d9-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 15:23:10 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso2012608f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 06:23:09 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a53229ddf6sm1863121f8f.2.2025.06.06.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 06:23:08 -0700 (PDT)
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
X-Inumbo-ID: 63bc92bc-42d9-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749216189; x=1749820989; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+RA3oAA0fRjkxd8M6I3h2YvnmRV+aiAIRF8e64DSjPo=;
        b=rIHdotuHoavV515OwnyAzIG72XDIM8M7uk9dzLuM0e2lWLcc38aMtIL8d3V3arAGJr
         L04pn0ue/cPl/IxzUdQNaFFK3zHc6j+t+A4hzRdwqVfqb0ieh1k39R8tZOvMGldTDOQM
         hNuOqlhnfnsaWXEA5jTdZEvLNDl4mJOAvsH14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216189; x=1749820989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RA3oAA0fRjkxd8M6I3h2YvnmRV+aiAIRF8e64DSjPo=;
        b=orERWWOxsnL0VMuCH5bkV9jotuALMfvIuZpwuOQck4HReiWA7og6tOWohgd0MEfW4W
         ci0CSPsjmQ2T3GIm7nGBnM/DC54cKVmqJyc0GpGe4Zisma9XdyRyp1i1aCA3Mx7Aib2i
         VQRGdyIsB7sBBO9eBChybTeboN9IZZrgolde+hl9Bjcp9fzKWMYaFod5mV71YxhLferi
         AgTp8OQEzLv/NfF+rt6Mpc9Ae2UEnwi/4b0K69zFbawNfmbs2z4A3oYo/HXLkYI8Da1j
         PzZHBvH9Tr7FL+ShZvi/H3jB/dmxpyqWHV01EJfwVwn4Cz3L0R+vXP4x6H7xOYIlaSLb
         n29w==
X-Gm-Message-State: AOJu0Yzt42SBHe/MmIlpkcqdKjPHE4C7GjEfbaE4lXvWGV+HnDMcG7gr
	/xENjWY1IwWDbfkLxxGNE2VmFsV/LnkkeiWiVj+vj0uiOzk+woRsPbqutvwiz0tPUy0=
X-Gm-Gg: ASbGncvXxk/qz7h/4bRa/CgkwVvxSX+supUJF1Htbe/Let0pdSspujNRTIH7Mu/+fFH
	P5UOce8zFijPcnDsJVAQOBEc0Li3rBtCK1MyI/j3LaEUWJZXZZI/LLnAdT1ofM6/hPrZPWLqvbG
	6zTGUnyQejNo/9vMZwCTwKoazDR3uxQXGNiVL6WKGKGTFj8rLmrKWFAgmWUOIM7I5PhPMvrKMDb
	aBeY5bTWWOs2BurZNYylC16pgRhJ7huVj6REFSg2in/bh+ErbGXrv7aQWlZgS13EQ4fUkhf3peu
	cysa8o2Msluh4hSGZFlEY7Fqc2r5abB/LZE0N6fLE/xrQPBSWRWbaU2v4uzk7GxRBOK1rrqemAe
	YhLlcahPXvZJROhrr1Hk5yXmXRLMMVTVfIAE=
X-Google-Smtp-Source: AGHT+IHOuMOYkbX/SGvuPG6MvYOClUqiW/SLGQhRVNIwMcJSevBOU0Ahgr9uTuGGEm0BGvmAlEs4UQ==
X-Received: by 2002:a05:6000:4023:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a531ab6dd4mr2272631f8f.42.1749216189069;
        Fri, 06 Jun 2025 06:23:09 -0700 (PDT)
Date: Fri, 6 Jun 2025 15:23:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: Re: [PATCH v3] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
Message-ID: <aELru4IZmqHilNiN@macbook.local>
References: <20250605161659.18201-1-roger.pau@citrix.com>
 <1b290503-078e-491a-8552-b884df7ac747@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b290503-078e-491a-8552-b884df7ac747@vates.tech>

On Fri, Jun 06, 2025 at 01:00:19PM +0000, Tu Dinh wrote:
> Hi Roger,
> 
> On 05/06/2025 18:20, Roger Pau Monne wrote:
> > The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
> > have the functionality of a traditional PCI device.  The exposed MMIO BAR
> > is used by some guests (including Linux) as a safe place to map foreign
> > memory, including the grant table itself.
> >
> > Traditionally BARs from devices have the uncacheable (UC) cache attribute
> > from the MTRR, to ensure correct functionality of such devices.  hvmloader
> > mimics this behavior and sets the MTRR attributes of both the low and high
> > PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.
> >
> > This however causes performance issues for users of the Xen PCI device BAR,
> > as for the purposes of mapping remote memory there's no need to use the UC
> > attribute.  On Intel systems this is worked around by using iPAT, that
> > allows the hypervisor to force the effective cache attribute of a p2m entry
> > regardless of the guest PAT value.  AMD however doesn't have an equivalent
> > of iPAT, and guest PAT values are always considered.
> >
> > Linux commit:
> >
> > 41925b105e34 xen: replace xen_remap() with memremap()
> >
> > Attempted to mitigate this by forcing mappings of the grant-table to use
> > the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
> > into account to calculate which PAT type to use, and seeing the MTRR cache
> > attribute for the region being UC the PAT also ends up as UC, regardless of
> > the caller having requested WB.
> >
> > As a workaround to allow current Linux to map the grant-table as WB using
> > memremap() introduce an xl.cfg option (xenpci_bar_uc=0) that can be used to
> > select whether the Xen PCI device BAR will have the UC attribute in MTRR.
> > Such workaround in hvmloader should also be paired with a fix for Linux so
> > it attempts to change the MTRR of the Xen PCI device BAR to WB by itself.
> >
> > Overall, the long term solution would be to provide the guest with a safe
> > range in the guest physical address space where mappings to foreign pages
> > can be created.
> >
> > Some vif throughput performance figures provided by Anthoine from a 8
> > vCPUs, 4GB of RAM HVM guest(s) running on AMD hardware:
> >
> > Without this patch:
> > vm -> dom0: 1.1Gb/s
> > vm -> vm:   5.0Gb/s
> >
> > With the patch:
> > vm -> dom0: 4.5Gb/s
> > vm -> vm:   7.0Gb/s
> >
> > Reported-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v2:
> >   - Add default value in xl.cfg.
> >   - List xenstore path in the pandoc file.
> >   - Adjust comment in hvmloader.
> >   - Fix commit message MIO -> MMIO.
> >
> > Changes since v1:
> >   - Leave the xenpci BAR as UC by default.
> >   - Introduce an option to not set it as UC.
> > ---
> >   docs/man/xl.cfg.5.pod.in                |  8 ++++
> >   docs/misc/xenstore-paths.pandoc         |  5 +++
> >   tools/firmware/hvmloader/config.h       |  2 +-
> >   tools/firmware/hvmloader/pci.c          | 49 ++++++++++++++++++++++++-
> >   tools/firmware/hvmloader/util.c         |  2 +-
> >   tools/include/libxl.h                   |  9 +++++
> >   tools/libs/light/libxl_create.c         |  1 +
> >   tools/libs/light/libxl_dom.c            |  9 +++++
> >   tools/libs/light/libxl_types.idl        |  1 +
> >   tools/xl/xl_parse.c                     |  2 +
> >   xen/include/public/hvm/hvm_xs_strings.h |  2 +
> >   11 files changed, 86 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index c388899306c2..ddbff6fffc16 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -2351,6 +2351,14 @@ Windows L<https://xenproject.org/windows-pv-drivers/>.
> >   Setting B<xen_platform_pci=0> with the default device_model "qemu-xen"
> >   requires at least QEMU 1.6.
> >
> > +
> > +=item B<xenpci_bar_uc=BOOLEAN>
> > +
> > +B<x86 only:> Select whether the memory BAR of the Xen PCI device should have
> > +uncacheable (UC) cache attribute set in MTRR.
> > +
> > +Default is B<true>.
> > +
> >   =item B<viridian=[ "GROUP", "GROUP", ...]> or B<viridian=BOOLEAN>
> >
> >   The groups of Microsoft Hyper-V (AKA viridian) compatible enlightenments
> > diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
> > index 01a340fafcbe..073bed91eec1 100644
> > --- a/docs/misc/xenstore-paths.pandoc
> > +++ b/docs/misc/xenstore-paths.pandoc
> > @@ -234,6 +234,11 @@ These xenstore values are used to override some of the default string
> >   values in the SMBIOS table constructed in hvmloader. See the SMBIOS
> >   table specification at http://www.dmtf.org/standards/smbios/
> >
> > +#### ~/hvmloader/pci/xenpci-bar-uc = ("1"|"0") [HVM,INTERNAL]
> > +
> > +Select whether the Xen PCI device MMIO BAR will have the uncacheable cache
> > +attribute set in the MTRRs by hvmloader.
> > +
> >   #### ~/bios-strings/oem-* = STRING [HVM,INTERNAL]
> >
> >   1 to 99 OEM strings can be set in xenstore using values of the form
> > diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
> > index 6e1da137d779..c159db30eea9 100644
> > --- a/tools/firmware/hvmloader/config.h
> > +++ b/tools/firmware/hvmloader/config.h
> > @@ -58,7 +58,7 @@ extern uint32_t *cpu_to_apicid;
> >   #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
> >
> >   extern uint32_t pci_mem_start;
> > -extern const uint32_t pci_mem_end;
> > +extern uint32_t pci_mem_end;
> >   extern uint64_t pci_hi_mem_start, pci_hi_mem_end;
> >
> >   extern bool acpi_enabled;
> > diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> > index cc67b18c0361..747f6cfb6794 100644
> > --- a/tools/firmware/hvmloader/pci.c
> > +++ b/tools/firmware/hvmloader/pci.c
> > @@ -30,7 +30,7 @@
> >   #include <xen/hvm/e820.h>
> >
> >   uint32_t pci_mem_start = HVM_BELOW_4G_MMIO_START;
> > -const uint32_t pci_mem_end = RESERVED_MEMBASE;
> > +uint32_t pci_mem_end = RESERVED_MEMBASE;
> >   uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
> >
> >   /*
> > @@ -116,6 +116,8 @@ void pci_setup(void)
> >        * experience the memory relocation bug described below.
> >        */
> >       bool allow_memory_relocate = 1;
> > +    /* Select the MTRR cache attribute of the xenpci device BAR. */
> > +    bool xenpci_bar_uc = false;
> 
> Since this is meant to be a workaround, I wonder if it makes more sense
> to flip the setting (`xenpci_bar_wb`) and make it 0 by default?

I originally didn't want to go that route, because while it's true
that the default MTRR type is set to WB, and so any memory not covered
by a MTRR range will default to that memory type I got the impression
this was inferring too much.

Overall my intention would be for inverting the default long term, and
libxl setting build_info->u.hvm.xenpci_bar_uc = false by default,
which then makes all the naming nicer IMO.

> It also
> simplifies the logic for both hvmloader and the consumer (no need for
> double negatives).

I don't think there are double negatives?  That would happen if the
variable was named xenpci_bar_no_uc or similar?

Thanks, Roger.

