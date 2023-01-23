Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5529A67805E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483029.748972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3a-00024B-NC; Mon, 23 Jan 2023 15:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483029.748972; Mon, 23 Jan 2023 15:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3a-00021I-FE; Mon, 23 Jan 2023 15:48:26 +0000
Received: by outflank-mailman (input) for mailman id 483029;
 Mon, 23 Jan 2023 15:48:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3Z-0000MU-4j
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:25 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58f113cd-9b35-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 16:48:14 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id bk15so31563831ejb.9
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:23 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:22 -0800 (PST)
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
X-Inumbo-ID: 58f113cd-9b35-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a2gbQNKwUWS/d4kzoidztA9Ce3spqkJtPMisplTAE0=;
        b=ng7prlLTd1cYH/dTXfkdmn4gkmQlV/868ZF4otjJNBPRm3fFBORoHT1RSyPy74qFS2
         IT5XZDYlUuDbODtrCs5RyEFQR59k8Zn/ZZ9Q52okjlpqGbKO2Fe76mu0RPbJsJmXwVRo
         W492ws8E19D/TaAeynVqDdwLd3UKd/gDFGZzVoYDLWFtFyF+j7zbQcNRp+yP6XWkbR0l
         ELmMKAfdFC2y/NOw7JNjyWINTFw0nINpN8zW/W4KkbtKJ6IjLeBRJ2VYuQHqEY6ri+ei
         p9M50WfgxYHT6Hiahy2qhDgVnL0ofdhY7gUrnnWLcF7KkftIJf58zPOsfgw6tRq+ViOr
         3uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0a2gbQNKwUWS/d4kzoidztA9Ce3spqkJtPMisplTAE0=;
        b=WTnGzDIGYawTiQY0n26BRfPlL5UtZ12+IIc4r74pJKmslnX2jPzPTxOXqfIGtdmbrc
         tF6Wh23HxmnCwAOd/z5Vkukwlrq6tRDGy1hYcKODVC9nekdIr51qSPlAgyrZe8M2M2N5
         L7d8KP6Du/b9+c/4Nays0484vnaQrDxf2Xc12Os2djk1IBehbdlWKkdJO+kaP3u4Sl2X
         BtYp+pHKwS777KjNIzEFu98WWzPMHyd4HnvCu6SeDQDA0S5QM+5L8aD6AU/3wAjnoeYn
         dZDymlgEg1nvsr1Bbgv1taHvXscfiRu8tBJuM3dmd2lp+yi7qflB9Fopvu+9Jv2HEsrx
         5Tbg==
X-Gm-Message-State: AFqh2kr7oJQVUarya8iiNjK2sPQolnvZete0NDbrVBBVUKCTsAnvR0VI
	oxJUERJzo6PrT6dIBcqvjqtOqKukk/wArNLz
X-Google-Smtp-Source: AMrXdXsUAXRa82fcSelfp1n7YAbygkKkkD3DjYj1duZB5/jYaAvQ4PBJQUzuH8foqelDXFscp14mfw==
X-Received: by 2002:a17:907:cbc5:b0:7ad:9455:d57d with SMTP id vk5-20020a170907cbc500b007ad9455d57dmr28301982ejc.74.1674488902800;
        Mon, 23 Jan 2023 07:48:22 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v4 08/11] xen/arm: use colored allocator for p2m page tables
Date: Mon, 23 Jan 2023 16:47:32 +0100
Message-Id: <20230123154735.74832-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache colored domains can benefit from having p2m page tables allocated
with the same coloring schema so that isolation can be achieved also for
those kind of memory accesses.
In order to do that, the domain struct is passed to the allocator and the
MEMF_no_owner flag is used.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v4:
- fixed p2m page allocation using MEMF_no_owner memflag
---
 xen/arch/arm/p2m.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 948f199d84..f9faeb61af 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -4,6 +4,7 @@
 #include <xen/iocap.h>
 #include <xen/ioreq.h>
 #include <xen/lib.h>
+#include <xen/llc_coloring.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
@@ -56,7 +57,10 @@ static struct page_info *p2m_alloc_page(struct domain *d)
      */
     if ( is_hardware_domain(d) )
     {
-        pg = alloc_domheap_page(NULL, 0);
+        if ( is_domain_llc_colored(d) )
+            pg = alloc_domheap_page(d, MEMF_no_owner);
+        else
+            pg = alloc_domheap_page(NULL, 0);
         if ( pg == NULL )
             printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
     }
@@ -105,7 +109,10 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
         if ( d->arch.paging.p2m_total_pages < pages )
         {
             /* Need to allocate more memory from domheap */
-            pg = alloc_domheap_page(NULL, 0);
+            if ( is_domain_llc_colored(d) )
+                pg = alloc_domheap_page(d, MEMF_no_owner);
+            else
+                pg = alloc_domheap_page(NULL, 0);
             if ( pg == NULL )
             {
                 printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
-- 
2.34.1


