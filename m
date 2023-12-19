Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB481860A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656671.1025056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvS-0004iv-EA; Tue, 19 Dec 2023 11:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656671.1025056; Tue, 19 Dec 2023 11:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvS-0004a0-9R; Tue, 19 Dec 2023 11:06:14 +0000
Received: by outflank-mailman (input) for mailman id 656671;
 Tue, 19 Dec 2023 11:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Div9=H6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rFXvQ-0003cc-2G
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:06:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d6cbe10-9e5e-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 12:06:10 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 7A4024EE0C9B;
 Tue, 19 Dec 2023 12:06:09 +0100 (CET)
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
X-Inumbo-ID: 9d6cbe10-9e5e-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH v2 6/6] xen/common: address violations of MISRA C:2012 Rule 11.8
Date: Tue, 19 Dec 2023 12:05:14 +0100
Message-Id: <df682e995b726b5f7ba8af0f69bb888c398eac96.1702982442.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic qualification
from the type pointed to by a pointer".

Change cast type from void* to uintptr_t.
void* type cast resulted in violation of the Rule, a cast to type uintptr_t
is more appropriate type-wise.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
Commit introduced in v2
---
 xen/common/version.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/version.c b/xen/common/version.c
index d320135208..e807ef4de0 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -178,7 +178,7 @@ void __init xen_build_init(void)
     if ( &n[1] >= __note_gnu_build_id_end )
         return;
 
-    sz = (void *)__note_gnu_build_id_end - (void *)n;
+    sz = (uintptr_t)__note_gnu_build_id_end - (uintptr_t)n;
 
     rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
 
-- 
2.40.0


