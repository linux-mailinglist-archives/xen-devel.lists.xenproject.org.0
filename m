Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334DE9B3554
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826691.1241106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0R-0002A2-Fx; Mon, 28 Oct 2024 15:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826691.1241106; Mon, 28 Oct 2024 15:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0R-000275-62; Mon, 28 Oct 2024 15:50:11 +0000
Received: by outflank-mailman (input) for mailman id 826691;
 Mon, 28 Oct 2024 15:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0O-0008FV-VJ
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:08 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e1db68c-9544-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:50:07 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c94c4ad9d8so5620233a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:07 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:06 -0700 (PDT)
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
X-Inumbo-ID: 4e1db68c-9544-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130606; x=1730735406; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/RnzlnP3G9CO4SusiLr8zIyIe7394ke2U9MPNKtXhg=;
        b=O6XncR+HGoONTeR42svBZ0ktT0A85b789pK57ek5U/GAixGKJXujbWwjw9nkBW7atJ
         E+8QGGRa59byB6cRLD+bfnrFDnyErhV2KEtNk4ZtLc1jJvvLbkWTXUQ4lg69M0FHh+8H
         fbpHHfJAz6J2QTucGCIaS99WJSFJwmdpLafws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130606; x=1730735406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/RnzlnP3G9CO4SusiLr8zIyIe7394ke2U9MPNKtXhg=;
        b=fjOaHjEDKc5WZbpGqFBKawuhqLonz1biXHN6jA1fQu7GzXBgLovfxS+6Wd7vQZak09
         C2f1FjP3GNp8uuDKMbJZke2iOhQmK9e/fPPQi9kus1tyGoyweLQGNAnaXgaIN3DgGm6+
         VBvf7VHvwCdXRxd6aX2NxHWy3onbzIp9UMAlnHqjfLJHu94AztgAyL0Xz5et11dt2haG
         dAXpq6nBwVCILDLf+ncOSduCpFEuAIIU2qCvJ/LJR/iFZAxYAan+/dElVaHWe+/w6F+D
         LtQZS2FXEiK7KROOaxVxsS7mlJH90vn9un0f94IEU8CCJ8Xu5M1juZyXrBsCnzRw4hHs
         eQKQ==
X-Gm-Message-State: AOJu0YyxCj21mw8JApE8W75wUXKKiPtZ9kqdelPpmNW4FKUNoylk6Ulw
	akJ0FP8FKbXbcKPE0uC8dQPK9w+wz6TgzovP69QkAqnayF6I+tOAU8hRGgjDhjuMzc5DDt6shgt
	L
X-Google-Smtp-Source: AGHT+IEKmbjye0E8XCJyiovjf17ficSIKt+h3itpmbWhUSPk51uXP6fJi6EvzMuZ6L65ZsGREr72qw==
X-Received: by 2002:a17:907:31cb:b0:a9a:3cf:cdb8 with SMTP id a640c23a62f3a-a9de5f72a86mr852630566b.36.1730130606628;
        Mon, 28 Oct 2024 08:50:06 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 08/14] x86/xstate: Map/unmap xsave area in {compress,expand}_xsave_states()
Date: Mon, 28 Oct 2024 15:49:26 +0000
Message-ID: <20241028154932.6797-9-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/xstate.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 60e752a245ca..4019ca4aae83 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -177,7 +177,7 @@ static void setup_xstate_comp(uint16_t *comp_offsets,
  */
 void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
 {
-    const struct xsave_struct *xstate = v->arch.xsave_area;
+    const struct xsave_struct *xstate = vcpu_map_xsave_area(v);
     const void *src;
     uint16_t comp_offsets[sizeof(xfeature_mask)*8];
     u64 xstate_bv = xstate->xsave_hdr.xstate_bv;
@@ -228,6 +228,8 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
 
         valid &= ~feature;
     }
+
+    vcpu_unmap_xsave_area(v, xstate);
 }
 
 /*
@@ -242,7 +244,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
  */
 void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
 {
-    struct xsave_struct *xstate = v->arch.xsave_area;
+    struct xsave_struct *xstate = vcpu_map_xsave_area(v);
     void *dest;
     uint16_t comp_offsets[sizeof(xfeature_mask)*8];
     u64 xstate_bv, valid;
@@ -294,6 +296,8 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
 
         valid &= ~feature;
     }
+
+    vcpu_unmap_xsave_area(v, xstate);
 }
 
 void xsave(struct vcpu *v, uint64_t mask)
-- 
2.47.0


