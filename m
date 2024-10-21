Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99F49A6E9A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823745.1237874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc9-0001Bu-OU; Mon, 21 Oct 2024 15:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823745.1237874; Mon, 21 Oct 2024 15:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc9-0000sr-6F; Mon, 21 Oct 2024 15:46:37 +0000
Received: by outflank-mailman (input) for mailman id 823745;
 Mon, 21 Oct 2024 15:46:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2uc6-0006wR-Bm
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:34 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4dd602d-8fc3-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 17:46:32 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a6acac4c3so513927966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:32 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:30 -0700 (PDT)
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
X-Inumbo-ID: a4dd602d-8fc3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525591; x=1730130391; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ah3/FAbVDfMti3UAa0nn+9bbUxazwt70g5vkEVtpiQ=;
        b=NWUY+epNoew5/1ldTepo39PKCN1U7eBVUnS36w5owKxRhJqxVsbFaIscMzvDPch6fa
         v08E/2ilPKswXK7A27b4q1AN6km/9GfvzinaWZf5PDrxO1HwIGR4MLMhUuxLsfMEpPhI
         oTrgaJqMkPBtZIr9N1sUCa0bhwZue4kgdfPLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525591; x=1730130391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ah3/FAbVDfMti3UAa0nn+9bbUxazwt70g5vkEVtpiQ=;
        b=VNfWA7UugFsYGu/tURwu4l8zOBERnp9RIqaSK6zNOIpS0g7lCnpth6s4vzawqAuH8E
         iITBjbUjQ532aPAOxt5ka9d3dB5hOZqmo1VBV1l+jlw7gszuIEou+jG7MQT+aIhKqxRY
         30+Jmp457atv2puJ3Li2nxXmEVu55MeuEJ/Cxtv/nsLZ+a1S7WBOOU64yuXZ9prCnY9S
         D4BiRTEnKGulB3yPR374iFUA/stZvbb8e3xD9hFo7WviqufMgymHbEUdsMdl1x1x2Nxq
         65GQxJwvk0roN0tCk4mEJLq88HHz79aO2IsL7CnTnKYptixumqBdrTjGvLkvJmLfVjcH
         gp/w==
X-Gm-Message-State: AOJu0Yw87dQ++8Zch4n0JvgFOP4WcxDrUvdfdZeA3W/WgSnPBgd3aDIZ
	zEpCCUmQb0ccLxXok4Ne+dlwgOs5G9TIrc6/LRp1NbkearX9xW8mTYSZ7bdQKwNlY+pYBNU+hIe
	Q
X-Google-Smtp-Source: AGHT+IHrrel4rYJieUp5DclhkwRc/OzjjzSiMA6PoQqA3Un6eQfLV09C+ETms8nfNVWbTtbGfL3cog==
X-Received: by 2002:a17:907:e89:b0:a99:61f7:8413 with SMTP id a640c23a62f3a-a9a69a75abdmr1097909866b.23.1729525591042;
        Mon, 21 Oct 2024 08:46:31 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 09/10] tools/libguest: Set distinct x2APIC IDs for each vCPU
Date: Mon, 21 Oct 2024 16:45:59 +0100
Message-ID: <20241021154600.11745-10-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Have toolstack populate the new x2APIC ID in the LAPIC save record with
the proper IDs intended for each vCPU.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v7:
  * Unchanged
---
 tools/libs/guest/xg_dom_x86.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index c98229317db7..38486140ed15 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -1004,11 +1004,14 @@ static int vcpu_hvm(struct xc_dom_image *dom)
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
     int rc;
@@ -1111,6 +1114,8 @@ static int vcpu_hvm(struct xc_dom_image *dom)
     vcpu_ctx.mtrr_d.typecode = HVM_SAVE_CODE(MTRR);
     vcpu_ctx.mtrr_d.length = HVM_SAVE_LENGTH(MTRR);
     vcpu_ctx.mtrr = *mtrr_record;
+    vcpu_ctx.lapic_d.typecode = HVM_SAVE_CODE(LAPIC);
+    vcpu_ctx.lapic_d.length = HVM_SAVE_LENGTH(LAPIC);
     vcpu_ctx.end_d = bsp_ctx.end_d;
     vcpu_ctx.end = bsp_ctx.end;
 
@@ -1125,6 +1130,18 @@ static int vcpu_hvm(struct xc_dom_image *dom)
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
+        vcpu_ctx.lapic.x2apic_id = dom->cpu_to_apicid[i];
+        vcpu_ctx.lapic_d.instance = i;
+
         rc = xc_domain_hvm_setcontext(dom->xch, dom->guest_domid,
                                       (uint8_t *)&vcpu_ctx, sizeof(vcpu_ctx));
         if ( rc != 0 )
-- 
2.47.0


