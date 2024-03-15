Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200FC87CBC5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:00:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693757.1082301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hz-0003FS-HS; Fri, 15 Mar 2024 10:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693757.1082301; Fri, 15 Mar 2024 10:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hz-0003AR-8J; Fri, 15 Mar 2024 10:59:51 +0000
Received: by outflank-mailman (input) for mailman id 693757;
 Fri, 15 Mar 2024 10:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Hw-0000aQ-I2
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:48 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23a6928c-e2bb-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 11:59:48 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso204437266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:48 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:46 -0700 (PDT)
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
X-Inumbo-ID: 23a6928c-e2bb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500387; x=1711105187; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0DrmZJci78FoZxvC5v5mCbOhkfLgAdNFnybJw+ptbQ=;
        b=utN+/1vMcr6pXa5n9fcfpyIDbGxLJiwjZSY08OBJx+y2GCgwydh0/AjmfT+OvWKvXw
         brYIRTw+GXIFv2wmrGJEjYONGVc7IYh6zUNjViBMQd9AnlNeidUsb68gveclQwtNJP0/
         t1KDNcpRYieaolBqTHK6DOK6DGW1J2MXgEmKzmN/pFNpNq7sBR6tcde3soNuHGdSveEX
         jklbTa7ymHYKAsQBr8Gri0YmmsljVd6tZbdLol72k8q+vg/oQDwRQzFNiGcu0Jha3O84
         pgMPiYrCWK0KQdjqiY7WwZM778sBp50Kgkme3Ej5pj5s9h1xVQ35OqmcBhBznOtOe4GY
         KAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500387; x=1711105187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0DrmZJci78FoZxvC5v5mCbOhkfLgAdNFnybJw+ptbQ=;
        b=T2tVnWFcWCJbAXMvVj7ijsRhj/SJ7XlW8Jno7k7mlhPvOYc5tnyD3DKLLH97IbC6vw
         ctNX6XiU+AAswEOzKin3nPvdbaPo+4oitHaj3d1amau8GzZmvrb5w0UAi70qU1Zg2smd
         Y4LgmQsimmxmUW2l67SwfXJP7XhuqXl1wk4u4pZbZ5X/nlCcyzcgJvm7wMkBzWV2o/l7
         s4fCgo8cmIKcaLqa75hC3En6jcvxcbxCUxXrCGCTKUsteCPo3HIXPLkUW2aaXUedNAUI
         y+XeghXD3M8zNJcwppsImRkKbMLkSNZv+1ZVa1/OP3cQOGx3ksLHH+r1gShUM4W7kYV1
         yrXQ==
X-Gm-Message-State: AOJu0Ywdi6iS3M48vh2EyVdOIMT1c9Uur07qCKhrPXZUEkWI+fq51wtq
	fSlKPsJoXm9XgVaxBCWt7k4oNaa7jovXKHLPjMPzdDJq7c4yYByewpeinjBrtU7cWmLuvPpp+kN
	90cQ=
X-Google-Smtp-Source: AGHT+IEKt/6Ps0/3taD+3fbNYM0uMQ7bRVuTic9mtyQZB35bEGeJxY/vGwpfgAqcjAN8ctp88Bcwaw==
X-Received: by 2002:a17:906:1707:b0:a46:708d:a9d3 with SMTP id c7-20020a170906170700b00a46708da9d3mr2423303eje.71.1710500387182;
        Fri, 15 Mar 2024 03:59:47 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 11/14] xen/arm: use domain memory to allocate p2m page tables
Date: Fri, 15 Mar 2024 11:58:59 +0100
Message-Id: <20240315105902.160047-12-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
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
v7:
- no changes
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


