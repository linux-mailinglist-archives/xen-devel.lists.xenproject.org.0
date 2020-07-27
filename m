Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BD322F02E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:22:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k041E-00075z-2Z; Mon, 27 Jul 2020 14:22:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k041D-00075p-0v
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:22:19 +0000
X-Inumbo-ID: 936c447c-d014-11ea-8ac4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 936c447c-d014-11ea-8ac4-bc764e2007e4;
 Mon, 27 Jul 2020 14:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lUTj7fPtlIpACnbEEUp7Ogj2IKf4LNQYjfMh6mK0dVo=; b=OBsJAzs5L70NKsEgXHHzW+mylw
 VSPDELfZnNCa9Hgqcq7AsCYQvbiK0P22wD4kKWa8M20ZpV13xcJQ0Sp+qeWBJHabeJPoonmkoXiAC
 A78rv1Q3clqDU07lQFiCaV+v0gi0anSFRCNDyi4rWNVtA7DPizHqUXDJrz26zJkIUKQE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041A-0001Mf-Vy; Mon, 27 Jul 2020 14:22:16 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041A-0002w6-Jb; Mon, 27 Jul 2020 14:22:16 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 00/15] switch to domheap for Xen page tables
Date: Mon, 27 Jul 2020 15:21:50 +0100
Message-Id: <cover.1595857947.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 jgrall@amazon.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

This series rewrites all the remaining functions and finally makes the
switch from xenheap to domheap for Xen page tables, so that they no
longer need to rely on the direct map, which is a big step towards
removing the direct map.

This series depends on the following mini-series:
https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00730.html

---
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

Wei Liu (13):
  x86/mm: map_pages_to_xen would better have one exit path
  x86/mm: make sure there is one exit path for modify_xen_mappings
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

 xen/arch/x86/domain_page.c |  11 +-
 xen/arch/x86/efi/runtime.h |  13 ++-
 xen/arch/x86/mm.c          | 272 ++++++++++++++++++++++++++++-----------------
 xen/arch/x86/setup.c       |   4 +-
 xen/arch/x86/smpboot.c     |  70 +++++++-----
 xen/arch/x86/x86_64/mm.c   |  81 ++++++++------
 xen/common/efi/boot.c      |  83 +++++++++-----
 xen/common/efi/efi.h       |   3 +-
 xen/common/efi/runtime.c   |   8 +-
 xen/common/vmap.c          |   1 +
 xen/include/asm-x86/mm.h   |   7 +-
 xen/include/asm-x86/page.h |  15 ++-
 12 files changed, 353 insertions(+), 215 deletions(-)

-- 
2.16.6


