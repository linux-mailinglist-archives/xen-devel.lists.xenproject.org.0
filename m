Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9449FF710
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863731.1275106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpu-00059A-Tf; Thu, 02 Jan 2025 08:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863731.1275106; Thu, 02 Jan 2025 08:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpu-00051D-Qp; Thu, 02 Jan 2025 08:45:46 +0000
Received: by outflank-mailman (input) for mailman id 863731;
 Thu, 02 Jan 2025 08:45:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHMo=T2=bounce.vates.tech=bounce-md_30504962.67765235.v1-b25bb21507ab41e49a5a6432f490ffb0@srs-se1.protection.inumbo.net>)
 id 1tTGpt-0004rF-LT
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:45 +0000
Received: from mail180-43.suw31.mandrillapp.com
 (mail180-43.suw31.mandrillapp.com [198.2.180.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f428e5d7-c8e5-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 09:45:44 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-43.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fG01BLzLfHFtk
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b25bb21507ab41e49a5a6432f490ffb0; Thu, 02 Jan 2025 08:45:41 +0000
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
X-Inumbo-ID: f428e5d7-c8e5-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807542; x=1736068042;
	bh=hkByZLzlrTXwHXqACXZ3W4ofBw/54TO6ZVkDh0SDWck=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qRjX6uuvQTFN+E3Sz5ngLDXYHs9Z28eGHZ8DJ70l8b/Qt8hpcemSQzFlptMBR9fR0
	 OOdXrAD2TEMxMBo4gRjFfs+ZKVVu7Wx6zOjBYE2vNrsvaCug7kirYYyIiJxGOSZVHG
	 kRtgv9YWNVxs2k4CTsZVX/BBgLQw2ph4kk0W0qhqaNtRUs2yOrzQQGHsZt+0y3lwJs
	 ySLAoGn3Yupc20xqxruRxifHCNEPrR2OVu32yYbonSiVYrsQRHydXykHzbb+KNdycg
	 U9wOg6X9T1d4FIDNPUmXV7cF5DVCivj5ZnshQ6Xhm86jPvOjCkfAWM+XUHroF8KH4k
	 CosZhzl/WsRxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807542; x=1736068042; i=ngoc-tu.dinh@vates.tech;
	bh=hkByZLzlrTXwHXqACXZ3W4ofBw/54TO6ZVkDh0SDWck=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mNtI0Y832PLwvUSKMU4hCF3CVP7UH5Q/mOWj1qd4RyIGz+HstL1n501TS2eP3hDJK
	 meQau9ifxLlKgfYBYvCSutQNpWetuvvPbi+Mc2ZPWPfudylxlKuq8+iiRTu5Oja0Ln
	 oFYQJVfJ78UhE5WGTfts2scVqA2oh19jEexrfLIjdBBlWx0EjSY/bgMbhBcplp03y1
	 rD7WachW9uaCtQwuFkTexe4xfF0f48EEcfYH5yCe6i5V/wM3zdmx59EO4CwXxrtQgF
	 TqS7D0/NuE4yis+/0rmcVPdLS2ASWgDgglpxaZTxJ0Wj0Qp+qkNg6HnHCEoiNyggza
	 ACoMbO8oYybmg==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2010/10]=20x86/hvm:=20Enable=20XSAVES=20LBR=20save/restore?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807541149
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-11-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b25bb21507ab41e49a5a6432f490ffb0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Add a new save code type CPU_XSAVES_CODE containing a compressed XSAVES
image.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/hvm/hvm.c                 | 67 +++++++++++++++++++++-----
 xen/arch/x86/xstate.c                  |  3 +-
 xen/include/public/arch-x86/hvm/save.h |  4 +-
 3 files changed, 60 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c7b93c7d91..e5a50d9fca 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1238,6 +1238,36 @@ static int cf_check hvm_save_cpu_xsave_states(
     return 0;
 }
 
+#define HVM_CPU_XSAVES_SIZE(xcr0) (offsetof(struct hvm_hw_cpu_xsave, \
+                                            save_area) + \
+                                   xstate_compressed_size(xcr0))
+
+static int cf_check hvm_save_cpu_xsaves_states(
+    struct vcpu *v, hvm_domain_context_t *h)
+{
+    struct hvm_hw_cpu_xsave *ctxt;
+    unsigned int size;
+    int err;
+
+    if ( !xsave_enabled(v) )
+        return 0;   /* do nothing */
+
+    size = HVM_CPU_XSAVES_SIZE(v->arch.xcr0_accum);
+    err = _hvm_init_entry(h, CPU_XSAVES_CODE, v->vcpu_id, size);
+    if ( err )
+        return err;
+
+    ctxt = (struct hvm_hw_cpu_xsave *)&h->data[h->cur];
+    h->cur += size;
+    ctxt->xfeature_mask = xfeature_mask;
+    ctxt->xcr0 = v->arch.xcr0;
+    ctxt->xcr0_accum = v->arch.xcr0_accum;
+
+    memcpy(&ctxt->save_area, v->arch.xsave_area, size);
+
+    return 0;
+}
+
 /*
  * Structure layout conformity checks, documenting correctness of the cast in
  * the invocation of validate_xstate() below.
@@ -1311,6 +1341,10 @@ static int cf_check hvm_load_cpu_xsave_states(
     ctxt = (struct hvm_hw_cpu_xsave *)&h->data[h->cur];
     h->cur += desc->length;
 
+    if ( !cpu_has_xsaves &&
+         xsave_area_compressed((const void *)&ctxt->save_area) )
+        return -EOPNOTSUPP;
+
     err = validate_xstate(d, ctxt->xcr0, ctxt->xcr0_accum,
                           (const void *)&ctxt->save_area.xsave_hdr);
     if ( err )
@@ -1322,7 +1356,10 @@ static int cf_check hvm_load_cpu_xsave_states(
                ctxt->xcr0, ctxt->save_area.xsave_hdr.xstate_bv, err);
         return err;
     }
-    size = HVM_CPU_XSAVE_SIZE(ctxt->xcr0_accum);
+    if ( xsave_area_compressed((const void *)&ctxt->save_area) )
+        size = HVM_CPU_XSAVES_SIZE(ctxt->xcr0_accum);
+    else
+        size = HVM_CPU_XSAVE_SIZE(ctxt->xcr0_accum);
     desc_length = desc->length;
     if ( desc_length > size )
     {
@@ -1348,14 +1385,7 @@ static int cf_check hvm_load_cpu_xsave_states(
         desc_length = size;
     }
 
-    if ( xsave_area_compressed((const void *)&ctxt->save_area) )
-    {
-        printk(XENLOG_G_WARNING
-               "HVM%d.%u restore: compressed xsave state not supported\n",
-               d->domain_id, vcpuid);
-        return -EOPNOTSUPP;
-    }
-    else if ( desc_length != size )
+    if ( desc_length != size )
     {
         printk(XENLOG_G_WARNING
                "HVM%d.%u restore mismatch: xsave length %#x != %#x\n",
@@ -1367,8 +1397,13 @@ static int cf_check hvm_load_cpu_xsave_states(
     v->arch.xcr0 = ctxt->xcr0;
     v->arch.xcr0_accum = ctxt->xcr0_accum;
     v->arch.nonlazy_xstate_used = ctxt->xcr0_accum & XSTATE_NONLAZY;
-    compress_xsave_states(v, &ctxt->save_area,
-                          size - offsetof(struct hvm_hw_cpu_xsave, save_area));
+    if ( xsave_area_compressed((const void *)&ctxt->save_area) )
+        memcpy(v->arch.xsave_area, &ctxt->save_area,
+               size - offsetof(struct hvm_hw_cpu_xsave, save_area));
+    else
+        compress_xsave_states(v, &ctxt->save_area,
+                              size - offsetof(struct hvm_hw_cpu_xsave,
+                                              save_area));
 
     return 0;
 }
@@ -1385,6 +1420,7 @@ static const uint32_t msrs_to_send[] = {
     MSR_AMD64_DR1_ADDRESS_MASK,
     MSR_AMD64_DR2_ADDRESS_MASK,
     MSR_AMD64_DR3_ADDRESS_MASK,
+    MSR_LBR_DEPTH,
 };
 
 static int cf_check hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
@@ -1572,6 +1608,15 @@ static int __init cf_check hvm_register_CPU_save_and_restore(void)
                             sizeof(struct hvm_save_descriptor),
                         HVMSR_PER_VCPU);
 
+    hvm_register_savevm(CPU_XSAVES_CODE,
+                        "CPU_XSAVES",
+                        hvm_save_cpu_xsaves_states,
+                        NULL,
+                        hvm_load_cpu_xsave_states,
+                        HVM_CPU_XSAVES_SIZE(xfeature_mask) +
+                            sizeof(struct hvm_save_descriptor),
+                        HVMSR_PER_VCPU);
+
     hvm_register_savevm(CPU_MSR_CODE,
                         "CPU_MSR",
                         hvm_save_cpu_msrs,
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 607bf9c8a5..1c7a39e778 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -946,8 +946,7 @@ int validate_xstate(const struct domain *d, uint64_t xcr0, uint64_t xcr0_accum,
          !valid_xcr0(xcr0_accum) )
         return -EINVAL;
 
-    if ( (xcr0_accum & ~xfeature_mask) ||
-         hdr->xcomp_bv )
+    if ( xcr0_accum & ~xfeature_mask )
         return -EOPNOTSUPP;
 
     for ( i = 0; i < ARRAY_SIZE(hdr->reserved); ++i )
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 7ecacadde1..89651f3dd3 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -624,12 +624,14 @@ struct hvm_msr {
 
 #define CPU_MSR_CODE  20
 
+#define CPU_XSAVES_CODE 21
+
 /* Range 22 - 34 (inclusive) reserved for Amazon */
 
 /*
  * Largest type-code in use
  */
-#define HVM_SAVE_CODE_MAX 20
+#define HVM_SAVE_CODE_MAX 21
 
 #endif /* __XEN_PUBLIC_HVM_SAVE_X86_H__ */
 
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

