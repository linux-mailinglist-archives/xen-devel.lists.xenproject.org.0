Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EB046A26E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239524.415448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTq-0005c1-CJ; Mon, 06 Dec 2021 17:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239524.415448; Mon, 06 Dec 2021 17:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTq-0005XQ-3j; Mon, 06 Dec 2021 17:08:46 +0000
Received: by outflank-mailman (input) for mailman id 239524;
 Mon, 06 Dec 2021 17:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOn-0005ti-Qt
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 700d862b-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:32 +0100 (CET)
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
X-Inumbo-ID: 700d862b-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RWy6yBKQlpWU/yOobumQhfvikIxayYaBVBCgNTpsaGY=;
  b=Ix2xokHxeNA08wqscMEfNNR4NaOJBxqVXTDHwcwH1Kn+kE5BGOtgfUaU
   BzB8NalIk+peJ2Tq28kZWPye2WYm2HVYfg8Ii1V0KSp2kEjwKoKCtn1u3
   UvIYfFTQYZTPufXSOFWoabirY4VFQH8D28I5f8s4+R7APixf8vQtYo/W2
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: obWCpb7PgP7lGZ/vw06wj6m0gHJBU8RE7gWQvx/pTLNahDBgblg3U6Q5ByCSCSgbzGB1F2w1pI
 SL2+zthHzTPYMe/ysIqhbJzJ8iRLQjLQFn9zlME7hEHLm/ABXeTfl1FntUXy5wCtW+6IVvfY0e
 A99BeNIHArW4xCNfYOXx38dYSD7D49oVwlnT3SdXdmRVxH+OGZQ4peOhu7qT6V6XR4JQ8ICusd
 xG9Xk/5q7zO3oIA2pRZshU/64X64SioAxjtXU79vnLeQIeZ2lLM1j7HTGDCSnprpYF61AWbh0X
 BaOrReTNfUx/zR8hhEH85UBQ
X-SBRS: 5.1
X-MesageID: 61420642
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hqg2YKr+XxWLlLt/GyNHLjxo2YleBmKyYhIvgKrLsJaIsI4StFCzt
 garIBnUM/7bazOgfN8nYNu1pkxXvsSBnIUwQFQ//CBkEyhD9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx24DnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncS+STUCY4fzpLUYakV9CDBgAbFa5IaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZNFM2IxME6ojxtnPQkuBrE6kPmU2nTnaB1BuXHJt6E72j2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfNgCf6VYQ6BLC+sPlwjzW7xGMJDwYNfUCmuvT/gUm7M/pAL
 2QE9yxoqrI9nGSiSMX9WBup5maJpBcGV/JfFuQ77EeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty9j8oqkjgxTXVNFhHaWpyNrvFlnNL
 yui9XZkwe9J1IhSivv9rQuvby+QSobhFgA11C6KdF2ZvwZAOKu+dpKU9UTH1KMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2OF3wM2d3U133H0oiP4I9gMiN1rDB4xap5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2voXgGia24hTmFfK0QfUcXY
 83znSGEVylyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXVPr9jvf7e+luKo
 76z0vdmLT0FCoUShQGNruYuwa0idyBnVfgaVeQJHgJ8HuaWMD54UKKAqV/QU4dkg75Uho/1E
 oKVASdlJK7ErSSfc22iMyk7AJu2BMoXhS9rbEQEYAfzs1B+MNnH0UvqX8ZuFVXR3Lc4lqAco
 jhsU5joP8mjvRyboWlANsek89Q5HPlp7CrXVxeYjPEEV8YIb2T0FhXMJ2MDLQECUXi6s9UQu
 bql2l+JSJYPXV06Xs3XdOiu3xW6un1EwLB+WE7BI99yfkTw8dc1d3yt36Fve8xcew/ewja61
 hqNBUtKr+f6vIJoosLCgrqJrtn1HrImTFZaBWTS8Z2/KTLeoji42YZFXevRJWLdWWr49b+Mf
 +JQy/2gYvQLkEwT69h3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAn+YLtxG3V
 0SD/shhFY+IYM61QkQMIAcFb/iY0a1GkDfl8vlocl7x4zV6/eTbXBwKbQWMkiFUMJB8LJghn
 bU6oMcT5gGy1kgqP9KBgnwG/miANCVdAaAut5VcC473kAs7jFpFZMWEWCPx5ZiObfRKM1Urf
 WDI1PaT2ewEyxqQaWc3GFjMwfFZ1MYHtx19xVMfI0iEx4jejfgt0RwNqTk6Q2y5FPmcPz6f7
 oSzC3BIGA==
IronPort-HdrOrdr: A9a23:Db7ZU6k+b6ypTBP9Y1458iQUkWPpDfIm3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7Qr5OUtQ/uxoV5PgfZqxz/NICOoqTNWftWvd2FdARbsKheCJ/9SJIVybygc378
 ldmsZFZOEYdWIK7vrH3A==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="61420642"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH 18/57] tools: Use config.h from autoconf instead of "buildmakevars2header"
Date: Mon, 6 Dec 2021 17:02:01 +0000
Message-ID: <20211206170241.13165-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This avoid the need to generate the _paths.h header when the
information is from autoconf anyway.

They are no more users of the "buildmakevars2header" macro, so it can
be removed from "Config.mk".

Also removed the extra "-f" flag where "$(RM)" is used (xl/Makefile).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Config.mk                            |  9 ------
 tools/libs/libs.mk                   |  1 -
 .gitignore                           |  6 ----
 configure                            | 45 ++++++++++++++++++++++++++++
 docs/configure                       | 45 ++++++++++++++++++++++++++++
 m4/paths.m4                          |  9 ++++++
 tools/config.h.in                    | 27 +++++++++++++++++
 tools/configure                      | 45 ++++++++++++++++++++++++++++
 tools/console/Makefile               | 12 ++------
 tools/console/client/main.c          |  1 -
 tools/console/daemon/main.c          |  1 -
 tools/helpers/Makefile               |  8 ++---
 tools/helpers/init-xenstore-domain.c |  1 -
 tools/libs/guest/Makefile            |  5 ----
 tools/libs/guest/xg_dom_core.c       |  1 -
 tools/libs/guest/xg_suspend.c        |  1 -
 tools/libs/light/Makefile            |  8 ++---
 tools/libs/light/libxl_dom.c         |  2 --
 tools/libs/light/libxl_internal.h    |  1 -
 tools/libs/light/libxl_utils.c       |  1 -
 tools/libs/stat/Makefile             |  7 +----
 tools/libs/stat/xenstat_qmp.c        |  1 -
 tools/xl/Makefile                    |  7 +----
 tools/xl/xl.h                        |  1 -
 24 files changed, 179 insertions(+), 66 deletions(-)

diff --git a/Config.mk b/Config.mk
index 6587c7d626..1c1998a5a8 100644
--- a/Config.mk
+++ b/Config.mk
@@ -167,15 +167,6 @@ define buildmakevars2file-closure
 	$(call move-if-changed,$(1).tmp,$(1))
 endef
 
-buildmakevars2header = $(eval $(call buildmakevars2header-closure,$(1)))
-define buildmakevars2header-closure
-    $(1): .phony
-	rm -f $(1).tmp; \
-	$(foreach var, $(BUILD_MAKE_VARS), \
-	          echo "#define $(var) \"$($(var))\"" >>$(1).tmp;) \
-	$(call move-if-changed,$(1).tmp,$(1))
-endef
-
 CFLAGS += -fno-strict-aliasing
 
 CFLAGS += -std=gnu99
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index dfbbef4080..5c2f16dda4 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -132,7 +132,6 @@ clean:
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
 	rm -f headers.chk headers.lst
 	rm -f $(PKG_CONFIG)
-	rm -f _paths.h
 
 .PHONY: distclean
 distclean: clean
diff --git a/.gitignore b/.gitignore
index b42264e209..b39b996718 100644
--- a/.gitignore
+++ b/.gitignore
@@ -123,7 +123,6 @@ tools/libs/foreignmemory/headers.chk
 tools/libs/foreignmemory/xenforeignmemory.pc
 tools/libs/devicemodel/headers.chk
 tools/libs/devicemodel/xendevicemodel.pc
-tools/libs/guest/_*.[ch]
 tools/libs/guest/libxenguest.map
 tools/libs/guest/xenguest.pc
 tools/libs/guest/xc_bitops.h
@@ -146,7 +145,6 @@ tools/libs/light/test_timedereg
 tools/libs/light/test_fdderegrace
 tools/libs/light/tmp.*
 tools/libs/light/xenlight.pc
-tools/libs/stat/_paths.h
 tools/libs/stat/headers.chk
 tools/libs/stat/libxenstat.map
 tools/libs/stat/xenstat.pc
@@ -163,8 +161,6 @@ tools/libs/vchan/libxenvchan.map
 tools/libs/vchan/xenvchan.pc
 tools/console/xenconsole
 tools/console/xenconsoled
-tools/console/client/_paths.h
-tools/console/daemon/_paths.h
 tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
 tools/debugger/gdb/gdb-6.2.1/*
 tools/debugger/gdb/gdb-6.2.1.tar.bz2
@@ -207,7 +203,6 @@ tools/fuzz/x86_instruction_emulator/afl-harness-cov
 tools/fuzz/x86_instruction_emulator/wrappers.c
 tools/fuzz/x86_instruction_emulator/x86_emulate
 tools/fuzz/x86_instruction_emulator/x86-emulate.[ch]
-tools/helpers/_paths.h
 tools/helpers/init-xenstore-domain
 tools/helpers/xen-init-dom0
 tools/hotplug/common/hotplugpath.sh
@@ -422,7 +417,6 @@ tools/firmware/etherboot/ipxe.tar.gz
 tools/firmware/etherboot/ipxe/
 tools/python/xen/lowlevel/xl/_pyxl_types.c
 tools/python/xen/lowlevel/xl/_pyxl_types.h
-tools/xl/_paths.h
 tools/xl/xl
 
 docs/txt/misc/*.txt
diff --git a/configure b/configure
index 502273b263..bb7f27ddad 100755
--- a/configure
+++ b/configure
@@ -1946,6 +1946,11 @@ CONFIG_DIR=$sysconfdir
 XEN_CONFIG_DIR=$CONFIG_DIR/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_CONFIG_DIR "$XEN_CONFIG_DIR"
+_ACEOF
+
+
 
 # Check whether --with-initddir was given.
 if test "${with_initddir+set}" = set; then :
@@ -1998,6 +2003,11 @@ fi
 XEN_SCRIPT_DIR=$xen_scriptdir_path
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_SCRIPT_DIR "$XEN_SCRIPT_DIR"
+_ACEOF
+
+
 
 # Check whether --with-xen-dumpdir was given.
 if test "${with_xen_dumpdir+set}" = set; then :
@@ -2038,6 +2048,11 @@ LIBEXEC=`eval echo $libexecdir/$libexec_subdir`
 
 LIBEXEC_BIN=${LIBEXEC}/bin
 
+
+cat >>confdefs.h <<_ACEOF
+#define LIBEXEC_BIN "$LIBEXEC_BIN"
+_ACEOF
+
 LIBEXEC_LIB=${LIBEXEC}/lib
 
 LIBEXEC_INC=${LIBEXEC}/include
@@ -2045,12 +2060,27 @@ LIBEXEC_INC=${LIBEXEC}/include
 XENFIRMWAREDIR=${LIBEXEC}/boot
 
 
+cat >>confdefs.h <<_ACEOF
+#define XENFIRMWAREDIR "$XENFIRMWAREDIR"
+_ACEOF
+
+
 XEN_RUN_DIR=$rundir_path/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_RUN_DIR "$XEN_RUN_DIR"
+_ACEOF
+
+
 XEN_LOG_DIR=$localstatedir/log/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_LOG_DIR "$XEN_LOG_DIR"
+_ACEOF
+
+
 XEN_LIB_STORED=$localstatedir/lib/xenstored
 
 
@@ -2060,6 +2090,11 @@ XEN_RUN_STORED=$rundir_path/xenstored
 XEN_LIB_DIR=$localstatedir/lib/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_LIB_DIR "$XEN_LIB_DIR"
+_ACEOF
+
+
 SHAREDIR=$prefix/share
 
 
@@ -2073,12 +2108,22 @@ case "$host_os" in
 esac
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_LOCK_DIR "$XEN_LOCK_DIR"
+_ACEOF
+
+
 XEN_PAGING_DIR=$localstatedir/lib/xen/xenpaging
 
 
 XEN_DUMP_DIR=$xen_dumpdir_path
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_DUMP_DIR "$XEN_DUMP_DIR"
+_ACEOF
+
+
 DEBUG_DIR=$debugdir_path
 
 
diff --git a/docs/configure b/docs/configure
index f93d086e9a..d4fced9858 100755
--- a/docs/configure
+++ b/docs/configure
@@ -1849,6 +1849,11 @@ CONFIG_DIR=$sysconfdir
 XEN_CONFIG_DIR=$CONFIG_DIR/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_CONFIG_DIR "$XEN_CONFIG_DIR"
+_ACEOF
+
+
 
 # Check whether --with-initddir was given.
 if test "${with_initddir+set}" = set; then :
@@ -1901,6 +1906,11 @@ fi
 XEN_SCRIPT_DIR=$xen_scriptdir_path
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_SCRIPT_DIR "$XEN_SCRIPT_DIR"
+_ACEOF
+
+
 
 # Check whether --with-xen-dumpdir was given.
 if test "${with_xen_dumpdir+set}" = set; then :
@@ -1941,6 +1951,11 @@ LIBEXEC=`eval echo $libexecdir/$libexec_subdir`
 
 LIBEXEC_BIN=${LIBEXEC}/bin
 
+
+cat >>confdefs.h <<_ACEOF
+#define LIBEXEC_BIN "$LIBEXEC_BIN"
+_ACEOF
+
 LIBEXEC_LIB=${LIBEXEC}/lib
 
 LIBEXEC_INC=${LIBEXEC}/include
@@ -1948,12 +1963,27 @@ LIBEXEC_INC=${LIBEXEC}/include
 XENFIRMWAREDIR=${LIBEXEC}/boot
 
 
+cat >>confdefs.h <<_ACEOF
+#define XENFIRMWAREDIR "$XENFIRMWAREDIR"
+_ACEOF
+
+
 XEN_RUN_DIR=$rundir_path/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_RUN_DIR "$XEN_RUN_DIR"
+_ACEOF
+
+
 XEN_LOG_DIR=$localstatedir/log/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_LOG_DIR "$XEN_LOG_DIR"
+_ACEOF
+
+
 XEN_LIB_STORED=$localstatedir/lib/xenstored
 
 
@@ -1963,6 +1993,11 @@ XEN_RUN_STORED=$rundir_path/xenstored
 XEN_LIB_DIR=$localstatedir/lib/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_LIB_DIR "$XEN_LIB_DIR"
+_ACEOF
+
+
 SHAREDIR=$prefix/share
 
 
@@ -1976,12 +2011,22 @@ case "$host_os" in
 esac
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_LOCK_DIR "$XEN_LOCK_DIR"
+_ACEOF
+
+
 XEN_PAGING_DIR=$localstatedir/lib/xen/xenpaging
 
 
 XEN_DUMP_DIR=$xen_dumpdir_path
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_DUMP_DIR "$XEN_DUMP_DIR"
+_ACEOF
+
+
 DEBUG_DIR=$debugdir_path
 
 
diff --git a/m4/paths.m4 b/m4/paths.m4
index 7be314a3e2..826faada45 100644
--- a/m4/paths.m4
+++ b/m4/paths.m4
@@ -39,6 +39,7 @@ AC_SUBST(CONFIG_DIR)
 
 XEN_CONFIG_DIR=$CONFIG_DIR/xen
 AC_SUBST(XEN_CONFIG_DIR)
+AC_DEFINE_UNQUOTED([XEN_CONFIG_DIR], ["$XEN_CONFIG_DIR"], [Xen's config dir])
 
 AC_ARG_WITH([initddir],
     AS_HELP_STRING([--with-initddir=DIR],
@@ -83,6 +84,7 @@ AC_ARG_WITH([xen-scriptdir],
     [xen_scriptdir_path=$XEN_CONFIG_DIR/scripts])
 XEN_SCRIPT_DIR=$xen_scriptdir_path
 AC_SUBST(XEN_SCRIPT_DIR)
+AC_DEFINE_UNQUOTED([XEN_SCRIPT_DIR], ["$XEN_SCRIPT_DIR"], [Xen's script dir])
 
 AC_ARG_WITH([xen-dumpdir],
     AS_HELP_STRING([--with-xen-dumpdir=DIR],
@@ -117,18 +119,22 @@ AC_SUBST(LIBEXEC)
 dnl These variables will be substituted in various .in files
 LIBEXEC_BIN=${LIBEXEC}/bin
 AC_SUBST(LIBEXEC_BIN)
+AC_DEFINE_UNQUOTED([LIBEXEC_BIN], ["$LIBEXEC_BIN"], [Xen's libexec path])
 LIBEXEC_LIB=${LIBEXEC}/lib
 AC_SUBST(LIBEXEC_LIB)
 LIBEXEC_INC=${LIBEXEC}/include
 AC_SUBST(LIBEXEC_INC)
 XENFIRMWAREDIR=${LIBEXEC}/boot
 AC_SUBST(XENFIRMWAREDIR)
+AC_DEFINE_UNQUOTED([XENFIRMWAREDIR], ["$XENFIRMWAREDIR"], [Xen's firmware dir])
 
 XEN_RUN_DIR=$rundir_path/xen
 AC_SUBST(XEN_RUN_DIR)
+AC_DEFINE_UNQUOTED([XEN_RUN_DIR], ["$XEN_RUN_DIR"], [Xen's runstate path])
 
 XEN_LOG_DIR=$localstatedir/log/xen
 AC_SUBST(XEN_LOG_DIR)
+AC_DEFINE_UNQUOTED([XEN_LOG_DIR], ["$XEN_LOG_DIR"], [Xen's log dir])
 
 XEN_LIB_STORED=$localstatedir/lib/xenstored
 AC_SUBST(XEN_LIB_STORED)
@@ -138,6 +144,7 @@ AC_SUBST(XEN_RUN_STORED)
 
 XEN_LIB_DIR=$localstatedir/lib/xen
 AC_SUBST(XEN_LIB_DIR)
+AC_DEFINE_UNQUOTED([XEN_LIB_DIR], ["$XEN_LIB_DIR"], [Xen's lib dir])
 
 SHAREDIR=$prefix/share
 AC_SUBST(SHAREDIR)
@@ -151,12 +158,14 @@ case "$host_os" in
 *) XEN_LOCK_DIR=$localstatedir/lock ;;
 esac
 AC_SUBST(XEN_LOCK_DIR)
+AC_DEFINE_UNQUOTED([XEN_LOCK_DIR], ["$XEN_LOCK_DIR"], [Xen's lock dir])
 
 XEN_PAGING_DIR=$localstatedir/lib/xen/xenpaging
 AC_SUBST(XEN_PAGING_DIR)
 
 XEN_DUMP_DIR=$xen_dumpdir_path
 AC_SUBST(XEN_DUMP_DIR)
+AC_DEFINE_UNQUOTED([XEN_DUMP_DIR], ["$XEN_DUMP_DIR"], [Xen's dump directory])
 
 DEBUG_DIR=$debugdir_path
 AC_SUBST(DEBUG_DIR)
diff --git a/tools/config.h.in b/tools/config.h.in
index 52e01b2c84..9563d3acb6 100644
--- a/tools/config.h.in
+++ b/tools/config.h.in
@@ -96,6 +96,9 @@
 /* IPXE path */
 #undef IPXE_PATH
 
+/* Xen's libexec path */
+#undef LIBEXEC_BIN
+
 /* OVMF path */
 #undef OVMF_PATH
 
@@ -129,6 +132,30 @@
 /* QMP proxy path */
 #undef STUBDOM_QMP_PROXY_PATH
 
+/* Xen's firmware dir */
+#undef XENFIRMWAREDIR
+
+/* Xen's config dir */
+#undef XEN_CONFIG_DIR
+
+/* Xen's dump directory */
+#undef XEN_DUMP_DIR
+
+/* Xen's lib dir */
+#undef XEN_LIB_DIR
+
+/* Xen's lock dir */
+#undef XEN_LOCK_DIR
+
+/* Xen's log dir */
+#undef XEN_LOG_DIR
+
+/* Xen's runstate path */
+#undef XEN_RUN_DIR
+
+/* Xen's script dir */
+#undef XEN_SCRIPT_DIR
+
 /* Enable large inode numbers on Mac OS X 10.5.  */
 #ifndef _DARWIN_USE_64_BIT_INODE
 # define _DARWIN_USE_64_BIT_INODE 1
diff --git a/tools/configure b/tools/configure
index 8e4a59c2cb..829753b5dd 100755
--- a/tools/configure
+++ b/tools/configure
@@ -3926,6 +3926,11 @@ CONFIG_DIR=$sysconfdir
 XEN_CONFIG_DIR=$CONFIG_DIR/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_CONFIG_DIR "$XEN_CONFIG_DIR"
+_ACEOF
+
+
 
 # Check whether --with-initddir was given.
 if test "${with_initddir+set}" = set; then :
@@ -3978,6 +3983,11 @@ fi
 XEN_SCRIPT_DIR=$xen_scriptdir_path
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_SCRIPT_DIR "$XEN_SCRIPT_DIR"
+_ACEOF
+
+
 
 # Check whether --with-xen-dumpdir was given.
 if test "${with_xen_dumpdir+set}" = set; then :
@@ -4018,6 +4028,11 @@ LIBEXEC=`eval echo $libexecdir/$libexec_subdir`
 
 LIBEXEC_BIN=${LIBEXEC}/bin
 
+
+cat >>confdefs.h <<_ACEOF
+#define LIBEXEC_BIN "$LIBEXEC_BIN"
+_ACEOF
+
 LIBEXEC_LIB=${LIBEXEC}/lib
 
 LIBEXEC_INC=${LIBEXEC}/include
@@ -4025,12 +4040,27 @@ LIBEXEC_INC=${LIBEXEC}/include
 XENFIRMWAREDIR=${LIBEXEC}/boot
 
 
+cat >>confdefs.h <<_ACEOF
+#define XENFIRMWAREDIR "$XENFIRMWAREDIR"
+_ACEOF
+
+
 XEN_RUN_DIR=$rundir_path/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_RUN_DIR "$XEN_RUN_DIR"
+_ACEOF
+
+
 XEN_LOG_DIR=$localstatedir/log/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_LOG_DIR "$XEN_LOG_DIR"
+_ACEOF
+
+
 XEN_LIB_STORED=$localstatedir/lib/xenstored
 
 
@@ -4040,6 +4070,11 @@ XEN_RUN_STORED=$rundir_path/xenstored
 XEN_LIB_DIR=$localstatedir/lib/xen
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_LIB_DIR "$XEN_LIB_DIR"
+_ACEOF
+
+
 SHAREDIR=$prefix/share
 
 
@@ -4053,12 +4088,22 @@ case "$host_os" in
 esac
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_LOCK_DIR "$XEN_LOCK_DIR"
+_ACEOF
+
+
 XEN_PAGING_DIR=$localstatedir/lib/xen/xenpaging
 
 
 XEN_DUMP_DIR=$xen_dumpdir_path
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_DUMP_DIR "$XEN_DUMP_DIR"
+_ACEOF
+
+
 DEBUG_DIR=$debugdir_path
 
 
diff --git a/tools/console/Makefile b/tools/console/Makefile
index 3f4cddab03..207c04c9cd 100644
--- a/tools/console/Makefile
+++ b/tools/console/Makefile
@@ -22,27 +22,19 @@ all: $(BIN)
 clean:
 	$(RM) *.a *.so *.o *.rpm $(BIN) $(DEPS_RM)
 	$(RM) client/*.o daemon/*.o
-	$(RM) client/_paths.h
-	$(RM) daemon/_paths.h
 
 .PHONY: distclean
 distclean: clean
 
-daemon/main.o: daemon/_paths.h
+daemon/main.o: CFLAGS += -include $(XEN_ROOT)/tools/config.h
 daemon/io.o: CFLAGS += $(CFLAGS_libxenevtchn) $(CFLAGS_libxengnttab) $(CFLAGS_libxenforeignmemory) $(CONSOLE_CFLAGS-y)
 xenconsoled: $(patsubst %.c,%.o,$(wildcard daemon/*.c))
 	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxenforeignmemory) $(LDLIBS_xenconsoled) $(APPEND_LDFLAGS)
 
-client/main.o: client/_paths.h
+client/main.o: CFLAGS += -include $(XEN_ROOT)/tools/config.h
 xenconsole: $(patsubst %.c,%.o,$(wildcard client/*.c))
 	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS) $(LDLIBS_xenconsole) $(APPEND_LDFLAGS)
 
-genpath-target = $(call buildmakevars2header,client/_paths.h)
-$(eval $(genpath-target))
-
-genpath-target = $(call buildmakevars2header,daemon/_paths.h)
-$(eval $(genpath-target))
-
 .PHONY: install
 install: $(BIN)
 	$(INSTALL_DIR) $(DESTDIR)/$(sbindir)
diff --git a/tools/console/client/main.c b/tools/console/client/main.c
index 80157be421..ada6728caa 100644
--- a/tools/console/client/main.c
+++ b/tools/console/client/main.c
@@ -41,7 +41,6 @@
 
 #include <xenstore.h>
 #include "xenctrl.h"
-#include "_paths.h"
 
 #define ESCAPE_CHARACTER 0x1d
 
diff --git a/tools/console/daemon/main.c b/tools/console/daemon/main.c
index 30124a1c19..aac7233a48 100644
--- a/tools/console/daemon/main.c
+++ b/tools/console/daemon/main.c
@@ -31,7 +31,6 @@
 
 #include "utils.h"
 #include "io.h"
-#include "_paths.h"
 
 int log_reload = 0;
 int log_guest = 0;
diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 1bcc97ea8a..7f6c422440 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -24,6 +24,7 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenguest)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenlight)
+$(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
 .PHONY: all
 all: $(PROGS)
@@ -31,8 +32,6 @@ all: $(PROGS)
 xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
 	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
 
-$(INIT_XENSTORE_DOMAIN_OBJS): _paths.h
-
 init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
 	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
 
@@ -47,9 +46,6 @@ uninstall:
 
 .PHONY: clean
 clean:
-	$(RM) -f *.o $(PROGS) $(DEPS_RM) _paths.h
+	$(RM) -f *.o $(PROGS) $(DEPS_RM)
 
 distclean: clean
-
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index b205a79ee6..dba4292803 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -16,7 +16,6 @@
 #include <xen/io/xenbus.h>
 
 #include "init-dom-json.h"
-#include "_paths.h"
 
 #define LAPIC_BASE_ADDRESS  0xfee00000UL
 #define MB(x)               ((uint64_t)x << 20)
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index c6d882e239..8f5f3acd21 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -106,11 +106,6 @@ include $(XEN_ROOT)/tools/libs/libs.mk
 libxenguest.so.$(MAJOR).$(MINOR): COMPRESSION_LIBS = $(filter -l%,$(zlib-options))
 libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(COMPRESSION_LIBS) -lz
 
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
-
-$(LIB_OBJS) $(PIC_OBJS): _paths.h
-
 -include $(DEPS_INCLUDE)
 
 .PHONY: cleanlocal
diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index 2e4c1330ea..c17cf9f712 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -33,7 +33,6 @@
 
 #define XG_NEED_UNALIGNED
 #include "xg_private.h"
-#include "_paths.h"
 
 /* ------------------------------------------------------------------------ */
 /* debugging                                                                */
diff --git a/tools/libs/guest/xg_suspend.c b/tools/libs/guest/xg_suspend.c
index 128353029c..0ce6364963 100644
--- a/tools/libs/guest/xg_suspend.c
+++ b/tools/libs/guest/xg_suspend.c
@@ -19,7 +19,6 @@
 #include <xenevtchn.h>
 
 #include "xc_private.h"
-#include "_paths.h"
 #include "xenguest.h"
 
 #define SUSPEND_LOCK_FILE    XEN_RUN_DIR "/suspend-evtchn-%d.lock"
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index bfd58226ce..fb5a9ca87e 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -153,7 +153,7 @@ LIBXL_TEST_OBJS += $(foreach t, $(LIBXL_TESTS_INSIDE),libxl_test_$t.opic)
 TEST_PROG_OBJS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t.o) test_common.o
 TEST_PROGS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t)
 
-AUTOINCS = $(XEN_INCLUDE)/_libxl_list.h _paths.h _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
+AUTOINCS = $(XEN_INCLUDE)/_libxl_list.h _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
 AUTOSRCS = _libxl_save_msgs_callout.c _libxl_save_msgs_helper.c
 
 CLIENTS = testidl libxl-save-helper
@@ -191,9 +191,6 @@ build: $(CLIENTS) $(TEST_PROGS) $(AUTOSRCS) $(AUTOINCS)
 
 $(LIB_OBJS) $(PIC_OBJS) $(SAVE_HELPER_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): $(AUTOINCS) libxl.api-ok
 
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
-
 libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
 	$(PERL) $^
 	touch $@
@@ -216,9 +213,8 @@ _libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
 
 $(XEN_INCLUDE)/libxl.h: $(XEN_INCLUDE)/_libxl_types.h $(XEN_INCLUDE)/_libxl_list.h
 $(XEN_INCLUDE)/libxl_json.h: $(XEN_INCLUDE)/_libxl_types_json.h
-libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h _paths.h
+libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h
 libxl_internal_json.h: _libxl_types_internal_json.h
-xl.h: _paths.h
 
 $(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h
 $(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): libxl_internal.h
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index fe9f760f71..c28867f87b 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -24,8 +24,6 @@
 #include <xen/hvm/hvm_xs_strings.h>
 #include <xen/hvm/e820.h>
 
-#include "_paths.h"
-
 //#define DEBUG 1
 
 libxl_domain_type libxl__domain_type(libxl__gc *gc, uint32_t domid)
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 0b4671318c..37d5c27756 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -73,7 +73,6 @@
 #endif
 
 #include "libxl.h"
-#include "_paths.h"
 #include "_libxl_save_msgs_callout.h"
 
 #if __GNUC__ > 3 || (__GNUC__ == 3 && __GNUC_MINOR__ >= 1)
diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
index 4699c4a0a3..b91c2cafa2 100644
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -18,7 +18,6 @@
 #include <ctype.h>
 
 #include "libxl_internal.h"
-#include "_paths.h"
 
 #ifndef LIBXL_HAVE_NONCONST_LIBXL_BASENAME_RETURN_VALUE
 const
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 911a2de8ec..01417b5334 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -30,8 +30,6 @@ APPEND_LDFLAGS += $(LDLIBS-y)
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(LIB_OBJS) $(PIC_OBJS): _paths.h
-
 PYLIB=bindings/swig/python/_xenstat.so
 PYMOD=bindings/swig/python/xenstat.py
 PYSRC=bindings/swig/python/_xenstat.c
@@ -121,10 +119,7 @@ clean: cleanlocal
 
 .PHONY: cleanlocal
 cleanlocal:
-	rm -f $(BINDINGS) $(BINDINGSRC) $(DEPS_RM) _paths.h
+	rm -f $(BINDINGS) $(BINDINGSRC) $(DEPS_RM)
 	rm -f libxenstat.map
 
 -include $(DEPS_INCLUDE)
-
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
diff --git a/tools/libs/stat/xenstat_qmp.c b/tools/libs/stat/xenstat_qmp.c
index 2205a04131..9909b9727e 100644
--- a/tools/libs/stat/xenstat_qmp.c
+++ b/tools/libs/stat/xenstat_qmp.c
@@ -23,7 +23,6 @@
 #include <xenctrl.h>
 
 #include "xenstat_priv.h"
-#include "_paths.h"
 
 #ifdef HAVE_YAJL_YAJL_VERSION_H
 #  include <yajl/yajl_version.h>
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index 2e129f00e1..b7f439121a 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -29,11 +29,6 @@ $(XL_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
 $(XL_OBJS): CFLAGS += $(CFLAGS_XL)
 $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs it.
 
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
-
-$(XL_OBJS): _paths.h
-
 .PHONY: all
 all: xl
 
@@ -54,7 +49,7 @@ uninstall:
 
 .PHONY: clean
 clean:
-	$(RM) -f *.o xl _paths.h $(DEPS_RM)
+	$(RM) *.o xl $(DEPS_RM)
 
 distclean: clean
 
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index cf12c79a9b..c5c4bedbdd 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -17,7 +17,6 @@
 
 #include <assert.h>
 
-#include "_paths.h"
 #include <xentoollog.h>
 
 struct cmd_spec {
-- 
Anthony PERARD


