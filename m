Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075123B0CC6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 20:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146024.268618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl1m-0003I0-UM; Tue, 22 Jun 2021 18:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146024.268618; Tue, 22 Jun 2021 18:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl1m-0003G5-QZ; Tue, 22 Jun 2021 18:21:38 +0000
Received: by outflank-mailman (input) for mailman id 146024;
 Tue, 22 Jun 2021 18:21:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvl1l-0002zr-9j
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 18:21:37 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb49b165-8fa2-4f2b-908d-da54465b2493;
 Tue, 22 Jun 2021 18:21:35 +0000 (UTC)
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
X-Inumbo-ID: eb49b165-8fa2-4f2b-908d-da54465b2493
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624386095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yumBJZ7SzzoE1gqVWcuD4EWuJPstmL3Sq9uYgjD4ZW0=;
  b=PrdsVIs0Pqz13jLI7x/bs8wFneDxqGsZdqOZAquBOqc8uWt23wropwnw
   9QaIu0JlnU/y7MKBkglzCw8tDWO5LEe0FI42C8Kw6V97xeGtzVyjEslfb
   NbKqWTgSeXz93rgmjaqNkiGSsBzZ1OxiuWw958AB9QeHa8TpPgKLLPAjs
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: A5DyEGfyng1UQ//+6ENZ34sgDjCcEJOcZXPBddorI+5N56alJNch/vW0wXM6fxFNEtV+gwXqzY
 Yvm1cKuzk3V3xiWE4b9ImcZaKLw4SMY/A75jI0hN3jcRrKoj/kJd703huUnqOP33Uv8OSZHfNo
 twBuLCOpZNe2Vz9ptccNJMnioHVMdhBKrnqw3sXzleEHg+zCVPhrcZqhmuWBvw7Vv3kgyMVMSQ
 CXJiMvyMepZwdFXmJCxkeC8kr2T45dE/zYCWoDP3Zexo9AFHpOJWTL9zwypoW3If/RpwccYEuq
 33E=
X-SBRS: 5.1
X-MesageID: 46716668
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ZA9SuKGJqbvbHc2NpLqE0seALOsnbusQ8zAXP0AYc31om6uj5r
 iTdZUgpGbJYVkqKRIdcLy7V5VoBEmskaKdgrNhW4tKPjOW2ldARbsKheCJrlHd8m/Fh4lgPM
 9bAtND4bbLbWSS4/yV3ODBKadE/OW6
X-IronPort-AV: E=Sophos;i="5.83,292,1616472000"; 
   d="scan'208";a="46716668"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH 1/4] tools/tests: Drop obsolete mce-test infrastructure
Date: Tue, 22 Jun 2021 19:21:21 +0100
Message-ID: <20210622182124.11571-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210622182124.11571-1-andrew.cooper3@citrix.com>
References: <20210622182124.11571-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

mce-test has a test suite, but it depends on xend, needs to run in-tree, and
requires manual setup of at least one guest, and manual parameters to pass
into cases.  Drop the test infrasturcture.

Move the one useful remaining item, xen-mceinj, into misc/, fixing some minor
style issues as it goes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 .gitignore                                         |   1 -
 tools/misc/.gitignore                              |   1 +
 tools/misc/Makefile                                |   4 +
 tools/{tests/mce-test/tools => misc}/xen-mceinj.c  |  32 +--
 tools/tests/Makefile                               |   1 -
 tools/tests/mce-test/Makefile                      |  12 -
 tools/tests/mce-test/README                        |  75 ------
 tools/tests/mce-test/cases/srao_llc/dom0/cases.sh  |  73 ------
 tools/tests/mce-test/cases/srao_llc/guest/cases.sh |  94 --------
 tools/tests/mce-test/cases/srao_llc/xen/cases.sh   |  69 ------
 tools/tests/mce-test/cases/srao_mem/dom0/cases.sh  |  73 ------
 tools/tests/mce-test/cases/srao_mem/guest/cases.sh |  94 --------
 tools/tests/mce-test/cases/srao_mem/xen/cases.sh   |  69 ------
 tools/tests/mce-test/cases/ucna_llc/dom0/cases.sh  |  72 ------
 tools/tests/mce-test/cases/ucna_llc/guest/cases.sh |  92 --------
 tools/tests/mce-test/cases/ucna_llc/xen/cases.sh   |  68 ------
 tools/tests/mce-test/config/setup.conf             |  24 --
 tools/tests/mce-test/lib/xen-mceinj-tool.sh        | 260 ---------------------
 tools/tests/mce-test/tools/Makefile                |  24 --
 tools/tests/mce-test/tools/README                  |  24 --
 20 files changed, 24 insertions(+), 1138 deletions(-)
 rename tools/{tests/mce-test/tools => misc}/xen-mceinj.c (97%)
 delete mode 100644 tools/tests/mce-test/Makefile
 delete mode 100644 tools/tests/mce-test/README
 delete mode 100644 tools/tests/mce-test/cases/srao_llc/dom0/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_llc/guest/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_llc/xen/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_mem/dom0/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_mem/guest/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_mem/xen/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/ucna_llc/dom0/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/ucna_llc/guest/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/ucna_llc/xen/cases.sh
 delete mode 100644 tools/tests/mce-test/config/setup.conf
 delete mode 100644 tools/tests/mce-test/lib/xen-mceinj-tool.sh
 delete mode 100644 tools/tests/mce-test/tools/Makefile
 delete mode 100644 tools/tests/mce-test/tools/README

diff --git a/.gitignore b/.gitignore
index 38a085e398..d4b90303b2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -276,7 +276,6 @@ tools/tests/x86_emulator/test_x86_emulator
 tools/tests/x86_emulator/x86_emulate
 tools/tests/x86_emulator/xop*.[ch]
 tools/tests/xenstore/xs-test
-tools/tests/mce-test/tools/xen-mceinj
 tools/tests/vpci/list.h
 tools/tests/vpci/vpci.[hc]
 tools/tests/vpci/test_vpci
diff --git a/tools/misc/.gitignore b/tools/misc/.gitignore
index ce6f937d0c..73ce95e6d7 100644
--- a/tools/misc/.gitignore
+++ b/tools/misc/.gitignore
@@ -1,4 +1,5 @@
 xen-access
+xen-mceinj
 xen-memshare
 xen-ucode
 xen-vmtrace
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 2b683819d4..1a07191d83 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -22,6 +22,7 @@ INSTALL_SBIN-$(CONFIG_MIGRATE) += xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     += xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     += xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
+INSTALL_SBIN-$(CONFIG_X86)     += xen-mceinj
 INSTALL_SBIN-$(CONFIG_X86)     += xen-memshare
 INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
 INSTALL_SBIN-$(CONFIG_X86)     += xen-ucode
@@ -97,6 +98,9 @@ xen-memshare: xen-memshare.o
 xen-vmtrace: xen-vmtrace.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
 
+xen-mceinj: xen-mceinj.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
+
 xenperf: xenperf.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
diff --git a/tools/tests/mce-test/tools/xen-mceinj.c b/tools/misc/xen-mceinj.c
similarity index 97%
rename from tools/tests/mce-test/tools/xen-mceinj.c
rename to tools/misc/xen-mceinj.c
index 1187d01e5f..df55eefbac 100644
--- a/tools/tests/mce-test/tools/xen-mceinj.c
+++ b/tools/misc/xen-mceinj.c
@@ -137,7 +137,7 @@ static void err(xc_interface *xc_handle, const char *fmt, ...)
     va_list args;
 
     va_start(args, fmt);
-    if (vasprintf(&buf, fmt, args) < 0)
+    if ( vasprintf(&buf, fmt, args) < 0 )
         abort();
     perror(buf);
     va_end(args);
@@ -173,7 +173,7 @@ static unsigned int mca_cpuinfo(xc_interface *xc_handle)
     mc.cmd = XEN_MC_physcpuinfo;
     mc.interface_version = XEN_MCA_INTERFACE_VERSION;
 
-    if (!xc_mca_op(xc_handle, &mc))
+    if ( !xc_mca_op(xc_handle, &mc) )
         return mc.u.mc_physcpuinfo.ncpus;
     else
         return 0;
@@ -187,9 +187,9 @@ static int inject_cmci(xc_interface *xc_handle, unsigned int cpu_nr)
     memset(&mc, 0, sizeof(struct xen_mc));
 
     nr_cpus = mca_cpuinfo(xc_handle);
-    if (!nr_cpus)
+    if ( !nr_cpus )
         err(xc_handle, "Failed to get mca_cpuinfo");
-    if (cpu_nr >= nr_cpus)
+    if ( cpu_nr >= nr_cpus )
         err(xc_handle, "-c %u is larger than %u", cpu_nr, nr_cpus - 1);
 
     mc.cmd = XEN_MC_inject_v2;
@@ -284,7 +284,7 @@ static int add_msr_intpose(xc_interface *xc_handle,
         flush_msr_inj(xc_handle);
         init_msr_inj();
     }
-    count= msr_inj.mcinj_count;
+    count = msr_inj.mcinj_count;
 
     if ( !count )
     {
@@ -422,7 +422,7 @@ static long xs_get_dom_mem(int domid)
     if (!memstr || !plen)
         return -1;
 
-    mem = atoll(memstr)*1024;
+    mem = atoll(memstr) * 1024;
     free(memstr);
 
     return mem;
@@ -474,17 +474,20 @@ int main(int argc, char *argv[])
     cpu_nr = 0;
 
     init_msr_inj();
-    xc_handle = xc_interface_open(0, 0, 0);
-    if ( !xc_handle ) {
+    xc_handle = xc_interface_open(NULL, NULL, 0);
+    if ( !xc_handle )
+    {
         Lprintf("Failed to get xc interface");
         exit(EXIT_FAILURE);
     }
 
-    while ( 1 ) {
+    while ( 1 )
+    {
         c = getopt_long(argc, argv, "c:Dd:t:hp:l", opts, &opt_index);
         if ( c == -1 )
             break;
-        switch ( c ) {
+        switch ( c )
+        {
         case 'D':
             dump=1;
             break;
@@ -516,7 +519,8 @@ int main(int argc, char *argv[])
         }
     }
 
-    if ( domid != DOMID_XEN ) {
+    if ( domid != DOMID_XEN )
+    {
         max_gpa = xs_get_dom_mem(domid);
         Lprintf("get domain %d max gpa is: 0x%lx", domid, max_gpa);
         if ( gaddr >= max_gpa )
@@ -524,7 +528,8 @@ int main(int argc, char *argv[])
     }
     Lprintf("get gaddr of error inject is: 0x%lx", gaddr);
 
-    if ( dump ) {
+    if ( dump )
+    {
         if ( domid == DOMID_XEN )
             Lprintf("Xen: gaddr=0x%lx", gaddr);
         else
@@ -532,7 +537,8 @@ int main(int argc, char *argv[])
         goto out;
     }
 
-    if ( type < 0 || type >= MCE_TABLE_SIZE ) {
+    if ( type < 0 || type >= MCE_TABLE_SIZE )
+    {
         err(xc_handle, "Unsupported error type");
         goto out;
     }
diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 25531a984a..33e32730c4 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 SUBDIRS-y :=
 SUBDIRS-y += resource
 SUBDIRS-$(CONFIG_X86) += cpu-policy
-SUBDIRS-$(CONFIG_X86) += mce-test
 SUBDIRS-$(CONFIG_X86) += tsx
 ifneq ($(clang),y)
 SUBDIRS-$(CONFIG_X86) += x86_emulator
diff --git a/tools/tests/mce-test/Makefile b/tools/tests/mce-test/Makefile
deleted file mode 100644
index 1395df38ac..0000000000
--- a/tools/tests/mce-test/Makefile
+++ /dev/null
@@ -1,12 +0,0 @@
-.PHONY: all clean distclean
-
-all: 
-	$(MAKE) -C tools
-
-clean:
-	$(MAKE) -C tools clean
-
-distclean:
-	$(MAKE) -C tools distclean
-
-install uninstall:
diff --git a/tools/tests/mce-test/README b/tools/tests/mce-test/README
deleted file mode 100644
index 65e6d1b045..0000000000
--- a/tools/tests/mce-test/README
+++ /dev/null
@@ -1,75 +0,0 @@
-Xen MCE test suite
----------------
-
-The Xen MCE test suite is a collection of tools and test scripts for
-testing the Xen MCE processing features. The goal is to cover
-most Xen MCE processing code paths and features with automation tests.
-
-
-In the Package
---------------
-
-Here is a short description of what is included in the package
-
-README
-	This is document
-
-Makefile
-	For compile
-
-cases/*
-	Contains all test cases, which may be organized in sub-directories, 
-	the interface of test case is a shell script under cases/, such as:
-	   -- cases/srao_mem/dom0/cases.sh
-
-config/*
-	Contains test configuration files, which specifies the parameters 
-	for test cases, etc.
-
-lib/*
-	Contains some shell scripts, in which some common shell
-	functions and variable definitions are defined to be used by
-	test cases.
-
-tools/*
-	Tools used by MCE test suites, now only xen-mceinj tool.
-
-results/
-	When test is done, the test result will be placed in this
-	directory, test results	of various cases may be in corresponding 
-	directory. 
-	For example, files in
-	    results/srao_mem_dom0/result
-	is the result for test case cases/srao_mem/dom0/cases.sh, there will
-	be 3 result conditions: PASSED/FAILED/NORESULT.
-		results/<test_case>/testlog   #the test log during testing
-		results/<test_case>/mcelog    #mcelog output during testing
-		results/<test_case>/xenlog    #Xen log during testing
-		results/<test_case>/gklog     #VM guest kernel log during testing
-		results/<test_case>/guest_config   #config file used to create guest
-
-
-Test Instruction
-----------------
-
-1.	make sure you have a dom0 with mce support
-	CONFIG_X86_MCE=y
-	CONFIG_X86_MCE_INTEL=y
-	CONFIG_X86_MCE_AMD=y
-	CONFIG_X86_MCE_THRESHOLD=y
-	CONFIG_X86_MCE_INJECT=y
-
-2.	run system at xen and start xend. A installed guest image is
-	necessary when do guest MCE error injection.
-3.	compile tools that used to test. in mce-test, $make.
-	Note: make sure compile xen/tools before do this step
-4.	run test cases that you want.
-	e.g. $sh cases/srao_mem/dom0/cases.sh -d 0 -p 0x0200 -c 2 -t 1
-5.	get test result in results directory
-
-
-Notes
-----------------
-All test cases fake a error and inject this error in 0x180020, For Xen
-test cases(e.g. cases/srao_mem/xen/cases.sh), error happen on every page 
-may cause a Xen panic. 
diff --git a/tools/tests/mce-test/cases/srao_llc/dom0/cases.sh b/tools/tests/mce-test/cases/srao_llc/dom0/cases.sh
deleted file mode 100644
index c540f64998..0000000000
--- a/tools/tests/mce-test/cases/srao_llc/dom0/cases.sh
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/bash
-#
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-sd=$(dirname $0)
-export ROOT=`(cd $sd/../../../; pwd)`
-export this_case=srao_llc_dom0
-
-. $ROOT/lib/xen-mceinj-tool.sh
-
-usage()
-{
-    echo "Usage: ./cases.sh [-options] [arguments]"
-    echo "================Below are the optional options================"
-    echo -e "\t-d domainID\t: 0"
-    echo -e "\t-c injcpu\t: which cpu to inject error"
-    echo -e "\t-p pageaddr\t: Guest Physical Address to inject error"
-    echo -e "\t\t\tBy default, the GPA is 0x180020"
-    echo -e "\t-h help"
-    exit 0
-}
-
-while getopts ":c:d:p:h" option
-do
-    case "$option" in
-    c) injcpu=$OPTARG;;
-    d) domid=$OPTARG;;
-    p) pageaddr=$OPTARG;;
-    h) usage;;
-    *) echo "invalid option!"; usage;;
-    esac
-done
-
-[ -z $domid ] && domid=0
-
-inject()
-{
-    mce_inject_trigger $MCE_SRAO_LLC -d $domid -u $injcpu -p $pageaddr 
-    if [ $? -eq 0 ]; then
-        show "  Passed: Successfully to fake and inject a MCE error"
-    else
-        show "  Failed: Fake error and inject fail !!"
-        return 1
-    fi
-    return 0
-}
-
-do_main()
-{
-    ret_val=0
-    clean_env
-    inject || ret_val=1
-    xen_verify || ret_val=1
-    mcelog_verify $MCE_SRAO_LLC || ret_val=1
-    gen_result $ret_val
-}
-
-do_main "$@"
diff --git a/tools/tests/mce-test/cases/srao_llc/guest/cases.sh b/tools/tests/mce-test/cases/srao_llc/guest/cases.sh
deleted file mode 100644
index 47a7ee4ab9..0000000000
--- a/tools/tests/mce-test/cases/srao_llc/guest/cases.sh
+++ /dev/null
@@ -1,94 +0,0 @@
-#!/bin/bash
-#
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-sd=$(dirname $0)
-export ROOT=`(cd $sd/../../../; pwd)`
-export this_case=srao_llc_guest
-
-. $ROOT/lib/xen-mceinj-tool.sh
-
-usage()
-{
-    echo "Usage: ./cases.sh [-options] [arguments]"
-    echo "================Below are the must have options==============="
-    echo -e "\t-i image\t: guest image"
-    echo -e "\t-m memory\t: set guest virtual memory"
-    echo "========                                              ========"
-    echo "================Below are the optional options================"
-    echo -e "\t-u vcpus\t: set guest virtual cpus number"
-    echo -e "\t-c injcpu\t: which cpu to inject error"
-    echo -e "\t-p pageaddr\t: Guest Physical Address to inject error"
-    echo -e "\t\t\tBy default, the GPA is 0x180020"
-    echo -e "\t-h help"
-    exit 0
-}
-
-[ $# -lt 1 ] && usage
-
-while getopts ":i:u:m:c:p:hl:" option
-do
-    case "$option" in
-    i) image=$OPTARG; offset=`kpartx -l $image | awk '{print $NF*512}'`;;
-    u) vcpus=$OPTARG;;
-    m) memory=$OPTARG;;
-    c) injcpu=$OPTARG;;
-    p) pageaddr=$OPTARG;;
-    l) early_kill="0";;
-    h) usage;;
-    *) echo "invalid option!"; usage;;
-    esac
-done
-
-
-start_guest()
-{
-    create_hvm_guest $image -u $vcpus -m $memory
-    if [ $? -ne 0 ]; then
-        echo "  Create guest fail!"
-        return 1
-    fi
-    return 0
-}
-
-inject()
-{
-    mce_inject_trigger $MCE_SRAO_LLC -u $injcpu -p $pageaddr 
-    if [ $? -eq 0 ]; then
-        show "  Passed: Successfully to fake and inject a MCE error"
-    else
-        show "  Failed: Fake error and inject fail !!"
-        return 1
-    fi
-    return 0
-}
-
-do_main()
-{
-    ret_val=0
-    clean_env
-    start_guest || ret_val=1
-    inject || ret_val=1
-    xen_verify || ret_val=1
-    guest_verify || ret_val=1
-    mcelog_verify $MCE_SRAO_LLC || ret_val=1
-    des_guest
-    gen_result $ret_val
-}
-
-do_main "$@"
diff --git a/tools/tests/mce-test/cases/srao_llc/xen/cases.sh b/tools/tests/mce-test/cases/srao_llc/xen/cases.sh
deleted file mode 100644
index 1d8e02ff65..0000000000
--- a/tools/tests/mce-test/cases/srao_llc/xen/cases.sh
+++ /dev/null
@@ -1,69 +0,0 @@
-#!/bin/bash
-#
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-sd=$(dirname $0)
-export ROOT=`(cd $sd/../../../; pwd)`
-export this_case=srao_llc_xen
-
-. $ROOT/lib/xen-mceinj-tool.sh
-
-usage()
-{
-    echo "Usage: ./cases.sh [-options] [arguments]"
-    echo "================Below are the optional options================"
-    echo -e "\t-c injcpu\t: which cpu to inject error"
-    echo -e "\t-p pageaddr\t: Guest Physical Address to inject error"
-    echo -e "\t\t\tBy default, the GPA is 0x180020"
-    echo -e "\t-h help"
-    exit 0
-}
-
-while getopts ":c:p:h" option
-do
-    case "$option" in
-    c) injcpu=$OPTARG;;
-    p) pageaddr=$OPTARG;;
-    h) usage;;
-    *) echo "invalid option!"; usage;;
-    esac
-done
-
-inject()
-{
-    mce_inject_trigger $MCE_SRAO_LLC -u $injcpu -p $pageaddr 
-    if [ $? -eq 0 ]; then
-        show "  Passed: Successfully to fake and inject a MCE error"
-    else
-        show "  Failed: Fake error and inject fail !!"
-        return 1
-    fi
-    return 0
-}
-
-do_main()
-{
-    ret_val=0
-    clean_env
-    inject || ret_val=1
-    xen_verify || ret_val=1
-    mcelog_verify $MCE_SRAO_LLC || ret_val=1
-    gen_result $ret_val
-}
-
-do_main "$@"
diff --git a/tools/tests/mce-test/cases/srao_mem/dom0/cases.sh b/tools/tests/mce-test/cases/srao_mem/dom0/cases.sh
deleted file mode 100644
index 22d4a00960..0000000000
--- a/tools/tests/mce-test/cases/srao_mem/dom0/cases.sh
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/bash
-#
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-sd=$(dirname $0)
-export ROOT=`(cd $sd/../../../; pwd)`
-export this_case=srao_mem_dom0
-
-. $ROOT/lib/xen-mceinj-tool.sh
-
-usage()
-{
-    echo "Usage: ./cases.sh [-options] [arguments]"
-    echo "================Below are the optional options================"
-    echo -e "\t-d domainID\t: 0"
-    echo -e "\t-c injcpu\t: which cpu to inject error"
-    echo -e "\t-p pageaddr\t: Guest Physical Address to inject error"
-    echo -e "\t\t\tBy default, the GPA is 0x180020"
-    echo -e "\t-h help"
-    exit 0
-}
-
-while getopts ":c:d:p:h" option
-do
-    case "$option" in
-    c) injcpu=$OPTARG;;
-    d) domid=$OPTARG;;
-    p) pageaddr=$OPTARG;;
-    h) usage;;
-    *) echo "invalid option!"; usage;;
-    esac
-done
-
-[ -z $domid ] && domid=0
-
-inject()
-{
-    mce_inject_trigger $MCE_SRAO_MEM -d $domid -u $injcpu -p $pageaddr 
-    if [ $? -eq 0 ]; then
-        show "  Passed: Successfully to fake and inject a MCE error"
-    else
-        show "  Failed: Fake error and inject fail !!"
-        return 1
-    fi
-    return 0
-}
-
-do_main()
-{
-    ret_val=0
-    clean_env
-    inject || ret_val=1
-    xen_verify || ret_val=1
-    mcelog_verify $MCE_SRAO_MEM || ret_val=1
-    gen_result $ret_val
-}
-
-do_main "$@"
diff --git a/tools/tests/mce-test/cases/srao_mem/guest/cases.sh b/tools/tests/mce-test/cases/srao_mem/guest/cases.sh
deleted file mode 100644
index 7ab4523096..0000000000
--- a/tools/tests/mce-test/cases/srao_mem/guest/cases.sh
+++ /dev/null
@@ -1,94 +0,0 @@
-#!/bin/bash
-#
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-sd=$(dirname $0)
-export ROOT=`(cd $sd/../../../; pwd)`
-export this_case=srao_mem_guest
-
-. $ROOT/lib/xen-mceinj-tool.sh
-
-usage()
-{
-    echo "Usage: ./cases.sh [-options] [arguments]"
-    echo "================Below are the must have options==============="
-    echo -e "\t-i image\t: guest image"
-    echo -e "\t-m memory\t: set guest virtual memory"
-    echo "========                                              ========"
-    echo "================Below are the optional options================"
-    echo -e "\t-u vcpus\t: set guest virtual cpus number"
-    echo -e "\t-c injcpu\t: which cpu to inject error"
-    echo -e "\t-p pageaddr\t: Guest Physical Address to inject error"
-    echo -e "\t\t\tBy default, the GPA is 0x180020"
-    echo -e "\t-h help"
-    exit 0
-}
-
-[ $# -lt 1 ] && usage
-
-while getopts ":i:u:m:c:p:hl:" option
-do
-    case "$option" in
-    i) image=$OPTARG; offset=`kpartx -l $image | awk '{print $NF*512}'`;;
-    u) vcpus=$OPTARG;;
-    m) memory=$OPTARG;;
-    c) injcpu=$OPTARG;;
-    p) pageaddr=$OPTARG;;
-    l) early_kill="0";;
-    h) usage;;
-    *) echo "invalid option!"; usage;;
-    esac
-done
-
-
-start_guest()
-{
-    create_hvm_guest $image -u $vcpus -m $memory
-    if [ $? -ne 0 ]; then
-        echo "  Create guest fail!"
-        return 1
-    fi
-    return 0
-}
-
-inject()
-{
-    mce_inject_trigger $MCE_SRAO_MEM -u $injcpu -p $pageaddr 
-    if [ $? -eq 0 ]; then
-        show "  Passed: Successfully to fake and inject a MCE error"
-    else
-        show "  Failed: Fake error and inject fail !!"
-        return 1
-    fi
-    return 0
-}
-
-do_main()
-{
-    ret_val=0
-    clean_env
-    start_guest || ret_val=1
-    inject || ret_val=1
-    xen_verify || ret_val=1
-    guest_verify || ret_val=1
-    mcelog_verify $MCE_SRAO_MEM || ret_val=1
-    des_guest
-    gen_result $ret_val
-}
-
-do_main "$@"
diff --git a/tools/tests/mce-test/cases/srao_mem/xen/cases.sh b/tools/tests/mce-test/cases/srao_mem/xen/cases.sh
deleted file mode 100644
index 7ae49a82ac..0000000000
--- a/tools/tests/mce-test/cases/srao_mem/xen/cases.sh
+++ /dev/null
@@ -1,69 +0,0 @@
-#!/bin/bash
-#
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-sd=$(dirname $0)
-export ROOT=`(cd $sd/../../../; pwd)`
-export this_case=srao_mem_xen
-
-. $ROOT/lib/xen-mceinj-tool.sh
-
-usage()
-{
-    echo "Usage: ./cases.sh [-options] [arguments]"
-    echo "================Below are the optional options================"
-    echo -e "\t-c injcpu\t: which cpu to inject error"
-    echo -e "\t-p pageaddr\t: Guest Physical Address to inject error"
-    echo -e "\t\t\tBy default, the GPA is 0x180020"
-    echo -e "\t-h help"
-    exit 0
-}
-
-while getopts ":c:p:h" option
-do
-    case "$option" in
-    c) injcpu=$OPTARG;;
-    p) pageaddr=$OPTARG;;
-    h) usage;;
-    *) echo "invalid option!"; usage;;
-    esac
-done
-
-inject()
-{
-    mce_inject_trigger $MCE_SRAO_MEM -u $injcpu -p $pageaddr 
-    if [ $? -eq 0 ]; then
-        show "  Passed: Successfully to fake and inject a MCE error"
-    else
-        show "  Failed: Fake error and inject fail !!"
-        return 1
-    fi
-    return 0
-}
-
-do_main()
-{
-    ret_val=0
-    clean_env
-    inject || ret_val=1
-    xen_verify || ret_val=1
-    mcelog_verify $MCE_SRAO_MEM || ret_val=1
-    gen_result $ret_val
-}
-
-do_main "$@"
diff --git a/tools/tests/mce-test/cases/ucna_llc/dom0/cases.sh b/tools/tests/mce-test/cases/ucna_llc/dom0/cases.sh
deleted file mode 100644
index 808f007708..0000000000
--- a/tools/tests/mce-test/cases/ucna_llc/dom0/cases.sh
+++ /dev/null
@@ -1,72 +0,0 @@
-#!/bin/bash
-#
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-sd=$(dirname $0)
-export ROOT=`(cd $sd/../../../; pwd)`
-export this_case=ucna_llc_dom0
-
-. $ROOT/lib/xen-mceinj-tool.sh
-
-usage()
-{
-    echo "Usage: ./cases.sh [-options] [arguments]"
-    echo "================Below are the optional options================"
-    echo -e "\t-d domainID\t: 0"
-    echo -e "\t-c injcpu\t: which cpu to inject error"
-    echo -e "\t-p pageaddr\t: Guest Physical Address to inject error"
-    echo -e "\t\t\tBy default, the GPA is 0x180020"
-    echo -e "\t-h help"
-    exit 0
-}
-
-while getopts ":c:d:p:h" option
-do
-    case "$option" in
-    c) injcpu=$OPTARG;;
-    d) domid=$OPTARG;;
-    p) pageaddr=$OPTARG;;
-    h) usage;;
-    *) echo "invalid option!"; usage;;
-    esac
-done
-
-[ -z $domid ] && domid=0
-
-inject()
-{
-    mce_inject_trigger $CMCI_UCNA_LLC -d $domid -u $injcpu -p $pageaddr 
-    if [ $? -eq 0 ]; then
-        show "  Passed: Successfully to fake and inject a MCE error"
-    else
-        show "  Failed: Fake error and inject fail !!"
-        return 1
-    fi
-    return 0
-}
-
-do_main()
-{
-    ret_val=0
-    clean_env
-    inject || ret_val=1
-    mcelog_verify $CMCI_UCNA_LLC || ret_val=1
-    gen_result $ret_val
-}
-
-do_main "$@"
diff --git a/tools/tests/mce-test/cases/ucna_llc/guest/cases.sh b/tools/tests/mce-test/cases/ucna_llc/guest/cases.sh
deleted file mode 100644
index 0ca4e2c961..0000000000
--- a/tools/tests/mce-test/cases/ucna_llc/guest/cases.sh
+++ /dev/null
@@ -1,92 +0,0 @@
-#!/bin/bash
-#
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-sd=$(dirname $0)
-export ROOT=`(cd $sd/../../../; pwd)`
-export this_case=ucna_llc_guest
-
-. $ROOT/lib/xen-mceinj-tool.sh
-
-usage()
-{
-    echo "Usage: ./cases.sh [-options] [arguments]"
-    echo "================Below are the must have options==============="
-    echo -e "\t-i image\t: guest image"
-    echo -e "\t-m memory\t: set guest virtual memory"
-    echo "========                                              ========"
-    echo "================Below are the optional options================"
-    echo -e "\t-u vcpus\t: set guest virtual cpus number"
-    echo -e "\t-c injcpu\t: which cpu to inject error"
-    echo -e "\t-p pageaddr\t: Guest Physical Address to inject error"
-    echo -e "\t\t\tBy default, the GPA is 0x180020"
-    echo -e "\t-h help"
-    exit 0
-}
-
-[ $# -lt 1 ] && usage
-
-while getopts ":i:u:m:c:p:hl:" option
-do
-    case "$option" in
-    i) image=$OPTARG; offset=`kpartx -l $image | awk '{print $NF*512}'`;;
-    u) vcpus=$OPTARG;;
-    m) memory=$OPTARG;;
-    c) injcpu=$OPTARG;;
-    p) pageaddr=$OPTARG;;
-    l) early_kill="0";;
-    h) usage;;
-    *) echo "invalid option!"; usage;;
-    esac
-done
-
-
-start_guest()
-{
-    create_hvm_guest $image -u $vcpus -m $memory
-    if [ $? -ne 0 ]; then
-        echo "  Create guest fail!"
-        return 1
-    fi
-    return 0
-}
-
-inject()
-{
-    mce_inject_trigger $CMCI_UCNA_LLC -u $injcpu -p $pageaddr 
-    if [ $? -eq 0 ]; then
-        show "  Passed: Successfully to fake and inject a MCE error"
-    else
-        show "  Failed: Fake error and inject fail !!"
-        return 1
-    fi
-    return 0
-}
-
-do_main()
-{
-    ret_val=0
-    clean_env
-    start_guest || ret_val=1
-    inject || ret_val=1
-    mcelog_verify $CMCI_UCNA_LLC || ret_val=1
-    des_guest
-    gen_result $ret_val
-}
-
-do_main "$@"
diff --git a/tools/tests/mce-test/cases/ucna_llc/xen/cases.sh b/tools/tests/mce-test/cases/ucna_llc/xen/cases.sh
deleted file mode 100644
index c73a2f6c16..0000000000
--- a/tools/tests/mce-test/cases/ucna_llc/xen/cases.sh
+++ /dev/null
@@ -1,68 +0,0 @@
-#!/bin/bash
-#
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-sd=$(dirname $0)
-export ROOT=`(cd $sd/../../../; pwd)`
-export this_case=ucna_llc_xen
-
-. $ROOT/lib/xen-mceinj-tool.sh
-
-usage()
-{
-    echo "Usage: ./cases.sh [-options] [arguments]"
-    echo "================Below are the optional options================"
-    echo -e "\t-c injcpu\t: which cpu to inject error"
-    echo -e "\t-p pageaddr\t: Guest Physical Address to inject error"
-    echo -e "\t\t\tBy default, the GPA is 0x180020"
-    echo -e "\t-h help"
-    exit 0
-}
-
-while getopts ":c:p:h" option
-do
-    case "$option" in
-    c) injcpu=$OPTARG;;
-    p) pageaddr=$OPTARG;;
-    h) usage;;
-    *) echo "invalid option!"; usage;;
-    esac
-done
-
-inject()
-{
-    mce_inject_trigger $CMCI_UCNA_LLC -u $injcpu -p $pageaddr 
-    if [ $? -eq 0 ]; then
-        show "  Passed: Successfully to fake and inject a MCE error"
-    else
-        show "  Failed: Fake error and inject fail !!"
-        return 1
-    fi
-    return 0
-}
-
-do_main()
-{
-    ret_val=0
-    clean_env
-    inject || ret_val=1
-    mcelog_verify $CMCI_UCNA_LLC || ret_val=1
-    gen_result $ret_val
-}
-
-do_main "$@"
diff --git a/tools/tests/mce-test/config/setup.conf b/tools/tests/mce-test/config/setup.conf
deleted file mode 100644
index 05f754dfd6..0000000000
--- a/tools/tests/mce-test/config/setup.conf
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/bin/bash
-#
-# Software injection based test cases: test cases are triggered via
-# mce-inject tool.
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-export MCE_SRAO_MEM=0
-export MCE_SRAO_LLC=1
-export CMCI_UCNA_LLC=2
diff --git a/tools/tests/mce-test/lib/xen-mceinj-tool.sh b/tools/tests/mce-test/lib/xen-mceinj-tool.sh
deleted file mode 100644
index c0a3b293c5..0000000000
--- a/tools/tests/mce-test/lib/xen-mceinj-tool.sh
+++ /dev/null
@@ -1,260 +0,0 @@
-#!/bin/bash
-#
-# Software injection based test cases: test cases are triggered via
-# mce-inject tool.
-# Copyright (c) 2010, Intel Corporation
-# 
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License version
-# 2 as published by the Free Software Foundation.
-# 
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-# 
-# You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
-#
-# Author: Xudong Hao <xudong.hao@intel.com>
-#
-
-. $ROOT/config/setup.conf
-
-#Guest Image Preparation
-hvm_image_prepare()
-{
-    local image=$1
-    local tmpdir=`mktemp -d`
-    local tmpfile=`mktemp`
-    local offset=`kpartx -l $image | awk '{print $NF*512}'`
-    mount -oloop,offset=$offset $image $tmpdir && echo "mount image to $tmpdir"
-    local g_grub=$tmpdir/boot/grub/grub.conf
-    if [ $? -ne 0 ]; then
-        show "  Mount image failed!"
-        return 1
-    fi
-
-    if ! grep FLAG_CONSOLE $g_grub; then
-        sed -e '/kernel/s/$/ console=ttyS0,115200,8n1 console=tty0/g' \
-            $g_grub > $tmpfile
-        mv -f $tmpfile $g_grub
-        rm -f $tmpfile
-        echo "
-#### FLAG_CONSOLE #### " >> $g_grub
-    fi
-    umount $tmpdir
-    rm -fr $tmpdir
-
-    return 0
-}
-
-create_hvm_guest()
-{
-    local image=$1
-    local originconfig="/etc/xen/xmexample.hvm"
-    local TF=`mktemp`
-    local case_dir=$ROOT/results/$this_case
-    local config=$case_dir/guest_config
-    [ -d $case_dir ] || mkdir $case_dir
-    [ -f $logfile ] || touch $logfile
-    local File=`echo $image|sed "s/\//\\\\\\\\\\//g"`
-    local g_name="`basename $image`_`date +%H%M%S`"
-
-    hvm_image_prepare $image
-
-    while getopts ":u:m:" Option
-    do
-        case $Option in
-            u ) vcpus=$OPTARG;;
-            m ) memory=$OPTARG;;
-            e ) bridge_name=$OPTARG;;
-            * ) ;;
-        esac
-    done
-
-    cp $originconfig $config -f
-
-    if [ -z $image ]; then
-        show "Image file $image does not exist, Please input one valid file"
-        return 1
-    fi
-
-    sed -e "/^disk/s/file:.*,\(hda\)/file:${File},\1/" $config \
-          | sed -e "/^disk/s/phy:.*,\(hda\)/file:${File},\1/" >$TF
-    mv -f $TF $config
-
-    [ -z $memory ] || sed -i "/^memory/s/^.*$/memory = $memory/" $config
-    [ -z $vcpus ] || sed -i "1,/^#vcpus/s/^#vcpus.*$/vcpus=$vcpus/;1d" $config
-    sed -i "/^vif/s/vif/#vif/" $config
-    sed -i "/^name/s/^.*$/name = \"$g_name\"/" $config
-
-    string1=$(ls /dev/pts | sort)
-    xm cr $config
-    [ $? -eq 0 ] && domid=`xm list $g_name | tail -n1 | awk '{print $2}'`
-    if [ -z $domid ]; then
-        show "  Guest can not boot up"
-        return 1
-    fi
-    
-    sleep 10
-
-    string2=$(ls /dev/pts | sort)
-
-    get_guest_klog
-    sleep 40
-
-    return 0
-}
-
-get_guest_klog()
-{
-    local case_dir=$ROOT/results/$this_case
-    gklog=$case_dir/gklog
-    [ -d $case_dir ] || mkdir $case_dir
-    [ -f $gklog ] || touch $gklog
-    for fo in $string2; do
-        echo $string1 | grep $fo -wq
-        [ $? -eq 1 ] && num=$fo
-    done
-    cat /dev/pts/$num > $gklog &
-}
-
-mce_inject_trigger()
-{
-    local errtype=$1
-    local append=""
-    while getopts ":d:u:p:" Option
-    do
-        case $Option in
-            d ) domid=$OPTARG;;
-            u ) cpu=$OPTARG;;
-            p ) pageaddr=$OPTARG;;
-            * ) ;;
-        esac
-    done
-
-    [ -z $domid ] || append=$append" -d $domid"
-    [ -z $cpu ] || append=$append" -c $cpu"
-    [ -z $pageaddr ] || append=$append" -p $pageaddr"
-
-    [ -f $ROOT/tools/xen-mceinj ]
-    if [ $? -eq 0 ]; then
-        xm dmesg -c
-        $ROOT/tools/xen-mceinj -t $errtype $append
-        if [ $? -ne 0 ]; then
-            show "  Failed: Maybe the memory addr is out of range. \
-                      Please check whether used xen-mceinj tool correctlly"
-            return 1
-        fi
-    else
-        show "  Failed: please compile xen-mce inject tool firstly"
-        return 1
-    fi
-    return 0
-}
-
-xen_verify()
-{
-    local case_dir=$ROOT/results/$this_case
-    local xenlog=$case_dir/xenlog
-    [ -d $case_dir ] || mkdir $case_dir
-    [ -f $xenlog ] || touch $xenlog
-    xm dmesg > $xenlog
-    grep "Error is successfully recovered" $xenlog > /dev/null
-    if [ $? -eq 0 ]; then
-        show "  Passed: Xen handle this MCE error successfully"
-    else
-        show "  Failed: Xen does not handle MCE error correctly !!"
-        return 1
-    fi
-    return 0
-}
-
-guest_verify()
-{
-    grep "kernel page recovery" $gklog > /dev/null
-    if [ $? -eq 0 ]; then
-        show "  Passed: Guest recive MCE error and solved correctly"
-    else
-        show "  Failed: Guest fail to solve MCE error"
-        return 1
-    fi
-    return 0
-}
-
-mcelog_verify()
-{
-    local err_type=$1
-    local ret=0
-    local case_dir=$ROOT/results/$this_case
-    local mcelog=$case_dir/mcelog
-    [ -d $case_dir ] || mkdir $case_dir
-    [ -f $mcelog ] || touch $mcelog
-    mcelog > $mcelog
-    if [ -z $mcelog ]; then
-        show "  Failed: MCELOG does not catch anything"
-        return 1
-    else
-        if [ $err_type -eq 0 ]; then
-            grep "MEMORY CONTROLLER MS_CHANNELunspecified_ERR" $mcelog \
-                > /dev/null
-            ret=$?
-        elif [ $err_type -eq 1 ]; then
-            grep "Generic CACHE Level-2 Eviction Error" $mcelog > /dev/null
-            ret=$?
-        elif [ $err_type -eq 2 ]; then
-            grep "Data CACHE Level-2 Data-Read Error" $mcelog > /dev/null
-            ret=$?
-        fi
-
-        if [ $ret -eq 0 ]; then
-            show "  Passed: MCElog catch a correct error"
-        else 
-            show "  Failed: MCE log catch a incorrect error !!"
-            return 1
-        fi
-    fi
-
-    return 0
-}
-
-function des_guest()
-{
-    xm des $domid    
-}
-
-function clean_env()
-{
-    [ -d $ROOT/results ] || mkdir $ROOT/results
-    # clean logs and results of last test for this case
-    rm -fr $ROOT/results/$this_case/*
-}
-
-function show()
-{
-    local case_dir=$ROOT/results/$this_case
-    local logfile=$case_dir/testlog
-    [ -d $case_dir ] || mkdir $case_dir
-    [ -f $logfile ] || touch $logfile
-    echo -e $* | tee -a $logfile > /dev/null
-}
-
-function gen_result()
-{
-    local ret=$1
-    local case_dir=$ROOT/results/$this_case
-    local result=$case_dir/result
-    [ -d $case_dir ] || mkdir $case_dir
-    [ -f $result ] || touch $result
-    
-    if [ $ret -eq 0 ]; then
-        echo "PASSED" > $result
-    elif [ $ret -eq 1 ]; then
-        echo "FAILED" > $result
-        echo "   Please check testlog for details!!! " >> $result
-    else
-        echo "NORESULT" > $result
-        echo "   Please check testlog for details!!! " >> $result
-    fi
-}
diff --git a/tools/tests/mce-test/tools/Makefile b/tools/tests/mce-test/tools/Makefile
deleted file mode 100644
index 0e92ac2977..0000000000
--- a/tools/tests/mce-test/tools/Makefile
+++ /dev/null
@@ -1,24 +0,0 @@
-XEN_ROOT=$(CURDIR)/../../../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-CFLAGS += -Werror
-CFLAGS += $(CFLAGS_libxenctrl)
-CFLAGS += $(CFLAGS_libxenguest)
-CFLAGS += $(CFLAGS_libxenstore)
-CFLAGS += $(CFLAGS_xeninclude)
-
-.PHONY: all
-all: xen-mceinj
-
-install: xen-mceinj
-	$(INSTALL_PROG) xen-mceinj $(DESTDIR)$(sbindir)
-
-.PHONY: clean
-clean:
-	$(RM) *.o xen-mceinj
-
-.PHONY: distclean
-distclean: clean
-
-xen-mceinj: xen-mceinj.o Makefile
-	$(CC) -o $@ $< $(LDFLAGS) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenstore)
diff --git a/tools/tests/mce-test/tools/README b/tools/tests/mce-test/tools/README
deleted file mode 100644
index bd0d442bae..0000000000
--- a/tools/tests/mce-test/tools/README
+++ /dev/null
@@ -1,24 +0,0 @@
-Xen Machine Check Exception(MCE) error inject tool
-----------------------------------------------
-
-xen-mceinj is a software MCE injection tool, which is based on Xen 
-MCE injection mechanism. It allows to inject machine check errors on the
-software level into a running Xen/dom0/VM. This is intended for
-validation of the Xen machine check handler.
-
-With the help of the Makefile, it is possible to compile a binary file 
-named "xen-mceinj".
-
-Usage
------
-$make (make install) --Note: make sure compile xen/tools before do this step
-$./xen-mceinj [OPTION]...
-
-OPTION arguments can be:
-  -D, --dump           dump addr info without error injection
-  -c, --cpu=CPU_ID     target CPU, the default is CPU0
-  -d, --domain=DomID   target domain, the default is Xen itself
-  -p, --page           physical page address, the default is 0x180020
-  -t, --type=error     error type
-
-For detail help, please refer to "./xen-mceinj -h"
-- 
2.11.0


