Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E346F8888
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 20:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530609.826360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzyK-0002u9-Jk; Fri, 05 May 2023 18:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530609.826360; Fri, 05 May 2023 18:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzyK-0002rv-GC; Fri, 05 May 2023 18:16:00 +0000
Received: by outflank-mailman (input) for mailman id 530609;
 Fri, 05 May 2023 18:15:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XVLi=A2=citrix.com=prvs=4822586d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puzyJ-0002Jh-No
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 18:15:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1b163f8-eb70-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 20:15:57 +0200 (CEST)
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
X-Inumbo-ID: e1b163f8-eb70-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683310557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1TQCZfeuZrxoYx6xAHLXfz0lWk/9oAGfIUvqEwt1EAY=;
  b=bck/AeeL2Q10dE+omKlXGA4dFSg3UvzWK2O5/jrvWh7nTWw7EjKCirch
   YP8GSNshhPRpSKQZh3hlEf74CyufL4zAYhvE72Dfu1PJj1srmdUjMLDw8
   WpDQpLM2Jl+gDwDB414/ugXwLW6l7jyVSfqm/un9Gix2h/wiO/S7WwWAu
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110484432
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:N56p7qlkX3X9MgmaceCoa6bo5gyYJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbX2DUOfuCZmP8f992aY3joRhU7MLVndU2TgJkrn1mQyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5AKGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aUKGAwiS06mvOXsz6qaZcBOhppyLda+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/B/
 j6WoziiWHn2MvS7mB2GwjGL2NbTnCPFG6BOHaXmzvd11Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Eec39QWMwar8+BuCCy4PSTspQMc9qMY8SDgu1
 1mIt9DkHzpitPuSU3313qiQhSO/P24SN2BqTS0ZSQoI5fHzrYd1iQjAJuuPC4bs0IezQ2uph
 WnX8m5n3e57YdM3O7uTpEL3vx2J+L3ySVQ6/iT4d0ClsFJ4e9vwD2C30mQ3/cqsPa7AEAna5
 iVVwpHBhAwdJcrTzXLQGY3hCJnsvq/Ya2OE3DaDCrF7r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGLoC6T7wJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yXS1AU/o7lWvuHLh1PVoX+8zD7TmLGcCTI+qPiNJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3CvZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt7It0/w/oNyruZl
 px/M2cBoGfCabT8AV3iQhhehHnHBv6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:mwvKjawAML+aSZ6e0BgRKrPw3L1zdoMgy1knxilNoHxuH/Bw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxedZjLcKqweKJ8SUzJ8+6U
 4PSchD4abLfD9HZcaR2njFLz4jquP3j5xBU43lvglQpQIBUdAQ0+9gYDzrdHGf3GN9dOAE/J
 z33Ls/mxOQPU45Q+6cHXc/U+3Kt7Tw5e/biU5vPW9e1OGW5wnYk4LHLw==
X-Talos-CUID: 9a23:Th/WcG7hWet5+YNtWtssrVwkJu8ALFjmyy3fO26XIERpFuyUVgrF
X-Talos-MUID: 9a23:0KCkDwtfXb6SUV25zs2noGBFN/crxPqXFEENr9Yk58CcaxR5JGLI
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="110484432"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH v2 2/2] LICENSES: Remove the use of deprecated SPDX tags
Date: Fri, 5 May 2023 19:15:28 +0100
Message-ID: <20230505181528.3587485-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505181528.3587485-1-andrew.cooper3@citrix.com>
References: <20230505181528.3587485-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The GPL and LGPL SPDX forms without an explicit -only or -or-later suffix are
deprecated and should not be used.  Update the documention.

Somewhat unhelpfully at the time of writing, this only appears to be indicated
by the separation of the two tables at https://spdx.org/licenses/

The recent changes to libacpi are the only examples of deprecated LGPL tags in
tree, so fix them all up.

For GPL, we have many examples using deprecated tags.  For now, just identify
them as such and recommend that no new instances get added.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

Unsure whether this should get some Fixes: tags or not.  Note also that
Jenny's "[PATCH v4 2/2] acpi: Add TPM2 interface definition." wants its SPDX
tag correcting as per this patch.

v2:
 * Extend commit message to include https://spdx.org/licenses/
 * Update the URLs too
---
 LICENSES/GPL-2.0                    | 15 ++++++++-------
 LICENSES/LGPL-2.0                   | 11 ++++++-----
 LICENSES/LGPL-2.1                   | 11 ++++++-----
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
 16 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/LICENSES/GPL-2.0 b/LICENSES/GPL-2.0
index fa5c66236fe9..07f332641ccd 100644
--- a/LICENSES/GPL-2.0
+++ b/LICENSES/GPL-2.0
@@ -1,9 +1,11 @@
-Valid-License-Identifier: GPL-2.0
 Valid-License-Identifier: GPL-2.0-only
-Valid-License-Identifier: GPL-2.0+
 Valid-License-Identifier: GPL-2.0-or-later
 
-SPDX-URL: https://spdx.org/licenses/GPL-2.0.html
+SPDX-URL: https://spdx.org/licenses/GPL-2.0-only.html
+SPDX-URL: https://spdx.org/licenses/GPL-2.0-or-later.html
+
+Deprecated-Identifier: GPL-2.0
+Deprecated-Identifier: GPL-2.0+
 
 Usage-Guide:
 
@@ -13,14 +15,13 @@ Usage-Guide:
 
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
index 2fa16d72eabf..100c72c6db8c 100644
--- a/LICENSES/LGPL-2.0
+++ b/LICENSES/LGPL-2.0
@@ -1,7 +1,8 @@
-Valid-License-Identifier: LGPL-2.0
-Valid-License-Identifier: LGPL-2.0+
+Valid-License-Identifier: LGPL-2.0-only
+Valid-License-Identifier: LGPL-2.0-or-later
 
-SPDX-URL: https://spdx.org/licenses/LGPL-2.0.html
+SPDX-URL: https://spdx.org/licenses/LGPL-2.0-only.html
+SPDX-URL: https://spdx.org/licenses/LGPL-2.0-or-later.html
 
 Usage-Guide:
 
@@ -10,11 +11,11 @@ Usage-Guide:
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
index b366c7e49199..d3e213c39c26 100644
--- a/LICENSES/LGPL-2.1
+++ b/LICENSES/LGPL-2.1
@@ -1,7 +1,8 @@
-Valid-License-Identifier: LGPL-2.1
-Valid-License-Identifier: LGPL-2.1+
+Valid-License-Identifier: LGPL-2.1-only
+Valid-License-Identifier: LGPL-2.1-or-later
 
-SPDX-URL: https://spdx.org/licenses/LGPL-2.1.html
+SPDX-URL: https://spdx.org/licenses/LGPL-2.1-only.html
+SPDX-URL: https://spdx.org/licenses/LGPL-2.1-or-later.html
 
 Usage-Guide:
 
@@ -10,11 +11,11 @@ Usage-Guide:
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


