Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BFBB10F96
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 18:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056343.1424581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyiy-0008AC-RV; Thu, 24 Jul 2025 16:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056343.1424581; Thu, 24 Jul 2025 16:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyiy-00087V-JZ; Thu, 24 Jul 2025 16:23:16 +0000
Received: by outflank-mailman (input) for mailman id 1056343;
 Thu, 24 Jul 2025 16:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSid=2F=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueyix-0007fi-2E
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 16:23:15 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fc9c920-68aa-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 18:23:14 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45629703011so8890285e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 09:23:14 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcc2bc8sm2615965f8f.72.2025.07.24.09.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 09:23:13 -0700 (PDT)
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
X-Inumbo-ID: 7fc9c920-68aa-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753374194; x=1753978994; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUNEVSr3ncvwUF6ggoaVWELN0XIMn2xF+8CSNt91kWI=;
        b=UVDDL3qeKba8E5Tc27rUTFrs9550jE74zvFk7quAXIE7HGgsUaCZL0Z2/PGmHpPRgA
         Ps5UPBv/p/9wgNf2U7j/g1Hf9d9/Ycku0gzWPGRJzIdCCmmwyrQxnMNkCt2grBy15kvv
         f+2yCip3xM+mztYy4ia+FGIcWGfEewtdrIqTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753374194; x=1753978994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUNEVSr3ncvwUF6ggoaVWELN0XIMn2xF+8CSNt91kWI=;
        b=Wg1XFxl2JV2+Xl37EzUn0wlQy0NEJefR3uq2Xp/WUb/4vGuyq8D+RJkvR07SqJPEOG
         t0RR7CpVVyMc5mPYgYxBTQYDlauPx6lLvTf2Bt9/a0/O0GzVdGLKY6lu32PI+M7rQdNd
         li2zSymS9koq6NSfLpGU7tNJYBSvlDSV70yD4YOH1jYlL2ivycGq55SrxeUAsIeaucel
         0SGBYFKxo5DkF2SlTBmHeK03zMJKwxWvWkqz89BoM6O8D5rEFx2det1P1r1CVMLc3vSD
         OAUI47c5QDqyKXqbYRK2n2Rz1/PGE1p/SwaBEyigynyqUnlmhsZF5HfY8Ii1Gm5rPFzO
         ue5g==
X-Gm-Message-State: AOJu0YyNMLF4COl+48EjyIZteVhPb9sguXSR8yHGTCjYX4LUC0wJsEPc
	8rXqEW3JWXmFb0gkW5iPiDDN3QS61/pvjxZWYzf2S/n/p2/Me/JPupVYTGfpQ8uBxlqqY22sQu0
	fGrBewE/cBw==
X-Gm-Gg: ASbGncsLB+AjOEdngxJF3EhN0tPrCg9Mo6cH7EE58+RpU2pXH5bbn6yH+5kspL3JpFY
	VlrJ33WG03iS+IWBOq/A1uzk0Gg6NPKI5LgrZ2joxeatA5XSCnaXc7tYrjWbAWGyJAMTrgiiCOF
	30uAMEt0C9xvPZ9BCa/FyksQqmppduAH7DJOqSeMErUP1CKAJvON4jDmeuCdIyPBN/qir3Jb7Uq
	rSIbNzwFy9OuTXOA39wg/7qfx+qUvcJi7r02Gf5BxpydyJoCdgeEm/uvtrGDB2Z0HGq5EQ+VDwx
	GKCJ3tEIVQbpzXZlvMovsauZ0LnxARU3iZonZxUTxC0ZIiI1z0fyifINUv4zreBHUMdIKg4TVsc
	WZIuqA9dXfm5Zf9x4favcE6FGXv6GDyAh3hFwSMv0LKF1+ezUzxHypqsoiwFIWxJF+E9n7t9mvj
	kK
X-Google-Smtp-Source: AGHT+IETg+5zCDMSNlJU5qdzPhpVUm7Wxk3S3oTLmiE/cjvepU7na87Pjkr8kOByV4nXRahlrEt+Lw==
X-Received: by 2002:a05:600c:198b:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-45868c9d23amr73249835e9.8.1753374193796;
        Thu, 24 Jul 2025 09:23:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 3/4] xen/cache-col: Fix initialisation of domain colouring information
Date: Thu, 24 Jul 2025 17:23:05 +0100
Message-Id: <20250724162306.2978741-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
References: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, domains start with no colouring information and depend on a
XEN_DOMCTL_set_llc_colors(nr=0) hypercall in order to get default colours.

This in turn forces the toolstack to make a hypercall for all VMs even those
without colouring configured, and to ignore errors if Xen doesn't have
colouring active.

Introduce domain_llc_coloring_init(), replacing domain_set_default_colors(),
and call it during the trivial initialisation in domain_create().  Leave two
comments explaining the positioning.

The -EEXISTs condition in domain_set_llc_colors() needs adjusting as a
consequence, but that's easy enough to keep working as before.

Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/common/domain.c            |  6 ++++++
 xen/common/llc-coloring.c      | 33 ++++++++++++++-------------------
 xen/include/xen/llc-coloring.h |  2 ++
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 4f79ba39878c..28c2cc78cd88 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -878,6 +878,12 @@ struct domain *domain_create(domid_t domid,
     rwlock_init(&d->pci_lock);
 #endif
 
+    /*
+     * Doesn't allocate memory itself, but does set up data relevant for
+     * memory allocations.
+     */
+    domain_llc_coloring_init(d);
+
     /* All error paths can depend on the above setup. */
 
     /*
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index ea3e0ca07017..77a54beed1bf 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -230,24 +230,12 @@ void domain_dump_llc_colors(const struct domain *d)
     print_colors(d->llc_colors, d->num_llc_colors);
 }
 
-static void domain_set_default_colors(struct domain *d)
-{
-    printk(XENLOG_WARNING
-           "LLC color config not found for %pd, using all colors\n", d);
-
-    d->llc_colors = default_colors;
-    d->num_llc_colors = max_nr_colors;
-}
-
 int __init dom0_set_llc_colors(struct domain *d)
 {
     typeof(*dom0_colors) *colors;
 
     if ( !dom0_num_colors )
-    {
-        domain_set_default_colors(d);
         return 0;
-    }
 
     if ( (dom0_num_colors > max_nr_colors) ||
          !check_colors(dom0_colors, dom0_num_colors) )
@@ -272,14 +260,11 @@ int domain_set_llc_colors(struct domain *d,
 {
     unsigned int *colors;
 
-    if ( d->num_llc_colors )
+    if ( d->llc_colors != default_colors )
         return -EEXIST;
 
     if ( !config->num_llc_colors )
-    {
-        domain_set_default_colors(d);
         return 0;
-    }
 
     if ( config->num_llc_colors > max_nr_colors )
         return -EINVAL;
@@ -307,6 +292,19 @@ int domain_set_llc_colors(struct domain *d,
     return 0;
 }
 
+void domain_llc_coloring_init(struct domain *d)
+{
+    if ( !llc_coloring_enabled )
+        return;
+
+    /*
+     * Any change to this logic needs to consider the position of our call in
+     * domain_create().
+     */
+    d->llc_colors = default_colors;
+    d->num_llc_colors = max_nr_colors;
+}
+
 void domain_llc_coloring_free(struct domain *d)
 {
     d->num_llc_colors = 0;
@@ -321,10 +319,7 @@ int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
     unsigned int *colors, num_colors;
 
     if ( !str )
-    {
-        domain_set_default_colors(d);
         return 0;
-    }
 
     colors = xmalloc_array(unsigned int, max_nr_colors);
     if ( !colors )
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 45f250f9f39d..94dd22e949e7 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -21,6 +21,7 @@ extern bool llc_coloring_enabled;
 void llc_coloring_init(void);
 void dump_llc_coloring_info(void);
 void domain_dump_llc_colors(const struct domain *d);
+void domain_llc_coloring_init(struct domain *d);
 void domain_llc_coloring_free(struct domain *d);
 #else
 #define llc_coloring_enabled false
@@ -28,6 +29,7 @@ void domain_llc_coloring_free(struct domain *d);
 static inline void llc_coloring_init(void) {}
 static inline void dump_llc_coloring_info(void) {}
 static inline void domain_dump_llc_colors(const struct domain *d) {}
+static inline void domain_llc_coloring_init(struct domain *d) {}
 static inline void domain_llc_coloring_free(struct domain *d) {}
 #endif
 
-- 
2.39.5


