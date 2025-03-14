Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE16CA617A2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914922.1320551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8rr-0008QH-1B; Fri, 14 Mar 2025 17:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914922.1320551; Fri, 14 Mar 2025 17:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8rq-0008O9-Ue; Fri, 14 Mar 2025 17:30:42 +0000
Received: by outflank-mailman (input) for mailman id 914922;
 Fri, 14 Mar 2025 17:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8nM-0003IK-8K
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:26:04 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67bd6e5a-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:26:03 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab7430e27b2so432440766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:26:03 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:26:02 -0700 (PDT)
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
X-Inumbo-ID: 67bd6e5a-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973163; x=1742577963; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VE78O4y1CQrjvnjU/sv6CX84h6wiIa5A36mM72fUABs=;
        b=Jvk38QZZ8GOKvvSiZGYZSjtelHZW2dNvfUFuoydPbJKSRl7lIqiNBwL4HWHrGHYxzq
         0GUZ3aZY7S+6dIFa1P24UzjTfn1t5JF3DSghqx+01XeJeNTuf/X7Z2Mc4Gfh+eUmuq97
         TdwAyTP5lVBraGsHaPYzTX2+Vx+KmqxBPgllU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973163; x=1742577963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VE78O4y1CQrjvnjU/sv6CX84h6wiIa5A36mM72fUABs=;
        b=oSacrO302I0aOdbuGOzi6WQsB3EYS4tnY0pdrv+x6anmvxjLbZE66rA0iaFnlmj6qD
         CHy/sTRskQtquKa4NGEgamm+x4nYqqKy1v4808bx28KDHFUaoyRcoZfq2urwTz0v+z0P
         06sP0wBECT4LkgIUI1Rr3N00BiwjjwU/cY2OSfiKULNhIyfyEVpA0kAPrDeiMhxI4KKA
         yJTBq7PMyAFS9reMGZ4MBBxtK0irMXr0zxV4ZX6MwbEJaZAp6R5bd+KgPgKBW3v9vt39
         pquzvXDv7x3CalkrVV+fQJyJ9XXvE3HG9ofZslMLvXYY7aAB75kk1J3uBJDR/huvRpTy
         t3pQ==
X-Gm-Message-State: AOJu0YzxKB1vMonfEVkQRMzu3Qa5yeUq1SUlN8pU6W7N9/dUSgZnRCV2
	kMNU3Nqus52FG0SvsiYKZ2yvHstyMPImUCZHiCWY+7vydOin6bUD4G+ao5Gh13/4FQJFnXtgZci
	O
X-Gm-Gg: ASbGncshsLxQiJwHma+wZMCKhXes2CrnlJcOSWumvTyfmWYnvzZdUV83GjWDmdLnfbp
	aNcloptpnVGGLBZ+0X8xuYtPqKoyS5NQFug4M0zi3+ekV8iyXWjLEy5xFxy793zbS5thBIH4T7h
	2nL+v2jE+svQ/ObVGpkI2DMzdn9Sh5oj/hYBTk6hYn0TGyRw0GB3qiIpO2vK7e1OizdB61aNIRS
	Ypg3rXG32cUHQGMdeMRqIyJOiDFlHOXHwHMdeX2FcxLAH40aH7fA1QnClsY5tSxs9kbS6udd4he
	I2khJDGMHDO5iZl9OetkZiC/h/p1Pj+92F7VKfjhIBtvxXuPrTjUzTt3VU4K1QQq9Fs=
X-Google-Smtp-Source: AGHT+IEdopHbhE1LscWV8fC/ITAGnDYTgseivOma1qqY5jAv9prfwdGhdthegQG/gWPHu/DlBzBzUA==
X-Received: by 2002:a17:907:2d91:b0:ac2:d6d1:fe65 with SMTP id a640c23a62f3a-ac3303bb742mr421704566b.41.1741973162944;
        Fri, 14 Mar 2025 10:26:02 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 08/11] xen/memory: Enable parsing NUMA node argument in XENMEM_claim_pages
Date: Fri, 14 Mar 2025 17:24:59 +0000
Message-ID: <20250314172502.53498-9-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract a NUMA node from mem_flags. This _must_ be an exact node, and
has the semantics of making a claim on a specific node.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/common/memory.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 1ab0bac4e7da..28f9db89ba62 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1659,6 +1659,9 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
 
     case XENMEM_claim_pages:
+    {
+        nodeid_t node;
+
         if ( unlikely(start_extent) )
             return -EINVAL;
 
@@ -1671,9 +1674,23 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( reservation.extent_order != 0 )
             return -EINVAL;
 
-        if ( reservation.mem_flags != 0 )
+        /* Only allow NUMA-related memory flags to claim on exact nodes */
+        if ( (reservation.mem_flags &
+              !XENMEMF_exact_node(XENMEMF_node_mask - 1)) != 0 )
             return -EINVAL;
 
+        node = XENMEMF_get_node(reservation.mem_flags);
+        if ( node != NUMA_NO_NODE )
+        {
+            /* Disallow advisory nodes. If present, must be exact */
+            if ( !(reservation.mem_flags & XENMEMF_exact_node_request) )
+                return -EINVAL;
+
+            /* Disallow nodes that would overflow the in-hypervisor arrays */
+            if ( node >= MAX_NUMNODES )
+                return -EINVAL;
+        }
+
         d = rcu_lock_domain_by_id(reservation.domid);
         if ( d == NULL )
             return -EINVAL;
@@ -1681,13 +1698,13 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = xsm_claim_pages(XSM_PRIV, d);
 
         if ( !rc )
-            rc = domain_set_outstanding_pages(d, NUMA_NO_NODE,
-                                              reservation.nr_extents);
+            rc = domain_set_outstanding_pages(d, node, reservation.nr_extents);
 
         rcu_unlock_domain(d);
 
         break;
 
+    }
     case XENMEM_get_vnumainfo:
     {
         struct xen_vnuma_topology_info topology;
-- 
2.48.1


