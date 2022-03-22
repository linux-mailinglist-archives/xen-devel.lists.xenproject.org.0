Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9FD4E456B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 18:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293619.498844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWiYw-0001x7-Eu; Tue, 22 Mar 2022 17:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293619.498844; Tue, 22 Mar 2022 17:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWiYw-0001vR-BL; Tue, 22 Mar 2022 17:44:54 +0000
Received: by outflank-mailman (input) for mailman id 293619;
 Tue, 22 Mar 2022 17:44:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCW+=UB=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nWiYu-0001fS-Ie
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 17:44:52 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c66ac872-aa07-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 18:44:51 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 10:42:00 -0700
Received: from pinedahx-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.28.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 10:41:59 -0700
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
X-Inumbo-ID: c66ac872-aa07-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647971091; x=1679507091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n5WPsYc98Ed00HkBSm/If63JlbzCdv9YyCjfjyKJigg=;
  b=AcahRsS8PgFTliYvRG6BE30LPS0kGg62NXz3i8xvrkGdZVVlNWbeK+T2
   bOCByGf93ODm1vEWxg5QIkoyCx+xzdSW46IWj3vwX8YKzfmYvzTudFy/l
   Eamr/kmh2XKyC/vGuQ6np5B6eCMYbvVqbdkCjyTqGE6jjVVfCPZDUezB4
   Wjcc06fT70rsD1sB9WY2mZp7wBs6pxmzKfmsOzE4nPjRCOTMa2dB3aXB+
   qeWOXSTfTHKiBlAO2s8h3jHbaSVaCm1xEnvsPQ4LzrBfgoYWkZKr+9jNm
   7roFpA3C6YoKniIGLL01uCBpnnEKm4rkq+tkWUDz/dWRq7k1R9ckq1QZd
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="321097373"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="321097373"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="717039034"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 2/3] x86/mem_sharing: use dom_cow as placeholder parent until fork is complete
Date: Tue, 22 Mar 2022 13:41:38 -0400
Message-Id: <d5d8c7bad025a4ef11bf09ad3a4b23c8b4673ff6.1647970630.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the duration of the fork memop set dom_cow as a placeholder parent. This
gets updated to the real parent when the fork operation completes, or to NULL
in case the fork failed. Doing this allows us to skip populating the physmap
with any entries until the fork operation successfully completes. Currently
bringing up vCPUs may inadvertantly map in some pages that can turn out to be
unecessary, like the CR3 gfn when paging is disabled.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/include/asm/mem_sharing.h | 2 +-
 xen/arch/x86/mm/mem_sharing.c          | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/mem_sharing.h b/xen/arch/x86/include/asm/mem_sharing.h
index cf7a12f4d2..b4a8e8795a 100644
--- a/xen/arch/x86/include/asm/mem_sharing.h
+++ b/xen/arch/x86/include/asm/mem_sharing.h
@@ -79,7 +79,7 @@ static inline int mem_sharing_unshare_page(struct domain *d,
 
 static inline bool mem_sharing_is_fork(const struct domain *d)
 {
-    return d->parent;
+    return d->parent && d->parent != dom_cow;
 }
 
 int mem_sharing_fork_page(struct domain *d, gfn_t gfn,
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 84c04ddfa3..a21c781452 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1850,7 +1850,9 @@ static int fork(struct domain *cd, struct domain *d, uint16_t flags)
         *cd->arch.cpuid = *d->arch.cpuid;
         *cd->arch.msr = *d->arch.msr;
         cd->vmtrace_size = d->vmtrace_size;
-        cd->parent = d;
+
+        /* use dom_cow as a placeholder until we are all done */
+        cd->parent = dom_cow;
     }
 
     /* This is preemptible so it's the first to get done */
@@ -1862,6 +1864,7 @@ static int fork(struct domain *cd, struct domain *d, uint16_t flags)
 
     if ( !(rc = copy_settings(cd, d, skip_special_pages)) )
     {
+        cd->parent = d;
         cd->arch.hvm.mem_sharing.block_interrupts = block_interrupts;
         cd->arch.hvm.mem_sharing.skip_special_pages = skip_special_pages;
         /* skip mapping the vAPIC page on unpause if skipping special pages */
-- 
2.25.1


