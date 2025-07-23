Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5625B0ED07
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 10:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053517.1422297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUhh-000732-Hf; Wed, 23 Jul 2025 08:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053517.1422297; Wed, 23 Jul 2025 08:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUhh-0006zx-En; Wed, 23 Jul 2025 08:19:57 +0000
Received: by outflank-mailman (input) for mailman id 1053517;
 Wed, 23 Jul 2025 08:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hT0Q=2E=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ueUhg-0006zr-QO
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 08:19:56 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce2e3990-679d-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 10:19:51 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so48321285e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 01:19:51 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45869199423sm15278305e9.12.2025.07.23.01.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 01:19:50 -0700 (PDT)
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
X-Inumbo-ID: ce2e3990-679d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753258791; x=1753863591; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FIlcAzh6F4X/2ya9DZTIHROErEO0nw/dhmKdmJ4gSQU=;
        b=Tnvt6IEJglHCdJxk+jTd34HydBkzS+/HmeTfK1IqN6XaDVYudF+q8TEn4cRdOXBAIS
         YMEnS+HltA68Gor031eymemdw1jEpejN/8jDl25+yhlE4aAM9cf6h6qmN4VLEkx1jtTE
         LGWhuhf8hbHZE5eE2D9Nii7/tX76EnbXMPh8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753258791; x=1753863591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIlcAzh6F4X/2ya9DZTIHROErEO0nw/dhmKdmJ4gSQU=;
        b=BF2NXgFtqKwXpLdEjJIae1SL3WN8yuR9+E71F1BgRWTWheCzKD4hHG8E4KVfaQxF5y
         TsYfwU3ViY529hsO63h2/Kj5rwR1Ix5KMfysFdNOfjdATL+n3ltxBKk6Hh+veT16kKPq
         Ftt4meyTK4vHIhUZbjNlA69zgQHg/35z/nwgBSLwiyRaCpi2R6+urxYtq3vIgUgqHdj/
         cTMBYGhqzaJs6BeAMn+lfoAGrGWJcrBPyTyJcfxPK8kbJn32zD5JThBZ53N62wdn9oLc
         WGHJSP4FVKHssFafk7FJkHb8PfvVBe9WpYgNNEbcxFbdMd3VTLjZnVD69F3zYpJHaa9a
         5qcg==
X-Gm-Message-State: AOJu0YwnjnhcMeQdnI+HN8lWd8UHwxknwRZnc979fEAAKP7tHQrCigsS
	9xoYq+YR0ADblow4yKIRVE5eohn19lTlMAvw/UCZRdhzFXqeFuejlcq4pcc1G7UkE0g=
X-Gm-Gg: ASbGncv/j9jr7k5x/APC8EYxuCeJvicUfl0xZCzNxp8B3gPn01XDdIIclkxODCEFpJH
	YJF/F6nKBqrQC9p5HYm4auXf5KAt0I5jG/1M0xpEsYLdcB1DqU4UGZK9rJ6TtZvGKd828FwzLQB
	A8s4s+syQCP0uhm8eVQ+gmF92PTkvBZhhfCwAioN7oNhpvvGZsFWqbQzUwcp9H0MXibvS7sUzOU
	a5J0fM3O30Io1x512zAZNtE7E62INP1++8wJHTHiWh+wfZV3J6mIIGzNBIk4eqd8cvZGF/aBtp4
	mXlYZGUDhzWZsIeB3SzLOCKBgsNjIwefWrmWY8T4oytXg6pgs/XHcYijEOt26y7fT+QnTKeiKXu
	bZffztOdjh2VfYOh9HR1qjJqCBCaO7Mi7TdYfNBGW7QYJTlGWd216zT+7G+DL67omLw==
X-Google-Smtp-Source: AGHT+IHQu237kD6+yr1jDFy84yn0+S5KSsAIA1avLAHsXtP4BnwawwXkI+MGdqusQizRrbwGdXn0Ww==
X-Received: by 2002:a05:600c:3483:b0:456:1e5a:8879 with SMTP id 5b1f17b1804b1-45868c9454fmr16624655e9.9.1753258790834;
        Wed, 23 Jul 2025 01:19:50 -0700 (PDT)
Date: Wed, 23 Jul 2025 10:19:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 2/8] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aICbJXzv9yeFX1sb@macbook.local>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-3-Jiqian.Chen@amd.com>
 <aH5Qk0xRHh5NhErA@macbook.local>
 <BL1PR12MB58498137FD456F49C5CFF446E75FA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58498137FD456F49C5CFF446E75FA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Jul 23, 2025 at 07:20:27AM +0000, Chen, Jiqian wrote:
> On 2025/7/21 22:37, Roger Pau Monné wrote:
> > On Fri, Jul 04, 2025 at 03:07:57PM +0800, Jiqian Chen wrote:
> >> Refactor REGISTER_VPCI_INIT to contain more capability specific
> >> information, this will benefit further follow-on changes to hide
> >> capability when initialization fails.
> >>
> >> What's more, change the definition of init_header() since it is
> >> not a capability and it is needed for all devices' PCI config space.
> >>
> >> After refactor, the "priority" of initializing capabilities isn't
> >> needed anymore, so delete its related codes.
> >>
> >> Note:
> >> Call vpci_make_msix_hole() in the end of init_msix() since the change
> >> of sequence of init_header() and init_msix(). And delete the call of
> >> vpci_make_msix_hole() in modify_decoding() since it is not needed.
> >>
> >> The cleanup hook is also added in this change, even if it's still
> >> unused. Further changes will make use of it.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >> There is a byte alignment problem in the array __start_vpci_array, which can be solved after
> >> "[PATCH] x86: don't have gcc over-align data" is merged.
> >> ---
> >> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >> cc: Andrew Cooper <andrew.cooper3@citrix.com>
> >> cc: Anthony PERARD <anthony.perard@vates.tech>
> >> cc: Michal Orzel <michal.orzel@amd.com>
> >> cc: Jan Beulich <jbeulich@suse.com>
> >> cc: Julien Grall <julien@xen.org>
> >> cc: Stefano Stabellini <sstabellini@kernel.org>
> >> ---
> >> v6->v7 changes:
> >> * Change the pointer parameter of cleanup hook of vpci_capability_t to be const.
> >>   If change parameter of init hook to be const will affect init_msix, and it assigns pdev
> >>   to struct vpci_msix, so keep no const to expanding the impact.
> >> * Delete the vpci_make_msix_hole() call in modify_decoding().
> >> * Change __start_vpci_array from vpci_capability_t* array to vpci_capability_t array.
> >> * Change the name "finit##_t" to be "name##_entry" and add a "name" parameter to macro
> >>   REGISTER_VPCI_CAPABILITY.
> >>
> >> v5->v6 changes:
> >> * Rename REGISTER_PCI_CAPABILITY to REGISTER_VPCI_CAPABILITY.
> >> * Move vpci_capability_t entry from ".data.vpci" to ".data.rel.ro.vpci" and
> >>   move the instances of VPCI_ARRAY in the linker scripts before *(.data.rel.ro).
> >> * Change _start/end_vpci_array[] to be const pointer array.
> >>
> >> v4->v5 changes:
> >> * Rename REGISTER_VPCI_CAP to REGISTER_PCI_CAPABILITY, rename REGISTER_VPCI_LEGACY_CAP to
> >>   REGISTER_VPCI_CAP, rename REGISTER_VPCI_EXTENDED_CAP to REGISTER_VPCI_EXTCAP.
> >> * Change cleanup hook of vpci_capability_t from void to int.
> >>
> >> v3->v4 changes
> >> * Delete the useless trailing dot of section ".data.vpci".
> >> * Add description about priority since this patch removes the initializing priority of
> >>   capabilities and priority is not needed anymore.
> >> * Change the hook name from fini to cleanup.
> >> * Change the name x and y to be finit and fclean.
> >> * Remove the unnecessary check "!capability->init"
> >>
> >> v2->v3 changes:
> >> * This is separated from patch "vpci: Hide capability when it fails to initialize" of v2.
> >> * Delete __maybe_unused attribute of "out" in function vpci_assign_devic().
> >> * Rename REGISTER_VPCI_EXTEND_CAP to REGISTER_VPCI_EXTENDED_CAP.
> >>
> >> v1->v2 changes:
> >> * Removed the "priorities" of initializing capabilities since it isn't used anymore.
> >> * Added new function vpci_capability_mask() and vpci_ext_capability_mask() to remove
> >>   failed capability from list.
> >> * Called vpci_make_msix_hole() in the end of init_msix().
> >>
> >> Best regards,
> >> Jiqian Chen.
> >> ---
> >>  xen/arch/arm/xen.lds.S    |  3 +--
> >>  xen/arch/ppc/xen.lds.S    |  3 +--
> >>  xen/arch/riscv/xen.lds.S  |  3 +--
> >>  xen/arch/x86/xen.lds.S    |  2 +-
> >>  xen/drivers/vpci/header.c | 16 +-------------
> >>  xen/drivers/vpci/msi.c    |  2 +-
> >>  xen/drivers/vpci/msix.c   | 11 +++++++---
> >>  xen/drivers/vpci/rebar.c  |  2 +-
> >>  xen/drivers/vpci/vpci.c   | 44 ++++++++++++++++++++++++++++++---------
> >>  xen/include/xen/vpci.h    | 32 ++++++++++++++++++----------
> >>  xen/include/xen/xen.lds.h |  2 +-
> >>  11 files changed, 71 insertions(+), 49 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> >> index 5bfbe1e92c1e..9f30c3a13ed1 100644
> >> --- a/xen/arch/arm/xen.lds.S
> >> +++ b/xen/arch/arm/xen.lds.S
> >> @@ -57,6 +57,7 @@ SECTIONS
> >>  
> >>         *(.rodata)
> >>         *(.rodata.*)
> >> +       VPCI_ARRAY
> >>         *(.data.rel.ro)
> >>         *(.data.rel.ro.*)
> >>  
> >> @@ -64,8 +65,6 @@ SECTIONS
> >>         __proc_info_start = .;
> >>         *(.proc.info)
> >>         __proc_info_end = .;
> >> -
> >> -       VPCI_ARRAY
> >>    } :text
> >>  
> >>  #if defined(BUILD_ID)
> >> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> >> index 1366e2819eed..1de0b77fc6b9 100644
> >> --- a/xen/arch/ppc/xen.lds.S
> >> +++ b/xen/arch/ppc/xen.lds.S
> >> @@ -51,11 +51,10 @@ SECTIONS
> >>  
> >>          *(.rodata)
> >>          *(.rodata.*)
> >> +        VPCI_ARRAY
> >>          *(.data.rel.ro)
> >>          *(.data.rel.ro.*)
> >>  
> >> -        VPCI_ARRAY
> >> -
> >>          . = ALIGN(POINTER_ALIGN);
> >>      } :text
> >>  
> >> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> >> index 8c3c06de01f6..edcadff90bfe 100644
> >> --- a/xen/arch/riscv/xen.lds.S
> >> +++ b/xen/arch/riscv/xen.lds.S
> >> @@ -46,11 +46,10 @@ SECTIONS
> >>  
> >>          *(.rodata)
> >>          *(.rodata.*)
> >> +        VPCI_ARRAY
> >>          *(.data.rel.ro)
> >>          *(.data.rel.ro.*)
> >>  
> >> -        VPCI_ARRAY
> >> -
> >>          . = ALIGN(POINTER_ALIGN);
> >>      } :text
> >>  
> >> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> >> index 636c7768aa3c..8e9cac75b09e 100644
> >> --- a/xen/arch/x86/xen.lds.S
> >> +++ b/xen/arch/x86/xen.lds.S
> >> @@ -135,6 +135,7 @@ SECTIONS
> >>  
> >>         *(.rodata)
> >>         *(.rodata.*)
> >> +       VPCI_ARRAY
> >>         *(.data.rel.ro)
> >>         *(.data.rel.ro.*)
> >>  
> >> @@ -148,7 +149,6 @@ SECTIONS
> >>         *(.note.gnu.build-id)
> >>         __note_gnu_build_id_end = .;
> >>  #endif
> >> -       VPCI_ARRAY
> >>    } PHDR(text)
> >>  
> >>  #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index 8ee8052cd4a3..069253b5f721 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -122,19 +122,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
> >>      bool map = cmd & PCI_COMMAND_MEMORY;
> >>      unsigned int i;
> >>  
> >> -    /*
> >> -     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
> >> -     * can be trapped (and emulated) by Xen when the memory decoding bit is
> >> -     * enabled.
> >> -     *
> >> -     * FIXME: punching holes after the p2m has been set up might be racy for
> >> -     * DomU usage, needs to be revisited.
> >> -     */
> >> -#ifdef CONFIG_HAS_PCI_MSI
> >> -    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
> >> -        return;
> >> -#endif
> > 
> > I think you need to keep this.  What about BARs being repositioned by
> > dom0 over reserved region(s), and thus needing the MSI-X hole to be
> > craved out there?  It's not a common use-case, but we should support
> > dom0 moving BARs around.
> > 
> > I think you need both the added chunk in init_msix(), plus the code
> > above to not regress the current functionality.
> OK, will do.
> As Jan required me to add some comment to describe the chunk in init_msix() if not to delete here.
> Do you think below is appropriate?
> 
>     /*
>      * To make sure there's a hole for the MSIX table/PBA in the p2m since
>      * init_msix is called after init_header. Here and the calling in another
>      * place are not redundant, another is to support dom0 moving BARs.
>      */
>     spin_lock(&pdev->vpci->lock);
>     rc = vpci_make_msix_hole(pdev);
>     spin_unlock(&pdev->vpci->lock);

I would use:

/*
 * vPCI header initialization will have mapped the whole BAR into the
 * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
 * the MSI-X table here, so that Xen can trap accesses.
 */

I think referencing "another is to support dom0..." is not helpful,
and likely to get out of sync if we ever change that code.  If
anything, the comment in modify_decoding() needs updating, but not via
a cross reference from a different context.

Thanks, Roger.

