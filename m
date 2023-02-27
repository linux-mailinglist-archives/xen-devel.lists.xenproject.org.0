Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB76A3BDF
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 08:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502218.773917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYNa-0001Cy-QC; Mon, 27 Feb 2023 07:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502218.773917; Mon, 27 Feb 2023 07:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYNa-000154-MN; Mon, 27 Feb 2023 07:57:02 +0000
Received: by outflank-mailman (input) for mailman id 502218;
 Mon, 27 Feb 2023 07:57:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRQf=6X=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pWYNZ-0000zz-Lb
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 07:57:01 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50592f13-b674-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 08:57:00 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id ec43so21964294edb.8
 for <xen-devel@lists.xenproject.org>; Sun, 26 Feb 2023 23:57:00 -0800 (PST)
Received: from uni.router.wind (adsl-209.109.242.226.tellas.gr.
 [109.242.226.209]) by smtp.googlemail.com with ESMTPSA id
 b23-20020a50ccd7000000b0049ef70a2894sm2788272edj.38.2023.02.26.23.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 23:56:58 -0800 (PST)
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
X-Inumbo-ID: 50592f13-b674-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnLzBk1wGHculJohEmqu0NjSNnMRtRwNM1eASmcyK7g=;
        b=XpIwuJxkvMyIxXOrltJKdUm3iZn63kgkpjcD+ADaAvqH7jhlg5gOI7M44LeTbWoYTz
         NAsJmfgDMVnY9LXB5A2VKokOkIKxEjFZ5VtSWOXa7ht0DHPEFTxApGg9XqLO/I6a5eyk
         wNdrRI8WiM0jFIqlDaXvCeq2W/qkGQ3G1xyAgEB6n/A+wFCMaF8qGcOR/WBOGs2omKCS
         aWjAFKGv2IXWsCxyR/M0AO1lUHj/454e+qezdGA7DfbIx5vwg/lIL/szuG/lYUQuWUBD
         nsU6lNJqq0cCAlDIaloM+a0SiiJJRBgBGoMxE6sgPmg1bvrnBH821XPM3TjSX2htVE1t
         f9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnLzBk1wGHculJohEmqu0NjSNnMRtRwNM1eASmcyK7g=;
        b=8Ixu5N92oRY1V09pK6OrUeSAUU39IHa3UQzQ7h88Cd8MWEUu/KlfufDPGtUK+K+TL3
         ir0wg2toGJTxn41QCKeIqLf2k3sy8RLCQkdqkpeG/S9+iTGFutSERkfv3yRPKWjt4rx5
         BTvQripn/W/43K9olZzKzrtyLVW9Qy3oUYNHDVfCbni8P3+jD96Rm7mCJXiRce19W30c
         nOZBslPi+8Qct/7fDBsb/Tj1uAgNzXH/XvQ6OpuwZUtA2IQQxaXPVC6Dp3ltku/tKNqe
         RVWo4uGl4RYbUeAIDQg14+bXqWpJjdBon9/18YfWlxUXX1KWOcbuw175n9o4dANZ1fqq
         HE7Q==
X-Gm-Message-State: AO0yUKVkeUhaawbS0MMhMiLqnAc6cvR/UzoV5uF3p3bs4zjXwUg8hhgS
	YkYLaOLuzfnN8kxJIi7kU9/pa+JIi7mU2Q==
X-Google-Smtp-Source: AK7set9bGy/1HtlnFiZuZBv3paHLqzPWNlh8gUpseIREAC0+E5QaeISn+/4aHvSrRaJP/iEeWMSubQ==
X-Received: by 2002:a05:6402:e04:b0:4ac:d90e:92b with SMTP id h4-20020a0564020e0400b004acd90e092bmr9246366edh.10.1677484619198;
        Sun, 26 Feb 2023 23:56:59 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 1/4] x86/vpmu: rename {svm,vmx}_vpmu_initialise to {amd,core2}_vpmu_initialise
Date: Mon, 27 Feb 2023 09:56:49 +0200
Message-Id: <20230227075652.3782973-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230227075652.3782973-1-burzalodowa@gmail.com>
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PMU virtualization is not dependent on the hardware virtualization support.
Rename {svm,vmx}_vpmu_initialise to {amd,core2}_vpmu_initialise because
the {svm,vmx} prefix is misleading.

Take the opportunity to remove the also misleading comment stating that
vpmu is specific to hvm guests, and correct the filename.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/cpu/vpmu_amd.c   | 6 +++---
 xen/arch/x86/cpu/vpmu_intel.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 58794a16f0..9df739aa3f 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -1,5 +1,5 @@
 /*
- * vpmu.c: PMU virtualization for HVM domain.
+ * vpmu_amd.c: AMD specific PMU virtualization.
  *
  * Copyright (c) 2010, Advanced Micro Devices, Inc.
  * Parts of this code are Copyright (c) 2007, Intel Corporation
@@ -480,7 +480,7 @@ static void cf_check amd_vpmu_dump(const struct vcpu *v)
     }
 }
 
-static int cf_check svm_vpmu_initialise(struct vcpu *v)
+static int cf_check amd_vpmu_initialise(struct vcpu *v)
 {
     struct xen_pmu_amd_ctxt *ctxt;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
@@ -527,7 +527,7 @@ static int cf_check amd_allocate_context(struct vcpu *v)
 #endif
 
 static const struct arch_vpmu_ops __initconst_cf_clobber amd_vpmu_ops = {
-    .initialise = svm_vpmu_initialise,
+    .initialise = amd_vpmu_initialise,
     .do_wrmsr = amd_vpmu_do_wrmsr,
     .do_rdmsr = amd_vpmu_do_rdmsr,
     .do_interrupt = amd_vpmu_do_interrupt,
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index a8df52579d..bcfa187a14 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -1,5 +1,5 @@
 /*
- * vpmu_core2.c: CORE 2 specific PMU virtualization for HVM domain.
+ * vpmu_intel.c: CORE 2 specific PMU virtualization.
  *
  * Copyright (c) 2007, Intel Corporation.
  *
@@ -833,7 +833,7 @@ static void cf_check core2_vpmu_destroy(struct vcpu *v)
     vpmu_clear(vpmu);
 }
 
-static int cf_check vmx_vpmu_initialise(struct vcpu *v)
+static int cf_check core2_vpmu_initialise(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     u64 msr_content;
@@ -898,7 +898,7 @@ static int cf_check vmx_vpmu_initialise(struct vcpu *v)
 }
 
 static const struct arch_vpmu_ops __initconst_cf_clobber core2_vpmu_ops = {
-    .initialise = vmx_vpmu_initialise,
+    .initialise = core2_vpmu_initialise,
     .do_wrmsr = core2_vpmu_do_wrmsr,
     .do_rdmsr = core2_vpmu_do_rdmsr,
     .do_interrupt = core2_vpmu_do_interrupt,
-- 
2.37.2


