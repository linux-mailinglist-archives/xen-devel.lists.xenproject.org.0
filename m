Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2AA35A62
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 10:30:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888665.1298017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tis1I-0005EO-RB; Fri, 14 Feb 2025 09:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888665.1298017; Fri, 14 Feb 2025 09:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tis1I-0005C6-O7; Fri, 14 Feb 2025 09:30:00 +0000
Received: by outflank-mailman (input) for mailman id 888665;
 Fri, 14 Feb 2025 09:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zro/=VF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tis1G-0004wC-Qd
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 09:29:58 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 413460ee-eab6-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 10:29:57 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5de5a853090so4115459a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 01:29:57 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53259546sm307975666b.64.2025.02.14.01.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 01:29:55 -0800 (PST)
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
X-Inumbo-ID: 413460ee-eab6-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739525396; x=1740130196; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFfu24KhrvaQp0fxJDrznaHKB4GavpmxXNs5QOAkgRM=;
        b=bMKnMfp2/MHzqMJYWrOrIjb0ilQedvnmNixJH14LVK8MzgmjfNC+tsQ3zFJOBLNAHs
         k4BEylztFVw1mt+wsteCikruSaTsbtpFwnXxGAlL2jNw4Tor6B1f5wwJkfMzL71yvBSs
         RtI4jKfzZ/q7ZqKI+ENWJPXStKIVCgSof3FCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739525396; x=1740130196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFfu24KhrvaQp0fxJDrznaHKB4GavpmxXNs5QOAkgRM=;
        b=JgWDmzjNw31LuZn5kMs/+uXhkKs9Op55Wjio12x97DZPMmQG40APhqM2Py1XzZs1EJ
         6BN550ad/rUE1JcZQExJALUrc4pBBMbtZdd9l+b2/ynUjW7XvGmJ9QunaZsrvTx0sgzH
         oHjdEDssMczk24NRIznrzBrXsBH5dZAJquWxIUoZSAAj8H86cpq5pYTp5gKZEtN/L2Th
         3LhgLgZxwgWoyR9RKuZTcds3mX/s7hz+J5JEY89kUtstTWrGuSrAGhsRR1JtW2Yu2+Rt
         eTWcaOtxPvFeqBpMTMtcGalCLHU2ydBUoy+dcui4uwkeeSz8TMwwwCzkAl43Uwlk6W/2
         qNQQ==
X-Gm-Message-State: AOJu0YztEEO7uUiCayxoMuOpTajeuPIcT270MrX+/PMhGZsDhkGSMEMJ
	1DPzwu3mdgu+Sl/+FXyZbw7+X0miL0K2l/Y4W7CESOXLoJXXlpL4CHHFSo3L4s49kVC5qB1QzP1
	6
X-Gm-Gg: ASbGncv1SfNaLsYWkFQ6oAz8H0QZsYkvvJ6BODWJg6jPLcO6iZ3ZDuTbfYYj6WqpQ/U
	KRtow7uBSX7inFthWhTqKYDvUMvN6qMVnLLcL0oNUacfWZszMvFanMcXYe2EOZL+KHgB7WkQ5d0
	UECvMGUcVycJjc3w3l2ddX+DfieXfiyeJq7/e0I9QMtOn6tBV6GLJBuCOHf4mmijZ9RACWSUc6E
	9ZMuCI9HOykU0NnugkGCtfix9uzpbWTNqGwYWeHgJpYbtZexMbr6gLpOXuPjvsKZ6cDYuwFQ16g
	u2Z931AKlvkOzn5kCm///qUpVw==
X-Google-Smtp-Source: AGHT+IFoDXYBli37uyiAtAYfJjPrhGbpUc723Gn08G5ekilp+ywEwkwnBv/9HoNwSrqDUNfrYD5uYQ==
X-Received: by 2002:a17:907:3daa:b0:ab7:b250:aaa with SMTP id a640c23a62f3a-ab7f34d5051mr1084325566b.54.1739525396104;
        Fri, 14 Feb 2025 01:29:56 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] x86/dom0: attempt to fixup p2m page-faults for PVH dom0
Date: Fri, 14 Feb 2025 10:29:28 +0100
Message-ID: <20250214092928.28932-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250214092928.28932-1-roger.pau@citrix.com>
References: <20250214092928.28932-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building a PVH dom0 Xen attempts to map all (relevant) MMIO regions
into the p2m for dom0 access.  However the information Xen has about the
host memory map is limited.  Xen doesn't have access to any resources
described in ACPI dynamic tables, and hence the p2m mappings provided might
not be complete.

PV doesn't suffer from this issue because a PV dom0 is capable of mapping
into it's page-tables any address not explicitly banned in d->iomem_caps.

Introduce a new command line options that allows Xen to attempt to fixup
the p2m page-faults, by creating p2m identity maps in response to p2m
page-faults.

This is aimed as a workaround to small ACPI regions Xen doesn't know about.
Note that missing large MMIO regions mapped in this way will lead to
slowness due to the VM exit processing, plus the mappings will always use
small pages.

The ultimate aim is to attempt to bring better parity with a classic PV
dom0.

Note such fixup rely on the CPU doing the access to the unpopulated
address.  If the access is attempted from a device instead there's no
possible way to fixup, as IOMMU page-fault are asynchronous.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Only slightly tested on my local PVH dom0 deployment.
---
 CHANGELOG.md                       | 10 +++++++++
 docs/misc/xen-command-line.pandoc  | 16 +++++++++++++-
 xen/arch/x86/dom0_build.c          |  4 ++++
 xen/arch/x86/hvm/emulate.c         | 34 ++++++++++++++++++++++++++++--
 xen/arch/x86/hvm/hvm.c             | 31 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h |  5 +++++
 6 files changed, 97 insertions(+), 3 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1de1d1eca17f..e5e6ab3a8902 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,6 +4,16 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
+## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
+### Changed
+
+### Added
+ - On x86:
+   - Option to attempt to fixup p2m page-faults on PVH dom0.
+
+### Removed
+
 ## [4.20.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9bbd00baef91..e9884de07e9e 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -822,7 +822,8 @@ Specify the bit width of the DMA heap.
 
 ### dom0
     = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
-                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
+                cpuid-faulting=<bool>, msr-relaxed=<bool>,
+                pf-fixup=<bool> ] (x86)
 
     = List of [ sve=<integer> ] (Arm64)
 
@@ -883,6 +884,19 @@ Controls for how dom0 is constructed on x86 systems.
 
     If using this option is necessary to fix an issue, please report a bug.
 
+*   The `pf-fixup` boolean is only applicable when using a PVH dom0 and
+    defaults to false.
+
+    When running dom0 in PVH mode the dom0 kernel has no way to map MMIO
+    regions into the p2m, such mode relies on Xen dom0 builder populating
+    the p2m with all MMIO regions that dom0 should access.  However Xen
+    doesn't have a complete picture of the host memory map, due to not
+    being able to process ACPI dynamic tables.
+
+    The `pf-fixup` option allows Xen to attempt to add missing MMIO regions
+    to the p2m in response to page-faults generated by dom0 trying to access
+    unpopulated entries in the p2m.
+
 Enables features on dom0 on Arm systems.
 
 *   The `sve` integer parameter enables Arm SVE usage for Dom0 and sets the
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index d1b4ef83b2d0..34b6166f4922 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -286,6 +286,10 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
         opt_dom0_cpuid_faulting = val;
     else if ( (val = parse_boolean("msr-relaxed", s, e)) >= 0 )
         opt_dom0_msr_relaxed = val;
+#ifdef CONFIG_HVM
+    else if ( (val = parse_boolean("pf-fixup", s, e)) >= 0 )
+        opt_dom0_pf_fixup = val;
+#endif
     else
         return -EINVAL;
 
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 8aa7e49c056c..aa16ed0e9cac 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -338,8 +338,38 @@ static int hvmemul_do_io(
         if ( !s )
         {
             if ( is_mmio && is_hardware_domain(currd) )
-                gdprintk(XENLOG_DEBUG, "unhandled memory %s to %#lx size %u\n",
-                         dir ? "read" : "write", addr, size);
+            {
+                /*
+                 * PVH dom0 is likely missing MMIO mappings on the p2m, due to
+                 * the incomplete information Xen has about the memory layout.
+                 *
+                 * Either print a message to note dom0 attempted to access an
+                 * unpopulated GPA, or try to fixup the p2m by creating an
+                 * identity mapping for the faulting GPA.
+                 */
+                if ( opt_dom0_pf_fixup )
+                {
+                    int inner_rc = hvm_hwdom_fixup_p2m(addr);
+
+                    if ( !inner_rc )
+                    {
+                        gdprintk(XENLOG_DEBUG,
+                                 "fixup p2m mapping for page %lx added\n",
+                                 paddr_to_pfn(addr));
+                        rc = X86EMUL_RETRY;
+                        vio->req.state = STATE_IOREQ_NONE;
+                        break;
+                    }
+
+                    gprintk(XENLOG_WARNING,
+                            "unable to fixup memory %s to %#lx size %u: %d\n",
+                            dir ? "read" : "write", addr, size, inner_rc);
+                }
+                else
+                    gdprintk(XENLOG_DEBUG,
+                             "unhandled memory %s to %#lx size %u\n",
+                             dir ? "read" : "write", addr, size);
+            }
             rc = hvm_process_io_intercept(&null_handler, &p);
             vio->req.state = STATE_IOREQ_NONE;
         }
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 39e39ce4ce36..4505868f025c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -13,6 +13,7 @@
 #include <xen/lib.h>
 #include <xen/trace.h>
 #include <xen/sched.h>
+#include <xen/iocap.h>
 #include <xen/irq.h>
 #include <xen/softirq.h>
 #include <xen/domain.h>
@@ -5458,6 +5459,36 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
     return rc;
 }
 
+bool __ro_after_init opt_dom0_pf_fixup;
+int hvm_hwdom_fixup_p2m(paddr_t addr)
+{
+    unsigned long gfn = paddr_to_pfn(addr);
+    struct domain *currd = current->domain;
+    p2m_type_t type;
+    mfn_t mfn;
+    int rc;
+
+    ASSERT(is_hardware_domain(currd));
+    ASSERT(!altp2m_active(currd));
+
+    /*
+     * Fixups are only applied for MMIO holes, and rely on the hardware domain
+     * having identity mappings for non RAM regions (gfn == mfn).
+     */
+    if ( !iomem_access_permitted(currd, gfn, gfn) ||
+         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
+        return -EPERM;
+
+    mfn = get_gfn(currd, gfn, &type);
+    if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
+        rc = mfn_eq(mfn, _mfn(gfn)) ? 0 : -EEXIST;
+    else
+        rc = set_mmio_p2m_entry(currd, _gfn(gfn), _mfn(gfn), 0);
+    put_gfn(currd, gfn);
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index cad3a9427801..e084e1c7d665 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -772,6 +772,11 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
     return -EOPNOTSUPP;
 }
 
+/* For PVH dom0: signal whether to attempt fixup of p2m page-faults. */
+extern bool opt_dom0_pf_fixup;
+/* Attempt to fixup a p2m page-fault by adding an identity mapping entry. */
+int hvm_hwdom_fixup_p2m(paddr_t addr);
+
 /*
  * Accessors for registers which have per-guest-type or per-vendor locations
  * (e.g. VMCS, msr load/save lists, VMCB, VMLOAD lazy, etc).
-- 
2.46.0


