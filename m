Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A130E355188
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105798.202348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXD-00049e-1x; Tue, 06 Apr 2021 11:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105798.202348; Tue, 06 Apr 2021 11:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXC-00049F-UE; Tue, 06 Apr 2021 11:06:14 +0000
Received: by outflank-mailman (input) for mailman id 105798;
 Tue, 06 Apr 2021 11:06:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lTjXB-00049A-3M
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:06:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXA-00052Y-0H; Tue, 06 Apr 2021 11:06:12 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjX9-0002qD-8n; Tue, 06 Apr 2021 11:06:11 +0000
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
	bh=9NxIVhwDU06jniRfYOl1JCju4Dh8jTlcYhCu5BPYz38=; b=cYil8rl4xjVrb/GVPOfx6e4Qux
	b4ULGXLRpo2LH3NY3rxMraFzGEKZHeIDlMShNfUZz7yvXNOanvDnzOIkqCUguJAV++yyBLenQtIVH
	g86ZXiCAUunK+49uMRGNy/+D/L0xUqKK4FrTDOVtfuyrhbBjMMS6Pq0F0I1opHeArJ7o=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 00/13] switch to domheap for Xen page tables
Date: Tue,  6 Apr 2021 12:05:48 +0100
Message-Id: <cover.1617706782.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1

From: Hongyan Xia <hongyxia@amazon.com>

This series rewrites all the remaining functions and finally makes the
switch from xenheap to domheap for Xen page tables, so that they no
longer need to rely on the direct map, which is a big step towards
removing the direct map.

---
Changed in v9:
- drop first 2 patches which have been merged in XSA-345.
- adjust code around L3 page locking in mm.c.

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
 xen/common/vmap.c          |   1 +
 xen/include/asm-x86/mm.h   |   7 +-
 xen/include/asm-x86/page.h |   5 -
 11 files changed, 315 insertions(+), 206 deletions(-)

-- 
2.23.3


