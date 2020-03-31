Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AC2199381
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:34:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEAq-0000vJ-5c; Tue, 31 Mar 2020 10:31:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEAo-0000vA-MJ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:31:10 +0000
X-Inumbo-ID: bc469bd6-733a-11ea-b58d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc469bd6-733a-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 10:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585650670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9qsUPcuNZB94vcMy9A4eDY05j7eFH8egvaVUDX3e+N4=;
 b=P8m4r/cGzT/HK+6p8mv9xeS3J1VebosLqwZwnTTK0wmiR1FTcEX8dO+4
 U/eZtrpSHbm5rv5JASnW/HuYf5/xG32vQLL/rkEyxHBkE/OXlEWPPF/am
 X1WaKNcoF+kOq1HqTBv0Kk2WZ4Zdb+pWk5Fr3VGn+heUfHASWiGpfP100 M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M+Lfh2hbsCFUWmZLcxiwSyDh+gfuAqOD/NyLBDiSDyImtJfy+/jaWlANC1qSF5gUktIeB/EaRH
 RaqZ79KFNJcwBGG/CnLK44jT2YQbKDFgOpaGERr07aAfoaSQNcC4IEVzax+EFf2pCA/qrVW6mN
 E/JEkNiuE3LmlgHC3QEs8L5Hvtg/W39xm/Rl13Jtt7BVhc0r89iFFknbzT0uQTWQQEcEru4wZr
 Ful4VulXxHYAj5TtK53hHV1n7pp8R+qT+KDHcXJ5/brzOMfn9a01E2n9g3DY5QZ7zUQIJXMBxE
 cNk=
X-SBRS: 2.7
X-MesageID: 15138786
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15138786"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 07/18] build: Introduce documentation for xen Makefiles
Date: Tue, 31 Mar 2020 11:30:51 +0100
Message-ID: <20200331103102.1105674-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331103102.1105674-1-anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This start explainning the variables that can be used in the many
Makefiles in xen/.

Most of the document copies and modifies text from Linux v5.4 document
linux.git/Documentation/kbuild/makefiles.rst. Modification are mostly
to avoid mentioning kbuild. Thus I've added the SPDX tag which was
only in index.rst in linux.git.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 docs/misc/xen-makefiles/makefiles.rst | 87 +++++++++++++++++++++++++++
 xen/Rules.mk                          |  4 ++
 2 files changed, 91 insertions(+)
 create mode 100644 docs/misc/xen-makefiles/makefiles.rst

diff --git a/docs/misc/xen-makefiles/makefiles.rst b/docs/misc/xen-makefiles/makefiles.rst
new file mode 100644
index 000000000000..a86e3a612d61
--- /dev/null
+++ b/docs/misc/xen-makefiles/makefiles.rst
@@ -0,0 +1,87 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+Xen Makefiles
+=============
+
+Documentation for the build system of Xen, found in xen.git/xen/.
+
+Makefile files
+==============
+
+Description of the syntax that can be used in most Makefiles named
+'Makefile'. ('xen/Makefile' isn't part of the description.)
+
+'Makefile's are consumed by 'Rules.mk' when building.
+
+Goal definitions
+----------------
+
+	Goal definitions are the main part (heart) of the Makefile.
+	These lines define the files to be built, any special compilation
+	options, and any subdirectories to be entered recursively.
+
+	The most simple makefile contains one line:
+
+	Example::
+
+		obj-y += foo.o
+
+	This tells the build system that there is one object in that
+	directory, named foo.o. foo.o will be built from foo.c or foo.S.
+
+	The following pattern is often used to have object selected
+	depending on the configuration:
+
+	Example::
+
+		obj-$(CONFIG_FOO) += foo.o
+
+	$(CONFIG_FOO) can evaluates to y.
+	If CONFIG_FOO is not y, then the file will not be compiled nor linked.
+
+Descending down in directories
+------------------------------
+
+	A Makefile is only responsible for building objects in its own
+	directory. Files in subdirectories should be taken care of by
+	Makefiles in these subdirs. The build system will automatically
+	invoke make recursively in subdirectories, provided you let it know of
+	them.
+
+	To do so, obj-y is used.
+	acpi lives in a separate directory, and the Makefile present in
+	drivers/ tells the build system to descend down using the following
+	assignment.
+
+	Example::
+
+		#drivers/Makefile
+		obj-$(CONFIG_ACPI) += acpi/
+
+	If CONFIG_ACPI is set to 'y'
+	the corresponding obj- variable will be set, and the build system
+	will descend down in the apci directory.
+	The build system only uses this information to decide that it needs
+	to visit the directory, it is the Makefile in the subdirectory that
+	specifies what is modular and what is built-in.
+
+	It is good practice to use a `CONFIG_` variable when assigning directory
+	names. This allows the build system to totally skip the directory if the
+	corresponding `CONFIG_` option is 'y'.
+
+Compilation flags
+-----------------
+
+    CFLAGS-y and AFLAGS-y
+	These two flags apply only to the makefile in which they
+	are assigned. They are used for all the normal cc, as and ld
+	invocations happening during a recursive build.
+
+	$(CFLAGS-y) is necessary because the top Makefile owns the
+	variable $(XEN_CFLAGS) and uses it for compilation flags for the
+	entire tree. And the variable $(CFLAGS) is modified by Config.mk
+	which evaluated in every subdirs.
+
+	CFLAGS-y specifies options for compiling with $(CC).
+	AFLAGS-y specifies assembler options.
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 0def40a00a09..7f28c3bc6c13 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -1,3 +1,7 @@
+#
+# See docs/misc/xen-makefiles/makefiles.rst on variables that can be used in
+# Makefile and are consumed by Rules.mk
+#
 
 -include $(BASEDIR)/include/config/auto.conf
 
-- 
Anthony PERARD


