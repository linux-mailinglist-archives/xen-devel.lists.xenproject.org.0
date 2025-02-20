Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E8A3D3CC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 09:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893639.1302510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2LP-0001DU-PX; Thu, 20 Feb 2025 08:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893639.1302510; Thu, 20 Feb 2025 08:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2LP-0001An-MP; Thu, 20 Feb 2025 08:55:43 +0000
Received: by outflank-mailman (input) for mailman id 893639;
 Thu, 20 Feb 2025 08:55:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ie4y=VL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tl2LN-0001Ah-R6
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 08:55:41 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7562be7b-ef68-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 09:55:40 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22100006bc8so10466805ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 00:55:40 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366b24sm117583105ad.97.2025.02.20.00.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 00:55:38 -0800 (PST)
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
X-Inumbo-ID: 7562be7b-ef68-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740041739; x=1740646539; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=10UTns09H+Wxk76/zpWORWp6Aun15R6cdHaWOmXXjjw=;
        b=b1UPReBZtXxQ3IXWudqNIRkfhrp2djE2q8/rO07obx6ayLwyX+Gl528EG44sjpklfv
         JGr1UdDQQqQ0W9T20glxMvAXbV2rBkEuNza/PkrhnFOZsEKXjc54+qa51KtPt0hPaQ0b
         kpl9E50tqDcGKhPSOF32kOElX0VVqcsgCJNQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740041739; x=1740646539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10UTns09H+Wxk76/zpWORWp6Aun15R6cdHaWOmXXjjw=;
        b=PUAxh5RL6FE1OxFK0lhx+qoiwp8pBd4s1V85c0x2ByGkDe5vdURQJ19da/orfWoD6t
         qtQuew7PGeTBIyi3hqlWALENqa5eo8aLrLRpNk2QxqQfYU+AshLMhu4ZvOA3IDgWoNoC
         C5g/PVVCP2+jzBci2+iVDLyQR9ftIK87HiPKPtmfVW3DAr/pZjSSn+rqERpUkAZ9nokL
         mX8OezR3QZKlv57RHFQnhbySMbDCdl+s2PZlEWcTz3oQarmMxJN+fB/OEft4SHJ+rMsd
         8pI8t9bsVBlXO3tg4pNPEisWkNsQ+yTLxulfDkqKnxMuy4B2+YAfeWA30xvANeIHHP/k
         74vg==
X-Forwarded-Encrypted: i=1; AJvYcCX0CsxYVxxuBnT0T13Q74O5w4YR3wxEQ7Iu4sqNQFrQVeu6HyITtUvg1bAmNSjRx4BSsHo/5YK7emo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXO+5VbNhnHfeqO1BJJzZpL4oG7UVYu42S1WlvSBZVEkpj0xuG
	lmcELCRJ1uKwaNLCgSWOytYcrXuzoKyMHXuI/Sz5eGxC5n6bytpNM7g/oAFOYpxY9qc7rtH0OZ9
	k
X-Gm-Gg: ASbGncuIOffpuYGah3g6QRw1RaS+Niy61DlfT4rXESkkjGUQhruWuL9qLI+TZ/tzHlr
	X1jkHD7XA+5O5wxRESx5KIEr8fT1yC2PG6//XwlFxheXgcSJLbzZE3M7uyM1lDlzhhhfk7UKBGN
	JkCPKiNN2IxDAtj0k3sd/hYyo800q6Jdy+tX3RjEo/Q1OOrwOcfc9iAwwIkg+cNOvyhPrcpKR25
	tPLgFC0qfDieRbwWfTGJQOgyvt2qV1G1C2ld5nMeffITk2XbL2PBWa5gf8TN0nZ7udqjQAEO+0x
	SV5AWAX32N9uOdkUPl358cvxnQ==
X-Google-Smtp-Source: AGHT+IFRbTF0L9GgB7Rghs5WhdiGs6BU+j5MHLkawhf8cLVWHuVJQM2xhUriwbc2QP6cm5biGiLOcQ==
X-Received: by 2002:a17:902:ecc7:b0:216:1543:195d with SMTP id d9443c01a7336-22104068654mr302307415ad.25.1740041738933;
        Thu, 20 Feb 2025 00:55:38 -0800 (PST)
Date: Thu, 20 Feb 2025 09:55:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] x86/dom0: be less restrictive with the Interrupt
 Address Range
Message-ID: <Z7buBc4yLtf-UpmB@macbook.local>
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <20250219164840.94803-4-roger.pau@citrix.com>
 <1e8ef6d3-09db-4d53-b7c8-4b10a7f5d8f0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1e8ef6d3-09db-4d53-b7c8-4b10a7f5d8f0@suse.com>

On Thu, Feb 20, 2025 at 09:33:46AM +0100, Jan Beulich wrote:
> On 19.02.2025 17:48, Roger Pau Monne wrote:
> > Xen currently prevents dom0 from creating CPU or IOMMU page-table mappings
> > into the interrupt address range [0xfee00000, 0xfeefffff].  This range has
> > two different purposes.  For accesses from the CPU is contains the default
> > position of local APIC page at 0xfee00000.  For accesses from devices
> > it's the MSI address range, so the address field in the MSI entries
> > (usually) point to an address on that range to trigger an interrupt.
> > 
> > There are reports of Lenovo Thinkpad devices placing what seems to be the
> > UCSI shared mailbox at address 0xfeec2000 in the interrupt address range.
> > Attempting to use that device with a Linux PV dom0 leads to an error when
> > Linux kernel maps 0xfeec2000:
> > 
> > RIP: e030:xen_mc_flush+0x1e8/0x2b0
> >  xen_leave_lazy_mmu+0x15/0x60
> >  vmap_range_noflush+0x408/0x6f0
> >  __ioremap_caller+0x20d/0x350
> >  acpi_os_map_iomem+0x1a3/0x1c0
> >  acpi_ex_system_memory_space_handler+0x229/0x3f0
> >  acpi_ev_address_space_dispatch+0x17e/0x4c0
> >  acpi_ex_access_region+0x28a/0x510
> >  acpi_ex_field_datum_io+0x95/0x5c0
> >  acpi_ex_extract_from_field+0x36b/0x4e0
> >  acpi_ex_read_data_from_field+0xcb/0x430
> >  acpi_ex_resolve_node_to_value+0x2e0/0x530
> >  acpi_ex_resolve_to_value+0x1e7/0x550
> >  acpi_ds_evaluate_name_path+0x107/0x170
> >  acpi_ds_exec_end_op+0x392/0x860
> >  acpi_ps_parse_loop+0x268/0xa30
> >  acpi_ps_parse_aml+0x221/0x5e0
> >  acpi_ps_execute_method+0x171/0x3e0
> >  acpi_ns_evaluate+0x174/0x5d0
> >  acpi_evaluate_object+0x167/0x440
> >  acpi_evaluate_dsm+0xb6/0x130
> >  ucsi_acpi_dsm+0x53/0x80
> >  ucsi_acpi_read+0x2e/0x60
> >  ucsi_register+0x24/0xa0
> >  ucsi_acpi_probe+0x162/0x1e3
> >  platform_probe+0x48/0x90
> >  really_probe+0xde/0x340
> >  __driver_probe_device+0x78/0x110
> >  driver_probe_device+0x1f/0x90
> >  __driver_attach+0xd2/0x1c0
> >  bus_for_each_dev+0x77/0xc0
> >  bus_add_driver+0x112/0x1f0
> >  driver_register+0x72/0xd0
> >  do_one_initcall+0x48/0x300
> >  do_init_module+0x60/0x220
> >  __do_sys_init_module+0x17f/0x1b0
> >  do_syscall_64+0x82/0x170
> > 
> > Remove the restrictions to create mappings the interrupt address range for
> 
> Nit: Missing "in"?

Indeed, thanks for spotting.

> > dom0.  Note that the restriction to map the local APIC page is enforced
> > separately, and that continues to be present.  Additionally make sure the
> > emulated local APIC page is also not mapped, in case dom0 is using it.
> 
> But that's in GFN space, not in MFN one. Why would that matter for iomem_caps?

It's required to avoid arch_iommu_hwdom_init() creating an identity
mapping for APIC_DEFAULT_PHYS_BASE, which would prevent the local APIC
emulation from being used.

Note that mp_lapic_addr can be zeor if the host local APICs are
started in x2APIC mode, or it could (in theory) contain an address
different than APIC_DEFAULT_PHYS_BASE.

Thanks, Roger.

