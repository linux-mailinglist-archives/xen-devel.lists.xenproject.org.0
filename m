Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D723A5A709
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 23:23:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906895.1314261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trlWN-0003y6-4g; Mon, 10 Mar 2025 22:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906895.1314261; Mon, 10 Mar 2025 22:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trlWN-0003wF-26; Mon, 10 Mar 2025 22:22:51 +0000
Received: by outflank-mailman (input) for mailman id 906895;
 Mon, 10 Mar 2025 22:22:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xZDr=V5=kernel.org=kees@srs-se1.protection.inumbo.net>)
 id 1trlWL-0003w7-K9
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 22:22:49 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f453fe3-fdfe-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 23:22:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 457A2A46469;
 Mon, 10 Mar 2025 22:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1073BC4CEE5;
 Mon, 10 Mar 2025 22:22:42 +0000 (UTC)
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
X-Inumbo-ID: 2f453fe3-fdfe-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741645362;
	bh=LCXo4DfrSJdUJ1t33RWhYUBGCFMNSfeyc9xn9l9EOP4=;
	h=From:To:Cc:Subject:Date:From;
	b=eyR1OoibFhYvcVGWRY2mIfOEfrczBqywVjPNO9glntGPPDG+7MdyxSueKDW80rZtJ
	 f5ETa/ulDQgYDqiu6PbkjOc+fRN16s1xKopuTYr1Mwc4pxd6E5d+1rEeH2K+ZDjW+q
	 dHRv8DDfGayt9/zdeHkPjnJEu/MhSl4JqFzfWKv2aTjk5dqcMcYleHwiMqgQTdlwK8
	 O/ozc/3LUW4kAzKmEHzPW9q9/mnnfL8/7GCmROvNSNrTiafiYvQ4UGWZtdWAIwJ3yj
	 trZmPpp8zphiXQhAbdk2JFt70YXP8lTUoS0VBSZoEvp7nL7t/gqM95nYXjdHwafxBM
	 uhkhRUg0tfVlw==
From: Kees Cook <kees@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Kees Cook <kees@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] xen/mcelog: Add __nonstring annotations for unterminated strings
Date: Mon, 10 Mar 2025 15:22:38 -0700
Message-Id: <20250310222234.work.473-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; i=kees@kernel.org; h=from:subject:message-id; bh=LCXo4DfrSJdUJ1t33RWhYUBGCFMNSfeyc9xn9l9EOP4=; b=owGbwMvMwCVmps19z/KJym7G02pJDOnn03Tv395t7BM52ejbP6GL1Smil6PnLJuw5J6LAXOJs Ubz0sX9HaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABOplWNkWJ+/OkepMFJSyMHP wr89d8Osk61rb+W0f/B8qVI06dF6DkaG1uWssseljx0122Ld+1/yslpJyh1+x1Mnvqx/O/tOCPc XZgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

When a character array without a terminating NUL character has a static
initializer, GCC 15's -Wunterminated-string-initialization will only
warn if the array lacks the "nonstring" attribute[1]. Mark the arrays
with __nonstring to and correctly identify the char array as "not a C
string" and thereby eliminate the warning.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117178 [1]
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Kees Cook <kees@kernel.org>
---
 include/xen/interface/xen-mca.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/xen/interface/xen-mca.h b/include/xen/interface/xen-mca.h
index 464aa6b3a5f9..1c9afbe8cc26 100644
--- a/include/xen/interface/xen-mca.h
+++ b/include/xen/interface/xen-mca.h
@@ -372,7 +372,7 @@ struct xen_mce {
 #define XEN_MCE_LOG_LEN 32
 
 struct xen_mce_log {
-	char signature[12]; /* "MACHINECHECK" */
+	char signature[12] __nonstring; /* "MACHINECHECK" */
 	unsigned len;	    /* = XEN_MCE_LOG_LEN */
 	unsigned next;
 	unsigned flags;
-- 
2.34.1


