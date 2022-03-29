Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155784EAF01
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 16:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295842.503595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZCSH-00006G-13; Tue, 29 Mar 2022 14:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295842.503595; Tue, 29 Mar 2022 14:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZCSG-0008Sd-T4; Tue, 29 Mar 2022 14:04:16 +0000
Received: by outflank-mailman (input) for mailman id 295842;
 Tue, 29 Mar 2022 14:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyIC=UI=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nZCSF-0008Pe-LR
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 14:04:15 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c0f1eef-af69-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 16:04:12 +0200 (CEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 07:04:09 -0700
Received: from tlengyel-mobl3.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.29.163])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 07:04:08 -0700
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
X-Inumbo-ID: 1c0f1eef-af69-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648562654; x=1680098654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=43ECNuCX2PPxh+aosXm++u7sNS4fbK0+kwt3CNxi5Z0=;
  b=ACEM4YQIV9ZvFsyIy1swlJxwuA/H46YxXT0sP2DWp9+tGYDcTJaHuSft
   RDDll+FKjoP4XCEMdZDDH6ijzL+U7tkoia8a0iU+WWDyrPEQqJyIUFOVG
   RMeSvjfSZpCyrPuXeOz0bfZhk7MO5dX6WkQjWPcQHVSnVc8Ae7jZJnawC
   B7Sce3VrPpf7lYWl27QqJtSXa3d7CNAVOwljrOaE3mINoD6UFF8vboYOi
   08hZSudjj2U5n0LWrDdq6UUuD3ZT4gQ4p/vE76vgAAdcp5D8sOVUtyeqT
   rU47mT/N4yzu4LwihltTO7RqFn8C5c1jen70syWbIC2FHRKtXRGRlCETW
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239853164"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="239853164"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="652987568"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 2/3] x86/mem_sharing: add fork_complete field to mem_sharing_domain
Date: Tue, 29 Mar 2022 10:03:21 -0400
Message-Id: <10b1b71d918b7d7315b49b5932497d094f767a1e.1648561546.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fork's physmap should only be populated with select special pages during
the setup of the fork. The rest of the fork's physmap should only be populated
as needed after the fork is complete. Add a field to specify when the fork is
complete so fork_page() can determine whether it's time to start adding entries
to the physmap.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v2: replace previous patch that set parent to dom_cow as a placeholder
---
 xen/arch/x86/include/asm/hvm/domain.h | 1 +
 xen/arch/x86/mm/mem_sharing.c         | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 22a17c36c5..7078d041bd 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -32,6 +32,7 @@
 struct mem_sharing_domain
 {
     bool enabled;
+    bool fork_complete;
     bool block_interrupts;
     bool empty_p2m;
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index ef67285a98..bfde342a38 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1555,7 +1555,7 @@ int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool unsharing)
     p2m_type_t p2mt;
     struct page_info *page;
 
-    if ( !mem_sharing_is_fork(d) )
+    if ( !d->arch.hvm.mem_sharing.fork_complete )
         return -ENOENT;
 
     if ( !unsharing )
@@ -1862,6 +1862,7 @@ static int fork(struct domain *cd, struct domain *d, uint16_t flags)
 
     if ( !(rc = copy_settings(cd, d, empty_p2m)) )
     {
+        cd->arch.hvm.mem_sharing.fork_complete = true;
         cd->arch.hvm.mem_sharing.block_interrupts = block_interrupts;
 
         if ( (cd->arch.hvm.mem_sharing.empty_p2m = empty_p2m) )
-- 
2.25.1


