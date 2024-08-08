Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5413594BEB0
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774178.1184698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Q3-00057i-OI; Thu, 08 Aug 2024 13:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774178.1184698; Thu, 08 Aug 2024 13:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Q3-00054u-Jc; Thu, 08 Aug 2024 13:43:07 +0000
Received: by outflank-mailman (input) for mailman id 774178;
 Thu, 08 Aug 2024 13:43:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3Q2-0002jZ-06
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:43:06 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23af659a-558c-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 15:43:05 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f01ec08d6so1249300e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:43:05 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb551sm741537166b.223.2024.08.08.06.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:43:04 -0700 (PDT)
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
X-Inumbo-ID: 23af659a-558c-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124584; x=1723729384; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeVUUABBzNI1adruZgcaqeCvylgkxU6xakNCgnT+U/k=;
        b=jcAGCJDcIbKKlOuh80vcOez4bmNjVPdAVX/wUwU1IWKRsPEZXe5Q6aON1ax+f7nAd5
         62Jr6dFEnLZ7JYQW0p9wH8PsnAzWRasCGHMIJnGmb9oLui7zwXXk0XI/lKHmgixLVPSd
         d87pluyAN+bSP/5zly1vM8SPs/kzF8yF2zYVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124584; x=1723729384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeVUUABBzNI1adruZgcaqeCvylgkxU6xakNCgnT+U/k=;
        b=BNb+Lrj1zO6IqqMG83Scow8TrS8yO8Y8NTJ2eXr6UcOFgpEaq0BTYmd8jSEzYMXS3U
         aqQWY4XoeC7r2cyLwRc6qz+ZAMebF/uhyj+i6G/PPasBCqO2Ox5Tm9wr7aKIHeL3cq4p
         iHvlue64JN2u1N9MUCxxDuXjhZyKF5ynY+RNM0VSVVDj7unWC5MxHKisSqKfGgwu/qg9
         wwrNaFCs8IM8ASR+G8ONYK80R44Y//hdXmI5LBNxmrfSXPoEYYerezOIGffT9GWKIya1
         Qb35CMxOEtg/eOx5n7sVePBdoUugLRtLNp/eyKbclTolWUIqbny8UYeic54ZDPf8IqRu
         H3Zg==
X-Gm-Message-State: AOJu0YwUX1gLRmSHHJSxj+wYyupA0sro8dYoPKvMOihH7ozJHaJhg1qE
	OnDGY2L7eYJeUoxdvE0ztwOqAWdZDfSVS2XvDh9Gzha/qvlvFc1P5HdJX13b1slrtABaVL1/x83
	a
X-Google-Smtp-Source: AGHT+IGwnI6doIkcRTJRGk4Xe7EFDfawKFpStiQEtCj1LLLr7uVkCmRQZvb0FGyZ5Ax36nuOK1TmMg==
X-Received: by 2002:a05:6512:a95:b0:52e:9ab9:da14 with SMTP id 2adb3069b0e04-530e583f755mr1490222e87.31.1723124584432;
        Thu, 08 Aug 2024 06:43:04 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 09/10] tools/libguest: Set distinct x2APIC IDs for each vCPU
Date: Thu,  8 Aug 2024 14:42:49 +0100
Message-ID: <20240808134251.29995-10-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Have toolstack populate the new x2APIC ID in the LAPIC save record with
the proper IDs intended for each vCPU.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v5:
  * No change
---
 tools/libs/guest/xg_dom_x86.c | 38 ++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index fafe7acb7e91..a3e4e2052128 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -1004,19 +1004,40 @@ static int vcpu_hvm(struct xc_dom_image *dom)
         HVM_SAVE_TYPE(HEADER) header;
         struct hvm_save_descriptor mtrr_d;
         HVM_SAVE_TYPE(MTRR) mtrr;
+        struct hvm_save_descriptor lapic_d;
+        HVM_SAVE_TYPE(LAPIC) lapic;
         struct hvm_save_descriptor end_d;
         HVM_SAVE_TYPE(END) end;
     } vcpu_ctx;
-    /* Context from full_ctx */
+    /* Contexts from full_ctx */
     const HVM_SAVE_TYPE(MTRR) *mtrr_record;
+    const HVM_SAVE_TYPE(LAPIC) *lapic_record;
     /* Raw context as taken from Xen */
     uint8_t *full_ctx = NULL;
+    xc_cpu_policy_t *policy = xc_cpu_policy_init();
     int rc;
 
     DOMPRINTF_CALLED(dom->xch);
 
     assert(dom->max_vcpus);
 
+    /*
+     * Fetch the CPU policy of this domain. We need it to determine the APIC IDs
+     * each of vCPU in a manner consistent with the exported topology.
+     *
+     * TODO: It's silly to query a policy we have ourselves created. It should
+     *       instead be part of xc_dom_image
+     */
+
+    rc = xc_cpu_policy_get_domain(dom->xch, dom->guest_domid, policy);
+    if ( rc != 0 )
+    {
+        xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
+                     "%s: unable to fetch cpu policy for dom%u (rc=%d)",
+                     __func__, dom->guest_domid, rc);
+        goto out;
+    }
+
     /*
      * Get the full HVM context in order to have the header, it is not
      * possible to get the header with getcontext_partial, and crafting one
@@ -1111,6 +1132,8 @@ static int vcpu_hvm(struct xc_dom_image *dom)
     vcpu_ctx.mtrr_d.typecode = HVM_SAVE_CODE(MTRR);
     vcpu_ctx.mtrr_d.length = HVM_SAVE_LENGTH(MTRR);
     vcpu_ctx.mtrr = *mtrr_record;
+    vcpu_ctx.lapic_d.typecode = HVM_SAVE_CODE(LAPIC);
+    vcpu_ctx.lapic_d.length = HVM_SAVE_LENGTH(LAPIC);
     vcpu_ctx.end_d = bsp_ctx.end_d;
     vcpu_ctx.end = bsp_ctx.end;
 
@@ -1125,6 +1148,18 @@ static int vcpu_hvm(struct xc_dom_image *dom)
     {
         vcpu_ctx.mtrr_d.instance = i;
 
+        lapic_record = hvm_get_save_record(full_ctx, HVM_SAVE_CODE(LAPIC), i);
+        if ( !lapic_record )
+        {
+            xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
+                         "%s: unable to get LAPIC[%d] save record", __func__, i);
+            goto out;
+        }
+
+        vcpu_ctx.lapic = *lapic_record;
+        vcpu_ctx.lapic.x2apic_id = x86_x2apic_id_from_vcpu_id(&policy->policy, i);
+        vcpu_ctx.lapic_d.instance = i;
+
         rc = xc_domain_hvm_setcontext(dom->xch, dom->guest_domid,
                                       (uint8_t *)&vcpu_ctx, sizeof(vcpu_ctx));
         if ( rc != 0 )
@@ -1147,6 +1182,7 @@ static int vcpu_hvm(struct xc_dom_image *dom)
 
  out:
     free(full_ctx);
+    xc_cpu_policy_destroy(policy);
     return rc;
 }
 
-- 
2.45.2


