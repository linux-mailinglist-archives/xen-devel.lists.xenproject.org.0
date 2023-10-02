Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D177B4CCB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 09:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611148.950626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnDgx-0008BB-EP; Mon, 02 Oct 2023 07:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611148.950626; Mon, 02 Oct 2023 07:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnDgx-00088W-81; Mon, 02 Oct 2023 07:50:11 +0000
Received: by outflank-mailman (input) for mailman id 611148;
 Mon, 02 Oct 2023 07:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uL8T=FQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qnDgv-0006dn-1o
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 07:50:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d4b3207-60f8-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 09:50:06 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id CA0AB4EE0C89;
 Mon,  2 Oct 2023 09:50:05 +0200 (CEST)
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
X-Inumbo-ID: 4d4b3207-60f8-11ee-9b0d-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Henry.Wang@arm.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 6/7] xen/console: make function static inline
Date: Mon,  2 Oct 2023 09:49:49 +0200
Message-Id: <c4f778440688a1e1f81cc149aca8dd5248895f68.1696232393.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696232393.git.nicola.vetrini@bugseng.com>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of 'consoled_guest_tx' can be static inline,
thereby fixing a violation of MISRA C:2012 Rule 8.4.

Fixes: 5ef49f185c2d ("x86/pv-shim: shadow PV console's page for L2 DomU")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/consoled.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
index fd5d220a8aca..e943d8d48f7b 100644
--- a/xen/include/xen/consoled.h
+++ b/xen/include/xen/consoled.h
@@ -12,7 +12,7 @@ size_t consoled_guest_tx(char c);
 
 #else
 
-size_t consoled_guest_tx(char c) { return 0; }
+static inline size_t consoled_guest_tx(char c) { return 0; }
 
 #endif /* !CONFIG_PV_SHIM */
 #endif /* __XEN_CONSOLED_H__ */
-- 
2.34.1


