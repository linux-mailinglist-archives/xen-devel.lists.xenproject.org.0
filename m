Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A2405918
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 16:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183300.331391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOL73-0007Cr-CL; Thu, 09 Sep 2021 14:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183300.331391; Thu, 09 Sep 2021 14:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOL73-00079z-96; Thu, 09 Sep 2021 14:33:13 +0000
Received: by outflank-mailman (input) for mailman id 183300;
 Thu, 09 Sep 2021 14:33:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o0l/=N7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mOL72-00079t-6n
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 14:33:12 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 322fa9be-74c5-4c54-bbee-62c6766e70ab;
 Thu, 09 Sep 2021 14:33:10 +0000 (UTC)
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
X-Inumbo-ID: 322fa9be-74c5-4c54-bbee-62c6766e70ab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631197990;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lIpqQNuHljxSkJiImjDa5X3NwvmCumV1RL/ABnPfCXI=;
  b=YbRJFIJN4PNDJTbftlEcOy4qXH/RE56C0oGTSBHTQNxhl1O8+R99FFiT
   UNSmxhVBolJ6SMOfxDvwSN4utID9s9XC7mRcO0wMPhBH49T0fXO/yroFO
   rQr9VB2Dy0dzF5hSNbHouPN1oVAqhxeWiHbcCrEU5ZSlkNb2+dWouWeiw
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4kB1AnWwSaEYHskY/fY0NPHswqM0uKetiB0ZbOf360/YTe1Yr7VUUnZ6L7M2wTxDC9uy67kaNg
 ntQtZUTqQC0RTgU3r8ZdHaH1KyIIrwVEsN9PUhDrEn0KLJwgvt4S5nod9bDUMsZ00RFZPndNKv
 tnESlfetfWHYBI4Izcy+XfgqcPP2Z5COE/XweVVqM79pSUvkJMZJ8Ach9JkpPeww0cEUtULxs0
 Lh2bDKodQHMgdJvN1/DAHDXoOctqfvWaiV/TNXBnELOz5Ow4RFcrsxP1gqm+Bup0BsRdaKYbMi
 N0M2swF8eihbF99Ns7tP3gzD
X-SBRS: 5.1
X-MesageID: 54127042
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bvBu56hNQcBlz1PJdwDU51WJR3BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.85,280,1624334400"; 
   d="scan'208";a="54127042"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v2] build: add --full to version.sh to guess $(XEN_FULLVERSION)
Date: Thu, 9 Sep 2021 15:33:06 +0100
Message-ID: <20210909143306.466836-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Running $(MAKE) like that in a $(shell ) while parsing the Makefile
doesn't work reliably. In some case, make will complain with
"jobserver unavailable: using -j1.  Add '+' to parent make rule.".
Also, it isn't possible to distinguish between the output produced by
the target "xenversion" and `make`'s own output.

Instead of running make, this patch "improve" `version.sh` to try to
guess the output of `make xenversion`.

In order to have version.sh works in more scenario, it will use
XEN_EXTRAVERSION and XEN_VENDORVERSION from the environment when
present. As for the cases were those two variables are overridden by a
make command line arguments, we export them when invoking version.sh
via a new $(XEN_FULLVERSION) macro.

That should hopefully get us to having ./version.sh returning the same
value that `make xenversion` would.

This fix GitLab CI's build job "debian-unstable-gcc-arm64".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
v2:
- use $(SHELL) to execute ./version.sh
- get XEN_EXTRAVERSION from the environment if exist
- use XEN_VENDORVERSION when exist in the environment
- introduce a new macro $(XEN_FULLVERSION) whose jobs is to export
  $(XEN_EXTRAVERSION) and $(XEN_VENDORVERSION) in cases where those
  are overridden by command line argument of make.
  (we can't just use make's "export" because it doesn't work when
  parsing the makefile which is when $(shell ) get's executed for
  POLICY_FILENAME, so it wouldn't work when running `make -C
  tools/flask/policy XEN_VENDORVERSION=-os`.)
---
 tools/Rules.mk                     |  5 +++++
 tools/flask/policy/Makefile.common |  2 +-
 version.sh                         | 18 +++++++++++++++++-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 2907ed2d3972..b022da3336c4 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -6,6 +6,11 @@ all:
 -include $(XEN_ROOT)/config/Tools.mk
 include $(XEN_ROOT)/Config.mk
 
+XEN_FULLVERSION=$(shell env \
+    XEN_EXTRAVERSION=$(XEN_EXTRAVERSION) \
+    XEN_VENDORVERSION=$(XEN_VENDORVERSION) \
+    $(SHELL) $(XEN_ROOT)/version.sh --full $(XEN_ROOT)/xen/Makefile)
+
 export _INSTALL := $(INSTALL)
 INSTALL = $(XEN_ROOT)/tools/cross-install
 
diff --git a/tools/flask/policy/Makefile.common b/tools/flask/policy/Makefile.common
index bea5ba4b6a40..e5ed58200e75 100644
--- a/tools/flask/policy/Makefile.common
+++ b/tools/flask/policy/Makefile.common
@@ -35,7 +35,7 @@ OUTPUT_POLICY ?= $(BEST_POLICY_VER)
 #
 ########################################
 
-POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory)
+POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
 POLICY_LOADPATH = /boot
 
 # List of policy versions supported by the hypervisor
diff --git a/version.sh b/version.sh
index e894ee7e0469..c6a5692c1982 100755
--- a/version.sh
+++ b/version.sh
@@ -1,5 +1,21 @@
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
+    extraversion=$(grep "export XEN_EXTRAVERSION" $1 | sed 's/^.* ?=\s\+//; s/\$([^)]*)//g; s/ //g')
+    : ${XEN_EXTRAVERSION:=${extraversion}${XEN_VENDORVERSION}}
+else
+    unset XEN_EXTRAVERSION
+fi
+printf "%d.%d%s" $MAJOR $MINOR $XEN_EXTRAVERSION
-- 
Anthony PERARD


