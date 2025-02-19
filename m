Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C0A3C567
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 17:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893244.1302171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknFi-0000VE-SH; Wed, 19 Feb 2025 16:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893244.1302171; Wed, 19 Feb 2025 16:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknFi-0000Sv-PT; Wed, 19 Feb 2025 16:48:50 +0000
Received: by outflank-mailman (input) for mailman id 893244;
 Wed, 19 Feb 2025 16:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQLC=VK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tknFh-0000DW-Vi
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 16:48:49 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 646123cd-eee1-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 17:48:49 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so3464766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 08:48:49 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532322aesm1323094666b.17.2025.02.19.08.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 08:48:47 -0800 (PST)
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
X-Inumbo-ID: 646123cd-eee1-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739983728; x=1740588528; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0Lo7NvC0VRrNHzOZExT/+zaLj5LgD90jhn2nZ96ddg=;
        b=gE5hZFgYGn8+h3gwzjqCiulpTjBoizu4wyQUZoGAC8wQLSALmJR1nJcPMwcE83ZQSH
         6ESHgDoTj/QDgDRXuQ/9+oPXdNhTtWwVLHgA7XtL1Fi1hu4w4ZajFdSoDz4ANb5p/nAx
         INVvF7WArxSz2eEsruct5wEefLiKAaKbesTFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739983728; x=1740588528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0Lo7NvC0VRrNHzOZExT/+zaLj5LgD90jhn2nZ96ddg=;
        b=N+fX2j3viej6HiJfHJyOrda8W2ZfuUzE4AdP+C+y3QmV8Cc0BVaVz8jNUnOyHJqe0S
         uQPu52qTzcHlqTGaD4fSN7lvejabqG+t7X+WsgwNd0Xjcuzs7/3IE1c1q3IsipSb4cX8
         vXt7PmRuKGIB+Kud8KUypN3be/DjETKgSdk2JG4u0E1FtHe0NaSSIMHtT0PG0MfhIMtK
         Cgp4zmgbXehcyfbh7XLQTctbMan9ErrIWwcXucwuzwS174qsaRhy/MNWgJjRv+lXCcBS
         W/1gElkG81V+GEswQHVDnoi9zwlbkS3z0wG0CfwCKZaKcaCyOCb0eSJds5uo4A49jb0p
         jHXQ==
X-Gm-Message-State: AOJu0Yz6mRcx6gxQEppgu8TJmCwHVS+g6j/lCiBLJ4uegfai60N4E+zN
	5LNJTJHc4Z5mFaAstpuxHk+9DzI09Qcyd6ehCL6yDWNS3Tuc4IMl0V5YxCan9kks7y5t75qx9VZ
	6
X-Gm-Gg: ASbGncslsexdSKU4Ukz3lcI8BeV126lGKRAc6nEO7Xzi0u8rZGBupK2Cpj2tFFNZZdr
	MYNh5jzO6MEbe/U9w3bjboIJe7J/dN1WZrv+sHRUfqYyUWpfp/KlqmceIFvFxt40kIabe98I5TV
	AVgIOOnWW9rt7l+Q/plvvpfhs2JZYIjDiRGTFtznkoCtVDKbct+QqQFXI8TqY79+BXjkSA0SvYv
	v79+V8ROV86/IGv2zhdh5GtW14NODUbIaio/MUvCpMeQjPYYrqofuBp9OBPTjtr6YiFN4Dp4+Pn
	sI5cERxipW0/bF9PBGaRVF0PtA==
X-Google-Smtp-Source: AGHT+IFCoMTmLpt40lLnU2dkJWR4NY0jL2YkPmeDYlmpNOicP6g0IpUBTmfb3noiCaj72nEBIRQkcg==
X-Received: by 2002:a17:906:308b:b0:ab6:cdc2:bf57 with SMTP id a640c23a62f3a-abbccccb763mr405103066b.1.1739983728251;
        Wed, 19 Feb 2025 08:48:48 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Subject: [PATCH v3 3/3] x86/dom0: be less restrictive with the Interrupt Address Range
Date: Wed, 19 Feb 2025 17:48:40 +0100
Message-ID: <20250219164840.94803-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250219164840.94803-1-roger.pau@citrix.com>
References: <20250219164840.94803-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen currently prevents dom0 from creating CPU or IOMMU page-table mappings
into the interrupt address range [0xfee00000, 0xfeefffff].  This range has
two different purposes.  For accesses from the CPU is contains the default
position of local APIC page at 0xfee00000.  For accesses from devices
it's the MSI address range, so the address field in the MSI entries
(usually) point to an address on that range to trigger an interrupt.

There are reports of Lenovo Thinkpad devices placing what seems to be the
UCSI shared mailbox at address 0xfeec2000 in the interrupt address range.
Attempting to use that device with a Linux PV dom0 leads to an error when
Linux kernel maps 0xfeec2000:

RIP: e030:xen_mc_flush+0x1e8/0x2b0
 xen_leave_lazy_mmu+0x15/0x60
 vmap_range_noflush+0x408/0x6f0
 __ioremap_caller+0x20d/0x350
 acpi_os_map_iomem+0x1a3/0x1c0
 acpi_ex_system_memory_space_handler+0x229/0x3f0
 acpi_ev_address_space_dispatch+0x17e/0x4c0
 acpi_ex_access_region+0x28a/0x510
 acpi_ex_field_datum_io+0x95/0x5c0
 acpi_ex_extract_from_field+0x36b/0x4e0
 acpi_ex_read_data_from_field+0xcb/0x430
 acpi_ex_resolve_node_to_value+0x2e0/0x530
 acpi_ex_resolve_to_value+0x1e7/0x550
 acpi_ds_evaluate_name_path+0x107/0x170
 acpi_ds_exec_end_op+0x392/0x860
 acpi_ps_parse_loop+0x268/0xa30
 acpi_ps_parse_aml+0x221/0x5e0
 acpi_ps_execute_method+0x171/0x3e0
 acpi_ns_evaluate+0x174/0x5d0
 acpi_evaluate_object+0x167/0x440
 acpi_evaluate_dsm+0xb6/0x130
 ucsi_acpi_dsm+0x53/0x80
 ucsi_acpi_read+0x2e/0x60
 ucsi_register+0x24/0xa0
 ucsi_acpi_probe+0x162/0x1e3
 platform_probe+0x48/0x90
 really_probe+0xde/0x340
 __driver_probe_device+0x78/0x110
 driver_probe_device+0x1f/0x90
 __driver_attach+0xd2/0x1c0
 bus_for_each_dev+0x77/0xc0
 bus_add_driver+0x112/0x1f0
 driver_register+0x72/0xd0
 do_one_initcall+0x48/0x300
 do_init_module+0x60/0x220
 __do_sys_init_module+0x17f/0x1b0
 do_syscall_64+0x82/0x170

Remove the restrictions to create mappings the interrupt address range for
dom0.  Note that the restriction to map the local APIC page is enforced
separately, and that continues to be present.  Additionally make sure the
emulated local APIC page is also not mapped, in case dom0 is using it.

Note that even if the interrupt address range entries are populated in the
IOMMU page-tables no device access will reach those pages.  Device accesses
to the Interrupt Address Range will always be converted into Interrupt
Messages and are not subject to DMA remapping.

There's also the following restriction noted in Intel VT-d:

> Software must not program paging-structure entries to remap any address to
> the interrupt address range. Untranslated requests and translation requests
> that result in an address in the interrupt range will be blocked with
> condition code LGN.4 or SGN.8. Translated requests with an address in the
> interrupt address range are treated as Unsupported Request (UR).

Similarly for AMD-Vi:

> Accesses to the interrupt address range (Table 3) are defined to go through
> the interrupt remapping portion of the IOMMU and not through address
> translation processing. Therefore, when a transaction is being processed as
> an interrupt remapping operation, the transaction attribute of
> pretranslated or untranslated is ignored.
>
> Software Note: The IOMMU should
> not be configured such that an address translation results in a special
> address such as the interrupt address range.

However those restrictions don't apply to the identity mappings possibly
created for dom0, since the interrupt address range is never subject to DMA
remapping, and hence there's no output address after translation that
belongs to the interrupt address range.

Reported-by: Jürgen Groß <jgross@suse.com>
Link: https://lore.kernel.org/xen-devel/baade0a7-e204-4743-bda1-282df74e5f89@suse.com/
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Make sure vlapic page is not mapped.

Changes since v1:
 - No longer needs to modify arch_iommu_hwdom_init().
---
 xen/arch/x86/dom0_build.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index a735e3650c28..3cda0c2c8765 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -554,6 +554,12 @@ int __init dom0_setup_permissions(struct domain *d)
         mfn = paddr_to_pfn(mp_lapic_addr);
         rc |= iomem_deny_access(d, mfn, mfn);
     }
+    /* If using an emulated local APIC make sure its MMIO is unpopulated. */
+    if ( has_vlapic(d) )
+    {
+        mfn = paddr_to_pfn(APIC_DEFAULT_PHYS_BASE);
+        rc |= iomem_deny_access(d, mfn, mfn);
+    }
     /* I/O APICs. */
     for ( i = 0; i < nr_ioapics; i++ )
     {
@@ -563,10 +569,6 @@ int __init dom0_setup_permissions(struct domain *d)
              !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
             rc |= iomem_deny_access(d, mfn, mfn);
     }
-    /* MSI range. */
-    rc |= iomem_deny_access(d, paddr_to_pfn(MSI_ADDR_BASE_LO),
-                            paddr_to_pfn(MSI_ADDR_BASE_LO +
-                                         MSI_ADDR_DEST_ID_MASK));
     /* HyperTransport range. */
     if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
     {
-- 
2.46.0


