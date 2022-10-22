Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA26B608E46
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428409.678505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGml-0002if-SE; Sat, 22 Oct 2022 15:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428409.678505; Sat, 22 Oct 2022 15:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGml-0002dq-IN; Sat, 22 Oct 2022 15:51:43 +0000
Received: by outflank-mailman (input) for mailman id 428409;
 Sat, 22 Oct 2022 15:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U686=2X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1omGmj-000237-P9
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:51:41 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b7dbd17-5221-11ed-8fd0-01056ac49cbb;
 Sat, 22 Oct 2022 17:51:41 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id m15so16314590edb.13
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 08:51:41 -0700 (PDT)
Received: from carlo-ubuntu.home (62-11-205-162.dialup.tiscali.it.
 [62.11.205.162]) by smtp.gmail.com with ESMTPSA id
 z61-20020a509e43000000b00461816beef9sm894623ede.14.2022.10.22.08.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:51:39 -0700 (PDT)
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
X-Inumbo-ID: 6b7dbd17-5221-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44pwASrsnAtpDyfghbc69EETaGukeSYMbtotZhaVziA=;
        b=67egSdyQL5j+k0rN/iWcaUcLI1czr9vtDoWgZlfZPgZ/pUhPe8QBKsSV9mAAbyz1dD
         DxTEvp9iYYSk0yajTw62FmJ5xf1qz3SwLM1s3nO9ChGgAz/86GBvGFjwTzsTZQ8ln2I/
         R8nCjfauW+gTeK8K/OYu0J6Wxv7MKhmzgNENwro9MOUWiOSeXHwMvY8/pa7d7dlB+utn
         1/VD+x0DQUbO3STeE3w7KVxFwNpgGQtTbwv+AKEVSRkfbl/AONqXFlLYfxSVGiBje+5g
         GQAZEsGVuRiG2KBNB9itfOKRTZibjbn3vYiz5xo7s4V/OlOijTo9+r3YNNNipcIkrIUL
         lnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44pwASrsnAtpDyfghbc69EETaGukeSYMbtotZhaVziA=;
        b=AZIeJzQFwiYfzOy4JasOyfoA2dgvIG/6RqjhOZl7GCmdf8oP7aYM/NjQaVUtm+KHBr
         F8lH8Vk+J5mkWrXJeH1XFGRMcVUNZa+hZUCM7mh2b6XfnyIC2IR8HCbfop0tRyLz3WH4
         FOWkKJcdBix+wEv0XHdttCBFOJ82FmUHoSk4h397Tn/i1Vdej3ZmWYjzKrw54LpeHlzy
         GuxuPr6lI6yxoQz3D9mgEEV1C1CKjOzQzvdGwvaf2fjKs9w5ae6h8tg++1kMVXq5yus3
         gRuYGmcVjpuAeNazDJ70PlGdLUC1wZBYUc8GSKzMf9QOZEJ0VrX46W8pV52Pg3Y8wFUl
         HLBA==
X-Gm-Message-State: ACrzQf05dtd+eiJlAhyDaJEGHtJtdDDEqSI9v/Mv/imUVqLdpdfIhbJI
	ggH6i2wH9P2pa6YksWkWCiiAUwnAd+c6bA==
X-Google-Smtp-Source: AMsMyM6fXvk7dOHt5Y489MTW7mh6g9xd/jtS5DU9BKHmegYyol5/wT6I/wSwGz3b79bgbfbPVrA7Hg==
X-Received: by 2002:a17:907:75c6:b0:79c:d3f4:4a14 with SMTP id jl6-20020a17090775c600b0079cd3f44a14mr6524923ejc.61.1666453900285;
        Sat, 22 Oct 2022 08:51:40 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v3 3/9] xen/arm: dump cache colors in domain info debug-key
Date: Sat, 22 Oct 2022 17:51:14 +0200
Message-Id: <20221022155120.7000-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

This commit adds cache colors to the information dumped with the domain
info debug-key.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
 xen/arch/arm/coloring.c             | 16 ++++++++++++++++
 xen/arch/arm/domain.c               |  2 ++
 xen/arch/arm/include/asm/coloring.h |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index a7b59f5aba..cf8aa8a2ca 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -172,6 +172,16 @@ static unsigned int set_default_domain_colors(unsigned int *colors)
     return max_colors;
 }
 
+static void print_colors(unsigned int *colors, unsigned int num_colors)
+{
+    unsigned int i;
+
+    printk("[ ");
+    for ( i = 0; i < num_colors; i++ )
+        printk("%u ", colors[i]);
+    printk("]\n");
+}
+
 static void dump_coloring_info(unsigned char key)
 {
     printk("'%c' pressed -> dumping coloring general info\n", key);
@@ -289,6 +299,12 @@ void domain_coloring_free(struct domain *d)
         xfree(d->arch.colors);
 }
 
+void domain_dump_coloring_info(struct domain *d)
+{
+    printk("Domain %pd has %u colors: ", d, d->arch.num_colors);
+    print_colors(d->arch.colors, d->arch.num_colors);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index b4dd64dff4..b174a192d4 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1083,6 +1083,8 @@ int domain_relinquish_resources(struct domain *d)
 void arch_dump_domain_info(struct domain *d)
 {
     p2m_dump_info(d);
+    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
+        domain_dump_coloring_info(d);
 }
 
 
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 0d2dfada10..a16736819e 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -36,6 +36,7 @@ bool __init coloring_init(void);
 int domain_coloring_init(struct domain *d,
                          const struct xen_arch_domainconfig *config);
 void domain_coloring_free(struct domain *d);
+void domain_dump_coloring_info(struct domain *d);
 
 #else /* !CONFIG_CACHE_COLORING */
 
@@ -43,6 +44,7 @@ static inline bool __init coloring_init(void) { return true; }
 static inline int domain_coloring_init(
     struct domain *d, const struct xen_arch_domainconfig *config) { return 0; }
 static inline void domain_coloring_free(struct domain *d) {}
+static inline void domain_dump_coloring_info(struct domain *d) {}
 
 #endif /* CONFIG_CACHE_COLORING */
 #endif /* __ASM_ARM_COLORING_H__ */
-- 
2.34.1


