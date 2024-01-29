Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C374840EE2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673072.1047325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVIC-00009r-Ho; Mon, 29 Jan 2024 17:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673072.1047325; Mon, 29 Jan 2024 17:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVIB-0008Rh-Vf; Mon, 29 Jan 2024 17:19:31 +0000
Received: by outflank-mailman (input) for mailman id 673072;
 Mon, 29 Jan 2024 17:19:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI9-0005vb-BV
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:29 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e6fcc91-beca-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 18:19:27 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55eece07a75so1848389a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:27 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:26 -0800 (PST)
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
X-Inumbo-ID: 8e6fcc91-beca-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548767; x=1707153567; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UdP4nrilFTONRQo3Q1Leq4bZtPWA15sZcG7JE/zaUg=;
        b=Z6P6erqAeozayEiMEQuSDBbZB4fcXfRASweNbgwO8xi7YHnrrD1radBwEybaMhcAql
         luWqdFll0VhN3+nUklb70vT9i8WpXzWzu29wJP9uYfFDh3B3CP1oy6P4BQZn9JumOqa4
         d33KjxrGc0vh/tdHlQBY4EcxfM7BsCjNkPr9qOENkZdxyP5SiqpfMmxXfOQev1wFOZcZ
         ERp2ueS+hF7qdZRNFHxvtdhu92xMPZNApsFq/12/o065w8Me2RfFbi5CW3HSkARll+Od
         GqwnSO6xtaQBXe/LzAx/b8HzgOmEJOLVDOj4Q4mC/E7QrBA8vPYSIbbepkBPhKCbFplz
         FHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548767; x=1707153567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UdP4nrilFTONRQo3Q1Leq4bZtPWA15sZcG7JE/zaUg=;
        b=gOuHNWemvAg+9wRjAZCMC3EHO9QV45kbiT1Mh8pzngd9/xssBdyIj294upHaohmE8o
         6UJDH1yGmETIz6Y8J/41ifd12omHMDN4wqlIl1PgEeksBYOh2yZ6LLHUhmkIsMqwIGu7
         pr/Y9A5msNg9BfLy5BnbbufvbBw4m531k+5DiGpCqyZIl4LXFaIlPzkbVyvoc4vsmJtw
         F2dNxIEirVFwgy09cB9ITOLdlXTKFVaozhT8QeLz9Q9jDH1FBsGz9Bp/BGgZRPPD7o9X
         0qTEcj+kpx4ozEy202AUp5cfEvJEbYqNOEhSz79nlOvSfZ7yS1lk0csQB+x68WAKOBkQ
         AWpQ==
X-Gm-Message-State: AOJu0Yzckt1gLBcFw/klIYdG3wWkbwgSBfAXRukc3jxLE9XejH0W2Oy0
	wb7y/hmT+Pb0dgpd8qI6NxtXAqfOOJNi9GK7gBvOfrpculrdjdYVzs4qhxmLmoNGDJtg/Rj+OQh
	szKw=
X-Google-Smtp-Source: AGHT+IGCV8RaY9mKxLFe87VSIFwQXw7gaXAqUqjMDarSQiLKN1CM0EMIwpP8Z/6WHnQWIpAd/I790Q==
X-Received: by 2002:a05:6402:524c:b0:55e:ee3a:723 with SMTP id t12-20020a056402524c00b0055eee3a0723mr2972287edd.12.1706548766905;
        Mon, 29 Jan 2024 09:19:26 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 11/15] xen/arm: use domain memory to allocate p2m page tables
Date: Mon, 29 Jan 2024 18:18:07 +0100
Message-Id: <20240129171811.21382-12-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache colored domains can benefit from having p2m page tables allocated
with the same coloring schema so that isolation can be achieved also for
those kind of memory accesses.
In order to do that, the domain struct is passed to the allocator and the
MEMF_no_owner flag is used.

This will be useful also when NUMA will be supported on Arm.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Acked-by: Julien Grall <julien@xen.org>
---
v6:
- Carlo Nonato as the only signed-off-by
v5:
- new patch
---
 xen/arch/arm/mmu/p2m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 41fcca011c..d02a478cb8 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -32,7 +32,7 @@ static struct page_info *p2m_alloc_page(struct domain *d)
      */
     if ( is_hardware_domain(d) )
     {
-        pg = alloc_domheap_page(NULL, 0);
+        pg = alloc_domheap_page(d, MEMF_no_owner);
         if ( pg == NULL )
             printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
     }
@@ -81,7 +81,7 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
         if ( d->arch.paging.p2m_total_pages < pages )
         {
             /* Need to allocate more memory from domheap */
-            pg = alloc_domheap_page(NULL, 0);
+            pg = alloc_domheap_page(d, MEMF_no_owner);
             if ( pg == NULL )
             {
                 printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
-- 
2.34.1


