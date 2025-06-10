Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109FCAD380C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010791.1389070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfr-0007G5-UZ; Tue, 10 Jun 2025 13:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010791.1389070; Tue, 10 Jun 2025 13:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfr-0007BD-KV; Tue, 10 Jun 2025 13:05:55 +0000
Received: by outflank-mailman (input) for mailman id 1010791;
 Tue, 10 Jun 2025 13:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfp-0004iH-5G
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:53 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3336bcd-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:05:52 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-60779962c00so5213372a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:52 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:51 -0700 (PDT)
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
X-Inumbo-ID: a3336bcd-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560752; x=1750165552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNkxZ42334+z6GmMxmxS+7HSKZw12YWQKs0/M8Vj5io=;
        b=VXGKD+3BuvSfjXDuVxFLUGSX/qdS+TkT9hIZOt5rs6BrZaMMYU3mLvV6mlqefJja7l
         n+XYMCFxUHGLsTB4L86733oc/5PfGcPh5mquKlLF+etXoiAMBGfr3lWX9GkQlNik5V/r
         rUmz3rzn3JMA9kc2Lmve4DdYEXThVRQk5msgRMcggnxe3zVDMvDXq/YaVijQ26R2pBw/
         G16s/YUGOyRojK4OHDBQzegbfRBBwHYpZS/lJOxYva0weBaMWMSI22O+7s/s8+E/WO5R
         QYL+P9oRcmDlqUFrULQHACAG20dxdynJaf6YCeDuvAPwcE4yqHIGYIGR5FF8rXDuJuSQ
         RHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560752; x=1750165552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNkxZ42334+z6GmMxmxS+7HSKZw12YWQKs0/M8Vj5io=;
        b=BbsvKjPZKSFve0fqlJm6ATTN5IpTUAid6+sVt0GQhGf4zC4os82M0wTIoHs4V6/8XZ
         J14exGyFZrxcr8u4e9bXKIJdoap2VvN81SMQrtPGhPOE4oPnLp/JZajn7xVqCnFiJ9j9
         BYtDJHrFmoKUGS+aQ3h0KTNAK6fjmuScrHsnLXJDoRqMpXVqxL2wW6oE2E5R6O3iZkUS
         Vfe6GKL3frf3B2Nn0mQwokcM8LQ1VKuCoR2t/K918oRbbuLlaA7bzHcLrIHp3AfbUg+i
         PwwH2x3K/pcfhZXtgFL1WvLnPxWgpLnJqOUh5xDZ+5IsylMIAxxLSiUAu/YSiW96G+c3
         wAXw==
X-Gm-Message-State: AOJu0Yz6xb9nstFqwbX+yjfaiNNulmPOASU4GEZTcz+BbsLieuBIZi8r
	io+iEQtWkOBLi+w06ar9VMI+Gli6nqzou6ezIXng9vlgyPI3QNhQ6JPlgz87Cw==
X-Gm-Gg: ASbGncsOiyY6ulD8EfGY0R5JCWWX2gmq5zF/lOsA8vkq4KI4qfHpl57ojpzyt9zPl0V
	U240fYchdxPi+VS6gMzbnDChWlQtBeTQQVr6QBhTzf7w8gDktv0punB0+jz+YwkLYr4QG9CwbFQ
	2dWFKs7FS5+vVGwlCLFIUv4j44HxqDsEWTdhEriCkHkwR6z3Dlvvyr/v7dhBoNQsV+vtzX5Iifj
	BxFeT53aK94185MhnX0G7ur19z7+rzhf2w5OB38MUFi5rGVXr6eXNYlDTFbYkLf6B8e0ktZ66sD
	HzJQRb2hVo3o7VaClcJI1aOenuSx0Gecusc0TzCFY3MxG8PvclAzrIMluBWhWlv6pGTX0fY6peC
	QBerDTnWltJzb/ufbwL24ogLStaI4
X-Google-Smtp-Source: AGHT+IEwUk/N6nuaSDBPQ9NVq1w1pYsClr/9Kn8IdxMkNjnhzTDXDYOmLNhr3sE9Kt5YGObsT2BNMQ==
X-Received: by 2002:a17:907:9349:b0:ad2:5499:7599 with SMTP id a640c23a62f3a-ade1a93baf1mr1471045166b.18.1749560751517;
        Tue, 10 Jun 2025 06:05:51 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 10/17] xen/riscv: implement guest_physmap_add_entry() for mapping GFNs to MFNs
Date: Tue, 10 Jun 2025 15:05:25 +0200
Message-ID: <0b1f7ead7eb1b7c8687d388cca50b46eefb8e408.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce an initial implementation of guest_physmap_add_entry() on RISC-V
by adding a basic framework to insert guest physical memory mappings.
This allows mapping a range of GFNs to MFNs using a placeholder
p2m_set_entry() function, which currently returns -EOPNOTSUPP.

Changes included:
- Promoting guest_physmap_add_entry() from a stub to a functional
  interface calling a new p2m_insert_mapping() helper.
- Adding map_regions_p2mt() for generic mapping purposes.
- Introducing p2m_insert_mapping() and a skeleton for p2m_set_entry() to
  prepare for future support of actual page table manipulation.
- Enclosing the actual mapping logic within
  p2m_write_lock() / p2m_write_unlock() to ensure safe concurrent
  updates to the P2M.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - This changes were part of "xen/riscv: implement p2m mapping functionality".
   No additional signigicant changes were done.
---
 xen/arch/riscv/include/asm/p2m.h | 12 ++++------
 xen/arch/riscv/p2m.c             | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 0c05b58992..af2025b9fd 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -118,14 +118,10 @@ static inline int guest_physmap_mark_populate_on_demand(struct domain *d,
     return -EOPNOTSUPP;
 }
 
-static inline int guest_physmap_add_entry(struct domain *d,
-                                          gfn_t gfn, mfn_t mfn,
-                                          unsigned long page_order,
-                                          p2m_type_t t)
-{
-    BUG_ON("unimplemented");
-    return -EINVAL;
-}
+int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn, mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t);
 
 /* Untyped version for RAM only, for compatibility */
 static inline int __must_check
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 2419a61d8c..cea37c8bda 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -324,3 +324,44 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 
     return 0;
 }
+
+static int p2m_set_entry(struct p2m_domain *p2m,
+                         gfn_t sgfn,
+                         unsigned long nr,
+                         mfn_t smfn,
+                         p2m_type_t t,
+                         p2m_access_t a)
+{
+    return -EOPNOTSUPP;
+}
+
+static int p2m_insert_mapping(struct domain *d, gfn_t start_gfn,
+                              unsigned long nr, mfn_t mfn, p2m_type_t t)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc;
+
+    p2m_write_lock(p2m);
+    rc = p2m_set_entry(p2m, start_gfn, nr, mfn, t, p2m->default_access);
+    p2m_write_unlock(p2m);
+
+    return rc;
+}
+
+int map_regions_p2mt(struct domain *d,
+                     gfn_t gfn,
+                     unsigned long nr,
+                     mfn_t mfn,
+                     p2m_type_t p2mt)
+{
+    return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
+}
+
+int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn,
+                            mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t)
+{
+    return p2m_insert_mapping(d, gfn, (1 << page_order), mfn, t);
+}
-- 
2.49.0


