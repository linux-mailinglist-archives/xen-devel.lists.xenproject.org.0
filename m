Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AE435EBFF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 06:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110236.210407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWXKM-0006Bo-RK; Wed, 14 Apr 2021 04:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110236.210407; Wed, 14 Apr 2021 04:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWXKM-0006BP-OF; Wed, 14 Apr 2021 04:40:34 +0000
Received: by outflank-mailman (input) for mailman id 110236;
 Wed, 14 Apr 2021 04:40:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCy3=JL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lWXKL-0006BK-Do
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 04:40:33 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc3d8946-8adf-4970-95b0-4883e46f8b72;
 Wed, 14 Apr 2021 04:40:32 +0000 (UTC)
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
X-Inumbo-ID: cc3d8946-8adf-4970-95b0-4883e46f8b72
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618375231;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=v9rjf8g4wjjlqjwQfVzsd8itE2gmyK7VjaStkmMVrUs=;
  b=av7ti+y8eRdSEpbMsQVGzHwabWcmA0/KbdzmufTY6BN8NSLfHvk7LIBa
   BIRWv54RRhsCGdKDHRqtIRGxEHbivM8UbfwWOrvlJqUkdomdzxl/OgcJl
   p2aROrlRAr3YdXHyeSFPuGqQxNDLELlucKaAv4LozRLp4BbTzwYrahaHk
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: djWu51CvWjQpY1Dj6+TdW2d2chcqBa7C2Ghh4p1tM5igYwWCBWzVCSwiiUiJ3fccrsiLrnrEuh
 o88TBJyWoaIXsmxZ3XDjnTZBepi3PDOBveUY3S+DGkHG+dGjSu285VfkF5uqIaDjDKGQ6PVAw7
 7uLYfZfrv3wHzGTrNkNxjQwv/funbN+fw4riVAJECke2V0r+1ABAR096U1xtQNnUzKqDtgB1hd
 qXRVRkmIX/WPepbF0L4AYSrroAhhvDBhrcdxoI/9rt/d8FkoI0WsgwUbTfKaHhvLEdc1DPhsUw
 1tU=
X-SBRS: 4.0
X-MesageID: 43016262
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ttdt3qjW/o1SnGJ0iTiE/iURAHBQXh0ji2hD6mlwRA09T+Wzva
 mV/cgz/xnylToXRTUcicmNUZPwJ0/02JZp7eAqTNSfdSb8vm/AFu5fxK/D5xGlJCHk7O5a0s
 5bAs9DIfn9F0Jzg8q/wCTQKadD/PC9/KqlhfjTwh5WJGkAAcwN0y5DBhuGCUozfQFaBPMCZf
 6hz/BarDmtc2l/VKSGL0QCNtKsm/T70LbvYRsLHHccmWyzsQ8=
X-IronPort-AV: E=Sophos;i="5.82,221,1613451600"; 
   d="scan'208";a="43016262"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH v4 1/2] x86/vtx: add LBR_SELECT to the list of LBR MSRs
Date: Wed, 14 Apr 2021 05:40:21 +0100
Message-ID: <1618375222-9283-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

This MSR exists since Nehalem and is actively used by Linux, for instance,
to improve sampling efficiency.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
New patch in v4 as suggested by Andrew.
---
 xen/arch/x86/hvm/vmx/vmx.c      | 7 +++++--
 xen/include/asm-x86/msr-index.h | 6 +++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 835b905..5a4ca35 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2915,14 +2915,16 @@ static const struct lbr_info {
 }, nh_lbr[] = {
     { MSR_IA32_LASTINTFROMIP,       1 },
     { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_C2_LASTBRANCH_TOS,        1 },
+    { MSR_NHL_LBR_SELECT,           1 },
+    { MSR_NHL_LASTBRANCH_TOS,       1 },
     { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
     { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
     { 0, 0 }
 }, sk_lbr[] = {
     { MSR_IA32_LASTINTFROMIP,       1 },
     { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_SKL_LASTBRANCH_TOS,       1 },
+    { MSR_NHL_LBR_SELECT,           1 },
+    { MSR_NHL_LASTBRANCH_TOS,       1 },
     { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH },
     { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH },
     { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH },
@@ -2937,6 +2939,7 @@ static const struct lbr_info {
 }, gm_lbr[] = {
     { MSR_IA32_LASTINTFROMIP,       1 },
     { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_GM_LBR_SELECT,            1 },
     { MSR_GM_LASTBRANCH_TOS,        1 },
     { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO },
     { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO },
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index 43d26ef..25c4308 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -606,14 +606,18 @@
 #define NUM_MSR_C2_LASTBRANCH_FROM_TO	4
 #define NUM_MSR_ATOM_LASTBRANCH_FROM_TO	8
 
+/* Nehalem (and newer) last-branch recording */
+#define MSR_NHL_LBR_SELECT		0x000001c8
+#define MSR_NHL_LASTBRANCH_TOS		0x000001c9
+
 /* Skylake (and newer) last-branch recording */
-#define MSR_SKL_LASTBRANCH_TOS		0x000001c9
 #define MSR_SKL_LASTBRANCH_0_FROM_IP	0x00000680
 #define MSR_SKL_LASTBRANCH_0_TO_IP	0x000006c0
 #define MSR_SKL_LASTBRANCH_0_INFO	0x00000dc0
 #define NUM_MSR_SKL_LASTBRANCH		32
 
 /* Goldmont last-branch recording */
+#define MSR_GM_LBR_SELECT		0x000001c8
 #define MSR_GM_LASTBRANCH_TOS		0x000001c9
 #define MSR_GM_LASTBRANCH_0_FROM_IP	0x00000680
 #define MSR_GM_LASTBRANCH_0_TO_IP	0x000006c0
-- 
2.7.4


