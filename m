Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D37821921
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660568.1030123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRF-00087Z-D4; Tue, 02 Jan 2024 09:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660568.1030123; Tue, 02 Jan 2024 09:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRF-00083l-7n; Tue, 02 Jan 2024 09:51:57 +0000
Received: by outflank-mailman (input) for mailman id 660568;
 Tue, 02 Jan 2024 09:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbRD-0006VR-Ig
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:51:55 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fd18725-a954-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 10:51:55 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55539cac143so5756691a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:55 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:53 -0800 (PST)
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
X-Inumbo-ID: 8fd18725-a954-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189114; x=1704793914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh1Spa5a2++HjujwNRVja92wtQd0bdVMGwtSuj79fk4=;
        b=g+jiiIOdGr+aw4rEtsXCTNGhkH1+y4XmhYTbaf9NuR+rqLrf2e9JLyaRhiuZeNjpiz
         mLMpY+Ah6b5j/xwsuJ/qn0Jv/Gm2o+gv8e91/KQ3MaL1uGn7j34XZ4zAtZMrY1l2NMdT
         4XAFd63sbaUFU4vQSFdduvqXfb2TwK7EPsyEQ9I3f4REdJtH3L4o05SPlRId+oKY50DX
         FwcNkOCFV4yXkX/D2rfcULdudGDGmSUf2gc624yVHa/aA4ouLRkimuymJ4Gscz30y5XT
         8uNw1L4dd3fnuXRi2x01zR0q7L2uQYNv1QJ0O7HJuQpBssPjR2bH9L+ayuR7nRO/BDPX
         sj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189114; x=1704793914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yh1Spa5a2++HjujwNRVja92wtQd0bdVMGwtSuj79fk4=;
        b=dt7T2Zw6ZJYbH0NuB4R1rMbKGEK4ZPn3LcHx2redNNXpBQY3ofxGmi8eOoUVJD86/v
         5k1JKemWUdcR3HOFc2ZLBTsJtz8DCUPIoRExiLlI/kCDWp8S1sI3FPSTg5tn02FnR4Uv
         8JAQvoO6ch7Wx9x64hgyw0Pb3RK9Dj1ZVlFJ3yUep8dN6lCv0C93LYPpjtSovzWgBsNV
         SaRk8pc2INkXMAzObbtj8CPZiZbvoqVE/IU1vnyJTfrewLj/aLxEf5x+0ldj2hpKxiUS
         izQ67T1mxN/qv9EB7lPndl+7lD1uiYZXLTUdq++yHpP3fGg91QV+29A2uFZHfpSU9eor
         wkvA==
X-Gm-Message-State: AOJu0YxmA0dm/9K0LNZ8y2RdPauk6zmZEDMNRr8oGTK7/eH7aCU45KQ5
	acozzFr3FoSzhN6U52buRYl5pX3dON06aZqZnPYYgiecqOc=
X-Google-Smtp-Source: AGHT+IGsDNMl5Y9JClEF0mL/6gxoCKBwi9CxutTOJTPmX7FLmvMDFBlSRc7c6XX9heUNA5DON57FyQ==
X-Received: by 2002:a17:907:928b:b0:a27:6648:cc3e with SMTP id bw11-20020a170907928b00b00a276648cc3emr5019435ejc.74.1704189114633;
        Tue, 02 Jan 2024 01:51:54 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v5 10/13] xen/arm: use domain memory to allocate p2m page tables
Date: Tue,  2 Jan 2024 10:51:35 +0100
Message-Id: <20240102095138.17933-11-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache colored domains can benefit from having p2m page tables allocated
with the same coloring schema so that isolation can be achieved also for
those kind of memory accesses.
In order to do that, the domain struct is passed to the allocator and the
MEMF_no_owner flag is used.

This will be useful also when NUMA will be supported on Arm.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
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


