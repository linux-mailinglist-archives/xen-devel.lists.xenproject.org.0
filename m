Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF198BC43
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808073.1219926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9J-0004Z2-OA; Tue, 01 Oct 2024 12:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808073.1219926; Tue, 01 Oct 2024 12:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9J-0004V1-BJ; Tue, 01 Oct 2024 12:38:41 +0000
Received: by outflank-mailman (input) for mailman id 808073;
 Tue, 01 Oct 2024 12:38:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9G-0002va-B5
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:38 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 140ead2b-7ff2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 14:38:36 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3f28b6so1950566a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:36 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:35 -0700 (PDT)
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
X-Inumbo-ID: 140ead2b-7ff2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786316; x=1728391116; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuObzAPBZ9nf14Sh2mL9KT1PN35RQIsHwQXw8tfgbuc=;
        b=PEukFMJAh4ga/5xZMwdG5tBito/abC3MmAc7XEKC8ymZE6meQz9CIZ7+SiDHPfV9Yg
         mJNwszAzZtcGHtegt/QMb73APYZ8xXPoXfDiS2GMRIhvHpg1gRti/GBhskeGGZ/GcRJk
         8ghWpfZYTvUGo4j5oGDlDwXKm5wGvOqds/koc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786316; x=1728391116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuObzAPBZ9nf14Sh2mL9KT1PN35RQIsHwQXw8tfgbuc=;
        b=u+dbNmyZApopP81cLL6SGYi2REWfuBtBOuHY+BJJkQ9HV53ZwZSMW71xJ6zyr9Xrqq
         o2WU/YbGkr72e7nmi91kDlgh9YBdjQZcZcES1Hw9liQ5Vcg3HF23zwz3DYn9tLj6/GHl
         Xhu5PaQFJqWMtGWX8W3QX21fI6wFRNS9FAnfCOVQ30r2aKeUQvlFBESQ9aPKKR8IJuyO
         /UVxHHSSaAzEbYhR4Hzl5HKhTPBjZQqWsdMm/xhgzDqtnXscOQwFNOUFJLf6KKEtNwDG
         SHBKANQg15xjtS8vhaf4xoLf1EHC7g1Eba1RqHCCGxfT62ZtIrOo6jZMqMjmdIeDt+1p
         zI0A==
X-Gm-Message-State: AOJu0YzoCzxlfJ3+DeniS8ptb0sTh7eH7PH010RlaNlhEKyyz/5yqyTm
	T/XRk0jbKJFvmHrR+PNXIv6ZDLYtLvOS0RXnd4ZUJ2Wxc4aa7NYbzPte5+QIhwdkcEsqSE8FkJw
	IVrM=
X-Google-Smtp-Source: AGHT+IG4jKYDXno4LWgH1e+P0gCG5KDXkdl4Ia0ars1LxyfAinjMa0gyexBSI2sdIQS2YMCCSAaEcg==
X-Received: by 2002:a05:6402:27c6:b0:5c7:1911:f134 with SMTP id 4fb4d7f45d1cf-5c8824e51camr13023489a12.9.1727786315912;
        Tue, 01 Oct 2024 05:38:35 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 07/11] tools/libguest: Always set vCPU context in vcpu_hvm()
Date: Tue,  1 Oct 2024 13:38:03 +0100
Message-ID: <20241001123807.605-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001123807.605-1-alejandro.vallejo@cloud.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
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
 tools/libs/guest/xg_dom_x86.c | 84 ++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 40 deletions(-)

diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index cba01384ae75..c98229317db7 100644
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
+    if ( !dom->device_model )
+        vcpu_ctx.mtrr.msr_mtrr_def_type = MTRR_TYPE_WRBACK | MTRR_DEF_TYPE_ENABLE;
+
+    for ( unsigned int i = 0; i < dom->max_vcpus; i++ )
+    {
+        vcpu_ctx.mtrr_d.instance = i;
 
-        for ( i = 0; i < dom->max_vcpus; i++ )
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
2.46.0


