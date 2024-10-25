Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E998E9AFEEC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 11:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825714.1240092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4GyG-0000BS-7B; Fri, 25 Oct 2024 09:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825714.1240092; Fri, 25 Oct 2024 09:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4GyF-00005W-W0; Fri, 25 Oct 2024 09:51:03 +0000
Received: by outflank-mailman (input) for mailman id 825714;
 Fri, 25 Oct 2024 09:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3YV=RV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t4GyD-0005WM-Fw
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 09:51:01 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4454743-92b6-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 11:51:01 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a10e1so2717593a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 02:51:01 -0700 (PDT)
Received: from carlo-ubuntu.home
 (dynamic-adsl-94-34-131-227.clienti.tiscali.it. [94.34.131.227])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629e17dsm446938a12.34.2024.10.25.02.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:50:58 -0700 (PDT)
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
X-Inumbo-ID: a4454743-92b6-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1729849860; x=1730454660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ToXNTbIaUJzIwxTCo6A+h1xsfFwkQlv3v3omXflCTA=;
        b=tS1aVwmeCiGEp9AydUAN4Fkeqwo88Fm7NBz3EGHao149kaSLUJbDzM6abxhEB1C8oo
         vn13ZmbKfB9tiUTR9UsFc8BCoWQq36UXyMNd6Oc3o/QTATeFDCGyMm9P9SyLxeUYs4w5
         dPM/qkFXMwL5gNBFev/8/CdgjTBwckY0Nrn3cDPFFy98Fkt8HX2uy94IgyjHldgax/nq
         i7MnI4W04gyjiy9GRhgCJmkcWK6knlLy4qGKNdEONDcSrl2IUaPM6WZIDpPKjgGwWCC4
         joqj5xEXHebvXizC4udIpn/nPLgOv0SxOnplub6EseWPlAQQ00Tzxe/Cws+kDVSgQnPt
         mR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849860; x=1730454660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ToXNTbIaUJzIwxTCo6A+h1xsfFwkQlv3v3omXflCTA=;
        b=TWEkcc8P9JmfJ+eUJxXf7hGlYJ6oY9NFSY69Z0QJNqajUJoIY9zu11z83XGVP6X6uC
         94LpUIwjUQQKwJF/kCy4PZLM8efNySfduATkY1+ywkGfPuPbYyCs/FN+IKv72cZRHOFZ
         eHXCuH+otMtVCEr7ZrC9dApRC6noJTxwlrbN1OWFsHXUQ6J+epIVTKFkeR76mzp7GL5z
         +X/cPqZdPXY5Gdow3i5ZLuPp1Tq5MHaqYj9RqvxmV6dWdjkRKxaRUC6R9LkQcqdtjnDk
         hMKwWOnp0LjMEFugu6Tc0IWTlb3nmH+br8LFe3LaQD0rxwwX+TWOrpQC4kxCAabb5LXw
         y8aQ==
X-Gm-Message-State: AOJu0YwNNwMD7Wt8p0Q/+zjSIm40K7ypS+w+RkcsQ0RwjgL9NHWIXFpd
	n6evZCMZtNPbXcQfSgpmPM83JDNuIkkaIVPN/bqlWGxbx58h+1j51wS98WBhNknm07qZTqFpOL0
	ko3E=
X-Google-Smtp-Source: AGHT+IF28WcoBdGSRbtpHgskkYDgOiXbKRkaAukRB+pzaXLBSwK3hQ0jkJjBMRw4wbspjvXdMd3cVQ==
X-Received: by 2002:a05:6402:2743:b0:5c9:863d:844a with SMTP id 4fb4d7f45d1cf-5cba245b13amr3632189a12.12.1729849860285;
        Fri, 25 Oct 2024 02:51:00 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 10/13] xen/arm: use domain memory to allocate p2m page tables
Date: Fri, 25 Oct 2024 11:50:11 +0200
Message-ID: <20241025095014.42376-11-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
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
v9:
- no changes
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
index bfa312cc8a..28df6e5d03 100644
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
2.43.0


