Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF43AC0D88
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:04:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994037.1377077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6Wr-0005O0-Ey; Thu, 22 May 2025 14:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994037.1377077; Thu, 22 May 2025 14:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6Wr-0005HZ-Bh; Thu, 22 May 2025 14:04:13 +0000
Received: by outflank-mailman (input) for mailman id 994037;
 Thu, 22 May 2025 14:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI6Wq-0005FK-CZ
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:04:12 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e4d617-3715-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 16:04:11 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-44b1f5b917fso991515e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:04:11 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca8896dsm23041682f8f.73.2025.05.22.07.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 07:04:10 -0700 (PDT)
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
X-Inumbo-ID: a2e4d617-3715-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747922651; x=1748527451; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FktwtEW0Fmw4rJHIOF3iKnfB159BdV//CCT1areduY=;
        b=WxjEoPvaVWa9gq9LLUDmBhAb6Ac5EeJZmyWg0oYGMmI4kiS62SbS1mYKbRHpKNnIsD
         5+XcBlP9+I9IyNhkhSpvgKcf8x0BzXVPvS/n6C9QUNSKg1UHiTkEdQ6mUBLNnvrwgvZT
         0m5KabIv8xYGCA4m2fsljgzF0w52aqSSyYQEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747922651; x=1748527451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FktwtEW0Fmw4rJHIOF3iKnfB159BdV//CCT1areduY=;
        b=Awc95+IA4P729VYQnkXibMzrjFLRtTdbh5Tif9Ik6Tyexr1Ce3+GSNkZKVQWmK9cZc
         fN/DCODlHVQws9/VBpZDSuT3l9Z/p5H55Ht0JpQhTZ9RXHoWcr1Kdij3TolM/tt1sPhr
         YOPW0Rp+pcCN9Y8GixJ7KfFyZTnKJZhmb2rnqacIp98vuC4B8cb05xNZAvdX/z013Ull
         Bo/BbKgq5shVtAfGYnckl7wQ2LttCLTgU+8baUB0Hel2Z0ThmM6pFd0Vw54WUryKfqNR
         y3F34BS+wrhZrdfVNyy164fx4qbzN4+PaUh4ndkZx8Z2+LIEbKAyqu6hpv3hoojHdr2s
         z+zg==
X-Gm-Message-State: AOJu0YzWYNl5xYdBYPY1ajAz8R53MI35P5wWEWMjPIh6pTVn4g5bKz0u
	tHLW1V7kJwe7qlaBQo1w8hV3jzzZDZAir9tNVXhfjGV9e8W2hzsplpsB+YdtXq5I/xQIaRXDAHf
	he2K/
X-Gm-Gg: ASbGnct2qUFM5d9afsOEeTYVJrKlFTNiJonONJkikLqZRKlaCX/TGAkZrzoQMXwYug8
	vlU0DdyNKZkmy23suxwGGZMc4NNLqX6iS8ZuuAqy2yLadBmVJVmZIJs+dgqXJeAim/DkswphMuz
	xj06fidk8Ona8pAofbUg2SkWeC4sxyX6BZKKiwN73PG3H8lYXH3chWc1K44xS6NP6BxQVwNxUBQ
	80xMt8/YeIVmRC1uWx8KRyxbPF3+Fq8iucKxCjdB0X4PugT0Yn7pvwPLbihStosaMVReFWXQhPC
	zZ36L+vOTuTVO9AarVNtUjgKaBCiSnx1p1feX/zxkh5p5jXo/hxyislZiEShJZWlwT58HL6OfCF
	N4asxwbhbpt4MfC6eyMLyKpSXCd/mbA==
X-Google-Smtp-Source: AGHT+IF3POTYR7vwEVPnwq1opDQsoIMzXDAVykkFgf+t7uK8/81M9xz8IcuajOR1zLPq+mVUT9YB8A==
X-Received: by 2002:a05:6000:4212:b0:3a3:7ba5:960e with SMTP id ffacd0b85a97d-3a37ba598e7mr10049647f8f.59.1747922650637;
        Thu, 22 May 2025 07:04:10 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] x86/vpci: fix off-by-one
Date: Thu, 22 May 2025 16:03:55 +0200
Message-ID: <20250522140356.5653-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522140356.5653-1-roger.pau@citrix.com>
References: <20250522140356.5653-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rangeset_remove_range() uses inclusive ranges, and hence the end of the
range should be calculated using PFN_DOWN(), not PFN_UP().

Fixes: 4acab25a9300 ('x86/vpci: fix handling of BAR overlaps with non-hole regions')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index afaf9fe1c053..26bb7f6a3c3a 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -131,7 +131,7 @@ int pci_sanitize_bar_memory(struct rangeset *r)
             continue;
 
         rc = rangeset_remove_range(r, PFN_DOWN(entry->addr),
-                                   PFN_UP(entry->addr + entry->size - 1));
+                                   PFN_DOWN(entry->addr + entry->size - 1));
         if ( rc )
             return rc;
     }
-- 
2.49.0


