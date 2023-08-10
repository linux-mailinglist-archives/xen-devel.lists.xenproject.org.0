Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB5777321
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581924.911406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DI-0005gN-Q6; Thu, 10 Aug 2023 08:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581924.911406; Thu, 10 Aug 2023 08:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DI-0005XO-JX; Thu, 10 Aug 2023 08:40:12 +0000
Received: by outflank-mailman (input) for mailman id 581924;
 Thu, 10 Aug 2023 08:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZIv=D3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qU1DH-0005MW-AQ
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:40:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 844667fe-3759-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 10:40:10 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id B79434EE0743;
 Thu, 10 Aug 2023 10:40:09 +0200 (CEST)
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
X-Inumbo-ID: 844667fe-3759-11ee-b283-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 3/7] xen/include: make a declaration of 'get_sec' visible where needed
Date: Thu, 10 Aug 2023 10:39:43 +0200
Message-Id: <37fed394315c24e7b7419e564696a534886f0d53.1691655814.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691655814.git.nicola.vetrini@bugseng.com>
References: <cover.1691655814.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A declaration for 'get_sec' is added in 'xen/include/xen/time.h' to
be available for every call site (in particular 'cper.h').
This also resolves a violation of MISRA C:2012 Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: c8cb30cfc87a ("mce: Provide ERST interface")
---
Changes in v2:
- Revised commit message
- Split patch
---
 xen/include/xen/cper.h | 3 +--
 xen/include/xen/time.h | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/cper.h b/xen/include/xen/cper.h
index 7c6a4c45ce32..de8f385bdd5c 100644
--- a/xen/include/xen/cper.h
+++ b/xen/include/xen/cper.h
@@ -23,8 +23,7 @@
 
 #include <xen/types.h>
 #include <xen/string.h>
-
-extern unsigned long get_sec(void);
+#include <xen/time.h>
 
 typedef struct {
 	uint8_t b[16];
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index 5aafdda4f392..67c586b7369c 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -36,6 +36,7 @@ s_time_t get_s_time_fixed(u64 at_tick);
 s_time_t get_s_time(void);
 unsigned long get_localtime(struct domain *d);
 uint64_t get_localtime_us(struct domain *d);
+unsigned long get_sec(void);
 
 struct tm {
     int     tm_sec;         /* seconds */
-- 
2.34.1


