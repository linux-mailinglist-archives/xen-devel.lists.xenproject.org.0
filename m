Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A92A05FE2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867490.1279105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXq0-0002bP-E4; Wed, 08 Jan 2025 15:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867490.1279105; Wed, 08 Jan 2025 15:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpz-0002X1-VO; Wed, 08 Jan 2025 15:19:15 +0000
Received: by outflank-mailman (input) for mailman id 867490;
 Wed, 08 Jan 2025 15:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpy-0008Ue-05
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:14 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea3f2af6-cdd3-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 16:19:12 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaee0b309adso2115822366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:12 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:11 -0800 (PST)
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
X-Inumbo-ID: ea3f2af6-cdd3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349552; x=1736954352; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dAl5hiiumxZdSL6vCO/VaNqrRA8aywqXxbQG/mKtGY=;
        b=Hmh+CMApb3O8FVO4bwKJSJMyHrpRmdeiirVhb4uxxifc3B0XpmYesVCsMIgr+xx4Lc
         a2lz/ukJhHz6QcVV4fFABgoy8K3jHsbAHMd/5F9WszbzEOce1Um3G+yofi+qWZ49sZoc
         3BxutmNm50Vw4ZsSC1NsWS55fO4n+NRkgdKuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349552; x=1736954352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dAl5hiiumxZdSL6vCO/VaNqrRA8aywqXxbQG/mKtGY=;
        b=kZTkqYatzkthByTWjAhvCEMdYJNkpn2U8J930MseWSXE+sAAb8oF5m70rO8QIBEGt5
         mwjTN4VRJO62ZUqelP0bop8f8GiL7GPQ96q/mQpRmhPyp3o7Abh/LIISNGwUryZM/nPs
         OVV0JIQahfoBYe7gMx+F53xPZjQdBZYSBRMFJmIT1ZqW3GnzlfFi2+29+K8aRH3+bu9Q
         QWOj1l3srNavi71gJjMsi0hn1UwhUFjOWaosAW3PZLCrvXA9CKhsPuXhTyYtemaLrE7+
         ovTb6F4wxvWLlSdNdzW8wJo41ThupJJ8jOWdSH7IidAqRKnPTtAQozbmnRQnpr2gpPn6
         O0QA==
X-Gm-Message-State: AOJu0YwGupN/Nf04gQjGhAldnAov8KxdPp+aZPYlbugIROTqya5S+Ij2
	EGBsonaUI+2cz/hZz/WVXRThEZbsREnnavcgcaOGRNK431QrFozjzHd8x9tsoM3J3al1/o6jWgR
	Ffs6f9Q==
X-Gm-Gg: ASbGncuktTLp95nko05sR9HAephjFcmBCzAGwo8N7IMbDaycp3IOv+jpW1zDdjI7chn
	q1soFU6X4JduksKwN9Zv0HCnbeO5YEpEr9qJu58xRiBWqd+e/z4B67wP9r7ip9YQzzScv7wYLU8
	3GYJFm2HE2bjTWr4pgUmOVtPV4FYUXkBUgQSgYz3SwXWNLrhorCDZd6MybdWz2VzK20kU5orMiv
	lwY9B2wyzyNsZ4iyPQWlxBGv7cl3GWHRQNAEXgVXS5d3bHbH658jH83D/byqjilc3+wnVrFnVK1
	oqY=
X-Google-Smtp-Source: AGHT+IFxfaz1of1Dy+QRE/RL4Nf+b/dHh+YwZM7uFybv3bH9J3u0daWHFg1k3w3NgvYUSIrBHUHeaQ==
X-Received: by 2002:a17:907:70c:b0:aa6:9176:61ed with SMTP id a640c23a62f3a-ab2abc6d42emr300126166b.48.1736349551627;
        Wed, 08 Jan 2025 07:19:11 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 10/15] xen/page_alloc: vmap heap nodes when they are outside the direct map
Date: Wed,  8 Jan 2025 15:18:17 +0000
Message-ID: <20250108151822.16030-11-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

When we do not have a direct map, archs_mfn_in_direct_map() will always
return false, thus init_node_heap() will allocate xenheap pages from an
existing node for the metadata of a new node. This means that the
metadata of a new node is in a different node, slowing down heap
allocation.

Since we now have early vmap, vmap the metadata locally in the new node.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * Fix bug introduced in v4 by which node metadata would be
    unconditionally mapped at the tail of the heap node.
  * Remove extra space in conditional

v3->v4:
  * Change type of the parameters to paddr_t
  * Use clear_domain_page() instead of open-coding it

v1->v2:
  * vmap_contig_pages() was renamed to vmap_contig()
  * Fix indentation and coding style

Changes from Hongyan's version:
  * arch_mfn_in_direct_map() was renamed to
    arch_mfns_in_direct_map()
  * Use vmap_contig_pages() rather than __vmap(...).
  * Add missing include (xen/vmap.h) so it compiles on Arm
---
 xen/common/page_alloc.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1c01332b6cb0..3af86a213c4e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -139,6 +139,7 @@
 #include <xen/softirq.h>
 #include <xen/spinlock.h>
 #include <xen/vm_event.h>
+#include <xen/vmap.h>
 #include <xen/xvmalloc.h>
 
 #include <asm/flushtlb.h>
@@ -615,22 +616,30 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
         needed = 0;
     }
     else if ( *use_tail && nr >= needed &&
-              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
               (!xenheap_bits ||
                !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
-        _heap[node] = mfn_to_virt(mfn + nr - needed);
-        avail[node] = mfn_to_virt(mfn + nr - 1) +
-                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
+            _heap[node] = mfn_to_virt(mfn + nr - needed);
+        else
+            _heap[node] = vmap_contig(_mfn(mfn + nr - needed), needed);
+
+        BUG_ON(!_heap[node]);
+        avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
+                        sizeof(**avail) * NR_ZONES;
     }
     else if ( nr >= needed &&
-              arch_mfns_in_directmap(mfn, needed) &&
               (!xenheap_bits ||
                !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
-        _heap[node] = mfn_to_virt(mfn);
-        avail[node] = mfn_to_virt(mfn + needed - 1) +
-                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        if ( arch_mfns_in_directmap(mfn, needed) )
+            _heap[node] = mfn_to_virt(mfn);
+        else
+            _heap[node] = vmap_contig(_mfn(mfn), needed);
+
+        BUG_ON(!_heap[node]);
+        avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
+                        sizeof(**avail) * NR_ZONES;
         *use_tail = false;
     }
     else if ( get_order_from_bytes(sizeof(**_heap)) ==
-- 
2.47.1


