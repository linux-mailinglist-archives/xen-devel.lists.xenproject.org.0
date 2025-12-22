Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6DCD6B0C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:40:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192201.1511579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXixW-0005Yc-0C; Mon, 22 Dec 2025 16:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192201.1511579; Mon, 22 Dec 2025 16:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXixV-0005Ur-Np; Mon, 22 Dec 2025 16:40:33 +0000
Received: by outflank-mailman (input) for mailman id 1192201;
 Mon, 22 Dec 2025 16:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXixU-0004kh-3W
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:40:32 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed780244-df54-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 17:40:30 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64b8e5d1611so4640919a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:40:30 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f3e271sm1137038366b.60.2025.12.22.08.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:40:29 -0800 (PST)
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
X-Inumbo-ID: ed780244-df54-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421630; x=1767026430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNwjdy5MtRkLCdiw0Mfj0t/kIGmvAi3hjA2xW/bh4o4=;
        b=YSs8qS+VncWC9dzXbFkUwGEzjIldo/uflzsOMlavn+ivaPArqKKRwKTXckB/iVOuuC
         6ymM79VpIfIW60rqLUjPSnQoylLJpxc9ZTqvfxHoCN7Ng5EsE525nSWmT4IE3q+lyZaT
         zhFqpJZFoeDIhH4CmDSx8YXz3MbEdFTB5XmNX43M5mgsiTpeI2xXewcAjg3wipNnTGI0
         1n1SioIibhoHJP7tX2XP+uJ1eb9uAwTKFF414mh31N1TCpnDpBdH8mMMOtbglAM4CKRR
         nYynshCubjlHaqvy4DT/SZdKLGHaikeyhgsjpZg8/Sifufn89h+JtiAPkPiQaHxIg7sB
         S7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421630; x=1767026430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BNwjdy5MtRkLCdiw0Mfj0t/kIGmvAi3hjA2xW/bh4o4=;
        b=WHKvmZ2Fv+vlAprnkq0dcUvPqS9OhtgdNeoZWtcvVcvO43TQY/qOrvD+6u7O432fSL
         B5fj41pnbbihjTdaHJoUnaxLb3DLVx1qutwD3J2CxRtV653aRSRc0PiEJbK8I50yLPv+
         vGUvU8DTKHf1exZpmDhQ2iKUMz4LSNVsg3Uw8x4k/1omOFkUTKOtf8fiNT5jXxfqQgj2
         n5RIdr+K3x/wr4RwO3nX0KG0dPE8AwSwUaXbWiQ4W2Ad832f6VWmcaFXMUv4Dh7k/+gp
         Pp4mSSHVWUl5p3HojDo+h5uAFj9DdnN14B3iYTHsptN19DWTFlIvE20Pu9ILQen6L1Uf
         I1pA==
X-Gm-Message-State: AOJu0YzMXRBSWijgrOUSeJhtpEem1JEc16vlHQZZhtL1DMmh6hZKmFQD
	OaaH2tmL7a4G/8SkkEv31qrjomTbhMli9qjV2cQTmwCnW/dbNDwE3ACQR3/LWQ==
X-Gm-Gg: AY/fxX71McsQKAAYTdTf9pgqxBsFW5EFtz7tS1VGpA3n8QRrtq9PKkcutVKJdZtoJ79
	iq6S7BkB9uOOyPgbp/YRnofakJCal2dnKN12dXl0odp3Dc7swHH2m9+MjVfjP6g4AKUHEWqR6Hq
	HgPk0pP+SOaHufaKoGTpYPgpkqL6i+0JYYISuMy7jHNH81K68yE7te70nuU9sMrn3Fy0QOsy2wp
	VE9ibFhtRTYuFaId1X2ayT4lmzTO7cJKgP95NQ+iGTZv71Ys9q0VrdvORovgiaLi6P4KsINwJvc
	NaAsHNpwQPtW9A2hKds6hnswz9QA+seJCUH+4Fds+nBmwUtjdeULgDI7X609KD7xpxzONBdV522
	GMBR7N+h/BmbiDjqRuGWNbbV51xTQ1vulG0Ag1hDz69j9v/Gjvv8AxNkvy42SXhH+o2OCE0k0yd
	fMUqe37ag9Z+cU2YW5KVZoa9/kkp4jOJqVCCNWnFy4xNwING46z9BZgp0=
X-Google-Smtp-Source: AGHT+IFHbT58UFSAVUgtzRFhJKpDVbA/0v4hEH5GInvzZ4YJae2oeQe5zduQcBln5eMzXtvd4JIFsA==
X-Received: by 2002:a17:907:7fa8:b0:b73:572d:3b07 with SMTP id a640c23a62f3a-b8036fac50amr1281809566b.28.1766421629522;
        Mon, 22 Dec 2025 08:40:29 -0800 (PST)
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
Subject: [PATCH v3 4/4] xen/common: make {alloc,free}_domain_struct() static
Date: Mon, 22 Dec 2025 17:40:14 +0100
Message-ID: <07e8305e7d9730f65822f43ecefb7543b08f764b.1766404618.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766404618.git.oleksii.kurochko@gmail.com>
References: <cover.1766404618.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As {alloc,free}_domain_struct() are used only within domain.c,
they can be declared static and their declarations removed
from xen/domain.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
index 568a63b7c6a2..7a3e5ce6593f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -690,6 +690,27 @@ static int domain_teardown(struct domain *d)
     return 0;
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
 /*
  * Destroy a domain once all references to it have been dropped.  Used either
  * from the RCU path, or from the domain_create() error path before the domain
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


