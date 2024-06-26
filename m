Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D67E918757
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749278.1157394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVt-0008Of-PC; Wed, 26 Jun 2024 16:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749278.1157394; Wed, 26 Jun 2024 16:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVt-0008Eb-IF; Wed, 26 Jun 2024 16:28:53 +0000
Received: by outflank-mailman (input) for mailman id 749278;
 Wed, 26 Jun 2024 16:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVVr-0005pK-Dp
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:28:51 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b24fcd9-33d9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:28:49 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7252bfe773so452804766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:28:49 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm42791866b.128.2024.06.26.09.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:28:48 -0700 (PDT)
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
X-Inumbo-ID: 2b24fcd9-33d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419329; x=1720024129; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPZPi/1GxgTiDwYl688KIib+0eFv4vArXlISETLlZHk=;
        b=gSl/22rQ+1SlO8vAi0W5OW3RMsrUXEfN6Hn9ZDF3oy/4SdFlOoUHE0RMijQf0HLwLp
         Rukh+DtBtFmrVcxTsqIr+/66h4Ued+4j8m2ZNDBhZd0ClegQT2Rn3yv51cjAbhFSFIin
         j48IyrdMJpXFyEypNQgcjX4NMyUuc2NmWFk18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419329; x=1720024129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPZPi/1GxgTiDwYl688KIib+0eFv4vArXlISETLlZHk=;
        b=pS5/CqoJCUre+VX3hx+/naMNJIJkWJdT2h83hHTkgNDPyY54NNFy2pBiadqGEFBdPz
         potJdQOyqwcbYjC5AuXU+NW11+miljfJ1AoRMwMcXP+CjbtmCr0P2elxCESjiKIE1jRK
         qOJBjyN5nS12oXZgXIh0QaxUhkEKQV5omnRm2X/bL58QEF93mjbnmBPpWMzPZm80SwP0
         NBgLTFwY/K29j5E3fzzsCGc4Uja4CuY35xMRoZUw6ZGsN11i8AdW2fwhuHYFInBn0tM5
         M/WM1B7fPXLJQ31qXppQdKve+SGcMdxoacWyajiIl+v9gWoEfQFtgBvQWABgPVoU0NHi
         UMIA==
X-Gm-Message-State: AOJu0Yxd+bIAylzpubVBunoqziwOc+GV3MH/MNHZejE2govC9eEJRgrD
	AEIKhM3KhwX1A6BMsm0QhfN3+oBwL1H0vg1wnal7U5uR+OYbEw/mV89kNvtXPSnCH8nKjIdKnAh
	qavc=
X-Google-Smtp-Source: AGHT+IGZnws2mdi+XVnvyuewQ3id60JRRLgyqmqgHjjPNv44XKzzcauz1g5P06nGpalKkaBxSPUShQ==
X-Received: by 2002:a17:907:8e93:b0:a6e:f62d:bd02 with SMTP id a640c23a62f3a-a7245c84f2emr837266166b.7.1719419329107;
        Wed, 26 Jun 2024 09:28:49 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 10/10] tools/libguest: Set topologically correct x2APIC IDs for each vCPU
Date: Wed, 26 Jun 2024 17:28:37 +0100
Message-Id: <94a6d0ff6ce8d0e5be9546efba7aa50d2a21a2b8.1719416329.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719416329.git.alejandro.vallejo@cloud.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Have toolstack populate the new x2APIC ID in the LAPIC save record with the
proper IDs intended for each vCPU.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4:
  * New patch. Replaced v3's method of letting Xen find out via the same
    algorithm toolstack uses.
---
 tools/libs/guest/xg_dom_x86.c | 37 ++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index 82ea3e2aab0b..2ae3a779b016 100644
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
 
@@ -1124,6 +1147,17 @@ static int vcpu_hvm(struct xc_dom_image *dom)
     {
         vcpu_ctx.mtrr_d.instance = i;
 
+        lapic_record = hvm_get_save_record(full_ctx, HVM_SAVE_CODE(LAPIC), i);
+        if ( !lapic_record )
+        {
+            xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
+                         "%s: unable to get LAPIC[%d] save record", __func__, i);
+            goto out;
+        }
+        vcpu_ctx.lapic = *lapic_record;
+        vcpu_ctx.lapic.x2apic_id = x86_x2apic_id_from_vcpu_id(&policy->policy, i);
+        vcpu_ctx.lapic_d.instance = i;
+
         rc = xc_domain_hvm_setcontext(dom->xch, dom->guest_domid,
                                           (uint8_t *)&vcpu_ctx, sizeof(vcpu_ctx));
         if ( rc != 0 )
@@ -1146,6 +1180,7 @@ static int vcpu_hvm(struct xc_dom_image *dom)
 
  out:
     free(full_ctx);
+    xc_cpu_policy_destroy(policy);
     return rc;
 }
 
-- 
2.34.1


