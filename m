Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38D819D92
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:03:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657634.1026638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuME-0005T6-O3; Wed, 20 Dec 2023 11:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657634.1026638; Wed, 20 Dec 2023 11:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuME-0005M8-L4; Wed, 20 Dec 2023 11:03:22 +0000
Received: by outflank-mailman (input) for mailman id 657634;
 Wed, 20 Dec 2023 11:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xS+a=H7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rFuMD-0004rG-Au
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:03:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62dd09f4-9f27-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:03:20 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.218.228])
 by support.bugseng.com (Postfix) with ESMTPSA id 7FE1C4EE0C9B;
 Wed, 20 Dec 2023 12:03:19 +0100 (CET)
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
X-Inumbo-ID: 62dd09f4-9f27-11ee-98eb-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 3/7] xen/arm: guest_walk: address violations of MISRA C:2012 Rule 16.3
Date: Wed, 20 Dec 2023 12:03:03 +0100
Message-Id: <98175f394c2c8078a864071aacef04b8d9e1cb6a.1703066935.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703066935.git.federico.serafini@bugseng.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statements to address violations of Rule 16.3
("An unconditional `break' statement shall terminate every
switch-clause").
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/guest_walk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index d99b411f3b..2f7d3a0da7 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -165,6 +165,8 @@ static bool guest_walk_sd(const struct vcpu *v,
             *perms |= GV2M_WRITE;
         if ( !pte.sec.xn )
             *perms |= GV2M_EXEC;
+
+        break;
     }
 
     return true;
@@ -260,6 +262,7 @@ static bool get_ttbr_and_gran_64bit(uint64_t *ttbr, unsigned int *gran,
              * fall back to 4K by default.
              */
             *gran = GRANULE_SIZE_INDEX_4K;
+            break;
         }
 
         /* Use TTBR0 for GVA to IPA translation. */
@@ -291,6 +294,7 @@ static bool get_ttbr_and_gran_64bit(uint64_t *ttbr, unsigned int *gran,
              * fall back to 4K by default.
              */
             *gran = GRANULE_SIZE_INDEX_4K;
+            break;
         }
 
         /* Use TTBR1 for GVA to IPA translation. */
-- 
2.34.1


