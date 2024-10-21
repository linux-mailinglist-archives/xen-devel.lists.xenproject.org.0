Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12D99A6E91
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823735.1237811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc2-0007sa-Jj; Mon, 21 Oct 2024 15:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823735.1237811; Mon, 21 Oct 2024 15:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc2-0007pI-Fj; Mon, 21 Oct 2024 15:46:30 +0000
Received: by outflank-mailman (input) for mailman id 823735;
 Mon, 21 Oct 2024 15:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2uc0-00072f-KX
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:28 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a206f3b7-8fc3-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 17:46:27 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a3dc089d8so644860566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:27 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:26 -0700 (PDT)
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
X-Inumbo-ID: a206f3b7-8fc3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525586; x=1730130386; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pByswpXzSTiGKGfVPV2EdkKns62a7SkqiG3943NVlFI=;
        b=SzVzt4WHidbE0zJ9QCJxdlgrNuOVZeEpxB7ZQLDu45hlrGTufcqLIdsUbXLaExMpyT
         /GyDl8pmZd+Bg4gSenmnLu4Ta0ct+A2b5mIx1N9Kfj2faZfIAvGdp/OJEe6G/RDz4C26
         +uxwJVnY68IF4180zWCB3w0TiCikTv0qkYDkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525586; x=1730130386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pByswpXzSTiGKGfVPV2EdkKns62a7SkqiG3943NVlFI=;
        b=HdkweMDsO1fBa7WIXw89GJWdO6Xs3E/FgeGDPo+4WE7ZeOSWp4XCX6U5jGHcGNHXYT
         qcotSkmHuN/O6jOyB75yne8wVPn/SviSq7Fnyd1YWJaA0U6uhLY4fOuCIkCYgOO4afvu
         ooC3OW5EyIsqzzgGV8aEGcOzxN9CvzseFBa/FGLhPMGP2Kxrq2GqykqTYLnPZHuMr7HV
         vPjKPvvKa8PJ2+SBPlpvpc0vkzFSNhbNmdU+8H/sDRIXxwDa5sDKojXzK1zuxmpo1Y6z
         OqPNjVUOXSSEJJpNVT26TLngXHaHH+isd1yyvfbvQWPSW0AJWzYcjmEbBa5qvE2iC+gd
         hKEQ==
X-Gm-Message-State: AOJu0YyPtj2RkNM3qprDSF0MW92ir5aCgS/PjRTOmEEE7JmstxsNyp2n
	dYZ0ee2hXXY7XfWkSvmbN17hzWuIOyTYxdq9sRH3T7IR20U3WWOCRpUE9H2xWGi6VDyL7T1K88z
	S
X-Google-Smtp-Source: AGHT+IHM8n1JQD1o+pIuj+Z2TwTg9W/MBIC+VNA8N9YrEwNUTTBufyr/ioxaPO0pJOwlwX0Eg+kgew==
X-Received: by 2002:a17:907:6094:b0:a99:4eac:bb98 with SMTP id a640c23a62f3a-a9a69c6a5a9mr1125006366b.51.1729525586449;
        Mon, 21 Oct 2024 08:46:26 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 03/10] xen/x86: Add supporting code for uploading LAPIC contexts during domain create
Date: Mon, 21 Oct 2024 16:45:53 +0100
Message-ID: <20241021154600.11745-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A later patch will upload LAPIC contexts as part of domain creation. In
order for it not to encounter a problem where the architectural state
does not reflect the APIC ID in the hidden state, this patch ensures
updates to the hidden state trigger an update in the architectural
registers so the APIC ID in both is consistent.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v7:
 * Rework the commit message so it explains a follow-up patch rather
   than hypothetical behaviour.
---
 xen/arch/x86/hvm/vlapic.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 33b463925f4e..03581eb33812 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1640,7 +1640,27 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
 
     s->loaded.hw = 1;
     if ( s->loaded.regs )
+    {
+        /*
+         * We already processed architectural regs in lapic_load_regs(), so
+         * this must be a migration. Fix up inconsistencies from any older Xen.
+         */
         lapic_load_fixup(s);
+    }
+    else
+    {
+        /*
+         * We haven't seen architectural regs so this could be a migration or a
+         * plain domain create. In the domain create case it's fine to modify
+         * the architectural state to align it to the APIC ID that was just
+         * uploaded and in the migrate case it doesn't matter because the
+         * architectural state will be replaced by the LAPIC_REGS ctx later on.
+         */
+        if ( vlapic_x2apic_mode(s) )
+            set_x2apic_id(s);
+        else
+            vlapic_set_reg(s, APIC_ID, SET_xAPIC_ID(s->hw.x2apic_id));
+    }
 
     hvm_update_vlapic_mode(v);
 
-- 
2.47.0


