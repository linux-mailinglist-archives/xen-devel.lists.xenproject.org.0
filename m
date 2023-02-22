Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95D369F3D5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499405.770601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnl-0002cl-08; Wed, 22 Feb 2023 12:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499405.770601; Wed, 22 Feb 2023 12:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnk-0002Y7-Qm; Wed, 22 Feb 2023 12:00:48 +0000
Received: by outflank-mailman (input) for mailman id 499405;
 Wed, 22 Feb 2023 12:00:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q6c=6S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUnnj-0000FF-ED
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:00:47 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a9eec1c-b2a8-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 13:00:46 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id s26so29310229edw.11
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:00:46 -0800 (PST)
Received: from uni.router.wind (adsl-161.109.242.137.tellas.gr.
 [109.242.137.161]) by smtp.googlemail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2133171ejb.38.2023.02.22.04.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:00:46 -0800 (PST)
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
X-Inumbo-ID: 8a9eec1c-b2a8-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pd1IsfmVUdREn+72l4bwA5xZ7W4U+B+UhoBSO74jgE=;
        b=jWyKf+veZsmd3eCAewTS++qu/E0UeyXv9OpPq7y1RFbQ1VWOh9rgxLvwCbBtlc1OZH
         P7u/sImEOhlCZo8JeXMB+yoEec4K++xBh86QakWRy39nmkWPebjnDWTGAe0WIs1NaVeD
         MsocwW0MKPFgZD+vSRdeiRf+itlYRYln7FCaOTgwJ9sCSfNlAGdT2J7U5KWGxkFOsWe4
         NX6iYuAIPjG0PCHZ/mmbM1qGBahuRbe5XY0m3TBmV1ymDewmmbmbQ3iFumTT8ASr71XU
         9rYiXTv2qoLlLiNanWUXKVxFJJcAa+92G+vHFXmSS66XoIZxJTU8WXZ0KHjj7jGMD6+X
         NhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pd1IsfmVUdREn+72l4bwA5xZ7W4U+B+UhoBSO74jgE=;
        b=4p/T2o9YBvcEWVfIKCVUT26P/6bgMhCSWJg/xEmHkuWSOWSGn58S+imM/fXh7yw2/5
         V+RtcZXfhoGe+cKOHUvjUtsqGmmVaq2jSvH9MtM3alhn2eact3DsJMIKV730cc7J3qnB
         ZUVrA4QPMbDR/pJlb4vpltPoedICf/KHyhxGGi1HNNFaRH3u/cb8ssFQVWreQaDEideD
         9N5TiQj+r+wi5RWCTQRlirxI84UIRoTMDfoie9oBWTQuKp/2MPOhtEiOF+8KL21omfXg
         rVGoA3E4H+mH+D+ieiVO24nlHpRH7+K5bUQ+cMZWLVEuV7UKGQlDou6jAOmoxln1s+RZ
         VSwg==
X-Gm-Message-State: AO0yUKUp7iJr5EtgcdPWmdz86eK20W7cTKfGIjovf41JD2fP6KGepatF
	AQ0TK0p0W/mVwoSEzkvOF0p/cN5P+70=
X-Google-Smtp-Source: AK7set+0rv8noKcn8UZ+q7u6JZExNgzfSC62/oG5lYFS8qdKZbCXE6opqMRYfhM4q7OAxWihjU8TNA==
X-Received: by 2002:a17:907:ea2:b0:88d:33fe:3306 with SMTP id ho34-20020a1709070ea200b0088d33fe3306mr21202519ejc.31.1677067246331;
        Wed, 22 Feb 2023 04:00:46 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 9/9] x86/vmx: move vmx_update_debug_state() in vmcs.c and declare it static
Date: Wed, 22 Feb 2023 14:00:23 +0200
Message-Id: <20230222120023.3004624-10-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222120023.3004624-1-burzalodowa@gmail.com>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move vmx_update_debug_state() in vmcs.c because it is used only in this
file and limit its scope to this file by declaring it static and removing
its declaration from private vmx.h

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - remove it from the private vmx.h header instead of the global one

 xen/arch/x86/hvm/vmx/vmcs.c | 12 ++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c  | 12 ------------
 xen/arch/x86/hvm/vmx/vmx.h  |  1 -
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index bc2acd3063..1492f85213 100644
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
index 5b210e0db4..ada36d6923 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1610,18 +1610,6 @@ static void cf_check vmx_update_host_cr3(struct vcpu *v)
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
diff --git a/xen/arch/x86/hvm/vmx/vmx.h b/xen/arch/x86/hvm/vmx/vmx.h
index ffc19539bc..7d4ecf6d59 100644
--- a/xen/arch/x86/hvm/vmx/vmx.h
+++ b/xen/arch/x86/hvm/vmx/vmx.h
@@ -14,7 +14,6 @@ void vmx_intr_assist(void);
 void noreturn cf_check vmx_do_resume(void);
 void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
 void vmx_realmode(struct cpu_user_regs *regs);
-void vmx_update_debug_state(struct vcpu *v);
 void vmx_update_exception_bitmap(struct vcpu *v);
 void vmx_update_cpu_exec_control(struct vcpu *v);
 void vmx_update_secondary_exec_control(struct vcpu *v);
-- 
2.37.2


