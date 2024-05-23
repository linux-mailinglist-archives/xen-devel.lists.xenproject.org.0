Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254978CD5A8
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728545.1133496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9ND-0004mq-Iz; Thu, 23 May 2024 14:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728545.1133496; Thu, 23 May 2024 14:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9ND-0004lG-GH; Thu, 23 May 2024 14:24:51 +0000
Received: by outflank-mailman (input) for mailman id 728545;
 Thu, 23 May 2024 14:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqR6=M2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sA9NB-0004l3-BD
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:24:49 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34883ece-1910-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 16:24:47 +0200 (CEST)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3d04c170118so384694b6e.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:24:47 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf34060csm1484523485a.134.2024.05.23.07.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 07:24:45 -0700 (PDT)
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
X-Inumbo-ID: 34883ece-1910-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716474285; x=1717079085; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/vVJIERTUJT3/5WM0EN643bbOtUFlyj/VZsiJqZsfo=;
        b=bV+2hTp7AVNgTSYYFGvMhuBJZRw5uAJ195Ln/tXzoW+h0K2L5SC6FSWhT/VKQvUNpY
         a0R3A7NMWW7+/Y9YrAhwg+UOlYoBZB/YVo478U9kWRFpJEaIKlKGyQDD8YHOuXyPAdP1
         LxrefDwU+LSdTtDpfCxDIadES8RK74UkFXEjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716474285; x=1717079085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/vVJIERTUJT3/5WM0EN643bbOtUFlyj/VZsiJqZsfo=;
        b=IBzpQMmCtj2XN9muJUM9msiFnJpXwKGj9qmmQ+ENN7fyYY3o+8qD9uKMGVi8xbTKFb
         uFhlFFXPuuvtOXO1WguuR74PKGjoL4t2fxLaJgKEY19lxtImmsp28SMWQwVnFyUk4Yv6
         gQdZ27CMAciSiPnWfFhNsT2xmqhxjXtmgB1QjLNd0yThckWT7j4McVKcRUFzasFlWpr2
         rS7eGB7IdWxLxZrdDOtSdPVGv26pUau4aLpuinpbDpqcu7w573zCXqfCWsYZrbpEVPOU
         QJn2s+8Vs19wLeLpbJU4iAgXWPNlPgL9sjZp54mhZ6fYS6gOuHS3CKU0etwgn5zhuFZz
         FNfg==
X-Gm-Message-State: AOJu0Yw0mMHiCXDt9JCGvJW3KrtnNyGg9vKSL35Hg5+rEfkXaJqyhX0r
	OF2GTLcI+DUauzalbzZrLvz2ffxWh9mzwQnWzh6H7+Wdq3jjkX+z/XQdKljf/bAaQS6gyWQhUr5
	KHNI=
X-Google-Smtp-Source: AGHT+IFNXYx/jlAMsCVqeI+2FvpqxM5ElEjllnxRzeZ3tonYcegJHwHwmFWr8aWBxq7U5EaDM5L58A==
X-Received: by 2002:a05:6808:6d4:b0:3c9:6967:bbed with SMTP id 5614622812f47-3cdb7414eebmr5048236b6e.28.1716474285588;
        Thu, 23 May 2024 07:24:45 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@cloud.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v2 1/2] x86/hvm/trace: Use a different trace type for AMD processors
Date: Thu, 23 May 2024 15:10:19 +0100
Message-Id: <20240523141020.2256177-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A long-standing usability sub-optimality with xenalyze is the
necessity to specify `--svm-mode` when analyzing AMD processors.  This
fundamentally comes about because the same trace event ID is used for
both VMX and SVM, but the contents of the trace must be interpreted
differently.

Instead, allocate separate trace events for VMX and SVM vmexits in
Xen; this will allow all readers to properly interpret the meaning of
the vmexit reason.

In xenalyze, first remove the redundant call to init_hvm_data();
there's no way to get to hvm_vmexit_process() without it being already
initialized by the set_vcpu_type call in hvm_process().

Replace this with set_hvm_exit_reson_data(), and move setting of
hvm->exit_reason_* into that function.

Modify hvm_process and hvm_vmexit_process to handle all four potential
values appropriately.

If SVM entries are encountered, set opt.svm_mode so that other
SVM-specific functionality is triggered.

Remove the `--svm-mode` command-line option, since it's now redundant.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
v2:
- Rebase to tip of staging
- Rebase over xentrace_format removal
- Fix typo in commit message
- Remove --svm-mode command-line flag

CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@cloud.com>
CC: Anthony Perard <anthony.perard@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/xenalyze.c  | 37 +++++++++++++++++++------------------
 xen/arch/x86/hvm/svm/svm.c |  4 ++--
 xen/arch/x86/hvm/vmx/vmx.c |  4 ++--
 xen/include/public/trace.h |  6 ++++--
 4 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index ce6a85d50b..9c4463b0e8 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -1437,14 +1437,6 @@ void init_hvm_data(struct hvm_data *h, struct vcpu_data *v) {
 
     h->init = 1;
 
-    if(opt.svm_mode) {
-        h->exit_reason_max = HVM_SVM_EXIT_REASON_MAX;
-        h->exit_reason_name = hvm_svm_exit_reason_name;
-    } else {
-        h->exit_reason_max = HVM_VMX_EXIT_REASON_MAX;
-        h->exit_reason_name = hvm_vmx_exit_reason_name;
-    }
-
     if(opt.histogram_interrupt_eip) {
         int count = ((1ULL<<ADDR_SPACE_BITS)/opt.histogram_interrupt_increment);
         size_t size = count * sizeof(int);
@@ -1462,6 +1454,18 @@ void init_hvm_data(struct hvm_data *h, struct vcpu_data *v) {
         h->summary.guest_interrupt[i].count=0;
 }
 
+void set_hvm_exit_reason_data(struct hvm_data *h, unsigned event) {
+    if (((event & ~TRC_64_FLAG) == TRC_HVM_SVM_EXIT) ||
+        opt.svm_mode) {
+        opt.svm_mode = 1;
+        h->exit_reason_max = HVM_SVM_EXIT_REASON_MAX;
+        h->exit_reason_name = hvm_svm_exit_reason_name;
+    } else {
+        h->exit_reason_max = HVM_VMX_EXIT_REASON_MAX;
+        h->exit_reason_name = hvm_vmx_exit_reason_name;
+    }
+}
+
 /* PV data */
 enum {
     PV_HYPERCALL=1,
@@ -5088,13 +5092,13 @@ void hvm_vmexit_process(struct record_info *ri, struct hvm_data *h,
 
     r = (typeof(r))ri->d;
 
-    if(!h->init)
-        init_hvm_data(h, v);
+    if(!h->exit_reason_name)
+        set_hvm_exit_reason_data(h, ri->event);
 
     h->vmexit_valid=1;
     bzero(&h->inflight, sizeof(h->inflight));
 
-    if(ri->event == TRC_HVM_VMEXIT64) {
+    if(ri->event & TRC_64_FLAG) {
         if(v->guest_paging_levels != 4)
         {
             if ( verbosity >= 6 )
@@ -5316,8 +5320,10 @@ void hvm_process(struct pcpu_info *p)
         break;
     default:
         switch(ri->event) {
-        case TRC_HVM_VMEXIT:
-        case TRC_HVM_VMEXIT64:
+        case TRC_HVM_VMX_EXIT:
+        case TRC_HVM_VMX_EXIT64:
+        case TRC_HVM_SVM_EXIT:
+        case TRC_HVM_SVM_EXIT64:
             UPDATE_VOLUME(p, hvm[HVM_VOL_VMEXIT], ri->size);
             hvm_vmexit_process(ri, h, v);
             break;
@@ -10884,11 +10890,6 @@ const struct argp_option cmd_opts[] =  {
       .arg = "HZ",
       .doc = "Cpu speed of the tracing host, used to convert tsc into seconds.", },
 
-    { .name = "svm-mode",
-      .key = OPT_SVM_MODE,
-      .group = OPT_GROUP_HARDWARE,
-      .doc = "Assume AMD SVM-style vmexit error codes.  (Default is Intel VMX.)", },
-
     { .name = "progress",
       .key = OPT_PROGRESS,
       .doc = "Progress dialog.  Requires the zenity (GTK+) executable.", },
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index db530d55f2..988250dbc1 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2571,10 +2571,10 @@ void asmlinkage svm_vmexit_handler(void)
     exit_reason = vmcb->exitcode;
 
     if ( hvm_long_mode_active(v) )
-        TRACE_TIME(TRC_HVM_VMEXIT64 | (vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0),
+        TRACE_TIME(TRC_HVM_SVM_EXIT64 | (vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0),
                    exit_reason, regs->rip, regs->rip >> 32);
     else
-        TRACE_TIME(TRC_HVM_VMEXIT | (vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0),
+        TRACE_TIME(TRC_HVM_SVM_EXIT | (vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0),
                    exit_reason, regs->eip);
 
     if ( vcpu_guestmode )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 8ba996546f..f16faa6a61 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4105,9 +4105,9 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
     __vmread(VM_EXIT_REASON, &exit_reason);
 
     if ( hvm_long_mode_active(v) )
-        TRACE_TIME(TRC_HVM_VMEXIT64, exit_reason, regs->rip, regs->rip >> 32);
+        TRACE_TIME(TRC_HVM_VMX_EXIT64, exit_reason, regs->rip, regs->rip >> 32);
     else
-        TRACE_TIME(TRC_HVM_VMEXIT, exit_reason, regs->eip);
+        TRACE_TIME(TRC_HVM_VMX_EXIT, exit_reason, regs->eip);
 
     perfc_incra(vmexits, (uint16_t)exit_reason);
 
diff --git a/xen/include/public/trace.h b/xen/include/public/trace.h
index 3c9f9c3c18..141efa0ea7 100644
--- a/xen/include/public/trace.h
+++ b/xen/include/public/trace.h
@@ -178,8 +178,10 @@
 /* trace events per subclass */
 #define TRC_HVM_NESTEDFLAG      (0x400)
 #define TRC_HVM_VMENTRY         (TRC_HVM_ENTRYEXIT + 0x01)
-#define TRC_HVM_VMEXIT          (TRC_HVM_ENTRYEXIT + 0x02)
-#define TRC_HVM_VMEXIT64        (TRC_HVM_ENTRYEXIT + TRC_64_FLAG + 0x02)
+#define TRC_HVM_VMX_EXIT        (TRC_HVM_ENTRYEXIT + 0x02)
+#define TRC_HVM_VMX_EXIT64      (TRC_HVM_ENTRYEXIT + TRC_64_FLAG + 0x02)
+#define TRC_HVM_SVM_EXIT        (TRC_HVM_ENTRYEXIT + 0x03)
+#define TRC_HVM_SVM_EXIT64      (TRC_HVM_ENTRYEXIT + TRC_64_FLAG + 0x03)
 #define TRC_HVM_PF_XEN          (TRC_HVM_HANDLER + 0x01)
 #define TRC_HVM_PF_XEN64        (TRC_HVM_HANDLER + TRC_64_FLAG + 0x01)
 #define TRC_HVM_PF_INJECT       (TRC_HVM_HANDLER + 0x02)
-- 
2.25.1


