Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34BB7D5414
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622034.969127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRe-0005vI-85; Tue, 24 Oct 2023 14:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622034.969127; Tue, 24 Oct 2023 14:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRe-0005qG-59; Tue, 24 Oct 2023 14:31:46 +0000
Received: by outflank-mailman (input) for mailman id 622034;
 Tue, 24 Oct 2023 14:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CvU=GG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvIRd-0005kh-1l
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:31:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e27b213-727a-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 16:31:44 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 296784EE0746;
 Tue, 24 Oct 2023 16:31:43 +0200 (CEST)
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
X-Inumbo-ID: 0e27b213-727a-11ee-98d5-6d05b1d4d9a1
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
Subject: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
Date: Tue, 24 Oct 2023 16:31:35 +0200
Message-Id: <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com>
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
 xen/arch/x86/ioport_emulate.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/ioport_emulate.c b/xen/arch/x86/ioport_emulate.c
index 6caeb3d470ce..4f8d5136746d 100644
--- a/xen/arch/x86/ioport_emulate.c
+++ b/xen/arch/x86/ioport_emulate.c
@@ -44,57 +44,57 @@ static const struct dmi_system_id __initconstrel ioport_quirks_tbl[] = {
     {
         .ident = "HP ProLiant DL3xx",
         .matches = {
-            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3"),
+            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3"),
         },
     },
     {
         .ident = "HP ProLiant DL5xx",
         .matches = {
-            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
+            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
         },
     },
     {
         .ident = "HP ProLiant DL7xx",
         .matches = {
-            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL7"),
+            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL7"),
         },
     },
     {
         .ident = "HP ProLiant ML3xx",
         .matches = {
-            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML3"),
+            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML3"),
         },
     },
     {
         .ident = "HP ProLiant ML5xx",
         .matches = {
-            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML5"),
+            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML5"),
         },
     },
     {
         .ident = "HP ProLiant BL2xx",
         .matches = {
-            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL2"),
+            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL2"),
         },
     },
     {
         .ident = "HP ProLiant BL4xx",
         .matches = {
-            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL4"),
+            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL4"),
         },
     },
     {
         .ident = "HP ProLiant BL6xx",
         .matches = {
-            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL6"),
+            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL6"),
         },
     },
     { }
--
2.34.1

