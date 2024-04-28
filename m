Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32C8B4CE5
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 18:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713709.1114647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lr-0007XU-HY; Sun, 28 Apr 2024 16:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713709.1114647; Sun, 28 Apr 2024 16:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lr-0007GD-6w; Sun, 28 Apr 2024 16:52:59 +0000
Received: by outflank-mailman (input) for mailman id 713709;
 Sun, 28 Apr 2024 16:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a4SJ=MB=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s17lo-0006DB-Gl
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2024 16:52:56 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c296f8e1-057f-11ef-909a-e314d9c70b13;
 Sun, 28 Apr 2024 18:52:55 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41adf3580dbso20948005e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 09:52:55 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm27850921wri.84.2024.04.28.09.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 09:52:54 -0700 (PDT)
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
X-Inumbo-ID: c296f8e1-057f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714323175; x=1714927975; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRmhbnTJStHi1KkjxYIGvbfG3WE3teBkCarxEGq+EPc=;
        b=VGV8AeblDbsOxKIJldsP4cjmhqio9yRaTagX0M4HuCDRLPXDWYIgUdiBu6RcrykjuL
         2f4yc5aCR8eW7T0gqymLRrlUp38n8SkNkrXGl5e2bF8nwU3QQ8QdTYuY8V2usSX8sg+1
         mIVwkVBTu79ZGis+g75zPXrcxgAexw6yNLXtgHX3/613b//K0cDcPUpRS+wS3scN1boq
         Omu9vn8658SpMYuklk4gEQyx9dDO7CEKCWLjUGFaIGrRrnA+SfHacjOl4bCMOHDxeuzl
         RRpETV8+D6THJbOav5fn7faBZ3RQnn5It9GeCBJGRgH/TvxeK3f73RO9+sT8+D8WsOlD
         S7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714323175; x=1714927975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRmhbnTJStHi1KkjxYIGvbfG3WE3teBkCarxEGq+EPc=;
        b=EIrYdJFgCE3XHB9MjYLHhe7GHLn81QBvLC04Ue2wAQpPPcMpn/dleEgUO672ED9w93
         /Xik+McYlDFyfVguadqc8yxSfgmrRo7E781e9EujxP8nDFHs3bnva9HIfsfLjWQZFn4P
         /jt1vI3iopbDDyWUPNggqK9QK+7Yn9skrHzhWr+Rs1aQQ1dyr07SN5MDdJ2+FBBNCCD0
         30WbMH/sTJpqxHn3GvstVAZB28vdUdSua9Qv3YJu1LWE7jPZwBy0r6HA1sVE/O6WjEzE
         LAYI1tZA3ESyi4grSjvA8noV/Tmf3gstItc5bUJVVO+atxVuQcCyaZ7C04irAVjkYq0h
         /ydQ==
X-Gm-Message-State: AOJu0YxsZqrYIi7MjT9LMct34ZxM1fXJyqwHUMYQiR0AMdYZrPB08lOQ
	5NHF74ELoWxov9vEpx74EWtu4g4y31wbqzraWtpASpl2mc8tRpzrY8NWP687
X-Google-Smtp-Source: AGHT+IE/5HJoBtmMIjJcoejHquMqcOjnqeFgg34BEa/OWG1DnI5wPeGzp6pPW3gpJoK8tHMRC0MmBA==
X-Received: by 2002:a05:600c:1d16:b0:418:5ef3:4a04 with SMTP id l22-20020a05600c1d1600b004185ef34a04mr7707461wms.18.1714323175061;
        Sun, 28 Apr 2024 09:52:55 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 7/7] x86/hap: Increase the number of initial mempool_size to 1024 pages
Date: Sun, 28 Apr 2024 16:52:42 +0000
Message-Id: <a26bc4aeba89f7895c79df7e320adfc695b16d50.1714322424.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714322424.git.w1benny@gmail.com>
References: <cover.1714322424.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This change anticipates scenarios where `max_altp2m` is set to its maximum
supported value (i.e., 512), ensuring sufficient memory is allocated upfront
to accommodate all altp2m tables without initialization failure.

The necessity for this increase arises from the current mechanism where altp2m
tables are allocated at initialization, requiring one page from the mempool
for each altp2m view.

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


