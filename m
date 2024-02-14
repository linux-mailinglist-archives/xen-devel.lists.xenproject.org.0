Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD38547D3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:14:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680577.1058566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDDP-0004sd-IL; Wed, 14 Feb 2024 11:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680577.1058566; Wed, 14 Feb 2024 11:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDDP-0004r7-F5; Wed, 14 Feb 2024 11:14:11 +0000
Received: by outflank-mailman (input) for mailman id 680577;
 Wed, 14 Feb 2024 11:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FFc2=JX=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1raDDO-0004r1-1b
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:14:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b531974-cb2a-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 12:14:08 +0100 (CET)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-R1r3iXM5OYagLtERndrv8Q-1; Wed, 14 Feb 2024 06:14:04 -0500
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a30f9374db7so67610166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:14:04 -0800 (PST)
Received: from redhat.com ([2.52.26.67]) by smtp.gmail.com with ESMTPSA id
 gv24-20020a170906f11800b00a3bd8a34b1bsm2212432ejb.164.2024.02.14.03.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:14:00 -0800 (PST)
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
X-Inumbo-ID: 2b531974-cb2a-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707909246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c1T4mZW1Lt2fEcvTpJpGMJKvoac/0r1T6DraMR3Q2iM=;
	b=Z0S/q/Hkq2hpqo+Ygzs19Z1NaYy7ISdPxio7KCmGppHj8+qybZ0NFYXH2aKKxRa629oTxC
	XZnUDCukMDBA4QXy2gtYPFonultbGhHPGpI8SI789gTm/PVqMUdAT42aJEYWoIQeGoQm5J
	VPwxSorK6tvFSRqplKOr4YTafjolMAc=
X-MC-Unique: R1r3iXM5OYagLtERndrv8Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707909243; x=1708514043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1T4mZW1Lt2fEcvTpJpGMJKvoac/0r1T6DraMR3Q2iM=;
        b=kRpQ0pQZFMtN5oPgs5KcZQWGSKA16ldZyQTRZEeFAD3kXqvLkr/KrNtjtyuH+F3FXu
         DHNnLYPTsyc7jBYw8Fd4jOKHWlYPGTkgszTFGbPF50NyuzNI0JjxhDwN3VC4zJpPXlhS
         XrlJJ3SRNQ/BDRtwnYTdSJVJbl8C89nHPt6p5qlowxS3W9j0f7GR75aLPCj0h1/7vF+6
         2rB14F6uihRLKMJexuNr17zcemCONp/veiwt9TLpDFEqzSSjiYBpSQ/j3qr1bu/RIylK
         dkbrMedpUv3FQH0+P1xuD/u8t2x9K0vPJaoKbEllZKFNIaJqktb2sBQRP6Y9VqF3+c7m
         uQPA==
X-Forwarded-Encrypted: i=1; AJvYcCVjzwZbEZFeXSGMtRuZmFupdHxtO51Y32lWcFC2XmclElPFEZ9/MwERatH0VKCafeviJWdu357XDGZlR6fsqmEi8za0t58uZnWS6ASOrUs=
X-Gm-Message-State: AOJu0YxdsbXRoV8l6xAp6JDbO2I4j17CkHQC2ZMez/3SJg6Uo92Ym/lG
	ZYjHXPXDPpXAi37s1GUFc1z44qLYEBF3ZuOR4HfGSgu8WTd+pM+5bgNpvVDaG3+/ihm2gExH8eZ
	Os5kSVHLr3OAmflaiCa0fMDQLr0KYgWPlzqjUXjmDEQ0k+qmZSj+7OM4P6GqJIZ0M
X-Received: by 2002:a17:906:aacb:b0:a3c:d0d0:4602 with SMTP id kt11-20020a170906aacb00b00a3cd0d04602mr1474604ejb.6.1707909243471;
        Wed, 14 Feb 2024 03:14:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8PGa8fe+YzlQNsaQxLZwEWdxHc893kIKDULDI4XVDmy08H/IvVqWGbByMSYsf44RIBF6RxQ==
X-Received: by 2002:a17:906:aacb:b0:a3c:d0d0:4602 with SMTP id kt11-20020a170906aacb00b00a3cd0d04602mr1474559ejb.6.1707909242253;
        Wed, 14 Feb 2024 03:14:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzRh2VKZgo8A+woJ9nPu2okdk+XErDylKqAwVKf+sraUsUJAczLmragZ3ncuj+Z6gPCv/6xLKry8uh0vcpB7oLoDWlHlKxDV1VU2kqdG7uW+KLSabxeWUYT0SJzIB8y5XTgOIhWIJoZyEJWTP7pIVzIPL9arbFi8oUEQJWNIwMy37kApC/rRlAPXUHbU75UO8npXBekk5cXAm+Zo7QQfoKktb99+icWJ8zFp6+HqJcuTP6Z95etyaO2pW2Hlji3fBUmakvB0UwdaD9NzPFIOknAMjRD/w9UM2GtuI+bD0a+H3DWT3O9EuqWWeL9phyZZ4edKF2UUA2k46f1aQhrj08zjpcdxPAXKMBomkkOgSwmAl40S95V6ImclLcuJ6meqzuR+YL2w==
Date: Wed, 14 Feb 2024 06:13:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Bui Quang Minh <minhquangbui99@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	xen-devel@lists.xenproject.org
Subject: [PULL 14/60] apic, i386/tcg: add x2apic transitions
Message-ID: <774204cf9874e58dc7fc13394a505452357750ad.1707909001.git.mst@redhat.com>
References: <cover.1707909001.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1707909001.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Bui Quang Minh <minhquangbui99@gmail.com>

This commit adds support for x2APIC transitions when writing to
MSR_IA32_APICBASE register and finally adds CPUID_EXT_X2APIC to
TCG_EXT_FEATURES.

The set_base in APICCommonClass now returns an integer to indicate error in
execution. apic_set_base return -1 on invalid APIC state transition,
accelerator can use this to raise appropriate exception.

Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
Message-Id: <20240111154404.5333-4-minhquangbui99@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/apic.h               |  2 +-
 include/hw/i386/apic_internal.h      |  2 +-
 target/i386/cpu.h                    |  4 ++
 hw/i386/kvm/apic.c                   |  3 +-
 hw/i386/xen/xen_apic.c               |  3 +-
 hw/intc/apic.c                       | 62 +++++++++++++++++++++++++++-
 hw/intc/apic_common.c                | 13 +++---
 target/i386/cpu.c                    |  9 ++--
 target/i386/tcg/sysemu/misc_helper.c | 14 ++++++-
 target/i386/whpx/whpx-apic.c         |  3 +-
 10 files changed, 96 insertions(+), 19 deletions(-)

diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
index c8ca41ab44..f6e7489f2d 100644
--- a/include/hw/i386/apic.h
+++ b/include/hw/i386/apic.h
@@ -8,7 +8,7 @@ int apic_accept_pic_intr(DeviceState *s);
 void apic_deliver_pic_intr(DeviceState *s, int level);
 void apic_deliver_nmi(DeviceState *d);
 int apic_get_interrupt(DeviceState *s);
-void cpu_set_apic_base(DeviceState *s, uint64_t val);
+int cpu_set_apic_base(DeviceState *s, uint64_t val);
 uint64_t cpu_get_apic_base(DeviceState *s);
 void cpu_set_apic_tpr(DeviceState *s, uint8_t val);
 uint8_t cpu_get_apic_tpr(DeviceState *s);
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index e796e6cae3..d6e85833da 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -137,7 +137,7 @@ struct APICCommonClass {
 
     DeviceRealize realize;
     DeviceUnrealize unrealize;
-    void (*set_base)(APICCommonState *s, uint64_t val);
+    int (*set_base)(APICCommonState *s, uint64_t val);
     void (*set_tpr)(APICCommonState *s, uint8_t val);
     uint8_t (*get_tpr)(APICCommonState *s);
     void (*enable_tpr_reporting)(APICCommonState *s, bool enable);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 08eaa61c56..dfe43b8204 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -379,6 +379,10 @@ typedef enum X86Seg {
 #define MSR_IA32_APICBASE_ENABLE        (1<<11)
 #define MSR_IA32_APICBASE_EXTD          (1 << 10)
 #define MSR_IA32_APICBASE_BASE          (0xfffffU<<12)
+#define MSR_IA32_APICBASE_RESERVED \
+        (~(uint64_t)(MSR_IA32_APICBASE_BSP | MSR_IA32_APICBASE_ENABLE \
+                     | MSR_IA32_APICBASE_EXTD | MSR_IA32_APICBASE_BASE))
+
 #define MSR_IA32_FEATURE_CONTROL        0x0000003a
 #define MSR_TSC_ADJUST                  0x0000003b
 #define MSR_IA32_SPEC_CTRL              0x48
diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index 1e89ca0899..a72c28e8a7 100644
--- a/hw/i386/kvm/apic.c
+++ b/hw/i386/kvm/apic.c
@@ -95,9 +95,10 @@ void kvm_get_apic_state(DeviceState *dev, struct kvm_lapic_state *kapic)
     apic_next_timer(s, s->initial_count_load_time);
 }
 
-static void kvm_apic_set_base(APICCommonState *s, uint64_t val)
+static int kvm_apic_set_base(APICCommonState *s, uint64_t val)
 {
     s->apicbase = val;
+    return 0;
 }
 
 static void kvm_apic_set_tpr(APICCommonState *s, uint8_t val)
diff --git a/hw/i386/xen/xen_apic.c b/hw/i386/xen/xen_apic.c
index 7c7a60b166..101e16a766 100644
--- a/hw/i386/xen/xen_apic.c
+++ b/hw/i386/xen/xen_apic.c
@@ -49,8 +49,9 @@ static void xen_apic_realize(DeviceState *dev, Error **errp)
     msi_nonbroken = true;
 }
 
-static void xen_apic_set_base(APICCommonState *s, uint64_t val)
+static int xen_apic_set_base(APICCommonState *s, uint64_t val)
 {
+    return 0;
 }
 
 static void xen_apic_set_tpr(APICCommonState *s, uint8_t val)
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 178fb26b47..1d887d66b8 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -308,8 +308,49 @@ bool is_x2apic_mode(DeviceState *dev)
     return s->apicbase & MSR_IA32_APICBASE_EXTD;
 }
 
-static void apic_set_base(APICCommonState *s, uint64_t val)
+static int apic_set_base_check(APICCommonState *s, uint64_t val)
 {
+    /* Enable x2apic when x2apic is not supported by CPU */
+    if (!cpu_has_x2apic_feature(&s->cpu->env) &&
+        val & MSR_IA32_APICBASE_EXTD) {
+        return -1;
+    }
+
+    /*
+     * Transition into invalid state
+     * (s->apicbase & MSR_IA32_APICBASE_ENABLE == 0) &&
+     * (s->apicbase & MSR_IA32_APICBASE_EXTD) == 1
+     */
+    if (!(val & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_EXTD)) {
+        return -1;
+    }
+
+    /* Invalid transition from disabled mode to x2APIC */
+    if (!(s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        !(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_EXTD)) {
+        return -1;
+    }
+
+    /* Invalid transition from x2APIC to xAPIC */
+    if ((s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        (s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_ENABLE) &&
+        !(val & MSR_IA32_APICBASE_EXTD)) {
+        return -1;
+    }
+
+    return 0;
+}
+
+static int apic_set_base(APICCommonState *s, uint64_t val)
+{
+    if (apic_set_base_check(s, val) < 0) {
+        return -1;
+    }
+
     s->apicbase = (val & 0xfffff000) |
         (s->apicbase & (MSR_IA32_APICBASE_BSP | MSR_IA32_APICBASE_ENABLE));
     /* if disabled, cannot be enabled again */
@@ -318,6 +359,25 @@ static void apic_set_base(APICCommonState *s, uint64_t val)
         cpu_clear_apic_feature(&s->cpu->env);
         s->spurious_vec &= ~APIC_SV_ENABLE;
     }
+
+    /* Transition from disabled mode to xAPIC */
+    if (!(s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_ENABLE)) {
+        s->apicbase |= MSR_IA32_APICBASE_ENABLE;
+        cpu_set_apic_feature(&s->cpu->env);
+    }
+
+    /* Transition from xAPIC to x2APIC */
+    if (cpu_has_x2apic_feature(&s->cpu->env) &&
+        !(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_EXTD)) {
+        s->apicbase |= MSR_IA32_APICBASE_EXTD;
+
+        s->log_dest = ((s->initial_apic_id & 0xffff0) << 16) |
+                      (1 << (s->initial_apic_id & 0xf));
+    }
+
+    return 0;
 }
 
 static void apic_set_tpr(APICCommonState *s, uint8_t val)
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 3c43ac9a1d..16ab40a35f 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -35,20 +35,19 @@
 
 bool apic_report_tpr_access;
 
-void cpu_set_apic_base(DeviceState *dev, uint64_t val)
+int cpu_set_apic_base(DeviceState *dev, uint64_t val)
 {
     trace_cpu_set_apic_base(val);
 
     if (dev) {
         APICCommonState *s = APIC_COMMON(dev);
         APICCommonClass *info = APIC_COMMON_GET_CLASS(s);
-        /* switching to x2APIC, reset possibly modified xAPIC ID */
-        if (!(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
-            (val & MSR_IA32_APICBASE_EXTD)) {
-            s->id = s->initial_apic_id;
-        }
-        info->set_base(s, val);
+        /* Reset possibly modified xAPIC ID */
+        s->id = s->initial_apic_id;
+        return info->set_base(s, val);
     }
+
+    return 0;
 }
 
 uint64_t cpu_get_apic_base(DeviceState *dev)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ef46755a50..2126b0e589 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -631,8 +631,8 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
  * in CPL=3; remove them if they are ever implemented for system emulation.
  */
 #if defined CONFIG_USER_ONLY
-#define CPUID_EXT_KERNEL_FEATURES (CPUID_EXT_PCID | CPUID_EXT_TSC_DEADLINE_TIMER | \
-                                 CPUID_EXT_X2APIC)
+#define CPUID_EXT_KERNEL_FEATURES \
+          (CPUID_EXT_PCID | CPUID_EXT_TSC_DEADLINE_TIMER)
 #else
 #define CPUID_EXT_KERNEL_FEATURES 0
 #endif
@@ -642,12 +642,13 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
           CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
           CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C | \
-          CPUID_EXT_FMA | CPUID_EXT_KERNEL_FEATURES)
+          CPUID_EXT_FMA | CPUID_EXT_X2APIC | CPUID_EXT_KERNEL_FEATURES)
           /* missing:
           CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
           CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID,
           CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
-          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER */
+          CPUID_EXT_TSC_DEADLINE_TIMER
+          */
 
 #ifdef TARGET_X86_64
 #define TCG_EXT2_X86_64_FEATURES CPUID_EXT2_LM
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 1c43a9f4f7..7de0a6e866 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -158,9 +158,19 @@ void helper_wrmsr(CPUX86State *env)
     case MSR_IA32_SYSENTER_EIP:
         env->sysenter_eip = val;
         break;
-    case MSR_IA32_APICBASE:
-        cpu_set_apic_base(env_archcpu(env)->apic_state, val);
+    case MSR_IA32_APICBASE: {
+        int ret;
+
+        if (val & MSR_IA32_APICBASE_RESERVED) {
+            goto error;
+        }
+
+        ret = cpu_set_apic_base(env_archcpu(env)->apic_state, val);
+        if (ret < 0) {
+            goto error;
+        }
         break;
+    }
     case MSR_EFER:
         {
             uint64_t update_mask;
diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c
index 8710e37567..7e14ded978 100644
--- a/target/i386/whpx/whpx-apic.c
+++ b/target/i386/whpx/whpx-apic.c
@@ -90,9 +90,10 @@ static void whpx_get_apic_state(APICCommonState *s,
     apic_next_timer(s, s->initial_count_load_time);
 }
 
-static void whpx_apic_set_base(APICCommonState *s, uint64_t val)
+static int whpx_apic_set_base(APICCommonState *s, uint64_t val)
 {
     s->apicbase = val;
+    return 0;
 }
 
 static void whpx_put_apic_base(CPUState *cpu, uint64_t val)
-- 
MST


