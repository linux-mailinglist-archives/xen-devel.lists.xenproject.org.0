Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492D89A6E96
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823740.1237840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc5-000087-QG; Mon, 21 Oct 2024 15:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823740.1237840; Mon, 21 Oct 2024 15:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc5-0008RY-C2; Mon, 21 Oct 2024 15:46:33 +0000
Received: by outflank-mailman (input) for mailman id 823740;
 Mon, 21 Oct 2024 15:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2uc3-00072f-L3
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:31 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3938409-8fc3-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 17:46:29 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso5581983e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:29 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:28 -0700 (PDT)
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
X-Inumbo-ID: a3938409-8fc3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525589; x=1730130389; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drYAV2GRBVtyItzvlbWxXVZKwAVghUrG2tjy6Y/nrn8=;
        b=NsgtkWqUJoX/ZecU5BPAlRrB+MnyVNR1CC5M9mWhhjsZ/hvtM0QgkxvBQvVC1finNQ
         wkifs8VW6vy7UGPpzis08JeEBqsIXvvzEfnn+HeDviUZ7c6BnG5VcNlYNUSAXueKHuqV
         SoaNnfGUpp6d1xRijZ4cnMl1JUR3RTiFULjXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525589; x=1730130389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drYAV2GRBVtyItzvlbWxXVZKwAVghUrG2tjy6Y/nrn8=;
        b=iwL5iu2egF4DxAXHAJhFxKu+N7sjbHxQxXLZVFSZPF3b3iRnHayv6VKCH1N9VKC9nE
         TasCIuZprVJRaHtQBshAK0S0iTDYJmKHHdnaUsznlb3vOpyEAkNYYtpJMtDld/5CYNJg
         ibeOh5ksV2xt45hvZTUlHW+rAq/ZNWXdeYtmiJ6qsCWLnPHTyDoS4osZsL/Ogw74brPO
         2VPjka6bc3ey5PgYsXUZIj82f9Vd6qZoXiy6ctGj11sAqRMCmV+slwe0Yp5OjPRB5U3M
         aDDBtiSP20q1FXqcjtAG5tfPEniUxwWoUjU/li98ZWCkEAkLttOTX8MJMeVAvKS5Of7d
         tXXw==
X-Gm-Message-State: AOJu0YyPSzBHGEeNY6bcMq2CBuhB9jInS6gp6eDSlPJDPcnbMBVaHIMZ
	arZqWWa75dzbWoJ8JR+k+YYz+f4yx7iQm3iEZKlbTvTT7M6yymGeT5kjV7kY2DNz6PEkYFoU/hW
	F
X-Google-Smtp-Source: AGHT+IG3Qtze17MfiMkatL5qI9j1ubDDXbU9gfmG9CbFNA99JNwPYq0pyj7mFHKGcMnqXtCxG4WZGw==
X-Received: by 2002:ac2:4c4a:0:b0:539:fb49:c47d with SMTP id 2adb3069b0e04-53a153410a1mr5489109e87.12.1729525588875;
        Mon, 21 Oct 2024 08:46:28 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 06/10] tools/libguest: Always set vCPU context in vcpu_hvm()
Date: Mon, 21 Oct 2024 16:45:56 +0100
Message-ID: <20241021154600.11745-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
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
v7:
  * Unchanged
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
2.47.0


