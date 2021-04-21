Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C772D366DE5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114542.218314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDdx-0007nN-R3; Wed, 21 Apr 2021 14:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114542.218314; Wed, 21 Apr 2021 14:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDdx-0007mq-NV; Wed, 21 Apr 2021 14:15:53 +0000
Received: by outflank-mailman (input) for mailman id 114542;
 Wed, 21 Apr 2021 14:15:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZDdw-0007mV-1Y
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:15:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDdv-0000x9-LS; Wed, 21 Apr 2021 14:15:51 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDdv-00045m-9j; Wed, 21 Apr 2021 14:15:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=8Y7cZ0jhBCgL/d+LypK4ewU4crbmjT7K6WHrZgfO9aQ=; b=arlZcmqtMmxe3rjtlQldC0/jnv
	CHtbTwZF69HBTXRGwhIOLIpOKTgw0+oDQu+sNM9XYMQt4SyYf2+V3w4Hn4sC4rzcxTNyt4N56H9Vb
	wwBayap5XAwLz1Y1wYKuL+Q5Lo1LkJ4v0qpdEZDgiXNhoIse1A7jml0UranF3e3U1fCE=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 00/13] switch to domheap for Xen page tables
Date: Wed, 21 Apr 2021 15:15:28 +0100
Message-Id: <cover.1619014052.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1

From: Hongyan Xia <hongyxia@amazon.com>

This series rewrites all the remaining functions and finally makes the
switch from xenheap to domheap for Xen page tables, so that they no
longer need to rely on the direct map, which is a big step towards
removing the direct map.

---
Changed in v10:
- rebase.
- address comments in 01/13, which propagates a change into 02/13.

Changed in v9:
- drop first 2 patches which have been merged in XSA-345.
- adjust code around L3 page locking in mm.c.

Changed in v8:
- address comments in v7.
- rebase

Changed in v7:
- rebase and cleanup.
- address comments in v6.
- add alloc_map_clear_xen_pt() helper to simplify the patches in this
  series.

Changed in v6:
- drop the patches that have already been merged.
- rebase and cleanup.
- rewrite map_pages_to_xen() and modify_xen_mappings() in a way that
  does not require an end_of_loop goto label.

Hongyan Xia (2):
  x86/mm: drop old page table APIs
  x86: switch to use domheap page for page tables

Wei Liu (11):
  x86/mm: rewrite virt_to_xen_l*e
  x86/mm: switch to new APIs in map_pages_to_xen
  x86/mm: switch to new APIs in modify_xen_mappings
  x86_64/mm: introduce pl2e in paging_init
  x86_64/mm: switch to new APIs in paging_init
  x86_64/mm: switch to new APIs in setup_m2p_table
  efi: use new page table APIs in copy_mapping
  efi: switch to new APIs in EFI code
  x86/smpboot: add exit path for clone_mapping()
  x86/smpboot: switch clone_mapping() to new APIs
  x86/mm: drop _new suffix for page table APIs

 xen/arch/x86/efi/runtime.h |  13 +-
 xen/arch/x86/mm.c          | 247 ++++++++++++++++++++++---------------
 xen/arch/x86/setup.c       |   4 +-
 xen/arch/x86/smpboot.c     |  70 +++++++----
 xen/arch/x86/x86_64/mm.c   |  80 +++++++-----
 xen/common/efi/boot.c      |  83 ++++++++-----
 xen/common/efi/efi.h       |   3 +-
 xen/common/efi/runtime.c   |   8 +-
 xen/include/asm-x86/mm.h   |   7 +-
 xen/include/asm-x86/page.h |   5 -
 10 files changed, 314 insertions(+), 206 deletions(-)

-- 
2.23.4


