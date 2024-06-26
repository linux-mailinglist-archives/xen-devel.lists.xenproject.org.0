Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8854F918384
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749020.1157084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTAA-0003mB-9e; Wed, 26 Jun 2024 13:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749020.1157084; Wed, 26 Jun 2024 13:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA9-0003XQ-Rb; Wed, 26 Jun 2024 13:58:17 +0000
Received: by outflank-mailman (input) for mailman id 749020;
 Wed, 26 Jun 2024 13:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMTA7-0000aq-LN
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:15 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21be66db-33c4-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:58:15 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-79c04e6e1b9so145459685a.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:15 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:13 -0700 (PDT)
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
X-Inumbo-ID: 21be66db-33c4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410294; x=1720015094; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=no+X6902JG1x7fj9iA4/toVtrkKWwuLeqtvhWCBHqWU=;
        b=QqqW2wI7R9S5p1b0r7zHB4rVrciwQpkHuA3wA+7NBp55AcVywLz9NcWT0qh4Rnm1Au
         CJxpVFOhII/Al29nhHNazKKjL40KVuSX88iE2XOym99FJZxxP7NRf22+r5CfMzNAcYO5
         GMoRZ7YlPP9RzujPNHdZHLBd44DdFKvXbzzEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410294; x=1720015094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=no+X6902JG1x7fj9iA4/toVtrkKWwuLeqtvhWCBHqWU=;
        b=voHWOpR/XeV9lUo1LkW8u0CBIa34xmLAZAZ8HdIdfILydO6Hrat773ErcP6KbI66kQ
         NyAYXqeAIKEQ4PKYCoIyEopyhfXEFf23TgdbP0JeZI5SHCfiq6tTP7Af9l6zxw3+Q6o8
         ozCAnQKWT07S+QvNUPQwtSvUFXYXegLm9dyeyzgqpYpXbljbxfnqex+quXoNeO9px+8u
         MwrIUGMD+HapxeF4PTM4rn/YrA5ScU0IeX2G/kS7aya1oV6qFhVqMNB3gdlcGuDP1jNg
         NZ7R7u9YnwOPh9FQUu6AcVMRQ7AvFHLPLqdfwyJcfThfT9LSHY2wYYGsc2bWsJHd4u81
         +oMQ==
X-Gm-Message-State: AOJu0Yx2CWAPjSmJXLUwKA9jmgfZYrvPxqnt6aXcvR3qQXTLl2wcCEYb
	Fes4PGMtguDhGV8OM3DEmB49Dy04pf1vIj9a4G1BZe2DO1mZLZ1hTXtagFEHY3N2QREDH4MPqYx
	W2WY=
X-Google-Smtp-Source: AGHT+IH904eHMI1zSSqNbKZPKyIjtzLTWlNqjr6c8ygXrMuor5Jj4QVS7saH0tsJmAnDi0imhmjWGQ==
X-Received: by 2002:a05:620a:424c:b0:792:952b:6310 with SMTP id af79cd13be357-79be0c6b8b3mr1288300585a.45.1719410293810;
        Wed, 26 Jun 2024 06:58:13 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 13/14] x86/svm: Add a trace for VMEXIT_VMRUN
Date: Wed, 26 Jun 2024 14:38:52 +0100
Message-Id: <20240626133853.4150731-14-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note that this trace is SVM-specific. Most HVM handler traces are
shared between VMX and SVM because the underlying instruction set is
largely the equivalent; but in this case, the instructions are
different enough that there's no sensible way to share HVM handler
traces between them.

Keeping the target VMCB address should allow future analysis of which
L2 vcpu within an L1 is running.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 tools/xentrace/xenalyze.c  | 20 +++++++++++++++++++-
 xen/arch/x86/hvm/svm/svm.c |  2 ++
 xen/include/public/trace.h |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index d0e2788727..d1988b4232 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -952,6 +952,7 @@ enum {
     HVM_EVENT_VLAPIC,
     HVM_EVENT_XCR_READ,
     HVM_EVENT_XCR_WRITE,
+    HVM_EVENT_VMRUN,
     HVM_EVENT_HANDLER_MAX
 };
 const char * hvm_event_handler_name[HVM_EVENT_HANDLER_MAX] = {
@@ -989,7 +990,8 @@ const char * hvm_event_handler_name[HVM_EVENT_HANDLER_MAX] = {
     "trap_debug",
     "vlapic",
     "xcr_read",
-    "xcr_write"
+    "xcr_write",
+    "vmrun"
 };
 
 enum {
@@ -4610,6 +4612,19 @@ void hvm_rdtsc_process(struct record_info *ri, struct hvm_data *h)
     h->last_rdtsc = r->tsc;
 }
 
+
+void hvm_vmrun_process(struct record_info *ri, struct hvm_data *h)
+{
+    struct {
+        uint64_t vmcbaddr;
+    } *r = (typeof(r))h->d;
+
+    if ( opt.dump_all )
+        printf(" %s vmrun %llx\n",
+               ri->dump_header,
+               (unsigned long long)r->vmcbaddr);
+}
+
 void hvm_generic_summary(struct hvm_data *h, void *data)
 {
     long evt = (long)data;
@@ -4910,6 +4925,9 @@ needs_vmexit:
     case TRC_HVM_RDTSC:
         hvm_rdtsc_process(ri, h);
         break;
+    case TRC_HVM_VMRUN:
+        hvm_vmrun_process(ri, h);
+        break;
     case TRC_HVM_DR_READ:
     case TRC_HVM_DR_WRITE:
     case TRC_HVM_CPUID:
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 240401dc77..39af0ffdd6 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2177,6 +2177,8 @@ svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
         return;
     }
 
+    TRACE(TRC_HVM_VMRUN, vmcbaddr, vmcbaddr >> 32);
+
     vcpu_nestedhvm(v).nv_vmentry_pending = 1;
     return;
 }
diff --git a/xen/include/public/trace.h b/xen/include/public/trace.h
index 141efa0ea7..19a29a5929 100644
--- a/xen/include/public/trace.h
+++ b/xen/include/public/trace.h
@@ -222,6 +222,7 @@
 #define TRC_HVM_VLAPIC           (TRC_HVM_HANDLER + 0x25)
 #define TRC_HVM_XCR_READ64      (TRC_HVM_HANDLER + TRC_64_FLAG + 0x26)
 #define TRC_HVM_XCR_WRITE64     (TRC_HVM_HANDLER + TRC_64_FLAG + 0x27)
+#define TRC_HVM_VMRUN           (TRC_HVM_HANDLER + 0x28)
 
 #define TRC_HVM_IOPORT_WRITE    (TRC_HVM_HANDLER + 0x216)
 #define TRC_HVM_IOMEM_WRITE     (TRC_HVM_HANDLER + 0x217)
-- 
2.25.1


