Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0386CCF0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687195.1070269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKV-0000vx-L7; Thu, 29 Feb 2024 15:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687195.1070269; Thu, 29 Feb 2024 15:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKV-0000rA-Eu; Thu, 29 Feb 2024 15:28:15 +0000
Received: by outflank-mailman (input) for mailman id 687195;
 Thu, 29 Feb 2024 15:28:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfiKT-0008Ql-F2
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:28:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25de8189-d717-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 16:28:11 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id C5A944EE074D;
 Thu, 29 Feb 2024 16:28:10 +0100 (CET)
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
X-Inumbo-ID: 25de8189-d717-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 04/10] xen/public: address violations of MISRA C Rule 20.7
Date: Thu, 29 Feb 2024 16:27:56 +0100
Message-Id: <0cdc4dc2fcad699a2274277b32de3ee0207d5a2d.1709219010.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709219010.git.nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore
the macro XEN_DEFINE_UUID_ should wrap its parameters in parentheses.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/public/xen.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b47d48d0e2d6..fa23080bd7af 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -988,7 +988,7 @@ typedef struct {
       ((b) >>  8) & 0xFF, ((b) >>  0) & 0xFF,                           \
       ((c) >>  8) & 0xFF, ((c) >>  0) & 0xFF,                           \
       ((d) >>  8) & 0xFF, ((d) >>  0) & 0xFF,                           \
-                e1, e2, e3, e4, e5, e6}}
+                (e1), (e2), (e3), (e4), (e5), (e6)}}
 
 #if defined(__STDC_VERSION__) ? __STDC_VERSION__ >= 199901L : defined(__GNUC__)
 #define XEN_DEFINE_UUID(a, b, c, d, e1, e2, e3, e4, e5, e6)             \
-- 
2.34.1


