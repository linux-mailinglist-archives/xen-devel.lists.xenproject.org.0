Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B91904B8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 05:57:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGbZ5-0006xC-JZ; Tue, 24 Mar 2020 04:53:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Uq2/=5J=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1jGbZ3-0006x7-Vz
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 04:53:22 +0000
X-Inumbo-ID: 5fbb622a-6d8b-11ea-837b-12813bfff9fa
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fbb622a-6d8b-11ea-837b-12813bfff9fa;
 Tue, 24 Mar 2020 04:53:19 +0000 (UTC)
Received: from MK-FE.hygon.cn ([172.23.18.61])
 by spam2.hygon.cn with ESMTP id 02O4qQ7x027262;
 Tue, 24 Mar 2020 12:52:26 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-FE.hygon.cn with ESMTP id 02O4qRVV031861;
 Tue, 24 Mar 2020 12:52:27 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from ubuntu1604-2.higon.com (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Tue, 24 Mar
 2020 12:52:09 +0800
From: Pu Wen <puwen@hygon.cn>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Mar 2020 12:51:31 +0800
Message-ID: <20200324045131.2060-1-puwen@hygon.cn>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex01.Hygon.cn (172.23.18.10) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam2.hygon.cn 02O4qQ7x027262
X-DNSRBL: 
Subject: [Xen-devel] [PATCH] x86/mce: Correct the machine check vendor for
 Hygon
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pu Wen <puwen@hygon.cn>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Currently the xl dmesg output on Hygon platforms will be
"(XEN) CPU0: AMD Fam18h machine check reporting enabled",
which is misleading as AMD does not have family 18h (Hygon
negotiated with AMD to confirm that only Hygon has family 18h).

To correct this, add Hygon machine check type and vendor string.

Signed-off-by: Pu Wen <puwen@hygon.cn>
---
 xen/arch/x86/cpu/mcheck/mce.c     | 4 +++-
 xen/arch/x86/cpu/mcheck/mce.h     | 3 ++-
 xen/arch/x86/cpu/mcheck/mce_amd.c | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index e5bd4f542c..fe9667e0c3 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -610,7 +610,8 @@ int show_mca_info(int inited, struct cpuinfo_x86 *c)
         static const char *const type_str[] = {
             [mcheck_amd_famXX] = "AMD",
             [mcheck_amd_k8] = "AMD K8",
-            [mcheck_intel] = "Intel"
+            [mcheck_intel] = "Intel",
+            [mcheck_hygon] = "Hygon"
         };
 
         snprintf(prefix, ARRAY_SIZE(prefix), "%sCPU%u: ",
@@ -625,6 +626,7 @@ int show_mca_info(int inited, struct cpuinfo_x86 *c)
             break;
 
         case mcheck_amd_famXX:
+        case mcheck_hygon:
             printk("%s%s Fam%xh machine check reporting enabled\n",
                    prefix, type_str[inited], c->x86);
             break;
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index 7137c2f763..1953626919 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -36,7 +36,8 @@ enum mcheck_type {
     mcheck_none,
     mcheck_amd_famXX,
     mcheck_amd_k8,
-    mcheck_intel
+    mcheck_intel,
+    mcheck_hygon
 };
 
 extern uint8_t cmci_apic_vector;
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 787ce961b6..279a8e6f12 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -339,5 +339,6 @@ amd_mcheck_init(struct cpuinfo_x86 *ci)
     mce_recoverable_register(mc_amd_recoverable_scan);
     mce_register_addrcheck(mc_amd_addrcheck);
 
-    return mcheck_amd_famXX;
+    return ci->x86_vendor == X86_VENDOR_HYGON ?
+            mcheck_hygon : mcheck_amd_famXX;
 }
-- 
2.23.0


