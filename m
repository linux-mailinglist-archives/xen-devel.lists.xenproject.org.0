Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EB01B513E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 02:26:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRPgP-0000Ee-4L; Thu, 23 Apr 2020 00:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA1d=6H=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRPgN-0000EZ-Sb
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 00:25:35 +0000
X-Inumbo-ID: f0de2a24-84f8-11ea-9e09-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0de2a24-84f8-11ea-9e09-bc764e2007e4;
 Thu, 23 Apr 2020 00:25:31 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z90so3440009qtd.10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 17:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=54Yo/CmXj3GfX8VmGqgKQ7FZ0LlX1+GiaRBwFewzMro=;
 b=k8dYunRPbEKFeUySCyZdtbr+5AlKRM2DZYY4Zp/WgEHRWWNA2YoRjzsdP/QmzTgkzW
 ogKdXpECN6zJjLeZ9U0IO0hTJsu42ThdHXtTBqBjWj0/Xt7vh5PF4yQod9C5oPCAAZOY
 93Yfg5dpMc91GcEx9NaR7O2gv4PZw9kgBddQoYxq7e/yZlD8ROwSVGM/cWMYyheDOIm5
 sZAxp2iMgC0t88CWq751COXrBtny++SVCkRoZ21fxsea/vcfR1/14VLW0GDYGyYRq+2c
 AB/l2DzvaB97ydgMIP0C9QtzBQTwxJVx4C+Bk1V0dT1/eTID58bA8k7t5bIzDbhj2eDD
 LEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=54Yo/CmXj3GfX8VmGqgKQ7FZ0LlX1+GiaRBwFewzMro=;
 b=Ro1RLfv0OIdoRS9t4oarHTQ14Keae7V/a9gI1Bd4g5/cWfgJdD2SjPY67gZ9AnVkyB
 htv8pCHqRK2/LP+qapSyOOna6SafvXeMJHoodbX4/yThkzJwBGzRGzxgAUdLZH1GvuU1
 7GPWmDMI4yuExhQjdWJ1fRqFRg28aKerLAaFDVHxMXCqe3kyYDz0psBAo7A/k0rYfK65
 JLJ0sp/gweF61Su6TUjzDssYUJdIULEpfmpqKjhSk8j7UsCkJRLsV6Kgf7ckGCOJAF4f
 qOF3WkWaKkQYANWDc1PTw2ABqyjp2zxbAC03BYYAYSMGVfKSDKYS3Caz0FeFucfKvQW/
 9HuA==
X-Gm-Message-State: AGi0PuaPu9L5qnuwUdBeWIrgtuV2JBJaqSkBnDnKC2yTeTQjjFyGxSaV
 IjE/QO2HWp7MbAmt4PDKPycmCh1KHxI=
X-Google-Smtp-Source: APiQypJGlFyjvZADY5o1y3jHWmP7RN+PLDvHbokx1/YoFm4Bdr9KWDQo0KMmfPFdMZ7DGzzaFeRATw==
X-Received: by 2002:ac8:7cba:: with SMTP id z26mr1447090qtv.143.1587601530753; 
 Wed, 22 Apr 2020 17:25:30 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id j90sm669088qte.20.2020.04.22.17.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 17:25:30 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] tools: build golang tools if go compiler is present
Date: Wed, 22 Apr 2020 20:25:25 -0400
Message-Id: <c2d966b43313c9df64551b0ce31462c176445b70.1587599095.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587599094.git.rosbrookn@ainfosec.com>
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1587599094.git.rosbrookn@ainfosec.com>
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

By default, if the go compiler is found by the configure script, build
the golang tools. If the compiler is not found, and
--enable-golang_tools was not explicitly set, do not build to the golang
tools.

The new corresponding make variable is CONFIG_GOLANG_TOOLS. Remove
CONFIG_GOLANG from tools/Rules.mk since the new variable is set by
configure.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 config/Tools.mk.in |   1 +
 m4/golang.m4       |   4 ++
 tools/Makefile     |   2 +-
 tools/Rules.mk     |   2 -
 tools/configure    | 138 +++++++++++++++++++++++++++++++++++++++++++++
 tools/configure.ac |  12 ++++
 6 files changed, 156 insertions(+), 3 deletions(-)
 create mode 100644 m4/golang.m4

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 189fda1596..2c219f5477 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -55,6 +55,7 @@ CONFIG_QEMU_TRAD    := @qemu_traditional@
 CONFIG_QEMU_XEN     := @qemu_xen@
 CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
 CONFIG_LIBNL        := @libnl@
+CONFIG_GOLANG_TOOLS := @golang_tools@
 
 CONFIG_SYSTEMD      := @systemd@
 SYSTEMD_CFLAGS      := @SYSTEMD_CFLAGS@
diff --git a/m4/golang.m4 b/m4/golang.m4
new file mode 100644
index 0000000000..0b4bd54ce0
--- /dev/null
+++ b/m4/golang.m4
@@ -0,0 +1,4 @@
+AC_DEFUN([AC_PROG_GO], [
+    dnl Check for the go compiler
+    AC_CHECK_TOOL([GO],[go],[no])
+])
diff --git a/tools/Makefile b/tools/Makefile
index c10946e3b1..81be8db757 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -31,7 +31,7 @@ endif
 
 SUBDIRS-y += xenpmd
 SUBDIRS-y += libxl
-SUBDIRS-$(CONFIG_GOLANG) += golang
+SUBDIRS-$(CONFIG_GOLANG_TOOLS) += golang
 SUBDIRS-y += xl
 SUBDIRS-y += helpers
 SUBDIRS-$(CONFIG_X86) += xenpaging
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 9bac15c8d1..5b8cf748ad 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -35,8 +35,6 @@ XENSTORE_XENSTORED ?= y
 debug ?= y
 debug_symbols ?= $(debug)
 
-# Set CONFIG_GOLANG=y in .config (or in make) to build golang
-CONFIG_GOLANG ?= n
 XEN_GOPATH        = $(XEN_ROOT)/tools/golang
 XEN_GOCODE_URL    = golang.xenproject.org
 
diff --git a/tools/configure b/tools/configure
index 4fa5f7b937..a4199573fd 100755
--- a/tools/configure
+++ b/tools/configure
@@ -664,6 +664,7 @@ pyconfig
 PYTHONPATH
 CHECKPOLICY
 XENSTORED
+GO
 OCAMLFIND
 OCAMLBUILD
 OCAMLDOC
@@ -705,6 +706,7 @@ LD86
 AS86
 qemu_traditional
 LINUX_BACKEND_MODULES
+golang_tools
 seabios
 ovmf
 xsmpolicy
@@ -807,6 +809,7 @@ enable_ocamltools
 enable_xsmpolicy
 enable_ovmf
 enable_seabios
+enable_golang_tools
 with_linux_backend_modules
 enable_qemu_traditional
 enable_rombios
@@ -1493,6 +1496,7 @@ Optional Features:
   --disable-xsmpolicy     Disable XSM policy compilation (default is ENABLED)
   --enable-ovmf           Enable OVMF (default is DISABLED)
   --disable-seabios       Disable SeaBIOS (default is ENABLED)
+  --disable-golang_tools  Disable Go tools (default is ENABLED)
   --enable-qemu-traditional
                           Enable qemu traditional device model, (DEFAULT is on
                           for Linux or NetBSD x86, otherwise off)
@@ -3870,6 +3874,8 @@ esac
 
 
 
+
+
 
 
 
@@ -4200,6 +4206,29 @@ seabios=$ax_cv_seabios
 
 
 
+# Check whether --enable-golang_tools was given.
+if test "${enable_golang_tools+set}" = set; then :
+  enableval=$enable_golang_tools;
+fi
+
+
+if test "x$enable_golang_tools" = "xno"; then :
+
+    ax_cv_golang_tools="n"
+
+elif test "x$enable_golang_tools" = "xyes"; then :
+
+    ax_cv_golang_tools="y"
+
+elif test -z $ax_cv_golang_tools; then :
+
+    ax_cv_golang_tools="y"
+
+fi
+golang_tools=$ax_cv_golang_tools
+
+
+
 
 # Check whether --with-linux-backend-modules was given.
 if test "${with_linux_backend_modules+set}" = set; then :
@@ -6694,6 +6723,115 @@ fi
 
 fi
 
+if test "x$golang_tools" = "xy"; then :
+
+
+        if test -n "$ac_tool_prefix"; then
+  # Extract the first word of "${ac_tool_prefix}go", so it can be a program name with args.
+set dummy ${ac_tool_prefix}go; ac_word=$2
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
+if ${ac_cv_prog_GO+:} false; then :
+  $as_echo_n "(cached) " >&6
+else
+  if test -n "$GO"; then
+  ac_cv_prog_GO="$GO" # Let the user override the test.
+else
+as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+    ac_cv_prog_GO="${ac_tool_prefix}go"
+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    break 2
+  fi
+done
+  done
+IFS=$as_save_IFS
+
+fi
+fi
+GO=$ac_cv_prog_GO
+if test -n "$GO"; then
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $GO" >&5
+$as_echo "$GO" >&6; }
+else
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+$as_echo "no" >&6; }
+fi
+
+
+fi
+if test -z "$ac_cv_prog_GO"; then
+  ac_ct_GO=$GO
+  # Extract the first word of "go", so it can be a program name with args.
+set dummy go; ac_word=$2
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
+if ${ac_cv_prog_ac_ct_GO+:} false; then :
+  $as_echo_n "(cached) " >&6
+else
+  if test -n "$ac_ct_GO"; then
+  ac_cv_prog_ac_ct_GO="$ac_ct_GO" # Let the user override the test.
+else
+as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+    ac_cv_prog_ac_ct_GO="go"
+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    break 2
+  fi
+done
+  done
+IFS=$as_save_IFS
+
+fi
+fi
+ac_ct_GO=$ac_cv_prog_ac_ct_GO
+if test -n "$ac_ct_GO"; then
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_GO" >&5
+$as_echo "$ac_ct_GO" >&6; }
+else
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+$as_echo "no" >&6; }
+fi
+
+  if test "x$ac_ct_GO" = x; then
+    GO="no"
+  else
+    case $cross_compiling:$ac_tool_warned in
+yes:)
+{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+ac_tool_warned=yes ;;
+esac
+    GO=$ac_ct_GO
+  fi
+else
+  GO="$ac_cv_prog_GO"
+fi
+
+
+    if test "x$GO" = "xno"; then :
+
+        if test "x$enable_golang_tools" =  "xyes"; then :
+
+            as_fn_error $? "Go tools enabled, but missing go compiler" "$LINENO" 5
+
+fi
+        golang_tools="n"
+
+fi
+
+fi
+
 
 
 
diff --git a/tools/configure.ac b/tools/configure.ac
index ea0272766f..69e0894638 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -73,6 +73,7 @@ m4_include([../m4/fetcher.m4])
 m4_include([../m4/ax_compare_version.m4])
 m4_include([../m4/paths.m4])
 m4_include([../m4/systemd.m4])
+m4_include([../m4/golang.m4])
 
 AX_XEN_EXPAND_CONFIG()
 
@@ -84,6 +85,7 @@ AX_ARG_DEFAULT_ENABLE([ocamltools], [Disable Ocaml tools])
 AX_ARG_DEFAULT_ENABLE([xsmpolicy], [Disable XSM policy compilation])
 AX_ARG_DEFAULT_DISABLE([ovmf], [Enable OVMF])
 AX_ARG_DEFAULT_ENABLE([seabios], [Disable SeaBIOS])
+AX_ARG_DEFAULT_ENABLE([golang_tools], [Disable Go tools])
 
 AC_ARG_WITH([linux-backend-modules],
     AS_HELP_STRING([--with-linux-backend-modules="mod1 mod2"],
@@ -320,6 +322,16 @@ AS_IF([test "x$ocamltools" = "xy"], [
     ])
 ])
 
+AS_IF([test "x$golang_tools" = "xy"], [
+    AC_PROG_GO
+    AS_IF([test "x$GO" = "xno"], [
+        AS_IF([test "x$enable_golang_tools" =  "xyes"], [
+            AC_MSG_ERROR([Go tools enabled, but missing go compiler])
+        ])
+        golang_tools="n"
+    ])
+])
+
 m4_include([../m4/xenstored.m4])
 AX_XENSTORE_OPTIONS
 AX_XENSTORE_SET
-- 
2.17.1


