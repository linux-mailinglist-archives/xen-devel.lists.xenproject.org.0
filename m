Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE931C8D0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 11:30:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85478.160271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBxbK-0006eK-Mx; Tue, 16 Feb 2021 10:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85478.160271; Tue, 16 Feb 2021 10:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBxbK-0006de-JV; Tue, 16 Feb 2021 10:29:02 +0000
Received: by outflank-mailman (input) for mailman id 85478;
 Tue, 16 Feb 2021 10:29:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFEE=HS=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lBxbI-0006dZ-D4
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 10:29:00 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 560467d0-e5af-4044-bd93-81e2276c3ccd;
 Tue, 16 Feb 2021 10:28:58 +0000 (UTC)
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
X-Inumbo-ID: 560467d0-e5af-4044-bd93-81e2276c3ccd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613471338;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wktsdWIC+5TMN24qfT7chXZPcSVXhF+Od3SnpJcmwSI=;
  b=gq2Co1PmUKtmchcniDdtKO+0D5jK+SgZRBagmXGOk19XqbdiSGV1w0oy
   I1Wudjbrv2T3NCLjx/8uuftdbFbKKQrn6u6/vXBxPVxpMpR6Pwky/7K4g
   bekqOiz3bQEkS9mDWn+EyBa+eUsUGsicf4InK6es6RmsHpjcpR8q5C2Bt
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: UPofGbnA1xwvmSSvUcCt9fJIvr2o+7ilBz2vJoLDQ4+DUPqEnn7E+YhBNG2eB0/3ZfRyVEULJL
 sVdEBgpsb3CCZw/4FMVxRhE1W9qPZcdja3eAM7iqOByv/mgWTM0LGDkhUj66XsLu3q7WyUx/Ns
 l0Cf04CNqUauEaWxw54fcB13zwdZMQ8Pla4azLKE/9tdEbxTvfoifc3eeZ/fhg6JQUYaI70bAg
 yiV28tEq4ZgciC/Id4TzOEsFZrpn5uVLcB84WVTzQ+EUGM/F+A1ngw8dEFFXCipfIn3xQ5XJ4s
 2Yg=
X-SBRS: 5.1
X-MesageID: 37250563
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,183,1610427600"; 
   d="scan'208";a="37250563"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>
Subject: [PATCH DO NOT APPLY] docs: Document allocator properties and the rubric for using them
Date: Tue, 16 Feb 2021 10:28:39 +0000
Message-ID: <20210216102839.1801667-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Document the properties of the various allocators and lay out a clear
rubric for when to use each.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---

This doc is my understanding of the properties of the current
allocators (alloc_xenheap_pages, xmalloc, and vmalloc), and of Jan's
proposed new wrapper, xvmalloc.

xmalloc, vmalloc, and xvmalloc were designed more or less to mirror
similar functions in Linux (kmalloc, vmalloc, and kvmalloc
respectively).

CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 .../memory-allocation-functions.rst           | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 docs/hypervisor-guide/memory-allocation-functions.rst

diff --git a/docs/hypervisor-guide/memory-allocation-functions.rst b/docs/hypervisor-guide/memory-allocation-functions.rst
new file mode 100644
index 0000000000..15aa2a1a65
--- /dev/null
+++ b/docs/hypervisor-guide/memory-allocation-functions.rst
@@ -0,0 +1,118 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Xenheap memory allocation functions
+===================================
+
+In general Xen contains two pools (or "heaps") of memory: the *xen
+heap* and the *dom heap*.  Please see the comment at the top of
+``xen/common/page_alloc.c`` for the canonical explanation.
+
+This document describes the various functions available to allocate
+memory from the xen heap: their properties and rules for when they should be
+used.
+
+
+TLDR guidelines
+---------------
+
+* By default, ``xvmalloc`` (or its helper cognates) should be used
+  unless you know you have specific properties that need to be met.
+
+* If you need memory which needs to be physically contiguous, and may
+  be larger than ``PAGE_SIZE``...
+  
+  - ...and is order 2, use ``alloc_xenheap_pages``.
+    
+  - ...and is not order 2, use ``xmalloc`` (or its helper cognates)..
+
+* If you don't need memory to be physically contiguous, and know the
+  allocation will always be larger than ``PAGE_SIZE``, you may use
+  ``vmalloc`` (or one of its helper cognates).
+
+* If you know that allocation will always be less than ``PAGE_SIZE``,
+  you may use ``xmalloc``.
+
+Properties of various allocation functions
+------------------------------------------
+
+Ultimately, the underlying allocator for all of these functions is
+``alloc_xenheap_pages``.  They differ on several different properties:
+
+1. What underlying allocation sizes are.  This in turn has an effect
+   on:
+
+   - How much memory is wasted when requested size doesn't match
+
+   - How such allocations are affected by memory fragmentation
+
+   - How such allocations affect memory fragmentation
+
+2. Whether the underlying pages are physically contiguous
+
+3. Whether allocation and deallocation require the cost of mapping and
+   unmapping
+
+``alloc_xenheap_pages`` will allocate a physically contiguous set of
+pages on orders of 2.  No mapping or unmapping is done.  However, if
+this is used for sizes not close to ``PAGE_SIZE * (1 << n)``, a lot of
+space will be wasted.  Such allocations may fail if the memory becomes
+very fragmented; but such allocations do not tend to contribute to
+that memory fragmentation much.
+
+As such, ``alloc_xenheap_pages`` should be used when you need a size
+of exactly ``PAGE_SIZE * (1 << n)`` physically contiguous pages.
+
+``xmalloc`` is actually two separate allocators.  Allocations of <
+``PAGE_SIZE`` are handled using ``xmem_pool_alloc()``, and allocations >=
+``PAGE_SIZE`` are handled using ``xmalloc_whole_pages()``.
+
+``xmem_pool_alloc()`` is a pool allocator which allocates xenheap
+pages on demand as needed.  This is ideal for small, quick
+allocations: no pages are mapped or unmapped; sub-page allocations are
+expected, and so a minimum of space is wasted; and because xenheap
+pages are allocated one-by-one, 1) they are unlikely to fail unless
+Xen is genuinely out of memory, and 2) it doesn't have a major effect
+on fragmentation of memory.
+
+Allocations of > ``PAGE_SIZE`` are not possible with the pool
+allocator, so for such sizes, ``xmalloc`` calls
+``xmalloc_whole_pages()``, which in turn calls ``alloc_xenheap_pages``
+with an order large enough to satisfy the request, and then frees all
+the pages which aren't used.
+
+Like the other allocator, this incurs no mapping or unmapping
+overhead.  Allocations will be physically contiguous (like
+``alloc_xenheap_pages``), but not as much is wasted as a plain
+``alloc_xenheap_pages`` allocation.  However, such an allocation may
+fail if memory fragmented to the point that a contiguous allocation of
+the appropriate size cannot be found; such allocations also tend to
+fragment memory more.
+
+As such, ``xmalloc`` may be called in cases where you know the
+allocation will be less than ``PAGE_SIZE``; or when you need a
+physically contiguous allocation which may be more than
+``PAGE_SIZE``.  
+
+``vmalloc`` will allocate pages one-by-one and map them into a virtual
+memory area designated for the purpose, separated by a guard page.
+Only full pages are allocated, so using it from less tham
+``PAGE_SIZE`` allocations is wasteful.  The underlying memory will not
+be physically contiguous.  As such, it is not adversely affected by
+excessive system fragmentation, nor does it contribute to it.
+However, allocating and freeing requires a map and unmap operation
+respectively, both of which adversely affect system performance.
+
+Therefore, ``vmalloc`` should be used for page allocations over a page
+size in length which don't need to be physically contiguous.
+
+``xvmalloc`` is like ``xmalloc``, except that for allocations >
+``PAGE_SIZE``, it calls ``vmalloc`` instead.  Thus ``xvmalloc`` should
+always be preferred unless:
+
+1. You need physically contiguous memory, and your size may end up
+   greater than ``PAGE_SIZE``; in which case you should use
+   ``xmalloc`` or ``alloc_xenheap_pages`` as appropriate
+
+2. You are positive that ``xvmalloc`` will choose one specific
+   underlying implementation; in which case you should simply call
+   that implementation directly.
-- 
2.30.0


