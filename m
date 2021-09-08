Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FD540375D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181617.328870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHw-0002ts-HF; Wed, 08 Sep 2021 09:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181617.328870; Wed, 08 Sep 2021 09:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHw-0002oH-A7; Wed, 08 Sep 2021 09:54:40 +0000
Received: by outflank-mailman (input) for mailman id 181617;
 Wed, 08 Sep 2021 09:54:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FUO+=N6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mNuHu-0001EI-4X
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2f1fdc5-108a-11ec-b148-12813bfff9fa;
 Wed, 08 Sep 2021 09:54:30 +0000 (UTC)
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
X-Inumbo-ID: c2f1fdc5-108a-11ec-b148-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631094870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qNr9KSzgnELykt88dPBpEyZ6wsbID+Fk75Z7xVFv0NI=;
  b=GiSqzthqW2ZRwbgm0rqK1TNl9aGSMCUyp+bAcz64F9IRDl2O+bmq1D4C
   zaSmVPfwOUGreT7FsDj04QTg7+qy+fsKb6uQMBSl/sThbqPiADFu4QyNl
   7MvldZgq9geH+0hYMz75UhGXsR+2OkEeXgINWnOUDa99NQ3TpNPXbQenA
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TEp3lFiQCKdFcOnbcMELEiY57LjMHq9nWflMVXnA4QGUeCG7MaikXmLDWaPjXq2buvsKTXYVer
 aTROEza9lzQXnohAeQlKtiLW4qaVa5YFycHGuyLG0hN6rQVJhx5a91c/q/hjEA3sWNlIcW45HU
 FBb5/D0Lm53u1QtiT6x+NShp/0hXY2IHtSy96aeQ9Hlus/a9Y87qTBQ9tLV8afymE71uouGrSk
 NgvsXUdS+FTqlspecNKSweRyiTWAa+linCCxiUx+2pn+e6WXX/NCo10gl88TcO8Iaov3sl30yg
 qRRcOUicFyIvj89y2jp73PpM
X-SBRS: 5.1
X-MesageID: 53993479
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DyHrDaywYbFr/qAmlg9xKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.85,277,1624334400"; 
   d="scan'208";a="53993479"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>, "Daniel De
 Graaf" <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/2] build: add --full to version.sh to guess $(XEN_FULLVERSION)
Date: Wed, 8 Sep 2021 10:54:22 +0100
Message-ID: <20210908095422.438324-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210908095422.438324-1-anthony.perard@citrix.com>
References: <20210908095422.438324-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Running $(MAKE) like that in a $(shell ) while parsing the Makefile
doesn't work reliably. In some case, make will complain with
"jobserver unavailable: using -j1.  Add '+' to parent make rule.",
which will be part of "$(make xenversion)" output.

It isn't possible to distinguish between the output produced by
the target "xenversion" and `make`'s own output.

Instead of running make, this patch "improve" `version.sh` to try to
guess the output of `make xenversion`. This only works as long as
$(XEN_VENDORVERSION) isn't set, or $(XEN_EXTRAVERSION) isn't
overridden.

This fix GitLab CI's build job "debian-unstable-gcc-arm64" on which
$(shell $(MAKE) xenversion) in "flask/policy/Makefile.common" reliably
produce more output than just the xenversion.

This patch also allows to run for example `make --debug=a` without
breaking the build when flask policy is enabled.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/flask/policy/Makefile.common |  2 +-
 version.sh                         | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/flask/policy/Makefile.common b/tools/flask/policy/Makefile.common
index bea5ba4b6a40..7f470cd02861 100644
--- a/tools/flask/policy/Makefile.common
+++ b/tools/flask/policy/Makefile.common
@@ -35,7 +35,7 @@ OUTPUT_POLICY ?= $(BEST_POLICY_VER)
 #
 ########################################
 
-POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory)
+POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(XEN_ROOT)/version.sh --full $(XEN_ROOT)/xen/Makefile)
 POLICY_LOADPATH = /boot
 
 # List of policy versions supported by the hypervisor
diff --git a/version.sh b/version.sh
index e894ee7e0469..abd19ce79ac8 100755
--- a/version.sh
+++ b/version.sh
@@ -1,5 +1,18 @@
 #!/bin/sh
 
+opt_full=false
+while [ $# -gt 1 ]; do
+    case "$1" in
+        --full) opt_full=true ;;
+        *) break ;;
+    esac
+    shift
+done
+
 MAJOR=`grep "export XEN_VERSION" $1 | sed 's/.*=//g' | tr -s " "`
 MINOR=`grep "export XEN_SUBVERSION" $1 | sed 's/.*=//g' | tr -s " "`
-printf "%d.%d" $MAJOR $MINOR
+
+if $opt_full; then
+    EXTRAVERSION=$(grep "export XEN_EXTRAVERSION" $1 | sed 's/^.* ?=\s\+//; s/\$([^)]*)//g; s/ //g')
+fi
+printf "%d.%d%s" $MAJOR $MINOR $EXTRAVERSION
-- 
Anthony PERARD


