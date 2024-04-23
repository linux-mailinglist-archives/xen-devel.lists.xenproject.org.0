Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A248AEA5F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710799.1110332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpq-0008FQ-Tz; Tue, 23 Apr 2024 15:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710799.1110332; Tue, 23 Apr 2024 15:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpq-00088U-Q2; Tue, 23 Apr 2024 15:13:30 +0000
Received: by outflank-mailman (input) for mailman id 710799;
 Tue, 23 Apr 2024 15:13:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5BF=L4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzHpo-0004ry-Ss
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:13:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 098faf24-0184-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:13:28 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 4A6434EE073F;
 Tue, 23 Apr 2024 17:13:27 +0200 (CEST)
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
X-Inumbo-ID: 098faf24-0184-11ef-909a-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 10/10] x86/mm: address violations of MISRA C Rule 20.7
Date: Tue, 23 Apr 2024 17:12:52 +0200
Message-Id: <067c2c22f84f7d1ed1c89d65859f70ac2fd7610a.1713885065.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713885065.git.nicola.vetrini@bugseng.com>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 9141912ae52d..87529db7d136 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -162,7 +162,7 @@ static uint32_t base_disallow_mask;
 #define L4_DISALLOW_MASK (base_disallow_mask)
 
 #define l1_disallow_mask(d)                                     \
-    ((d != dom_io) &&                                           \
+    (((d) != dom_io) &&                                         \
      (rangeset_is_empty((d)->iomem_caps) &&                     \
       rangeset_is_empty((d)->arch.ioport_caps) &&               \
       !has_arch_pdevs(d) &&                                     \
-- 
2.34.1


