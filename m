Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1EC7F598B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 08:46:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639390.996715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64Q3-00016W-4p; Thu, 23 Nov 2023 07:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639390.996715; Thu, 23 Nov 2023 07:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64Q3-00013B-1l; Thu, 23 Nov 2023 07:46:39 +0000
Received: by outflank-mailman (input) for mailman id 639390;
 Thu, 23 Nov 2023 07:46:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FfzT=HE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r64Hp-0004g4-5G
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 07:38:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e8e0aff-89d3-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 08:38:07 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 0A8124EE0747;
 Thu, 23 Nov 2023 08:38:05 +0100 (CET)
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
X-Inumbo-ID: 3e8e0aff-89d3-11ee-9b0e-b553b5be7939
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
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 1/2] xen/vmap: use ISOLATE_LSB to wrap a violation of Rule 10.1
Date: Thu, 23 Nov 2023 08:37:54 +0100
Message-Id: <d891af807a7d4430a2ea5e4e9aa520b14c709246.1700724699.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700724699.git.nicola.vetrini@bugseng.com>
References: <cover.1700724699.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Changed macro name
Changes in v3:
- Changed macro name
---
 xen/common/vmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 4fd6b3067ec1..330e2ba897d7 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -53,7 +53,7 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
     if ( !align )
         align = 1;
     else if ( align & (align - 1) )
-        align &= -align;
+        align = ISOLATE_LSB(align);
 
     ASSERT((t >= VMAP_DEFAULT) && (t < VMAP_REGION_NR));
     if ( !vm_base[t] )
-- 
2.34.1


