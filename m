Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CFD91875E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749274.1157357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVp-0007NB-K9; Wed, 26 Jun 2024 16:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749274.1157357; Wed, 26 Jun 2024 16:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVp-0007Gv-GM; Wed, 26 Jun 2024 16:28:49 +0000
Received: by outflank-mailman (input) for mailman id 749274;
 Wed, 26 Jun 2024 16:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVVn-0005pK-QZ
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:28:47 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28ede50e-33d9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:28:46 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57d1782679fso678725a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:28:46 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm42791866b.128.2024.06.26.09.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:28:44 -0700 (PDT)
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
X-Inumbo-ID: 28ede50e-33d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419325; x=1720024125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRrrYvX+yDttN2Gg1qTkgVmajhbWR2NVsVybiYM7F5A=;
        b=DWQdEei9NajR8t828BZaK624uBUwS+bF4ZJsH+bScdVMgcVRu5WJ5PKXgUDRZYSw+W
         tU0KpEFvfBXemiGKGzVSFivApjOkk5I2XHaGPkAZJ/tt1oGQce+z0osWpUHLwjXL3G12
         Rx3DtFin2FACzpN2mgqZYpOkXI8ifOND+TtVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419325; x=1720024125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRrrYvX+yDttN2Gg1qTkgVmajhbWR2NVsVybiYM7F5A=;
        b=SZ7EzqBXya2sGW/v4Crw8yA2dT4jj3wfdlSvAlYreAJB5a1y8ALjJC0Vsveih2lYai
         fHgxyIGlZnq1TSdvIyZcaeku7xTxw/8J3XbieMPzo2NdOGnfCF62ZjmflCTWbX3/PDBd
         gZWvsghivRPjFqfxaNq2GWNcUefCkKNxp+ud/iKdZHc14fiCmNRvKWuzoG0xg8kqlT68
         fxvO2MpKV+P/ERVn96rAy7ffrgd8ay2Q+FjiequLs/ykUtY70L8TdW68+ojUHi8YoSvI
         DI6icUe0YyhBN7m1+BR9KYzEQVFIPg2a2OAJixLoDoVolAqjYlR7jfFrcqOmhkIBkoUV
         grEw==
X-Gm-Message-State: AOJu0YyKFYzENZvewJXN2uUO88SDTDjdmKYPHXUdzfRYHlyV+Za7pak5
	h6jfb+/IM2b245vxsEMwQXwJxlhE9BesIAQCG5D84IcMrQpe2beyygvpbH6IEoexmygUKoZYX6c
	NftY=
X-Google-Smtp-Source: AGHT+IGIMJSmFVWpKQ8YVYg3rvYvGdWCd5kBCwEUCLXVW0MyhCXi56UMacCQ9aoBAV6VOB6qERmO2g==
X-Received: by 2002:a17:907:c81b:b0:a72:4bf2:e16 with SMTP id a640c23a62f3a-a727f65e329mr261218066b.16.1719419325348;
        Wed, 26 Jun 2024 09:28:45 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 06/10] tools/libguest: Make setting MTRR registers unconditional
Date: Wed, 26 Jun 2024 17:28:33 +0100
Message-Id: <2c55d486bb0c54a3e813abc66d32f321edd28b81.1719416329.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719416329.git.alejandro.vallejo@cloud.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This greatly simplifies a later patch that makes use of HVM contexts to upload
LAPIC data. The idea is to reuse MTRR setting procedure to avoid code
duplication. It's currently only used for PVH, but there's no real reason to
overcomplicate the toolstack preventing them being set for HVM too when
hvmloader will override them anyway.

While at it, add a missing "goto out" to what was the error condition in the
loop.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4:
  * New patch
---
 tools/libs/guest/xg_dom_x86.c | 83 ++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 40 deletions(-)

diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index cba01384ae75..82ea3e2aab0b 100644
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
 
@@ -1083,51 +1096,41 @@ static int vcpu_hvm(struct xc_dom_image *dom)
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
+    vcpu_ctx.mtrr.msr_mtrr_def_type = MTRR_TYPE_WRBACK | MTRR_DEF_TYPE_ENABLE;
 
-        for ( i = 0; i < dom->max_vcpus; i++ )
+    for ( unsigned int i = 0; i < dom->max_vcpus; i++ )
+    {
+        vcpu_ctx.mtrr_d.instance = i;
+
+        rc = xc_domain_hvm_setcontext(dom->xch, dom->guest_domid,
+                                          (uint8_t *)&vcpu_ctx, sizeof(vcpu_ctx));
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
2.34.1


