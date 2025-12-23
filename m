Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96648CDA058
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 18:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192708.1511868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5m5-0001p7-JS; Tue, 23 Dec 2025 17:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192708.1511868; Tue, 23 Dec 2025 17:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5m5-0001mC-Es; Tue, 23 Dec 2025 17:02:17 +0000
Received: by outflank-mailman (input) for mailman id 1192708;
 Tue, 23 Dec 2025 17:02:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtgv=65=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vY5m3-0000rG-Ft
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 17:02:15 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fde30af-e021-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 18:02:12 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b8052725de4so379259766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 09:02:12 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80464e01d9sm1306260566b.42.2025.12.23.09.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 09:02:11 -0800 (PST)
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
X-Inumbo-ID: 1fde30af-e021-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766509331; x=1767114131; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53lxFHrWyKrVGe7Q7DFq09Waedw2HF5xUPeWdO/aDjY=;
        b=enWmrLDOtXjYcL0F596u3QHl1z8R2XD6oVzDdO23g+H4dMT03pwCznKVqJPtn9RjNe
         gEC3KRIag2oJvgbk9dXilfEmtT5Qio+yITG63C8hcf8aduEODQNmWpx5sun9axlCHg5f
         SRIKQQXs4IHM48z1F1nO6raYnTsg0NsQdbfg8SQeH7q2WjJNEsyZTKtKinT4FOd8gXrd
         rWqeAosJPGZAabt9MxUs7PGMHwqcz5xw/751StZQXC7BPxQCGLPd282URA46pHQ5S8hr
         x/vproxHex4o+/zyudKKZ6tqAF8br62YO9MyFjCSIKlXx9RwHCFuMooRuJVe+WXb/ttW
         4fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509331; x=1767114131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53lxFHrWyKrVGe7Q7DFq09Waedw2HF5xUPeWdO/aDjY=;
        b=JeALDNqCA8rTgDkTPGZxrfGfRxGzWRfUKQT3sNQbDeZC7DTFE4BqY50Ij5jlvywB5Y
         VmBgfL2cihyhy6vbDG9Z0QC+DWvRox1cTfDTG7P2R31bxkDq10lebL9BvOVLLiMTUPSQ
         wg23ZykBKpPwg8bI/semg7UMPo50NABYw26fAJy6OOsavOM8hxJKCwakcLQYH2D3rADf
         JQ+O71u6R71oDao3g8ZyguZfHqCMBPR5E+BzAkQmdx8Bpkg39OcaEWFZIDv18UZPJcfd
         0ev6pCqKO2FiqLPgJ64I1Mj92HDzADP516EPMt182LPkwDWmKhEkeGsBsbkDN+6DS1KQ
         XEKA==
X-Gm-Message-State: AOJu0Yzo4T1jRZanen1cX4ENX9simTflLbOtW+tiL7LNPNe+muUa6IMy
	bqSzj+cjDHykKejylHA6bSiCsj1Rmihe/3oyZ5JcboSL6/mw2AyAWqFuZBWygg==
X-Gm-Gg: AY/fxX6KOclqJC+NYf5nMbt45gC6onUTln60ffjgGSAhLW4g/BrK8oiV6wLbT6JWjtC
	tEOZHmrBMu4g+08YkMCmZWiLHkdX0areLnMnIaPK/+hHGyUsnaBuVtaO2l4XQ8tF023NkcGFlT2
	DtImL4ZnFRSxhqWU0GjRy2hpWbyUwBO85O52vgrdZOawlfOz4Q2b3v8ouvUF+/9Tdal0l5Zorma
	m90fx++VsO5PSt1QAulL+apj913lNSjr7TsGaajKwHwCOLQR7APaIjnaNAYbdA25RnX/cUaVl1O
	g9np5ycx2HL//nGd2cUYBD6xbXj61RFZ+F7495IkNQ8FR2wc1xXeAkYMzLyszAvseDFab8YaZ+G
	KYTNhGSY4sv6KPRQNKbb5ODXrKHTLjQpYjk4szmspI/k2fDXnTuy+1I2skjxnDwVWIIidQEYrm5
	LJXtqgYeEmeN9W09bnygRing5s5okbTmopwU8GqUj1N5Umb78LXC+r+50=
X-Google-Smtp-Source: AGHT+IHXnaNp4fKXvrKrxjOgAN7KGFkLq1lGkwU6OoXQPf/mSnwxKFE0bLIQUQV9NuMYq7RGZQkAFA==
X-Received: by 2002:a17:907:e106:b0:b80:4103:537e with SMTP id a640c23a62f3a-b80410355bcmr1001770366b.53.1766509331372;
        Tue, 23 Dec 2025 09:02:11 -0800 (PST)
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
Subject: [PATCH v4 4/4] xen/common: make {alloc,free}_domain_struct() static
Date: Tue, 23 Dec 2025 18:01:58 +0100
Message-ID: <8f1c95499cddf63310b72c7a0913b2b37ca3c24b.1766504313.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766504313.git.oleksii.kurochko@gmail.com>
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As {alloc,free}_domain_struct() are used only within domain.c,
they can be declared static and their declarations removed
from xen/domain.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
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


