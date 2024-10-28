Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8B9B3550
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826690.1241102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0R-00026i-1Y; Mon, 28 Oct 2024 15:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826690.1241102; Mon, 28 Oct 2024 15:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0Q-00024G-QC; Mon, 28 Oct 2024 15:50:10 +0000
Received: by outflank-mailman (input) for mailman id 826690;
 Mon, 28 Oct 2024 15:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0O-0008FV-4H
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:08 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d9fdbdc-9544-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:50:06 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso650080766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:06 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:05 -0700 (PDT)
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
X-Inumbo-ID: 4d9fdbdc-9544-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130606; x=1730735406; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVXYPJCZuoH2OyHtUDCKgOdo7as5qgDULzyHGXZW2OE=;
        b=KoA5DhtSDYIPAB10JQZX7D80uvfd8+uvgt/7MlWoNTJfqFS/K2fzpWOa7u9eDyrymC
         0M7w38WkzG2xoxquTQ8Torm1TG2WNdOgAVNgS7TFSmcSztZrajMnmMsjEO+TEw7Q5ptv
         wN6y1Vrp6bTDpHKXdA9UPZ6IhAO2NQg2ic9jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130606; x=1730735406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVXYPJCZuoH2OyHtUDCKgOdo7as5qgDULzyHGXZW2OE=;
        b=g6tEpy0boAdqpfs6G9s3xHEpR3IsYVUdWuPQDQaskkqRLHjc4kyQqsnBgz5zhnkCyd
         6PBHFpwlwJ/k6duzYcBInVcGa0tKzGWBMkN/UY9SiYvEcGy1n4p0LS1JoZk0z7/ZYBdp
         fhNwYbJgNF6bhLgIfFYKnmiJaKdJ94MJo7v3ePP0jvfT9qADMvzM+bb8OFaePczcw2HM
         hf0hjb2bYBqBc+eY9ITVtaHvVSfukDlnslrZLqTdpVqFan9DvdMJmErLUmWX3qoGTtu8
         iVCiB7bVzMPQSB7zz6vwYjhYtov5kXewaKWokHQND4txDgW3pFUEWwsIHPfauU5JsFY9
         Y92A==
X-Gm-Message-State: AOJu0Ywds2uNAI+x90MVtOW+PlPo1XnbZZR5drY8nbdpcBjgZ9FEs5L0
	A9cGSwDbkA41sVVsW22c/7x3IM2Shd94bTYTMuQ0Y/gFdg5mytFTtttknJkmQwqstJVYlMpYikn
	V
X-Google-Smtp-Source: AGHT+IGx8bTDgJ193xI9eWu9eQdCHqvY2+04eGQudCrPjMKopwDOW6yd3cRVje2O0p1v6XvFRnf9/Q==
X-Received: by 2002:a17:907:728d:b0:a86:8e3d:86e2 with SMTP id a640c23a62f3a-a9de5d6e1f2mr935295266b.11.1730130605742;
        Mon, 28 Oct 2024 08:50:05 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 07/14] x86/domctl: Map/unmap xsave area in arch_get_info_guest()
Date: Mon, 28 Oct 2024 15:49:25 +0000
Message-ID: <20241028154932.6797-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/domctl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 5f01111619da..8f6075bc84b8 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1377,16 +1377,17 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     unsigned int i;
     const struct domain *d = v->domain;
     bool compat = is_pv_32bit_domain(d);
+    const struct xsave_struct *xsave_area;
 #ifdef CONFIG_COMPAT
 #define c(fld) (!compat ? (c.nat->fld) : (c.cmp->fld))
 #else
 #define c(fld) (c.nat->fld)
 #endif
 
-    BUILD_BUG_ON(sizeof(c.nat->fpu_ctxt) !=
-                 sizeof(v->arch.xsave_area->fpu_sse));
-    memcpy(&c.nat->fpu_ctxt, &v->arch.xsave_area->fpu_sse,
-           sizeof(c.nat->fpu_ctxt));
+    xsave_area = vcpu_map_xsave_area(v);
+    BUILD_BUG_ON(sizeof(c.nat->fpu_ctxt) != sizeof(xsave_area->fpu_sse));
+    memcpy(&c.nat->fpu_ctxt, &xsave_area->fpu_sse, sizeof(c.nat->fpu_ctxt));
+    vcpu_unmap_xsave_area(v, xsave_area);
 
     if ( is_pv_domain(d) )
         c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
-- 
2.47.0


