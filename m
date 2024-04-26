Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF8D8B3A41
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 16:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712864.1113748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Mmu-0002to-Ea; Fri, 26 Apr 2024 14:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712864.1113748; Fri, 26 Apr 2024 14:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Mmu-0002s7-Ag; Fri, 26 Apr 2024 14:42:56 +0000
Received: by outflank-mailman (input) for mailman id 712864;
 Fri, 26 Apr 2024 14:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duI6=L7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s0Mms-0002dZ-Bl
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 14:42:54 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42fdc30d-03db-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 16:42:53 +0200 (CEST)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3c85a9b9143so269255b6e.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 07:42:53 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 wx37-20020a05620a5a6500b0078eebee6a49sm6391956qkn.85.2024.04.26.07.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 07:42:51 -0700 (PDT)
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
X-Inumbo-ID: 42fdc30d-03db-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714142572; x=1714747372; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6hh3P2uyic3vgOuJyagsjJaW2xzapo9RIMhFLkrQVk=;
        b=FRgzbS+OECTBofpGajWa3egnZvDi9zWORBJ1kNAcMjKD4I1SEA7PdIkvqcUMMlpbAk
         wAFGSr56wuv2IjyhbN3kEzKMIuw//oGqXd4NQ9RhxJq5tMVkm9LCiVZuAFaixqZeh3kC
         SK7n8aEbcEG76ZmXwEUJ0dQp5txBp73SLPNdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714142572; x=1714747372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6hh3P2uyic3vgOuJyagsjJaW2xzapo9RIMhFLkrQVk=;
        b=fC+B2K4cWH1KghoiEoN6ADGS4CfI9rkpRMTXg1w/BRYwajd+OvodwRbAwQOICexBxh
         6Ci5SrsQU1IM9DRTZ/Q6mYZijiojpYFAjMR28p5f9Bvw+IpYLrlqE4t3ilzcgpTSGcEu
         TOci6SlGelZZg409R8gbB0svrQSzPiytb+9o35O0aEj6JZQm1WuvhxG79g0CAj3Pbuj1
         Xd3petfSWn0JuaqcUVZM98Hqq9r2rtAVpmORNPKbnSwi+eYAtbKsayd08ylWPb6UFsRW
         DDequ9OWg2hRBKUuDCfD1rvEnqiTTCJ1XmgUffzIK8jTVtuK8Qxpsd89STDdHB3Jm0WS
         FSHw==
X-Gm-Message-State: AOJu0YwTT7S6hzIq/SACsh0kQrsCaXuOIuPHFtIdtt6xscyeOxtWTPjE
	hEWh9A0Tghy298IpEg6lM87AScT6v/7cN8o7KSFgcATUeziH2pUr8i+9kB3T/ePDXh3jJAs30Po
	V
X-Google-Smtp-Source: AGHT+IGzoD8bbSfLTon66jlT202gVDox1iG00dlVPTM6Q1vf5Bw39OuKmrus76DiehPwIO4pmtVdfw==
X-Received: by 2002:a05:6808:618f:b0:3c6:29b:fe7a with SMTP id dn15-20020a056808618f00b003c6029bfe7amr2911208oib.18.1714142572046;
        Fri, 26 Apr 2024 07:42:52 -0700 (PDT)
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
Subject: [PATCH 1/3] x86/hvm/trace: Use a different trace type for AMD processors
Date: Fri, 26 Apr 2024 15:32:29 +0100
Message-Id: <20240426143231.4007671-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426143231.4007671-1-george.dunlap@cloud.com>
References: <20240426143231.4007671-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A long-standing usability sub-optimality with xenalyze is the
necessity to specify `--svm-mode` when analyzing AMD processors.  This
fundamentally comes about because the same trace event ID is used for
both VMX and SVM, but the contents of the trace must be interpreted
differently.

Instead, allocate separate trace events for VMX and SVM vmexits in
Xen; this will allow all readers to properly intrepret the meaning of
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

Also add lines in `formats` for xentrace_format.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
NB that this patch goes on top of Andrew's trace cleanup series:

https://lore.kernel.org/xen-devel/20240318163552.3808695-1-andrew.cooper3@citrix.com/

CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@cloud.com>
CC: Anthony Perard <anthony.perard@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/formats     |  6 ++++--
 tools/xentrace/xenalyze.c  | 32 +++++++++++++++++++-------------
 xen/arch/x86/hvm/svm/svm.c |  4 ++--
 xen/arch/x86/hvm/vmx/vmx.c |  4 ++--
 xen/include/public/trace.h |  6 ++++--
 5 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/tools/xentrace/formats b/tools/xentrace/formats
index afb5ee0112..3381c1cda5 100644
--- a/tools/xentrace/formats
+++ b/tools/xentrace/formats
@@ -90,8 +90,10 @@
 0x00041002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  domain_destroy  [ dom = 0x%(1)08x ]
 
 0x00081001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMENTRY
-0x00081002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMEXIT      [ exitcode = 0x%(1)08x, rIP  = 0x%(2)08x ]
-0x00081102  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMEXIT      [ exitcode = 0x%(1)08x, rIP  = 0x%(3)08x%(2)08x ]
+0x00081002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMX_EXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(2)08x ]
+0x00081102  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMX_EXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(3)08x%(2)08x ]
+0x00081003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  SVM_EXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(2)08x ]
+0x00081103  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  SVM_EXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(3)08x%(2)08x ]
 0x00081401  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  nVMENTRY
 0x00081402  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  nVMEXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(2)08x ]
 0x00081502  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  nVMEXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(3)08x%(2)08x ]
diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index ce6a85d50b..ceb07229d1 100644
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
index e5bfb2421e..c2b94e343f 100644
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


