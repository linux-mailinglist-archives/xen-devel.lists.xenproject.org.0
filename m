Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20A659CADC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 23:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391594.629499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQF0n-00070W-QJ; Mon, 22 Aug 2022 21:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391594.629499; Mon, 22 Aug 2022 21:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQF0n-0006x5-N6; Mon, 22 Aug 2022 21:31:09 +0000
Received: by outflank-mailman (input) for mailman id 391594;
 Mon, 22 Aug 2022 21:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+uMy=Y2=citrix.com=prvs=22646fa71=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQF0l-0006wz-JC
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 21:31:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7f21584-2261-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 23:31:02 +0200 (CEST)
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
X-Inumbo-ID: b7f21584-2261-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661203862;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NZAu9e4sXDTW33ZmtnfP+zdIlwABp1HNdu8TudbfLWY=;
  b=ReJ5n+xxyrSuhLJ+YGJGzhU/GxauHxYfktWkMG7IFJEZmwRxOckJ91qS
   GcJl9q15asf6+SHnMHsrcN3VSBrCCMpMM7gCShG8br00F/oy5Q+TLXor4
   nE9ccdazMc71xmsNe7TkniXj9caePdjhyASNOTQERQ7Zls5+TDGvMTXC/
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77881871
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UCDg76zAe59BSPMdCod6t+dbxirEfRIJ4+MujC+fZmUNrF6WrkUAn
 WYZUDjXM/reamL0ctolYIXn9kgPscKGmoQwQVQ5pSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Ek15K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN0xHWo6EYwk6N1PXzBD5
 /M1NDxTZRqc0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzpZRFVN0hRI5U5hOqy3VH0ciFCqULTrq0yi4TW5FMugOi0YIWMEjCMbZtIpAWXq
 nqWxlbeGBhHbteZwxOhzn3504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTg9O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9FmO2+puVkSGJAXZEIH0NSDMIEwAP/Iy2yG0stS4jXuqPAYbs0IOtSW6sm
 mDUxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN51oItcQOYCPyPPMfj2eN5yMCnMDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lWLeb7pMjtcWKtUWnzy7qWbTk0v6itJzpRe9Fd84Dbd5Rr9nsf/d/V6Km
 zudXuPToyhivCTFSnG/2eYuwZoidBDX2bieRxRrS9O+
IronPort-HdrOrdr: A9a23:MGo88asDKtYupDtNE3QlHxkA7skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHjJYVcqKRUdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyZygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.93,255,1654574400"; 
   d="scan'208";a="77881871"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jane Malalane
	<jane.malalane@citrix.com>
Subject: [PATCH] x86/domain: Fix struct domain memory corruption when building PV guests
Date: Mon, 22 Aug 2022 22:30:36 +0100
Message-ID: <20220822213036.21630-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

arch_domain_create() can't blindly write into d->arch.hvm union.  Move the
logic into hvm_domain_initialise(), which involves passing config down.

Fixes: 2ce11ce249a3 ("x86/HVM: allow per-domain usage of hardware virtualized APIC")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jane Malalane <jane.malalane@citrix.com>

This does not fix XenServer's wall of red from testing, but I have at least
figured out what's going on.  There's a piece of plain RAM in place of a
working LAPIC MMIO mapping (accelerated or otherwise), which causes HVMLoader
to spin in a tight loop waiting for CPU 1 to come up after failing to send an
INIT-SIPI-SIPI.

Sadly the fix is not as straightforward as I'd hoped, and needs more testing.
---
 xen/arch/x86/domain.c              | 8 +-------
 xen/arch/x86/hvm/hvm.c             | 9 ++++++++-
 xen/arch/x86/include/asm/hvm/hvm.h | 3 ++-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 15e7e772012e..41e1e3f27272 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -853,7 +853,7 @@ int arch_domain_create(struct domain *d,
 
     if ( is_hvm_domain(d) )
     {
-        if ( (rc = hvm_domain_initialise(d)) != 0 )
+        if ( (rc = hvm_domain_initialise(d, config)) != 0 )
             goto fail;
     }
     else if ( is_pv_domain(d) )
@@ -885,12 +885,6 @@ int arch_domain_create(struct domain *d,
 
     d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
 
-    d->arch.hvm.assisted_xapic =
-        config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
-
-    d->arch.hvm.assisted_x2apic =
-        config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
-
     spec_ctrl_init_domain(d);
 
     return 0;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 6b5d585ed4cc..ae8267852013 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -576,7 +576,8 @@ static int cf_check hvm_print_line(
     return X86EMUL_OKAY;
 }
 
-int hvm_domain_initialise(struct domain *d)
+int hvm_domain_initialise(struct domain *d,
+                          struct xen_domctl_createdomain *config)
 {
     unsigned int nr_gsis;
     int rc;
@@ -597,6 +598,12 @@ int hvm_domain_initialise(struct domain *d)
     INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
     INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
 
+    d->arch.hvm.assisted_xapic =
+        config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
+
+    d->arch.hvm.assisted_x2apic =
+        config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
+
     rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
     if ( rc )
         goto fail;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 03096f31effa..55a53d9cac8f 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -259,7 +259,8 @@ extern s8 hvm_port80_allowed;
 extern const struct hvm_function_table *start_svm(void);
 extern const struct hvm_function_table *start_vmx(void);
 
-int hvm_domain_initialise(struct domain *d);
+int hvm_domain_initialise(struct domain *d,
+                          struct xen_domctl_createdomain *config);
 void hvm_domain_relinquish_resources(struct domain *d);
 void hvm_domain_destroy(struct domain *d);
 
-- 
2.11.0


