Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3DD2F4B55
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 13:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66443.118025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfN8-0004pv-2R; Wed, 13 Jan 2021 12:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66443.118025; Wed, 13 Jan 2021 12:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfN7-0004oh-Rv; Wed, 13 Jan 2021 12:35:33 +0000
Received: by outflank-mailman (input) for mailman id 66443;
 Wed, 13 Jan 2021 12:35:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFkA=GQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzfN6-0004j8-Gb
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 12:35:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11160454-c011-4b72-aa65-cbe71b048d93;
 Wed, 13 Jan 2021 12:35:27 +0000 (UTC)
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
X-Inumbo-ID: 11160454-c011-4b72-aa65-cbe71b048d93
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610541327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=nva4nk9kBg/Te01BeKpla9F+vHSqFTlcGn2XzJgwQKQ=;
  b=BQR5bSTeKMUm8W1Hh9U8m/kwpsbrI1TRByCHLAp5ckR9f03N31sqOOta
   pFkenzKVavb0HaJQlgas36eX+lQOQs91JjM22nRHvihtPb65lYVx/s1WA
   TsaqMO/3QqEZOkTt+KCyUUqYKaAI6auSJPetD1bLOq651j3v2VmxpbJVv
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZjBtJKaavLGcap1UG5OxR0cB40okaqPASOn3elK/DkKd2wI7h500Eq3xo8MJOk9O+F/aZxTLA4
 jlfKSrn+D7W15ILZKO6q65SaL02QMYhVLrLqmteY6/BQx7uQGOk2ssTG05QA7j+rLXMS8VyRhi
 gC9AG62HgMNA+Ttk+tm2qQRZiHF5MXaJnqC3X6oS5E3fA34Lcp49do7aUTbU34ZtiAj+iX/exu
 I9BboDwXwhlFMVRbmaGqsI4mee0CZzETX18R3Ev0hBcWXpuwb8Fe58zUKlqwFH32wajj+7YtdH
 Qag=
X-SBRS: 5.2
X-MesageID: 35041285
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,344,1602561600"; 
   d="scan'208";a="35041285"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <amc96@cam.ac.uk>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH 1/3] tools/tests: Drop obsolete running scripts
Date: Wed, 13 Jan 2021 12:34:53 +0000
Message-ID: <20210113123455.23209-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210113123455.23209-1-andrew.cooper3@citrix.com>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

The python unit tests were dropped in Xen 4.12 due to being obsolete, but the
scripts to run the tests were missed.  Clean up .gitignore as well

Also drop the libxenctrl {C,LD}FLAGS adjustments in the Makefile.  This logic
isn't used, and isn't appropriate even in principle, as there are tests in
here which don't want to use libxenctrl.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
---
 .gitignore                          |  3 --
 tools/tests/Makefile                |  3 --
 tools/tests/run_tests.sh            | 61 -------------------------------------
 tools/tests/utests/run_all_tests.py | 23 --------------
 4 files changed, 90 deletions(-)
 delete mode 100644 tools/tests/run_tests.sh
 delete mode 100644 tools/tests/utests/run_all_tests.py

diff --git a/.gitignore b/.gitignore
index b169d78ed7..1b54ea3111 100644
--- a/.gitignore
+++ b/.gitignore
@@ -274,9 +274,6 @@ tools/tests/x86_emulator/x86_emulate
 tools/tests/x86_emulator/xop*.[ch]
 tools/tests/xen-access/xen-access
 tools/tests/xenstore/xs-test
-tools/tests/regression/installed/*
-tools/tests/regression/build/*
-tools/tests/regression/downloads/*
 tools/tests/mem-sharing/memshrtool
 tools/tests/mce-test/tools/xen-mceinj
 tools/tests/vpci/list.h
diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index ed3bed404b..9077fa14d3 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -1,9 +1,6 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS  += $(CFLAGS_libxenctrl)
-LDLIBS += $(LDLIBS_libxenctrl)
-
 SUBDIRS-y :=
 SUBDIRS-$(CONFIG_X86) += cpu-policy
 SUBDIRS-$(CONFIG_X86) += mce-test
diff --git a/tools/tests/run_tests.sh b/tools/tests/run_tests.sh
deleted file mode 100644
index c492876b4b..0000000000
--- a/tools/tests/run_tests.sh
+++ /dev/null
@@ -1,61 +0,0 @@
-#!/bin/bash
-#
-# This runs the available unit-tests with all different supported
-# python versions.
-# 
-# To run this this must be 'cd'ed to the tests directory.
-#
-
-ENABLE_UNSUPPORTED=0
-
-function usage()
-{
-    printf "Usage: %s: [-u]\n" $0
-    printf "   -u: run test with unsupported python versions also\n"
-}
-
-function run_one_test()
-{
-    PYTHON=$1
-    PYTHON_EXECUTABLE=`echo $PYTHON | tr -d "-"`
-    echo "+++ Running tests with $PYTHON"
-    export LD_LIBRARY_PATH=./regression/installed/$PYTHON/lib
-    ./regression/installed/$PYTHON/bin/$PYTHON_EXECUTABLE \
-	utests/run_all_tests.py
-    echo "--- Finished tests with $PYTHON"
-}
-
-function run_all_tests()
-{
-    for PYTHON in $@;
-    do
-	run_one_test $PYTHON
-    done
-}
-
-while getopts u name
-do
-    case $name in
-	h)  usage; exit 0;;
-	u)  ENABLE_UNSUPPORTED=1;;
-	?)  usage; exit 2;;
-    esac
-done
-
-# Build the different python versions
-(cd regression && make -j4 runtime-environment)
-
-# Supported: when an unit test fails this should be seen as an error
-PYTHON_SUPPORTED="python-2.4 python-2.5 python-2.6"
-# Unsupported: failure should be seen as a hint
-PYTHON_UNSUPPORTED="python-3.1"
-
-export PYTHONPATH=`echo $PWD/../python/build/lib.*`:$PWD
-
-set -e
-run_all_tests $PYTHON_SUPPORTED
-
-if test $ENABLE_UNSUPPORTED -eq 1
-then
-    run_all_tests $PYTHON_UNSUPPORTED
-fi
diff --git a/tools/tests/utests/run_all_tests.py b/tools/tests/utests/run_all_tests.py
deleted file mode 100644
index 7318c81ff2..0000000000
--- a/tools/tests/utests/run_all_tests.py
+++ /dev/null
@@ -1,23 +0,0 @@
-#============================================================================
-# This library is free software; you can redistribute it and/or
-# modify it under the terms of version 2.1 of the GNU Lesser General Public
-# License as published by the Free Software Foundation.
-#
-# This library is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-# Lesser General Public License for more details.
-#
-# You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
-#============================================================================
-# Copyright (C) 2009 flonatel GmbH & Co. KG
-#============================================================================
-
-import unittest
-
-suite = unittest.TestSuite([])
-
-if __name__ == "__main__":
-    testresult = unittest.TextTestRunner(verbosity=3).run(suite)
-
-- 
2.11.0


