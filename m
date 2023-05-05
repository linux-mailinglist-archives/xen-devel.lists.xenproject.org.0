Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85C6F8370
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 15:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530328.825895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puv85-0004WV-Ju; Fri, 05 May 2023 13:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530328.825895; Fri, 05 May 2023 13:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puv85-0004UD-GD; Fri, 05 May 2023 13:05:45 +0000
Received: by outflank-mailman (input) for mailman id 530328;
 Fri, 05 May 2023 13:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XVLi=A2=citrix.com=prvs=4822586d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puv83-0003zO-Vt
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 13:05:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a541022-eb45-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 15:05:42 +0200 (CEST)
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
X-Inumbo-ID: 8a541022-eb45-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683291943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2bX75MfTm7xh700KZ13jcKWteUQ7dRrOiWoTRNhLPAY=;
  b=dYRbFxwfFlIYNr10Phm3SDW/0pzQHu6j3Oz9sesHXEKwmmSp2WLdO6zB
   HaYsxYBX5YEzskyOufH7ZUO1TrTS3L6huK3BtLIKpJnOHBAh+HEMgzLeU
   bD9pMPgBr9UHdMB7HM+p2OKm3ExuA15Iyx4qXGTsz1Jomi4qWZ74QljdP
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108401387
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:vn5UFaiUPoRXygEj5O7GNLDaX161eRAKZh0ujC45NGQN5FlHY01je
 htvXj+FM/7ZN2v3ctwnOd6290sA7ZSHztUwSwFtqS01ES0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QeDzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQhEx40P0yKhNjx44ODYNlgutQAAczkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 jKapz2iUk5y2Nq32R+B1kKCl+/znhz7SJ0pBrKd3PBajwjGroAUIEJPDgbqyRWjsWalQM5WI
 UEQ/isorIAx+VatQ927WAe3yFabujYMVtwWFPc1gCmP167V7gCxFmUCCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWd14OvX2uqm
 nbT8XZ43u9I5SIW60ml1Wn8rQv9+pHKdEkW1z39bm6Z/iBUYYHwMuRE9mPnAeZ8wJexFwfR5
 yJZypHHs4jiHrnWynXTHbxl8KWBoq/cbWaC2QMH84wJrWzFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUvIT46Nugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UyZBU/45kGPnH7xCuVPO+h3SOEuJHcyrp/hZ+eP2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/a3J+FkeLSmOEH/qNdDRW3m2FBnXfgaXeQLLL/cSuencUl9Y8LsLUQJJ9U5w/8PybiVr
 hlQmCZwkTLCuJEOEi3SAlgLVV8ldcwXQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:g7a6Ka4Z7h2xCF+HEAPXwM/XdLJyesId70hD6qkRc20yTiX8ra
 rCoB11737JYVoqOE3I4OrvBEDiewK6yXcW2/h1AV7KZmCP01dASrsSjrcKqweNJ8SUzJ846U
 4PSdkdNDUuZWIUsS6ciDPIauod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3A7FiXjGpgGp8n1aa4XKKADqrmUfkeXESMkH7TGQi?=
 =?us-ascii?q?bOF5DeLGpWXy9/awxxg=3D=3D?=
X-Talos-MUID: 9a23:pZ/JGAmvWLgeA+bgXzoldnpyEcNM04q/CHwOrpUWpPKWOglaNQeS2WE=
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="108401387"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH 2/2] LICENSES: Remove the use of deprecated LGPL SPDX tags
Date: Fri, 5 May 2023 14:05:33 +0100
Message-ID: <20230505130533.3580545-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
References: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The SPDX forms without an explicit -only or -or-later suffix are deprecated
and should not be used.  The recent changes to libacpi are the only examples
in tree, so fix them all up.

For GPL, we have many examples using deprecated tags.  For now, just identify
them as such recommend that no new instances get added.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

Unsure whether this should get some Fixes: tags or not.  Note also that
Jenny's "[PATCH v4 2/2] acpi: Add TPM2 interface definition." wants its SPDX
tag correcting as per this patch.
---
 LICENSES/GPL-2.0                    | 12 ++++++------
 LICENSES/LGPL-2.0                   |  8 ++++----
 LICENSES/LGPL-2.1                   |  8 ++++----
 tools/libacpi/Makefile              |  2 +-
 tools/libacpi/acpi2_0.h             |  2 +-
 tools/libacpi/build.c               |  2 +-
 tools/libacpi/dsdt.asl              |  2 +-
 tools/libacpi/dsdt_acpi_info.asl    |  2 +-
 tools/libacpi/libacpi.h             |  2 +-
 tools/libacpi/mk_dsdt.c             |  2 +-
 tools/libacpi/ssdt_laptop_slate.asl |  2 +-
 tools/libacpi/ssdt_pm.asl           |  2 +-
 tools/libacpi/ssdt_s3.asl           |  2 +-
 tools/libacpi/ssdt_s4.asl           |  2 +-
 tools/libacpi/ssdt_tpm.asl          |  2 +-
 tools/libacpi/static_tables.c       |  2 +-
 16 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/LICENSES/GPL-2.0 b/LICENSES/GPL-2.0
index 0022a7c17788..dcd969aa85b5 100644
--- a/LICENSES/GPL-2.0
+++ b/LICENSES/GPL-2.0
@@ -1,8 +1,9 @@
-Valid-License-Identifier: GPL-2.0
 Valid-License-Identifier: GPL-2.0-only
-Valid-License-Identifier: GPL-2.0+
 Valid-License-Identifier: GPL-2.0-or-later
 
+Deprecated-Identifier: GPL-2.0
+Deprecated-Identifier: GPL-2.0+
+
 SPDX-URL: https://spdx.org/licenses/GPL-2.0.html
 
 Usage-Guide:
@@ -13,13 +14,12 @@ Usage-Guide:
 
   For 'GNU General Public License (GPL) version 2 only' use:
     SPDX-License-Identifier: GPL-2.0-only
-  or (now deprecated)
-    SPDX-License-Identifier: GPL-2.0
   For 'GNU General Public License (GPL) version 2 or any later version' use:
-    SPDX-License-Identifier: GPL-2.0+
-  or
     SPDX-License-Identifier: GPL-2.0-or-later
 
+  The deprecated tags should not be used for any new additions.  Where
+  possible, their existing uses should be phased out.
+
 License-Text:
 
 		    GNU GENERAL PUBLIC LICENSE
diff --git a/LICENSES/LGPL-2.0 b/LICENSES/LGPL-2.0
index 2fa16d72eabf..c960ba3ce3b8 100644
--- a/LICENSES/LGPL-2.0
+++ b/LICENSES/LGPL-2.0
@@ -1,5 +1,5 @@
-Valid-License-Identifier: LGPL-2.0
-Valid-License-Identifier: LGPL-2.0+
+Valid-License-Identifier: LGPL-2.0-only
+Valid-License-Identifier: LGPL-2.0-or-later
 
 SPDX-URL: https://spdx.org/licenses/LGPL-2.0.html
 
@@ -10,11 +10,11 @@ Usage-Guide:
   guidelines in the licensing rules documentation.
 
   For 'GNU Library General Public License (LGPL) version 2.0 only' use:
-    SPDX-License-Identifier: LGPL-2.0
+    SPDX-License-Identifier: LGPL-2.0-only
 
   For 'GNU Library General Public License (LGPL) version 2.0 or any later
   version' use:
-    SPDX-License-Identifier: LGPL-2.0+
+    SPDX-License-Identifier: LGPL-2.0-or-later
 
 License-Text:
 
diff --git a/LICENSES/LGPL-2.1 b/LICENSES/LGPL-2.1
index b366c7e49199..4553664b76bf 100644
--- a/LICENSES/LGPL-2.1
+++ b/LICENSES/LGPL-2.1
@@ -1,5 +1,5 @@
-Valid-License-Identifier: LGPL-2.1
-Valid-License-Identifier: LGPL-2.1+
+Valid-License-Identifier: LGPL-2.1-only
+Valid-License-Identifier: LGPL-2.1-or-later
 
 SPDX-URL: https://spdx.org/licenses/LGPL-2.1.html
 
@@ -10,11 +10,11 @@ Usage-Guide:
   guidelines in the licensing rules documentation.
 
   For 'GNU Lesser General Public License (LGPL) version 2.1 only' use:
-    SPDX-License-Identifier: LGPL-2.1
+    SPDX-License-Identifier: LGPL-2.1-only
 
   For 'GNU Lesser General Public License (LGPL) version 2.1 or any later
   version' use:
-    SPDX-License-Identifier: LGPL-2.1+
+    SPDX-License-Identifier: LGPL-2.1-or-later
 
 License-Text:
 
diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index aa9c520cbe85..bcfcd852f92f 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1
+# SPDX-License-Identifier: LGPL-2.1-only
 #
 # Copyright (c) 2004, Intel Corporation.
 
diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
index 212f5ab64182..e00b29854be0 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 /*
  * Copyright (c) 2004, Intel Corporation.
  */
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 830d37c61f03..3142e0ac84c0 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 /*
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2006, Keir Fraser, XenSource Inc.
diff --git a/tools/libacpi/dsdt.asl b/tools/libacpi/dsdt.asl
index c6691b56a986..32b42f85ae9f 100644
--- a/tools/libacpi/dsdt.asl
+++ b/tools/libacpi/dsdt.asl
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 /******************************************************************************
  * DSDT for Xen with Qemu device model
  *
diff --git a/tools/libacpi/dsdt_acpi_info.asl b/tools/libacpi/dsdt_acpi_info.asl
index c6e82f1fe6a7..6e114fa23404 100644
--- a/tools/libacpi/dsdt_acpi_info.asl
+++ b/tools/libacpi/dsdt_acpi_info.asl
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 
     Scope (\_SB)
     {
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index acf012e35578..7ae28525f604 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 /******************************************************************************
  * libacpi.h
  * 
diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
index c74b270c0c5d..34f6753f6193 100644
--- a/tools/libacpi/mk_dsdt.c
+++ b/tools/libacpi/mk_dsdt.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 
 #include <stdio.h>
 #include <stdarg.h>
diff --git a/tools/libacpi/ssdt_laptop_slate.asl b/tools/libacpi/ssdt_laptop_slate.asl
index 494f2d048d0a..69fd504c19fc 100644
--- a/tools/libacpi/ssdt_laptop_slate.asl
+++ b/tools/libacpi/ssdt_laptop_slate.asl
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 /*
  * ssdt_conv.asl
  *
diff --git a/tools/libacpi/ssdt_pm.asl b/tools/libacpi/ssdt_pm.asl
index e577e85c072b..db578d10ac3e 100644
--- a/tools/libacpi/ssdt_pm.asl
+++ b/tools/libacpi/ssdt_pm.asl
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 /*
  * ssdt_pm.asl
  *
diff --git a/tools/libacpi/ssdt_s3.asl b/tools/libacpi/ssdt_s3.asl
index 8f3177ec5adc..f6e9636f4759 100644
--- a/tools/libacpi/ssdt_s3.asl
+++ b/tools/libacpi/ssdt_s3.asl
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 /*
  * ssdt_s3.asl
  *
diff --git a/tools/libacpi/ssdt_s4.asl b/tools/libacpi/ssdt_s4.asl
index 979318eca1f5..8014f5fc9014 100644
--- a/tools/libacpi/ssdt_s4.asl
+++ b/tools/libacpi/ssdt_s4.asl
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 /*
  * ssdt_s4.asl
  *
diff --git a/tools/libacpi/ssdt_tpm.asl b/tools/libacpi/ssdt_tpm.asl
index 6c3267218f3b..944658d25177 100644
--- a/tools/libacpi/ssdt_tpm.asl
+++ b/tools/libacpi/ssdt_tpm.asl
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 /*
  * ssdt_tpm.asl
  *
diff --git a/tools/libacpi/static_tables.c b/tools/libacpi/static_tables.c
index 631fb911413b..715f46fee05c 100644
--- a/tools/libacpi/static_tables.c
+++ b/tools/libacpi/static_tables.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1 */
+/* SPDX-License-Identifier: LGPL-2.1-only */
 /*
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2006, Keir Fraser, XenSource Inc.
-- 
2.30.2


