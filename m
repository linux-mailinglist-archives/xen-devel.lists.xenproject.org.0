Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46E8984985
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803106.1213561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8LD-0007Wl-BA; Tue, 24 Sep 2024 16:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803106.1213561; Tue, 24 Sep 2024 16:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8LD-0007Ul-7T; Tue, 24 Sep 2024 16:24:43 +0000
Received: by outflank-mailman (input) for mailman id 803106;
 Tue, 24 Sep 2024 16:24:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5PF=QW=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1st8LA-0005nz-Vp
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:24:40 +0000
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [2607:f8b0:4864:20::92b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ec0c3f4-7a91-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 18:24:39 +0200 (CEST)
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-846bcf3677dso1738448241.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:24:39 -0700 (PDT)
Received: from gmail.com ([168.243.189.171]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-505a9f3ef5dsm1004934e0c.13.2024.09.24.09.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:24:35 -0700 (PDT)
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
X-Inumbo-ID: 7ec0c3f4-7a91-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727195077; x=1727799877; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OruaAEFhBMQDA4a5iLLJKMhZYEY7GZkxUS8+VDnr6Do=;
        b=PEHX5sNyIT9AAcjvo0tIDxjek1xGAMmcRrX+br8UJhzZb/ioZOPOl++JN6JdsiYNRA
         lAHipP24xH5UP9O68HHaolQkDzf3Oj/KskgO+huTwcTiMI0/SV9In7SFXMMNs4LLyIHG
         G/yWQ4Gr44rL4McQmbiG0W9hjCEZ/XF4+xFzq4s5JrwY0f6dcIK3YGh+HEirY8t27jJm
         J10kCXs84IfD6YbM1E7AKsuf8lcN24fTEBd45SW8OAPBOpTQHHGtOHPX9kYuP0m0B+qV
         vieQkkuoWuawDXHvXnERZ+JRbxJtp69I7aniqeGDWgGWqcr7ATLTqaIet7oCdnjfucV7
         SaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195077; x=1727799877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OruaAEFhBMQDA4a5iLLJKMhZYEY7GZkxUS8+VDnr6Do=;
        b=A75V3FOVI4gjrznAwC0hWXKA7ic1973XNzdoafc+kX5bLRLprHLLtkAKuUZp7IIhlz
         LY1DG+k17eqMdYHDYG5s6t5igVxaHLEuDKoMpRD6Jtu3mmvOmidPY9u8+ImBy0FanOBh
         6aJINgQXxrZlJh1Un9BTRY3ExZcny6JDQY3iF4xB909nLqavDwMmFG7LThV0VCV7bpsW
         DOh1JL2L+XrwdoxS+jyShBh31IOWFkiwUaPwIpFpYyxlOlV1K81yXlE1l8gNGFj96klD
         vXc4EGHpbFwVmZ9xCJ3nFvRIgXEBFwlFIUqRqKv6CChgJnoaZRfhCX/hO7lqWX/N9Cws
         Y78A==
X-Gm-Message-State: AOJu0YzAs+24TzIxBls/6GXAG7TLZxC0gvOgfBn7bdQbadeWnCbYJ//J
	B7jPKYjUHjLoMT6rpshiFQwoVwspRnM08sDxgqxgKfSBmHb3VDSzmFgzF/WC
X-Google-Smtp-Source: AGHT+IF1mRdmv0tKI3wG2Qd4pOBERiQOFk3OIhRXEWtv21RYXXQ6DCRFbQVyydxhF8cBo0RYjsfQ2w==
X-Received: by 2002:a05:6122:2001:b0:4ed:145:348f with SMTP id 71dfb90a1353d-505c20c9250mr43780e0c.12.1727195076637;
        Tue, 24 Sep 2024 09:24:36 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	dpsmith@apertussolutions.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 4/6] xen/arm: io: Add support for mmio background regions
Date: Tue, 24 Sep 2024 18:23:57 +0200
Message-ID: <20240924162359.1390487-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add support for mmio background regions. These regions
can be overlayed by IOREQ handlers and thus act as
fallback handlers while IOREQ clients haven't registered.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/include/asm/mmio.h | 11 ++++++++++-
 xen/arch/arm/io.c               | 18 ++++++++++++------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
index b22cfdac5b..7da542cd79 100644
--- a/xen/arch/arm/include/asm/mmio.h
+++ b/xen/arch/arm/include/asm/mmio.h
@@ -70,6 +70,7 @@ struct mmio_handler_ops {
 struct mmio_handler {
     paddr_t addr;
     paddr_t size;
+    bool background;
     const struct mmio_handler_ops *ops;
     void *priv;
 };
@@ -83,9 +84,17 @@ struct vmmio {
 
 enum io_state try_handle_mmio(struct cpu_user_regs *regs,
                               mmio_info_t *info);
+void register_mmio_bg_handler(struct domain *d,
+                              bool background,
+                              const struct mmio_handler_ops *ops,
+                              paddr_t addr, paddr_t size, void *priv);
+static inline
 void register_mmio_handler(struct domain *d,
                            const struct mmio_handler_ops *ops,
-                           paddr_t addr, paddr_t size, void *priv);
+                           paddr_t addr, paddr_t size, void *priv)
+{
+    register_mmio_bg_handler(d, false, ops, addr, size, priv);
+}
 int domain_io_init(struct domain *d, unsigned int max_count);
 void domain_io_free(struct domain *d);
 
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 96c740d563..934a2ad2b9 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -159,6 +159,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
 {
     struct vcpu *v = current;
     const struct mmio_handler *handler = NULL;
+    bool has_background;
     int rc;
 
     ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
@@ -170,13 +171,16 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     }
 
     handler = find_mmio_handler(v->domain, info->gpa);
-    if ( !handler )
+    has_background = handler && handler->background;
+    if ( !handler || has_background )
     {
         rc = try_fwd_ioserv(regs, v, info);
         if ( rc == IO_HANDLED )
             return handle_ioserv(regs, v);
-
-        return rc;
+        else if ( !(rc == IO_UNHANDLED && has_background) ) {
+            /* Only return failure if there's no background handler.  */
+            return rc;
+        }
     }
 
     /*
@@ -197,9 +201,10 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         return handle_read(handler, v, info);
 }
 
-void register_mmio_handler(struct domain *d,
-                           const struct mmio_handler_ops *ops,
-                           paddr_t addr, paddr_t size, void *priv)
+void register_mmio_bg_handler(struct domain *d,
+                              bool background,
+                              const struct mmio_handler_ops *ops,
+                              paddr_t addr, paddr_t size, void *priv)
 {
     struct vmmio *vmmio = &d->arch.vmmio;
     struct mmio_handler *handler;
@@ -213,6 +218,7 @@ void register_mmio_handler(struct domain *d,
     handler->ops = ops;
     handler->addr = addr;
     handler->size = size;
+    handler->background = background;
     handler->priv = priv;
 
     vmmio->num_entries++;
-- 
2.43.0


