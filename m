Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7C7D9A20
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624410.973013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwN1N-0005m5-HK; Fri, 27 Oct 2023 13:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624410.973013; Fri, 27 Oct 2023 13:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwN1N-0005iy-A2; Fri, 27 Oct 2023 13:37:05 +0000
Received: by outflank-mailman (input) for mailman id 624410;
 Fri, 27 Oct 2023 13:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwN1M-0005Th-8y
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:37:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e95107f6-74cd-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 15:37:02 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 2077D4EE074E;
 Fri, 27 Oct 2023 15:37:00 +0200 (CEST)
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
X-Inumbo-ID: e95107f6-74cd-11ee-9b0e-b553b5be7939
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
Subject: [XEN PATCH][for-4.19 v2 1/2] xen/vmap: use ISOLATE_LOW_BIT to wrap a violation of Rule 10.1
Date: Fri, 27 Oct 2023 15:36:55 +0200
Message-Id: <f2de37fa69d1bf88433ad2a67411357cbca0367d.1698413073.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698413073.git.nicola.vetrini@bugseng.com>
References: <cover.1698413073.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Changed macro name
---
 xen/common/vmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 4fd6b3067ec1..1e498a6e525b 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -53,7 +53,7 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
     if ( !align )
         align = 1;
     else if ( align & (align - 1) )
-        align &= -align;
+        align = ISOLATE_LOW_BIT(align);
 
     ASSERT((t >= VMAP_DEFAULT) && (t < VMAP_REGION_NR));
     if ( !vm_base[t] )
-- 
2.34.1


