Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62268A05EA3
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867319.1278818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4l-0006Ra-Q2; Wed, 08 Jan 2025 14:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867319.1278818; Wed, 08 Jan 2025 14:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4l-0006LW-LE; Wed, 08 Jan 2025 14:30:27 +0000
Received: by outflank-mailman (input) for mailman id 867319;
 Wed, 08 Jan 2025 14:30:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4k-0005q4-6d
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:26 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1931632d-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:24 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9a88793so4960344a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:24 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9706479b5sm1016086a12.80.2025.01.08.06.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:22 -0800 (PST)
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
X-Inumbo-ID: 1931632d-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346624; x=1736951424; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQMf50ZHpIa44OSs3yzjDxbHIqEp8PQJQD9zzetsDcU=;
        b=YfM7FdBQgHx/M4dNmTpuymgeNZwD02HJqlGjDQgrMjg+OYOYbhShD0PLZzBvt7yg8f
         /YH+Duowyv8wrhgjWG9GpoqZynhCz96rJnckqxcIeEK2mrG7tMdFWC/riq8clHHtB18M
         cF25sqpG5oQrUerbKc/8kALehYiRxLvmiUweg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346624; x=1736951424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQMf50ZHpIa44OSs3yzjDxbHIqEp8PQJQD9zzetsDcU=;
        b=qw5fIpadAl+Af/fg5uq27iIcZV3Vs3JmmCwwUvNTTPi7Ccy4Xb38yV7H0TcnjwVY5C
         ZnTLA0VJkZzOo2TGMTk8NW/JlJ7SDG8M1gCx/u98Lt1XN2J8AbJ5SWwKXssJwl0QFo/N
         ZuoJiXW9q9t0zIef8xBJQKKrZazMo8PIYLBCHyk0NYZ7I5HsQLOGp8ZUoPVqY2/41rNe
         /J2kOvAyIOYDItBouoVwupxmL/lLTwqYubxuiA43k/cL5/sPHw4aFRJSYPPxSBY5B5a/
         9xgXc0POM+3y5m/3ZoOMSraHEZRmT+Nc3MR4JdpxLn1iAKji+w9I8rhYH4rVC+B3dYTv
         YGXQ==
X-Gm-Message-State: AOJu0YyTAXeI6LsprypjUdekyjHbPVW5iIdTZq2/nxi5i4pqGo5hZRHZ
	5BjmzesHk/1kLWPTcNbymIy2Bb3GrTIavcS3lOswcWLQzvGuJwmQSUIXDZbV/zGRJ6QU5EdRWEo
	M
X-Gm-Gg: ASbGncu45PAH28vuB0r1Ib6K1CKHcgbUroWuCzT5XaNPsr9V9V0y9YEQ+ybinE1g+2K
	ZJ4T14nEjdV2B40nPt+jmpXb2kXWoWUjP3QsZXujNKN0fQ3fJtxUy//gfdtqvItOq5fQyEN18IL
	is7TFsSgnUY66s+oDfHj4dSrMy2u+1rKLb4LCz4yQAeWM4WCqyiUNtnKcIGUXe3XfrVDCRVYdj2
	Me4wKxW/oexri3SrVCJRgdiMDIITMQ2KCYYHleA//7syFluHgH4TtWwB/+lpXUm+FA=
X-Google-Smtp-Source: AGHT+IHdJHwme3Fk7T3dwmFLrxPAAgzz/GSB5rVNHFrsraCY0UzIaxFIR3nsYEJxKaWWNSdnngvcNA==
X-Received: by 2002:a05:6402:35c4:b0:5d3:e63c:7d71 with SMTP id 4fb4d7f45d1cf-5d972e06e45mr2432016a12.11.1736346623952;
        Wed, 08 Jan 2025 06:30:23 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 03/18] x86/mm: introduce helper to detect per-domain L1 entries that need freeing
Date: Wed,  8 Jan 2025 15:26:43 +0100
Message-ID: <20250108142659.99490-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

L1 present entries that require the underlying page to be freed have the
_PAGE_AVAIL0 bit set, introduce a helper to unify the checking logic into a
single place.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index fa21903eb25a..3d5dd22b6c36 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6294,6 +6294,12 @@ void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
     return (void __force __iomem *)(va + offs);
 }
 
+static bool perdomain_l1e_needs_freeing(l1_pgentry_t l1e)
+{
+    return (l1e_get_flags(l1e) & (_PAGE_PRESENT | _PAGE_AVAIL0)) ==
+           (_PAGE_PRESENT | _PAGE_AVAIL0);
+}
+
 int create_perdomain_mapping(struct domain *d, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg)
@@ -6446,9 +6452,7 @@ void destroy_perdomain_mapping(struct domain *d, unsigned long va,
 
                 for ( ; nr && i < L1_PAGETABLE_ENTRIES; --nr, ++i )
                 {
-                    if ( (l1e_get_flags(l1tab[i]) &
-                          (_PAGE_PRESENT | _PAGE_AVAIL0)) ==
-                         (_PAGE_PRESENT | _PAGE_AVAIL0) )
+                    if ( perdomain_l1e_needs_freeing(l1tab[i]) )
                         free_domheap_page(l1e_get_page(l1tab[i]));
                     l1tab[i] = l1e_empty();
                 }
@@ -6498,9 +6502,7 @@ void free_perdomain_mappings(struct domain *d)
                         unsigned int k;
 
                         for ( k = 0; k < L1_PAGETABLE_ENTRIES; ++k )
-                            if ( (l1e_get_flags(l1tab[k]) &
-                                  (_PAGE_PRESENT | _PAGE_AVAIL0)) ==
-                                 (_PAGE_PRESENT | _PAGE_AVAIL0) )
+                            if ( perdomain_l1e_needs_freeing(l1tab[k]) )
                                 free_domheap_page(l1e_get_page(l1tab[k]));
 
                         unmap_domain_page(l1tab);
-- 
2.46.0


