Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800418B14D0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 22:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711656.1111836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRg-0005sW-Vb; Wed, 24 Apr 2024 20:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711656.1111836; Wed, 24 Apr 2024 20:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRg-0005pq-Ow; Wed, 24 Apr 2024 20:42:24 +0000
Received: by outflank-mailman (input) for mailman id 711656;
 Wed, 24 Apr 2024 20:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q5fc=L5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rzjRf-0004Gx-9Y
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 20:42:23 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2616d243-027b-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 22:42:21 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a55b93f5540so37777166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 13:42:21 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm8740067ejb.35.2024.04.24.13.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 13:42:20 -0700 (PDT)
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
X-Inumbo-ID: 2616d243-027b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713991341; x=1714596141; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaVPevDI7mTli+wad6D33iRtuC6KkdRRxbwuuGTBCyg=;
        b=GK/4OYI1oYIA7Qk3oDJIQU1QQqXq5m0ybTuTGvCVgBLvyWcwcg+YfL+dNWFWcxaH6z
         tbjNiO1kd5AGwFEocDNtS1D3eFrJuusWc9MMhbSA+csNDKtbPBTfHLr2cgDRwGUpTMUB
         nUjQDFeVkhELrSFIsyuHyKWPniZYPszn7F4qtSBvMo2zPJeTtwWm+56sq5j8DWKphRwq
         HuOwJhDtPjoX71dUn5kURfPnlc6KEZL8jWh+R/AdWcQF5VsSPLLvhRoLuyQAzqsRk4r+
         8sHK/cGDtBe4DYZuQ9OEHaGZYRnuwC+qSjMu6gVLBvRYyC6Jvu/6/ZetnPflUhJ5ttRe
         U2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713991341; x=1714596141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaVPevDI7mTli+wad6D33iRtuC6KkdRRxbwuuGTBCyg=;
        b=bNQnx7/X+yRrRPn6j6OMtG6hlEcp1SM8501BuzAoxabbZ7+dfU8ZPf+cQoaQ38R/xi
         ze9Gm6nSHKT104dqc6kfnSe/gyyXqOXsC5CkYWzsMciMo5b2/P8IrFfvqSoR/o1T8Z45
         FImViOB2IihXQOrSHvSjWXnMray72eAns3DDVJlqAdsVqxoqkA+Sw2GQU/1FPHDjSdN9
         vzQNRmpprVf/d1fBxdpQiOllc+eUqQeZm/kKpOWB+LQ5Ru9tVybuSHlC43HIrkCF0Six
         asLUtPlapb8iEKxaJiHi/tYEhqv5xpaCsuZKNK3XVmAIbqho7B2KcOPa485Rw1h3YA3L
         EVGA==
X-Gm-Message-State: AOJu0YwnJIjEbhequRVC9mLIOsgoor8dGOY/M7SbvEcODNEydrnAPHCW
	HS4/3iGvYn6jOujkxDgzZTCVAxKuXlVW0R4umfoZCE923ruwV+q0J+j6QRjl
X-Google-Smtp-Source: AGHT+IFCW5hMprZMfrpRZlKrrGduxFVWsVSJ+kjV7nV9wO4iON20FpRdnPsCE5jIa5xuH2VZFNAZJg==
X-Received: by 2002:a17:906:f2d8:b0:a55:b99d:74a7 with SMTP id gz24-20020a170906f2d800b00a55b99d74a7mr2373463ejb.11.1713991340822;
        Wed, 24 Apr 2024 13:42:20 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 7/7] x86/hap: Increase the number of initial mempool_size to 1024 pages
Date: Wed, 24 Apr 2024 20:42:05 +0000
Message-Id: <e0a05b3a6469219b0ef89844d63cac082b962b1c.1713990376.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713990376.git.w1benny@gmail.com>
References: <cover.1713990376.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This change anticipates scenarios where `max_altp2m` is set to its maximum
supported value (i.e., 512), ensuring sufficient memory is allocated upfront
to accommodate all altp2m tables without initialization failure.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/tests/paging-mempool/test-paging-mempool.c | 2 +-
 xen/arch/x86/mm/hap/hap.c                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index 1ebc13455a..91b06fa0cf 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -35,7 +35,7 @@ static struct xen_domctl_createdomain create = {
 
 static uint64_t default_mempool_size_bytes =
 #if defined(__x86_64__) || defined(__i386__)
-    256 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. */
+    1024 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. */
 #elif defined (__arm__) || defined(__aarch64__)
     16 << 12;
 #endif
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 7aff5fa664..fab7e256a4 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -468,7 +468,7 @@ int hap_enable(struct domain *d, u32 mode)
     if ( old_pages == 0 )
     {
         paging_lock(d);
-        rv = hap_set_allocation(d, 256, NULL);
+        rv = hap_set_allocation(d, 1024, NULL);
         if ( rv != 0 )
         {
             hap_set_allocation(d, 0, NULL);
-- 
2.34.1


