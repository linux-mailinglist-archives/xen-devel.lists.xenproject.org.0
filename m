Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E8A3A044
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:45:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891772.1300814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOqO-0005Yx-Mb; Tue, 18 Feb 2025 14:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891772.1300814; Tue, 18 Feb 2025 14:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOqO-0005WK-Js; Tue, 18 Feb 2025 14:45:04 +0000
Received: by outflank-mailman (input) for mailman id 891772;
 Tue, 18 Feb 2025 14:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6LV=VJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkOgq-000673-Pf
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:35:12 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f6839d0-ee05-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 15:35:12 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-abb7f539c35so623453966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:35:12 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbb297ccd6sm187008966b.160.2025.02.18.06.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 06:35:10 -0800 (PST)
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
X-Inumbo-ID: 8f6839d0-ee05-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739889311; x=1740494111; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KCSjyGMRhRccb8+O9P77tIoteqmX4B4he+uBAZ8Pjw=;
        b=OWiFWdMYRYB7snYSckv4xTnS9MHwbq2hjK6RMxKE530/0JPzanPJYoh7fbhf/jr1m+
         0Tl+AbpagygD3VWuXc8gUe0TuTNz1Yip2FChrcVUaGklArZwiPL4V94gsdVc9Mp7hH4m
         NJsPUH2WejWxBxmwGChWXKAUuUbeNyx22sWgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889311; x=1740494111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KCSjyGMRhRccb8+O9P77tIoteqmX4B4he+uBAZ8Pjw=;
        b=frXlQ16cQT0z7qZN/y5E54znM2zS1wT9PQ7X2Mpg/Ks21ljaCyixj+Jqg16Xc1yeie
         LIYFN8VT2BY3OZXbN3cIdxs6MUwnxqVipHN5Srfg9jCTzfw9GQa5pIa+kLe3BZ7SJzcI
         gbgsxWML3bPSCK1PJu/7lwQvIoVBKZN3XBRvclKcel4hVrjkcRaJheAMzqsecFDCVTpl
         oTIQPgPv6KVkt61btONCMPf8A0g31YH2xCgt1g5UdwISnOc2yPwz27nnWboS7zPZ9b4E
         fM2Ng8RF66zWWgISSeJTNC+sJ/M9DqiyR7eZp4VNdjxbDwHwog/IhlyBF4u7K+J6XKpx
         qnaQ==
X-Gm-Message-State: AOJu0YxIzGwe/tbSAE4/RuNCKlm0AGB3AaPFOp/OIvD391/6NE7nqJCs
	HrsoCC16gh52RnB7JAvE5yAaB4VmxNFxFIbdJ/W5n9mm37CBl4fKPXGvaeOXPrcqfGZkE48HUgb
	t
X-Gm-Gg: ASbGncsw6QwYuNQ5JH0z73NxnzXtHUs/APkQx5ay3V0EJF8r7TU3S52j+3kPSe7ZKLu
	+MVWzshejDpZZflKosoR0KKvpmHlgByrDbgwAfJz4BpQNiPFWEHcSRbcnNPU4mysv4ckBUKlGK1
	RTGp7PVP/4VoQeiny54wxvpzb1EMgtQWxIUppGup1xe2jKXIhOgb03nNbn9Y+3DktQc9OjtSCoY
	7l4tcGvomx6M9ALxtn3rllqWqRMcWHOwpuPlxRY0YcWaLYLt522EKGn6W3f52KNutAckRt31o6q
	8bNNFGc1b3n7TUZAZWyq
X-Google-Smtp-Source: AGHT+IE4yCeMa8fCFyU/iSMMhgr0I/IAAo1OeHksm9dYKyIsTmmsIQKy3faWCG8qXOC7BzW+O/V9Kw==
X-Received: by 2002:a17:907:6091:b0:ab7:d916:4fe4 with SMTP id a640c23a62f3a-abb70bacfc2mr1528841866b.24.1739889310862;
        Tue, 18 Feb 2025 06:35:10 -0800 (PST)
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
Subject: [PATCH v2 2/2] x86/dom0: attempt to fixup p2m page-faults for PVH dom0
Date: Tue, 18 Feb 2025 15:35:04 +0100
Message-ID: <20250218143504.77638-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250218143504.77638-1-roger.pau@citrix.com>
References: <20250218143504.77638-1-roger.pau@citrix.com>
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
Changes since v1:
 - Make the fixup function static.
 - Print message in case mapping already exists.
---
 CHANGELOG.md                           | 10 ++++
 docs/misc/xen-command-line.pandoc      | 16 +++++-
 xen/arch/x86/dom0_build.c              |  5 ++
 xen/arch/x86/hvm/emulate.c             | 74 +++++++++++++++++++++++++-
 xen/arch/x86/include/asm/hvm/emulate.h |  3 ++
 5 files changed, 105 insertions(+), 3 deletions(-)

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
index 9bbd00baef91..83bb69cfb852 100644
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
+    regions into its physical memory map, such mode relies on Xen dom0 builder
+    populating the physical memory map with all MMIO regions that dom0 should
+    access.  However Xen doesn't have a complete picture of the host memory
+    map, due to not being able to process ACPI dynamic tables.
+
+    The `pf-fixup` option allows Xen to attempt to add missing MMIO regions
+    to the dom0 physical memory map in response to page-faults generated by
+    dom0 trying to access unpopulated entries in the memory map.
+
 Enables features on dom0 on Arm systems.
 
 *   The `sve` integer parameter enables Arm SVE usage for Dom0 and sets the
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 2fe6b449149e..11c20b9ab0a4 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -16,6 +16,7 @@
 #include <asm/dom0_build.h>
 #include <asm/guest.h>
 #include <asm/hpet.h>
+#include <asm/hvm/emulate.h>
 #include <asm/io-ports.h>
 #include <asm/io_apic.h>
 #include <asm/p2m.h>
@@ -286,6 +287,10 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
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
index 08b9493e6d88..3cd7f2e22f26 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -10,12 +10,15 @@
  */
 
 #include <xen/init.h>
+#include <xen/iocap.h>
 #include <xen/ioreq.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/paging.h>
 #include <xen/trace.h>
 #include <xen/vm_event.h>
+
+#include <asm/altp2m.h>
 #include <asm/event.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
@@ -161,6 +164,36 @@ void hvmemul_cancel(struct vcpu *v)
     hvmemul_cache_disable(v);
 }
 
+bool __ro_after_init opt_dom0_pf_fixup;
+static int hwdom_fixup_p2m(paddr_t addr)
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
+        rc = mfn_eq(mfn, _mfn(gfn)) ? -EEXIST : -ENOTEMPTY;
+    else
+        rc = set_mmio_p2m_entry(currd, _gfn(gfn), _mfn(gfn), 0);
+    put_gfn(currd, gfn);
+
+    return rc;
+}
+
 static int hvmemul_do_io(
     bool is_mmio, paddr_t addr, unsigned long *reps, unsigned int size,
     uint8_t dir, bool df, bool data_is_addr, uintptr_t data)
@@ -338,8 +371,45 @@ static int hvmemul_do_io(
         if ( !s )
         {
             if ( is_mmio && is_hardware_domain(currd) )
-                gdprintk(XENLOG_DEBUG, "unhandled memory %s %#lx size %u\n",
-                         dir ? "read from" : "write to", addr, size);
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
+                    int inner_rc = hwdom_fixup_p2m(addr);
+
+                    if ( !inner_rc || inner_rc == -EEXIST )
+                    {
+                        if ( !inner_rc )
+                            gdprintk(XENLOG_DEBUG,
+                                     "fixup p2m mapping for page %lx added\n",
+                                     paddr_to_pfn(addr));
+                        else
+                            gprintk(XENLOG_INFO,
+                                    "fixup p2m mapping for page %lx already present\n",
+                                    paddr_to_pfn(addr));
+
+                        rc = X86EMUL_RETRY;
+                        vio->req.state = STATE_IOREQ_NONE;
+                        break;
+                    }
+
+                    gprintk(XENLOG_WARNING,
+                            "unable to fixup memory %s %#lx size %u: %d\n",
+                            dir ? "read from" : "write to", addr, size,
+                            inner_rc);
+                }
+                else
+                    gdprintk(XENLOG_DEBUG,
+                             "unhandled memory %s %#lx size %u\n",
+                             dir ? "read from" : "write to", addr, size);
+            }
             rc = hvm_process_io_intercept(&null_handler, &p);
             vio->req.state = STATE_IOREQ_NONE;
         }
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index 760ce5e77cce..d17c025a1d45 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -148,6 +148,9 @@ static inline void hvmemul_write_cache(const struct vcpu *v, paddr_t gpa,
 void hvm_dump_emulation_state(const char *loglvl, const char *prefix,
                               struct hvm_emulate_ctxt *hvmemul_ctxt, int rc);
 
+/* For PVH dom0: signal whether to attempt fixup of p2m page-faults. */
+extern bool opt_dom0_pf_fixup;
+
 #endif /* __ASM_X86_HVM_EMULATE_H__ */
 
 /*
-- 
2.46.0


