Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351E7BD3DD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 08:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614149.955127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAX-0006oq-Ne; Mon, 09 Oct 2023 06:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614149.955127; Mon, 09 Oct 2023 06:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAX-0006mz-Eq; Mon, 09 Oct 2023 06:55:09 +0000
Received: by outflank-mailman (input) for mailman id 614149;
 Mon, 09 Oct 2023 06:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Np=FX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qpkAW-0005Uv-IB
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 06:55:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8534936-6670-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 08:55:08 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 378CE4EE0748;
 Mon,  9 Oct 2023 08:55:06 +0200 (CEST)
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
X-Inumbo-ID: c8534936-6670-11ee-98d3-6d05b1d4d9a1
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
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v2 6/7] xen/console: make function static inline
Date: Mon,  9 Oct 2023 08:54:51 +0200
Message-Id: <6ca7d9834079b7824f9432799cce2308aa88d159.1696833629.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696833629.git.nicola.vetrini@bugseng.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of 'consoled_guest_tx' can be static inline,
thereby fixing a violation of MISRA C:2012 Rule 8.4.

Fixes: 5ef49f185c2d ("x86/pv-shim: shadow PV console's page for L2 DomU")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


