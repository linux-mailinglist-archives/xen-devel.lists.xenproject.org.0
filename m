Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B07D5415
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622035.969142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRg-0006Iy-Hm; Tue, 24 Oct 2023 14:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622035.969142; Tue, 24 Oct 2023 14:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRg-0006Fa-E8; Tue, 24 Oct 2023 14:31:48 +0000
Received: by outflank-mailman (input) for mailman id 622035;
 Tue, 24 Oct 2023 14:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CvU=GG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvIRe-0005kh-QZ
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:31:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eebeb4a-727a-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 16:31:45 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 6D9DF4EE0748;
 Tue, 24 Oct 2023 16:31:44 +0200 (CEST)
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
X-Inumbo-ID: 0eebeb4a-727a-11ee-98d5-6d05b1d4d9a1
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
Subject: [RFC 2/4] x86/shutdown: address MISRA C:2012 Rule 9.3
Date: Tue, 24 Oct 2023 16:31:36 +0200
Message-Id: <b4781f1a558a32747f1aca53b6da50a2d4b61f1e.1698155925.git.nicola.vetrini@bugseng.com>
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
 xen/arch/x86/shutdown.c | 152 ++++++++++++++++++++--------------------
 1 file changed, 76 insertions(+), 76 deletions(-)

diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index 7619544d14da..382c948f81a4 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -188,8 +188,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell E520",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Dell DM061"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Dell DM061")
         },
     },
     {    /* Handle problems with rebooting on Dell 1300's */
@@ -197,8 +197,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell PowerEdge 1300",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 1300/"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 1300/")
         },
     },
     {    /* Handle problems with rebooting on Dell 300's */
@@ -206,8 +206,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell PowerEdge 300",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 300/"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 300/")
         },
     },
     {    /* Handle problems with rebooting on Dell Optiplex 745's SFF */
@@ -215,8 +215,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 745",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745")
         },
     },
     {    /* Handle problems with rebooting on Dell Optiplex 745's DFF */
@@ -225,8 +225,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .ident = "Dell OptiPlex 745",
         .matches = {
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
-            DMI_MATCH(DMI_BOARD_NAME, "0MM599"),
+            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
+            [1] = DMI_MATCH(DMI_BOARD_NAME, "0MM599")
         },
     },
     {    /* Handle problems with rebooting on Dell Optiplex 745 with 0KW626 */
@@ -235,8 +235,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .ident = "Dell OptiPlex 745",
         .matches = {
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
-            DMI_MATCH(DMI_BOARD_NAME, "0KW626"),
+            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
+            [1] = DMI_MATCH(DMI_BOARD_NAME, "0KW626")
         },
     },
     {    /* Handle problems with rebooting on Dell Optiplex 330 with 0KP561 */
@@ -245,8 +245,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .ident = "Dell OptiPlex 330",
         .matches = {
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 330"),
-            DMI_MATCH(DMI_BOARD_NAME, "0KP561"),
+            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 330"),
+            [1] = DMI_MATCH(DMI_BOARD_NAME, "0KP561")
         },
     },
     {    /* Handle problems with rebooting on Dell Optiplex 360 with 0T656F */
@@ -255,8 +255,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .ident = "Dell OptiPlex 360",
         .matches = {
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 360"),
-            DMI_MATCH(DMI_BOARD_NAME, "0T656F"),
+            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 360"),
+            [1] = DMI_MATCH(DMI_BOARD_NAME, "0T656F")
         },
     },
     {    /* Handle problems with rebooting on Dell OptiPlex 760 with 0G919G */
@@ -265,8 +265,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .ident = "Dell OptiPlex 760",
         .matches = {
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 760"),
-            DMI_MATCH(DMI_BOARD_NAME, "0G919G"),
+            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 760"),
+            [1] = DMI_MATCH(DMI_BOARD_NAME, "0G919G")
         },
     },
     {    /* Handle problems with rebooting on Dell 2400's */
@@ -274,8 +274,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell PowerEdge 2400",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 2400"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 2400")
         },
     },
     {    /* Handle problems with rebooting on Dell T5400's */
@@ -283,8 +283,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell Precision T5400",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T5400"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T5400")
         },
     },
     {    /* Handle problems with rebooting on Dell T7400's */
@@ -292,8 +292,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell Precision T7400",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T7400"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T7400")
         },
     },
     {    /* Handle problems with rebooting on HP laptops */
@@ -301,8 +301,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "HP Compaq Laptop",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "HP Compaq"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "HP Compaq")
         },
     },
     {    /* Handle problems with rebooting on Dell XPS710 */
@@ -310,8 +310,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell XPS710",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Dell XPS710"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Dell XPS710")
         },
     },
     {    /* Handle problems with rebooting on Dell DXP061 */
@@ -319,8 +319,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell DXP061",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Dell DXP061"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Dell DXP061")
         },
     },
     {    /* Handle problems with rebooting on Sony VGN-Z540N */
@@ -328,8 +328,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Sony VGN-Z540N",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "VGN-Z540N"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "VGN-Z540N")
         },
     },
     {    /* Handle problems with rebooting on ASUS P4S800 */
@@ -337,8 +337,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "ASUS P4S800",
         .matches = {
-            DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer INC."),
-            DMI_MATCH(DMI_BOARD_NAME, "P4S800"),
+            [0] = DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer INC."),
+            [1] = DMI_MATCH(DMI_BOARD_NAME, "P4S800")
         },
     },
     {    /* Handle reboot issue on Acer Aspire one */
@@ -346,8 +346,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Acer Aspire One A110",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "AOA110"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "AOA110")
         },
     },
     {    /* Handle problems with rebooting on Apple MacBook5 */
@@ -355,8 +355,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple MacBook5",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5")
         },
     },
     {    /* Handle problems with rebooting on Apple MacBookPro5 */
@@ -364,8 +364,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple MacBookPro5",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5")
         },
     },
     {    /* Handle problems with rebooting on Apple Macmini3,1 */
@@ -373,8 +373,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple Macmini3,1",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Macmini3,1"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Macmini3,1")
         },
     },
     {    /* Handle problems with rebooting on the iMac9,1. */
@@ -382,8 +382,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple iMac9,1",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "iMac9,1"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "iMac9,1")
         },
     },
     {    /* Handle problems with rebooting on the Latitude E6320. */
@@ -391,8 +391,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6320",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320")
         },
     },
     {    /* Handle problems with rebooting on the Latitude E5420. */
@@ -400,8 +400,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E5420",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5420"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5420")
         },
     },
     {       /* Handle problems with rebooting on the Latitude E6220. */
@@ -409,8 +409,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6220",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6220"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6220")
         },
     },
     {    /* Handle problems with rebooting on the Latitude E6420. */
@@ -418,8 +418,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6420",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420")
         },
     },
     {    /* Handle problems with rebooting on the OptiPlex 990. */
@@ -427,8 +427,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 990",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990")
         },
     },
     {    /* Handle problems with rebooting on the Precision M6600. */
@@ -436,8 +436,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 990",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Precision M6600"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Precision M6600")
         },
     },
     {    /* Handle problems with rebooting on the Latitude E6520. */
@@ -445,8 +445,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6520",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520")
         },
     },
     {       /* Handle problems with rebooting on the OptiPlex 790. */
@@ -454,8 +454,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 790",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 790"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 790")
         },
     },
     {    /* Handle problems with rebooting on the OptiPlex 990. */
@@ -463,8 +463,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 990",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990")
         },
     },
     {    /* Handle problems with rebooting on the OptiPlex 390. */
@@ -472,8 +472,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 390",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 390"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 390")
         },
     },
     {    /* Handle problems with rebooting on Dell OptiPlex 9020. */
@@ -481,8 +481,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_ACPI,
         .ident = "Dell OptiPlex 9020",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 9020"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 9020")
         },
     },
     {    /* Handle problems with rebooting on the Latitude E6320. */
@@ -490,8 +490,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6320",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320")
         },
     },
     {    /* Handle problems with rebooting on the Latitude E6420. */
@@ -499,8 +499,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6420",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420")
         },
     },
     {    /* Handle problems with rebooting on the Latitude E6520. */
@@ -508,8 +508,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6520",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520")
         },
     },
     {    /* Handle problems with rebooting on Dell PowerEdge R540. */
@@ -517,8 +517,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_ACPI,
         .ident = "Dell PowerEdge R540",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R540"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R540")
         },
     },
     {    /* Handle problems with rebooting on Dell PowerEdge R740. */
@@ -526,8 +526,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
         .driver_data = (void *)(long)BOOT_ACPI,
         .ident = "Dell PowerEdge R740",
         .matches = {
-            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740"),
+            [0] = DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740")
         },
     },
     { }
--
2.34.1

