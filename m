Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB515A091ED
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869515.1280996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4e-0002XT-V8; Fri, 10 Jan 2025 13:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869515.1280996; Fri, 10 Jan 2025 13:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4e-0002UF-O6; Fri, 10 Jan 2025 13:29:16 +0000
Received: by outflank-mailman (input) for mailman id 869515;
 Fri, 10 Jan 2025 13:29:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4c-0000vX-TU
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:14 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1b0135c-cf56-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 14:29:13 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fdafso4034677a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:13 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:12 -0800 (PST)
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
X-Inumbo-ID: e1b0135c-cf56-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515752; x=1737120552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCX/yh7HycpxvmfWA8KKNWXNQA4qbA28JEl6dZ92/5k=;
        b=eMgrfm00v/DfijO/Z7ZyU+vZPe5C3+0kl6btixzaSIiW5+8/Epbji/YTx9Lrg3UmvV
         M/DEqs/xw3X7deL6pUAoKQaYLtXzSRX7+aAAxeiGXTxbQ2CL5HjgccXj7WbAVy9LZHCh
         MvMoJlR8MMnmcrFDIpDaWAJleqjm3Dg2fvQI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515752; x=1737120552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCX/yh7HycpxvmfWA8KKNWXNQA4qbA28JEl6dZ92/5k=;
        b=kqUIAPayeKjloHG4QXbKVYcAmFBtxeKJqdlc5Ma2fMhDleEVPmdLErLrQom1RJtC/b
         sOwkvcAjeZmxfGBm/YqHJjRvuroOzXsemw9miC4vJSawL+tRC9yf7GMbiyFIhRsPPLp2
         Akus6zCuHD93niO6obq0/xgD+I2Xml6pWEJSCzc5BTSqCjdbCQQKooTPB4eYTEuNjoCK
         XnCpC7d1lVjlcpMHd8bm45qRoxDD9MSWSceNVLaxzjYJH+NU0sNM04bPjEM01v5jhyBP
         Rsr8QNae4mbvjqwaGfrJry46+pKNzq7HfX9J+83TP2WekNNEvPXJOmoJxU5rZ0xF9pcC
         fO7A==
X-Gm-Message-State: AOJu0YykiBBpPCzMmBIyTzgHmdv2f0n1WmsVMJEo1Tl3Zh6w1fnXIxCQ
	CcUvfzE1X4gfXOo/QTOArJvXEhFRRyG8OA1gzD6aZdmLpsZNZ7F2KsXOczPg91+zVAJi/36B/+w
	gaFMwRg==
X-Gm-Gg: ASbGncu2/7ccdC/3V7MYmiO671v+GGjOTTox6Y2FQP3MiC7flBk3hh67sobrVQHS9ZL
	I0TGJ5a3idQEX4zruPt8OS4R0tKMQTCz+/bnq0ZUSCstZ6gTShukYNZHmoD1qikZrHZbdf5No2Q
	M8FlfIHDWRDFUWDSG0WYYEf2zz4BLEfIZXNUftqFWwZw3x/V+0jdP+vTeBVxTlqDoIMsZYaF4Aa
	midWl+Prq5JXmyEjvGxubWcEAn/rs5VbfE4y5yX1CH+yzQtI2k8CJu0RS9Kac58Vrc3/kAYnmiN
	JKQ=
X-Google-Smtp-Source: AGHT+IFt0+J+MzwzmdDfbFOmSHL+99J1n+bWPWq8Lzmmx0aBwjpOqjzKgIrvM+hZK/x8jYYJOdfbsA==
X-Received: by 2002:a05:6402:430c:b0:5d4:75b:8ced with SMTP id 4fb4d7f45d1cf-5d972e6bdf5mr9861162a12.32.1736515752585;
        Fri, 10 Jan 2025 05:29:12 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 06/12] x86/domctl: Map/unmap xsave area in arch_get_info_guest()
Date: Fri, 10 Jan 2025 13:28:17 +0000
Message-ID: <20250110132823.24348-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1->v2:
  * Added A-by

v1->v2:
  * No change
---
 xen/arch/x86/domctl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 5f01111619da..3044f706de1c 100644
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
+    xsave_area = VCPU_MAP_XSAVE_AREA(v);
+    BUILD_BUG_ON(sizeof(c.nat->fpu_ctxt) != sizeof(xsave_area->fpu_sse));
+    memcpy(&c.nat->fpu_ctxt, &xsave_area->fpu_sse, sizeof(c.nat->fpu_ctxt));
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 
     if ( is_pv_domain(d) )
         c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
-- 
2.47.1


