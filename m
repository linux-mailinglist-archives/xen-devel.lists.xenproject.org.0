Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D405D8B9F02
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715954.1118020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zio-0000NX-Vz; Thu, 02 May 2024 16:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715954.1118020; Thu, 02 May 2024 16:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zio-0000Em-JZ; Thu, 02 May 2024 16:55:50 +0000
Received: by outflank-mailman (input) for mailman id 715954;
 Thu, 02 May 2024 16:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zil-0006N3-Ob
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:47 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1eae1c0-08a4-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 18:55:46 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a58a36008ceso1024925566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:46 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:45 -0700 (PDT)
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
X-Inumbo-ID: d1eae1c0-08a4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668945; x=1715273745; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0HjLGde2czBrFNRqDQC6Fk0V43qRnD7BBzryFWROfc=;
        b=IvPCEZixSLI1xDOU6cbItVZYOj02qlFkX/iDCbyJeqIFEBpy1Q+VIVicj5+L/QIc44
         BSXZmd/I1mD70SiMImkXQdexfD6my7rNex0qm3KlKX6iHWhY8ZOYeFPd+o84YvBe3oRA
         jlGMlhAeVcFO8xlqO4MfRJOS8Zla4cbyZRCHffydAkPNFwelQ3CAYEpyD6iUxOBaCv/b
         +fHMutPn2+1kytFBBbmV+6o9jRzLl0L/Apz0PigGPiHgpchDTGqVwU3n9rzVkI0WWAuR
         Y1OV3VuFCbwRo2T2fFTHsGQ3iw5g2E9MRtBKmiwEekjFy+TnqLipsRBPZkxJ2xk/8BqV
         Wjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668945; x=1715273745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0HjLGde2czBrFNRqDQC6Fk0V43qRnD7BBzryFWROfc=;
        b=i5QCRtl/eGMHcKU5Bx3cWdTxw1S9l/PtMP0riRg8wbqtOSHAgsMLWTNALaGLyuV+aA
         7GWuCAFY6zFqFTwAj9SGd6Ghnnhjzs6Ti/LHPHhHzinfYslf488aoBntuFbHK0/N9kp6
         LdjjXEO2mptp6SIqsNQIkz2uByduka6O5QgWrw04XrdYPAFy+Wl+oKMyicqTmzoYJqZE
         VP28onXFtDQoYe8x2M3hDkCHYicXw8XXAv2UcKlpIT50/1VfcHDbV3AHMT0z5im4BDEh
         BC+F2LdOoqLa3M33zvEX+x3UGLDlJTJe35Mu7d0E3RdZOxiGmiz5cEcTy2R63DQ4gTE/
         Odkw==
X-Gm-Message-State: AOJu0YzWXoU2tO6pI5En+IfP4vgWt+pONwpDxfWAY7wrGy+joNNOCG1e
	L8b38KcXticPlw5TEgyRJoldPDPSC2944JY8TzlARI0+jCDmcGuHGDGKyzQHoeIWuC9DPmwpwXG
	c
X-Google-Smtp-Source: AGHT+IFj86uc1obXj9Kx3zkvsvH8RpMBzwS/P2urE04hZd8oYKwJRTnSvEd+QNKgfKfXBfspNETP/w==
X-Received: by 2002:a17:906:eca8:b0:a58:c639:9518 with SMTP id qh8-20020a170906eca800b00a58c6399518mr47832ejb.76.1714668945596;
        Thu, 02 May 2024 09:55:45 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 10/13] xen/arm: use domain memory to allocate p2m page tables
Date: Thu,  2 May 2024 18:55:30 +0200
Message-Id: <20240502165533.319988-11-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
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
v8:
- no changes
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


