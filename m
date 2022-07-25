Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ABD58036D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 19:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374728.606888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG1fb-0007Ze-KM; Mon, 25 Jul 2022 17:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374728.606888; Mon, 25 Jul 2022 17:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG1fb-0007XZ-HS; Mon, 25 Jul 2022 17:15:03 +0000
Received: by outflank-mailman (input) for mailman id 374728;
 Mon, 25 Jul 2022 17:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6z2V=X6=computer.org=sarah.newman@srs-se1.protection.inumbo.net>)
 id 1oG1fa-0007XT-SC
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 17:15:02 +0000
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f893653-0c3d-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 19:15:00 +0200 (CEST)
Received: from localhost.localdomain (c-174-62-72-237.hsd1.ca.comcast.net
 [174.62.72.237]) (authenticated bits=0)
 by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 26PHD3R7021698
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Jul 2022 10:14:55 -0700
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
X-Inumbo-ID: 4f893653-0c3d-11ed-bd2d-47488cf2e6aa
From: Sarah Newman <sarah.newman@computer.org>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com, ross.lagerwall@citrix.com,
        Sarah Newman <sarah.newman@computer.org>
Subject: [PATCH v3] livepatch: create-diff-object: Check that the section has a secsym
Date: Mon, 25 Jul 2022 10:13:02 -0700
Message-Id: <20220725171302.25910-1-sarah.newman@computer.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <d45c75a2-81ae-7061-6f75-ed8378fc6d16@suse.com>
References: <d45c75a2-81ae-7061-6f75-ed8378fc6d16@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Sonic-CAuth: UmFuZG9tSVYw7an9Y36xyKou/Ityk+kRmydRdr2FhcFU/JCK9M/WxdIVNlvsx6221yndaODaqA+nI/CrvDASekfPuR8/E4h4
X-Sonic-ID: C;pNjCCj0M7RGWb/U2He8XJw== M;eGqDTT0M7RGWb/U2He8XJw==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

A STT_SECTION symbol is not needed if if it is not used as a relocation
target. Therefore, a section, in this case a debug section, may not have
a secsym associated with it.

Signed-off-by: Bill Wendling <morbo@google.com>
Origin: https://github.com/dynup/kpatch.git ba3defa06073
Signed-off-by: Sarah Newman <sarah.newman@computer.org>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
Changes in v3:
- add reviewed-by given to v1 of this patch
- restored tag from original commit per sending-patches.pandoc
Changes in v2:
- commit message changed to use Origin
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


