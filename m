Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2724994BECA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774262.1184757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3XC-0002zg-PI; Thu, 08 Aug 2024 13:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774262.1184757; Thu, 08 Aug 2024 13:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3XC-0002xa-Mb; Thu, 08 Aug 2024 13:50:30 +0000
Received: by outflank-mailman (input) for mailman id 774262;
 Thu, 08 Aug 2024 13:50:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3Q0-0003nA-MA
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:43:04 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22119375-558c-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 15:43:02 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7a83a968ddso109089266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:43:02 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb551sm741537166b.223.2024.08.08.06.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:43:01 -0700 (PDT)
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
X-Inumbo-ID: 22119375-558c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124582; x=1723729382; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44Z3UJCQiLUwVjk+ZfmbNwew8QNeYDhbqPEhop9SA8M=;
        b=dnAtL7ffto0SnuU5D4qk0EvADsSthNUh4ImOT+uTrLrdQGO84gvZuUsI4iFLsP1xtR
         xYkC8BIdAj+YQ7M6olgMQY1FOghKMxWAohac0fo2O/0kWoLP+Oyu3e0j5gu25nQM98Fb
         dc73EPqbBqQ1ilStI2TDZXCwOIu8mC2VlLKmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124582; x=1723729382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44Z3UJCQiLUwVjk+ZfmbNwew8QNeYDhbqPEhop9SA8M=;
        b=VCb7dZmVgIQh9A6VoHxhMMw8zDYk9lqwGENLewtGXZEHs5ibZu/eZWtT25yXFoTGCW
         jns64ggL6shqwgB5IEOrNAb6GY4/EFD+PiEzqI7nvVEK8xEz9ryZJZDyOj1u/wDe80of
         EXffOJJQVX80mq9fqcs/eLXxXJLo9wMfS3w9giY6BGznzZqD8t2wfZ2hdATd9MLHxHiS
         Y2bA/kVR+ENUvOqMa34cr7xIrELcotquSt1b4NydggTxggoQbOC7UwzuPmVmQ8svdioj
         cQwCEfEneS1ykaCG4DbJyWSbdoIx60p+qT0WUYMuXnKVFJFOVeTGT/EqxKK8kcnOhxoy
         kBgg==
X-Gm-Message-State: AOJu0YzkUFMEpnfIbGVkY90ipOTZIfkauDU+zOSGIdjWYPkFTnSlfqf7
	gdgL1+CvQiNauO7tj8Jbf8nQ6C662Q4wNvHcxCXkDd1xVukeDFqcmsr8UCudaC/rhR9tp3gXVNd
	B
X-Google-Smtp-Source: AGHT+IFj6rQ9MPbgA5ESi29mmvueuOquozJ7crgbGCTA6rqHN5lTa7DD7e0D0VsECtzX+QwdQHbzzA==
X-Received: by 2002:a17:907:e652:b0:a7a:b561:3564 with SMTP id a640c23a62f3a-a8090f07f4dmr131831566b.61.1723124582000;
        Thu, 08 Aug 2024 06:43:02 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 06/10] tools/libguest: Always set vCPU context in vcpu_hvm()
Date: Thu,  8 Aug 2024 14:42:46 +0100
Message-ID: <20240808134251.29995-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently used by PVH to set MTRR, will be used by a later patch to set
APIC state. Unconditionally send the hypercall, and gate overriding the
MTRR so it remains functionally equivalent.

While at it, add a missing "goto out" to what was the error condition
in the loop.

In principle this patch shouldn't affect functionality. An extra record
(the MTRR) is sent to the hypervisor per vCPU on HVM, but these records
are identical to those retrieved in the first place so there's no
expected functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v5:
  * Ensure MTRRs are only overriden in PVH, and left as-is on HVM
---
 tools/libs/guest/xg_dom_x86.c | 84 ++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 40 deletions(-)

diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index cba01384ae75..fafe7acb7e91 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -989,6 +989,7 @@ const static void *hvm_get_save_record(const void *ctx, unsigned int type,
 
 static int vcpu_hvm(struct xc_dom_image *dom)
 {
+    /* Initialises the BSP */
     struct {
         struct hvm_save_descriptor header_d;
         HVM_SAVE_TYPE(HEADER) header;
@@ -997,6 +998,18 @@ static int vcpu_hvm(struct xc_dom_image *dom)
         struct hvm_save_descriptor end_d;
         HVM_SAVE_TYPE(END) end;
     } bsp_ctx;
+    /* Initialises APICs and MTRRs of every vCPU */
+    struct {
+        struct hvm_save_descriptor header_d;
+        HVM_SAVE_TYPE(HEADER) header;
+        struct hvm_save_descriptor mtrr_d;
+        HVM_SAVE_TYPE(MTRR) mtrr;
+        struct hvm_save_descriptor end_d;
+        HVM_SAVE_TYPE(END) end;
+    } vcpu_ctx;
+    /* Context from full_ctx */
+    const HVM_SAVE_TYPE(MTRR) *mtrr_record;
+    /* Raw context as taken from Xen */
     uint8_t *full_ctx = NULL;
     int rc;
 
@@ -1083,51 +1096,42 @@ static int vcpu_hvm(struct xc_dom_image *dom)
     bsp_ctx.end_d.instance = 0;
     bsp_ctx.end_d.length = HVM_SAVE_LENGTH(END);
 
-    /* TODO: maybe this should be a firmware option instead? */
-    if ( !dom->device_model )
+    /* TODO: maybe setting MTRRs should be a firmware option instead? */
+    mtrr_record = hvm_get_save_record(full_ctx, HVM_SAVE_CODE(MTRR), 0);
+
+    if ( !mtrr_record)
     {
-        struct {
-            struct hvm_save_descriptor header_d;
-            HVM_SAVE_TYPE(HEADER) header;
-            struct hvm_save_descriptor mtrr_d;
-            HVM_SAVE_TYPE(MTRR) mtrr;
-            struct hvm_save_descriptor end_d;
-            HVM_SAVE_TYPE(END) end;
-        } mtrr = {
-            .header_d = bsp_ctx.header_d,
-            .header = bsp_ctx.header,
-            .mtrr_d.typecode = HVM_SAVE_CODE(MTRR),
-            .mtrr_d.length = HVM_SAVE_LENGTH(MTRR),
-            .end_d = bsp_ctx.end_d,
-            .end = bsp_ctx.end,
-        };
-        const HVM_SAVE_TYPE(MTRR) *mtrr_record =
-            hvm_get_save_record(full_ctx, HVM_SAVE_CODE(MTRR), 0);
-        unsigned int i;
-
-        if ( !mtrr_record )
-        {
-            xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
-                         "%s: unable to get MTRR save record", __func__);
-            goto out;
-        }
+        xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
+                     "%s: unable to get MTRR save record", __func__);
+        goto out;
+    }
 
-        memcpy(&mtrr.mtrr, mtrr_record, sizeof(mtrr.mtrr));
+    vcpu_ctx.header_d = bsp_ctx.header_d;
+    vcpu_ctx.header = bsp_ctx.header;
+    vcpu_ctx.mtrr_d.typecode = HVM_SAVE_CODE(MTRR);
+    vcpu_ctx.mtrr_d.length = HVM_SAVE_LENGTH(MTRR);
+    vcpu_ctx.mtrr = *mtrr_record;
+    vcpu_ctx.end_d = bsp_ctx.end_d;
+    vcpu_ctx.end = bsp_ctx.end;
 
-        /*
-         * Enable MTRR, set default type to WB.
-         * TODO: add MMIO areas as UC when passthrough is supported.
-         */
-        mtrr.mtrr.msr_mtrr_def_type = MTRR_TYPE_WRBACK | MTRR_DEF_TYPE_ENABLE;
+    /*
+     * Enable MTRR, set default type to WB.
+     * TODO: add MMIO areas as UC when passthrough is supported in PVH
+     */
+    if ( !dom->device_model)
+        vcpu_ctx.mtrr.msr_mtrr_def_type = MTRR_TYPE_WRBACK | MTRR_DEF_TYPE_ENABLE;
 
-        for ( i = 0; i < dom->max_vcpus; i++ )
+    for ( unsigned int i = 0; i < dom->max_vcpus; i++ )
+    {
+        vcpu_ctx.mtrr_d.instance = i;
+
+        rc = xc_domain_hvm_setcontext(dom->xch, dom->guest_domid,
+                                      (uint8_t *)&vcpu_ctx, sizeof(vcpu_ctx));
+        if ( rc != 0 )
         {
-            mtrr.mtrr_d.instance = i;
-            rc = xc_domain_hvm_setcontext(dom->xch, dom->guest_domid,
-                                          (uint8_t *)&mtrr, sizeof(mtrr));
-            if ( rc != 0 )
-                xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
-                             "%s: SETHVMCONTEXT failed (rc=%d)", __func__, rc);
+            xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
+                         "%s: SETHVMCONTEXT failed (rc=%d)", __func__, rc);
+            goto out;
         }
     }
 
-- 
2.45.2


