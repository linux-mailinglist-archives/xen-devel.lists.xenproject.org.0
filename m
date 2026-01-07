Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEA9CFEDE9
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196895.1514619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWPL-0000Pg-E9; Wed, 07 Jan 2026 16:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196895.1514619; Wed, 07 Jan 2026 16:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWPL-0000OS-74; Wed, 07 Jan 2026 16:29:15 +0000
Received: by outflank-mailman (input) for mailman id 1196895;
 Wed, 07 Jan 2026 16:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufZv=7M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vdWPK-0008M3-9N
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:29:14 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffb0f3ea-ebe5-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 17:29:12 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64d30dc4ed7so4330057a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 08:29:12 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a2bcd30sm564782166b.28.2026.01.07.08.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:29:10 -0800 (PST)
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
X-Inumbo-ID: ffb0f3ea-ebe5-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803351; x=1768408151; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ez9JtZF2nCaMC9sk3cjdnVhQzElopUuISWmFxgfkIg=;
        b=gMSUDviglT8AuI7JEqJj33JZyB396lQQ7TbKWt0CkqlZtW4XMNPCTy48bczNcjJ9vz
         gkiI4V/a/G+3ga3f6s9tAvjDN5BkFIsiuqw0xn7dYc47V/vrwy+1wB5LZSB6sP5R7ucd
         6dQT4hmZRlN/q+9LyK3lsUSPUTh+WgtF38LojOyTSzZJNCHIVn31B1Wo8nmn9YqN6US3
         D+3ba2+gUii4WgGHfzSwKqK0Dcn2XZMzv0LEpVG55ug+YiH3KyBZObeshpxlQDAi2Mw4
         x49ZsWzVeA6WfYdLSdc291uWYYOiEsFxbgLfwZnMcMfTYlShVevcjftu7gpiz2U+YskY
         +aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803351; x=1768408151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ez9JtZF2nCaMC9sk3cjdnVhQzElopUuISWmFxgfkIg=;
        b=T5aqGMnT0lIiS/0GccVwQ320OrX7ENd/TW8ZLn2LSPLn1qYlU/nNmkUA8WloSsGMpo
         dc9Xb5yxNA0dXHdaOsiAcoa47mQfs4ZyacjEulkifEOwlu8F4gEqJGFnxwCINTw0+mS2
         LpYG7Cc9is2troxn8x/jc3oIz395y0dzOca/wAVvFc8nJCk2DDGSVjU3jceKle6OYEIg
         vUiFwqoaMFupMBlYbSMpsRxD4Y3sueaB/q30j5Ljp0gPtDltt2m2jWrcac6m5y8J3tCY
         jx5U9QI7LFgE1/aU51Gbz6gg8TkA/5z2hW2S3Pk5kWldwyeTRFaKhaSJMt193vl2y0Ty
         aYug==
X-Gm-Message-State: AOJu0YymjiUdv1tqdBcSYTkerUZ5CEhfoiJMCGqHTW9T8P3cbbbASDJF
	ihIFc/3Qk5648mJ3l69SEvJFap5jusuj0hGRdkGB+bPtPHmB7eklN3bb9wX3LA==
X-Gm-Gg: AY/fxX5ia+3cRWrK/pwmgZbCH/8YLtYwWFWSxDMQix/bnSe6/uiCdURX1s8kBQhf3TR
	umHRSIWeLn8DQx+GgRaHIEbgZXNI0ckh3NgjkXHUPeOhrHgcSS/vQ1BRuxe/8fTZ9Z2zKH1dj3w
	/nRy5nKCf3RzIJTBb/f2VSgJRJty1yqAHD0pmyIxy29/p007H2QyzMBq+rFq+jONlwvW6PJbmx9
	ogwF9uJK6x5B72UYXF+RT890ATzyUHuK39RN+OsqZfZYXnayb3h6iPyvhhObt9Ho3hKbMGqMAE7
	r1ChBhACz7Mcix1HsUirf7qiuQKwnnN6/XMxuenGjzU+hO2PagFSALsWRoHZIbtbzl9+AUozJoI
	iP7rM/7G+1lrtOPQpgYShRylfFU5oWFoTyf8NVlo8CYVahiUL/JaSLtMC4l/aEKmm+WoLB0q++f
	P5k8FVfkpSVQSP6ULOzedyhLGqcuWJv3lzMhewC3dUL3YPueX3KYiuKQ==
X-Google-Smtp-Source: AGHT+IHV63gItJh83a3Xjq66Fr6D9okyLbTXxBWVEeQ7oPpDm6Zy3VvB5Ttt/7AsQUQhSv/m0Z66yQ==
X-Received: by 2002:a17:907:1c8c:b0:b83:a4a7:725e with SMTP id a640c23a62f3a-b8444c9e3c8mr352466566b.24.1767803351213;
        Wed, 07 Jan 2026 08:29:11 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 3/3] xen/common: make {alloc,free}_domain_struct() static
Date: Wed,  7 Jan 2026 17:29:00 +0100
Message-ID: <c1d4a8de405682b1f8b1f2c0dc7fcff25f3a4e93.1767803084.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1767803084.git.oleksii.kurochko@gmail.com>
References: <cover.1767803084.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As {alloc,free}_domain_struct() are used only within domain.c,
they can be declared static and their declarations removed
from xen/domain.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in v5:
 - Nothing changed. Only rebase.
---
Changes in v4:
 - Move implementation of alloc_domain_struct() and free_domain_struct()
   ahead of alloc_vcpu_struct().
---
Changes in v3:
 - Move alloc_domain_struct() and free_domain_struct() to not have
   forward declaration.
 - Add Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>.
---
Changes in v2:
 - New patch.
---
 xen/common/domain.c      | 42 ++++++++++++++++++++--------------------
 xen/include/xen/domain.h |  4 ----
 2 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 655d9590f846..ed4b6175de0b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -316,6 +316,27 @@ static void vcpu_info_reset(struct vcpu *v)
          : &dummy_vcpu_info);
 }
 
+static struct domain *alloc_domain_struct(void)
+{
+#ifndef arch_domain_struct_memflags
+# define arch_domain_struct_memflags() 0
+#endif
+
+    struct domain *d = alloc_xenheap_pages(0, arch_domain_struct_memflags());
+
+    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
+
+    if ( d )
+        clear_page(d);
+
+    return d;
+}
+
+static void free_domain_struct(struct domain *d)
+{
+    free_xenheap_page(d);
+}
+
 static struct vcpu *alloc_vcpu_struct(const struct domain *d)
 {
 #ifndef arch_vcpu_struct_memflags
@@ -819,27 +840,6 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     return arch_sanitise_domain_config(config);
 }
 
-struct domain *alloc_domain_struct(void)
-{
-#ifndef arch_domain_struct_memflags
-# define arch_domain_struct_memflags() 0
-#endif
-
-    struct domain *d = alloc_xenheap_pages(0, arch_domain_struct_memflags());
-
-    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
-
-    if ( d )
-        clear_page(d);
-
-    return d;
-}
-
-void free_domain_struct(struct domain *d)
-{
-    free_xenheap_page(d);
-}
-
 struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
                              unsigned int flags)
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 644f5ac3f293..273717c31b3f 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -66,10 +66,6 @@ void domid_free(domid_t domid);
  * Arch-specifics.
  */
 
-/* Allocate/free a domain structure. */
-struct domain *alloc_domain_struct(void);
-void free_domain_struct(struct domain *d);
-
 /* Allocate/free a PIRQ structure. */
 #ifndef alloc_pirq_struct
 struct pirq *alloc_pirq_struct(struct domain *d);
-- 
2.52.0


