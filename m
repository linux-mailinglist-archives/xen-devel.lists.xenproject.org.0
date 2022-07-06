Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30B9567BD2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 04:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361735.591384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8udN-0003uE-3Q; Wed, 06 Jul 2022 02:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361735.591384; Wed, 06 Jul 2022 02:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8udM-0003rz-Uq; Wed, 06 Jul 2022 02:19:20 +0000
Received: by outflank-mailman (input) for mailman id 361735;
 Wed, 06 Jul 2022 02:19:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NOi8=XL=computer.org=sarah.newman@srs-se1.protection.inumbo.net>)
 id 1o8udL-0003rt-3p
 for Xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 02:19:19 +0000
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 076732bd-fcd2-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 04:19:15 +0200 (CEST)
Received: from localhost.localdomain (c-174-62-72-237.hsd1.ca.comcast.net
 [174.62.72.237]) (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 2662IU8p027439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 5 Jul 2022 19:19:12 -0700
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
X-Inumbo-ID: 076732bd-fcd2-11ec-924f-1f966e50362f
From: Sarah Newman <sarah.newman@computer.org>
To: Xen-devel@lists.xenproject.org
Cc: Sarah Newman <sarah.newman@computer.org>
Subject: [PATCH] livepatch: create-diff-object: Check that the section has a secsym
Date: Tue,  5 Jul 2022 19:18:17 -0700
Message-Id: <20220706021817.20437-1-sarah.newman@computer.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Sonic-CAuth: UmFuZG9tSVaVEmSg1xTBtjzAVRjHxuM+LVGVNX6KaNr2i39qskd5ASwGzOwn0QhP2gNq27gGa6GJxaQ7la8IsvO+yO6d65zV
X-Sonic-ID: C;HiBT7dH87BGvsLBQfcNRkQ== M;4plqBtL87BGvsLBQfcNRkQ==
X-Spam-Flag: No
X-Sonic-Spam-Details: -0.0/5.0 by cerberusd

A STT_SECTION symbol is not needed if if it is not used as a relocation
target. Therefore, a section, in this case a debug section, may not have
a secsym associated with it.

This is a livepatch backport of kpatch upstream commit [1]:
create-diff-object: Check that the section has a secsym ba3defa

Signed-off-by: Sarah Newman <sarah.newman@computer.org>

[1] https://github.com/dynup/kpatch/commit/ba3defa06073dcc69917dbbbb9df570ca4e56612
---
 create-diff-object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index a516670..780e6c8 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1484,7 +1484,7 @@ static void kpatch_include_debug_sections(struct kpatch_elf *kelf)
 	list_for_each_entry(sec, &kelf->sections, list) {
 		if (is_debug_section(sec)) {
 			sec->include = 1;
-			if (!is_rela_section(sec))
+			if (!is_rela_section(sec) && sec->secsym)
 				sec->secsym->include = 1;
 		}
 	}
-- 
2.17.1


