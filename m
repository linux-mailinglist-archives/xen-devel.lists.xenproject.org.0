Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9AC5A280B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393755.632907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoC-0001y4-4R; Fri, 26 Aug 2022 12:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393755.632907; Fri, 26 Aug 2022 12:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoC-0001uz-1H; Fri, 26 Aug 2022 12:51:36 +0000
Received: by outflank-mailman (input) for mailman id 393755;
 Fri, 26 Aug 2022 12:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYoA-0001dl-AC
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:34 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfbe9594-253d-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 14:51:33 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id kk26so2943049ejc.11
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:32 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:31 -0700 (PDT)
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
X-Inumbo-ID: cfbe9594-253d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=KUUG3oBu2sZvqX2D9rJkuOuQmnOvyHH8GrWoUzfp3Co=;
        b=Oiy1yctzwOMWIvwKtGoMgkuywg12OKtQRBp9V+oUGbkP/OXN7ECgN0PcUiosnp39xk
         /hgkpd+VH3OPLhRyzwyyQfy6VhWw/bykqd+5GJ8Gc/YB34VHcUGPRNT5goTnsyioXAw4
         rHxUti3ck5WigE+xhLWiEYYNBrlM/GwWrT5/z6XFBLy6rmg7Og85MgPoJ4nfQbv3x8XG
         GnafJ3xgf4DsFIPTWukH+c5G5odiQekl5fN4SST9uA2cUY/HgfspAG142jEKFkmpZ5rl
         w2DFEV0Qdo9omlVTeCoLSWbxCAX3IhP1LgyyXkGPNj0gXSYEKBegK01YZYXf7yLNbvpb
         rdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=KUUG3oBu2sZvqX2D9rJkuOuQmnOvyHH8GrWoUzfp3Co=;
        b=cB4tl5RAoEHWYBGcDbXWbzw1SVqEyxhHpA03CCbgu3xqYNKd06Pq7e9tSdGhFBIJiQ
         4MhrpZ5L35jZY/qiftctXXkQLaiJSthd1IPWtrNJa2eyG/W4VlGULH08iNEA3PTMIT3f
         3zzCyfNq0bOZfv2hk+W7FYeIm4bbGWMDd8Iaia/rEBzK7oQLcaW7A5e0awiBjiVkWY9I
         CAmRFA/WXq+Jklxwa4CcP0WjZQl50nUrmJsiRP4UOkGXiF7oRG+Wf3B0L6YNFsFkl1xj
         Bt+GwLXg38txx7V4O5wPhjKh0gJgZZgOotOtAdiuFy5JtiOg1pdkMzLcECnV0cceIDfi
         to5g==
X-Gm-Message-State: ACgBeo0zbLn6L6R5XVLCATRBPe+EumM6izMbKDh35MlqE+1i09qYZl2j
	Li5nXs+p97ZgIRuQ5DeOo+SPKFrkn7VS/g==
X-Google-Smtp-Source: AA6agR4y4ZyBsKL9yN9HoaM+dJZ6Zq+gSYvqaQ/rT0daG/uYAEbT6gfIkKZ1U8JUKMq3hulYOlOALw==
X-Received: by 2002:a17:907:7e8c:b0:73d:85ec:46c with SMTP id qb12-20020a1709077e8c00b0073d85ec046cmr5080773ejc.257.1661518292192;
        Fri, 26 Aug 2022 05:51:32 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	stefano.stabellini@amd.com,
	wl@xen.org,
	marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 03/12] xen/arm: dump cache colors in domain info debug-key
Date: Fri, 26 Aug 2022 14:51:02 +0200
Message-Id: <20220826125111.152261-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds cache colors to the information dumped with the domain info
debug-key.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/coloring.c             | 16 ++++++++++++++++
 xen/arch/arm/domain.c               |  3 +++
 xen/arch/arm/include/asm/coloring.h |  1 +
 3 files changed, 20 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 2b37cda067..40a07617cc 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -171,6 +171,16 @@ static unsigned int set_default_domain_colors(unsigned int *colors)
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
@@ -267,6 +277,12 @@ void domain_coloring_free(struct domain *d)
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
index c6fa8adc99..bca418e374 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1087,6 +1087,9 @@ int domain_relinquish_resources(struct domain *d)
 void arch_dump_domain_info(struct domain *d)
 {
     p2m_dump_info(d);
+#ifdef CONFIG_CACHE_COLORING
+    domain_dump_coloring_info(d);
+#endif
 }
 
 
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 60c8b1f079..967031ae04 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -34,5 +34,6 @@ bool __init coloring_init(void);
 int domain_coloring_init(struct domain *d,
                          const struct xen_arch_domainconfig *config);
 void domain_coloring_free(struct domain *d);
+void domain_dump_coloring_info(struct domain *d);
 
 #endif /* !__ASM_ARM_COLORING_H__ */
-- 
2.34.1


