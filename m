Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24038A61904
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 19:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915265.1320812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9Rt-0001dM-J7; Fri, 14 Mar 2025 18:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915265.1320812; Fri, 14 Mar 2025 18:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9Rt-0001cc-GL; Fri, 14 Mar 2025 18:07:57 +0000
Received: by outflank-mailman (input) for mailman id 915265;
 Fri, 14 Mar 2025 18:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt9Rs-0001cW-4E
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 18:07:56 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4079120c-00ff-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 19:07:54 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac2902f7c2aso435230966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 11:07:54 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb2fsm259289366b.15.2025.03.14.11.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 11:07:53 -0700 (PDT)
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
X-Inumbo-ID: 4079120c-00ff-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741975674; x=1742580474; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gw2WTKUG0OK1xPszBVqelRdt8sFwgU4/Sri0UyowHYA=;
        b=r+hObLI41om1da9Fh190nJWNO/gCmahNbMXgJCfLEn0A1o/e+DWwWy3mYCORyXs39V
         zvaBet+xXUmoGKRf7fxCjWMbRSFpPsndO5ZnXp1X/UQLcEDGGoMb2kjh5Q4CWtOMx7Kp
         WfD9XLa3ajn952YxZX4Q8ibJvcl9/IezT+VCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741975674; x=1742580474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw2WTKUG0OK1xPszBVqelRdt8sFwgU4/Sri0UyowHYA=;
        b=JLG1EbNBoKV1rWZX8mF92JLpmkc93Ymc6R3zE2HwLbUj+1u6O0D/J5cCvzmgiXtzOU
         /SulOzY1yMz3Hkx8dgHYa0RJqO+IM2PNsE4rHUCUd4t6EjtfkTpbvCUcuBnLlSxaC1Oj
         cB5Nm5BWNQylYwQwfOlVtX9p329peQ6yLa0fMmd07f4nqCAHI5uoQ5P2zyO6jCz4eV5U
         Jm1vC/aMQRXPHutGQgPHLoDSZr3J6JdqSncX1Q3jFhRp69I1llv/yoHqsWGH0L5Wxwln
         r84/whYpv+Z5KJ91dLJxJYiOMH9tPoPkHhT5Fo2BB6msDpB52Yhpzu8AA7AqXR9inefz
         QjQg==
X-Gm-Message-State: AOJu0YzgO5Wcs9t/MJBxItiqqorBrdH4NsVW7A1DaNqCYL34iW5LTixf
	dNiPMSzonGBFCrONCqMxIWoRZv7XHoym9JqwmFz2h2oyrkO5+4LMf+RcBD4OLjCWpriql7D1TUN
	U
X-Gm-Gg: ASbGncv2l47sJWQDG7YYSf53uv/Ic8ZxbnDncZV1nPwxjFSYTfn5+r4Hlni/1b5WrIT
	Q/kr/389TKhBEy8qn9zvkEvgOS5QlklUxIteb0/CUtTM0bvd5JfuaEIKPodVnyY13Ftbwh5hxpX
	tylMdz3s2t0Y2vHj4AF0akdDQQTXiUDmMCyW1kSePLbgvND/K8/zeIBS53zd7ZbTTievmeUtr45
	zJjnTaL2J6STjzCPuOmTyte1aa92MLSXw7Ir0uJ4jrIUTfIwiHs6S+Ww/gPIuWg+xBsB6E157GW
	n3E3MNwioIWoxhQn2KiUClvs3DDV6xq7JpxM+HXLbhOiMNKv//13csnk3xTHEWxHClQdN2swJ1l
	rCo8IwHYfl3lVyCW4w+PPXZKj
X-Google-Smtp-Source: AGHT+IHacpaox1fYrcOkLPp0rXho2xqZrPuoLKSPAl0GlJU3CzEF4bF4mYIj89znI2ZjfNCQeWP29Q==
X-Received: by 2002:a17:907:3d87:b0:abf:6389:6d19 with SMTP id a640c23a62f3a-ac330258bcamr400349166b.15.1741975673949;
        Fri, 14 Mar 2025 11:07:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/debug: Move activate_debugregs() into debug.c
Date: Fri, 14 Mar 2025 18:07:50 +0000
Message-Id: <20250314180750.73925-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have since gained a better location for it to live.

Fix up the includes while doing so.  I don't recall why we had kernel.h but
it's definitely stale now.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/debug.c | 35 ++++++++++++++++++++++++++++++++++-
 xen/arch/x86/traps.c | 32 --------------------------------
 2 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index e99e663ba5b9..71755dea6ff2 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -3,10 +3,11 @@
  * Copyright (C) 2023 XenServer.
  */
 #include <xen/bug.h>
-#include <xen/kernel.h>
+#include <xen/sched.h>
 
 #include <xen/lib/x86/cpu-policy.h>
 
+#include <asm/current.h>
 #include <asm/debugreg.h>
 
 /*
@@ -84,3 +85,35 @@ unsigned int x86_adj_dr7_rsvd(const struct cpu_policy *p, unsigned int dr7)
 
     return dr7;
 }
+
+void activate_debugregs(const struct vcpu *curr)
+{
+    ASSERT(curr == current);
+
+    write_debugreg(0, curr->arch.dr[0]);
+    write_debugreg(1, curr->arch.dr[1]);
+    write_debugreg(2, curr->arch.dr[2]);
+    write_debugreg(3, curr->arch.dr[3]);
+    write_debugreg(6, curr->arch.dr6);
+
+    /*
+     * Avoid writing the subsequently getting replaced value when getting
+     * called from set_debugreg() below. Eventual future callers will need
+     * to take this into account.
+     */
+    if ( curr->arch.dr7 & DR7_ACTIVE_MASK )
+        write_debugreg(7, curr->arch.dr7);
+
+    /*
+     * Both the PV and HVM paths leave stale DR_MASK values in hardware on
+     * context-switch-out.  If we're activating %dr7 for the guest, we must
+     * sync the DR_MASKs too, whether or not the guest can see them.
+     */
+    if ( boot_cpu_has(X86_FEATURE_DBEXT) )
+    {
+        wrmsrl(MSR_AMD64_DR0_ADDRESS_MASK, curr->arch.msrs->dr_mask[0]);
+        wrmsrl(MSR_AMD64_DR1_ADDRESS_MASK, curr->arch.msrs->dr_mask[1]);
+        wrmsrl(MSR_AMD64_DR2_ADDRESS_MASK, curr->arch.msrs->dr_mask[2]);
+        wrmsrl(MSR_AMD64_DR3_ADDRESS_MASK, curr->arch.msrs->dr_mask[3]);
+    }
+}
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 5addb1f903d3..df1155bfb673 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1942,38 +1942,6 @@ void __init trap_init(void)
     cpu_init();
 }
 
-void activate_debugregs(const struct vcpu *curr)
-{
-    ASSERT(curr == current);
-
-    write_debugreg(0, curr->arch.dr[0]);
-    write_debugreg(1, curr->arch.dr[1]);
-    write_debugreg(2, curr->arch.dr[2]);
-    write_debugreg(3, curr->arch.dr[3]);
-    write_debugreg(6, curr->arch.dr6);
-
-    /*
-     * Avoid writing the subsequently getting replaced value when getting
-     * called from set_debugreg() below. Eventual future callers will need
-     * to take this into account.
-     */
-    if ( curr->arch.dr7 & DR7_ACTIVE_MASK )
-        write_debugreg(7, curr->arch.dr7);
-
-    /*
-     * Both the PV and HVM paths leave stale DR_MASK values in hardware on
-     * context-switch-out.  If we're activating %dr7 for the guest, we must
-     * sync the DR_MASKs too, whether or not the guest can see them.
-     */
-    if ( boot_cpu_has(X86_FEATURE_DBEXT) )
-    {
-        wrmsrl(MSR_AMD64_DR0_ADDRESS_MASK, curr->arch.msrs->dr_mask[0]);
-        wrmsrl(MSR_AMD64_DR1_ADDRESS_MASK, curr->arch.msrs->dr_mask[1]);
-        wrmsrl(MSR_AMD64_DR2_ADDRESS_MASK, curr->arch.msrs->dr_mask[2]);
-        wrmsrl(MSR_AMD64_DR3_ADDRESS_MASK, curr->arch.msrs->dr_mask[3]);
-    }
-}
-
 void asm_domain_crash_synchronous(unsigned long addr)
 {
     /*
-- 
2.39.5


