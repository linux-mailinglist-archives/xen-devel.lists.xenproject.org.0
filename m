Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036D2A4C2FD
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900316.1308227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6Xg-00040O-HZ; Mon, 03 Mar 2025 14:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900316.1308227; Mon, 03 Mar 2025 14:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6Xg-0003xx-Ef; Mon, 03 Mar 2025 14:13:12 +0000
Received: by outflank-mailman (input) for mailman id 900316;
 Mon, 03 Mar 2025 14:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjBI=VW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tp6Xe-0003xn-Me
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:13:10 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a20232db-f839-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 15:13:09 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22113560c57so84840355ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 06:13:09 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-223501d287dsm78360915ad.43.2025.03.03.06.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 06:13:07 -0800 (PST)
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
X-Inumbo-ID: a20232db-f839-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741011188; x=1741615988; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDkAHYGnmOKCZQ4xdnOvipQSwms2wnvezNPcyYKyUoE=;
        b=Ou0iOWQAKGQ8M/tShKEqSrD6PdiZ+XbLU5LuiSnRXWrFXMFwID/Z5lduYFimW3rz1g
         Ef+2KaLOsfXDX34t8rkMjla5Zu2PdU4DlcuDkFYFV7qAaD0P4GV/RMaBVW5VgeIKcCR4
         uFiw7YIZIO839oue2qmJiczDmBtU/WlJ4XKzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741011188; x=1741615988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDkAHYGnmOKCZQ4xdnOvipQSwms2wnvezNPcyYKyUoE=;
        b=WJzIJYUxSIdLfhomxmPuy/hUmzGS5udvpTdBX7BLmdHyErUZ05KU82gjEs/CNJ/Yt9
         1h1hM/ZCg8E0BBacQGGUbgFF5oWyrJCBfexmxrLOJAttLr4jlgj5RvVYc9WuTizLNEZD
         kcyChAjUokxL/CTHpm/FvsQHAdMjCvsMzFUhcf96t7Q60F61Ue/Pac8CPv15Fl6Ky6Bg
         8QVvdpgmxmCVzhzEv1vg/hmKdSwNznue6U3kagjKc4uBfzMotVqJry2y5Lutqo9/1M1v
         R4MFbWM/cy5yJn9NJkiSKJ+nrP6ptH0y01urOLAwsgdIhPa0b0lp0+7ZkQwKArQbMpuA
         ikhg==
X-Gm-Message-State: AOJu0YwzLPnxAMM5Hw49lkB+EgUgo/6f48by3jxRnkFfmFz1JmNCVo0g
	9/ITDSgU4qyM1eqWJnpES0Fpp8Div2nCtBnynAMHQnmfK7motINGmB03DN6aMlY=
X-Gm-Gg: ASbGncsg5b023uc2IOES3JwFT5boI06OQvPRQ6M/t7V1Rf5w6FvQhvtFm5GZb3ivNQE
	bvWdMSNgKQEygS0ox3X+Q1pkUP72W3R78a3OQtNw0+HQzS7KBqCwL2yKxJMUPEUX76ALMCztRXm
	FiTJkQp7PW+NRRqkds2VVcP6cpwRVbBfAng87s2GkDcFHYea4jOR3GZ0NPVTziwtje/ZkqmqrXG
	4zblHKI6/Sr4HcLHNFAhyjVQzfgK/6pTmCrs15MVUnqrnH4pDfSwYRsLIu8xcKj0KHGBwP39qCw
	PIwG/woV3vT+34kqLoAtQMPCHthefKpBUfM6QjmhA4921nMCTg==
X-Google-Smtp-Source: AGHT+IFMMnte4MXhNVxfXi16q3DJ5ViFF3HaR79IKeWm62JAo6wDsPzFf5PP7N5r0rfakBHCyUOvsg==
X-Received: by 2002:a17:902:d2cc:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22368f88ac0mr213727265ad.12.1741011187984;
        Mon, 03 Mar 2025 06:13:07 -0800 (PST)
Date: Mon, 3 Mar 2025 15:13:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
Message-ID: <Z8W47V836vSWuAzw@macbook.local>
References: <20250303091908.38846-1-roger.pau@citrix.com>
 <915229bd-a930-422e-a915-6414c3224c93@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <915229bd-a930-422e-a915-6414c3224c93@citrix.com>

On Mon, Mar 03, 2025 at 01:41:15PM +0000, Andrew Cooper wrote:
> On 03/03/2025 9:19 am, Roger Pau Monne wrote:
> > The MMIO_CONF_BASE reports the base of the MCFG range on AMD systems.
> > Currently Linux is unconditionally attempting to read the MSR without a
> > safe MSR accessor, and since Xen doesn't allow access to it Linux reports
> > the following error:
> >
> > unchecked MSR access error: RDMSR from 0xc0010058 at rIP: 0xffffffff8101d19f (xen_do_read_msr+0x7f/0xa0)
> > Call Trace:
> >  <TASK>
> >  ? ex_handler_msr+0x11e/0x150
> >  ? fixup_exception+0x81/0x300
> >  ? exc_general_protection+0x138/0x410
> >  ? asm_exc_general_protection+0x22/0x30
> >  ? xen_do_read_msr+0x7f/0xa0
> >  xen_read_msr+0x1e/0x30
> >  amd_get_mmconfig_range+0x2b/0x80
> >  quirk_amd_mmconfig_area+0x28/0x100
> >  ? quirk_system_pci_resources+0x2b/0x150
> >  pnp_fixup_device+0x39/0x50
> >  __pnp_add_device+0xf/0x150
> >  pnp_add_device+0x3d/0x100
> >  ? __pfx_pnpacpi_allocated_resource+0x10/0x10
> >  ? __pfx_pnpacpi_allocated_resource+0x10/0x10
> >  ? acpi_walk_resources+0xbb/0xd0
> >  pnpacpi_add_device_handler+0x1f9/0x280
> >  acpi_ns_get_device_callback+0x104/0x1c0
> >  ? _raw_spin_unlock_irqrestore+0x18/0x20
> >  ? down_timeout+0x3a/0x60
> >  ? _raw_spin_lock_irqsave+0x14/0x40
> >  acpi_ns_walk_namespace+0x1d0/0x260
> >  ? _raw_spin_unlock_irqrestore+0x18/0x20
> >  ? __pfx_acpi_ns_get_device_callback+0x10/0x10
> >  acpi_get_devices+0x8a/0xb0
> >  ? __pfx_pnpacpi_add_device_handler+0x10/0x10
> >  ? __pfx_pnpacpi_init+0x10/0x10
> >  pnpacpi_init+0x50/0x80
> >  do_one_initcall+0x46/0x2e0
> >  kernel_init_freeable+0x1da/0x2f0
> >  ? __pfx_kernel_init+0x10/0x10
> >  kernel_init+0x16/0x1b0
> >  ret_from_fork+0x30/0x50
> >  ? __pfx_kernel_init+0x10/0x10
> >  ret_from_fork_asm+0x1b/0x30
> >  </TASK>
> >
> > Such access is conditional to the presence of a device with PnP ID
> > "PNP0c01", which triggers the execution of the quirk_amd_mmconfig_area()
> > function.  Note that prior to commit 3fac3734c43a MSR accesses when running
> > as a PV guest would always use the safe variant, and thus silently handle
> > the #GP.
> >
> > Fix by allowing access to the MSR on AMD systems, returning 0 for
> > unprivileged domains (MMIO configuration space disabled), and the native
> > value for the hardware domain.
> >
> > The non hardware domain logic will need to be adjusted if in the future we
> > expose an MCFG region to such domains.
> >
> > Write attempts to the MSR will still result in #GP for all domain types.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v2:
> >  - Expand commit message to note which device triggers the MSR read.
> > ---
> >  xen/arch/x86/msr.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> > index 1550fd9ec9f3..c1e616a3a757 100644
> > --- a/xen/arch/x86/msr.c
> > +++ b/xen/arch/x86/msr.c
> > @@ -318,6 +318,21 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >          *val = 0;
> >          break;
> >  
> > +    case MSR_FAM10H_MMIO_CONF_BASE:
> > +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> > +            goto gp_fault;
> > +
> > +        /*
> > +         * Report MMIO configuration space is disabled unconditionally for
> > +         * domUs, as the emulated chipset doesn't support ECAM.  For dom0
> > +         * return the hardware value.
> > +         */
> > +        *val = 0;
> > +        if ( is_hardware_domain(d) && rdmsr_safe(msr, *val) )
> > +            goto gp_fault;
> > +
> > +        break;
> 
> It doesn't matter right now, but reporting MMCFG disable is likely to
> interfere with Q35 support when we do present such a range.

Yup, that's why I mention that this will likely need  to be adjusted.
However Linux only reads MMIO_CONF_BASE if a PnP device with ID
"PNP0c01" is present, not sure whether that's (or will be the case)
with Q35 support.

> For PVH dom0, do we guarantee this range is identity mapped?  Or at
> least, doesn't have plain RAM in?

Yes, for PVH dom0 ECAM range(s) are always identity mapped.

Thanks, Roger.

