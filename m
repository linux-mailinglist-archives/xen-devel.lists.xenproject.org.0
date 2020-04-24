Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9521B6BB6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 05:06:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRof2-0001m1-Qh; Fri, 24 Apr 2020 03:05:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6uIs=6I=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRof1-0001ll-IK
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 03:05:51 +0000
X-Inumbo-ID: 7ee0156e-85d8-11ea-b4f4-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ee0156e-85d8-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 03:05:47 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id b62so8851525qkf.6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 20:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=3RBRwALRKscK7/reWkGS8WrtLddfjEdapdGxqMcDLd0=;
 b=k1ZJsCwv1cLgyTG3hFkzW5MdEHhbYMmJyLl4h/Y83gITIbvPFeS/Vy4Z1SzveAyukv
 YGVb2/g/8X+K+3LBCTCsFPFxs3YqRq7ZUhUc/OmwDIL0XXFhV8gyvKJO+4ZlNizM6nbs
 EyS3OVMoLrZ50/U6jyawV7TsPPmll5VrS5329rzEYNlBEzLO5A89jc1J2+N+Mb5tBw/1
 EI1iiJAkTsO2GweLcggoN8lhFG05y2QzsHul/kCamdAMgI34Y1+u/YF6UFOe3xu2B7Uf
 xJ50z0vZi/mz7y1q3y2Fb1Loh0D9vsgnTf2+bxnCT9+a8fGPuNF3xQSuat8MXiHm+E1Y
 dcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=3RBRwALRKscK7/reWkGS8WrtLddfjEdapdGxqMcDLd0=;
 b=KEL+q02MHPCXCwVRXct+BK8pOza3Mt8DMEpks5dpiSHR3Li40Qr2iAY8JxnRX7QPc/
 XXI4lgMcPivxzyZccsCsj47xCSfhbO/Vjke/M1XSGzsrF9erJ3XG+eo5xXGAUQWP3LHS
 55AKY05ewgCJWspEX+ehTjC37FcUr6kWidp5rVeS1ms+ZFsMAgqiimlfwtvCi5Gajv3p
 r4wf1VljDv0ZVL9tonBGd1QcHdFAoOxfNrlYRpsMSQPoza0tlfDdiq0Rq7eEa/QvfnZ5
 5+lyIvRBJ7YycnAvXY2gs7iF1jPkywC+V+oTdFzVPxXnCEn9zw85BeNI3MRYwbeCrvWN
 qeCA==
X-Gm-Message-State: AGi0PuYH1h4draKzl/rL87lfep9HQtz30G5aNcVZWPwOMs6DQS3zaY/P
 02f9A5kG5k7p+vFYegqGZTOWGOeyP6M=
X-Google-Smtp-Source: APiQypJ7DOzxGtUTT5XCAFPUYGU+VW+Vk0kFnmM2RlCtqm3RJooQj9FMvjmlYfuzLGT5lP79I6H+Nw==
X-Received: by 2002:a37:68cd:: with SMTP id d196mr6904045qkc.188.1587697546732; 
 Thu, 23 Apr 2020 20:05:46 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id p10sm2949820qtu.14.2020.04.23.20.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 20:05:46 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/2] tools: build golang tools if go compiler is present
Date: Thu, 23 Apr 2020 23:05:40 -0400
Message-Id: <4dbde331aa6a0f8a78d93b86ffaa396c367fc57f.1587695896.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587695896.git.rosbrookn@ainfosec.com>
References: <cover.1587695896.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1587695896.git.rosbrookn@ainfosec.com>
References: <cover.1587695896.git.rosbrookn@ainfosec.com>
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
the golang tools. If the compiler is not found, and --enable-golang was
not explicitly set, do not build to the golang tools.

The corresponding make variable is CONFIG_GOLANG. Remove CONFIG_GOLANG
from tools/Rules.mk since the variable is now set by configure in
config/Tools.mk.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
Acked-by: Wei Liu <wl@xen.org>
---
 config/Tools.mk.in |   1 +
 m4/golang.m4       |   4 ++
 tools/Rules.mk     |   2 -
 tools/configure    | 138 +++++++++++++++++++++++++++++++++++++++++++++
 tools/configure.ac |  12 ++++
 5 files changed, 155 insertions(+), 2 deletions(-)
 create mode 100644 m4/golang.m4

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 189fda1596..23df47af8d 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -55,6 +55,7 @@ CONFIG_QEMU_TRAD    := @qemu_traditional@
 CONFIG_QEMU_XEN     := @qemu_xen@
 CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
 CONFIG_LIBNL        := @libnl@
+CONFIG_GOLANG       := @golang@
 
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
index 4fa5f7b937..375430df3f 100755
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
+golang
 seabios
 ovmf
 xsmpolicy
@@ -807,6 +809,7 @@ enable_ocamltools
 enable_xsmpolicy
 enable_ovmf
 enable_seabios
+enable_golang
 with_linux_backend_modules
 enable_qemu_traditional
 enable_rombios
@@ -1493,6 +1496,7 @@ Optional Features:
   --disable-xsmpolicy     Disable XSM policy compilation (default is ENABLED)
   --enable-ovmf           Enable OVMF (default is DISABLED)
   --disable-seabios       Disable SeaBIOS (default is ENABLED)
+  --disable-golang        Disable Go tools (default is ENABLED)
   --enable-qemu-traditional
                           Enable qemu traditional device model, (DEFAULT is on
                           for Linux or NetBSD x86, otherwise off)
@@ -3870,6 +3874,8 @@ esac
 
 
 
+
+
 
 
 
@@ -4200,6 +4206,29 @@ seabios=$ax_cv_seabios
 
 
 
+# Check whether --enable-golang was given.
+if test "${enable_golang+set}" = set; then :
+  enableval=$enable_golang;
+fi
+
+
+if test "x$enable_golang" = "xno"; then :
+
+    ax_cv_golang="n"
+
+elif test "x$enable_golang" = "xyes"; then :
+
+    ax_cv_golang="y"
+
+elif test -z $ax_cv_golang; then :
+
+    ax_cv_golang="y"
+
+fi
+golang=$ax_cv_golang
+
+
+
 
 # Check whether --with-linux-backend-modules was given.
 if test "${with_linux_backend_modules+set}" = set; then :
@@ -6694,6 +6723,115 @@ fi
 
 fi
 
+if test "x$golang" = "xy"; then :
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
+        if test "x$enable_golang" =  "xyes"; then :
+
+            as_fn_error $? "Go tools enabled, but missing go compiler" "$LINENO" 5
+
+fi
+        golang="n"
+
+fi
+
+fi
+
 
 
 
diff --git a/tools/configure.ac b/tools/configure.ac
index ea0272766f..b6f8882be4 100644
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
+AX_ARG_DEFAULT_ENABLE([golang], [Disable Go tools])
 
 AC_ARG_WITH([linux-backend-modules],
     AS_HELP_STRING([--with-linux-backend-modules="mod1 mod2"],
@@ -320,6 +322,16 @@ AS_IF([test "x$ocamltools" = "xy"], [
     ])
 ])
 
+AS_IF([test "x$golang" = "xy"], [
+    AC_PROG_GO
+    AS_IF([test "x$GO" = "xno"], [
+        AS_IF([test "x$enable_golang" =  "xyes"], [
+            AC_MSG_ERROR([Go tools enabled, but missing go compiler])
+        ])
+        golang="n"
+    ])
+])
+
 m4_include([../m4/xenstored.m4])
 AX_XENSTORE_OPTIONS
 AX_XENSTORE_SET
-- 
2.17.1


