Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED0398BC47
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808077.1219954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9M-0005Hh-Dj; Tue, 01 Oct 2024 12:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808077.1219954; Tue, 01 Oct 2024 12:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9M-000568-3i; Tue, 01 Oct 2024 12:38:44 +0000
Received: by outflank-mailman (input) for mailman id 808077;
 Tue, 01 Oct 2024 12:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9J-0002va-KC
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:41 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15ebfffa-7ff2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 14:38:40 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c5b954c359so6038464a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:40 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:37 -0700 (PDT)
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
X-Inumbo-ID: 15ebfffa-7ff2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786318; x=1728391118; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8x1lOX8g1vjbtkMDhxskapyryrttGg/PykaAfYqF8tI=;
        b=baxaGIXcP3jQ933yqIwqo9lTTvGoIHP0N/hxtz3HgtD0xPMU8qCCc4+mAvkAELhrSs
         qtGoo30FCpRS0LoLJY2W4at9TnoCtg6gjIBs2e0RbhFcVGaLp+EDYVzSRE9Ae19jlZS5
         0pw17vyu8mcfnSdCmmTwqLNf1oRdLTebJb8T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786318; x=1728391118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8x1lOX8g1vjbtkMDhxskapyryrttGg/PykaAfYqF8tI=;
        b=GetAM0vYdt1nqzwHJd9CQV0JlH8rGfIGdeH19jYVeBFLlXZto8D6GHy77JwSe7uRzH
         3Wcz7oDtgbGrnFSmfqN+m71hDDTBdKWoaOFJvOhNUOkv83IJvAu+5QM0v+gVWCYZg/xK
         E4IDAVGy63GQVaYy+Twgw3xoi1Bn+JGdDbWrHFVhcC4w/RwsAkNiGcx8lXfSR+0dzaJa
         RZToGAzeJijzAPQLYoh31dFscLgeDwVuq3v3PPh58F8zs0qumbn/OLaP/IIl9BXaHUM1
         vD9LpTGhTOWGK/JP4n1ZSkPZm+hhATkKWKrhATFxpWHjZqSMoPpoR9mW5vbzlsz9Wxa6
         uFXg==
X-Gm-Message-State: AOJu0YwLa2eaHso3jE51RSLZAVCiSIlr7OzEGmiNYmxfXhP/SqRnzRRx
	ERKGaQopARRLGSAIHTXkAzTBrpU9hNEGvBmZZ0XHV5dwAmMaD0kTtzmDK4qBGb90888SFeyfq4y
	nSV0=
X-Google-Smtp-Source: AGHT+IFRKz3oQ8e7LGS9CnwBZ3WyAqbsPQuyesyNlrJd3Sb7NZ9423l2OBIfQ/GVRadeo1LeO5YZEQ==
X-Received: by 2002:a05:6402:40c5:b0:5c0:b793:df4e with SMTP id 4fb4d7f45d1cf-5c8825fd1eemr13517406a12.22.1727786317828;
        Tue, 01 Oct 2024 05:38:37 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 10/11] tools/libguest: Set distinct x2APIC IDs for each vCPU
Date: Tue,  1 Oct 2024 13:38:06 +0100
Message-ID: <20241001123807.605-11-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001123807.605-1-alejandro.vallejo@cloud.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Have toolstack populate the new x2APIC ID in the LAPIC save record with
the proper IDs intended for each vCPU.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v6:
  * Rely on the new LUT in xc_dom_image rather than recalculating APIC IDs.
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
2.46.0


