Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE9950D25E
	for <lists+xen-devel@lfdr.de>; Sun, 24 Apr 2022 16:44:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312112.529313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nidTK-0003oR-2z; Sun, 24 Apr 2022 14:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312112.529313; Sun, 24 Apr 2022 14:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nidTJ-0003kw-Vv; Sun, 24 Apr 2022 14:44:21 +0000
Received: by outflank-mailman (input) for mailman id 312112;
 Sun, 24 Apr 2022 14:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZwHJ=VC=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1nidTI-0003kq-QO
 for xen-devel@lists.xenproject.org; Sun, 24 Apr 2022 14:44:20 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05083a5f-c3dd-11ec-8fc2-03012f2f19d4;
 Sun, 24 Apr 2022 16:44:19 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id b12so6715211plg.4
 for <xen-devel@lists.xenproject.org>; Sun, 24 Apr 2022 07:44:19 -0700 (PDT)
Received: from localhost ([118.33.58.98]) by smtp.gmail.com with ESMTPSA id
 o189-20020a62cdc6000000b0050d3d606538sm1027651pfg.25.2022.04.24.07.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 07:44:17 -0700 (PDT)
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
X-Inumbo-ID: 05083a5f-c3dd-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=95y6zSa4Tw7B58PQxi0n0y875m0i99N3ZRZMzlGKgCU=;
        b=a2JyL0mibelfR7CaCfHyARbdi6Tkmd/5RBwRzBaO7CA6//5/Ik13wFiJO0aCEZ6Ln4
         WOQP2xB8NRPYrxN8RTDJq4WktDypzyNlei+Cb8j9ONpXG/A7v+qP++GhREr/r5wVbKKg
         s3rk6PgdHwADCzXAhiqK6goAqNlwY2kjVpEPC162k6EG2qxtHW4zNbanWirn43+xWcqq
         y3QeUE/9hTTPvIpBnsGbbhvNpN7z9/U4atZYKjqabGRpQPRCOj52qLrF0hslnO6SJUbD
         ljiUPTGAOHr3lA1f5vtnjVmBqLXJzIVJocS4FRwgQj9NaXDk4eGEPAuSf9jV3JxddEMi
         rbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=95y6zSa4Tw7B58PQxi0n0y875m0i99N3ZRZMzlGKgCU=;
        b=w2CFUYNpXjwNmDoWy7yKvZOOfEcY8FBxEJQDa5mpnROe5NI7dvheBdov534D8Dsoz2
         3lBAZJA+KXaQfQrLW6scxSghcK0b3tBD65tUfeuDBy+UjpRpqax7pnATKcdBXhoFbpt7
         aTejIJLeexgxJ89rAR3pQU6OmDd+TVO8R+xacK6J1532liNli7WGf/eu5OsbUBNNM0U2
         PHb3Ex/AKFt4aPzgvRsKbVNeeukz74BoZDtHFAk8rDbqR9ZdhItO52Mt1KeAUX1oIKOF
         W6ZlPje/EoOxvkz9zFeZJACHBku95i2vYSFUcsxo6KQgVlfvQIUPlzXpAIpcM4IclkfW
         dK2g==
X-Gm-Message-State: AOAM531dIWmwbEzbIpIrnhEz3wJsaGE8YaQDYZbMQIq+SWaUPF+8NX79
	C/e5BLb6dVEETgGTE/PEe0c=
X-Google-Smtp-Source: ABdhPJzwZAQcoucPBWROp0IJC9Bs9FMsSpoWPjnqHrWvbhIZ4nr1j1S8iQeYGldkqwcKFrcNy5j3+w==
X-Received: by 2002:a17:90a:fd85:b0:1d9:6281:d158 with SMTP id cx5-20020a17090afd8500b001d96281d158mr2421912pjb.187.1650811457440;
        Sun, 24 Apr 2022 07:44:17 -0700 (PDT)
Date: Sun, 24 Apr 2022 23:44:14 +0900
From: Paran Lee <p4ranlee@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
Subject: [PATCH] xen/efi: boot fix duplicated index, offset calculate
 operation in the copy_mapping loop
Message-ID: <20220424144414.GA17868@DESKTOP-NK4TH6S.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It doesn't seem necessary to do that
duplicated calculation of mfn to addr and l4 table index
in the copy_mapping loop.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 xen/common/efi/boot.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index ac1b235372..7da4269c32 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1470,7 +1470,9 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
 
     for ( ; mfn < end; mfn = next )
     {
-        l4_pgentry_t l4e = efi_l4t[l4_table_offset(mfn << PAGE_SHIFT)];
+        unsigned long addr = mfn << PAGE_SHIFT;
+        unsigned long l4_table_idx = l4_table_offset(addr);
+        l4_pgentry_t l4e = efi_l4t[l4_table_idx];
         unsigned long va = (unsigned long)mfn_to_virt(mfn);
 
         if ( !(mfn & ((1UL << (L4_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1)) )
@@ -1489,7 +1491,7 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
 
             l3dst = alloc_mapped_pagetable(&l3mfn);
             BUG_ON(!l3dst);
-            efi_l4t[l4_table_offset(mfn << PAGE_SHIFT)] =
+            efi_l4t[l4_table_idx] =
                 l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
         }
         else
@@ -1497,7 +1499,7 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
 
         if ( !l3src )
             l3src = map_l3t_from_l4e(idle_pg_table[l4_table_offset(va)]);
-        l3dst[l3_table_offset(mfn << PAGE_SHIFT)] = l3src[l3_table_offset(va)];
+        l3dst[l3_table_offset(addr)] = l3src[l3_table_offset(va)];
     }
 
     unmap_domain_page(l3src);
-- 
2.25.1


