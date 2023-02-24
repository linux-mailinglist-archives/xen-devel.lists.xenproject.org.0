Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9347B6A21C0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501419.773212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9K-0003YC-Js; Fri, 24 Feb 2023 18:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501419.773212; Fri, 24 Feb 2023 18:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9K-0003TJ-FF; Fri, 24 Feb 2023 18:50:30 +0000
Received: by outflank-mailman (input) for mailman id 501419;
 Fri, 24 Feb 2023 18:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9J-0001Wv-3F
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:29 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b5adb9f-b474-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:50:28 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id o12so974360edb.9
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:28 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:27 -0800 (PST)
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
X-Inumbo-ID: 1b5adb9f-b474-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPYCsGMeBTiPN9pOJ5LMApZIn6k2wD9Q3YWmBtml8QE=;
        b=Vv5j0WwwWDrjByFvRX4M/pnpcjrev6SIvPMEeM65ox88mEYfJAfV/B9fCU4oZySTwq
         D7ixLk6mVcJ+bZxqI7PNm5aRuxZl/UBUOgo9wbuENOuUXRMZe0AH6gRhLwsjx5TGptXP
         IFqiVki0Sh4GrrR3p0xS8pjCPGCHTG3vAHLqQ0KLW4SrU2FBDt9obwxrMaA2NF/rbCxh
         WzExUc1JgQHJgae/ooyWQl72GyI3EQTnSeKFPTtgYS5rqk6uMZD0yTKOkGHgb0Ape0Pf
         TL6utOAOWIObULsR4ufbQ1+sxBGlnKBMWqxE7frncjeXWPAqWctzMpWGp6tFi9stWKzQ
         6M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPYCsGMeBTiPN9pOJ5LMApZIn6k2wD9Q3YWmBtml8QE=;
        b=FnqoKZdmLgPmKYutv3wXCjrRSi67ARfAj9HIhUq6FCQG+jE97qzIC4yowHEU0Mzc+i
         tIvDOHH2PBWgz5vOSFizu9qXR+6iEWBz+tOjo1ONyTs2T5l0viY7DJhjYGw82deQn/DD
         dKiyvqd/JlQPzTNgF2TCqJPGp1ov9sfnzhFqdwPJiO4yhusJx3pD2mb7YwBBGu7JqrAq
         y7ftGQEyLfgVvn2f/ZmNrNsjN0wKSA0OLTSSy4sTS4n+/OkUPsW3RqrYlvTZOydYYayc
         +3+K/AMLsRqT+kSWr5dCbYDm0oFLj7eC2CVoWF6FbHRwuXik59xZRscuCQP7ECtF5Blc
         2ypA==
X-Gm-Message-State: AO0yUKVlWTTS2g9T2BEJ3Cf3EcKbPw7M+cIZjR8Mlr7iTGFdNtE8upk3
	/MXSJ5xMmICPlr21p5/Mcd0jg5Ar4Mc=
X-Google-Smtp-Source: AK7set+QTjwryCVbsSQr32RjmQeAdXlFIteI8LnZIqM7lH+SpUsxV5Of3ROMxoBTa8a0P9/zRmJB0Q==
X-Received: by 2002:a17:907:2c66:b0:8f3:8bfd:a8e with SMTP id ib6-20020a1709072c6600b008f38bfd0a8emr684802ejc.26.1677264628225;
        Fri, 24 Feb 2023 10:50:28 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 08/14] x86/vmx: move vmx_update_debug_state() in vmcs.c and declare it static
Date: Fri, 24 Feb 2023 20:50:04 +0200
Message-Id: <20230224185010.3692754-9-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move vmx_update_debug_state() in vmcs.c because it is used only in this
file and limit its scope to this file by declaring it static and removing
its declaration from vmx.h.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - apply the change before moving the declarations into private headers
    to avoid churn, suggested by Jan

 xen/arch/x86/hvm/vmx/vmcs.c            | 12 ++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c             | 12 ------------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  1 -
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index ed71ecfb62..d3c75b3803 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1868,6 +1868,18 @@ void vmx_vmentry_failure(void)
 
 void noreturn vmx_asm_do_vmentry(void);
 
+static void vmx_update_debug_state(struct vcpu *v)
+{
+    if ( v->arch.hvm.debug_state_latch )
+        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
+    else
+        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
+
+    vmx_vmcs_enter(v);
+    vmx_update_exception_bitmap(v);
+    vmx_vmcs_exit(v);
+}
+
 void cf_check vmx_do_resume(void)
 {
     struct vcpu *v = current;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0ec33bcc18..294c8490b4 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1613,18 +1613,6 @@ static void cf_check vmx_update_host_cr3(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-void vmx_update_debug_state(struct vcpu *v)
-{
-    if ( v->arch.hvm.debug_state_latch )
-        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
-    else
-        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
-
-    vmx_vmcs_enter(v);
-    vmx_update_exception_bitmap(v);
-    vmx_vmcs_exit(v);
-}
-
 static void cf_check vmx_update_guest_cr(
     struct vcpu *v, unsigned int cr, unsigned int flags)
 {
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index f6308ed656..82a9487b40 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -88,7 +88,6 @@ void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
 struct hvm_emulate_ctxt;
 void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt);
 void vmx_realmode(struct cpu_user_regs *regs);
-void vmx_update_debug_state(struct vcpu *v);
 void vmx_update_exception_bitmap(struct vcpu *v);
 void vmx_update_cpu_exec_control(struct vcpu *v);
 void vmx_update_secondary_exec_control(struct vcpu *v);
-- 
2.37.2


