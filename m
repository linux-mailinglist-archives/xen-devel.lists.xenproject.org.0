Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B525B7D5417
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:32:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622036.969150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRk-0006c6-RC; Tue, 24 Oct 2023 14:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622036.969150; Tue, 24 Oct 2023 14:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRk-0006Z3-Nd; Tue, 24 Oct 2023 14:31:52 +0000
Received: by outflank-mailman (input) for mailman id 622036;
 Tue, 24 Oct 2023 14:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CvU=GG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvIRj-0006O8-90
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:31:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f8711dd-727a-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 16:31:46 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id CA8294EE0749;
 Tue, 24 Oct 2023 16:31:45 +0200 (CEST)
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
X-Inumbo-ID: 0f8711dd-727a-11ee-9b0e-b553b5be7939
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
	Wei Liu <wl@xen.org>
Subject: [RFC 3/4] x86/hvm: quirks: address MISRA C:2012 Rule 9.3
Date: Tue, 24 Oct 2023 16:31:37 +0200
Message-Id: <2ba4ba50b7460ff03f7c4e38aca17c9c24bcad39.1698155925.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698155925.git.nicola.vetrini@bugseng.com>
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Partially explicitly initalized .matches arrays result in violations
of Rule 9.3; this is resolved by using designated initializers,
which is permitted by the Rule.

Mechanical changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/quirks.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/quirks.c b/xen/arch/x86/hvm/quirks.c
index bd30b0f881cb..75c3fdc87749 100644
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -37,40 +37,40 @@ static int __init cf_check check_port80(void)
             .callback = dmi_hvm_deny_port80,
             .ident    = "Compaq Presario V6000",
             .matches  = {
-                DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30B7")
+                [0] = DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
+                [1] = DMI_MATCH(DMI_BOARD_NAME,   "30B7")
             }
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "HP Pavilion dv9000z",
             .matches  = {
-                DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30B9")
+                [0] = DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
+                [1] = DMI_MATCH(DMI_BOARD_NAME,   "30B9")
             }
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "HP Pavilion dv6000",
             .matches  = {
-                DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30B8")
+                [0] = DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
+                [1] = DMI_MATCH(DMI_BOARD_NAME,   "30B8")
             }
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "HP Pavilion tx1000",
             .matches  = {
-                DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30BF")
+                [0] = DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
+                [1] = DMI_MATCH(DMI_BOARD_NAME,   "30BF")
             }
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "Presario F700",
             .matches  = {
-                DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30D3")
+                [0] = DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
+                [1] = DMI_MATCH(DMI_BOARD_NAME,   "30D3")
             }
         },
         { }
-- 
2.34.1


