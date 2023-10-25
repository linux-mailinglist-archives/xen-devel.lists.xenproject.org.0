Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD267D7455
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623204.970918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja7-0005Ep-5t; Wed, 25 Oct 2023 19:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623204.970918; Wed, 25 Oct 2023 19:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja5-00050G-W7; Wed, 25 Oct 2023 19:30:17 +0000
Received: by outflank-mailman (input) for mailman id 623204;
 Wed, 25 Oct 2023 19:30:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvja0-0000YO-PY
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:12 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea6845ae-736c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:30:12 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b95622c620so24457066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:12 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:11 -0700 (PDT)
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
X-Inumbo-ID: ea6845ae-736c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262211; x=1698867011; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nnj94eBCueSGzdSoAmtrm7fV0B+qdR+A2YxTRCOPiA=;
        b=kCbNBmAjp6mYFPR1sBLeqwdtzZ5mHWEvtQAyrVojFttpVpmxiqW8gir9pSjybZNxAl
         rvQAAOAwuSdbA2f9ZD6+zWRIVaDZMBHn0vQWMLiRwRNYdHWC9hv1dY2JQLdPlXrhpZae
         EZgzw5eUtJP6+/RT7rxg4JUsnyE+KIHi9hOCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262211; x=1698867011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nnj94eBCueSGzdSoAmtrm7fV0B+qdR+A2YxTRCOPiA=;
        b=h3Abpx2VuWm6qaR9QWU9nVlw8gdTw6b7hCmSzyxW1Up4wXnxH6ZABzfFROfZGHKeYo
         WM22GEC+ktvtlNJraryqNGAlMdVQeSseViOO1HjryKBhN8wIad75IoHwJ5AG7JEgl9pg
         lM1m97kSlyLnL0vQEGWo8RuFKflIxrqE2LiSvRGcdAqqDuJHOFXX8gVjCXKpw/Fd9Ylt
         oPQ+eEa7W0ApkWrSCLkSYMSrID80vjOzoB/OuoLEHo/0E1ZxXhuPF6J4PbWCLQlkA70T
         n2Mnwn7xokZOMfH0uoQA/bQf9Ru8leeE6H+5DMfvNeEPBJh30JRm6B4Nk+aLMqEey0ve
         0V3w==
X-Gm-Message-State: AOJu0Yy/Eb/jUZvw4khWfmOnAg0BW/6bjvxmK4UnSMNR0aoT1XnhtMUw
	1Q12qbcZRtEkmuAern6qliNM7Z5QTbG4dpy6YQ0xsA==
X-Google-Smtp-Source: AGHT+IEpDexz4pu9AN7h/Al6z/4coqxRpbpAap8jC+a2WblgSDzd8wrU1Mnw0oODEMQUOaDbuG4GsA==
X-Received: by 2002:a17:907:3f85:b0:9be:6ff7:128a with SMTP id hr5-20020a1709073f8500b009be6ff7128amr13011659ejc.67.1698262211740;
        Wed, 25 Oct 2023 12:30:11 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 17/22] x86/PMUv4: IA32_PERF_GLOBAL_{STATUS_SET, INUSE} support
Date: Wed, 25 Oct 2023 20:29:47 +0100
Message-Id: <586661cb0604d638972e57de039456c85371ed97.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Expose thse MSRs to the guest when PMU version is >= 4.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu/vpmu_intel.c  | 20 +++++++++++++++++++-
 xen/arch/x86/hvm/vmx/vmx.c     |  5 +++++
 xen/arch/x86/pv/emul-priv-op.c |  5 +++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 923fe42a0b..5e660af395 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -171,6 +171,8 @@ static int is_core2_vpmu_msr(u32 msr_index, int *type, int *index)
     case MSR_CORE_PERF_GLOBAL_CTRL:
     case MSR_CORE_PERF_GLOBAL_STATUS:
     case MSR_CORE_PERF_GLOBAL_OVF_CTRL:
+    case MSR_CORE_PERF_GLOBAL_STATUS_SET:
+    case MSR_CORE_PERF_GLOBAL_INUSE:
         *type = MSR_TYPE_GLOBAL;
         return 1;
 
@@ -545,10 +547,21 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
         core2_vpmu_cxt->global_status &= ~msr_content;
         wrmsrl(MSR_CORE_PERF_GLOBAL_OVF_CTRL, msr_content);
         return 0;
+    case MSR_CORE_PERF_GLOBAL_STATUS_SET:
+        if ( (v->domain->arch.cpuid->basic.pmu_version < 4) ||
+             (msr_content & global_ovf_ctrl_mask) )
+            return -EINVAL;
+        core2_vpmu_cxt->global_status |= msr_content;
+        wrmsrl(MSR_CORE_PERF_GLOBAL_STATUS_SET, msr_content);
+        return 0;
     case MSR_CORE_PERF_GLOBAL_STATUS:
         gdprintk(XENLOG_INFO, "Can not write readonly MSR: "
                  "MSR_PERF_GLOBAL_STATUS(0x38E)!\n");
         return -EINVAL;
+    case MSR_CORE_PERF_GLOBAL_INUSE:
+        gdprintk(XENLOG_INFO, "Can not write readonly MSR: "
+                 "MSR_PERF_GLOBAL_INUSE(0x392)!\n");
+        return -EINVAL;
     case MSR_IA32_PEBS_ENABLE:
         if ( vpmu_features & (XENPMU_FEATURE_IPC_ONLY |
                               XENPMU_FEATURE_ARCH_ONLY) )
@@ -688,7 +701,8 @@ static int cf_check core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
         core2_vpmu_cxt = vpmu->context;
         switch ( msr )
         {
-        case MSR_CORE_PERF_GLOBAL_OVF_CTRL:
+        case MSR_CORE_PERF_GLOBAL_OVF_CTRL: /* FALLTHROUGH */
+        case MSR_CORE_PERF_GLOBAL_STATUS_SET:
             *msr_content = 0;
             break;
         case MSR_CORE_PERF_GLOBAL_STATUS:
@@ -700,6 +714,10 @@ static int cf_check core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
             else
                 rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, *msr_content);
             break;
+        case MSR_CORE_PERF_GLOBAL_INUSE:
+            if ( v->domain->arch.cpuid->basic.pmu_version < 4 )
+                return -EINVAL;
+            /* FALLTHROUGH */
         default:
             rdmsrl(msr, *msr_content);
         }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index cd772585fe..af70ed8f30 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3375,6 +3375,8 @@ static int cf_check vmx_msr_read_intercept(
     case MSR_CORE_PERF_FIXED_CTR_CTRL...MSR_CORE_PERF_GLOBAL_OVF_CTRL:
     case MSR_IA32_PEBS_ENABLE:
     case MSR_IA32_DS_AREA:
+    case MSR_CORE_PERF_GLOBAL_STATUS_SET:
+    case MSR_CORE_PERF_GLOBAL_INUSE:
         if ( vpmu_do_rdmsr(msr, msr_content) )
             goto gp_fault;
         break;
@@ -3698,6 +3700,9 @@ static int cf_check vmx_msr_write_intercept(
     case MSR_IA32_PEBS_ENABLE:
     case MSR_IA32_DS_AREA:
          if ( vpmu_do_wrmsr(msr, msr_content) )
+    case MSR_CORE_PERF_GLOBAL_STATUS_SET:
+    case MSR_CORE_PERF_GLOBAL_INUSE:
+         if ( vpmu_do_wrmsr(msr, msr_content) )
             goto gp_fault;
         break;
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 09bfde1060..105485bb1e 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -968,6 +968,9 @@ static int cf_check read_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL_LAST:
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTRn:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
+    case MSR_IA32_PEBS_ENABLE:
+    case MSR_CORE_PERF_GLOBAL_STATUS_SET:
+    case MSR_CORE_PERF_GLOBAL_INUSE:
         if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
@@ -1148,6 +1151,8 @@ static int cf_check write_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL_LAST:
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTRn:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
+    case MSR_CORE_PERF_GLOBAL_STATUS_SET:
+    case MSR_CORE_PERF_GLOBAL_INUSE:
         if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
-- 
2.41.0


