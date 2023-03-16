Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C446BD6D5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 18:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510756.789097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrDp-0003m9-Lb; Thu, 16 Mar 2023 17:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510756.789097; Thu, 16 Mar 2023 17:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrDp-0003iI-Ek; Thu, 16 Mar 2023 17:17:01 +0000
Received: by outflank-mailman (input) for mailman id 510756;
 Thu, 16 Mar 2023 17:16:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItE1=7I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pcrDl-0002vw-Bk
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 17:16:59 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5861528a-c41e-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 18:16:53 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B5D25C0190;
 Thu, 16 Mar 2023 13:16:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Mar 2023 13:16:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 13:16:50 -0400 (EDT)
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
X-Inumbo-ID: 5861528a-c41e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1678987012; x=1679073412; bh=z2
	+ALtPkmqdmrdzfdMafEUjVXNvAbJp11gDIxBQFMbk=; b=UYfYuSvdLy79fNgo1w
	8oe81U7ETGQVBFaUaM2cikvqlCgcUNiPq5q4+6tSssNVcerbeRYHONpYwNDfcVOr
	z4+P/05c9DPlBd8Tsh0tM3lcVNL4dzACrxPrr7gTyPqyRR2529SCucZxsXQwZiq0
	3LD/ObtGV9lKM0WT8nVSS1XQqmVIasKXyr1NdfJ/7zIABztnLX3G8sNlUccdSBck
	WKQvHuvOkbOxdmNKC4UpC1H4oZSpCUWj7c9bTvwrtTn30Fr35U9SWzuTZ+uUlWo8
	9U+BgE7Rzfcb/dgBG5x6D+Tl0lFgwv5zUmeURiJVe7kP6dKjJ26elTUSDxGhx1yn
	TP2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1678987012; x=1679073412; bh=z2+ALtPkmqdmrdzfdMafEUjVXNvAbJp11gD
	IxBQFMbk=; b=a4cpaD7Ddiix//CPVWDMa83cjT/spMsK2w0y98IYhBea7h1cGUa
	LiAOyq2KJ66DplVsLVQaSI3HlJZc/Ehh8dijSr/NJxs12XB6+3USVzquYjU6rRAs
	428YCjJzNr5v2VfOGthtV22gu9mjgV1VpHcneIj0wZEJPyGkxLoPCWWhFn70zy6s
	BqyG+xF54xuSIwi/tULX0+obI8D42EiSNwFYHxx4/80egCqGYD4lK75LZHjzzPIq
	Ywg6mZeWa7RCRdwDCyztT0U514n6i0ekJlma2L4NM8azmwNn+BU5kyXeFxOdWT7n
	OXDVq+jKyRric/DNdF3Afm8NHcfjqYhY0jg==
X-ME-Sender: <xms:BE8TZOVQXP_Leag5ke4Jjxjo1yAwtiN0lB0E8zciiKBie3nAJfhgkw>
    <xme:BE8TZKlLDhwI2q9UL_uDwJFCVo_kNO5jLWHK18NH19unusSdibYk_tG_7fBQ-_0U9
    eZs2iz66udTDw>
X-ME-Received: <xmr:BE8TZCZlPA8RGrzAWS3vMhPLyPVxQWF83NDmIJ_YqfYqlFnfMFtdsyZW4AOBoHfsIdQOtBWHV8BN3xrFHVRKImzzw7cLU3KRRIfWdA3bLK4E3qdetdwT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    jeduvdehgfevgfejhfelffehgedtveekteevjefgteejgeevieeiffeukeeuhfeinecuff
    homhgrihhnpeigvghnrdhorhhgpdhsuhgsrddqshhhvghllhdpshhusgdrshhhvghllhdp
    ohhuthdrihhtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:BE8TZFWhgjexcjFiB1chWqbAtlMIV25SxWJ7wmBci4Ee8gJXr1BjNQ>
    <xmx:BE8TZInTMKw2jYknF8MslkRbEXXzAcTULL27A3Fy0qeBwepiGrFwmw>
    <xmx:BE8TZKfDCYCntmAGoxiay5a-U77nBjpEkOe8tHs47oTCYLXJDH303A>
    <xmx:BE8TZEuiqoGvGFb3fWCEMV6Ma9PQAiy8JUg2uCgK0Wm00WkSQdKPDw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/4] tools: regenerate configure
Date: Thu, 16 Mar 2023 18:16:33 +0100
Message-Id: <20230316171634.320626-3-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
References: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Regenerate after m4/python_devel.m4 change.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/configure | 6598 ++++++++++++++++++++++++++---------------------
 1 file changed, 3653 insertions(+), 2945 deletions(-)

diff --git a/tools/configure b/tools/configure
index dae377c98252..0462141fa47b 100755
--- a/tools/configure
+++ b/tools/configure
@@ -1,11 +1,12 @@
 #! /bin/sh
 # Guess values for system-dependent variables and create Makefiles.
-# Generated by GNU Autoconf 2.69 for Xen Hypervisor Tools 4.18.
+# Generated by GNU Autoconf 2.71 for Xen Hypervisor Tools 4.18.
 #
 # Report bugs to <xen-devel@lists.xen.org>.
 #
 #
-# Copyright (C) 1992-1996, 1998-2012 Free Software Foundation, Inc.
+# Copyright (C) 1992-1996, 1998-2017, 2020-2021 Free Software Foundation,
+# Inc.
 #
 #
 # This configure script is free software; the Free Software Foundation
@@ -16,14 +17,16 @@
 
 # Be more Bourne compatible
 DUALCASE=1; export DUALCASE # for MKS sh
-if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then :
+as_nop=:
+if test ${ZSH_VERSION+y} && (emulate sh) >/dev/null 2>&1
+then :
   emulate sh
   NULLCMD=:
   # Pre-4.2 versions of Zsh do word splitting on ${1+"$@"}, which
   # is contrary to our usage.  Disable this feature.
   alias -g '${1+"$@"}'='"$@"'
   setopt NO_GLOB_SUBST
-else
+else $as_nop
   case `(set -o) 2>/dev/null` in #(
   *posix*) :
     set -o posix ;; #(
@@ -33,46 +36,46 @@ esac
 fi
 
 
+
+# Reset variables that may have inherited troublesome values from
+# the environment.
+
+# IFS needs to be set, to space, tab, and newline, in precisely that order.
+# (If _AS_PATH_WALK were called with IFS unset, it would have the
+# side effect of setting IFS to empty, thus disabling word splitting.)
+# Quoting is to prevent editors from complaining about space-tab.
 as_nl='
 '
 export as_nl
-# Printing a long string crashes Solaris 7 /usr/bin/printf.
-as_echo='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
-as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo
-as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo$as_echo
-# Prefer a ksh shell builtin over an external printf program on Solaris,
-# but without wasting forks for bash or zsh.
-if test -z "$BASH_VERSION$ZSH_VERSION" \
-    && (test "X`print -r -- $as_echo`" = "X$as_echo") 2>/dev/null; then
-  as_echo='print -r --'
-  as_echo_n='print -rn --'
-elif (test "X`printf %s $as_echo`" = "X$as_echo") 2>/dev/null; then
-  as_echo='printf %s\n'
-  as_echo_n='printf %s'
-else
-  if test "X`(/usr/ucb/echo -n -n $as_echo) 2>/dev/null`" = "X-n $as_echo"; then
-    as_echo_body='eval /usr/ucb/echo -n "$1$as_nl"'
-    as_echo_n='/usr/ucb/echo -n'
-  else
-    as_echo_body='eval expr "X$1" : "X\\(.*\\)"'
-    as_echo_n_body='eval
-      arg=$1;
-      case $arg in #(
-      *"$as_nl"*)
-	expr "X$arg" : "X\\(.*\\)$as_nl";
-	arg=`expr "X$arg" : ".*$as_nl\\(.*\\)"`;;
-      esac;
-      expr "X$arg" : "X\\(.*\\)" | tr -d "$as_nl"
-    '
-    export as_echo_n_body
-    as_echo_n='sh -c $as_echo_n_body as_echo'
-  fi
-  export as_echo_body
-  as_echo='sh -c $as_echo_body as_echo'
-fi
+IFS=" ""	$as_nl"
+
+PS1='$ '
+PS2='> '
+PS4='+ '
+
+# Ensure predictable behavior from utilities with locale-dependent output.
+LC_ALL=C
+export LC_ALL
+LANGUAGE=C
+export LANGUAGE
+
+# We cannot yet rely on "unset" to work, but we need these variables
+# to be unset--not just set to an empty or harmless value--now, to
+# avoid bugs in old shells (e.g. pre-3.0 UWIN ksh).  This construct
+# also avoids known problems related to "unset" and subshell syntax
+# in other old shells (e.g. bash 2.01 and pdksh 5.2.14).
+for as_var in BASH_ENV ENV MAIL MAILPATH CDPATH
+do eval test \${$as_var+y} \
+  && ( (unset $as_var) || exit 1) >/dev/null 2>&1 && unset $as_var || :
+done
+
+# Ensure that fds 0, 1, and 2 are open.
+if (exec 3>&0) 2>/dev/null; then :; else exec 0</dev/null; fi
+if (exec 3>&1) 2>/dev/null; then :; else exec 1>/dev/null; fi
+if (exec 3>&2)            ; then :; else exec 2>/dev/null; fi
 
 # The user is always right.
-if test "${PATH_SEPARATOR+set}" != set; then
+if ${PATH_SEPARATOR+false} :; then
   PATH_SEPARATOR=:
   (PATH='/bin;/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 && {
     (PATH='/bin:/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 ||
@@ -81,13 +84,6 @@ if test "${PATH_SEPARATOR+set}" != set; then
 fi
 
 
-# IFS
-# We need space, tab and new line, in precisely that order.  Quoting is
-# there to prevent editors from complaining about space-tab.
-# (If _AS_PATH_WALK were called with IFS unset, it would disable word
-# splitting by setting IFS to empty value.)
-IFS=" ""	$as_nl"
-
 # Find who we are.  Look in the path if we contain no directory separator.
 as_myself=
 case $0 in #((
@@ -96,8 +92,12 @@ case $0 in #((
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-    test -r "$as_dir/$0" && as_myself=$as_dir/$0 && break
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
+    test -r "$as_dir$0" && as_myself=$as_dir$0 && break
   done
 IFS=$as_save_IFS
 
@@ -109,30 +109,10 @@ if test "x$as_myself" = x; then
   as_myself=$0
 fi
 if test ! -f "$as_myself"; then
-  $as_echo "$as_myself: error: cannot find myself; rerun with an absolute file name" >&2
+  printf "%s\n" "$as_myself: error: cannot find myself; rerun with an absolute file name" >&2
   exit 1
 fi
 
-# Unset variables that we do not need and which cause bugs (e.g. in
-# pre-3.0 UWIN ksh).  But do not cause bugs in bash 2.01; the "|| exit 1"
-# suppresses any "Segmentation fault" message there.  '((' could
-# trigger a bug in pdksh 5.2.14.
-for as_var in BASH_ENV ENV MAIL MAILPATH
-do eval test x\${$as_var+set} = xset \
-  && ( (unset $as_var) || exit 1) >/dev/null 2>&1 && unset $as_var || :
-done
-PS1='$ '
-PS2='> '
-PS4='+ '
-
-# NLS nuisances.
-LC_ALL=C
-export LC_ALL
-LANGUAGE=C
-export LANGUAGE
-
-# CDPATH.
-(unset CDPATH) >/dev/null 2>&1 && unset CDPATH
 
 # Use a proper internal environment variable to ensure we don't fall
   # into an infinite loop, continuously re-executing ourselves.
@@ -154,20 +134,22 @@ esac
 exec $CONFIG_SHELL $as_opts "$as_myself" ${1+"$@"}
 # Admittedly, this is quite paranoid, since all the known shells bail
 # out after a failed `exec'.
-$as_echo "$0: could not re-execute with $CONFIG_SHELL" >&2
-as_fn_exit 255
+printf "%s\n" "$0: could not re-execute with $CONFIG_SHELL" >&2
+exit 255
   fi
   # We don't want this to propagate to other subprocesses.
           { _as_can_reexec=; unset _as_can_reexec;}
 if test "x$CONFIG_SHELL" = x; then
-  as_bourne_compatible="if test -n \"\${ZSH_VERSION+set}\" && (emulate sh) >/dev/null 2>&1; then :
+  as_bourne_compatible="as_nop=:
+if test \${ZSH_VERSION+y} && (emulate sh) >/dev/null 2>&1
+then :
   emulate sh
   NULLCMD=:
   # Pre-4.2 versions of Zsh do word splitting on \${1+\"\$@\"}, which
   # is contrary to our usage.  Disable this feature.
   alias -g '\${1+\"\$@\"}'='\"\$@\"'
   setopt NO_GLOB_SUBST
-else
+else \$as_nop
   case \`(set -o) 2>/dev/null\` in #(
   *posix*) :
     set -o posix ;; #(
@@ -187,42 +169,52 @@ as_fn_success || { exitcode=1; echo as_fn_success failed.; }
 as_fn_failure && { exitcode=1; echo as_fn_failure succeeded.; }
 as_fn_ret_success || { exitcode=1; echo as_fn_ret_success failed.; }
 as_fn_ret_failure && { exitcode=1; echo as_fn_ret_failure succeeded.; }
-if ( set x; as_fn_ret_success y && test x = \"\$1\" ); then :
+if ( set x; as_fn_ret_success y && test x = \"\$1\" )
+then :
 
-else
+else \$as_nop
   exitcode=1; echo positional parameters were not saved.
 fi
 test x\$exitcode = x0 || exit 1
+blah=\$(echo \$(echo blah))
+test x\"\$blah\" = xblah || exit 1
 test -x / || exit 1"
   as_suggested="  as_lineno_1=";as_suggested=$as_suggested$LINENO;as_suggested=$as_suggested" as_lineno_1a=\$LINENO
   as_lineno_2=";as_suggested=$as_suggested$LINENO;as_suggested=$as_suggested" as_lineno_2a=\$LINENO
   eval 'test \"x\$as_lineno_1'\$as_run'\" != \"x\$as_lineno_2'\$as_run'\" &&
-  test \"x\`expr \$as_lineno_1'\$as_run' + 1\`\" = \"x\$as_lineno_2'\$as_run'\"' || exit 1
-test \$(( 1 + 1 )) = 2 || exit 1"
-  if (eval "$as_required") 2>/dev/null; then :
+  test \"x\`expr \$as_lineno_1'\$as_run' + 1\`\" = \"x\$as_lineno_2'\$as_run'\"' || exit 1"
+  if (eval "$as_required") 2>/dev/null
+then :
   as_have_required=yes
-else
+else $as_nop
   as_have_required=no
 fi
-  if test x$as_have_required = xyes && (eval "$as_suggested") 2>/dev/null; then :
+  if test x$as_have_required = xyes && (eval "$as_suggested") 2>/dev/null
+then :
 
-else
+else $as_nop
   as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 as_found=false
 for as_dir in /bin$PATH_SEPARATOR/usr/bin$PATH_SEPARATOR$PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
   as_found=:
   case $as_dir in #(
 	 /*)
 	   for as_base in sh bash ksh sh5; do
 	     # Try only shells that exist, to save several forks.
-	     as_shell=$as_dir/$as_base
+	     as_shell=$as_dir$as_base
 	     if { test -f "$as_shell" || test -f "$as_shell.exe"; } &&
-		    { $as_echo "$as_bourne_compatible""$as_required" | as_run=a "$as_shell"; } 2>/dev/null; then :
+		    as_run=a "$as_shell" -c "$as_bourne_compatible""$as_required" 2>/dev/null
+then :
   CONFIG_SHELL=$as_shell as_have_required=yes
-		   if { $as_echo "$as_bourne_compatible""$as_suggested" | as_run=a "$as_shell"; } 2>/dev/null; then :
+		   if as_run=a "$as_shell" -c "$as_bourne_compatible""$as_suggested" 2>/dev/null
+then :
   break 2
 fi
 fi
@@ -230,14 +222,21 @@ fi
        esac
   as_found=false
 done
-$as_found || { if { test -f "$SHELL" || test -f "$SHELL.exe"; } &&
-	      { $as_echo "$as_bourne_compatible""$as_required" | as_run=a "$SHELL"; } 2>/dev/null; then :
-  CONFIG_SHELL=$SHELL as_have_required=yes
-fi; }
 IFS=$as_save_IFS
+if $as_found
+then :
+
+else $as_nop
+  if { test -f "$SHELL" || test -f "$SHELL.exe"; } &&
+	      as_run=a "$SHELL" -c "$as_bourne_compatible""$as_required" 2>/dev/null
+then :
+  CONFIG_SHELL=$SHELL as_have_required=yes
+fi
+fi
 
 
-      if test "x$CONFIG_SHELL" != x; then :
+      if test "x$CONFIG_SHELL" != x
+then :
   export CONFIG_SHELL
              # We cannot yet assume a decent shell, so we have to provide a
 # neutralization value for shells without unset; and this also
@@ -255,18 +254,19 @@ esac
 exec $CONFIG_SHELL $as_opts "$as_myself" ${1+"$@"}
 # Admittedly, this is quite paranoid, since all the known shells bail
 # out after a failed `exec'.
-$as_echo "$0: could not re-execute with $CONFIG_SHELL" >&2
+printf "%s\n" "$0: could not re-execute with $CONFIG_SHELL" >&2
 exit 255
 fi
 
-    if test x$as_have_required = xno; then :
-  $as_echo "$0: This script requires a shell more modern than all"
-  $as_echo "$0: the shells that I found on your system."
-  if test x${ZSH_VERSION+set} = xset ; then
-    $as_echo "$0: In particular, zsh $ZSH_VERSION has bugs and should"
-    $as_echo "$0: be upgraded to zsh 4.3.4 or later."
+    if test x$as_have_required = xno
+then :
+  printf "%s\n" "$0: This script requires a shell more modern than all"
+  printf "%s\n" "$0: the shells that I found on your system."
+  if test ${ZSH_VERSION+y} ; then
+    printf "%s\n" "$0: In particular, zsh $ZSH_VERSION has bugs and should"
+    printf "%s\n" "$0: be upgraded to zsh 4.3.4 or later."
   else
-    $as_echo "$0: Please tell bug-autoconf@gnu.org and
+    printf "%s\n" "$0: Please tell bug-autoconf@gnu.org and
 $0: xen-devel@lists.xen.org about your system, including
 $0: any error possibly output before this message. Then
 $0: install a modern shell, or manually run the script
@@ -294,6 +294,7 @@ as_fn_unset ()
 }
 as_unset=as_fn_unset
 
+
 # as_fn_set_status STATUS
 # -----------------------
 # Set $? to STATUS, without forking.
@@ -311,6 +312,14 @@ as_fn_exit ()
   as_fn_set_status $1
   exit $1
 } # as_fn_exit
+# as_fn_nop
+# ---------
+# Do nothing but, unlike ":", preserve the value of $?.
+as_fn_nop ()
+{
+  return $?
+}
+as_nop=as_fn_nop
 
 # as_fn_mkdir_p
 # -------------
@@ -325,7 +334,7 @@ as_fn_mkdir_p ()
     as_dirs=
     while :; do
       case $as_dir in #(
-      *\'*) as_qdir=`$as_echo "$as_dir" | sed "s/'/'\\\\\\\\''/g"`;; #'(
+      *\'*) as_qdir=`printf "%s\n" "$as_dir" | sed "s/'/'\\\\\\\\''/g"`;; #'(
       *) as_qdir=$as_dir;;
       esac
       as_dirs="'$as_qdir' $as_dirs"
@@ -334,7 +343,7 @@ $as_expr X"$as_dir" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
 	 X"$as_dir" : 'X\(//\)[^/]' \| \
 	 X"$as_dir" : 'X\(//\)$' \| \
 	 X"$as_dir" : 'X\(/\)' \| . 2>/dev/null ||
-$as_echo X"$as_dir" |
+printf "%s\n" X"$as_dir" |
     sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
 	    s//\1/
 	    q
@@ -373,12 +382,13 @@ as_fn_executable_p ()
 # advantage of any shell optimizations that allow amortized linear growth over
 # repeated appends, instead of the typical quadratic growth present in naive
 # implementations.
-if (eval "as_var=1; as_var+=2; test x\$as_var = x12") 2>/dev/null; then :
+if (eval "as_var=1; as_var+=2; test x\$as_var = x12") 2>/dev/null
+then :
   eval 'as_fn_append ()
   {
     eval $1+=\$2
   }'
-else
+else $as_nop
   as_fn_append ()
   {
     eval $1=\$$1\$2
@@ -390,18 +400,27 @@ fi # as_fn_append
 # Perform arithmetic evaluation on the ARGs, and store the result in the
 # global $as_val. Take advantage of shells that can avoid forks. The arguments
 # must be portable across $(()) and expr.
-if (eval "test \$(( 1 + 1 )) = 2") 2>/dev/null; then :
+if (eval "test \$(( 1 + 1 )) = 2") 2>/dev/null
+then :
   eval 'as_fn_arith ()
   {
     as_val=$(( $* ))
   }'
-else
+else $as_nop
   as_fn_arith ()
   {
     as_val=`expr "$@" || test $? -eq 1`
   }
 fi # as_fn_arith
 
+# as_fn_nop
+# ---------
+# Do nothing but, unlike ":", preserve the value of $?.
+as_fn_nop ()
+{
+  return $?
+}
+as_nop=as_fn_nop
 
 # as_fn_error STATUS ERROR [LINENO LOG_FD]
 # ----------------------------------------
@@ -413,9 +432,9 @@ as_fn_error ()
   as_status=$1; test $as_status -eq 0 && as_status=1
   if test "$4"; then
     as_lineno=${as_lineno-"$3"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
-    $as_echo "$as_me:${as_lineno-$LINENO}: error: $2" >&$4
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: $2" >&$4
   fi
-  $as_echo "$as_me: error: $2" >&2
+  printf "%s\n" "$as_me: error: $2" >&2
   as_fn_exit $as_status
 } # as_fn_error
 
@@ -442,7 +461,7 @@ as_me=`$as_basename -- "$0" ||
 $as_expr X/"$0" : '.*/\([^/][^/]*\)/*$' \| \
 	 X"$0" : 'X\(//\)$' \| \
 	 X"$0" : 'X\(/\)' \| . 2>/dev/null ||
-$as_echo X/"$0" |
+printf "%s\n" X/"$0" |
     sed '/^.*\/\([^/][^/]*\)\/*$/{
 	    s//\1/
 	    q
@@ -486,7 +505,7 @@ as_cr_alnum=$as_cr_Letters$as_cr_digits
       s/-\n.*//
     ' >$as_me.lineno &&
   chmod +x "$as_me.lineno" ||
-    { $as_echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2; as_fn_exit 1; }
+    { printf "%s\n" "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2; as_fn_exit 1; }
 
   # If we had to re-execute with $CONFIG_SHELL, we're ensured to have
   # already done that, so ensure we don't try to do so again and fall
@@ -500,6 +519,10 @@ as_cr_alnum=$as_cr_Letters$as_cr_digits
   exit
 }
 
+
+# Determine whether it's possible to make 'echo' print without a newline.
+# These variables are no longer used directly by Autoconf, but are AC_SUBSTed
+# for compatibility with existing Makefiles.
 ECHO_C= ECHO_N= ECHO_T=
 case `echo -n x` in #(((((
 -n*)
@@ -513,6 +536,13 @@ case `echo -n x` in #(((((
   ECHO_N='-n';;
 esac
 
+# For backward compatibility with old third-party macros, we provide
+# the shell variables $as_echo and $as_echo_n.  New code should use
+# AS_ECHO(["message"]) and AS_ECHO_N(["message"]), respectively.
+as_echo='printf %s\n'
+as_echo_n='printf %s'
+
+
 rm -f conf$$ conf$$.exe conf$$.file
 if test -d conf$$.dir; then
   rm -f conf$$.dir/conf$$.file
@@ -588,40 +618,36 @@ PACKAGE_URL='https://www.xen.org/'
 ac_unique_file="libs/light/libxl.c"
 # Factoring default headers for most tests.
 ac_includes_default="\
-#include <stdio.h>
-#ifdef HAVE_SYS_TYPES_H
-# include <sys/types.h>
-#endif
-#ifdef HAVE_SYS_STAT_H
-# include <sys/stat.h>
+#include <stddef.h>
+#ifdef HAVE_STDIO_H
+# include <stdio.h>
 #endif
-#ifdef STDC_HEADERS
+#ifdef HAVE_STDLIB_H
 # include <stdlib.h>
-# include <stddef.h>
-#else
-# ifdef HAVE_STDLIB_H
-#  include <stdlib.h>
-# endif
 #endif
 #ifdef HAVE_STRING_H
-# if !defined STDC_HEADERS && defined HAVE_MEMORY_H
-#  include <memory.h>
-# endif
 # include <string.h>
 #endif
-#ifdef HAVE_STRINGS_H
-# include <strings.h>
-#endif
 #ifdef HAVE_INTTYPES_H
 # include <inttypes.h>
 #endif
 #ifdef HAVE_STDINT_H
 # include <stdint.h>
 #endif
+#ifdef HAVE_STRINGS_H
+# include <strings.h>
+#endif
+#ifdef HAVE_SYS_TYPES_H
+# include <sys/types.h>
+#endif
+#ifdef HAVE_SYS_STAT_H
+# include <sys/stat.h>
+#endif
 #ifdef HAVE_UNISTD_H
 # include <unistd.h>
 #endif"
 
+ac_header_c_list=
 ac_subst_vars='LTLIBOBJS
 LIBOBJS
 pvshim
@@ -659,9 +685,6 @@ PKG_CONFIG
 TINFO_LIBS
 CURSES_LIBS
 PY_NOOPT_CFLAGS
-EGREP
-GREP
-CPP
 pyconfig
 PYTHONPATH
 BASH
@@ -852,7 +875,6 @@ LD86
 BCC
 IASL
 AWK
-CPP
 PKG_CONFIG
 PKG_CONFIG_PATH
 PKG_CONFIG_LIBDIR
@@ -934,8 +956,6 @@ do
   *)    ac_optarg=yes ;;
   esac
 
-  # Accept the important Cygnus configure options, so we can diagnose typos.
-
   case $ac_dashdash$ac_option in
   --)
     ac_dashdash=yes ;;
@@ -976,9 +996,9 @@ do
     ac_useropt=`expr "x$ac_option" : 'x-*disable-\(.*\)'`
     # Reject names that are not valid shell variable names.
     expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
-      as_fn_error $? "invalid feature name: $ac_useropt"
+      as_fn_error $? "invalid feature name: \`$ac_useropt'"
     ac_useropt_orig=$ac_useropt
-    ac_useropt=`$as_echo "$ac_useropt" | sed 's/[-+.]/_/g'`
+    ac_useropt=`printf "%s\n" "$ac_useropt" | sed 's/[-+.]/_/g'`
     case $ac_user_opts in
       *"
 "enable_$ac_useropt"
@@ -1002,9 +1022,9 @@ do
     ac_useropt=`expr "x$ac_option" : 'x-*enable-\([^=]*\)'`
     # Reject names that are not valid shell variable names.
     expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
-      as_fn_error $? "invalid feature name: $ac_useropt"
+      as_fn_error $? "invalid feature name: \`$ac_useropt'"
     ac_useropt_orig=$ac_useropt
-    ac_useropt=`$as_echo "$ac_useropt" | sed 's/[-+.]/_/g'`
+    ac_useropt=`printf "%s\n" "$ac_useropt" | sed 's/[-+.]/_/g'`
     case $ac_user_opts in
       *"
 "enable_$ac_useropt"
@@ -1215,9 +1235,9 @@ do
     ac_useropt=`expr "x$ac_option" : 'x-*with-\([^=]*\)'`
     # Reject names that are not valid shell variable names.
     expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
-      as_fn_error $? "invalid package name: $ac_useropt"
+      as_fn_error $? "invalid package name: \`$ac_useropt'"
     ac_useropt_orig=$ac_useropt
-    ac_useropt=`$as_echo "$ac_useropt" | sed 's/[-+.]/_/g'`
+    ac_useropt=`printf "%s\n" "$ac_useropt" | sed 's/[-+.]/_/g'`
     case $ac_user_opts in
       *"
 "with_$ac_useropt"
@@ -1231,9 +1251,9 @@ do
     ac_useropt=`expr "x$ac_option" : 'x-*without-\(.*\)'`
     # Reject names that are not valid shell variable names.
     expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
-      as_fn_error $? "invalid package name: $ac_useropt"
+      as_fn_error $? "invalid package name: \`$ac_useropt'"
     ac_useropt_orig=$ac_useropt
-    ac_useropt=`$as_echo "$ac_useropt" | sed 's/[-+.]/_/g'`
+    ac_useropt=`printf "%s\n" "$ac_useropt" | sed 's/[-+.]/_/g'`
     case $ac_user_opts in
       *"
 "with_$ac_useropt"
@@ -1277,9 +1297,9 @@ Try \`$0 --help' for more information"
 
   *)
     # FIXME: should be removed in autoconf 3.0.
-    $as_echo "$as_me: WARNING: you should use --build, --host, --target" >&2
+    printf "%s\n" "$as_me: WARNING: you should use --build, --host, --target" >&2
     expr "x$ac_option" : ".*[^-._$as_cr_alnum]" >/dev/null &&
-      $as_echo "$as_me: WARNING: invalid host type: $ac_option" >&2
+      printf "%s\n" "$as_me: WARNING: invalid host type: $ac_option" >&2
     : "${build_alias=$ac_option} ${host_alias=$ac_option} ${target_alias=$ac_option}"
     ;;
 
@@ -1295,7 +1315,7 @@ if test -n "$ac_unrecognized_opts"; then
   case $enable_option_checking in
     no) ;;
     fatal) as_fn_error $? "unrecognized options: $ac_unrecognized_opts" ;;
-    *)     $as_echo "$as_me: WARNING: unrecognized options: $ac_unrecognized_opts" >&2 ;;
+    *)     printf "%s\n" "$as_me: WARNING: unrecognized options: $ac_unrecognized_opts" >&2 ;;
   esac
 fi
 
@@ -1359,7 +1379,7 @@ $as_expr X"$as_myself" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
 	 X"$as_myself" : 'X\(//\)[^/]' \| \
 	 X"$as_myself" : 'X\(//\)$' \| \
 	 X"$as_myself" : 'X\(/\)' \| . 2>/dev/null ||
-$as_echo X"$as_myself" |
+printf "%s\n" X"$as_myself" |
     sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
 	    s//\1/
 	    q
@@ -1601,7 +1621,6 @@ Some influential environment variables:
   BCC         Path to bcc tool
   IASL        Path to iasl tool
   AWK         Path to awk tool
-  CPP         C preprocessor
   PKG_CONFIG  path to pkg-config utility
   PKG_CONFIG_PATH
               directories to add to pkg-config's search path
@@ -1644,9 +1663,9 @@ if test "$ac_init_help" = "recursive"; then
 case "$ac_dir" in
 .) ac_dir_suffix= ac_top_builddir_sub=. ac_top_build_prefix= ;;
 *)
-  ac_dir_suffix=/`$as_echo "$ac_dir" | sed 's|^\.[\\/]||'`
+  ac_dir_suffix=/`printf "%s\n" "$ac_dir" | sed 's|^\.[\\/]||'`
   # A ".." for each directory in $ac_dir_suffix.
-  ac_top_builddir_sub=`$as_echo "$ac_dir_suffix" | sed 's|/[^\\/]*|/..|g;s|/||'`
+  ac_top_builddir_sub=`printf "%s\n" "$ac_dir_suffix" | sed 's|/[^\\/]*|/..|g;s|/||'`
   case $ac_top_builddir_sub in
   "") ac_top_builddir_sub=. ac_top_build_prefix= ;;
   *)  ac_top_build_prefix=$ac_top_builddir_sub/ ;;
@@ -1674,7 +1693,8 @@ esac
 ac_abs_srcdir=$ac_abs_top_srcdir$ac_dir_suffix
 
     cd "$ac_dir" || { ac_status=$?; continue; }
-    # Check for guested configure.
+    # Check for configure.gnu first; this name is used for a wrapper for
+    # Metaconfig's "Configure" on case-insensitive file systems.
     if test -f "$ac_srcdir/configure.gnu"; then
       echo &&
       $SHELL "$ac_srcdir/configure.gnu" --help=recursive
@@ -1682,7 +1702,7 @@ ac_abs_srcdir=$ac_abs_top_srcdir$ac_dir_suffix
       echo &&
       $SHELL "$ac_srcdir/configure" --help=recursive
     else
-      $as_echo "$as_me: WARNING: no configuration information is in $ac_dir" >&2
+      printf "%s\n" "$as_me: WARNING: no configuration information is in $ac_dir" >&2
     fi || ac_status=$?
     cd "$ac_pwd" || { ac_status=$?; break; }
   done
@@ -1692,9 +1712,9 @@ test -n "$ac_init_help" && exit $ac_status
 if $ac_init_version; then
   cat <<\_ACEOF
 Xen Hypervisor Tools configure 4.18
-generated by GNU Autoconf 2.69
+generated by GNU Autoconf 2.71
 
-Copyright (C) 2012 Free Software Foundation, Inc.
+Copyright (C) 2021 Free Software Foundation, Inc.
 This configure script is free software; the Free Software Foundation
 gives unlimited permission to copy, distribute and modify it.
 _ACEOF
@@ -1711,14 +1731,14 @@ fi
 ac_fn_c_try_compile ()
 {
   as_lineno=${as_lineno-"$1"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
-  rm -f conftest.$ac_objext
+  rm -f conftest.$ac_objext conftest.beam
   if { { ac_try="$ac_compile"
 case "(($ac_try" in
   *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
   *) ac_try_echo=$ac_try;;
 esac
 eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
+printf "%s\n" "$ac_try_echo"; } >&5
   (eval "$ac_compile") 2>conftest.err
   ac_status=$?
   if test -s conftest.err; then
@@ -1726,14 +1746,15 @@ $as_echo "$ac_try_echo"; } >&5
     cat conftest.er1 >&5
     mv -f conftest.er1 conftest.err
   fi
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; } && {
 	 test -z "$ac_c_werror_flag" ||
 	 test ! -s conftest.err
-       } && test -s conftest.$ac_objext; then :
+       } && test -s conftest.$ac_objext
+then :
   ac_retval=0
-else
-  $as_echo "$as_me: failed program was:" >&5
+else $as_nop
+  printf "%s\n" "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
 	ac_retval=1
@@ -1749,14 +1770,14 @@ fi
 ac_fn_c_try_link ()
 {
   as_lineno=${as_lineno-"$1"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
-  rm -f conftest.$ac_objext conftest$ac_exeext
+  rm -f conftest.$ac_objext conftest.beam conftest$ac_exeext
   if { { ac_try="$ac_link"
 case "(($ac_try" in
   *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
   *) ac_try_echo=$ac_try;;
 esac
 eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
+printf "%s\n" "$ac_try_echo"; } >&5
   (eval "$ac_link") 2>conftest.err
   ac_status=$?
   if test -s conftest.err; then
@@ -1764,17 +1785,18 @@ $as_echo "$ac_try_echo"; } >&5
     cat conftest.er1 >&5
     mv -f conftest.er1 conftest.err
   fi
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; } && {
 	 test -z "$ac_c_werror_flag" ||
 	 test ! -s conftest.err
        } && test -s conftest$ac_exeext && {
 	 test "$cross_compiling" = yes ||
 	 test -x conftest$ac_exeext
-       }; then :
+       }
+then :
   ac_retval=0
-else
-  $as_echo "$as_me: failed program was:" >&5
+else $as_nop
+  printf "%s\n" "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
 	ac_retval=1
@@ -1789,176 +1811,6 @@ fi
 
 } # ac_fn_c_try_link
 
-# ac_fn_c_try_cpp LINENO
-# ----------------------
-# Try to preprocess conftest.$ac_ext, and return whether this succeeded.
-ac_fn_c_try_cpp ()
-{
-  as_lineno=${as_lineno-"$1"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
-  if { { ac_try="$ac_cpp conftest.$ac_ext"
-case "(($ac_try" in
-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
-  *) ac_try_echo=$ac_try;;
-esac
-eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
-  (eval "$ac_cpp conftest.$ac_ext") 2>conftest.err
-  ac_status=$?
-  if test -s conftest.err; then
-    grep -v '^ *+' conftest.err >conftest.er1
-    cat conftest.er1 >&5
-    mv -f conftest.er1 conftest.err
-  fi
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; } > conftest.i && {
-	 test -z "$ac_c_preproc_warn_flag$ac_c_werror_flag" ||
-	 test ! -s conftest.err
-       }; then :
-  ac_retval=0
-else
-  $as_echo "$as_me: failed program was:" >&5
-sed 's/^/| /' conftest.$ac_ext >&5
-
-    ac_retval=1
-fi
-  eval $as_lineno_stack; ${as_lineno_stack:+:} unset as_lineno
-  as_fn_set_status $ac_retval
-
-} # ac_fn_c_try_cpp
-
-# ac_fn_c_check_header_mongrel LINENO HEADER VAR INCLUDES
-# -------------------------------------------------------
-# Tests whether HEADER exists, giving a warning if it cannot be compiled using
-# the include files in INCLUDES and setting the cache variable VAR
-# accordingly.
-ac_fn_c_check_header_mongrel ()
-{
-  as_lineno=${as_lineno-"$1"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
-  if eval \${$3+:} false; then :
-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $2" >&5
-$as_echo_n "checking for $2... " >&6; }
-if eval \${$3+:} false; then :
-  $as_echo_n "(cached) " >&6
-fi
-eval ac_res=\$$3
-	       { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
-$as_echo "$ac_res" >&6; }
-else
-  # Is the header compilable?
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking $2 usability" >&5
-$as_echo_n "checking $2 usability... " >&6; }
-cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-$4
-#include <$2>
-_ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
-  ac_header_compiler=yes
-else
-  ac_header_compiler=no
-fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_header_compiler" >&5
-$as_echo "$ac_header_compiler" >&6; }
-
-# Is the header present?
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking $2 presence" >&5
-$as_echo_n "checking $2 presence... " >&6; }
-cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-#include <$2>
-_ACEOF
-if ac_fn_c_try_cpp "$LINENO"; then :
-  ac_header_preproc=yes
-else
-  ac_header_preproc=no
-fi
-rm -f conftest.err conftest.i conftest.$ac_ext
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_header_preproc" >&5
-$as_echo "$ac_header_preproc" >&6; }
-
-# So?  What about this header?
-case $ac_header_compiler:$ac_header_preproc:$ac_c_preproc_warn_flag in #((
-  yes:no: )
-    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: $2: accepted by the compiler, rejected by the preprocessor!" >&5
-$as_echo "$as_me: WARNING: $2: accepted by the compiler, rejected by the preprocessor!" >&2;}
-    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: $2: proceeding with the compiler's result" >&5
-$as_echo "$as_me: WARNING: $2: proceeding with the compiler's result" >&2;}
-    ;;
-  no:yes:* )
-    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: $2: present but cannot be compiled" >&5
-$as_echo "$as_me: WARNING: $2: present but cannot be compiled" >&2;}
-    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: $2:     check for missing prerequisite headers?" >&5
-$as_echo "$as_me: WARNING: $2:     check for missing prerequisite headers?" >&2;}
-    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: $2: see the Autoconf documentation" >&5
-$as_echo "$as_me: WARNING: $2: see the Autoconf documentation" >&2;}
-    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: $2:     section \"Present But Cannot Be Compiled\"" >&5
-$as_echo "$as_me: WARNING: $2:     section \"Present But Cannot Be Compiled\"" >&2;}
-    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: $2: proceeding with the compiler's result" >&5
-$as_echo "$as_me: WARNING: $2: proceeding with the compiler's result" >&2;}
-( $as_echo "## -------------------------------------- ##
-## Report this to xen-devel@lists.xen.org ##
-## -------------------------------------- ##"
-     ) | sed "s/^/$as_me: WARNING:     /" >&2
-    ;;
-esac
-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $2" >&5
-$as_echo_n "checking for $2... " >&6; }
-if eval \${$3+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
-  eval "$3=\$ac_header_compiler"
-fi
-eval ac_res=\$$3
-	       { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
-$as_echo "$ac_res" >&6; }
-fi
-  eval $as_lineno_stack; ${as_lineno_stack:+:} unset as_lineno
-
-} # ac_fn_c_check_header_mongrel
-
-# ac_fn_c_try_run LINENO
-# ----------------------
-# Try to link conftest.$ac_ext, and return whether this succeeded. Assumes
-# that executables *can* be run.
-ac_fn_c_try_run ()
-{
-  as_lineno=${as_lineno-"$1"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
-  if { { ac_try="$ac_link"
-case "(($ac_try" in
-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
-  *) ac_try_echo=$ac_try;;
-esac
-eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
-  (eval "$ac_link") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; } && { ac_try='./conftest$ac_exeext'
-  { { case "(($ac_try" in
-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
-  *) ac_try_echo=$ac_try;;
-esac
-eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
-  (eval "$ac_try") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; }; then :
-  ac_retval=0
-else
-  $as_echo "$as_me: program exited with status $ac_status" >&5
-       $as_echo "$as_me: failed program was:" >&5
-sed 's/^/| /' conftest.$ac_ext >&5
-
-       ac_retval=$ac_status
-fi
-  rm -rf conftest.dSYM conftest_ipa8_conftest.oo
-  eval $as_lineno_stack; ${as_lineno_stack:+:} unset as_lineno
-  as_fn_set_status $ac_retval
-
-} # ac_fn_c_try_run
-
 # ac_fn_c_check_header_compile LINENO HEADER VAR INCLUDES
 # -------------------------------------------------------
 # Tests whether HEADER exists and can be compiled using the include files in
@@ -1966,26 +1818,28 @@ fi
 ac_fn_c_check_header_compile ()
 {
   as_lineno=${as_lineno-"$1"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $2" >&5
-$as_echo_n "checking for $2... " >&6; }
-if eval \${$3+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $2" >&5
+printf %s "checking for $2... " >&6; }
+if eval test \${$3+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 $4
 #include <$2>
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   eval "$3=yes"
-else
+else $as_nop
   eval "$3=no"
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
 fi
 eval ac_res=\$$3
-	       { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
-$as_echo "$ac_res" >&6; }
+	       { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
+printf "%s\n" "$ac_res" >&6; }
   eval $as_lineno_stack; ${as_lineno_stack:+:} unset as_lineno
 
 } # ac_fn_c_check_header_compile
@@ -1996,11 +1850,12 @@ $as_echo "$ac_res" >&6; }
 ac_fn_c_check_func ()
 {
   as_lineno=${as_lineno-"$1"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $2" >&5
-$as_echo_n "checking for $2... " >&6; }
-if eval \${$3+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $2" >&5
+printf %s "checking for $2... " >&6; }
+if eval test \${$3+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 /* Define $2 to an innocuous variant, in case <limits.h> declares $2.
@@ -2008,16 +1863,9 @@ else
 #define $2 innocuous_$2
 
 /* System header to define __stub macros and hopefully few prototypes,
-    which can conflict with char $2 (); below.
-    Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
-    <limits.h> exists even on freestanding compilers.  */
-
-#ifdef __STDC__
-# include <limits.h>
-#else
-# include <assert.h>
-#endif
+   which can conflict with char $2 (); below.  */
 
+#include <limits.h>
 #undef $2
 
 /* Override any GCC internal prototype to avoid an error.
@@ -2035,47 +1883,51 @@ choke me
 #endif
 
 int
-main ()
+main (void)
 {
 return $2 ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   eval "$3=yes"
-else
+else $as_nop
   eval "$3=no"
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 fi
 eval ac_res=\$$3
-	       { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
-$as_echo "$ac_res" >&6; }
+	       { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
+printf "%s\n" "$ac_res" >&6; }
   eval $as_lineno_stack; ${as_lineno_stack:+:} unset as_lineno
 
 } # ac_fn_c_check_func
 
-# ac_fn_c_check_decl LINENO SYMBOL VAR INCLUDES
-# ---------------------------------------------
+# ac_fn_check_decl LINENO SYMBOL VAR INCLUDES EXTRA-OPTIONS FLAG-VAR
+# ------------------------------------------------------------------
 # Tests whether SYMBOL is declared in INCLUDES, setting cache variable VAR
-# accordingly.
-ac_fn_c_check_decl ()
+# accordingly. Pass EXTRA-OPTIONS to the compiler, using FLAG-VAR.
+ac_fn_check_decl ()
 {
   as_lineno=${as_lineno-"$1"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
   as_decl_name=`echo $2|sed 's/ *(.*//'`
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking whether $as_decl_name is declared" >&5
+printf %s "checking whether $as_decl_name is declared... " >&6; }
+if eval test \${$3+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   as_decl_use=`echo $2|sed -e 's/(/((/' -e 's/)/) 0&/' -e 's/,/) 0& (/g'`
-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether $as_decl_name is declared" >&5
-$as_echo_n "checking whether $as_decl_name is declared... " >&6; }
-if eval \${$3+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+  eval ac_save_FLAGS=\$$6
+  as_fn_append $6 " $5"
   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 $4
 int
-main ()
+main (void)
 {
 #ifndef $as_decl_name
 #ifdef __cplusplus
@@ -2089,27 +1941,50 @@ main ()
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   eval "$3=yes"
-else
+else $as_nop
   eval "$3=no"
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
+  eval $6=\$ac_save_FLAGS
+
 fi
 eval ac_res=\$$3
-	       { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
-$as_echo "$ac_res" >&6; }
+	       { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
+printf "%s\n" "$ac_res" >&6; }
   eval $as_lineno_stack; ${as_lineno_stack:+:} unset as_lineno
 
-} # ac_fn_c_check_decl
+} # ac_fn_check_decl
+ac_configure_args_raw=
+for ac_arg
+do
+  case $ac_arg in
+  *\'*)
+    ac_arg=`printf "%s\n" "$ac_arg" | sed "s/'/'\\\\\\\\''/g"` ;;
+  esac
+  as_fn_append ac_configure_args_raw " '$ac_arg'"
+done
+
+case $ac_configure_args_raw in
+  *$as_nl*)
+    ac_safe_unquote= ;;
+  *)
+    ac_unsafe_z='|&;<>()$`\\"*?[ ''	' # This string ends in space, tab.
+    ac_unsafe_a="$ac_unsafe_z#~"
+    ac_safe_unquote="s/ '\\([^$ac_unsafe_a][^$ac_unsafe_z]*\\)'/ \\1/g"
+    ac_configure_args_raw=`      printf "%s\n" "$ac_configure_args_raw" | sed "$ac_safe_unquote"`;;
+esac
+
 cat >config.log <<_ACEOF
 This file contains any messages produced by compilers while
 running configure, to aid debugging if configure makes a mistake.
 
 It was created by Xen Hypervisor Tools $as_me 4.18, which was
-generated by GNU Autoconf 2.69.  Invocation command line was
+generated by GNU Autoconf 2.71.  Invocation command line was
 
-  $ $0 $@
+  $ $0$ac_configure_args_raw
 
 _ACEOF
 exec 5>>config.log
@@ -2142,8 +2017,12 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-    $as_echo "PATH: $as_dir"
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
+    printf "%s\n" "PATH: $as_dir"
   done
 IFS=$as_save_IFS
 
@@ -2178,7 +2057,7 @@ do
     | -silent | --silent | --silen | --sile | --sil)
       continue ;;
     *\'*)
-      ac_arg=`$as_echo "$ac_arg" | sed "s/'/'\\\\\\\\''/g"` ;;
+      ac_arg=`printf "%s\n" "$ac_arg" | sed "s/'/'\\\\\\\\''/g"` ;;
     esac
     case $ac_pass in
     1) as_fn_append ac_configure_args0 " '$ac_arg'" ;;
@@ -2213,11 +2092,13 @@ done
 # WARNING: Use '\'' to represent an apostrophe within the trap.
 # WARNING: Do not start the trap code with a newline, due to a FreeBSD 4.0 bug.
 trap 'exit_status=$?
+  # Sanitize IFS.
+  IFS=" ""	$as_nl"
   # Save into config.log some information that might help in debugging.
   {
     echo
 
-    $as_echo "## ---------------- ##
+    printf "%s\n" "## ---------------- ##
 ## Cache variables. ##
 ## ---------------- ##"
     echo
@@ -2228,8 +2109,8 @@ trap 'exit_status=$?
     case $ac_val in #(
     *${as_nl}*)
       case $ac_var in #(
-      *_cv_*) { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: cache variable $ac_var contains a newline" >&5
-$as_echo "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
+      *_cv_*) { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: cache variable $ac_var contains a newline" >&5
+printf "%s\n" "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
       esac
       case $ac_var in #(
       _ | IFS | as_nl) ;; #(
@@ -2253,7 +2134,7 @@ $as_echo "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
 )
     echo
 
-    $as_echo "## ----------------- ##
+    printf "%s\n" "## ----------------- ##
 ## Output variables. ##
 ## ----------------- ##"
     echo
@@ -2261,14 +2142,14 @@ $as_echo "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
     do
       eval ac_val=\$$ac_var
       case $ac_val in
-      *\'\''*) ac_val=`$as_echo "$ac_val" | sed "s/'\''/'\''\\\\\\\\'\'''\''/g"`;;
+      *\'\''*) ac_val=`printf "%s\n" "$ac_val" | sed "s/'\''/'\''\\\\\\\\'\'''\''/g"`;;
       esac
-      $as_echo "$ac_var='\''$ac_val'\''"
+      printf "%s\n" "$ac_var='\''$ac_val'\''"
     done | sort
     echo
 
     if test -n "$ac_subst_files"; then
-      $as_echo "## ------------------- ##
+      printf "%s\n" "## ------------------- ##
 ## File substitutions. ##
 ## ------------------- ##"
       echo
@@ -2276,15 +2157,15 @@ $as_echo "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
       do
 	eval ac_val=\$$ac_var
 	case $ac_val in
-	*\'\''*) ac_val=`$as_echo "$ac_val" | sed "s/'\''/'\''\\\\\\\\'\'''\''/g"`;;
+	*\'\''*) ac_val=`printf "%s\n" "$ac_val" | sed "s/'\''/'\''\\\\\\\\'\'''\''/g"`;;
 	esac
-	$as_echo "$ac_var='\''$ac_val'\''"
+	printf "%s\n" "$ac_var='\''$ac_val'\''"
       done | sort
       echo
     fi
 
     if test -s confdefs.h; then
-      $as_echo "## ----------- ##
+      printf "%s\n" "## ----------- ##
 ## confdefs.h. ##
 ## ----------- ##"
       echo
@@ -2292,8 +2173,8 @@ $as_echo "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
       echo
     fi
     test "$ac_signal" != 0 &&
-      $as_echo "$as_me: caught signal $ac_signal"
-    $as_echo "$as_me: exit $exit_status"
+      printf "%s\n" "$as_me: caught signal $ac_signal"
+    printf "%s\n" "$as_me: exit $exit_status"
   } >&5
   rm -f core *.core core.conftest.* &&
     rm -f -r conftest* confdefs* conf$$* $ac_clean_files &&
@@ -2307,63 +2188,48 @@ ac_signal=0
 # confdefs.h avoids OS command line length limits that DEFS can exceed.
 rm -f -r conftest* confdefs.h
 
-$as_echo "/* confdefs.h */" > confdefs.h
+printf "%s\n" "/* confdefs.h */" > confdefs.h
 
 # Predefined preprocessor variables.
 
-cat >>confdefs.h <<_ACEOF
-#define PACKAGE_NAME "$PACKAGE_NAME"
-_ACEOF
+printf "%s\n" "#define PACKAGE_NAME \"$PACKAGE_NAME\"" >>confdefs.h
 
-cat >>confdefs.h <<_ACEOF
-#define PACKAGE_TARNAME "$PACKAGE_TARNAME"
-_ACEOF
+printf "%s\n" "#define PACKAGE_TARNAME \"$PACKAGE_TARNAME\"" >>confdefs.h
 
-cat >>confdefs.h <<_ACEOF
-#define PACKAGE_VERSION "$PACKAGE_VERSION"
-_ACEOF
+printf "%s\n" "#define PACKAGE_VERSION \"$PACKAGE_VERSION\"" >>confdefs.h
 
-cat >>confdefs.h <<_ACEOF
-#define PACKAGE_STRING "$PACKAGE_STRING"
-_ACEOF
+printf "%s\n" "#define PACKAGE_STRING \"$PACKAGE_STRING\"" >>confdefs.h
 
-cat >>confdefs.h <<_ACEOF
-#define PACKAGE_BUGREPORT "$PACKAGE_BUGREPORT"
-_ACEOF
+printf "%s\n" "#define PACKAGE_BUGREPORT \"$PACKAGE_BUGREPORT\"" >>confdefs.h
 
-cat >>confdefs.h <<_ACEOF
-#define PACKAGE_URL "$PACKAGE_URL"
-_ACEOF
+printf "%s\n" "#define PACKAGE_URL \"$PACKAGE_URL\"" >>confdefs.h
 
 
 # Let the site file select an alternate cache file if it wants to.
 # Prefer an explicitly selected file to automatically selected ones.
-ac_site_file1=NONE
-ac_site_file2=NONE
 if test -n "$CONFIG_SITE"; then
-  # We do not want a PATH search for config.site.
-  case $CONFIG_SITE in #((
-    -*)  ac_site_file1=./$CONFIG_SITE;;
-    */*) ac_site_file1=$CONFIG_SITE;;
-    *)   ac_site_file1=./$CONFIG_SITE;;
-  esac
+  ac_site_files="$CONFIG_SITE"
 elif test "x$prefix" != xNONE; then
-  ac_site_file1=$prefix/share/config.site
-  ac_site_file2=$prefix/etc/config.site
+  ac_site_files="$prefix/share/config.site $prefix/etc/config.site"
 else
-  ac_site_file1=$ac_default_prefix/share/config.site
-  ac_site_file2=$ac_default_prefix/etc/config.site
+  ac_site_files="$ac_default_prefix/share/config.site $ac_default_prefix/etc/config.site"
 fi
-for ac_site_file in "$ac_site_file1" "$ac_site_file2"
+
+for ac_site_file in $ac_site_files
 do
-  test "x$ac_site_file" = xNONE && continue
-  if test /dev/null != "$ac_site_file" && test -r "$ac_site_file"; then
-    { $as_echo "$as_me:${as_lineno-$LINENO}: loading site script $ac_site_file" >&5
-$as_echo "$as_me: loading site script $ac_site_file" >&6;}
+  case $ac_site_file in #(
+  */*) :
+     ;; #(
+  *) :
+    ac_site_file=./$ac_site_file ;;
+esac
+  if test -f "$ac_site_file" && test -r "$ac_site_file"; then
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: loading site script $ac_site_file" >&5
+printf "%s\n" "$as_me: loading site script $ac_site_file" >&6;}
     sed 's/^/| /' "$ac_site_file" >&5
     . "$ac_site_file" \
-      || { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+      || { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error $? "failed to load site script $ac_site_file
 See \`config.log' for more details" "$LINENO" 5; }
   fi
@@ -2373,155 +2239,548 @@ if test -r "$cache_file"; then
   # Some versions of bash will fail to source /dev/null (special files
   # actually), so we avoid doing that.  DJGPP emulates it as a regular file.
   if test /dev/null != "$cache_file" && test -f "$cache_file"; then
-    { $as_echo "$as_me:${as_lineno-$LINENO}: loading cache $cache_file" >&5
-$as_echo "$as_me: loading cache $cache_file" >&6;}
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: loading cache $cache_file" >&5
+printf "%s\n" "$as_me: loading cache $cache_file" >&6;}
     case $cache_file in
       [\\/]* | ?:[\\/]* ) . "$cache_file";;
       *)                      . "./$cache_file";;
     esac
   fi
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: creating cache $cache_file" >&5
-$as_echo "$as_me: creating cache $cache_file" >&6;}
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: creating cache $cache_file" >&5
+printf "%s\n" "$as_me: creating cache $cache_file" >&6;}
   >$cache_file
 fi
 
-# Check that the precious variables saved in the cache have kept the same
-# value.
-ac_cache_corrupted=false
-for ac_var in $ac_precious_vars; do
-  eval ac_old_set=\$ac_cv_env_${ac_var}_set
-  eval ac_new_set=\$ac_env_${ac_var}_set
-  eval ac_old_val=\$ac_cv_env_${ac_var}_value
-  eval ac_new_val=\$ac_env_${ac_var}_value
-  case $ac_old_set,$ac_new_set in
-    set,)
-      { $as_echo "$as_me:${as_lineno-$LINENO}: error: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&5
-$as_echo "$as_me: error: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&2;}
-      ac_cache_corrupted=: ;;
-    ,set)
-      { $as_echo "$as_me:${as_lineno-$LINENO}: error: \`$ac_var' was not set in the previous run" >&5
-$as_echo "$as_me: error: \`$ac_var' was not set in the previous run" >&2;}
-      ac_cache_corrupted=: ;;
-    ,);;
-    *)
-      if test "x$ac_old_val" != "x$ac_new_val"; then
-	# differences in whitespace do not lead to failure.
-	ac_old_val_w=`echo x $ac_old_val`
-	ac_new_val_w=`echo x $ac_new_val`
-	if test "$ac_old_val_w" != "$ac_new_val_w"; then
-	  { $as_echo "$as_me:${as_lineno-$LINENO}: error: \`$ac_var' has changed since the previous run:" >&5
-$as_echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
-	  ac_cache_corrupted=:
-	else
-	  { $as_echo "$as_me:${as_lineno-$LINENO}: warning: ignoring whitespace changes in \`$ac_var' since the previous run:" >&5
-$as_echo "$as_me: warning: ignoring whitespace changes in \`$ac_var' since the previous run:" >&2;}
-	  eval $ac_var=\$ac_old_val
-	fi
-	{ $as_echo "$as_me:${as_lineno-$LINENO}:   former value:  \`$ac_old_val'" >&5
-$as_echo "$as_me:   former value:  \`$ac_old_val'" >&2;}
-	{ $as_echo "$as_me:${as_lineno-$LINENO}:   current value: \`$ac_new_val'" >&5
-$as_echo "$as_me:   current value: \`$ac_new_val'" >&2;}
-      fi;;
-  esac
-  # Pass precious variables to config.status.
-  if test "$ac_new_set" = set; then
-    case $ac_new_val in
-    *\'*) ac_arg=$ac_var=`$as_echo "$ac_new_val" | sed "s/'/'\\\\\\\\''/g"` ;;
-    *) ac_arg=$ac_var=$ac_new_val ;;
-    esac
-    case " $ac_configure_args " in
-      *" '$ac_arg' "*) ;; # Avoid dups.  Use of quotes ensures accuracy.
-      *) as_fn_append ac_configure_args " '$ac_arg'" ;;
-    esac
-  fi
-done
-if $ac_cache_corrupted; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
-  { $as_echo "$as_me:${as_lineno-$LINENO}: error: changes in the environment can compromise the build" >&5
-$as_echo "$as_me: error: changes in the environment can compromise the build" >&2;}
-  as_fn_error $? "run \`make distclean' and/or \`rm $cache_file' and start over" "$LINENO" 5
-fi
-## -------------------- ##
-## Main body of script. ##
-## -------------------- ##
+# Test code for whether the C compiler supports C89 (global declarations)
+ac_c_conftest_c89_globals='
+/* Does the compiler advertise C89 conformance?
+   Do not test the value of __STDC__, because some compilers set it to 0
+   while being otherwise adequately conformant. */
+#if !defined __STDC__
+# error "Compiler does not advertise C89 conformance"
+#endif
 
-ac_ext=c
-ac_cpp='$CPP $CPPFLAGS'
-ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-ac_compiler_gnu=$ac_cv_c_compiler_gnu
+#include <stddef.h>
+#include <stdarg.h>
+struct stat;
+/* Most of the following tests are stolen from RCS 5.7 src/conf.sh.  */
+struct buf { int x; };
+struct buf * (*rcsopen) (struct buf *, struct stat *, int);
+static char *e (p, i)
+     char **p;
+     int i;
+{
+  return p[i];
+}
+static char *f (char * (*g) (char **, int), char **p, ...)
+{
+  char *s;
+  va_list v;
+  va_start (v,p);
+  s = g (p, va_arg (v,int));
+  va_end (v);
+  return s;
+}
 
+/* OSF 4.0 Compaq cc is some sort of almost-ANSI by default.  It has
+   function prototypes and stuff, but not \xHH hex character constants.
+   These do not provoke an error unfortunately, instead are silently treated
+   as an "x".  The following induces an error, until -std is added to get
+   proper ANSI mode.  Curiously \x00 != x always comes out true, for an
+   array size at least.  It is necessary to write \x00 == 0 to get something
+   that is true only with -std.  */
+int osf4_cc_array ['\''\x00'\'' == 0 ? 1 : -1];
 
+/* IBM C 6 for AIX is almost-ANSI by default, but it replaces macro parameters
+   inside strings and character constants.  */
+#define FOO(x) '\''x'\''
+int xlc6_cc_array[FOO(a) == '\''x'\'' ? 1 : -1];
 
-ac_config_files="$ac_config_files ../config/Tools.mk hotplug/common/hotplugpath.sh hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/libs/xs/paths.ml ocaml/xenstored/paths.ml ocaml/xenstored/oxenstored.conf"
+int test (int i, double x);
+struct s1 {int (*f) (int a);};
+struct s2 {int (*f) (double a);};
+int pairnames (int, char **, int *(*)(struct buf *, struct stat *, int),
+               int, int);'
 
-ac_config_headers="$ac_config_headers config.h"
+# Test code for whether the C compiler supports C89 (body of main).
+ac_c_conftest_c89_main='
+ok |= (argc == 0 || f (e, argv, 0) != argv[0] || f (e, argv, 1) != argv[1]);
+'
 
-ac_aux_dir=
-for ac_dir in ../ "$srcdir"/../; do
-  if test -f "$ac_dir/install-sh"; then
-    ac_aux_dir=$ac_dir
-    ac_install_sh="$ac_aux_dir/install-sh -c"
-    break
-  elif test -f "$ac_dir/install.sh"; then
-    ac_aux_dir=$ac_dir
-    ac_install_sh="$ac_aux_dir/install.sh -c"
-    break
-  elif test -f "$ac_dir/shtool"; then
-    ac_aux_dir=$ac_dir
-    ac_install_sh="$ac_aux_dir/shtool install -c"
+# Test code for whether the C compiler supports C99 (global declarations)
+ac_c_conftest_c99_globals='
+// Does the compiler advertise C99 conformance?
+#if !defined __STDC_VERSION__ || __STDC_VERSION__ < 199901L
+# error "Compiler does not advertise C99 conformance"
+#endif
+
+#include <stdbool.h>
+extern int puts (const char *);
+extern int printf (const char *, ...);
+extern int dprintf (int, const char *, ...);
+extern void *malloc (size_t);
+
+// Check varargs macros.  These examples are taken from C99 6.10.3.5.
+// dprintf is used instead of fprintf to avoid needing to declare
+// FILE and stderr.
+#define debug(...) dprintf (2, __VA_ARGS__)
+#define showlist(...) puts (#__VA_ARGS__)
+#define report(test,...) ((test) ? puts (#test) : printf (__VA_ARGS__))
+static void
+test_varargs_macros (void)
+{
+  int x = 1234;
+  int y = 5678;
+  debug ("Flag");
+  debug ("X = %d\n", x);
+  showlist (The first, second, and third items.);
+  report (x>y, "x is %d but y is %d", x, y);
+}
+
+// Check long long types.
+#define BIG64 18446744073709551615ull
+#define BIG32 4294967295ul
+#define BIG_OK (BIG64 / BIG32 == 4294967297ull && BIG64 % BIG32 == 0)
+#if !BIG_OK
+  #error "your preprocessor is broken"
+#endif
+#if BIG_OK
+#else
+  #error "your preprocessor is broken"
+#endif
+static long long int bignum = -9223372036854775807LL;
+static unsigned long long int ubignum = BIG64;
+
+struct incomplete_array
+{
+  int datasize;
+  double data[];
+};
+
+struct named_init {
+  int number;
+  const wchar_t *name;
+  double average;
+};
+
+typedef const char *ccp;
+
+static inline int
+test_restrict (ccp restrict text)
+{
+  // See if C++-style comments work.
+  // Iterate through items via the restricted pointer.
+  // Also check for declarations in for loops.
+  for (unsigned int i = 0; *(text+i) != '\''\0'\''; ++i)
+    continue;
+  return 0;
+}
+
+// Check varargs and va_copy.
+static bool
+test_varargs (const char *format, ...)
+{
+  va_list args;
+  va_start (args, format);
+  va_list args_copy;
+  va_copy (args_copy, args);
+
+  const char *str = "";
+  int number = 0;
+  float fnumber = 0;
+
+  while (*format)
+    {
+      switch (*format++)
+	{
+	case '\''s'\'': // string
+	  str = va_arg (args_copy, const char *);
+	  break;
+	case '\''d'\'': // int
+	  number = va_arg (args_copy, int);
+	  break;
+	case '\''f'\'': // float
+	  fnumber = va_arg (args_copy, double);
+	  break;
+	default:
+	  break;
+	}
+    }
+  va_end (args_copy);
+  va_end (args);
+
+  return *str && number && fnumber;
+}
+'
+
+# Test code for whether the C compiler supports C99 (body of main).
+ac_c_conftest_c99_main='
+  // Check bool.
+  _Bool success = false;
+  success |= (argc != 0);
+
+  // Check restrict.
+  if (test_restrict ("String literal") == 0)
+    success = true;
+  char *restrict newvar = "Another string";
+
+  // Check varargs.
+  success &= test_varargs ("s, d'\'' f .", "string", 65, 34.234);
+  test_varargs_macros ();
+
+  // Check flexible array members.
+  struct incomplete_array *ia =
+    malloc (sizeof (struct incomplete_array) + (sizeof (double) * 10));
+  ia->datasize = 10;
+  for (int i = 0; i < ia->datasize; ++i)
+    ia->data[i] = i * 1.234;
+
+  // Check named initializers.
+  struct named_init ni = {
+    .number = 34,
+    .name = L"Test wide string",
+    .average = 543.34343,
+  };
+
+  ni.number = 58;
+
+  int dynamic_array[ni.number];
+  dynamic_array[0] = argv[0][0];
+  dynamic_array[ni.number - 1] = 543;
+
+  // work around unused variable warnings
+  ok |= (!success || bignum == 0LL || ubignum == 0uLL || newvar[0] == '\''x'\''
+	 || dynamic_array[ni.number - 1] != 543);
+'
+
+# Test code for whether the C compiler supports C11 (global declarations)
+ac_c_conftest_c11_globals='
+// Does the compiler advertise C11 conformance?
+#if !defined __STDC_VERSION__ || __STDC_VERSION__ < 201112L
+# error "Compiler does not advertise C11 conformance"
+#endif
+
+// Check _Alignas.
+char _Alignas (double) aligned_as_double;
+char _Alignas (0) no_special_alignment;
+extern char aligned_as_int;
+char _Alignas (0) _Alignas (int) aligned_as_int;
+
+// Check _Alignof.
+enum
+{
+  int_alignment = _Alignof (int),
+  int_array_alignment = _Alignof (int[100]),
+  char_alignment = _Alignof (char)
+};
+_Static_assert (0 < -_Alignof (int), "_Alignof is signed");
+
+// Check _Noreturn.
+int _Noreturn does_not_return (void) { for (;;) continue; }
+
+// Check _Static_assert.
+struct test_static_assert
+{
+  int x;
+  _Static_assert (sizeof (int) <= sizeof (long int),
+                  "_Static_assert does not work in struct");
+  long int y;
+};
+
+// Check UTF-8 literals.
+#define u8 syntax error!
+char const utf8_literal[] = u8"happens to be ASCII" "another string";
+
+// Check duplicate typedefs.
+typedef long *long_ptr;
+typedef long int *long_ptr;
+typedef long_ptr long_ptr;
+
+// Anonymous structures and unions -- taken from C11 6.7.2.1 Example 1.
+struct anonymous
+{
+  union {
+    struct { int i; int j; };
+    struct { int k; long int l; } w;
+  };
+  int m;
+} v1;
+'
+
+# Test code for whether the C compiler supports C11 (body of main).
+ac_c_conftest_c11_main='
+  _Static_assert ((offsetof (struct anonymous, i)
+		   == offsetof (struct anonymous, w.k)),
+		  "Anonymous union alignment botch");
+  v1.i = 2;
+  v1.w.k = 5;
+  ok |= v1.i != 5;
+'
+
+# Test code for whether the C compiler supports C11 (complete).
+ac_c_conftest_c11_program="${ac_c_conftest_c89_globals}
+${ac_c_conftest_c99_globals}
+${ac_c_conftest_c11_globals}
+
+int
+main (int argc, char **argv)
+{
+  int ok = 0;
+  ${ac_c_conftest_c89_main}
+  ${ac_c_conftest_c99_main}
+  ${ac_c_conftest_c11_main}
+  return ok;
+}
+"
+
+# Test code for whether the C compiler supports C99 (complete).
+ac_c_conftest_c99_program="${ac_c_conftest_c89_globals}
+${ac_c_conftest_c99_globals}
+
+int
+main (int argc, char **argv)
+{
+  int ok = 0;
+  ${ac_c_conftest_c89_main}
+  ${ac_c_conftest_c99_main}
+  return ok;
+}
+"
+
+# Test code for whether the C compiler supports C89 (complete).
+ac_c_conftest_c89_program="${ac_c_conftest_c89_globals}
+
+int
+main (int argc, char **argv)
+{
+  int ok = 0;
+  ${ac_c_conftest_c89_main}
+  return ok;
+}
+"
+
+as_fn_append ac_header_c_list " stdio.h stdio_h HAVE_STDIO_H"
+as_fn_append ac_header_c_list " stdlib.h stdlib_h HAVE_STDLIB_H"
+as_fn_append ac_header_c_list " string.h string_h HAVE_STRING_H"
+as_fn_append ac_header_c_list " inttypes.h inttypes_h HAVE_INTTYPES_H"
+as_fn_append ac_header_c_list " stdint.h stdint_h HAVE_STDINT_H"
+as_fn_append ac_header_c_list " strings.h strings_h HAVE_STRINGS_H"
+as_fn_append ac_header_c_list " sys/stat.h sys_stat_h HAVE_SYS_STAT_H"
+as_fn_append ac_header_c_list " sys/types.h sys_types_h HAVE_SYS_TYPES_H"
+as_fn_append ac_header_c_list " unistd.h unistd_h HAVE_UNISTD_H"
+
+# Auxiliary files required by this configure script.
+ac_aux_files="install-sh config.guess config.sub"
+
+# Locations in which to look for auxiliary files.
+ac_aux_dir_candidates="${srcdir}/../"
+
+# Search for a directory containing all of the required auxiliary files,
+# $ac_aux_files, from the $PATH-style list $ac_aux_dir_candidates.
+# If we don't find one directory that contains all the files we need,
+# we report the set of missing files from the *first* directory in
+# $ac_aux_dir_candidates and give up.
+ac_missing_aux_files=""
+ac_first_candidate=:
+printf "%s\n" "$as_me:${as_lineno-$LINENO}: looking for aux files: $ac_aux_files" >&5
+as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+as_found=false
+for as_dir in $ac_aux_dir_candidates
+do
+  IFS=$as_save_IFS
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
+  as_found=:
+
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}:  trying $as_dir" >&5
+  ac_aux_dir_found=yes
+  ac_install_sh=
+  for ac_aux in $ac_aux_files
+  do
+    # As a special case, if "install-sh" is required, that requirement
+    # can be satisfied by any of "install-sh", "install.sh", or "shtool",
+    # and $ac_install_sh is set appropriately for whichever one is found.
+    if test x"$ac_aux" = x"install-sh"
+    then
+      if test -f "${as_dir}install-sh"; then
+        printf "%s\n" "$as_me:${as_lineno-$LINENO}:   ${as_dir}install-sh found" >&5
+        ac_install_sh="${as_dir}install-sh -c"
+      elif test -f "${as_dir}install.sh"; then
+        printf "%s\n" "$as_me:${as_lineno-$LINENO}:   ${as_dir}install.sh found" >&5
+        ac_install_sh="${as_dir}install.sh -c"
+      elif test -f "${as_dir}shtool"; then
+        printf "%s\n" "$as_me:${as_lineno-$LINENO}:   ${as_dir}shtool found" >&5
+        ac_install_sh="${as_dir}shtool install -c"
+      else
+        ac_aux_dir_found=no
+        if $ac_first_candidate; then
+          ac_missing_aux_files="${ac_missing_aux_files} install-sh"
+        else
+          break
+        fi
+      fi
+    else
+      if test -f "${as_dir}${ac_aux}"; then
+        printf "%s\n" "$as_me:${as_lineno-$LINENO}:   ${as_dir}${ac_aux} found" >&5
+      else
+        ac_aux_dir_found=no
+        if $ac_first_candidate; then
+          ac_missing_aux_files="${ac_missing_aux_files} ${ac_aux}"
+        else
+          break
+        fi
+      fi
+    fi
+  done
+  if test "$ac_aux_dir_found" = yes; then
+    ac_aux_dir="$as_dir"
     break
   fi
+  ac_first_candidate=false
+
+  as_found=false
 done
-if test -z "$ac_aux_dir"; then
-  as_fn_error $? "cannot find install-sh, install.sh, or shtool in ../ \"$srcdir\"/../" "$LINENO" 5
+IFS=$as_save_IFS
+if $as_found
+then :
+
+else $as_nop
+  as_fn_error $? "cannot find required auxiliary files:$ac_missing_aux_files" "$LINENO" 5
 fi
 
+
 # These three variables are undocumented and unsupported,
 # and are intended to be withdrawn in a future Autoconf release.
 # They can cause serious problems if a builder's source tree is in a directory
 # whose full name contains unusual characters.
-ac_config_guess="$SHELL $ac_aux_dir/config.guess"  # Please don't use this var.
-ac_config_sub="$SHELL $ac_aux_dir/config.sub"  # Please don't use this var.
-ac_configure="$SHELL $ac_aux_dir/configure"  # Please don't use this var.
+if test -f "${ac_aux_dir}config.guess"; then
+  ac_config_guess="$SHELL ${ac_aux_dir}config.guess"
+fi
+if test -f "${ac_aux_dir}config.sub"; then
+  ac_config_sub="$SHELL ${ac_aux_dir}config.sub"
+fi
+if test -f "$ac_aux_dir/configure"; then
+  ac_configure="$SHELL ${ac_aux_dir}configure"
+fi
+
+# Check that the precious variables saved in the cache have kept the same
+# value.
+ac_cache_corrupted=false
+for ac_var in $ac_precious_vars; do
+  eval ac_old_set=\$ac_cv_env_${ac_var}_set
+  eval ac_new_set=\$ac_env_${ac_var}_set
+  eval ac_old_val=\$ac_cv_env_${ac_var}_value
+  eval ac_new_val=\$ac_env_${ac_var}_value
+  case $ac_old_set,$ac_new_set in
+    set,)
+      { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&5
+printf "%s\n" "$as_me: error: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&2;}
+      ac_cache_corrupted=: ;;
+    ,set)
+      { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: \`$ac_var' was not set in the previous run" >&5
+printf "%s\n" "$as_me: error: \`$ac_var' was not set in the previous run" >&2;}
+      ac_cache_corrupted=: ;;
+    ,);;
+    *)
+      if test "x$ac_old_val" != "x$ac_new_val"; then
+	# differences in whitespace do not lead to failure.
+	ac_old_val_w=`echo x $ac_old_val`
+	ac_new_val_w=`echo x $ac_new_val`
+	if test "$ac_old_val_w" != "$ac_new_val_w"; then
+	  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: \`$ac_var' has changed since the previous run:" >&5
+printf "%s\n" "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
+	  ac_cache_corrupted=:
+	else
+	  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: warning: ignoring whitespace changes in \`$ac_var' since the previous run:" >&5
+printf "%s\n" "$as_me: warning: ignoring whitespace changes in \`$ac_var' since the previous run:" >&2;}
+	  eval $ac_var=\$ac_old_val
+	fi
+	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}:   former value:  \`$ac_old_val'" >&5
+printf "%s\n" "$as_me:   former value:  \`$ac_old_val'" >&2;}
+	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}:   current value: \`$ac_new_val'" >&5
+printf "%s\n" "$as_me:   current value: \`$ac_new_val'" >&2;}
+      fi;;
+  esac
+  # Pass precious variables to config.status.
+  if test "$ac_new_set" = set; then
+    case $ac_new_val in
+    *\'*) ac_arg=$ac_var=`printf "%s\n" "$ac_new_val" | sed "s/'/'\\\\\\\\''/g"` ;;
+    *) ac_arg=$ac_var=$ac_new_val ;;
+    esac
+    case " $ac_configure_args " in
+      *" '$ac_arg' "*) ;; # Avoid dups.  Use of quotes ensures accuracy.
+      *) as_fn_append ac_configure_args " '$ac_arg'" ;;
+    esac
+  fi
+done
+if $ac_cache_corrupted; then
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: changes in the environment can compromise the build" >&5
+printf "%s\n" "$as_me: error: changes in the environment can compromise the build" >&2;}
+  as_fn_error $? "run \`${MAKE-make} distclean' and/or \`rm $cache_file'
+	    and start over" "$LINENO" 5
+fi
+## -------------------- ##
+## Main body of script. ##
+## -------------------- ##
+
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
+
+
+ac_config_files="$ac_config_files ../config/Tools.mk hotplug/common/hotplugpath.sh hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/libs/xs/paths.ml ocaml/xenstored/paths.ml ocaml/xenstored/oxenstored.conf"
+
+ac_config_headers="$ac_config_headers config.h"
 
 
 
 # Check if CFLAGS, LDFLAGS, LIBS, CPPFLAGS or CPP is set and print a warning
 
-if test -n "$CC$CFLAGS$LDFLAGS$LIBS$CPPFLAGS$CPP"; then :
+if test -n "$CC$CFLAGS$LDFLAGS$LIBS$CPPFLAGS$CPP"
+then :
 
-    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Setting CC, CFLAGS, LDFLAGS, LIBS, CPPFLAGS or CPP is not \
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: Setting CC, CFLAGS, LDFLAGS, LIBS, CPPFLAGS or CPP is not \
 recommended, use PREPEND_INCLUDES, PREPEND_LIB, \
 APPEND_INCLUDES and APPEND_LIB instead when possible." >&5
-$as_echo "$as_me: WARNING: Setting CC, CFLAGS, LDFLAGS, LIBS, CPPFLAGS or CPP is not \
+printf "%s\n" "$as_me: WARNING: Setting CC, CFLAGS, LDFLAGS, LIBS, CPPFLAGS or CPP is not \
 recommended, use PREPEND_INCLUDES, PREPEND_LIB, \
 APPEND_INCLUDES and APPEND_LIB instead when possible." >&2;}
 
 fi
 
-# Make sure we can run config.sub.
-$SHELL "$ac_aux_dir/config.sub" sun4 >/dev/null 2>&1 ||
-  as_fn_error $? "cannot run $SHELL $ac_aux_dir/config.sub" "$LINENO" 5
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking build system type" >&5
-$as_echo_n "checking build system type... " >&6; }
-if ${ac_cv_build+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+
+
+  # Make sure we can run config.sub.
+$SHELL "${ac_aux_dir}config.sub" sun4 >/dev/null 2>&1 ||
+  as_fn_error $? "cannot run $SHELL ${ac_aux_dir}config.sub" "$LINENO" 5
+
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking build system type" >&5
+printf %s "checking build system type... " >&6; }
+if test ${ac_cv_build+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_build_alias=$build_alias
 test "x$ac_build_alias" = x &&
-  ac_build_alias=`$SHELL "$ac_aux_dir/config.guess"`
+  ac_build_alias=`$SHELL "${ac_aux_dir}config.guess"`
 test "x$ac_build_alias" = x &&
   as_fn_error $? "cannot guess build type; you must specify one" "$LINENO" 5
-ac_cv_build=`$SHELL "$ac_aux_dir/config.sub" $ac_build_alias` ||
-  as_fn_error $? "$SHELL $ac_aux_dir/config.sub $ac_build_alias failed" "$LINENO" 5
+ac_cv_build=`$SHELL "${ac_aux_dir}config.sub" $ac_build_alias` ||
+  as_fn_error $? "$SHELL ${ac_aux_dir}config.sub $ac_build_alias failed" "$LINENO" 5
 
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_build" >&5
-$as_echo "$ac_cv_build" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_build" >&5
+printf "%s\n" "$ac_cv_build" >&6; }
 case $ac_cv_build in
 *-*-*) ;;
 *) as_fn_error $? "invalid value of canonical build" "$LINENO" 5;;
@@ -2540,21 +2799,22 @@ IFS=$ac_save_IFS
 case $build_os in *\ *) build_os=`echo "$build_os" | sed 's/ /-/g'`;; esac
 
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking host system type" >&5
-$as_echo_n "checking host system type... " >&6; }
-if ${ac_cv_host+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking host system type" >&5
+printf %s "checking host system type... " >&6; }
+if test ${ac_cv_host+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test "x$host_alias" = x; then
   ac_cv_host=$ac_cv_build
 else
-  ac_cv_host=`$SHELL "$ac_aux_dir/config.sub" $host_alias` ||
-    as_fn_error $? "$SHELL $ac_aux_dir/config.sub $host_alias failed" "$LINENO" 5
+  ac_cv_host=`$SHELL "${ac_aux_dir}config.sub" $host_alias` ||
+    as_fn_error $? "$SHELL ${ac_aux_dir}config.sub $host_alias failed" "$LINENO" 5
 fi
 
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_host" >&5
-$as_echo "$ac_cv_host" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_host" >&5
+printf "%s\n" "$ac_cv_host" >&6; }
 case $ac_cv_host in
 *-*-*) ;;
 *) as_fn_error $? "invalid value of canonical host" "$LINENO" 5;;
@@ -2580,6 +2840,15 @@ rumpxen|rumprun) CONFIG_RUMP=y; rump=true ;;
 esac
 
 
+
+
+
+
+
+
+
+
+
 ac_ext=c
 ac_cpp='$CPP $CPPFLAGS'
 ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
@@ -2588,11 +2857,12 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}gcc", so it can be a program name with args.
 set dummy ${ac_tool_prefix}gcc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
 else
@@ -2600,11 +2870,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_CC="${ac_tool_prefix}gcc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -2615,11 +2889,11 @@ fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
-$as_echo "$CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
+printf "%s\n" "$CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -2628,11 +2902,12 @@ if test -z "$ac_cv_prog_CC"; then
   ac_ct_CC=$CC
   # Extract the first word of "gcc", so it can be a program name with args.
 set dummy gcc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_CC"; then
   ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
 else
@@ -2640,11 +2915,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_CC="gcc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -2655,11 +2934,11 @@ fi
 fi
 ac_ct_CC=$ac_cv_prog_ac_ct_CC
 if test -n "$ac_ct_CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CC" >&5
-$as_echo "$ac_ct_CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CC" >&5
+printf "%s\n" "$ac_ct_CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_CC" = x; then
@@ -2667,8 +2946,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     CC=$ac_ct_CC
@@ -2681,11 +2960,12 @@ if test -z "$CC"; then
           if test -n "$ac_tool_prefix"; then
     # Extract the first word of "${ac_tool_prefix}cc", so it can be a program name with args.
 set dummy ${ac_tool_prefix}cc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
 else
@@ -2693,11 +2973,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_CC="${ac_tool_prefix}cc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -2708,11 +2992,11 @@ fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
-$as_echo "$CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
+printf "%s\n" "$CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -2721,11 +3005,12 @@ fi
 if test -z "$CC"; then
   # Extract the first word of "cc", so it can be a program name with args.
 set dummy cc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
 else
@@ -2734,15 +3019,19 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    if test "$as_dir/$ac_word$ac_exec_ext" = "/usr/ucb/cc"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    if test "$as_dir$ac_word$ac_exec_ext" = "/usr/ucb/cc"; then
        ac_prog_rejected=yes
        continue
      fi
     ac_cv_prog_CC="cc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -2758,18 +3047,18 @@ if test $ac_prog_rejected = yes; then
     # However, it has the same basename, so the bogon will be chosen
     # first if we set CC to just the basename; use the full file name.
     shift
-    ac_cv_prog_CC="$as_dir/$ac_word${1+' '}$@"
+    ac_cv_prog_CC="$as_dir$ac_word${1+' '}$@"
   fi
 fi
 fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
-$as_echo "$CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
+printf "%s\n" "$CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -2780,11 +3069,12 @@ if test -z "$CC"; then
   do
     # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
 set dummy $ac_tool_prefix$ac_prog; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
 else
@@ -2792,11 +3082,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_CC="$ac_tool_prefix$ac_prog"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -2807,11 +3101,11 @@ fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
-$as_echo "$CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
+printf "%s\n" "$CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -2824,11 +3118,12 @@ if test -z "$CC"; then
 do
   # Extract the first word of "$ac_prog", so it can be a program name with args.
 set dummy $ac_prog; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_CC"; then
   ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
 else
@@ -2836,11 +3131,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_CC="$ac_prog"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -2851,11 +3150,11 @@ fi
 fi
 ac_ct_CC=$ac_cv_prog_ac_ct_CC
 if test -n "$ac_ct_CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CC" >&5
-$as_echo "$ac_ct_CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CC" >&5
+printf "%s\n" "$ac_ct_CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -2867,8 +3166,8 @@ done
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     CC=$ac_ct_CC
@@ -2876,25 +3175,129 @@ esac
 fi
 
 fi
+if test -z "$CC"; then
+  if test -n "$ac_tool_prefix"; then
+  # Extract the first word of "${ac_tool_prefix}clang", so it can be a program name with args.
+set dummy ${ac_tool_prefix}clang; ac_word=$2
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  if test -n "$CC"; then
+  ac_cv_prog_CC="$CC" # Let the user override the test.
+else
+as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_prog_CC="${ac_tool_prefix}clang"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
+    break 2
+  fi
+done
+  done
+IFS=$as_save_IFS
 
+fi
+fi
+CC=$ac_cv_prog_CC
+if test -n "$CC"; then
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
+printf "%s\n" "$CC" >&6; }
+else
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+fi
+
+
+fi
+if test -z "$ac_cv_prog_CC"; then
+  ac_ct_CC=$CC
+  # Extract the first word of "clang", so it can be a program name with args.
+set dummy clang; ac_word=$2
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  if test -n "$ac_ct_CC"; then
+  ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
+else
+as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_prog_ac_ct_CC="clang"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
+    break 2
+  fi
+done
+  done
+IFS=$as_save_IFS
 
-test -z "$CC" && { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+fi
+fi
+ac_ct_CC=$ac_cv_prog_ac_ct_CC
+if test -n "$ac_ct_CC"; then
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CC" >&5
+printf "%s\n" "$ac_ct_CC" >&6; }
+else
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+fi
+
+  if test "x$ac_ct_CC" = x; then
+    CC=""
+  else
+    case $cross_compiling:$ac_tool_warned in
+yes:)
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+ac_tool_warned=yes ;;
+esac
+    CC=$ac_ct_CC
+  fi
+else
+  CC="$ac_cv_prog_CC"
+fi
+
+fi
+
+
+test -z "$CC" && { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error $? "no acceptable C compiler found in \$PATH
 See \`config.log' for more details" "$LINENO" 5; }
 
 # Provide some information about the compiler.
-$as_echo "$as_me:${as_lineno-$LINENO}: checking for C compiler version" >&5
+printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for C compiler version" >&5
 set X $ac_compile
 ac_compiler=$2
-for ac_option in --version -v -V -qversion; do
+for ac_option in --version -v -V -qversion -version; do
   { { ac_try="$ac_compiler $ac_option >&5"
 case "(($ac_try" in
   *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
   *) ac_try_echo=$ac_try;;
 esac
 eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
+printf "%s\n" "$ac_try_echo"; } >&5
   (eval "$ac_compiler $ac_option >&5") 2>conftest.err
   ac_status=$?
   if test -s conftest.err; then
@@ -2904,7 +3307,7 @@ $as_echo "$ac_try_echo"; } >&5
     cat conftest.er1 >&5
   fi
   rm -f conftest.er1 conftest.err
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }
 done
 
@@ -2912,7 +3315,7 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 
 int
-main ()
+main (void)
 {
 
   ;
@@ -2924,9 +3327,9 @@ ac_clean_files="$ac_clean_files a.out a.out.dSYM a.exe b.out"
 # Try to create an executable without -o first, disregard a.out.
 # It will help us diagnose broken compilers, and finding out an intuition
 # of exeext.
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the C compiler works" >&5
-$as_echo_n "checking whether the C compiler works... " >&6; }
-ac_link_default=`$as_echo "$ac_link" | sed 's/ -o *conftest[^ ]*//'`
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking whether the C compiler works" >&5
+printf %s "checking whether the C compiler works... " >&6; }
+ac_link_default=`printf "%s\n" "$ac_link" | sed 's/ -o *conftest[^ ]*//'`
 
 # The possible output files:
 ac_files="a.out conftest.exe conftest a.exe a_out.exe b.out conftest.*"
@@ -2947,11 +3350,12 @@ case "(($ac_try" in
   *) ac_try_echo=$ac_try;;
 esac
 eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
+printf "%s\n" "$ac_try_echo"; } >&5
   (eval "$ac_link_default") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then :
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }
+then :
   # Autoconf-2.13 could set the ac_cv_exeext variable to `no'.
 # So ignore a value of `no', otherwise this would lead to `EXEEXT = no'
 # in a Makefile.  We should not override ac_cv_exeext if it was cached,
@@ -2968,7 +3372,7 @@ do
 	# certainly right.
 	break;;
     *.* )
-	if test "${ac_cv_exeext+set}" = set && test "$ac_cv_exeext" != no;
+	if test ${ac_cv_exeext+y} && test "$ac_cv_exeext" != no;
 	then :; else
 	   ac_cv_exeext=`expr "$ac_file" : '[^.]*\(\..*\)'`
 	fi
@@ -2984,44 +3388,46 @@ do
 done
 test "$ac_cv_exeext" = no && ac_cv_exeext=
 
-else
+else $as_nop
   ac_file=''
 fi
-if test -z "$ac_file"; then :
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-$as_echo "$as_me: failed program was:" >&5
+if test -z "$ac_file"
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+printf "%s\n" "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+{ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error 77 "C compiler cannot create executables
 See \`config.log' for more details" "$LINENO" 5; }
-else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for C compiler default output file name" >&5
-$as_echo_n "checking for C compiler default output file name... " >&6; }
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_file" >&5
-$as_echo "$ac_file" >&6; }
+else $as_nop
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
+fi
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for C compiler default output file name" >&5
+printf %s "checking for C compiler default output file name... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_file" >&5
+printf "%s\n" "$ac_file" >&6; }
 ac_exeext=$ac_cv_exeext
 
 rm -f -r a.out a.out.dSYM a.exe conftest$ac_cv_exeext b.out
 ac_clean_files=$ac_clean_files_save
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for suffix of executables" >&5
-$as_echo_n "checking for suffix of executables... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for suffix of executables" >&5
+printf %s "checking for suffix of executables... " >&6; }
 if { { ac_try="$ac_link"
 case "(($ac_try" in
   *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
   *) ac_try_echo=$ac_try;;
 esac
 eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
+printf "%s\n" "$ac_try_echo"; } >&5
   (eval "$ac_link") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then :
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }
+then :
   # If both `conftest.exe' and `conftest' are `present' (well, observable)
 # catch `conftest.exe'.  For instance with Cygwin, `ls conftest' will
 # work properly (i.e., refer to `conftest.exe'), while it won't with
@@ -3035,15 +3441,15 @@ for ac_file in conftest.exe conftest conftest.*; do
     * ) break;;
   esac
 done
-else
-  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+else $as_nop
+  { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error $? "cannot compute suffix of executables: cannot compile and link
 See \`config.log' for more details" "$LINENO" 5; }
 fi
 rm -f conftest conftest$ac_cv_exeext
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_exeext" >&5
-$as_echo "$ac_cv_exeext" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_exeext" >&5
+printf "%s\n" "$ac_cv_exeext" >&6; }
 
 rm -f conftest.$ac_ext
 EXEEXT=$ac_cv_exeext
@@ -3052,7 +3458,7 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 #include <stdio.h>
 int
-main ()
+main (void)
 {
 FILE *f = fopen ("conftest.out", "w");
  return ferror (f) || fclose (f) != 0;
@@ -3064,8 +3470,8 @@ _ACEOF
 ac_clean_files="$ac_clean_files conftest.out"
 # Check that the compiler produces executables we can run.  If not, either
 # the compiler is broken, or we cross compile.
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether we are cross compiling" >&5
-$as_echo_n "checking whether we are cross compiling... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking whether we are cross compiling" >&5
+printf %s "checking whether we are cross compiling... " >&6; }
 if test "$cross_compiling" != yes; then
   { { ac_try="$ac_link"
 case "(($ac_try" in
@@ -3073,10 +3479,10 @@ case "(($ac_try" in
   *) ac_try_echo=$ac_try;;
 esac
 eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
+printf "%s\n" "$ac_try_echo"; } >&5
   (eval "$ac_link") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }
   if { ac_try='./conftest$ac_cv_exeext'
   { { case "(($ac_try" in
@@ -3084,39 +3490,40 @@ $as_echo "$ac_try_echo"; } >&5
   *) ac_try_echo=$ac_try;;
 esac
 eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
+printf "%s\n" "$ac_try_echo"; } >&5
   (eval "$ac_try") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; }; then
     cross_compiling=no
   else
     if test "$cross_compiling" = maybe; then
 	cross_compiling=yes
     else
-	{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
-as_fn_error $? "cannot run C compiled programs.
+	{ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
+as_fn_error 77 "cannot run C compiled programs.
 If you meant to cross compile, use \`--host'.
 See \`config.log' for more details" "$LINENO" 5; }
     fi
   fi
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $cross_compiling" >&5
-$as_echo "$cross_compiling" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $cross_compiling" >&5
+printf "%s\n" "$cross_compiling" >&6; }
 
 rm -f conftest.$ac_ext conftest$ac_cv_exeext conftest.out
 ac_clean_files=$ac_clean_files_save
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for suffix of object files" >&5
-$as_echo_n "checking for suffix of object files... " >&6; }
-if ${ac_cv_objext+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for suffix of object files" >&5
+printf %s "checking for suffix of object files... " >&6; }
+if test ${ac_cv_objext+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 
 int
-main ()
+main (void)
 {
 
   ;
@@ -3130,11 +3537,12 @@ case "(($ac_try" in
   *) ac_try_echo=$ac_try;;
 esac
 eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
+printf "%s\n" "$ac_try_echo"; } >&5
   (eval "$ac_compile") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then :
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }
+then :
   for ac_file in conftest.o conftest.obj conftest.*; do
   test -f "$ac_file" || continue;
   case $ac_file in
@@ -3143,31 +3551,32 @@ $as_echo "$ac_try_echo"; } >&5
        break;;
   esac
 done
-else
-  $as_echo "$as_me: failed program was:" >&5
+else $as_nop
+  printf "%s\n" "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+{ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error $? "cannot compute suffix of object files: cannot compile
 See \`config.log' for more details" "$LINENO" 5; }
 fi
 rm -f conftest.$ac_cv_objext conftest.$ac_ext
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_objext" >&5
-$as_echo "$ac_cv_objext" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_objext" >&5
+printf "%s\n" "$ac_cv_objext" >&6; }
 OBJEXT=$ac_cv_objext
 ac_objext=$OBJEXT
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether we are using the GNU C compiler" >&5
-$as_echo_n "checking whether we are using the GNU C compiler... " >&6; }
-if ${ac_cv_c_compiler_gnu+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking whether the compiler supports GNU C" >&5
+printf %s "checking whether the compiler supports GNU C... " >&6; }
+if test ${ac_cv_c_compiler_gnu+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 
 int
-main ()
+main (void)
 {
 #ifndef __GNUC__
        choke me
@@ -3177,29 +3586,33 @@ main ()
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   ac_compiler_gnu=yes
-else
+else $as_nop
   ac_compiler_gnu=no
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
 ac_cv_c_compiler_gnu=$ac_compiler_gnu
 
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_c_compiler_gnu" >&5
-$as_echo "$ac_cv_c_compiler_gnu" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_c_compiler_gnu" >&5
+printf "%s\n" "$ac_cv_c_compiler_gnu" >&6; }
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
 if test $ac_compiler_gnu = yes; then
   GCC=yes
 else
   GCC=
 fi
-ac_test_CFLAGS=${CFLAGS+set}
+ac_test_CFLAGS=${CFLAGS+y}
 ac_save_CFLAGS=$CFLAGS
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether $CC accepts -g" >&5
-$as_echo_n "checking whether $CC accepts -g... " >&6; }
-if ${ac_cv_prog_cc_g+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking whether $CC accepts -g" >&5
+printf %s "checking whether $CC accepts -g... " >&6; }
+if test ${ac_cv_prog_cc_g+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_save_c_werror_flag=$ac_c_werror_flag
    ac_c_werror_flag=yes
    ac_cv_prog_cc_g=no
@@ -3208,57 +3621,60 @@ else
 /* end confdefs.h.  */
 
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_prog_cc_g=yes
-else
+else $as_nop
   CFLAGS=""
       cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
 
-else
+else $as_nop
   ac_c_werror_flag=$ac_save_c_werror_flag
 	 CFLAGS="-g"
 	 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_prog_cc_g=yes
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
    ac_c_werror_flag=$ac_save_c_werror_flag
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_g" >&5
-$as_echo "$ac_cv_prog_cc_g" >&6; }
-if test "$ac_test_CFLAGS" = set; then
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_g" >&5
+printf "%s\n" "$ac_cv_prog_cc_g" >&6; }
+if test $ac_test_CFLAGS; then
   CFLAGS=$ac_save_CFLAGS
 elif test $ac_cv_prog_cc_g = yes; then
   if test "$GCC" = yes; then
@@ -3273,94 +3689,144 @@ else
     CFLAGS=
   fi
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $CC option to accept ISO C89" >&5
-$as_echo_n "checking for $CC option to accept ISO C89... " >&6; }
-if ${ac_cv_prog_cc_c89+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
-  ac_cv_prog_cc_c89=no
+ac_prog_cc_stdc=no
+if test x$ac_prog_cc_stdc = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $CC option to enable C11 features" >&5
+printf %s "checking for $CC option to enable C11 features... " >&6; }
+if test ${ac_cv_prog_cc_c11+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  ac_cv_prog_cc_c11=no
 ac_save_CC=$CC
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
-#include <stdarg.h>
-#include <stdio.h>
-struct stat;
-/* Most of the following tests are stolen from RCS 5.7's src/conf.sh.  */
-struct buf { int x; };
-FILE * (*rcsopen) (struct buf *, struct stat *, int);
-static char *e (p, i)
-     char **p;
-     int i;
-{
-  return p[i];
-}
-static char *f (char * (*g) (char **, int), char **p, ...)
-{
-  char *s;
-  va_list v;
-  va_start (v,p);
-  s = g (p, va_arg (v,int));
-  va_end (v);
-  return s;
-}
-
-/* OSF 4.0 Compaq cc is some sort of almost-ANSI by default.  It has
-   function prototypes and stuff, but not '\xHH' hex character constants.
-   These don't provoke an error unfortunately, instead are silently treated
-   as 'x'.  The following induces an error, until -std is added to get
-   proper ANSI mode.  Curiously '\x00'!='x' always comes out true, for an
-   array size at least.  It's necessary to write '\x00'==0 to get something
-   that's true only with -std.  */
-int osf4_cc_array ['\x00' == 0 ? 1 : -1];
+$ac_c_conftest_c11_program
+_ACEOF
+for ac_arg in '' -std=gnu11
+do
+  CC="$ac_save_CC $ac_arg"
+  if ac_fn_c_try_compile "$LINENO"
+then :
+  ac_cv_prog_cc_c11=$ac_arg
+fi
+rm -f core conftest.err conftest.$ac_objext conftest.beam
+  test "x$ac_cv_prog_cc_c11" != "xno" && break
+done
+rm -f conftest.$ac_ext
+CC=$ac_save_CC
+fi
 
-/* IBM C 6 for AIX is almost-ANSI by default, but it replaces macro parameters
-   inside strings and character constants.  */
-#define FOO(x) 'x'
-int xlc6_cc_array[FOO(a) == 'x' ? 1 : -1];
+if test "x$ac_cv_prog_cc_c11" = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: unsupported" >&5
+printf "%s\n" "unsupported" >&6; }
+else $as_nop
+  if test "x$ac_cv_prog_cc_c11" = x
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: none needed" >&5
+printf "%s\n" "none needed" >&6; }
+else $as_nop
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_c11" >&5
+printf "%s\n" "$ac_cv_prog_cc_c11" >&6; }
+     CC="$CC $ac_cv_prog_cc_c11"
+fi
+  ac_cv_prog_cc_stdc=$ac_cv_prog_cc_c11
+  ac_prog_cc_stdc=c11
+fi
+fi
+if test x$ac_prog_cc_stdc = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $CC option to enable C99 features" >&5
+printf %s "checking for $CC option to enable C99 features... " >&6; }
+if test ${ac_cv_prog_cc_c99+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  ac_cv_prog_cc_c99=no
+ac_save_CC=$CC
+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+/* end confdefs.h.  */
+$ac_c_conftest_c99_program
+_ACEOF
+for ac_arg in '' -std=gnu99 -std=c99 -c99 -qlanglvl=extc1x -qlanglvl=extc99 -AC99 -D_STDC_C99=
+do
+  CC="$ac_save_CC $ac_arg"
+  if ac_fn_c_try_compile "$LINENO"
+then :
+  ac_cv_prog_cc_c99=$ac_arg
+fi
+rm -f core conftest.err conftest.$ac_objext conftest.beam
+  test "x$ac_cv_prog_cc_c99" != "xno" && break
+done
+rm -f conftest.$ac_ext
+CC=$ac_save_CC
+fi
 
-int test (int i, double x);
-struct s1 {int (*f) (int a);};
-struct s2 {int (*f) (double a);};
-int pairnames (int, char **, FILE *(*)(struct buf *, struct stat *, int), int, int);
-int argc;
-char **argv;
-int
-main ()
-{
-return f (e, argv, 0) != argv[0]  ||  f (e, argv, 1) != argv[1];
-  ;
-  return 0;
-}
+if test "x$ac_cv_prog_cc_c99" = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: unsupported" >&5
+printf "%s\n" "unsupported" >&6; }
+else $as_nop
+  if test "x$ac_cv_prog_cc_c99" = x
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: none needed" >&5
+printf "%s\n" "none needed" >&6; }
+else $as_nop
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_c99" >&5
+printf "%s\n" "$ac_cv_prog_cc_c99" >&6; }
+     CC="$CC $ac_cv_prog_cc_c99"
+fi
+  ac_cv_prog_cc_stdc=$ac_cv_prog_cc_c99
+  ac_prog_cc_stdc=c99
+fi
+fi
+if test x$ac_prog_cc_stdc = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $CC option to enable C89 features" >&5
+printf %s "checking for $CC option to enable C89 features... " >&6; }
+if test ${ac_cv_prog_cc_c89+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  ac_cv_prog_cc_c89=no
+ac_save_CC=$CC
+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+/* end confdefs.h.  */
+$ac_c_conftest_c89_program
 _ACEOF
-for ac_arg in '' -qlanglvl=extc89 -qlanglvl=ansi -std \
-	-Ae "-Aa -D_HPUX_SOURCE" "-Xc -D__EXTENSIONS__"
+for ac_arg in '' -qlanglvl=extc89 -qlanglvl=ansi -std -Ae "-Aa -D_HPUX_SOURCE" "-Xc -D__EXTENSIONS__"
 do
   CC="$ac_save_CC $ac_arg"
-  if ac_fn_c_try_compile "$LINENO"; then :
+  if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_prog_cc_c89=$ac_arg
 fi
-rm -f core conftest.err conftest.$ac_objext
+rm -f core conftest.err conftest.$ac_objext conftest.beam
   test "x$ac_cv_prog_cc_c89" != "xno" && break
 done
 rm -f conftest.$ac_ext
 CC=$ac_save_CC
-
 fi
-# AC_CACHE_VAL
-case "x$ac_cv_prog_cc_c89" in
-  x)
-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: none needed" >&5
-$as_echo "none needed" >&6; } ;;
-  xno)
-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: unsupported" >&5
-$as_echo "unsupported" >&6; } ;;
-  *)
-    CC="$CC $ac_cv_prog_cc_c89"
-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_c89" >&5
-$as_echo "$ac_cv_prog_cc_c89" >&6; } ;;
-esac
-if test "x$ac_cv_prog_cc_c89" != xno; then :
 
+if test "x$ac_cv_prog_cc_c89" = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: unsupported" >&5
+printf "%s\n" "unsupported" >&6; }
+else $as_nop
+  if test "x$ac_cv_prog_cc_c89" = x
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: none needed" >&5
+printf "%s\n" "none needed" >&6; }
+else $as_nop
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_c89" >&5
+printf "%s\n" "$ac_cv_prog_cc_c89" >&6; }
+     CC="$CC $ac_cv_prog_cc_c89"
+fi
+  ac_cv_prog_cc_stdc=$ac_cv_prog_cc_c89
+  ac_prog_cc_stdc=c89
+fi
 fi
 
 ac_ext=c
@@ -3371,17 +3837,19 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 # Check whether --enable-largefile was given.
-if test "${enable_largefile+set}" = set; then :
+if test ${enable_largefile+y}
+then :
   enableval=$enable_largefile;
 fi
 
 if test "$enable_largefile" != no; then
 
-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for special C compiler options needed for large files" >&5
-$as_echo_n "checking for special C compiler options needed for large files... " >&6; }
-if ${ac_cv_sys_largefile_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for special C compiler options needed for large files" >&5
+printf %s "checking for special C compiler options needed for large files... " >&6; }
+if test ${ac_cv_sys_largefile_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_cv_sys_largefile_CC=no
      if test "$GCC" != yes; then
        ac_save_CC=$CC
@@ -3395,44 +3863,47 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 31 << 31) - 1 + ((off_t) 1 << 31 << 31))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-	 if ac_fn_c_try_compile "$LINENO"; then :
+	 if ac_fn_c_try_compile "$LINENO"
+then :
   break
 fi
-rm -f core conftest.err conftest.$ac_objext
+rm -f core conftest.err conftest.$ac_objext conftest.beam
 	 CC="$CC -n32"
-	 if ac_fn_c_try_compile "$LINENO"; then :
+	 if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_sys_largefile_CC=' -n32'; break
 fi
-rm -f core conftest.err conftest.$ac_objext
+rm -f core conftest.err conftest.$ac_objext conftest.beam
 	 break
        done
        CC=$ac_save_CC
        rm -f conftest.$ac_ext
     fi
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_sys_largefile_CC" >&5
-$as_echo "$ac_cv_sys_largefile_CC" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_sys_largefile_CC" >&5
+printf "%s\n" "$ac_cv_sys_largefile_CC" >&6; }
   if test "$ac_cv_sys_largefile_CC" != no; then
     CC=$CC$ac_cv_sys_largefile_CC
   fi
 
-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for _FILE_OFFSET_BITS value needed for large files" >&5
-$as_echo_n "checking for _FILE_OFFSET_BITS value needed for large files... " >&6; }
-if ${ac_cv_sys_file_offset_bits+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for _FILE_OFFSET_BITS value needed for large files" >&5
+printf %s "checking for _FILE_OFFSET_BITS value needed for large files... " >&6; }
+if test ${ac_cv_sys_file_offset_bits+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   while :; do
   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
@@ -3441,22 +3912,23 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 31 << 31) - 1 + ((off_t) 1 << 31 << 31))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_sys_file_offset_bits=no; break
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 #define _FILE_OFFSET_BITS 64
@@ -3465,43 +3937,43 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 31 << 31) - 1 + ((off_t) 1 << 31 << 31))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_sys_file_offset_bits=64; break
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
   ac_cv_sys_file_offset_bits=unknown
   break
 done
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_sys_file_offset_bits" >&5
-$as_echo "$ac_cv_sys_file_offset_bits" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_sys_file_offset_bits" >&5
+printf "%s\n" "$ac_cv_sys_file_offset_bits" >&6; }
 case $ac_cv_sys_file_offset_bits in #(
   no | unknown) ;;
   *)
-cat >>confdefs.h <<_ACEOF
-#define _FILE_OFFSET_BITS $ac_cv_sys_file_offset_bits
-_ACEOF
+printf "%s\n" "#define _FILE_OFFSET_BITS $ac_cv_sys_file_offset_bits" >>confdefs.h
 ;;
 esac
 rm -rf conftest*
   if test $ac_cv_sys_file_offset_bits = unknown; then
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for _LARGE_FILES value needed for large files" >&5
-$as_echo_n "checking for _LARGE_FILES value needed for large files... " >&6; }
-if ${ac_cv_sys_large_files+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for _LARGE_FILES value needed for large files" >&5
+printf %s "checking for _LARGE_FILES value needed for large files... " >&6; }
+if test ${ac_cv_sys_large_files+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   while :; do
   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
@@ -3510,22 +3982,23 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 31 << 31) - 1 + ((off_t) 1 << 31 << 31))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_sys_large_files=no; break
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 #define _LARGE_FILES 1
@@ -3534,40 +4007,37 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 31 << 31) - 1 + ((off_t) 1 << 31 << 31))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_sys_large_files=1; break
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
   ac_cv_sys_large_files=unknown
   break
 done
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_sys_large_files" >&5
-$as_echo "$ac_cv_sys_large_files" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_sys_large_files" >&5
+printf "%s\n" "$ac_cv_sys_large_files" >&6; }
 case $ac_cv_sys_large_files in #(
   no | unknown) ;;
   *)
-cat >>confdefs.h <<_ACEOF
-#define _LARGE_FILES $ac_cv_sys_large_files
-_ACEOF
+printf "%s\n" "#define _LARGE_FILES $ac_cv_sys_large_files" >>confdefs.h
 ;;
 esac
 rm -rf conftest*
   fi
-
-
 fi
 
 
@@ -3929,16 +4399,15 @@ CONFIG_DIR=$sysconfdir
 XEN_CONFIG_DIR=$CONFIG_DIR/xen
 
 
-cat >>confdefs.h <<_ACEOF
-#define XEN_CONFIG_DIR "$XEN_CONFIG_DIR"
-_ACEOF
+printf "%s\n" "#define XEN_CONFIG_DIR \"$XEN_CONFIG_DIR\"" >>confdefs.h
 
 
 
 # Check whether --with-initddir was given.
-if test "${with_initddir+set}" = set; then :
+if test ${with_initddir+y}
+then :
   withval=$with_initddir; initddir_path=$withval
-else
+else $as_nop
   case "$host_os" in
          *linux*)
          if test -d $sysconfdir/rc.d/init.d ; then
@@ -3956,9 +4425,10 @@ fi
 
 
 # Check whether --with-sysconfig-leaf-dir was given.
-if test "${with_sysconfig_leaf_dir+set}" = set; then :
+if test ${with_sysconfig_leaf_dir+y}
+then :
   withval=$with_sysconfig_leaf_dir; config_leaf_dir=$withval
-else
+else $as_nop
   config_leaf_dir=sysconfig
     if test ! -d /etc/sysconfig ; then config_leaf_dir=default ; fi
 fi
@@ -3968,52 +4438,55 @@ CONFIG_LEAF_DIR=$config_leaf_dir
 
 
 # Check whether --with-libexec-leaf-dir was given.
-if test "${with_libexec_leaf_dir+set}" = set; then :
+if test ${with_libexec_leaf_dir+y}
+then :
   withval=$with_libexec_leaf_dir; libexec_subdir=$withval
-else
+else $as_nop
   libexec_subdir=$PACKAGE_TARNAME
 fi
 
 
 
 # Check whether --with-xen-scriptdir was given.
-if test "${with_xen_scriptdir+set}" = set; then :
+if test ${with_xen_scriptdir+y}
+then :
   withval=$with_xen_scriptdir; xen_scriptdir_path=$withval
-else
+else $as_nop
   xen_scriptdir_path=$XEN_CONFIG_DIR/scripts
 fi
 
 XEN_SCRIPT_DIR=$xen_scriptdir_path
 
 
-cat >>confdefs.h <<_ACEOF
-#define XEN_SCRIPT_DIR "$XEN_SCRIPT_DIR"
-_ACEOF
+printf "%s\n" "#define XEN_SCRIPT_DIR \"$XEN_SCRIPT_DIR\"" >>confdefs.h
 
 
 
 # Check whether --with-xen-dumpdir was given.
-if test "${with_xen_dumpdir+set}" = set; then :
+if test ${with_xen_dumpdir+y}
+then :
   withval=$with_xen_dumpdir; xen_dumpdir_path=$withval
-else
+else $as_nop
   xen_dumpdir_path=$localstatedir/lib/xen/dump
 fi
 
 
 
 # Check whether --with-rundir was given.
-if test "${with_rundir+set}" = set; then :
+if test ${with_rundir+y}
+then :
   withval=$with_rundir; rundir_path=$withval
-else
+else $as_nop
   rundir_path=$localstatedir/run
 fi
 
 
 
 # Check whether --with-debugdir was given.
-if test "${with_debugdir+set}" = set; then :
+if test ${with_debugdir+y}
+then :
   withval=$with_debugdir; debugdir_path=$withval
-else
+else $as_nop
   debugdir_path=$prefix/lib/debug
 fi
 
@@ -4032,9 +4505,7 @@ LIBEXEC=`eval echo $libexecdir/$libexec_subdir`
 LIBEXEC_BIN=${LIBEXEC}/bin
 
 
-cat >>confdefs.h <<_ACEOF
-#define LIBEXEC_BIN "$LIBEXEC_BIN"
-_ACEOF
+printf "%s\n" "#define LIBEXEC_BIN \"$LIBEXEC_BIN\"" >>confdefs.h
 
 LIBEXEC_LIB=${LIBEXEC}/lib
 
@@ -4043,25 +4514,19 @@ LIBEXEC_INC=${LIBEXEC}/include
 XENFIRMWAREDIR=${LIBEXEC}/boot
 
 
-cat >>confdefs.h <<_ACEOF
-#define XENFIRMWAREDIR "$XENFIRMWAREDIR"
-_ACEOF
+printf "%s\n" "#define XENFIRMWAREDIR \"$XENFIRMWAREDIR\"" >>confdefs.h
 
 
 XEN_RUN_DIR=$rundir_path/xen
 
 
-cat >>confdefs.h <<_ACEOF
-#define XEN_RUN_DIR "$XEN_RUN_DIR"
-_ACEOF
+printf "%s\n" "#define XEN_RUN_DIR \"$XEN_RUN_DIR\"" >>confdefs.h
 
 
 XEN_LOG_DIR=$localstatedir/log/xen
 
 
-cat >>confdefs.h <<_ACEOF
-#define XEN_LOG_DIR "$XEN_LOG_DIR"
-_ACEOF
+printf "%s\n" "#define XEN_LOG_DIR \"$XEN_LOG_DIR\"" >>confdefs.h
 
 
 XEN_RUN_STORED=$rundir_path/xenstored
@@ -4070,9 +4535,7 @@ XEN_RUN_STORED=$rundir_path/xenstored
 XEN_LIB_DIR=$localstatedir/lib/xen
 
 
-cat >>confdefs.h <<_ACEOF
-#define XEN_LIB_DIR "$XEN_LIB_DIR"
-_ACEOF
+printf "%s\n" "#define XEN_LIB_DIR \"$XEN_LIB_DIR\"" >>confdefs.h
 
 
 SHAREDIR=$prefix/share
@@ -4088,9 +4551,7 @@ case "$host_os" in
 esac
 
 
-cat >>confdefs.h <<_ACEOF
-#define XEN_LOCK_DIR "$XEN_LOCK_DIR"
-_ACEOF
+printf "%s\n" "#define XEN_LOCK_DIR \"$XEN_LOCK_DIR\"" >>confdefs.h
 
 
 XEN_PAGING_DIR=$localstatedir/lib/xen/xenpaging
@@ -4099,9 +4560,7 @@ XEN_PAGING_DIR=$localstatedir/lib/xen/xenpaging
 XEN_DUMP_DIR=$xen_dumpdir_path
 
 
-cat >>confdefs.h <<_ACEOF
-#define XEN_DUMP_DIR "$XEN_DUMP_DIR"
-_ACEOF
+printf "%s\n" "#define XEN_DUMP_DIR \"$XEN_DUMP_DIR\"" >>confdefs.h
 
 
 DEBUG_DIR=$debugdir_path
@@ -4111,20 +4570,24 @@ DEBUG_DIR=$debugdir_path
 # Enable/disable options
 
 # Check whether --enable-werror was given.
-if test "${enable_werror+set}" = set; then :
+if test ${enable_werror+y}
+then :
   enableval=$enable_werror;
 fi
 
 
-if test "x$enable_werror" = "xno"; then :
+if test "x$enable_werror" = "xno"
+then :
 
     ax_cv_werror="n"
 
-elif test "x$enable_werror" = "xyes"; then :
+elif test "x$enable_werror" = "xyes"
+then :
 
     ax_cv_werror="y"
 
-elif test -z $ax_cv_werror; then :
+elif test -z $ax_cv_werror
+then :
 
     ax_cv_werror="y"
 
@@ -4134,20 +4597,24 @@ werror=$ax_cv_werror
 
 
 # Check whether --enable-rpath was given.
-if test "${enable_rpath+set}" = set; then :
+if test ${enable_rpath+y}
+then :
   enableval=$enable_rpath;
 fi
 
 
-if test "x$enable_rpath" = "xno"; then :
+if test "x$enable_rpath" = "xno"
+then :
 
     ax_cv_rpath="n"
 
-elif test "x$enable_rpath" = "xyes"; then :
+elif test "x$enable_rpath" = "xyes"
+then :
 
     ax_cv_rpath="y"
 
-elif test -z $ax_cv_rpath; then :
+elif test -z $ax_cv_rpath
+then :
 
     ax_cv_rpath="n"
 
@@ -4157,20 +4624,24 @@ rpath=$ax_cv_rpath
 
 
 # Check whether --enable-githttp was given.
-if test "${enable_githttp+set}" = set; then :
+if test ${enable_githttp+y}
+then :
   enableval=$enable_githttp;
 fi
 
 
-if test "x$enable_githttp" = "xno"; then :
+if test "x$enable_githttp" = "xno"
+then :
 
     ax_cv_githttp="n"
 
-elif test "x$enable_githttp" = "xyes"; then :
+elif test "x$enable_githttp" = "xyes"
+then :
 
     ax_cv_githttp="y"
 
-elif test -z $ax_cv_githttp; then :
+elif test -z $ax_cv_githttp
+then :
 
     ax_cv_githttp="n"
 
@@ -4180,20 +4651,24 @@ githttp=$ax_cv_githttp
 
 
 # Check whether --enable-monitors was given.
-if test "${enable_monitors+set}" = set; then :
+if test ${enable_monitors+y}
+then :
   enableval=$enable_monitors;
 fi
 
 
-if test "x$enable_monitors" = "xno"; then :
+if test "x$enable_monitors" = "xno"
+then :
 
     ax_cv_monitors="n"
 
-elif test "x$enable_monitors" = "xyes"; then :
+elif test "x$enable_monitors" = "xyes"
+then :
 
     ax_cv_monitors="y"
 
-elif test -z $ax_cv_monitors; then :
+elif test -z $ax_cv_monitors
+then :
 
     ax_cv_monitors="y"
 
@@ -4203,20 +4678,24 @@ monitors=$ax_cv_monitors
 
 
 # Check whether --enable-ocamltools was given.
-if test "${enable_ocamltools+set}" = set; then :
+if test ${enable_ocamltools+y}
+then :
   enableval=$enable_ocamltools;
 fi
 
 
-if test "x$enable_ocamltools" = "xno"; then :
+if test "x$enable_ocamltools" = "xno"
+then :
 
     ax_cv_ocamltools="n"
 
-elif test "x$enable_ocamltools" = "xyes"; then :
+elif test "x$enable_ocamltools" = "xyes"
+then :
 
     ax_cv_ocamltools="y"
 
-elif test -z $ax_cv_ocamltools; then :
+elif test -z $ax_cv_ocamltools
+then :
 
     ax_cv_ocamltools="y"
 
@@ -4226,20 +4705,24 @@ ocamltools=$ax_cv_ocamltools
 
 
 # Check whether --enable-xsmpolicy was given.
-if test "${enable_xsmpolicy+set}" = set; then :
+if test ${enable_xsmpolicy+y}
+then :
   enableval=$enable_xsmpolicy;
 fi
 
 
-if test "x$enable_xsmpolicy" = "xno"; then :
+if test "x$enable_xsmpolicy" = "xno"
+then :
 
     ax_cv_xsmpolicy="n"
 
-elif test "x$enable_xsmpolicy" = "xyes"; then :
+elif test "x$enable_xsmpolicy" = "xyes"
+then :
 
     ax_cv_xsmpolicy="y"
 
-elif test -z $ax_cv_xsmpolicy; then :
+elif test -z $ax_cv_xsmpolicy
+then :
 
     ax_cv_xsmpolicy="y"
 
@@ -4249,20 +4732,24 @@ xsmpolicy=$ax_cv_xsmpolicy
 
 
 # Check whether --enable-ovmf was given.
-if test "${enable_ovmf+set}" = set; then :
+if test ${enable_ovmf+y}
+then :
   enableval=$enable_ovmf;
 fi
 
 
-if test "x$enable_ovmf" = "xno"; then :
+if test "x$enable_ovmf" = "xno"
+then :
 
     ax_cv_ovmf="n"
 
-elif test "x$enable_ovmf" = "xyes"; then :
+elif test "x$enable_ovmf" = "xyes"
+then :
 
     ax_cv_ovmf="y"
 
-elif test -z $ax_cv_ovmf; then :
+elif test -z $ax_cv_ovmf
+then :
 
     ax_cv_ovmf="n"
 
@@ -4272,20 +4759,24 @@ ovmf=$ax_cv_ovmf
 
 
 # Check whether --enable-seabios was given.
-if test "${enable_seabios+set}" = set; then :
+if test ${enable_seabios+y}
+then :
   enableval=$enable_seabios;
 fi
 
 
-if test "x$enable_seabios" = "xno"; then :
+if test "x$enable_seabios" = "xno"
+then :
 
     ax_cv_seabios="n"
 
-elif test "x$enable_seabios" = "xyes"; then :
+elif test "x$enable_seabios" = "xyes"
+then :
 
     ax_cv_seabios="y"
 
-elif test -z $ax_cv_seabios; then :
+elif test -z $ax_cv_seabios
+then :
 
     ax_cv_seabios="y"
 
@@ -4295,20 +4786,24 @@ seabios=$ax_cv_seabios
 
 
 # Check whether --enable-golang was given.
-if test "${enable_golang+set}" = set; then :
+if test ${enable_golang+y}
+then :
   enableval=$enable_golang;
 fi
 
 
-if test "x$enable_golang" = "xno"; then :
+if test "x$enable_golang" = "xno"
+then :
 
     ax_cv_golang="n"
 
-elif test "x$enable_golang" = "xyes"; then :
+elif test "x$enable_golang" = "xyes"
+then :
 
     ax_cv_golang="y"
 
-elif test -z $ax_cv_golang; then :
+elif test -z $ax_cv_golang
+then :
 
     ax_cv_golang="y"
 
@@ -4319,9 +4814,10 @@ golang=$ax_cv_golang
 
 
 # Check whether --with-linux-backend-modules was given.
-if test "${with_linux_backend_modules+set}" = set; then :
+if test ${with_linux_backend_modules+y}
+then :
   withval=$with_linux_backend_modules; LINUX_BACKEND_MODULES="$withval"
-else
+else $as_nop
   case "$host_os" in
 *linux*)
 LINUX_BACKEND_MODULES="
@@ -4351,17 +4847,19 @@ LINUX_BACKEND_MODULES="`eval echo $LINUX_BACKEND_MODULES`"
 
 
 # Check whether --enable-qemu-traditional was given.
-if test "${enable_qemu_traditional+set}" = set; then :
+if test ${enable_qemu_traditional+y}
+then :
   enableval=$enable_qemu_traditional;
 fi
 
-if test "x$enable_qemu_traditional" = "xyes"; then :
+if test "x$enable_qemu_traditional" = "xyes"
+then :
 
 
-$as_echo "#define HAVE_QEMU_TRADITIONAL 1" >>confdefs.h
+printf "%s\n" "#define HAVE_QEMU_TRADITIONAL 1" >>confdefs.h
 
     qemu_traditional=y
-else
+else $as_nop
 
     qemu_traditional=n
 
@@ -4369,15 +4867,17 @@ fi
 
 
 # Check whether --enable-ipxe was given.
-if test "${enable_ipxe+set}" = set; then :
+if test ${enable_ipxe+y}
+then :
   enableval=$enable_ipxe;
-else
+else $as_nop
 
-    if test "x$enable_qemu_traditional" = "xyes"; then :
+    if test "x$enable_qemu_traditional" = "xyes"
+then :
 
         enable_ipxe="yes"
 
-else
+else $as_nop
 
         enable_ipxe="no"
 
@@ -4385,14 +4885,16 @@ fi
 
 fi
 
-if test "x$enable_ipxe" = "xno"; then :
+if test "x$enable_ipxe" = "xno"
+then :
   ipxe=n
-else
+else $as_nop
   ipxe=y
 fi
 
 # Check whether --with-system-ipxe was given.
-if test "${with_system_ipxe+set}" = set; then :
+if test ${with_system_ipxe+y}
+then :
   withval=$with_system_ipxe;
     case $withval in
         no) as_fn_error $? "--without-system-ipxe has no effect" "$LINENO" 5 ;;
@@ -4402,27 +4904,28 @@ if test "${with_system_ipxe+set}" = set; then :
 
 fi
 
-if test "x$ipxe" = "xy" -o -n "$ipxe_path" ; then :
+if test "x$ipxe" = "xy" -o -n "$ipxe_path"
+then :
 
 
-cat >>confdefs.h <<_ACEOF
-#define IPXE_PATH "${ipxe_path:-$XENFIRMWAREDIR/ipxe.bin}"
-_ACEOF
+printf "%s\n" "#define IPXE_PATH \"${ipxe_path:-$XENFIRMWAREDIR/ipxe.bin}\"" >>confdefs.h
 
 
 fi
 
 
 # Check whether --enable-rombios was given.
-if test "${enable_rombios+set}" = set; then :
+if test ${enable_rombios+y}
+then :
   enableval=$enable_rombios;
-else
+else $as_nop
 
-    if test "x$enable_qemu_traditional" = "xyes" -o "x$enable_ipxe" = "xyes"; then :
+    if test "x$enable_qemu_traditional" = "xyes" -o "x$enable_ipxe" = "xyes"
+then :
 
         enable_rombios="yes"
 
-else
+else $as_nop
 
         enable_rombios="no"
 
@@ -4430,15 +4933,17 @@ fi
 
 fi
 
-if test "x$enable_rombios" = "xyes"; then :
+if test "x$enable_rombios" = "xyes"
+then :
 
                 # Extract the first word of "as86", so it can be a program name with args.
 set dummy as86; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_AS86+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_AS86+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $AS86 in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_AS86="$AS86" # Let the user override the test with a path.
@@ -4448,11 +4953,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_AS86="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_AS86="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -4465,11 +4974,11 @@ esac
 fi
 AS86=$ac_cv_path_AS86
 if test -n "$AS86"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $AS86" >&5
-$as_echo "$AS86" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $AS86" >&5
+printf "%s\n" "$AS86" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -4479,11 +4988,12 @@ then
 fi
     # Extract the first word of "ld86", so it can be a program name with args.
 set dummy ld86; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_LD86+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_LD86+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $LD86 in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_LD86="$LD86" # Let the user override the test with a path.
@@ -4493,11 +5003,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_LD86="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_LD86="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -4510,11 +5024,11 @@ esac
 fi
 LD86=$ac_cv_path_LD86
 if test -n "$LD86"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $LD86" >&5
-$as_echo "$LD86" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $LD86" >&5
+printf "%s\n" "$LD86" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -4524,11 +5038,12 @@ then
 fi
     # Extract the first word of "bcc", so it can be a program name with args.
 set dummy bcc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_BCC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_BCC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $BCC in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_BCC="$BCC" # Let the user override the test with a path.
@@ -4538,11 +5053,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_BCC="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_BCC="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -4555,11 +5074,11 @@ esac
 fi
 BCC=$ac_cv_path_BCC
 if test -n "$BCC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $BCC" >&5
-$as_echo "$BCC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $BCC" >&5
+printf "%s\n" "$BCC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -4567,11 +5086,12 @@ if test x"${BCC}" = x"no"
 then
     as_fn_error $? "Unable to find bcc, please install bcc" "$LINENO" 5
 fi
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for lzma_version_number in -llzma" >&5
-$as_echo_n "checking for lzma_version_number in -llzma... " >&6; }
-if ${ac_cv_lib_lzma_lzma_version_number+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for lzma_version_number in -llzma" >&5
+printf %s "checking for lzma_version_number in -llzma... " >&6; }
+if test ${ac_cv_lib_lzma_lzma_version_number+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-llzma  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -4580,45 +5100,42 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char lzma_version_number ();
 int
-main ()
+main (void)
 {
 return lzma_version_number ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_lzma_lzma_version_number=yes
-else
+else $as_nop
   ac_cv_lib_lzma_lzma_version_number=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_lzma_lzma_version_number" >&5
-$as_echo "$ac_cv_lib_lzma_lzma_version_number" >&6; }
-if test "x$ac_cv_lib_lzma_lzma_version_number" = xyes; then :
-  cat >>confdefs.h <<_ACEOF
-#define HAVE_LIBLZMA 1
-_ACEOF
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_lzma_lzma_version_number" >&5
+printf "%s\n" "$ac_cv_lib_lzma_lzma_version_number" >&6; }
+if test "x$ac_cv_lib_lzma_lzma_version_number" = xyes
+then :
+  printf "%s\n" "#define HAVE_LIBLZMA 1" >>confdefs.h
 
   LIBS="-llzma $LIBS"
 
-else
+else $as_nop
   as_fn_error $? "Could not find lzma, needed to build rombios" "$LINENO" 5
 fi
 
 
-$as_echo "#define HAVE_ROMBIOS 1" >>confdefs.h
+printf "%s\n" "#define HAVE_ROMBIOS 1" >>confdefs.h
 
     rombios=y
-else
+else $as_nop
 
     rombios=n
 
@@ -4627,7 +5144,8 @@ fi
 
 
 # Check whether --with-system-qemu was given.
-if test "${with_system_qemu+set}" = set; then :
+if test ${with_system_qemu+y}
+then :
   withval=$with_system_qemu;
     case $withval in
         yes)
@@ -4640,7 +5158,7 @@ if test "${with_system_qemu+set}" = set; then :
             qemu_xen_systemd="$qemu_xen_path" ;;
     esac
 
-else
+else $as_nop
 
     case "$host_cpu" in
         i[3456]86|x86_64)
@@ -4652,16 +5170,15 @@ else
 
 fi
 
-if test "x$qemu_xen" = "xy"; then :
+if test "x$qemu_xen" = "xy"
+then :
 
     qemu_xen_path="$LIBEXEC_BIN/qemu-system-i386"
     qemu_xen_systemd="$qemu_xen_path"
 
 fi
 
-cat >>confdefs.h <<_ACEOF
-#define QEMU_XEN_PATH "$qemu_xen_path"
-_ACEOF
+printf "%s\n" "#define QEMU_XEN_PATH \"$qemu_xen_path\"" >>confdefs.h
 
 
 
@@ -4669,25 +5186,25 @@ _ACEOF
 
 
 # Check whether --with-stubdom-qmp-proxy was given.
-if test "${with_stubdom_qmp_proxy+set}" = set; then :
+if test ${with_stubdom_qmp_proxy+y}
+then :
   withval=$with_stubdom_qmp_proxy;
     stubdom_qmp_proxy="$withval"
 
-else
+else $as_nop
 
     stubdom_qmp_proxy="$bindir/vchan-socket-proxy"
 
 fi
 
 
-cat >>confdefs.h <<_ACEOF
-#define STUBDOM_QMP_PROXY_PATH "$stubdom_qmp_proxy"
-_ACEOF
+printf "%s\n" "#define STUBDOM_QMP_PROXY_PATH \"$stubdom_qmp_proxy\"" >>confdefs.h
 
 
 
 # Check whether --with-system-seabios was given.
-if test "${with_system_seabios+set}" = set; then :
+if test ${with_system_seabios+y}
+then :
   withval=$with_system_seabios;
     # Disable compilation of SeaBIOS.
     seabios=n
@@ -4699,19 +5216,19 @@ if test "${with_system_seabios+set}" = set; then :
 
 fi
 
-if test "x$seabios" = "xy" -o -n "$seabios_path" ; then :
+if test "x$seabios" = "xy" -o -n "$seabios_path"
+then :
 
 
-cat >>confdefs.h <<_ACEOF
-#define SEABIOS_PATH "${seabios_path:-$XENFIRMWAREDIR/seabios.bin}"
-_ACEOF
+printf "%s\n" "#define SEABIOS_PATH \"${seabios_path:-$XENFIRMWAREDIR/seabios.bin}\"" >>confdefs.h
 
 
 fi
 
 
 # Check whether --with-system-ovmf was given.
-if test "${with_system_ovmf+set}" = set; then :
+if test ${with_system_ovmf+y}
+then :
   withval=$with_system_ovmf;
     # Disable compilation of OVMF.
     ovmf=n
@@ -4723,19 +5240,19 @@ if test "${with_system_ovmf+set}" = set; then :
 
 fi
 
-if test "x$ovmf" = "xy" -o -n "$ovmf_path" ; then :
+if test "x$ovmf" = "xy" -o -n "$ovmf_path"
+then :
 
 
-cat >>confdefs.h <<_ACEOF
-#define OVMF_PATH "${ovmf_path:-$XENFIRMWAREDIR/ovmf.bin}"
-_ACEOF
+printf "%s\n" "#define OVMF_PATH \"${ovmf_path:-$XENFIRMWAREDIR/ovmf.bin}\"" >>confdefs.h
 
 
 fi
 
 
 # Check whether --with-extra-qemuu-configure-args was given.
-if test "${with_extra_qemuu_configure_args+set}" = set; then :
+if test ${with_extra_qemuu_configure_args+y}
+then :
   withval=$with_extra_qemuu_configure_args;
     case $withval in
         no) EXTRA_QEMUU_CONFIGURE_ARGS= ;;
@@ -4793,11 +5310,12 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}gcc", so it can be a program name with args.
 set dummy ${ac_tool_prefix}gcc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
 else
@@ -4805,11 +5323,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_CC="${ac_tool_prefix}gcc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -4820,11 +5342,11 @@ fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
-$as_echo "$CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
+printf "%s\n" "$CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -4833,11 +5355,12 @@ if test -z "$ac_cv_prog_CC"; then
   ac_ct_CC=$CC
   # Extract the first word of "gcc", so it can be a program name with args.
 set dummy gcc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_CC"; then
   ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
 else
@@ -4845,11 +5368,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_CC="gcc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -4860,11 +5387,11 @@ fi
 fi
 ac_ct_CC=$ac_cv_prog_ac_ct_CC
 if test -n "$ac_ct_CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CC" >&5
-$as_echo "$ac_ct_CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CC" >&5
+printf "%s\n" "$ac_ct_CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_CC" = x; then
@@ -4872,8 +5399,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     CC=$ac_ct_CC
@@ -4886,11 +5413,12 @@ if test -z "$CC"; then
           if test -n "$ac_tool_prefix"; then
     # Extract the first word of "${ac_tool_prefix}cc", so it can be a program name with args.
 set dummy ${ac_tool_prefix}cc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
 else
@@ -4898,11 +5426,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_CC="${ac_tool_prefix}cc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -4913,11 +5445,11 @@ fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
-$as_echo "$CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
+printf "%s\n" "$CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -4926,11 +5458,12 @@ fi
 if test -z "$CC"; then
   # Extract the first word of "cc", so it can be a program name with args.
 set dummy cc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
 else
@@ -4939,15 +5472,19 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    if test "$as_dir/$ac_word$ac_exec_ext" = "/usr/ucb/cc"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    if test "$as_dir$ac_word$ac_exec_ext" = "/usr/ucb/cc"; then
        ac_prog_rejected=yes
        continue
      fi
     ac_cv_prog_CC="cc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -4963,18 +5500,18 @@ if test $ac_prog_rejected = yes; then
     # However, it has the same basename, so the bogon will be chosen
     # first if we set CC to just the basename; use the full file name.
     shift
-    ac_cv_prog_CC="$as_dir/$ac_word${1+' '}$@"
+    ac_cv_prog_CC="$as_dir$ac_word${1+' '}$@"
   fi
 fi
 fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
-$as_echo "$CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
+printf "%s\n" "$CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -4985,11 +5522,12 @@ if test -z "$CC"; then
   do
     # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
 set dummy $ac_tool_prefix$ac_prog; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
 else
@@ -4997,11 +5535,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_CC="$ac_tool_prefix$ac_prog"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5012,11 +5554,11 @@ fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
-$as_echo "$CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
+printf "%s\n" "$CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -5029,11 +5571,12 @@ if test -z "$CC"; then
 do
   # Extract the first word of "$ac_prog", so it can be a program name with args.
 set dummy $ac_prog; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_CC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_CC"; then
   ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
 else
@@ -5041,11 +5584,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_CC="$ac_prog"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5056,11 +5603,11 @@ fi
 fi
 ac_ct_CC=$ac_cv_prog_ac_ct_CC
 if test -n "$ac_ct_CC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CC" >&5
-$as_echo "$ac_ct_CC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CC" >&5
+printf "%s\n" "$ac_ct_CC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -5072,34 +5619,138 @@ done
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+ac_tool_warned=yes ;;
+esac
+    CC=$ac_ct_CC
+  fi
+fi
+
+fi
+if test -z "$CC"; then
+  if test -n "$ac_tool_prefix"; then
+  # Extract the first word of "${ac_tool_prefix}clang", so it can be a program name with args.
+set dummy ${ac_tool_prefix}clang; ac_word=$2
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  if test -n "$CC"; then
+  ac_cv_prog_CC="$CC" # Let the user override the test.
+else
+as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_prog_CC="${ac_tool_prefix}clang"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
+    break 2
+  fi
+done
+  done
+IFS=$as_save_IFS
+
+fi
+fi
+CC=$ac_cv_prog_CC
+if test -n "$CC"; then
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CC" >&5
+printf "%s\n" "$CC" >&6; }
+else
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+fi
+
+
+fi
+if test -z "$ac_cv_prog_CC"; then
+  ac_ct_CC=$CC
+  # Extract the first word of "clang", so it can be a program name with args.
+set dummy clang; ac_word=$2
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_CC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  if test -n "$ac_ct_CC"; then
+  ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
+else
+as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_prog_ac_ct_CC="clang"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
+    break 2
+  fi
+done
+  done
+IFS=$as_save_IFS
+
+fi
+fi
+ac_ct_CC=$ac_cv_prog_ac_ct_CC
+if test -n "$ac_ct_CC"; then
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CC" >&5
+printf "%s\n" "$ac_ct_CC" >&6; }
+else
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+fi
+
+  if test "x$ac_ct_CC" = x; then
+    CC=""
+  else
+    case $cross_compiling:$ac_tool_warned in
+yes:)
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     CC=$ac_ct_CC
   fi
+else
+  CC="$ac_cv_prog_CC"
 fi
 
 fi
 
 
-test -z "$CC" && { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+test -z "$CC" && { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error $? "no acceptable C compiler found in \$PATH
 See \`config.log' for more details" "$LINENO" 5; }
 
 # Provide some information about the compiler.
-$as_echo "$as_me:${as_lineno-$LINENO}: checking for C compiler version" >&5
+printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for C compiler version" >&5
 set X $ac_compile
 ac_compiler=$2
-for ac_option in --version -v -V -qversion; do
+for ac_option in --version -v -V -qversion -version; do
   { { ac_try="$ac_compiler $ac_option >&5"
 case "(($ac_try" in
   *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
   *) ac_try_echo=$ac_try;;
 esac
 eval ac_try_echo="\"\$as_me:${as_lineno-$LINENO}: $ac_try_echo\""
-$as_echo "$ac_try_echo"; } >&5
+printf "%s\n" "$ac_try_echo"; } >&5
   (eval "$ac_compiler $ac_option >&5") 2>conftest.err
   ac_status=$?
   if test -s conftest.err; then
@@ -5109,20 +5760,21 @@ $as_echo "$ac_try_echo"; } >&5
     cat conftest.er1 >&5
   fi
   rm -f conftest.er1 conftest.err
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }
 done
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether we are using the GNU C compiler" >&5
-$as_echo_n "checking whether we are using the GNU C compiler... " >&6; }
-if ${ac_cv_c_compiler_gnu+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking whether the compiler supports GNU C" >&5
+printf %s "checking whether the compiler supports GNU C... " >&6; }
+if test ${ac_cv_c_compiler_gnu+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 
 int
-main ()
+main (void)
 {
 #ifndef __GNUC__
        choke me
@@ -5132,29 +5784,33 @@ main ()
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   ac_compiler_gnu=yes
-else
+else $as_nop
   ac_compiler_gnu=no
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
 ac_cv_c_compiler_gnu=$ac_compiler_gnu
 
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_c_compiler_gnu" >&5
-$as_echo "$ac_cv_c_compiler_gnu" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_c_compiler_gnu" >&5
+printf "%s\n" "$ac_cv_c_compiler_gnu" >&6; }
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
 if test $ac_compiler_gnu = yes; then
   GCC=yes
 else
   GCC=
 fi
-ac_test_CFLAGS=${CFLAGS+set}
+ac_test_CFLAGS=${CFLAGS+y}
 ac_save_CFLAGS=$CFLAGS
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether $CC accepts -g" >&5
-$as_echo_n "checking whether $CC accepts -g... " >&6; }
-if ${ac_cv_prog_cc_g+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking whether $CC accepts -g" >&5
+printf %s "checking whether $CC accepts -g... " >&6; }
+if test ${ac_cv_prog_cc_g+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_save_c_werror_flag=$ac_c_werror_flag
    ac_c_werror_flag=yes
    ac_cv_prog_cc_g=no
@@ -5163,57 +5819,60 @@ else
 /* end confdefs.h.  */
 
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_prog_cc_g=yes
-else
+else $as_nop
   CFLAGS=""
       cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
 
-else
+else $as_nop
   ac_c_werror_flag=$ac_save_c_werror_flag
 	 CFLAGS="-g"
 	 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
 
 int
-main ()
+main (void)
 {
 
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
+if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_prog_cc_g=yes
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
 fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
    ac_c_werror_flag=$ac_save_c_werror_flag
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_g" >&5
-$as_echo "$ac_cv_prog_cc_g" >&6; }
-if test "$ac_test_CFLAGS" = set; then
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_g" >&5
+printf "%s\n" "$ac_cv_prog_cc_g" >&6; }
+if test $ac_test_CFLAGS; then
   CFLAGS=$ac_save_CFLAGS
 elif test $ac_cv_prog_cc_g = yes; then
   if test "$GCC" = yes; then
@@ -5228,94 +5887,144 @@ else
     CFLAGS=
   fi
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $CC option to accept ISO C89" >&5
-$as_echo_n "checking for $CC option to accept ISO C89... " >&6; }
-if ${ac_cv_prog_cc_c89+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
-  ac_cv_prog_cc_c89=no
+ac_prog_cc_stdc=no
+if test x$ac_prog_cc_stdc = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $CC option to enable C11 features" >&5
+printf %s "checking for $CC option to enable C11 features... " >&6; }
+if test ${ac_cv_prog_cc_c11+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  ac_cv_prog_cc_c11=no
 ac_save_CC=$CC
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
-#include <stdarg.h>
-#include <stdio.h>
-struct stat;
-/* Most of the following tests are stolen from RCS 5.7's src/conf.sh.  */
-struct buf { int x; };
-FILE * (*rcsopen) (struct buf *, struct stat *, int);
-static char *e (p, i)
-     char **p;
-     int i;
-{
-  return p[i];
-}
-static char *f (char * (*g) (char **, int), char **p, ...)
-{
-  char *s;
-  va_list v;
-  va_start (v,p);
-  s = g (p, va_arg (v,int));
-  va_end (v);
-  return s;
-}
-
-/* OSF 4.0 Compaq cc is some sort of almost-ANSI by default.  It has
-   function prototypes and stuff, but not '\xHH' hex character constants.
-   These don't provoke an error unfortunately, instead are silently treated
-   as 'x'.  The following induces an error, until -std is added to get
-   proper ANSI mode.  Curiously '\x00'!='x' always comes out true, for an
-   array size at least.  It's necessary to write '\x00'==0 to get something
-   that's true only with -std.  */
-int osf4_cc_array ['\x00' == 0 ? 1 : -1];
+$ac_c_conftest_c11_program
+_ACEOF
+for ac_arg in '' -std=gnu11
+do
+  CC="$ac_save_CC $ac_arg"
+  if ac_fn_c_try_compile "$LINENO"
+then :
+  ac_cv_prog_cc_c11=$ac_arg
+fi
+rm -f core conftest.err conftest.$ac_objext conftest.beam
+  test "x$ac_cv_prog_cc_c11" != "xno" && break
+done
+rm -f conftest.$ac_ext
+CC=$ac_save_CC
+fi
 
-/* IBM C 6 for AIX is almost-ANSI by default, but it replaces macro parameters
-   inside strings and character constants.  */
-#define FOO(x) 'x'
-int xlc6_cc_array[FOO(a) == 'x' ? 1 : -1];
+if test "x$ac_cv_prog_cc_c11" = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: unsupported" >&5
+printf "%s\n" "unsupported" >&6; }
+else $as_nop
+  if test "x$ac_cv_prog_cc_c11" = x
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: none needed" >&5
+printf "%s\n" "none needed" >&6; }
+else $as_nop
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_c11" >&5
+printf "%s\n" "$ac_cv_prog_cc_c11" >&6; }
+     CC="$CC $ac_cv_prog_cc_c11"
+fi
+  ac_cv_prog_cc_stdc=$ac_cv_prog_cc_c11
+  ac_prog_cc_stdc=c11
+fi
+fi
+if test x$ac_prog_cc_stdc = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $CC option to enable C99 features" >&5
+printf %s "checking for $CC option to enable C99 features... " >&6; }
+if test ${ac_cv_prog_cc_c99+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  ac_cv_prog_cc_c99=no
+ac_save_CC=$CC
+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+/* end confdefs.h.  */
+$ac_c_conftest_c99_program
+_ACEOF
+for ac_arg in '' -std=gnu99 -std=c99 -c99 -qlanglvl=extc1x -qlanglvl=extc99 -AC99 -D_STDC_C99=
+do
+  CC="$ac_save_CC $ac_arg"
+  if ac_fn_c_try_compile "$LINENO"
+then :
+  ac_cv_prog_cc_c99=$ac_arg
+fi
+rm -f core conftest.err conftest.$ac_objext conftest.beam
+  test "x$ac_cv_prog_cc_c99" != "xno" && break
+done
+rm -f conftest.$ac_ext
+CC=$ac_save_CC
+fi
 
-int test (int i, double x);
-struct s1 {int (*f) (int a);};
-struct s2 {int (*f) (double a);};
-int pairnames (int, char **, FILE *(*)(struct buf *, struct stat *, int), int, int);
-int argc;
-char **argv;
-int
-main ()
-{
-return f (e, argv, 0) != argv[0]  ||  f (e, argv, 1) != argv[1];
-  ;
-  return 0;
-}
+if test "x$ac_cv_prog_cc_c99" = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: unsupported" >&5
+printf "%s\n" "unsupported" >&6; }
+else $as_nop
+  if test "x$ac_cv_prog_cc_c99" = x
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: none needed" >&5
+printf "%s\n" "none needed" >&6; }
+else $as_nop
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_c99" >&5
+printf "%s\n" "$ac_cv_prog_cc_c99" >&6; }
+     CC="$CC $ac_cv_prog_cc_c99"
+fi
+  ac_cv_prog_cc_stdc=$ac_cv_prog_cc_c99
+  ac_prog_cc_stdc=c99
+fi
+fi
+if test x$ac_prog_cc_stdc = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $CC option to enable C89 features" >&5
+printf %s "checking for $CC option to enable C89 features... " >&6; }
+if test ${ac_cv_prog_cc_c89+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  ac_cv_prog_cc_c89=no
+ac_save_CC=$CC
+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+/* end confdefs.h.  */
+$ac_c_conftest_c89_program
 _ACEOF
-for ac_arg in '' -qlanglvl=extc89 -qlanglvl=ansi -std \
-	-Ae "-Aa -D_HPUX_SOURCE" "-Xc -D__EXTENSIONS__"
+for ac_arg in '' -qlanglvl=extc89 -qlanglvl=ansi -std -Ae "-Aa -D_HPUX_SOURCE" "-Xc -D__EXTENSIONS__"
 do
   CC="$ac_save_CC $ac_arg"
-  if ac_fn_c_try_compile "$LINENO"; then :
+  if ac_fn_c_try_compile "$LINENO"
+then :
   ac_cv_prog_cc_c89=$ac_arg
 fi
-rm -f core conftest.err conftest.$ac_objext
+rm -f core conftest.err conftest.$ac_objext conftest.beam
   test "x$ac_cv_prog_cc_c89" != "xno" && break
 done
 rm -f conftest.$ac_ext
 CC=$ac_save_CC
-
 fi
-# AC_CACHE_VAL
-case "x$ac_cv_prog_cc_c89" in
-  x)
-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: none needed" >&5
-$as_echo "none needed" >&6; } ;;
-  xno)
-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: unsupported" >&5
-$as_echo "unsupported" >&6; } ;;
-  *)
-    CC="$CC $ac_cv_prog_cc_c89"
-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_c89" >&5
-$as_echo "$ac_cv_prog_cc_c89" >&6; } ;;
-esac
-if test "x$ac_cv_prog_cc_c89" != xno; then :
 
+if test "x$ac_cv_prog_cc_c89" = xno
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: unsupported" >&5
+printf "%s\n" "unsupported" >&6; }
+else $as_nop
+  if test "x$ac_cv_prog_cc_c89" = x
+then :
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: none needed" >&5
+printf "%s\n" "none needed" >&6; }
+else $as_nop
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_cc_c89" >&5
+printf "%s\n" "$ac_cv_prog_cc_c89" >&6; }
+     CC="$CC $ac_cv_prog_cc_c89"
+fi
+  ac_cv_prog_cc_stdc=$ac_cv_prog_cc_c89
+  ac_prog_cc_stdc=c89
+fi
 fi
 
 ac_ext=c
@@ -5324,13 +6033,14 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
 ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
 ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether ${MAKE-make} sets \$(MAKE)" >&5
-$as_echo_n "checking whether ${MAKE-make} sets \$(MAKE)... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking whether ${MAKE-make} sets \$(MAKE)" >&5
+printf %s "checking whether ${MAKE-make} sets \$(MAKE)... " >&6; }
 set x ${MAKE-make}
-ac_make=`$as_echo "$2" | sed 's/+/p/g; s/[^a-zA-Z0-9_]/_/g'`
-if eval \${ac_cv_prog_make_${ac_make}_set+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+ac_make=`printf "%s\n" "$2" | sed 's/+/p/g; s/[^a-zA-Z0-9_]/_/g'`
+if eval test \${ac_cv_prog_make_${ac_make}_set+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   cat >conftest.make <<\_ACEOF
 SHELL = /bin/sh
 all:
@@ -5346,16 +6056,17 @@ esac
 rm -f conftest.make
 fi
 if eval test \$ac_cv_prog_make_${ac_make}_set = yes; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
   SET_MAKE=
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
   SET_MAKE="MAKE=${MAKE-make}"
 fi
 
-# Find a good install program.  We prefer a C program (faster),
+
+  # Find a good install program.  We prefer a C program (faster),
 # so one script is as good as another.  But avoid the broken or
 # incompatible versions:
 # SysV /etc/install, /usr/sbin/install
@@ -5369,20 +6080,25 @@ fi
 # OS/2's system install, which has a completely different semantic
 # ./install, which can be erroneously created by make from ./install.sh.
 # Reject install programs that cannot install multiple files.
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for a BSD-compatible install" >&5
-$as_echo_n "checking for a BSD-compatible install... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for a BSD-compatible install" >&5
+printf %s "checking for a BSD-compatible install... " >&6; }
 if test -z "$INSTALL"; then
-if ${ac_cv_path_install+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+if test ${ac_cv_path_install+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-    # Account for people who put trailing slashes in PATH elements.
-case $as_dir/ in #((
-  ./ | .// | /[cC]/* | \
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
+    # Account for fact that we put trailing slashes in our PATH walk.
+case $as_dir in #((
+  ./ | /[cC]/* | \
   /etc/* | /usr/sbin/* | /usr/etc/* | /sbin/* | /usr/afsws/bin/* | \
   ?:[\\/]os2[\\/]install[\\/]* | ?:[\\/]OS2[\\/]INSTALL[\\/]* | \
   /usr/ucb/* ) ;;
@@ -5392,13 +6108,13 @@ case $as_dir/ in #((
     # by default.
     for ac_prog in ginstall scoinst install; do
       for ac_exec_ext in '' $ac_executable_extensions; do
-	if as_fn_executable_p "$as_dir/$ac_prog$ac_exec_ext"; then
+	if as_fn_executable_p "$as_dir$ac_prog$ac_exec_ext"; then
 	  if test $ac_prog = install &&
-	    grep dspmsg "$as_dir/$ac_prog$ac_exec_ext" >/dev/null 2>&1; then
+	    grep dspmsg "$as_dir$ac_prog$ac_exec_ext" >/dev/null 2>&1; then
 	    # AIX install.  It has an incompatible calling convention.
 	    :
 	  elif test $ac_prog = install &&
-	    grep pwplus "$as_dir/$ac_prog$ac_exec_ext" >/dev/null 2>&1; then
+	    grep pwplus "$as_dir$ac_prog$ac_exec_ext" >/dev/null 2>&1; then
 	    # program-specific install script used by HP pwplus--don't use.
 	    :
 	  else
@@ -5406,12 +6122,12 @@ case $as_dir/ in #((
 	    echo one > conftest.one
 	    echo two > conftest.two
 	    mkdir conftest.dir
-	    if "$as_dir/$ac_prog$ac_exec_ext" -c conftest.one conftest.two "`pwd`/conftest.dir" &&
+	    if "$as_dir$ac_prog$ac_exec_ext" -c conftest.one conftest.two "`pwd`/conftest.dir/" &&
 	      test -s conftest.one && test -s conftest.two &&
 	      test -s conftest.dir/conftest.one &&
 	      test -s conftest.dir/conftest.two
 	    then
-	      ac_cv_path_install="$as_dir/$ac_prog$ac_exec_ext -c"
+	      ac_cv_path_install="$as_dir$ac_prog$ac_exec_ext -c"
 	      break 3
 	    fi
 	  fi
@@ -5427,7 +6143,7 @@ IFS=$as_save_IFS
 rm -rf conftest.one conftest.two conftest.dir
 
 fi
-  if test "${ac_cv_path_install+set}" = set; then
+  if test ${ac_cv_path_install+y}; then
     INSTALL=$ac_cv_path_install
   else
     # As a last resort, use the slow shell script.  Don't cache a
@@ -5437,8 +6153,8 @@ fi
     INSTALL=$ac_install_sh
   fi
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $INSTALL" >&5
-$as_echo "$INSTALL" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $INSTALL" >&5
+printf "%s\n" "$INSTALL" >&6; }
 
 # Use test -z because SunOS4 sh mishandles braces in ${var-val}.
 # It thinks the first close brace ends the variable substitution.
@@ -5450,11 +6166,12 @@ test -z "$INSTALL_DATA" && INSTALL_DATA='${INSTALL} -m 644'
 
 # Extract the first word of "flex", so it can be a program name with args.
 set dummy flex; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_FLEX+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_FLEX+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $FLEX in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_FLEX="$FLEX" # Let the user override the test with a path.
@@ -5464,11 +6181,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_FLEX="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_FLEX="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5480,21 +6201,22 @@ esac
 fi
 FLEX=$ac_cv_path_FLEX
 if test -n "$FLEX"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $FLEX" >&5
-$as_echo "$FLEX" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $FLEX" >&5
+printf "%s\n" "$FLEX" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
 # Extract the first word of "abi-dumper", so it can be a program name with args.
 set dummy abi-dumper; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_ABI_DUMPER+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_ABI_DUMPER+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $ABI_DUMPER in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_ABI_DUMPER="$ABI_DUMPER" # Let the user override the test with a path.
@@ -5504,11 +6226,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_ABI_DUMPER="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_ABI_DUMPER="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5520,21 +6246,22 @@ esac
 fi
 ABI_DUMPER=$ac_cv_path_ABI_DUMPER
 if test -n "$ABI_DUMPER"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ABI_DUMPER" >&5
-$as_echo "$ABI_DUMPER" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ABI_DUMPER" >&5
+printf "%s\n" "$ABI_DUMPER" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
 # Extract the first word of "perl", so it can be a program name with args.
 set dummy perl; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_PERL+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_PERL+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $PERL in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_PERL="$PERL" # Let the user override the test with a path.
@@ -5544,11 +6271,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_PERL="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_PERL="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5561,11 +6292,11 @@ esac
 fi
 PERL=$ac_cv_path_PERL
 if test -n "$PERL"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $PERL" >&5
-$as_echo "$PERL" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $PERL" >&5
+printf "%s\n" "$PERL" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -5575,11 +6306,12 @@ then
 fi
 # Extract the first word of "awk", so it can be a program name with args.
 set dummy awk; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_AWK+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_AWK+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $AWK in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_AWK="$AWK" # Let the user override the test with a path.
@@ -5589,11 +6321,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_AWK="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_AWK="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5606,11 +6342,11 @@ esac
 fi
 AWK=$ac_cv_path_AWK
 if test -n "$AWK"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $AWK" >&5
-$as_echo "$AWK" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $AWK" >&5
+printf "%s\n" "$AWK" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -5623,11 +6359,12 @@ fi
   if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocamlc", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocamlc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAMLC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAMLC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAMLC"; then
   ac_cv_prog_OCAMLC="$OCAMLC" # Let the user override the test.
 else
@@ -5635,11 +6372,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAMLC="${ac_tool_prefix}ocamlc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5650,11 +6391,11 @@ fi
 fi
 OCAMLC=$ac_cv_prog_OCAMLC
 if test -n "$OCAMLC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAMLC" >&5
-$as_echo "$OCAMLC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAMLC" >&5
+printf "%s\n" "$OCAMLC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -5663,11 +6404,12 @@ if test -z "$ac_cv_prog_OCAMLC"; then
   ac_ct_OCAMLC=$OCAMLC
   # Extract the first word of "ocamlc", so it can be a program name with args.
 set dummy ocamlc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAMLC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAMLC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAMLC"; then
   ac_cv_prog_ac_ct_OCAMLC="$ac_ct_OCAMLC" # Let the user override the test.
 else
@@ -5675,11 +6417,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAMLC="ocamlc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5690,11 +6436,11 @@ fi
 fi
 ac_ct_OCAMLC=$ac_cv_prog_ac_ct_OCAMLC
 if test -n "$ac_ct_OCAMLC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLC" >&5
-$as_echo "$ac_ct_OCAMLC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLC" >&5
+printf "%s\n" "$ac_ct_OCAMLC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAMLC" = x; then
@@ -5702,8 +6448,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAMLC=$ac_ct_OCAMLC
@@ -5715,17 +6461,17 @@ fi
 
   if test "$OCAMLC" != "no"; then
      OCAMLVERSION=`$OCAMLC -v | sed -n -e 's|.*version* *\(.*\)$|\1|p'`
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: OCaml version is $OCAMLVERSION" >&5
-$as_echo "OCaml version is $OCAMLVERSION" >&6; }
+     { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: OCaml version is $OCAMLVERSION" >&5
+printf "%s\n" "OCaml version is $OCAMLVERSION" >&6; }
      # If OCAMLLIB is set, use it
      if test "$OCAMLLIB" = ""; then
         OCAMLLIB=`$OCAMLC -where 2>/dev/null || $OCAMLC -v|tail -1|cut -d ' ' -f 4`
      else
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: OCAMLLIB previously set; preserving it." >&5
-$as_echo "OCAMLLIB previously set; preserving it." >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: OCAMLLIB previously set; preserving it." >&5
+printf "%s\n" "OCAMLLIB previously set; preserving it." >&6; }
      fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: OCaml library path is $OCAMLLIB" >&5
-$as_echo "OCaml library path is $OCAMLLIB" >&6; }
+     { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: OCaml library path is $OCAMLLIB" >&5
+printf "%s\n" "OCaml library path is $OCAMLLIB" >&6; }
 
 
 
@@ -5734,11 +6480,12 @@ $as_echo "OCaml library path is $OCAMLLIB" >&6; }
      if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocamlopt", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocamlopt; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAMLOPT+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAMLOPT+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAMLOPT"; then
   ac_cv_prog_OCAMLOPT="$OCAMLOPT" # Let the user override the test.
 else
@@ -5746,11 +6493,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAMLOPT="${ac_tool_prefix}ocamlopt"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5761,11 +6512,11 @@ fi
 fi
 OCAMLOPT=$ac_cv_prog_OCAMLOPT
 if test -n "$OCAMLOPT"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAMLOPT" >&5
-$as_echo "$OCAMLOPT" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAMLOPT" >&5
+printf "%s\n" "$OCAMLOPT" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -5774,11 +6525,12 @@ if test -z "$ac_cv_prog_OCAMLOPT"; then
   ac_ct_OCAMLOPT=$OCAMLOPT
   # Extract the first word of "ocamlopt", so it can be a program name with args.
 set dummy ocamlopt; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAMLOPT+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAMLOPT+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAMLOPT"; then
   ac_cv_prog_ac_ct_OCAMLOPT="$ac_ct_OCAMLOPT" # Let the user override the test.
 else
@@ -5786,11 +6538,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAMLOPT="ocamlopt"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5801,11 +6557,11 @@ fi
 fi
 ac_ct_OCAMLOPT=$ac_cv_prog_ac_ct_OCAMLOPT
 if test -n "$ac_ct_OCAMLOPT"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLOPT" >&5
-$as_echo "$ac_ct_OCAMLOPT" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLOPT" >&5
+printf "%s\n" "$ac_ct_OCAMLOPT" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAMLOPT" = x; then
@@ -5813,8 +6569,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAMLOPT=$ac_ct_OCAMLOPT
@@ -5825,13 +6581,13 @@ fi
 
      OCAMLBEST=byte
      if test "$OCAMLOPT" = "no"; then
-	{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Cannot find ocamlopt; bytecode compilation only." >&5
-$as_echo "$as_me: WARNING: Cannot find ocamlopt; bytecode compilation only." >&2;}
+	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: Cannot find ocamlopt; bytecode compilation only." >&5
+printf "%s\n" "$as_me: WARNING: Cannot find ocamlopt; bytecode compilation only." >&2;}
      else
 	TMPVERSION=`$OCAMLOPT -v | sed -n -e 's|.*version* *\(.*\)$|\1|p' `
 	if test "$TMPVERSION" != "$OCAMLVERSION" ; then
-	    { $as_echo "$as_me:${as_lineno-$LINENO}: result: versions differs from ocamlc; ocamlopt discarded." >&5
-$as_echo "versions differs from ocamlc; ocamlopt discarded." >&6; }
+	    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: versions differs from ocamlc; ocamlopt discarded." >&5
+printf "%s\n" "versions differs from ocamlc; ocamlopt discarded." >&6; }
 	    OCAMLOPT=no
 	else
 	    OCAMLBEST=opt
@@ -5844,11 +6600,12 @@ $as_echo "versions differs from ocamlc; ocamlopt discarded." >&6; }
      if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocamlc.opt", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocamlc.opt; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAMLCDOTOPT+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAMLCDOTOPT+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAMLCDOTOPT"; then
   ac_cv_prog_OCAMLCDOTOPT="$OCAMLCDOTOPT" # Let the user override the test.
 else
@@ -5856,11 +6613,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAMLCDOTOPT="${ac_tool_prefix}ocamlc.opt"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5871,11 +6632,11 @@ fi
 fi
 OCAMLCDOTOPT=$ac_cv_prog_OCAMLCDOTOPT
 if test -n "$OCAMLCDOTOPT"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAMLCDOTOPT" >&5
-$as_echo "$OCAMLCDOTOPT" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAMLCDOTOPT" >&5
+printf "%s\n" "$OCAMLCDOTOPT" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -5884,11 +6645,12 @@ if test -z "$ac_cv_prog_OCAMLCDOTOPT"; then
   ac_ct_OCAMLCDOTOPT=$OCAMLCDOTOPT
   # Extract the first word of "ocamlc.opt", so it can be a program name with args.
 set dummy ocamlc.opt; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAMLCDOTOPT+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAMLCDOTOPT+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAMLCDOTOPT"; then
   ac_cv_prog_ac_ct_OCAMLCDOTOPT="$ac_ct_OCAMLCDOTOPT" # Let the user override the test.
 else
@@ -5896,11 +6658,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAMLCDOTOPT="ocamlc.opt"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5911,11 +6677,11 @@ fi
 fi
 ac_ct_OCAMLCDOTOPT=$ac_cv_prog_ac_ct_OCAMLCDOTOPT
 if test -n "$ac_ct_OCAMLCDOTOPT"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLCDOTOPT" >&5
-$as_echo "$ac_ct_OCAMLCDOTOPT" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLCDOTOPT" >&5
+printf "%s\n" "$ac_ct_OCAMLCDOTOPT" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAMLCDOTOPT" = x; then
@@ -5923,8 +6689,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAMLCDOTOPT=$ac_ct_OCAMLCDOTOPT
@@ -5936,8 +6702,8 @@ fi
      if test "$OCAMLCDOTOPT" != "no"; then
 	TMPVERSION=`$OCAMLCDOTOPT -v | sed -n -e 's|.*version* *\(.*\)$|\1|p' `
 	if test "$TMPVERSION" != "$OCAMLVERSION" ; then
-	    { $as_echo "$as_me:${as_lineno-$LINENO}: result: versions differs from ocamlc; ocamlc.opt discarded." >&5
-$as_echo "versions differs from ocamlc; ocamlc.opt discarded." >&6; }
+	    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: versions differs from ocamlc; ocamlc.opt discarded." >&5
+printf "%s\n" "versions differs from ocamlc; ocamlc.opt discarded." >&6; }
 	else
 	    OCAMLC=$OCAMLCDOTOPT
 	fi
@@ -5948,11 +6714,12 @@ $as_echo "versions differs from ocamlc; ocamlc.opt discarded." >&6; }
 	if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocamlopt.opt", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocamlopt.opt; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAMLOPTDOTOPT+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAMLOPTDOTOPT+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAMLOPTDOTOPT"; then
   ac_cv_prog_OCAMLOPTDOTOPT="$OCAMLOPTDOTOPT" # Let the user override the test.
 else
@@ -5960,11 +6727,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAMLOPTDOTOPT="${ac_tool_prefix}ocamlopt.opt"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -5975,11 +6746,11 @@ fi
 fi
 OCAMLOPTDOTOPT=$ac_cv_prog_OCAMLOPTDOTOPT
 if test -n "$OCAMLOPTDOTOPT"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAMLOPTDOTOPT" >&5
-$as_echo "$OCAMLOPTDOTOPT" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAMLOPTDOTOPT" >&5
+printf "%s\n" "$OCAMLOPTDOTOPT" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -5988,11 +6759,12 @@ if test -z "$ac_cv_prog_OCAMLOPTDOTOPT"; then
   ac_ct_OCAMLOPTDOTOPT=$OCAMLOPTDOTOPT
   # Extract the first word of "ocamlopt.opt", so it can be a program name with args.
 set dummy ocamlopt.opt; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAMLOPTDOTOPT+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAMLOPTDOTOPT+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAMLOPTDOTOPT"; then
   ac_cv_prog_ac_ct_OCAMLOPTDOTOPT="$ac_ct_OCAMLOPTDOTOPT" # Let the user override the test.
 else
@@ -6000,11 +6772,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAMLOPTDOTOPT="ocamlopt.opt"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6015,11 +6791,11 @@ fi
 fi
 ac_ct_OCAMLOPTDOTOPT=$ac_cv_prog_ac_ct_OCAMLOPTDOTOPT
 if test -n "$ac_ct_OCAMLOPTDOTOPT"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLOPTDOTOPT" >&5
-$as_echo "$ac_ct_OCAMLOPTDOTOPT" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLOPTDOTOPT" >&5
+printf "%s\n" "$ac_ct_OCAMLOPTDOTOPT" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAMLOPTDOTOPT" = x; then
@@ -6027,8 +6803,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAMLOPTDOTOPT=$ac_ct_OCAMLOPTDOTOPT
@@ -6040,8 +6816,8 @@ fi
 	if test "$OCAMLOPTDOTOPT" != "no"; then
 	   TMPVERSION=`$OCAMLOPTDOTOPT -v | sed -n -e 's|.*version* *\(.*\)$|\1|p' `
 	   if test "$TMPVERSION" != "$OCAMLVERSION" ; then
-	      { $as_echo "$as_me:${as_lineno-$LINENO}: result: version differs from ocamlc; ocamlopt.opt discarded." >&5
-$as_echo "version differs from ocamlc; ocamlopt.opt discarded." >&6; }
+	      { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: version differs from ocamlc; ocamlopt.opt discarded." >&5
+printf "%s\n" "version differs from ocamlc; ocamlopt.opt discarded." >&6; }
 	   else
 	      OCAMLOPT=$OCAMLOPTDOTOPT
 	   fi
@@ -6057,11 +6833,12 @@ $as_echo "version differs from ocamlc; ocamlopt.opt discarded." >&6; }
   if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocaml", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocaml; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAML+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAML+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAML"; then
   ac_cv_prog_OCAML="$OCAML" # Let the user override the test.
 else
@@ -6069,11 +6846,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAML="${ac_tool_prefix}ocaml"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6084,11 +6865,11 @@ fi
 fi
 OCAML=$ac_cv_prog_OCAML
 if test -n "$OCAML"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAML" >&5
-$as_echo "$OCAML" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAML" >&5
+printf "%s\n" "$OCAML" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -6097,11 +6878,12 @@ if test -z "$ac_cv_prog_OCAML"; then
   ac_ct_OCAML=$OCAML
   # Extract the first word of "ocaml", so it can be a program name with args.
 set dummy ocaml; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAML+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAML+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAML"; then
   ac_cv_prog_ac_ct_OCAML="$ac_ct_OCAML" # Let the user override the test.
 else
@@ -6109,11 +6891,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAML="ocaml"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6124,11 +6910,11 @@ fi
 fi
 ac_ct_OCAML=$ac_cv_prog_ac_ct_OCAML
 if test -n "$ac_ct_OCAML"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAML" >&5
-$as_echo "$ac_ct_OCAML" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAML" >&5
+printf "%s\n" "$ac_ct_OCAML" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAML" = x; then
@@ -6136,8 +6922,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAML=$ac_ct_OCAML
@@ -6151,11 +6937,12 @@ fi
   if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocamldep", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocamldep; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAMLDEP+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAMLDEP+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAMLDEP"; then
   ac_cv_prog_OCAMLDEP="$OCAMLDEP" # Let the user override the test.
 else
@@ -6163,11 +6950,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAMLDEP="${ac_tool_prefix}ocamldep"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6178,11 +6969,11 @@ fi
 fi
 OCAMLDEP=$ac_cv_prog_OCAMLDEP
 if test -n "$OCAMLDEP"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAMLDEP" >&5
-$as_echo "$OCAMLDEP" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAMLDEP" >&5
+printf "%s\n" "$OCAMLDEP" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -6191,11 +6982,12 @@ if test -z "$ac_cv_prog_OCAMLDEP"; then
   ac_ct_OCAMLDEP=$OCAMLDEP
   # Extract the first word of "ocamldep", so it can be a program name with args.
 set dummy ocamldep; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAMLDEP+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAMLDEP+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAMLDEP"; then
   ac_cv_prog_ac_ct_OCAMLDEP="$ac_ct_OCAMLDEP" # Let the user override the test.
 else
@@ -6203,11 +6995,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAMLDEP="ocamldep"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6218,11 +7014,11 @@ fi
 fi
 ac_ct_OCAMLDEP=$ac_cv_prog_ac_ct_OCAMLDEP
 if test -n "$ac_ct_OCAMLDEP"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLDEP" >&5
-$as_echo "$ac_ct_OCAMLDEP" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLDEP" >&5
+printf "%s\n" "$ac_ct_OCAMLDEP" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAMLDEP" = x; then
@@ -6230,8 +7026,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAMLDEP=$ac_ct_OCAMLDEP
@@ -6245,11 +7041,12 @@ fi
   if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocamlmktop", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocamlmktop; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAMLMKTOP+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAMLMKTOP+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAMLMKTOP"; then
   ac_cv_prog_OCAMLMKTOP="$OCAMLMKTOP" # Let the user override the test.
 else
@@ -6257,11 +7054,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAMLMKTOP="${ac_tool_prefix}ocamlmktop"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6272,11 +7073,11 @@ fi
 fi
 OCAMLMKTOP=$ac_cv_prog_OCAMLMKTOP
 if test -n "$OCAMLMKTOP"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAMLMKTOP" >&5
-$as_echo "$OCAMLMKTOP" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAMLMKTOP" >&5
+printf "%s\n" "$OCAMLMKTOP" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -6285,11 +7086,12 @@ if test -z "$ac_cv_prog_OCAMLMKTOP"; then
   ac_ct_OCAMLMKTOP=$OCAMLMKTOP
   # Extract the first word of "ocamlmktop", so it can be a program name with args.
 set dummy ocamlmktop; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAMLMKTOP+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAMLMKTOP+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAMLMKTOP"; then
   ac_cv_prog_ac_ct_OCAMLMKTOP="$ac_ct_OCAMLMKTOP" # Let the user override the test.
 else
@@ -6297,11 +7099,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAMLMKTOP="ocamlmktop"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6312,11 +7118,11 @@ fi
 fi
 ac_ct_OCAMLMKTOP=$ac_cv_prog_ac_ct_OCAMLMKTOP
 if test -n "$ac_ct_OCAMLMKTOP"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLMKTOP" >&5
-$as_echo "$ac_ct_OCAMLMKTOP" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLMKTOP" >&5
+printf "%s\n" "$ac_ct_OCAMLMKTOP" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAMLMKTOP" = x; then
@@ -6324,8 +7130,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAMLMKTOP=$ac_ct_OCAMLMKTOP
@@ -6339,11 +7145,12 @@ fi
   if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocamlmklib", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocamlmklib; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAMLMKLIB+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAMLMKLIB+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAMLMKLIB"; then
   ac_cv_prog_OCAMLMKLIB="$OCAMLMKLIB" # Let the user override the test.
 else
@@ -6351,11 +7158,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAMLMKLIB="${ac_tool_prefix}ocamlmklib"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6366,11 +7177,11 @@ fi
 fi
 OCAMLMKLIB=$ac_cv_prog_OCAMLMKLIB
 if test -n "$OCAMLMKLIB"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAMLMKLIB" >&5
-$as_echo "$OCAMLMKLIB" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAMLMKLIB" >&5
+printf "%s\n" "$OCAMLMKLIB" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -6379,11 +7190,12 @@ if test -z "$ac_cv_prog_OCAMLMKLIB"; then
   ac_ct_OCAMLMKLIB=$OCAMLMKLIB
   # Extract the first word of "ocamlmklib", so it can be a program name with args.
 set dummy ocamlmklib; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAMLMKLIB+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAMLMKLIB+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAMLMKLIB"; then
   ac_cv_prog_ac_ct_OCAMLMKLIB="$ac_ct_OCAMLMKLIB" # Let the user override the test.
 else
@@ -6391,11 +7203,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAMLMKLIB="ocamlmklib"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6406,11 +7222,11 @@ fi
 fi
 ac_ct_OCAMLMKLIB=$ac_cv_prog_ac_ct_OCAMLMKLIB
 if test -n "$ac_ct_OCAMLMKLIB"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLMKLIB" >&5
-$as_echo "$ac_ct_OCAMLMKLIB" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLMKLIB" >&5
+printf "%s\n" "$ac_ct_OCAMLMKLIB" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAMLMKLIB" = x; then
@@ -6418,8 +7234,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAMLMKLIB=$ac_ct_OCAMLMKLIB
@@ -6433,11 +7249,12 @@ fi
   if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocamldoc", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocamldoc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAMLDOC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAMLDOC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAMLDOC"; then
   ac_cv_prog_OCAMLDOC="$OCAMLDOC" # Let the user override the test.
 else
@@ -6445,11 +7262,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAMLDOC="${ac_tool_prefix}ocamldoc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6460,11 +7281,11 @@ fi
 fi
 OCAMLDOC=$ac_cv_prog_OCAMLDOC
 if test -n "$OCAMLDOC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAMLDOC" >&5
-$as_echo "$OCAMLDOC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAMLDOC" >&5
+printf "%s\n" "$OCAMLDOC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -6473,11 +7294,12 @@ if test -z "$ac_cv_prog_OCAMLDOC"; then
   ac_ct_OCAMLDOC=$OCAMLDOC
   # Extract the first word of "ocamldoc", so it can be a program name with args.
 set dummy ocamldoc; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAMLDOC+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAMLDOC+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAMLDOC"; then
   ac_cv_prog_ac_ct_OCAMLDOC="$ac_ct_OCAMLDOC" # Let the user override the test.
 else
@@ -6485,11 +7307,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAMLDOC="ocamldoc"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6500,11 +7326,11 @@ fi
 fi
 ac_ct_OCAMLDOC=$ac_cv_prog_ac_ct_OCAMLDOC
 if test -n "$ac_ct_OCAMLDOC"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLDOC" >&5
-$as_echo "$ac_ct_OCAMLDOC" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLDOC" >&5
+printf "%s\n" "$ac_ct_OCAMLDOC" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAMLDOC" = x; then
@@ -6512,8 +7338,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAMLDOC=$ac_ct_OCAMLDOC
@@ -6527,11 +7353,12 @@ fi
   if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocamlbuild", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocamlbuild; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAMLBUILD+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAMLBUILD+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAMLBUILD"; then
   ac_cv_prog_OCAMLBUILD="$OCAMLBUILD" # Let the user override the test.
 else
@@ -6539,11 +7366,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAMLBUILD="${ac_tool_prefix}ocamlbuild"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6554,11 +7385,11 @@ fi
 fi
 OCAMLBUILD=$ac_cv_prog_OCAMLBUILD
 if test -n "$OCAMLBUILD"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAMLBUILD" >&5
-$as_echo "$OCAMLBUILD" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAMLBUILD" >&5
+printf "%s\n" "$OCAMLBUILD" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -6567,11 +7398,12 @@ if test -z "$ac_cv_prog_OCAMLBUILD"; then
   ac_ct_OCAMLBUILD=$OCAMLBUILD
   # Extract the first word of "ocamlbuild", so it can be a program name with args.
 set dummy ocamlbuild; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAMLBUILD+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAMLBUILD+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAMLBUILD"; then
   ac_cv_prog_ac_ct_OCAMLBUILD="$ac_ct_OCAMLBUILD" # Let the user override the test.
 else
@@ -6579,11 +7411,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAMLBUILD="ocamlbuild"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6594,11 +7430,11 @@ fi
 fi
 ac_ct_OCAMLBUILD=$ac_cv_prog_ac_ct_OCAMLBUILD
 if test -n "$ac_ct_OCAMLBUILD"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLBUILD" >&5
-$as_echo "$ac_ct_OCAMLBUILD" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLBUILD" >&5
+printf "%s\n" "$ac_ct_OCAMLBUILD" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAMLBUILD" = x; then
@@ -6606,8 +7442,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAMLBUILD=$ac_ct_OCAMLBUILD
@@ -6622,11 +7458,12 @@ fi
   if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}ocamlfind", so it can be a program name with args.
 set dummy ${ac_tool_prefix}ocamlfind; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_OCAMLFIND+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_OCAMLFIND+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$OCAMLFIND"; then
   ac_cv_prog_OCAMLFIND="$OCAMLFIND" # Let the user override the test.
 else
@@ -6634,11 +7471,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_OCAMLFIND="${ac_tool_prefix}ocamlfind"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6649,11 +7490,11 @@ fi
 fi
 OCAMLFIND=$ac_cv_prog_OCAMLFIND
 if test -n "$OCAMLFIND"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $OCAMLFIND" >&5
-$as_echo "$OCAMLFIND" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $OCAMLFIND" >&5
+printf "%s\n" "$OCAMLFIND" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -6662,11 +7503,12 @@ if test -z "$ac_cv_prog_OCAMLFIND"; then
   ac_ct_OCAMLFIND=$OCAMLFIND
   # Extract the first word of "ocamlfind", so it can be a program name with args.
 set dummy ocamlfind; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_OCAMLFIND+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_OCAMLFIND+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_OCAMLFIND"; then
   ac_cv_prog_ac_ct_OCAMLFIND="$ac_ct_OCAMLFIND" # Let the user override the test.
 else
@@ -6674,11 +7516,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_OCAMLFIND="ocamlfind"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6689,11 +7535,11 @@ fi
 fi
 ac_ct_OCAMLFIND=$ac_cv_prog_ac_ct_OCAMLFIND
 if test -n "$ac_ct_OCAMLFIND"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLFIND" >&5
-$as_echo "$ac_ct_OCAMLFIND" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_OCAMLFIND" >&5
+printf "%s\n" "$ac_ct_OCAMLFIND" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_OCAMLFIND" = x; then
@@ -6701,8 +7547,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     OCAMLFIND=$ac_ct_OCAMLFIND
@@ -6718,11 +7564,12 @@ for ac_prog in gawk mawk nawk awk
 do
   # Extract the first word of "$ac_prog", so it can be a program name with args.
 set dummy $ac_prog; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_AWK+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_AWK+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$AWK"; then
   ac_cv_prog_AWK="$AWK" # Let the user override the test.
 else
@@ -6730,11 +7577,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_AWK="$ac_prog"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6745,28 +7596,31 @@ fi
 fi
 AWK=$ac_cv_prog_AWK
 if test -n "$AWK"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $AWK" >&5
-$as_echo "$AWK" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $AWK" >&5
+printf "%s\n" "$AWK" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
   test -n "$AWK" && break
 done
 
-if test "x$ocamltools" = "xy"; then :
+if test "x$ocamltools" = "xy"
+then :
 
-    if test "x$OCAMLOPT" = "xno" || test "x$OCAMLFIND" = "xno"; then :
+    if test "x$OCAMLOPT" = "xno" || test "x$OCAMLFIND" = "xno"
+then :
 
-        if test "x$enable_ocamltools" = "xyes"; then :
+        if test "x$enable_ocamltools" = "xyes"
+then :
 
             as_fn_error $? "Ocaml tools enabled, but missing ocamlopt or ocamlfind" "$LINENO" 5
 fi
         ocamltools="n"
 
-else
+else $as_nop
 
 
 
@@ -6801,7 +7655,8 @@ x$ax_compare_version_B" | sed 's/^ *//' | sort -r | sed "s/x${ax_compare_version
 
     if test "$ax_compare_version" = "true" ; then
 
-            if test "x$enable_ocamltools" = "xyes"; then :
+            if test "x$enable_ocamltools" = "xyes"
+then :
 
                 as_fn_error $? "Your version of OCaml: $OCAMLVERSION is not supported" "$LINENO" 5
 fi
@@ -6814,17 +7669,19 @@ fi
 
 fi
 
-if test "x$golang" = "xy"; then :
+if test "x$golang" = "xy"
+then :
 
 
         if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}go", so it can be a program name with args.
 set dummy ${ac_tool_prefix}go; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_GO+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_GO+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$GO"; then
   ac_cv_prog_GO="$GO" # Let the user override the test.
 else
@@ -6832,11 +7689,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_GO="${ac_tool_prefix}go"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6847,11 +7708,11 @@ fi
 fi
 GO=$ac_cv_prog_GO
 if test -n "$GO"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $GO" >&5
-$as_echo "$GO" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $GO" >&5
+printf "%s\n" "$GO" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -6860,11 +7721,12 @@ if test -z "$ac_cv_prog_GO"; then
   ac_ct_GO=$GO
   # Extract the first word of "go", so it can be a program name with args.
 set dummy go; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_GO+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_GO+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_GO"; then
   ac_cv_prog_ac_ct_GO="$ac_ct_GO" # Let the user override the test.
 else
@@ -6872,11 +7734,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_GO="go"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -6887,11 +7753,11 @@ fi
 fi
 ac_ct_GO=$ac_cv_prog_ac_ct_GO
 if test -n "$ac_ct_GO"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_GO" >&5
-$as_echo "$ac_ct_GO" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_GO" >&5
+printf "%s\n" "$ac_ct_GO" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_GO" = x; then
@@ -6899,8 +7765,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     GO=$ac_ct_GO
@@ -6914,16 +7780,18 @@ fi
         GOVERSION=`$GO version | cut -d " " -f 3 | sed "s/go//"`
     fi
 
-    if test "x$GO" = "xno"; then :
+    if test "x$GO" = "xno"
+then :
 
-        if test "x$enable_golang" =  "xyes"; then :
+        if test "x$enable_golang" =  "xyes"
+then :
 
             as_fn_error $? "Go tools enabled, but missing go compiler" "$LINENO" 5
 
 fi
         golang="n"
 
-else
+else $as_nop
 
 
 
@@ -6958,7 +7826,8 @@ x$ax_compare_version_B" | sed 's/^ *//' | sort -r | sed "s/x${ax_compare_version
 
     if test "$ax_compare_version" = "true" ; then
 
-            if test "x$enable_golang" = "xyes"; then :
+            if test "x$enable_golang" = "xyes"
+then :
 
                 as_fn_error $? "\"Your version of go: $GOVERSION is not supported\"" "$LINENO" 5
 
@@ -6981,24 +7850,29 @@ fi
 
 
 
-if test "x$XENSTORE" = "x"; then :
+if test "x$XENSTORE" = "x"
+then :
 
 
 # Check whether --with-xenstored was given.
-if test "${with_xenstored+set}" = set; then :
+if test ${with_xenstored+y}
+then :
   withval=$with_xenstored;
-		if test "x$withval" = "xxenstored"; then :
+		if test "x$withval" = "xxenstored"
+then :
 
 			xenstore=$withval
 			xenstored=$sbindir/xenstored
 
 fi
-		if test "x$withval" = "xoxenstored"; then :
+		if test "x$withval" = "xoxenstored"
+then :
 
 			xenstore=$withval
 			xenstored=$sbindir/oxenstored
 
-	if test "$ocamltools" = "n"; then :
+	if test "$ocamltools" = "n"
+then :
 
 		as_fn_error $? "Missing ocaml dependencies for oxenstored, try installing ocaml ocaml-compiler-libs ocaml-runtime ocaml-findlib" "$LINENO" 5
 
@@ -7006,18 +7880,20 @@ fi
 
 
 fi
-		if test "x$withval" != "xoxenstored" && test "x$withval" != "xxenstored"; then :
+		if test "x$withval" != "xoxenstored" && test "x$withval" != "xxenstored"
+then :
 
 			as_fn_error $? "Unsupported xenstored specified, supported types: oxenstored xenstored" "$LINENO" 5
 
 fi
 
-else
+else $as_nop
 
 
 	xenstore="oxenstored"
 	xenstored=$sbindir/oxenstored
-	if test "$ocamltools" = "n"; then :
+	if test "$ocamltools" = "n"
+then :
 
 		xenstore="xenstored"
 		xenstored=$sbindir/xenstored
@@ -7033,7 +7909,8 @@ fi
 
 	XENSTORE=$xenstore
 
-	if test "x$XENSTORED" = "x"; then :
+	if test "x$XENSTORED" = "x"
+then :
 
 		XENSTORED=$xenstored
 
@@ -7041,17 +7918,19 @@ fi
 
 
 
-if test "x$xsmpolicy" = "xy"; then :
+if test "x$xsmpolicy" = "xy"
+then :
 
       # check for a checkpolicy binary with support for -t xen
   if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}checkpolicy", so it can be a program name with args.
 set dummy ${ac_tool_prefix}checkpolicy; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_CHECKPOLICY+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_CHECKPOLICY+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$CHECKPOLICY"; then
   ac_cv_prog_CHECKPOLICY="$CHECKPOLICY" # Let the user override the test.
 else
@@ -7059,11 +7938,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_CHECKPOLICY="${ac_tool_prefix}checkpolicy"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -7074,11 +7957,11 @@ fi
 fi
 CHECKPOLICY=$ac_cv_prog_CHECKPOLICY
 if test -n "$CHECKPOLICY"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CHECKPOLICY" >&5
-$as_echo "$CHECKPOLICY" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $CHECKPOLICY" >&5
+printf "%s\n" "$CHECKPOLICY" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -7087,11 +7970,12 @@ if test -z "$ac_cv_prog_CHECKPOLICY"; then
   ac_ct_CHECKPOLICY=$CHECKPOLICY
   # Extract the first word of "checkpolicy", so it can be a program name with args.
 set dummy checkpolicy; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_ac_ct_CHECKPOLICY+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_ac_ct_CHECKPOLICY+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$ac_ct_CHECKPOLICY"; then
   ac_cv_prog_ac_ct_CHECKPOLICY="$ac_ct_CHECKPOLICY" # Let the user override the test.
 else
@@ -7099,11 +7983,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_ac_ct_CHECKPOLICY="checkpolicy"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -7114,11 +8002,11 @@ fi
 fi
 ac_ct_CHECKPOLICY=$ac_cv_prog_ac_ct_CHECKPOLICY
 if test -n "$ac_ct_CHECKPOLICY"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CHECKPOLICY" >&5
-$as_echo "$ac_ct_CHECKPOLICY" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_ct_CHECKPOLICY" >&5
+printf "%s\n" "$ac_ct_CHECKPOLICY" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_ct_CHECKPOLICY" = x; then
@@ -7126,8 +8014,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     CHECKPOLICY=$ac_ct_CHECKPOLICY
@@ -7144,9 +8032,11 @@ fi
      fi
   fi
 
-    if test "x$CHECKPOLICY" = "xno"; then :
+    if test "x$CHECKPOLICY" = "xno"
+then :
 
-        if test "x$enable_xsmpolicy" = "xyes"; then :
+        if test "x$enable_xsmpolicy" = "xyes"
+then :
 
             as_fn_error $? "XSM policy compilation enabled, but unable to find checkpolicy" "$LINENO" 5
 fi
@@ -7159,11 +8049,12 @@ case "$host_os" in
   freebsd*) ;;
   *) # Extract the first word of "bash", so it can be a program name with args.
 set dummy bash; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_BASH+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_BASH+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $BASH in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_BASH="$BASH" # Let the user override the test with a path.
@@ -7173,11 +8064,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_BASH="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_BASH="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -7190,11 +8085,11 @@ esac
 fi
 BASH=$ac_cv_path_BASH
 if test -n "$BASH"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $BASH" >&5
-$as_echo "$BASH" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $BASH" >&5
+printf "%s\n" "$BASH" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -7203,16 +8098,18 @@ then
     as_fn_error $? "Unable to find bash, please install bash" "$LINENO" 5
 fi;;
 esac
-if test -z "$PYTHON"; then :
+if test -z "$PYTHON"
+then :
   for ac_prog in python3 python python2
 do
   # Extract the first word of "$ac_prog", so it can be a program name with args.
 set dummy $ac_prog; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_prog_PYTHON+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_prog_PYTHON+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   if test -n "$PYTHON"; then
   ac_cv_prog_PYTHON="$PYTHON" # Let the user override the test.
 else
@@ -7220,11 +8117,15 @@ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
     ac_cv_prog_PYTHON="$ac_prog"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -7235,11 +8136,11 @@ fi
 fi
 PYTHON=$ac_cv_prog_PYTHON
 if test -n "$PYTHON"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $PYTHON" >&5
-$as_echo "$PYTHON" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $PYTHON" >&5
+printf "%s\n" "$PYTHON" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -7248,19 +8149,22 @@ done
 test -n "$PYTHON" || PYTHON="err"
 
 fi
-if test "$PYTHON" = "err"; then :
+if test "$PYTHON" = "err"
+then :
   as_fn_error $? "No python interpreter found" "$LINENO" 5
 fi
-if echo "$PYTHON" | grep -q "^/"; then :
+if echo "$PYTHON" | grep -q "^/"
+then :
 
-else
+else $as_nop
   # Extract the first word of "$PYTHON", so it can be a program name with args.
 set dummy $PYTHON; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_PYTHON+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_PYTHON+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $PYTHON in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_PYTHON="$PYTHON" # Let the user override the test with a path.
@@ -7270,11 +8174,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_PYTHON="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_PYTHON="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -7286,11 +8194,11 @@ esac
 fi
 PYTHON=$ac_cv_path_PYTHON
 if test -n "$PYTHON"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $PYTHON" >&5
-$as_echo "$PYTHON" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $PYTHON" >&5
+printf "%s\n" "$PYTHON" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -7300,11 +8208,12 @@ PYTHON=`basename $PYTHONPATH`
 
 # Extract the first word of "$PYTHON", so it can be a program name with args.
 set dummy $PYTHON; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_PYTHONPATH+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_PYTHONPATH+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $PYTHONPATH in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_PYTHONPATH="$PYTHONPATH" # Let the user override the test with a path.
@@ -7314,447 +8223,84 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_PYTHONPATH="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_PYTHONPATH="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
-  done
-IFS=$as_save_IFS
-
-  test -z "$ac_cv_path_PYTHONPATH" && ac_cv_path_PYTHONPATH="no"
-  ;;
-esac
-fi
-PYTHONPATH=$ac_cv_path_PYTHONPATH
-if test -n "$PYTHONPATH"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $PYTHONPATH" >&5
-$as_echo "$PYTHONPATH" >&6; }
-else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-fi
-
-
-if test x"${PYTHONPATH}" = x"no"
-then
-    as_fn_error $? "Unable to find $PYTHON, please install $PYTHON" "$LINENO" 5
-fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for python version >= 2.6 " >&5
-$as_echo_n "checking for python version >= 2.6 ... " >&6; }
-`$PYTHON -c 'import sys; sys.exit(eval("sys.version_info < (2, 6)"))'`
-if test "$?" != "0"
-then
-    python_version=`$PYTHON -V 2>&1`
-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-    as_fn_error $? "$python_version is too old, minimum required version is 2.6" "$LINENO" 5
-else
-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-fi
-
-ac_ext=c
-ac_cpp='$CPP $CPPFLAGS'
-ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-ac_compiler_gnu=$ac_cv_c_compiler_gnu
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to run the C preprocessor" >&5
-$as_echo_n "checking how to run the C preprocessor... " >&6; }
-# On Suns, sometimes $CPP names a directory.
-if test -n "$CPP" && test -d "$CPP"; then
-  CPP=
-fi
-if test -z "$CPP"; then
-  if ${ac_cv_prog_CPP+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
-      # Double quotes because CPP needs to be expanded
-    for CPP in "$CC -E" "$CC -E -traditional-cpp" "/lib/cpp"
-    do
-      ac_preproc_ok=false
-for ac_c_preproc_warn_flag in '' yes
-do
-  # Use a header file that comes with gcc, so configuring glibc
-  # with a fresh cross-compiler works.
-  # Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
-  # <limits.h> exists even on freestanding compilers.
-  # On the NeXT, cc -E runs the code through the compiler's parser,
-  # not just through cpp. "Syntax error" is here to catch this case.
-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-#ifdef __STDC__
-# include <limits.h>
-#else
-# include <assert.h>
-#endif
-		     Syntax error
-_ACEOF
-if ac_fn_c_try_cpp "$LINENO"; then :
-
-else
-  # Broken: fails on valid input.
-continue
-fi
-rm -f conftest.err conftest.i conftest.$ac_ext
-
-  # OK, works on sane cases.  Now check whether nonexistent headers
-  # can be detected and how.
-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-#include <ac_nonexistent.h>
-_ACEOF
-if ac_fn_c_try_cpp "$LINENO"; then :
-  # Broken: success on invalid input.
-continue
-else
-  # Passes both tests.
-ac_preproc_ok=:
-break
-fi
-rm -f conftest.err conftest.i conftest.$ac_ext
-
-done
-# Because of `break', _AC_PREPROC_IFELSE's cleaning code was skipped.
-rm -f conftest.i conftest.err conftest.$ac_ext
-if $ac_preproc_ok; then :
-  break
-fi
-
-    done
-    ac_cv_prog_CPP=$CPP
-
-fi
-  CPP=$ac_cv_prog_CPP
-else
-  ac_cv_prog_CPP=$CPP
-fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $CPP" >&5
-$as_echo "$CPP" >&6; }
-ac_preproc_ok=false
-for ac_c_preproc_warn_flag in '' yes
-do
-  # Use a header file that comes with gcc, so configuring glibc
-  # with a fresh cross-compiler works.
-  # Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
-  # <limits.h> exists even on freestanding compilers.
-  # On the NeXT, cc -E runs the code through the compiler's parser,
-  # not just through cpp. "Syntax error" is here to catch this case.
-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-#ifdef __STDC__
-# include <limits.h>
-#else
-# include <assert.h>
-#endif
-		     Syntax error
-_ACEOF
-if ac_fn_c_try_cpp "$LINENO"; then :
-
-else
-  # Broken: fails on valid input.
-continue
-fi
-rm -f conftest.err conftest.i conftest.$ac_ext
-
-  # OK, works on sane cases.  Now check whether nonexistent headers
-  # can be detected and how.
-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-#include <ac_nonexistent.h>
-_ACEOF
-if ac_fn_c_try_cpp "$LINENO"; then :
-  # Broken: success on invalid input.
-continue
-else
-  # Passes both tests.
-ac_preproc_ok=:
-break
-fi
-rm -f conftest.err conftest.i conftest.$ac_ext
-
-done
-# Because of `break', _AC_PREPROC_IFELSE's cleaning code was skipped.
-rm -f conftest.i conftest.err conftest.$ac_ext
-if $ac_preproc_ok; then :
-
-else
-  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
-as_fn_error $? "C preprocessor \"$CPP\" fails sanity check
-See \`config.log' for more details" "$LINENO" 5; }
-fi
-
-ac_ext=c
-ac_cpp='$CPP $CPPFLAGS'
-ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-ac_compiler_gnu=$ac_cv_c_compiler_gnu
-
-
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for grep that handles long lines and -e" >&5
-$as_echo_n "checking for grep that handles long lines and -e... " >&6; }
-if ${ac_cv_path_GREP+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
-  if test -z "$GREP"; then
-  ac_path_GREP_found=false
-  # Loop through the user's path and test for each of PROGNAME-LIST
-  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
-for as_dir in $PATH$PATH_SEPARATOR/usr/xpg4/bin
-do
-  IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-    for ac_prog in grep ggrep; do
-    for ac_exec_ext in '' $ac_executable_extensions; do
-      ac_path_GREP="$as_dir/$ac_prog$ac_exec_ext"
-      as_fn_executable_p "$ac_path_GREP" || continue
-# Check for GNU ac_path_GREP and select it if it is found.
-  # Check for GNU $ac_path_GREP
-case `"$ac_path_GREP" --version 2>&1` in
-*GNU*)
-  ac_cv_path_GREP="$ac_path_GREP" ac_path_GREP_found=:;;
-*)
-  ac_count=0
-  $as_echo_n 0123456789 >"conftest.in"
-  while :
-  do
-    cat "conftest.in" "conftest.in" >"conftest.tmp"
-    mv "conftest.tmp" "conftest.in"
-    cp "conftest.in" "conftest.nl"
-    $as_echo 'GREP' >> "conftest.nl"
-    "$ac_path_GREP" -e 'GREP$' -e '-(cannot match)-' < "conftest.nl" >"conftest.out" 2>/dev/null || break
-    diff "conftest.out" "conftest.nl" >/dev/null 2>&1 || break
-    as_fn_arith $ac_count + 1 && ac_count=$as_val
-    if test $ac_count -gt ${ac_path_GREP_max-0}; then
-      # Best one so far, save it but keep looking for a better one
-      ac_cv_path_GREP="$ac_path_GREP"
-      ac_path_GREP_max=$ac_count
-    fi
-    # 10*(2^10) chars as input seems more than enough
-    test $ac_count -gt 10 && break
-  done
-  rm -f conftest.in conftest.tmp conftest.nl conftest.out;;
-esac
-
-      $ac_path_GREP_found && break 3
-    done
-  done
-  done
-IFS=$as_save_IFS
-  if test -z "$ac_cv_path_GREP"; then
-    as_fn_error $? "no acceptable grep could be found in $PATH$PATH_SEPARATOR/usr/xpg4/bin" "$LINENO" 5
-  fi
-else
-  ac_cv_path_GREP=$GREP
-fi
-
-fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_path_GREP" >&5
-$as_echo "$ac_cv_path_GREP" >&6; }
- GREP="$ac_cv_path_GREP"
-
-
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for egrep" >&5
-$as_echo_n "checking for egrep... " >&6; }
-if ${ac_cv_path_EGREP+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
-  if echo a | $GREP -E '(a|b)' >/dev/null 2>&1
-   then ac_cv_path_EGREP="$GREP -E"
-   else
-     if test -z "$EGREP"; then
-  ac_path_EGREP_found=false
-  # Loop through the user's path and test for each of PROGNAME-LIST
-  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
-for as_dir in $PATH$PATH_SEPARATOR/usr/xpg4/bin
-do
-  IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-    for ac_prog in egrep; do
-    for ac_exec_ext in '' $ac_executable_extensions; do
-      ac_path_EGREP="$as_dir/$ac_prog$ac_exec_ext"
-      as_fn_executable_p "$ac_path_EGREP" || continue
-# Check for GNU ac_path_EGREP and select it if it is found.
-  # Check for GNU $ac_path_EGREP
-case `"$ac_path_EGREP" --version 2>&1` in
-*GNU*)
-  ac_cv_path_EGREP="$ac_path_EGREP" ac_path_EGREP_found=:;;
-*)
-  ac_count=0
-  $as_echo_n 0123456789 >"conftest.in"
-  while :
-  do
-    cat "conftest.in" "conftest.in" >"conftest.tmp"
-    mv "conftest.tmp" "conftest.in"
-    cp "conftest.in" "conftest.nl"
-    $as_echo 'EGREP' >> "conftest.nl"
-    "$ac_path_EGREP" 'EGREP$' < "conftest.nl" >"conftest.out" 2>/dev/null || break
-    diff "conftest.out" "conftest.nl" >/dev/null 2>&1 || break
-    as_fn_arith $ac_count + 1 && ac_count=$as_val
-    if test $ac_count -gt ${ac_path_EGREP_max-0}; then
-      # Best one so far, save it but keep looking for a better one
-      ac_cv_path_EGREP="$ac_path_EGREP"
-      ac_path_EGREP_max=$ac_count
-    fi
-    # 10*(2^10) chars as input seems more than enough
-    test $ac_count -gt 10 && break
-  done
-  rm -f conftest.in conftest.tmp conftest.nl conftest.out;;
-esac
-
-      $ac_path_EGREP_found && break 3
-    done
-  done
-  done
-IFS=$as_save_IFS
-  if test -z "$ac_cv_path_EGREP"; then
-    as_fn_error $? "no acceptable egrep could be found in $PATH$PATH_SEPARATOR/usr/xpg4/bin" "$LINENO" 5
-  fi
-else
-  ac_cv_path_EGREP=$EGREP
-fi
-
-   fi
-fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_path_EGREP" >&5
-$as_echo "$ac_cv_path_EGREP" >&6; }
- EGREP="$ac_cv_path_EGREP"
-
-
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for ANSI C header files" >&5
-$as_echo_n "checking for ANSI C header files... " >&6; }
-if ${ac_cv_header_stdc+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-#include <stdlib.h>
-#include <stdarg.h>
-#include <string.h>
-#include <float.h>
-
-int
-main ()
-{
-
-  ;
-  return 0;
-}
-_ACEOF
-if ac_fn_c_try_compile "$LINENO"; then :
-  ac_cv_header_stdc=yes
-else
-  ac_cv_header_stdc=no
-fi
-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-
-if test $ac_cv_header_stdc = yes; then
-  # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-#include <string.h>
-
-_ACEOF
-if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
-  $EGREP "memchr" >/dev/null 2>&1; then :
-
-else
-  ac_cv_header_stdc=no
-fi
-rm -f conftest*
-
-fi
-
-if test $ac_cv_header_stdc = yes; then
-  # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-#include <stdlib.h>
-
-_ACEOF
-if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
-  $EGREP "free" >/dev/null 2>&1; then :
-
-else
-  ac_cv_header_stdc=no
-fi
-rm -f conftest*
-
-fi
-
-if test $ac_cv_header_stdc = yes; then
-  # /bin/cc in Irix-4.0.5 gets non-ANSI ctype macros unless using -ansi.
-  if test "$cross_compiling" = yes; then :
-  :
-else
-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-#include <ctype.h>
-#include <stdlib.h>
-#if ((' ' & 0x0FF) == 0x020)
-# define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
-# define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
-#else
-# define ISLOWER(c) \
-		   (('a' <= (c) && (c) <= 'i') \
-		     || ('j' <= (c) && (c) <= 'r') \
-		     || ('s' <= (c) && (c) <= 'z'))
-# define TOUPPER(c) (ISLOWER(c) ? ((c) | 0x40) : (c))
-#endif
-
-#define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
-int
-main ()
-{
-  int i;
-  for (i = 0; i < 256; i++)
-    if (XOR (islower (i), ISLOWER (i))
-	|| toupper (i) != TOUPPER (i))
-      return 2;
-  return 0;
-}
-_ACEOF
-if ac_fn_c_try_run "$LINENO"; then :
+  done
+IFS=$as_save_IFS
 
-else
-  ac_cv_header_stdc=no
+  test -z "$ac_cv_path_PYTHONPATH" && ac_cv_path_PYTHONPATH="no"
+  ;;
+esac
 fi
-rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
-  conftest.$ac_objext conftest.beam conftest.$ac_ext
+PYTHONPATH=$ac_cv_path_PYTHONPATH
+if test -n "$PYTHONPATH"; then
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $PYTHONPATH" >&5
+printf "%s\n" "$PYTHONPATH" >&6; }
+else
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
+
+if test x"${PYTHONPATH}" = x"no"
+then
+    as_fn_error $? "Unable to find $PYTHON, please install $PYTHON" "$LINENO" 5
 fi
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for python version >= 2.6 " >&5
+printf %s "checking for python version >= 2.6 ... " >&6; }
+`$PYTHON -c 'import sys; sys.exit(eval("sys.version_info < (2, 6)"))'`
+if test "$?" != "0"
+then
+    python_version=`$PYTHON -V 2>&1`
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+    as_fn_error $? "$python_version is too old, minimum required version is 2.6" "$LINENO" 5
+else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_header_stdc" >&5
-$as_echo "$ac_cv_header_stdc" >&6; }
-if test $ac_cv_header_stdc = yes; then
 
-$as_echo "#define STDC_HEADERS 1" >>confdefs.h
+ac_header= ac_cache=
+for ac_item in $ac_header_c_list
+do
+  if test $ac_cache; then
+    ac_fn_c_check_header_compile "$LINENO" $ac_header ac_cv_header_$ac_cache "$ac_includes_default"
+    if eval test \"x\$ac_cv_header_$ac_cache\" = xyes; then
+      printf "%s\n" "#define $ac_item 1" >> confdefs.h
+    fi
+    ac_header= ac_cache=
+  elif test $ac_header; then
+    ac_cache=$ac_item
+  else
+    ac_header=$ac_item
+  fi
+done
+
+
+
 
-fi
 
-# On IRIX 5.3, sys/types and inttypes.h are conflicting.
-for ac_header in sys/types.h sys/stat.h stdlib.h string.h memory.h strings.h \
-		  inttypes.h stdint.h unistd.h
-do :
-  as_ac_Header=`$as_echo "ac_cv_header_$ac_header" | $as_tr_sh`
-ac_fn_c_check_header_compile "$LINENO" "$ac_header" "$as_ac_Header" "$ac_includes_default
-"
-if eval test \"x\$"$as_ac_Header"\" = x"yes"; then :
-  cat >>confdefs.h <<_ACEOF
-#define `$as_echo "HAVE_$ac_header" | $as_tr_cpp` 1
-_ACEOF
 
-fi
 
-done
 
+if test $ac_cv_header_stdlib_h = yes && test $ac_cv_header_string_h = yes
+then :
 
-if test "$cross_compiling" != yes; then :
+printf "%s\n" "#define STDC_HEADERS 1" >>confdefs.h
+
+fi
+if test "$cross_compiling" != yes
+then :
 
 
 ac_previous_cppflags=$CPPFLAGS
@@ -7762,11 +8308,12 @@ ac_previous_ldflags=$LDFLAGS
 ac_previous_libs=$LIBS
 # Extract the first word of "$PYTHON-config", so it can be a program name with args.
 set dummy $PYTHON-config; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_pyconfig+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_pyconfig+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $pyconfig in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_pyconfig="$pyconfig" # Let the user override the test with a path.
@@ -7776,11 +8323,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_pyconfig="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_pyconfig="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -7793,33 +8344,34 @@ esac
 fi
 pyconfig=$ac_cv_path_pyconfig
 if test -n "$pyconfig"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $pyconfig" >&5
-$as_echo "$pyconfig" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $pyconfig" >&5
+printf "%s\n" "$pyconfig" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
-if test x"$pyconfig" = x"no"; then :
+if test x"$pyconfig" = x"no"
+then :
 
-        CPPFLAGS="$CFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print("-I" + distutils.sysconfig.get_config_var("INCLUDEPY"))'`"
-    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("CFLAGS"))'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print("-L" + distutils.sysconfig.get_python_lib(plat_specific=1,\
+        CPPFLAGS="$CFLAGS `$PYTHON -c 'import sysconfig; \
+        print("-I" + sysconfig.get_config_var("INCLUDEPY"))'`"
+    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("CFLAGS"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print("-L" + sysconfig.get_python_lib(plat_specific=1,\
         standard_lib=1) + "/config")'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LINKFORSHARED"))'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LDFLAGS"))'`"
-    LIBS="$LIBS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LIBS"))'`"
-    LIBS="$LIBS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("SYSLIBS"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LINKFORSHARED"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LDFLAGS"))'`"
+    LIBS="$LIBS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LIBS"))'`"
+    LIBS="$LIBS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("SYSLIBS"))'`"
 
-else
+else $as_nop
 
         CPPFLAGS="$CFLAGS `$PYTHON-config --cflags`"
             python_devel_embed=""
@@ -7832,18 +8384,19 @@ else
 
 fi
 
-ac_fn_c_check_header_mongrel "$LINENO" "Python.h" "ac_cv_header_Python_h" "$ac_includes_default"
-if test "x$ac_cv_header_Python_h" = xyes; then :
+ac_fn_c_check_header_compile "$LINENO" "Python.h" "ac_cv_header_Python_h" "$ac_includes_default"
+if test "x$ac_cv_header_Python_h" = xyes
+then :
 
-else
+else $as_nop
   as_fn_error $? "Unable to find Python development headers" "$LINENO" 5
 fi
 
-
 ac_fn_c_check_func "$LINENO" "PyArg_ParseTuple" "ac_cv_func_PyArg_ParseTuple"
-if test "x$ac_cv_func_PyArg_ParseTuple" = xyes; then :
+if test "x$ac_cv_func_PyArg_ParseTuple" = xyes
+then :
 
-else
+else $as_nop
   as_fn_error $? "Unable to find a suitable python development library" "$LINENO" 5
 fi
 
@@ -7853,11 +8406,12 @@ LDFLAGS=$ac_previous_ldflags
 LIBS=$ac_previous_libs
 
 
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether Python setup.py brokenly enables -D_FORTIFY_SOURCE" >&5
-$as_echo_n "checking whether Python setup.py brokenly enables -D_FORTIFY_SOURCE... " >&6; }
-if ${ax_cv_python_fortify+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking whether Python setup.py brokenly enables -D_FORTIFY_SOURCE" >&5
+printf %s "checking whether Python setup.py brokenly enables -D_FORTIFY_SOURCE... " >&6; }
+if test ${ax_cv_python_fortify+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
 
         ax_cv_python_fortify=no
         for arg in $($PYTHON-config --cflags); do
@@ -7871,14 +8425,15 @@ else
         done
 
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_python_fortify" >&5
-$as_echo "$ax_cv_python_fortify" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ax_cv_python_fortify" >&5
+printf "%s\n" "$ax_cv_python_fortify" >&6; }
 
-    if test x$ax_cv_python_fortify = xyes; then :
+    if test x$ax_cv_python_fortify = xyes
+then :
 
         PY_NOOPT_CFLAGS=-O1
 
-else
+else $as_nop
 
         PY_NOOPT_CFLAGS=''
 
@@ -7895,11 +8450,12 @@ case "$host_cpu" in
 i[3456]86|x86_64|aarch64)
     # Extract the first word of "iasl", so it can be a program name with args.
 set dummy iasl; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_IASL+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_IASL+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $IASL in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_IASL="$IASL" # Let the user override the test with a path.
@@ -7909,11 +8465,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_IASL="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_IASL="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -7926,11 +8486,11 @@ esac
 fi
 IASL=$ac_cv_path_IASL
 if test -n "$IASL"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $IASL" >&5
-$as_echo "$IASL" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $IASL" >&5
+printf "%s\n" "$IASL" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -7941,14 +8501,16 @@ fi
     ;;
 esac
 
-ac_fn_c_check_header_mongrel "$LINENO" "uuid/uuid.h" "ac_cv_header_uuid_uuid_h" "$ac_includes_default"
-if test "x$ac_cv_header_uuid_uuid_h" = xyes; then :
+ac_fn_c_check_header_compile "$LINENO" "uuid/uuid.h" "ac_cv_header_uuid_uuid_h" "$ac_includes_default"
+if test "x$ac_cv_header_uuid_uuid_h" = xyes
+then :
 
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for uuid_clear in -luuid" >&5
-$as_echo_n "checking for uuid_clear in -luuid... " >&6; }
-if ${ac_cv_lib_uuid_uuid_clear+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for uuid_clear in -luuid" >&5
+printf %s "checking for uuid_clear in -luuid... " >&6; }
+if test ${ac_cv_lib_uuid_uuid_clear+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-luuid  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -7957,58 +8519,59 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char uuid_clear ();
 int
-main ()
+main (void)
 {
 return uuid_clear ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_uuid_uuid_clear=yes
-else
+else $as_nop
   ac_cv_lib_uuid_uuid_clear=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_uuid_uuid_clear" >&5
-$as_echo "$ac_cv_lib_uuid_uuid_clear" >&6; }
-if test "x$ac_cv_lib_uuid_uuid_clear" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_uuid_uuid_clear" >&5
+printf "%s\n" "$ac_cv_lib_uuid_uuid_clear" >&6; }
+if test "x$ac_cv_lib_uuid_uuid_clear" = xyes
+then :
   libuuid="y"
 fi
 
 
 fi
 
-
-ac_fn_c_check_header_mongrel "$LINENO" "uuid.h" "ac_cv_header_uuid_h" "$ac_includes_default"
-if test "x$ac_cv_header_uuid_h" = xyes; then :
+ac_fn_c_check_header_compile "$LINENO" "uuid.h" "ac_cv_header_uuid_h" "$ac_includes_default"
+if test "x$ac_cv_header_uuid_h" = xyes
+then :
   libuuid="y"
 fi
 
-
-if test "$libuuid" != "y"; then :
+if test "$libuuid" != "y"
+then :
 
     as_fn_error $? "cannot find a valid uuid library" "$LINENO" 5
 
 fi
 
 
-ac_fn_c_check_header_mongrel "$LINENO" "curses.h" "ac_cv_header_curses_h" "$ac_includes_default"
-if test "x$ac_cv_header_curses_h" = xyes; then :
+ac_fn_c_check_header_compile "$LINENO" "curses.h" "ac_cv_header_curses_h" "$ac_includes_default"
+if test "x$ac_cv_header_curses_h" = xyes
+then :
 
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for clear in -lcurses" >&5
-$as_echo_n "checking for clear in -lcurses... " >&6; }
-if ${ac_cv_lib_curses_clear+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for clear in -lcurses" >&5
+printf %s "checking for clear in -lcurses... " >&6; }
+if test ${ac_cv_lib_curses_clear+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-lcurses  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -8017,49 +8580,49 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char clear ();
 int
-main ()
+main (void)
 {
 return clear ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_curses_clear=yes
-else
+else $as_nop
   ac_cv_lib_curses_clear=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_curses_clear" >&5
-$as_echo "$ac_cv_lib_curses_clear" >&6; }
-if test "x$ac_cv_lib_curses_clear" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_curses_clear" >&5
+printf "%s\n" "$ac_cv_lib_curses_clear" >&6; }
+if test "x$ac_cv_lib_curses_clear" = xyes
+then :
   curses="y"
-else
+else $as_nop
   curses="n"
 fi
 
 
-else
+else $as_nop
   curses="n"
 fi
 
+ac_fn_c_check_header_compile "$LINENO" "ncurses.h" "ac_cv_header_ncurses_h" "$ac_includes_default"
+if test "x$ac_cv_header_ncurses_h" = xyes
+then :
 
-ac_fn_c_check_header_mongrel "$LINENO" "ncurses.h" "ac_cv_header_ncurses_h" "$ac_includes_default"
-if test "x$ac_cv_header_ncurses_h" = xyes; then :
-
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for clear in -lncurses" >&5
-$as_echo_n "checking for clear in -lncurses... " >&6; }
-if ${ac_cv_lib_ncurses_clear+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for clear in -lncurses" >&5
+printf %s "checking for clear in -lncurses... " >&6; }
+if test ${ac_cv_lib_ncurses_clear+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-lncurses  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -8068,71 +8631,73 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char clear ();
 int
-main ()
+main (void)
 {
 return clear ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_ncurses_clear=yes
-else
+else $as_nop
   ac_cv_lib_ncurses_clear=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_ncurses_clear" >&5
-$as_echo "$ac_cv_lib_ncurses_clear" >&6; }
-if test "x$ac_cv_lib_ncurses_clear" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_ncurses_clear" >&5
+printf "%s\n" "$ac_cv_lib_ncurses_clear" >&6; }
+if test "x$ac_cv_lib_ncurses_clear" = xyes
+then :
   ncurses="y"
-else
+else $as_nop
   ncurses="n"
 fi
 
 
-else
+else $as_nop
   ncurses="n"
 fi
 
-
-if test "$curses" = "n" && test "$ncurses" = "n"; then :
+if test "$curses" = "n" && test "$ncurses" = "n"
+then :
 
     as_fn_error $? "Unable to find a suitable curses library" "$LINENO" 5
 
 fi
 # Prefer ncurses over curses if both are present
-if test "$ncurses" = "y"; then :
+if test "$ncurses" = "y"
+then :
 
     CURSES_LIBS="-lncurses"
 
-$as_echo "#define INCLUDE_CURSES_H <ncurses.h>" >>confdefs.h
+printf "%s\n" "#define INCLUDE_CURSES_H <ncurses.h>" >>confdefs.h
 
 
-else
+else $as_nop
 
     CURSES_LIBS="-lcurses"
 
-$as_echo "#define INCLUDE_CURSES_H <curses.h>" >>confdefs.h
+printf "%s\n" "#define INCLUDE_CURSES_H <curses.h>" >>confdefs.h
 
 
 fi
 
 
-if test "$ncurses" = "y"; then :
+if test "$ncurses" = "y"
+then :
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for define_key in -ltinfo" >&5
-$as_echo_n "checking for define_key in -ltinfo... " >&6; }
-if ${ac_cv_lib_tinfo_define_key+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for define_key in -ltinfo" >&5
+printf %s "checking for define_key in -ltinfo... " >&6; }
+if test ${ac_cv_lib_tinfo_define_key+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-ltinfo  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -8141,30 +8706,29 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char define_key ();
 int
-main ()
+main (void)
 {
 return define_key ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_tinfo_define_key=yes
-else
+else $as_nop
   ac_cv_lib_tinfo_define_key=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_tinfo_define_key" >&5
-$as_echo "$ac_cv_lib_tinfo_define_key" >&6; }
-if test "x$ac_cv_lib_tinfo_define_key" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_tinfo_define_key" >&5
+printf "%s\n" "$ac_cv_lib_tinfo_define_key" >&6; }
+if test "x$ac_cv_lib_tinfo_define_key" = xyes
+then :
   TINFO_LIBS=-ltinfo
 fi
 
@@ -8183,11 +8747,12 @@ if test "x$ac_cv_env_PKG_CONFIG_set" != "xset"; then
 	if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}pkg-config", so it can be a program name with args.
 set dummy ${ac_tool_prefix}pkg-config; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_PKG_CONFIG+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_PKG_CONFIG+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $PKG_CONFIG in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_PKG_CONFIG="$PKG_CONFIG" # Let the user override the test with a path.
@@ -8197,11 +8762,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_PKG_CONFIG="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_PKG_CONFIG="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -8213,11 +8782,11 @@ esac
 fi
 PKG_CONFIG=$ac_cv_path_PKG_CONFIG
 if test -n "$PKG_CONFIG"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $PKG_CONFIG" >&5
-$as_echo "$PKG_CONFIG" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $PKG_CONFIG" >&5
+printf "%s\n" "$PKG_CONFIG" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -8226,11 +8795,12 @@ if test -z "$ac_cv_path_PKG_CONFIG"; then
   ac_pt_PKG_CONFIG=$PKG_CONFIG
   # Extract the first word of "pkg-config", so it can be a program name with args.
 set dummy pkg-config; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_ac_pt_PKG_CONFIG+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_ac_pt_PKG_CONFIG+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $ac_pt_PKG_CONFIG in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_ac_pt_PKG_CONFIG="$ac_pt_PKG_CONFIG" # Let the user override the test with a path.
@@ -8240,11 +8810,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_ac_pt_PKG_CONFIG="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_ac_pt_PKG_CONFIG="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -8256,11 +8830,11 @@ esac
 fi
 ac_pt_PKG_CONFIG=$ac_cv_path_ac_pt_PKG_CONFIG
 if test -n "$ac_pt_PKG_CONFIG"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_pt_PKG_CONFIG" >&5
-$as_echo "$ac_pt_PKG_CONFIG" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_pt_PKG_CONFIG" >&5
+printf "%s\n" "$ac_pt_PKG_CONFIG" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
   if test "x$ac_pt_PKG_CONFIG" = x; then
@@ -8268,8 +8842,8 @@ fi
   else
     case $cross_compiling:$ac_tool_warned in
 yes:)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
-$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
+printf "%s\n" "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 ac_tool_warned=yes ;;
 esac
     PKG_CONFIG=$ac_pt_PKG_CONFIG
@@ -8281,32 +8855,33 @@ fi
 fi
 if test -n "$PKG_CONFIG"; then
 	_pkg_min_version=0.9.0
-	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking pkg-config is at least version $_pkg_min_version" >&5
-$as_echo_n "checking pkg-config is at least version $_pkg_min_version... " >&6; }
+	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking pkg-config is at least version $_pkg_min_version" >&5
+printf %s "checking pkg-config is at least version $_pkg_min_version... " >&6; }
 	if $PKG_CONFIG --atleast-pkgconfig-version $_pkg_min_version; then
-		{ $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+		{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 	else
-		{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+		{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 		PKG_CONFIG=""
 	fi
 fi
-if test "x$qemu_xen" = "xy"; then :
+if test "x$qemu_xen" = "xy"
+then :
 
 
 pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for glib" >&5
-$as_echo_n "checking for glib... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for glib" >&5
+printf %s "checking for glib... " >&6; }
 
 if test -n "$glib_CFLAGS"; then
     pkg_cv_glib_CFLAGS="$glib_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"glib-2.0 >= 2.12\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"glib-2.0 >= 2.12\""; } >&5
   ($PKG_CONFIG --exists --print-errors "glib-2.0 >= 2.12") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_glib_CFLAGS=`$PKG_CONFIG --cflags "glib-2.0 >= 2.12" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -8320,10 +8895,10 @@ if test -n "$glib_LIBS"; then
     pkg_cv_glib_LIBS="$glib_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"glib-2.0 >= 2.12\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"glib-2.0 >= 2.12\""; } >&5
   ($PKG_CONFIG --exists --print-errors "glib-2.0 >= 2.12") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_glib_LIBS=`$PKG_CONFIG --libs "glib-2.0 >= 2.12" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -8337,8 +8912,8 @@ fi
 
 
 if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
         _pkg_short_errors_supported=yes
@@ -8364,10 +8939,10 @@ Alternatively, you may set the environment variables glib_CFLAGS
 and glib_LIBS to avoid the need to call pkg-config.
 See the pkg-config man page for more details." "$LINENO" 5
 elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-	{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+	{ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error $? "The pkg-config script could not be found or is too old.  Make sure it
 is in your PATH or set the PKG_CONFIG environment variable to the full
 path to pkg-config.
@@ -8381,23 +8956,23 @@ See \`config.log' for more details" "$LINENO" 5; }
 else
 	glib_CFLAGS=$pkg_cv_glib_CFLAGS
 	glib_LIBS=$pkg_cv_glib_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 
 fi
 
 pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for pixman" >&5
-$as_echo_n "checking for pixman... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for pixman" >&5
+printf %s "checking for pixman... " >&6; }
 
 if test -n "$pixman_CFLAGS"; then
     pkg_cv_pixman_CFLAGS="$pixman_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"pixman-1 >= 0.21.8\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"pixman-1 >= 0.21.8\""; } >&5
   ($PKG_CONFIG --exists --print-errors "pixman-1 >= 0.21.8") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_pixman_CFLAGS=`$PKG_CONFIG --cflags "pixman-1 >= 0.21.8" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -8411,10 +8986,10 @@ if test -n "$pixman_LIBS"; then
     pkg_cv_pixman_LIBS="$pixman_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"pixman-1 >= 0.21.8\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"pixman-1 >= 0.21.8\""; } >&5
   ($PKG_CONFIG --exists --print-errors "pixman-1 >= 0.21.8") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_pixman_LIBS=`$PKG_CONFIG --libs "pixman-1 >= 0.21.8" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -8428,8 +9003,8 @@ fi
 
 
 if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
         _pkg_short_errors_supported=yes
@@ -8455,10 +9030,10 @@ Alternatively, you may set the environment variables pixman_CFLAGS
 and pixman_LIBS to avoid the need to call pkg-config.
 See the pkg-config man page for more details." "$LINENO" 5
 elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-	{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+	{ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error $? "The pkg-config script could not be found or is too old.  Make sure it
 is in your PATH or set the PKG_CONFIG environment variable to the full
 path to pkg-config.
@@ -8472,8 +9047,8 @@ See \`config.log' for more details" "$LINENO" 5; }
 else
 	pixman_CFLAGS=$pkg_cv_pixman_CFLAGS
 	pixman_LIBS=$pkg_cv_pixman_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 
 fi
 
@@ -8481,11 +9056,12 @@ fi
 
 # Extract the first word of "wget", so it can be a program name with args.
 set dummy wget; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_WGET+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_WGET+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $WGET in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_WGET="$WGET" # Let the user override the test with a path.
@@ -8495,11 +9071,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_WGET="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_WGET="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -8512,21 +9092,22 @@ esac
 fi
 WGET=$ac_cv_path_WGET
 if test -n "$WGET"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $WGET" >&5
-$as_echo "$WGET" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $WGET" >&5
+printf "%s\n" "$WGET" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
 # Extract the first word of "false", so it can be a program name with args.
 set dummy false; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_FALSE+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_FALSE+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $FALSE in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_FALSE="$FALSE" # Let the user override the test with a path.
@@ -8536,11 +9117,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_FALSE="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_FALSE="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -8553,27 +9138,29 @@ esac
 fi
 FALSE=$ac_cv_path_FALSE
 if test -n "$FALSE"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $FALSE" >&5
-$as_echo "$FALSE" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $FALSE" >&5
+printf "%s\n" "$FALSE" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
-if test x"$WGET" != x"no"; then :
+if test x"$WGET" != x"no"
+then :
 
     FETCHER="$WGET -c -O"
 
-else
+else $as_nop
 
     # Extract the first word of "ftp", so it can be a program name with args.
 set dummy ftp; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_FTP+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_FTP+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $FTP in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_FTP="$FTP" # Let the user override the test with a path.
@@ -8583,11 +9170,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_FTP="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_FTP="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -8600,23 +9191,24 @@ esac
 fi
 FTP=$ac_cv_path_FTP
 if test -n "$FTP"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $FTP" >&5
-$as_echo "$FTP" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $FTP" >&5
+printf "%s\n" "$FTP" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
-    if test x"$FTP" != x"no"; then :
+    if test x"$FTP" != x"no"
+then :
 
         FETCHER="$FTP -o"
 
-else
+else $as_nop
 
         FETCHER="$FALSE"
-        { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: cannot find wget or ftp" >&5
-$as_echo "$as_me: WARNING: cannot find wget or ftp" >&2;}
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: cannot find wget or ftp" >&5
+printf "%s\n" "$as_me: WARNING: cannot find wget or ftp" >&2;}
 
 fi
 
@@ -8625,14 +9217,16 @@ fi
 
 
 # Checks for libraries.
-ac_fn_c_check_header_mongrel "$LINENO" "bzlib.h" "ac_cv_header_bzlib_h" "$ac_includes_default"
-if test "x$ac_cv_header_bzlib_h" = xyes; then :
-
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for BZ2_bzDecompressInit in -lbz2" >&5
-$as_echo_n "checking for BZ2_bzDecompressInit in -lbz2... " >&6; }
-if ${ac_cv_lib_bz2_BZ2_bzDecompressInit+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+ac_fn_c_check_header_compile "$LINENO" "bzlib.h" "ac_cv_header_bzlib_h" "$ac_includes_default"
+if test "x$ac_cv_header_bzlib_h" = xyes
+then :
+
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for BZ2_bzDecompressInit in -lbz2" >&5
+printf %s "checking for BZ2_bzDecompressInit in -lbz2... " >&6; }
+if test ${ac_cv_lib_bz2_BZ2_bzDecompressInit+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-lbz2  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -8641,30 +9235,29 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char BZ2_bzDecompressInit ();
 int
-main ()
+main (void)
 {
 return BZ2_bzDecompressInit ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_bz2_BZ2_bzDecompressInit=yes
-else
+else $as_nop
   ac_cv_lib_bz2_BZ2_bzDecompressInit=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_bz2_BZ2_bzDecompressInit" >&5
-$as_echo "$ac_cv_lib_bz2_BZ2_bzDecompressInit" >&6; }
-if test "x$ac_cv_lib_bz2_BZ2_bzDecompressInit" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_bz2_BZ2_bzDecompressInit" >&5
+printf "%s\n" "$ac_cv_lib_bz2_BZ2_bzDecompressInit" >&6; }
+if test "x$ac_cv_lib_bz2_BZ2_bzDecompressInit" = xyes
+then :
   ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_BZLIB"
          ZLIB_LIBS="$ZLIB_LIBS -lbz2"
 fi
@@ -8672,15 +9265,16 @@ fi
 
 fi
 
+ac_fn_c_check_header_compile "$LINENO" "lzma.h" "ac_cv_header_lzma_h" "$ac_includes_default"
+if test "x$ac_cv_header_lzma_h" = xyes
+then :
 
-ac_fn_c_check_header_mongrel "$LINENO" "lzma.h" "ac_cv_header_lzma_h" "$ac_includes_default"
-if test "x$ac_cv_header_lzma_h" = xyes; then :
-
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for lzma_stream_decoder in -llzma" >&5
-$as_echo_n "checking for lzma_stream_decoder in -llzma... " >&6; }
-if ${ac_cv_lib_lzma_lzma_stream_decoder+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for lzma_stream_decoder in -llzma" >&5
+printf %s "checking for lzma_stream_decoder in -llzma... " >&6; }
+if test ${ac_cv_lib_lzma_lzma_stream_decoder+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-llzma  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -8689,30 +9283,29 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char lzma_stream_decoder ();
 int
-main ()
+main (void)
 {
 return lzma_stream_decoder ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_lzma_lzma_stream_decoder=yes
-else
+else $as_nop
   ac_cv_lib_lzma_lzma_stream_decoder=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_lzma_lzma_stream_decoder" >&5
-$as_echo "$ac_cv_lib_lzma_lzma_stream_decoder" >&6; }
-if test "x$ac_cv_lib_lzma_lzma_stream_decoder" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_lzma_lzma_stream_decoder" >&5
+printf "%s\n" "$ac_cv_lib_lzma_lzma_stream_decoder" >&6; }
+if test "x$ac_cv_lib_lzma_lzma_stream_decoder" = xyes
+then :
   ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_LZMA"
          ZLIB_LIBS="$ZLIB_LIBS -llzma"
 fi
@@ -8720,15 +9313,16 @@ fi
 
 fi
 
+ac_fn_c_check_header_compile "$LINENO" "lzo/lzo1x.h" "ac_cv_header_lzo_lzo1x_h" "$ac_includes_default"
+if test "x$ac_cv_header_lzo_lzo1x_h" = xyes
+then :
 
-ac_fn_c_check_header_mongrel "$LINENO" "lzo/lzo1x.h" "ac_cv_header_lzo_lzo1x_h" "$ac_includes_default"
-if test "x$ac_cv_header_lzo_lzo1x_h" = xyes; then :
-
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for lzo1x_decompress in -llzo2" >&5
-$as_echo_n "checking for lzo1x_decompress in -llzo2... " >&6; }
-if ${ac_cv_lib_lzo2_lzo1x_decompress+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for lzo1x_decompress in -llzo2" >&5
+printf %s "checking for lzo1x_decompress in -llzo2... " >&6; }
+if test ${ac_cv_lib_lzo2_lzo1x_decompress+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-llzo2  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -8737,30 +9331,29 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char lzo1x_decompress ();
 int
-main ()
+main (void)
 {
 return lzo1x_decompress ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_lzo2_lzo1x_decompress=yes
-else
+else $as_nop
   ac_cv_lib_lzo2_lzo1x_decompress=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_lzo2_lzo1x_decompress" >&5
-$as_echo "$ac_cv_lib_lzo2_lzo1x_decompress" >&6; }
-if test "x$ac_cv_lib_lzo2_lzo1x_decompress" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_lzo2_lzo1x_decompress" >&5
+printf "%s\n" "$ac_cv_lib_lzo2_lzo1x_decompress" >&6; }
+if test "x$ac_cv_lib_lzo2_lzo1x_decompress" = xyes
+then :
   ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_LZO1X"
          ZLIB_LIBS="$ZLIB_LIBS -llzo2"
 fi
@@ -8769,19 +9362,18 @@ fi
 fi
 
 
-
 pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for libzstd" >&5
-$as_echo_n "checking for libzstd... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for libzstd" >&5
+printf %s "checking for libzstd... " >&6; }
 
 if test -n "$libzstd_CFLAGS"; then
     pkg_cv_libzstd_CFLAGS="$libzstd_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libzstd\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libzstd\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libzstd") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_libzstd_CFLAGS=`$PKG_CONFIG --cflags "libzstd" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -8795,10 +9387,10 @@ if test -n "$libzstd_LIBS"; then
     pkg_cv_libzstd_LIBS="$libzstd_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libzstd\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libzstd\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libzstd") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_libzstd_LIBS=`$PKG_CONFIG --libs "libzstd" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -8812,8 +9404,8 @@ fi
 
 
 if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
         _pkg_short_errors_supported=yes
@@ -8830,28 +9422,30 @@ fi
 
 	true
 elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 	true
 else
 	libzstd_CFLAGS=$pkg_cv_libzstd_CFLAGS
 	libzstd_LIBS=$pkg_cv_libzstd_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 	ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_ZSTD $libzstd_CFLAGS"
      ZLIB_LIBS="$ZLIB_LIBS $libzstd_LIBS"
 fi
 
 
 
-ac_fn_c_check_header_mongrel "$LINENO" "ext2fs/ext2fs.h" "ac_cv_header_ext2fs_ext2fs_h" "$ac_includes_default"
-if test "x$ac_cv_header_ext2fs_ext2fs_h" = xyes; then :
+ac_fn_c_check_header_compile "$LINENO" "ext2fs/ext2fs.h" "ac_cv_header_ext2fs_ext2fs_h" "$ac_includes_default"
+if test "x$ac_cv_header_ext2fs_ext2fs_h" = xyes
+then :
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for ext2fs_open2 in -lext2fs" >&5
-$as_echo_n "checking for ext2fs_open2 in -lext2fs... " >&6; }
-if ${ac_cv_lib_ext2fs_ext2fs_open2+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for ext2fs_open2 in -lext2fs" >&5
+printf %s "checking for ext2fs_open2 in -lext2fs... " >&6; }
+if test ${ac_cv_lib_ext2fs_ext2fs_open2+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-lext2fs  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -8860,33 +9454,32 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char ext2fs_open2 ();
 int
-main ()
+main (void)
 {
 return ext2fs_open2 ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_ext2fs_ext2fs_open2=yes
-else
+else $as_nop
   ac_cv_lib_ext2fs_ext2fs_open2=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_ext2fs_ext2fs_open2" >&5
-$as_echo "$ac_cv_lib_ext2fs_ext2fs_open2" >&6; }
-if test "x$ac_cv_lib_ext2fs_ext2fs_open2" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_ext2fs_ext2fs_open2" >&5
+printf "%s\n" "$ac_cv_lib_ext2fs_ext2fs_open2" >&6; }
+if test "x$ac_cv_lib_ext2fs_ext2fs_open2" = xyes
+then :
 
 
-$as_echo "#define INCLUDE_EXTFS_H <ext2fs/ext2fs.h>" >>confdefs.h
+printf "%s\n" "#define INCLUDE_EXTFS_H <ext2fs/ext2fs.h>" >>confdefs.h
 
     EXTFS_LIBS="-lext2fs"
 
@@ -8895,15 +9488,16 @@ fi
 
 fi
 
+ac_fn_c_check_header_compile "$LINENO" "ext4fs/ext2fs.h" "ac_cv_header_ext4fs_ext2fs_h" "$ac_includes_default"
+if test "x$ac_cv_header_ext4fs_ext2fs_h" = xyes
+then :
 
-ac_fn_c_check_header_mongrel "$LINENO" "ext4fs/ext2fs.h" "ac_cv_header_ext4fs_ext2fs_h" "$ac_includes_default"
-if test "x$ac_cv_header_ext4fs_ext2fs_h" = xyes; then :
-
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for ext2fs_open2 in -lext4fs" >&5
-$as_echo_n "checking for ext2fs_open2 in -lext4fs... " >&6; }
-if ${ac_cv_lib_ext4fs_ext2fs_open2+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for ext2fs_open2 in -lext4fs" >&5
+printf %s "checking for ext2fs_open2 in -lext4fs... " >&6; }
+if test ${ac_cv_lib_ext4fs_ext2fs_open2+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-lext4fs  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -8912,33 +9506,32 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char ext2fs_open2 ();
 int
-main ()
+main (void)
 {
 return ext2fs_open2 ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_ext4fs_ext2fs_open2=yes
-else
+else $as_nop
   ac_cv_lib_ext4fs_ext2fs_open2=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_ext4fs_ext2fs_open2" >&5
-$as_echo "$ac_cv_lib_ext4fs_ext2fs_open2" >&6; }
-if test "x$ac_cv_lib_ext4fs_ext2fs_open2" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_ext4fs_ext2fs_open2" >&5
+printf "%s\n" "$ac_cv_lib_ext4fs_ext2fs_open2" >&6; }
+if test "x$ac_cv_lib_ext4fs_ext2fs_open2" = xyes
+then :
 
 
-$as_echo "#define INCLUDE_EXTFS_H <ext4fs/ext2fs.h>" >>confdefs.h
+printf "%s\n" "#define INCLUDE_EXTFS_H <ext4fs/ext2fs.h>" >>confdefs.h
 
     EXTFS_LIBS="-lext4fs"
 
@@ -8950,12 +9543,12 @@ fi
 
 
 
-
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for pthread flag" >&5
-$as_echo_n "checking for pthread flag... " >&6; }
-if ${ax_cv_pthread_flags+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for pthread flag" >&5
+printf %s "checking for pthread flag... " >&6; }
+if test ${ax_cv_pthread_flags+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
 
         ax_cv_pthread_flags=-pthread
 
@@ -8987,12 +9580,13 @@ int main(void) {
 }
 
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
 
-else
+else $as_nop
   ax_cv_pthread_flags=failed
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 
     CFLAGS="$saved_CFLAGS"
@@ -9003,8 +9597,8 @@ rm -f core conftest.err conftest.$ac_objext \
 
 
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_pthread_flags" >&5
-$as_echo "$ax_cv_pthread_flags" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ax_cv_pthread_flags" >&5
+printf "%s\n" "$ax_cv_pthread_flags" >&6; }
     if test "x$ax_cv_pthread_flags" = xfailed; then
         as_fn_error $? "-pthread does not work" "$LINENO" 5
     fi
@@ -9020,29 +9614,30 @@ $as_echo "$ax_cv_pthread_flags" >&6; }
     saved_CPPFLAGS="$CPPFLAGS"
 
     CPPFLAGS="$CPPFLAGS -Werror"
-    ac_fn_c_check_header_mongrel "$LINENO" "libutil.h" "ac_cv_header_libutil_h" "$ac_includes_default"
-if test "x$ac_cv_header_libutil_h" = xyes; then :
+    ac_fn_c_check_header_compile "$LINENO" "libutil.h" "ac_cv_header_libutil_h" "$ac_includes_default"
+if test "x$ac_cv_header_libutil_h" = xyes
+then :
 
 
-$as_echo "#define INCLUDE_LIBUTIL_H <libutil.h>" >>confdefs.h
+printf "%s\n" "#define INCLUDE_LIBUTIL_H <libutil.h>" >>confdefs.h
 
 
 fi
 
 
-
     CPPFLAGS="$saved_CPPFLAGS"
 
-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for openpty et al" >&5
-$as_echo_n "checking for openpty et al... " >&6; }
-if ${ax_cv_ptyfuncs_libs+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for openpty et al" >&5
+printf %s "checking for openpty et al... " >&6; }
+if test ${ax_cv_ptyfuncs_libs+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
 
         for ax_cv_ptyfuncs_libs in -lutil "" NOT_FOUND; do
             if test "x$ax_cv_ptyfuncs_libs" = "xNOT_FOUND"; then
-                { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+                { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error $? "Unable to find library for openpty and login_tty
 See \`config.log' for more details" "$LINENO" 5; }
             fi
@@ -9062,12 +9657,13 @@ int main(void) {
 }
 
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
 
                 break
 
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 
     LIBS="$saved_LIBS"
@@ -9075,16 +9671,17 @@ rm -f core conftest.err conftest.$ac_objext \
         done
 
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_ptyfuncs_libs" >&5
-$as_echo "$ax_cv_ptyfuncs_libs" >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ax_cv_ptyfuncs_libs" >&5
+printf "%s\n" "$ax_cv_ptyfuncs_libs" >&6; }
     PTYFUNCS_LIBS="$ax_cv_ptyfuncs_libs"
 
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for yajl_alloc in -lyajl" >&5
-$as_echo_n "checking for yajl_alloc in -lyajl... " >&6; }
-if ${ac_cv_lib_yajl_yajl_alloc+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for yajl_alloc in -lyajl" >&5
+printf %s "checking for yajl_alloc in -lyajl... " >&6; }
+if test ${ac_cv_lib_yajl_yajl_alloc+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-lyajl  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -9093,45 +9690,43 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char yajl_alloc ();
 int
-main ()
+main (void)
 {
 return yajl_alloc ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_yajl_yajl_alloc=yes
-else
+else $as_nop
   ac_cv_lib_yajl_yajl_alloc=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_yajl_yajl_alloc" >&5
-$as_echo "$ac_cv_lib_yajl_yajl_alloc" >&6; }
-if test "x$ac_cv_lib_yajl_yajl_alloc" = xyes; then :
-  cat >>confdefs.h <<_ACEOF
-#define HAVE_LIBYAJL 1
-_ACEOF
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_yajl_yajl_alloc" >&5
+printf "%s\n" "$ac_cv_lib_yajl_yajl_alloc" >&6; }
+if test "x$ac_cv_lib_yajl_yajl_alloc" = xyes
+then :
+  printf "%s\n" "#define HAVE_LIBYAJL 1" >>confdefs.h
 
   LIBS="-lyajl $LIBS"
 
-else
+else $as_nop
   as_fn_error $? "Could not find yajl" "$LINENO" 5
 fi
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for deflateCopy in -lz" >&5
-$as_echo_n "checking for deflateCopy in -lz... " >&6; }
-if ${ac_cv_lib_z_deflateCopy+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for deflateCopy in -lz" >&5
+printf %s "checking for deflateCopy in -lz... " >&6; }
+if test ${ac_cv_lib_z_deflateCopy+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-lz  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -9140,45 +9735,43 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char deflateCopy ();
 int
-main ()
+main (void)
 {
 return deflateCopy ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_z_deflateCopy=yes
-else
+else $as_nop
   ac_cv_lib_z_deflateCopy=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_z_deflateCopy" >&5
-$as_echo "$ac_cv_lib_z_deflateCopy" >&6; }
-if test "x$ac_cv_lib_z_deflateCopy" = xyes; then :
-  cat >>confdefs.h <<_ACEOF
-#define HAVE_LIBZ 1
-_ACEOF
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_z_deflateCopy" >&5
+printf "%s\n" "$ac_cv_lib_z_deflateCopy" >&6; }
+if test "x$ac_cv_lib_z_deflateCopy" = xyes
+then :
+  printf "%s\n" "#define HAVE_LIBZ 1" >>confdefs.h
 
   LIBS="-lz $LIBS"
 
-else
+else $as_nop
   as_fn_error $? "Could not find zlib" "$LINENO" 5
 fi
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for libiconv_open in -liconv" >&5
-$as_echo_n "checking for libiconv_open in -liconv... " >&6; }
-if ${ac_cv_lib_iconv_libiconv_open+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for libiconv_open in -liconv" >&5
+printf %s "checking for libiconv_open in -liconv... " >&6; }
+if test ${ac_cv_lib_iconv_libiconv_open+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-liconv  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -9187,44 +9780,45 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char libiconv_open ();
 int
-main ()
+main (void)
 {
 return libiconv_open ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_iconv_libiconv_open=yes
-else
+else $as_nop
   ac_cv_lib_iconv_libiconv_open=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_iconv_libiconv_open" >&5
-$as_echo "$ac_cv_lib_iconv_libiconv_open" >&6; }
-if test "x$ac_cv_lib_iconv_libiconv_open" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_iconv_libiconv_open" >&5
+printf "%s\n" "$ac_cv_lib_iconv_libiconv_open" >&6; }
+if test "x$ac_cv_lib_iconv_libiconv_open" = xyes
+then :
   libiconv="y"
-else
+else $as_nop
   libiconv="n"
 fi
 
 
-ac_fn_c_check_header_mongrel "$LINENO" "argp.h" "ac_cv_header_argp_h" "$ac_includes_default"
-if test "x$ac_cv_header_argp_h" = xyes; then :
+ac_fn_c_check_header_compile "$LINENO" "argp.h" "ac_cv_header_argp_h" "$ac_includes_default"
+if test "x$ac_cv_header_argp_h" = xyes
+then :
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for argp_usage in -largp" >&5
-$as_echo_n "checking for argp_usage in -largp... " >&6; }
-if ${ac_cv_lib_argp_argp_usage+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for argp_usage in -largp" >&5
+printf %s "checking for argp_usage in -largp... " >&6; }
+if test ${ac_cv_lib_argp_argp_usage+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-largp  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -9233,49 +9827,48 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char argp_usage ();
 int
-main ()
+main (void)
 {
 return argp_usage ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_argp_argp_usage=yes
-else
+else $as_nop
   ac_cv_lib_argp_argp_usage=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_argp_argp_usage" >&5
-$as_echo "$ac_cv_lib_argp_argp_usage" >&6; }
-if test "x$ac_cv_lib_argp_argp_usage" = xyes; then :
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_argp_argp_usage" >&5
+printf "%s\n" "$ac_cv_lib_argp_argp_usage" >&6; }
+if test "x$ac_cv_lib_argp_argp_usage" = xyes
+then :
   argp_ldflags="-largp"
 fi
 
 
-else
+else $as_nop
   as_fn_error $? "Could not find argp" "$LINENO" 5
 fi
 
 
 
-
 # FDT is needed only on ARM
 case "$host_cpu" in
 arm*|aarch64)
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for fdt_create in -lfdt" >&5
-$as_echo_n "checking for fdt_create in -lfdt... " >&6; }
-if ${ac_cv_lib_fdt_fdt_create+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for fdt_create in -lfdt" >&5
+printf %s "checking for fdt_create in -lfdt... " >&6; }
+if test ${ac_cv_lib_fdt_fdt_create+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-lfdt  $LIBS"
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -9284,37 +9877,34 @@ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* Override any GCC internal prototype to avoid an error.
    Use char because int might match the return type of a GCC
    builtin and then its argument prototype would still apply.  */
-#ifdef __cplusplus
-extern "C"
-#endif
 char fdt_create ();
 int
-main ()
+main (void)
 {
 return fdt_create ();
   ;
   return 0;
 }
 _ACEOF
-if ac_fn_c_try_link "$LINENO"; then :
+if ac_fn_c_try_link "$LINENO"
+then :
   ac_cv_lib_fdt_fdt_create=yes
-else
+else $as_nop
   ac_cv_lib_fdt_fdt_create=no
 fi
-rm -f core conftest.err conftest.$ac_objext \
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
     conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_fdt_fdt_create" >&5
-$as_echo "$ac_cv_lib_fdt_fdt_create" >&6; }
-if test "x$ac_cv_lib_fdt_fdt_create" = xyes; then :
-  cat >>confdefs.h <<_ACEOF
-#define HAVE_LIBFDT 1
-_ACEOF
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_fdt_fdt_create" >&5
+printf "%s\n" "$ac_cv_lib_fdt_fdt_create" >&6; }
+if test "x$ac_cv_lib_fdt_fdt_create" = xyes
+then :
+  printf "%s\n" "#define HAVE_LIBFDT 1" >>confdefs.h
 
   LIBS="-lfdt $LIBS"
 
-else
+else $as_nop
   as_fn_error $? "Could not find libfdt" "$LINENO" 5
 fi
 
@@ -9324,108 +9914,197 @@ fi
 # function present in new version.
 # Use fdt_first_property_offset which has been correctly exported since v1.4.0
 ac_fn_c_check_func "$LINENO" "fdt_first_property_offset" "ac_cv_func_fdt_first_property_offset"
-if test "x$ac_cv_func_fdt_first_property_offset" = xyes; then :
+if test "x$ac_cv_func_fdt_first_property_offset" = xyes
+then :
   partial_dt="y"
-else
+else $as_nop
   partial_dt="n"
 fi
 
 
-if test "x$partial_dt" = "xy" ; then :
+if test "x$partial_dt" = "xy"
+then :
 
-$as_echo "#define ENABLE_PARTIAL_DEVICE_TREE 1" >>confdefs.h
+printf "%s\n" "#define ENABLE_PARTIAL_DEVICE_TREE 1" >>confdefs.h
 
-else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Disabling support for partial device tree in libxl.
+else $as_nop
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: Disabling support for partial device tree in libxl.
        Please install libfdt library - version 1.4.0 or higher" >&5
-$as_echo "$as_me: WARNING: Disabling support for partial device tree in libxl.
+printf "%s\n" "$as_me: WARNING: Disabling support for partial device tree in libxl.
        Please install libfdt library - version 1.4.0 or higher" >&2;}
 fi
 
 # The functions fdt_{first,next}_subnode may not be available because:
 #   * It has been introduced in 2013 => Doesn't work on Wheezy
 #   * The prototype exists but the functions are not exposed. Don't ask why...
-for ac_func in fdt_first_subnode fdt_next_subnode
-do :
-  as_ac_var=`$as_echo "ac_cv_func_$ac_func" | $as_tr_sh`
-ac_fn_c_check_func "$LINENO" "$ac_func" "$as_ac_var"
-if eval test \"x\$"$as_ac_var"\" = x"yes"; then :
-  cat >>confdefs.h <<_ACEOF
-#define `$as_echo "HAVE_$ac_func" | $as_tr_cpp` 1
+ac_fn_c_check_func "$LINENO" "fdt_first_subnode" "ac_cv_func_fdt_first_subnode"
+if test "x$ac_cv_func_fdt_first_subnode" = xyes
+then :
+  printf "%s\n" "#define HAVE_FDT_FIRST_SUBNODE 1" >>confdefs.h
+
+fi
+ac_fn_c_check_func "$LINENO" "fdt_next_subnode" "ac_cv_func_fdt_next_subnode"
+if test "x$ac_cv_func_fdt_next_subnode" = xyes
+then :
+  printf "%s\n" "#define HAVE_FDT_NEXT_SUBNODE 1" >>confdefs.h
+
+fi
+
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $CC options needed to detect all undeclared functions" >&5
+printf %s "checking for $CC options needed to detect all undeclared functions... " >&6; }
+if test ${ac_cv_c_undeclared_builtin_options+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  ac_save_CFLAGS=$CFLAGS
+   ac_cv_c_undeclared_builtin_options='cannot detect'
+   for ac_arg in '' -fno-builtin; do
+     CFLAGS="$ac_save_CFLAGS $ac_arg"
+     # This test program should *not* compile successfully.
+     cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+/* end confdefs.h.  */
+
+int
+main (void)
+{
+(void) strchr;
+  ;
+  return 0;
+}
 _ACEOF
+if ac_fn_c_try_compile "$LINENO"
+then :
+
+else $as_nop
+  # This test program should compile successfully.
+        # No library function is consistently available on
+        # freestanding implementations, so test against a dummy
+        # declaration.  Include always-available headers on the
+        # off chance that they somehow elicit warnings.
+        cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+/* end confdefs.h.  */
+#include <float.h>
+#include <limits.h>
+#include <stdarg.h>
+#include <stddef.h>
+extern void ac_decl (int, char *);
+
+int
+main (void)
+{
+(void) ac_decl (0, (char *) 0);
+  (void) ac_decl;
 
+  ;
+  return 0;
+}
+_ACEOF
+if ac_fn_c_try_compile "$LINENO"
+then :
+  if test x"$ac_arg" = x
+then :
+  ac_cv_c_undeclared_builtin_options='none needed'
+else $as_nop
+  ac_cv_c_undeclared_builtin_options=$ac_arg
 fi
-done
+          break
+fi
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
+fi
+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
+    done
+    CFLAGS=$ac_save_CFLAGS
+
+fi
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_c_undeclared_builtin_options" >&5
+printf "%s\n" "$ac_cv_c_undeclared_builtin_options" >&6; }
+  case $ac_cv_c_undeclared_builtin_options in #(
+  'cannot detect') :
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
+as_fn_error $? "cannot make $CC report undeclared builtins
+See \`config.log' for more details" "$LINENO" 5; } ;; #(
+  'none needed') :
+    ac_c_undeclared_builtin_options='' ;; #(
+  *) :
+    ac_c_undeclared_builtin_options=$ac_cv_c_undeclared_builtin_options ;;
+esac
 
-ac_fn_c_check_decl "$LINENO" "fdt_first_subnode" "ac_cv_have_decl_fdt_first_subnode" "#include <libfdt.h>
-"
-if test "x$ac_cv_have_decl_fdt_first_subnode" = xyes; then :
+ac_fn_check_decl "$LINENO" "fdt_first_subnode" "ac_cv_have_decl_fdt_first_subnode" "#include <libfdt.h>
+" "$ac_c_undeclared_builtin_options" "CFLAGS"
+if test "x$ac_cv_have_decl_fdt_first_subnode" = xyes
+then :
   ac_have_decl=1
-else
+else $as_nop
   ac_have_decl=0
 fi
-
-cat >>confdefs.h <<_ACEOF
-#define HAVE_DECL_FDT_FIRST_SUBNODE $ac_have_decl
-_ACEOF
-ac_fn_c_check_decl "$LINENO" "fdt_next_subnode" "ac_cv_have_decl_fdt_next_subnode" "#include <libfdt.h>
-"
-if test "x$ac_cv_have_decl_fdt_next_subnode" = xyes; then :
+printf "%s\n" "#define HAVE_DECL_FDT_FIRST_SUBNODE $ac_have_decl" >>confdefs.h
+ac_fn_check_decl "$LINENO" "fdt_next_subnode" "ac_cv_have_decl_fdt_next_subnode" "#include <libfdt.h>
+" "$ac_c_undeclared_builtin_options" "CFLAGS"
+if test "x$ac_cv_have_decl_fdt_next_subnode" = xyes
+then :
   ac_have_decl=1
-else
+else $as_nop
   ac_have_decl=0
 fi
-
-cat >>confdefs.h <<_ACEOF
-#define HAVE_DECL_FDT_NEXT_SUBNODE $ac_have_decl
-_ACEOF
+printf "%s\n" "#define HAVE_DECL_FDT_NEXT_SUBNODE $ac_have_decl" >>confdefs.h
 
 
 # The helper fdt_property_u32 is only present in libfdt >= 1.4.0
 # It's an inline function, so only check if the declaration is present
-ac_fn_c_check_decl "$LINENO" "fdt_property_u32" "ac_cv_have_decl_fdt_property_u32" "#include <libfdt.h>
-"
-if test "x$ac_cv_have_decl_fdt_property_u32" = xyes; then :
+ac_fn_check_decl "$LINENO" "fdt_property_u32" "ac_cv_have_decl_fdt_property_u32" "#include <libfdt.h>
+" "$ac_c_undeclared_builtin_options" "CFLAGS"
+if test "x$ac_cv_have_decl_fdt_property_u32" = xyes
+then :
   ac_have_decl=1
-else
+else $as_nop
   ac_have_decl=0
 fi
-
-cat >>confdefs.h <<_ACEOF
-#define HAVE_DECL_FDT_PROPERTY_U32 $ac_have_decl
-_ACEOF
+printf "%s\n" "#define HAVE_DECL_FDT_PROPERTY_U32 $ac_have_decl" >>confdefs.h
 
 esac
 
 # Checks for header files.
-for ac_header in yajl/yajl_version.h sys/eventfd.h valgrind/memcheck.h utmp.h
-do :
-  as_ac_Header=`$as_echo "ac_cv_header_$ac_header" | $as_tr_sh`
-ac_fn_c_check_header_mongrel "$LINENO" "$ac_header" "$as_ac_Header" "$ac_includes_default"
-if eval test \"x\$"$as_ac_Header"\" = x"yes"; then :
-  cat >>confdefs.h <<_ACEOF
-#define `$as_echo "HAVE_$ac_header" | $as_tr_cpp` 1
-_ACEOF
+ac_fn_c_check_header_compile "$LINENO" "yajl/yajl_version.h" "ac_cv_header_yajl_yajl_version_h" "$ac_includes_default"
+if test "x$ac_cv_header_yajl_yajl_version_h" = xyes
+then :
+  printf "%s\n" "#define HAVE_YAJL_YAJL_VERSION_H 1" >>confdefs.h
 
 fi
+ac_fn_c_check_header_compile "$LINENO" "sys/eventfd.h" "ac_cv_header_sys_eventfd_h" "$ac_includes_default"
+if test "x$ac_cv_header_sys_eventfd_h" = xyes
+then :
+  printf "%s\n" "#define HAVE_SYS_EVENTFD_H 1" >>confdefs.h
 
-done
+fi
+ac_fn_c_check_header_compile "$LINENO" "valgrind/memcheck.h" "ac_cv_header_valgrind_memcheck_h" "$ac_includes_default"
+if test "x$ac_cv_header_valgrind_memcheck_h" = xyes
+then :
+  printf "%s\n" "#define HAVE_VALGRIND_MEMCHECK_H 1" >>confdefs.h
+
+fi
+ac_fn_c_check_header_compile "$LINENO" "utmp.h" "ac_cv_header_utmp_h" "$ac_includes_default"
+if test "x$ac_cv_header_utmp_h" = xyes
+then :
+  printf "%s\n" "#define HAVE_UTMP_H 1" >>confdefs.h
+
+fi
 
 
 # Check for libnl3 >=3.2.8. If present enable remus network buffering.
 
 pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for LIBNL3" >&5
-$as_echo_n "checking for LIBNL3... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for LIBNL3" >&5
+printf %s "checking for LIBNL3... " >&6; }
 
 if test -n "$LIBNL3_CFLAGS"; then
     pkg_cv_LIBNL3_CFLAGS="$LIBNL3_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libnl-3.0 >= 3.2.8 libnl-route-3.0 >= 3.2.8\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libnl-3.0 >= 3.2.8 libnl-route-3.0 >= 3.2.8\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libnl-3.0 >= 3.2.8 libnl-route-3.0 >= 3.2.8") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_LIBNL3_CFLAGS=`$PKG_CONFIG --cflags "libnl-3.0 >= 3.2.8 libnl-route-3.0 >= 3.2.8" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9439,10 +10118,10 @@ if test -n "$LIBNL3_LIBS"; then
     pkg_cv_LIBNL3_LIBS="$LIBNL3_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libnl-3.0 >= 3.2.8 libnl-route-3.0 >= 3.2.8\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libnl-3.0 >= 3.2.8 libnl-route-3.0 >= 3.2.8\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libnl-3.0 >= 3.2.8 libnl-route-3.0 >= 3.2.8") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_LIBNL3_LIBS=`$PKG_CONFIG --libs "libnl-3.0 >= 3.2.8 libnl-route-3.0 >= 3.2.8" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9456,8 +10135,8 @@ fi
 
 
 if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
         _pkg_short_errors_supported=yes
@@ -9474,29 +10153,30 @@ fi
 
 	libnl3_lib="n"
 elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 	libnl3_lib="n"
 else
 	LIBNL3_CFLAGS=$pkg_cv_LIBNL3_CFLAGS
 	LIBNL3_LIBS=$pkg_cv_LIBNL3_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 	libnl3_lib="y"
 fi
 
-if test "x$libnl3_lib" = "xn" ; then :
+if test "x$libnl3_lib" = "xn"
+then :
 
-    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Disabling support for Remus network buffering and COLO.
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: Disabling support for Remus network buffering and COLO.
     Please install libnl3 libraries (including libnl3-route), command line tools and devel
     headers - version 3.2.8 or higher" >&5
-$as_echo "$as_me: WARNING: Disabling support for Remus network buffering and COLO.
+printf "%s\n" "$as_me: WARNING: Disabling support for Remus network buffering and COLO.
     Please install libnl3 libraries (including libnl3-route), command line tools and devel
     headers - version 3.2.8 or higher" >&2;}
     libnl=n
 
 
-else
+else $as_nop
 
     libnl=y
 
@@ -9512,20 +10192,24 @@ fi # ! $rump
 
 
 # Check whether --enable-systemd was given.
-if test "${enable_systemd+set}" = set; then :
+if test ${enable_systemd+y}
+then :
   enableval=$enable_systemd;
 fi
 
 
-if test "x$enable_systemd" = "xno"; then :
+if test "x$enable_systemd" = "xno"
+then :
 
     ax_cv_systemd="n"
 
-elif test "x$enable_systemd" = "xyes"; then :
+elif test "x$enable_systemd" = "xyes"
+then :
 
     ax_cv_systemd="y"
 
-elif test -z $ax_cv_systemd; then :
+elif test -z $ax_cv_systemd
+then :
 
     ax_cv_systemd="n"
 
@@ -9536,9 +10220,10 @@ systemd=$ax_cv_systemd
 
 
 # Check whether --with-systemd was given.
-if test "${with_systemd+set}" = set; then :
+if test ${with_systemd+y}
+then :
   withval=$with_systemd; SYSTEMD_DIR="$withval"
-else
+else $as_nop
   SYSTEMD_DIR=""
 fi
 
@@ -9546,9 +10231,10 @@ fi
 
 
 # Check whether --with-systemd-modules-load was given.
-if test "${with_systemd_modules_load+set}" = set; then :
+if test ${with_systemd_modules_load+y}
+then :
   withval=$with_systemd_modules_load; SYSTEMD_MODULES_LOAD="$withval"
-else
+else $as_nop
   SYSTEMD_MODULES_LOAD=""
 fi
 
@@ -9558,17 +10244,17 @@ fi
 
 
 pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
+printf %s "checking for SYSTEMD... " >&6; }
 
 if test -n "$SYSTEMD_CFLAGS"; then
     pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd-daemon" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9582,10 +10268,10 @@ if test -n "$SYSTEMD_LIBS"; then
     pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd-daemon" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9599,8 +10285,8 @@ fi
 
 
 if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
         _pkg_short_errors_supported=yes
@@ -9618,17 +10304,17 @@ fi
 
 
 pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
+printf %s "checking for SYSTEMD... " >&6; }
 
 if test -n "$SYSTEMD_CFLAGS"; then
     pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd >= 209" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9642,10 +10328,10 @@ if test -n "$SYSTEMD_LIBS"; then
     pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd >= 209" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9659,8 +10345,8 @@ fi
 
 
 if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
         _pkg_short_errors_supported=yes
@@ -9677,34 +10363,34 @@ fi
 
 	systemd="n"
 elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 	systemd="n"
 else
 	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
 	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 	systemd="y"
 fi
 
 elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 
 pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
+printf %s "checking for SYSTEMD... " >&6; }
 
 if test -n "$SYSTEMD_CFLAGS"; then
     pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd >= 209" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9718,10 +10404,10 @@ if test -n "$SYSTEMD_LIBS"; then
     pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd >= 209" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9735,8 +10421,8 @@ fi
 
 
 if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
         _pkg_short_errors_supported=yes
@@ -9753,48 +10439,50 @@ fi
 
 	systemd="n"
 elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 	systemd="n"
 else
 	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
 	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 	systemd="y"
 fi
 
 else
 	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
 	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 	systemd="y"
 fi
 
 
-		if test "x$enable_systemd" != "xno"; then :
+		if test "x$enable_systemd" != "xno"
+then :
 
-	     if test "x$systemd" = "xy" ; then :
+	     if test "x$systemd" = "xy"
+then :
 
 
-$as_echo "#define HAVE_SYSTEMD 1" >>confdefs.h
+printf "%s\n" "#define HAVE_SYSTEMD 1" >>confdefs.h
 
 			systemd=y
 
 
 pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
+printf %s "checking for SYSTEMD... " >&6; }
 
 if test -n "$SYSTEMD_CFLAGS"; then
     pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd-daemon" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9808,10 +10496,10 @@ if test -n "$SYSTEMD_LIBS"; then
     pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd-daemon" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9825,8 +10513,8 @@ fi
 
 
 if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
         _pkg_short_errors_supported=yes
@@ -9843,17 +10531,17 @@ fi
 
 
 pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
+printf %s "checking for SYSTEMD... " >&6; }
 
 if test -n "$SYSTEMD_CFLAGS"; then
     pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd >= 209" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9867,10 +10555,10 @@ if test -n "$SYSTEMD_LIBS"; then
     pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd >= 209" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9884,8 +10572,8 @@ fi
 
 
 if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
         _pkg_short_errors_supported=yes
@@ -9911,10 +10599,10 @@ Alternatively, you may set the environment variables SYSTEMD_CFLAGS
 and SYSTEMD_LIBS to avoid the need to call pkg-config.
 See the pkg-config man page for more details." "$LINENO" 5
 elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-	{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+	{ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error $? "The pkg-config script could not be found or is too old.  Make sure it
 is in your PATH or set the PKG_CONFIG environment variable to the full
 path to pkg-config.
@@ -9928,27 +10616,27 @@ See \`config.log' for more details" "$LINENO" 5; }
 else
 	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
 	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 
 fi
 
 elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
+printf %s "checking for SYSTEMD... " >&6; }
 
 if test -n "$SYSTEMD_CFLAGS"; then
     pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd >= 209" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9962,10 +10650,10 @@ if test -n "$SYSTEMD_LIBS"; then
     pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
   ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
   ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
   pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd >= 209" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
@@ -9979,8 +10667,8 @@ fi
 
 
 if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 
 if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
         _pkg_short_errors_supported=yes
@@ -10006,10 +10694,10 @@ Alternatively, you may set the environment variables SYSTEMD_CFLAGS
 and SYSTEMD_LIBS to avoid the need to call pkg-config.
 See the pkg-config man page for more details." "$LINENO" 5
 elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-	{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+	{ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
 as_fn_error $? "The pkg-config script could not be found or is too old.  Make sure it
 is in your PATH or set the PKG_CONFIG environment variable to the full
 path to pkg-config.
@@ -10023,63 +10711,69 @@ See \`config.log' for more details" "$LINENO" 5; }
 else
 	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
 	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 
 fi
 
 else
 	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
 	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
 
 fi
 
 
 
-	if test "x$SYSTEMD_DIR" = x; then :
+	if test "x$SYSTEMD_DIR" = x
+then :
 
 	    	    	    	    	    	    	    	    	    	    	    	    	    SYSTEMD_DIR="\$(prefix)/lib/systemd/system/"
 
 fi
 
-	if test "x$SYSTEMD_DIR" = x; then :
+	if test "x$SYSTEMD_DIR" = x
+then :
 
 	    as_fn_error $? "SYSTEMD_DIR is unset" "$LINENO" 5
 
 fi
 
-		if test "x$SYSTEMD_MODULES_LOAD" = x; then :
+		if test "x$SYSTEMD_MODULES_LOAD" = x
+then :
 
 	    SYSTEMD_MODULES_LOAD="\$(prefix)/lib/modules-load.d/"
 
 fi
 
-	if test "x$SYSTEMD_MODULES_LOAD" = x; then :
+	if test "x$SYSTEMD_MODULES_LOAD" = x
+then :
 
 	    as_fn_error $? "SYSTEMD_MODULES_LOAD is unset" "$LINENO" 5
 
 fi
 
 
-else
+else $as_nop
 
-		if test "x$enable_systemd" = "xyes"; then :
+		if test "x$enable_systemd" = "xyes"
+then :
   as_fn_error $? "Unable to find systemd development library" "$LINENO" 5
-else
+else $as_nop
   systemd=n
 fi
 
 fi
 
-else
+else $as_nop
   systemd=n
 fi
 
 
 
-if test "x$systemd" = "xy"; then :
+if test "x$systemd" = "xy"
+then :
 
     ac_config_files="$ac_config_files hotplug/Linux/systemd/proc-xen.mount hotplug/Linux/systemd/xen-init-dom0.service hotplug/Linux/systemd/xen-qemu-dom0-disk-backend.service hotplug/Linux/systemd/xen-watchdog.service hotplug/Linux/systemd/xenconsoled.service hotplug/Linux/systemd/xendomains.service hotplug/Linux/systemd/xendriverdomain.service hotplug/Linux/systemd/xenstored.service"
 
@@ -10087,10 +10781,12 @@ if test "x$systemd" = "xy"; then :
 fi
 
 # Check whether --enable-9pfs was given.
-if test "${enable_9pfs+set}" = set; then :
-  enableval=$enable_9pfs; if test "x$enable_9pfs" = "xyes"; then :
+if test ${enable_9pfs+y}
+then :
+  enableval=$enable_9pfs; if test "x$enable_9pfs" = "xyes"
+then :
   ninepfs=y
-else
+else $as_nop
   ninepfs=n
 fi
 fi
@@ -10099,13 +10795,15 @@ fi
 
 
 # Check whether --enable-pvshim was given.
-if test "${enable_pvshim+set}" = set; then :
-  enableval=$enable_pvshim; if test "x$enable_pvshim" = "xno"; then :
+if test ${enable_pvshim+y}
+then :
+  enableval=$enable_pvshim; if test "x$enable_pvshim" = "xno"
+then :
   pvshim=n
-else
+else $as_nop
   pvshim=y
 fi
-else
+else $as_nop
 
     cpu=`test -z "$target_cpu" && echo "$host_cpu" || echo "$target_cpu"`
     case "${XEN_COMPILE_ARCH-${XEN_TARGET_ARCH-$cpu}}" in
@@ -10117,15 +10815,17 @@ else
 fi
 
 
-if test "x$pvshim" = "xy"; then :
+if test "x$pvshim" = "xy"
+then :
 
     # Extract the first word of "bison", so it can be a program name with args.
 set dummy bison; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_BISON+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_BISON+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $BISON in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_BISON="$BISON" # Let the user override the test with a path.
@@ -10135,11 +10835,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_BISON="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_BISON="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -10152,11 +10856,11 @@ esac
 fi
 BISON=$ac_cv_path_BISON
 if test -n "$BISON"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $BISON" >&5
-$as_echo "$BISON" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $BISON" >&5
+printf "%s\n" "$BISON" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -10165,15 +10869,16 @@ then
     as_fn_error $? "Unable to find bison, please install bison" "$LINENO" 5
 fi
 
-else
+else $as_nop
 
     # Extract the first word of "bison", so it can be a program name with args.
 set dummy bison; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_BISON+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+printf %s "checking for $ac_word... " >&6; }
+if test ${ac_cv_path_BISON+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
   case $BISON in
   [\\/]* | ?:[\\/]*)
   ac_cv_path_BISON="$BISON" # Let the user override the test with a path.
@@ -10183,11 +10888,15 @@ else
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
     for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_BISON="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
+    ac_cv_path_BISON="$as_dir$ac_word$ac_exec_ext"
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
@@ -10199,11 +10908,11 @@ esac
 fi
 BISON=$ac_cv_path_BISON
 if test -n "$BISON"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $BISON" >&5
-$as_echo "$BISON" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $BISON" >&5
+printf "%s\n" "$BISON" >&6; }
 else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
 fi
 
 
@@ -10213,37 +10922,40 @@ fi
 
 ax_found=0
 
-    if test "$ax_found" = "0"; then :
+    if test "$ax_found" = "0"
+then :
 
-        ac_fn_c_check_header_mongrel "$LINENO" "endian.h" "ac_cv_header_endian_h" "$ac_includes_default"
-if test "x$ac_cv_header_endian_h" = xyes; then :
+        ac_fn_c_check_header_compile "$LINENO" "endian.h" "ac_cv_header_endian_h" "$ac_includes_default"
+if test "x$ac_cv_header_endian_h" = xyes
+then :
 
 
-$as_echo "#define INCLUDE_ENDIAN_H <endian.h>" >>confdefs.h
+printf "%s\n" "#define INCLUDE_ENDIAN_H <endian.h>" >>confdefs.h
 
             ax_found=1
 fi
 
 
-
 fi
 
-    if test "$ax_found" = "0"; then :
+    if test "$ax_found" = "0"
+then :
 
-        ac_fn_c_check_header_mongrel "$LINENO" "sys/endian.h" "ac_cv_header_sys_endian_h" "$ac_includes_default"
-if test "x$ac_cv_header_sys_endian_h" = xyes; then :
+        ac_fn_c_check_header_compile "$LINENO" "sys/endian.h" "ac_cv_header_sys_endian_h" "$ac_includes_default"
+if test "x$ac_cv_header_sys_endian_h" = xyes
+then :
 
 
-$as_echo "#define INCLUDE_ENDIAN_H <sys/endian.h>" >>confdefs.h
+printf "%s\n" "#define INCLUDE_ENDIAN_H <sys/endian.h>" >>confdefs.h
 
             ax_found=1
 fi
 
 
-
 fi
 
-if test "$ax_found" = "0"; then :
+if test "$ax_found" = "0"
+then :
 
     as_fn_error $? "No header found from list endian.h sys/endian.h" "$LINENO" 5
 
@@ -10277,8 +10989,8 @@ _ACEOF
     case $ac_val in #(
     *${as_nl}*)
       case $ac_var in #(
-      *_cv_*) { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: cache variable $ac_var contains a newline" >&5
-$as_echo "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
+      *_cv_*) { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: cache variable $ac_var contains a newline" >&5
+printf "%s\n" "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
       esac
       case $ac_var in #(
       _ | IFS | as_nl) ;; #(
@@ -10308,15 +11020,15 @@ $as_echo "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
      /^ac_cv_env_/b end
      t clear
      :clear
-     s/^\([^=]*\)=\(.*[{}].*\)$/test "${\1+set}" = set || &/
+     s/^\([^=]*\)=\(.*[{}].*\)$/test ${\1+y} || &/
      t end
      s/^\([^=]*\)=\(.*\)$/\1=${\1=\2}/
      :end' >>confcache
 if diff "$cache_file" confcache >/dev/null 2>&1; then :; else
   if test -w "$cache_file"; then
     if test "x$cache_file" != "x/dev/null"; then
-      { $as_echo "$as_me:${as_lineno-$LINENO}: updating cache $cache_file" >&5
-$as_echo "$as_me: updating cache $cache_file" >&6;}
+      { printf "%s\n" "$as_me:${as_lineno-$LINENO}: updating cache $cache_file" >&5
+printf "%s\n" "$as_me: updating cache $cache_file" >&6;}
       if test ! -f "$cache_file" || test -h "$cache_file"; then
 	cat confcache >"$cache_file"
       else
@@ -10330,8 +11042,8 @@ $as_echo "$as_me: updating cache $cache_file" >&6;}
       fi
     fi
   else
-    { $as_echo "$as_me:${as_lineno-$LINENO}: not updating unwritable cache $cache_file" >&5
-$as_echo "$as_me: not updating unwritable cache $cache_file" >&6;}
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: not updating unwritable cache $cache_file" >&5
+printf "%s\n" "$as_me: not updating unwritable cache $cache_file" >&6;}
   fi
 fi
 rm -f confcache
@@ -10348,7 +11060,7 @@ U=
 for ac_i in : $LIBOBJS; do test "x$ac_i" = x: && continue
   # 1. Remove the extension, and $U if already installed.
   ac_script='s/\$U\././;s/\.o$//;s/\.obj$//'
-  ac_i=`$as_echo "$ac_i" | sed "$ac_script"`
+  ac_i=`printf "%s\n" "$ac_i" | sed "$ac_script"`
   # 2. Prepend LIBOBJDIR.  When used with automake>=1.10 LIBOBJDIR
   #    will be set to the directory where LIBOBJS objects are built.
   as_fn_append ac_libobjs " \${LIBOBJDIR}$ac_i\$U.$ac_objext"
@@ -10364,8 +11076,8 @@ LTLIBOBJS=$ac_ltlibobjs
 ac_write_fail=0
 ac_clean_files_save=$ac_clean_files
 ac_clean_files="$ac_clean_files $CONFIG_STATUS"
-{ $as_echo "$as_me:${as_lineno-$LINENO}: creating $CONFIG_STATUS" >&5
-$as_echo "$as_me: creating $CONFIG_STATUS" >&6;}
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: creating $CONFIG_STATUS" >&5
+printf "%s\n" "$as_me: creating $CONFIG_STATUS" >&6;}
 as_write_fail=0
 cat >$CONFIG_STATUS <<_ASEOF || as_write_fail=1
 #! $SHELL
@@ -10388,14 +11100,16 @@ cat >>$CONFIG_STATUS <<\_ASEOF || as_write_fail=1
 
 # Be more Bourne compatible
 DUALCASE=1; export DUALCASE # for MKS sh
-if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then :
+as_nop=:
+if test ${ZSH_VERSION+y} && (emulate sh) >/dev/null 2>&1
+then :
   emulate sh
   NULLCMD=:
   # Pre-4.2 versions of Zsh do word splitting on ${1+"$@"}, which
   # is contrary to our usage.  Disable this feature.
   alias -g '${1+"$@"}'='"$@"'
   setopt NO_GLOB_SUBST
-else
+else $as_nop
   case `(set -o) 2>/dev/null` in #(
   *posix*) :
     set -o posix ;; #(
@@ -10405,46 +11119,46 @@ esac
 fi
 
 
+
+# Reset variables that may have inherited troublesome values from
+# the environment.
+
+# IFS needs to be set, to space, tab, and newline, in precisely that order.
+# (If _AS_PATH_WALK were called with IFS unset, it would have the
+# side effect of setting IFS to empty, thus disabling word splitting.)
+# Quoting is to prevent editors from complaining about space-tab.
 as_nl='
 '
 export as_nl
-# Printing a long string crashes Solaris 7 /usr/bin/printf.
-as_echo='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
-as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo
-as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo$as_echo
-# Prefer a ksh shell builtin over an external printf program on Solaris,
-# but without wasting forks for bash or zsh.
-if test -z "$BASH_VERSION$ZSH_VERSION" \
-    && (test "X`print -r -- $as_echo`" = "X$as_echo") 2>/dev/null; then
-  as_echo='print -r --'
-  as_echo_n='print -rn --'
-elif (test "X`printf %s $as_echo`" = "X$as_echo") 2>/dev/null; then
-  as_echo='printf %s\n'
-  as_echo_n='printf %s'
-else
-  if test "X`(/usr/ucb/echo -n -n $as_echo) 2>/dev/null`" = "X-n $as_echo"; then
-    as_echo_body='eval /usr/ucb/echo -n "$1$as_nl"'
-    as_echo_n='/usr/ucb/echo -n'
-  else
-    as_echo_body='eval expr "X$1" : "X\\(.*\\)"'
-    as_echo_n_body='eval
-      arg=$1;
-      case $arg in #(
-      *"$as_nl"*)
-	expr "X$arg" : "X\\(.*\\)$as_nl";
-	arg=`expr "X$arg" : ".*$as_nl\\(.*\\)"`;;
-      esac;
-      expr "X$arg" : "X\\(.*\\)" | tr -d "$as_nl"
-    '
-    export as_echo_n_body
-    as_echo_n='sh -c $as_echo_n_body as_echo'
-  fi
-  export as_echo_body
-  as_echo='sh -c $as_echo_body as_echo'
-fi
+IFS=" ""	$as_nl"
+
+PS1='$ '
+PS2='> '
+PS4='+ '
+
+# Ensure predictable behavior from utilities with locale-dependent output.
+LC_ALL=C
+export LC_ALL
+LANGUAGE=C
+export LANGUAGE
+
+# We cannot yet rely on "unset" to work, but we need these variables
+# to be unset--not just set to an empty or harmless value--now, to
+# avoid bugs in old shells (e.g. pre-3.0 UWIN ksh).  This construct
+# also avoids known problems related to "unset" and subshell syntax
+# in other old shells (e.g. bash 2.01 and pdksh 5.2.14).
+for as_var in BASH_ENV ENV MAIL MAILPATH CDPATH
+do eval test \${$as_var+y} \
+  && ( (unset $as_var) || exit 1) >/dev/null 2>&1 && unset $as_var || :
+done
+
+# Ensure that fds 0, 1, and 2 are open.
+if (exec 3>&0) 2>/dev/null; then :; else exec 0</dev/null; fi
+if (exec 3>&1) 2>/dev/null; then :; else exec 1>/dev/null; fi
+if (exec 3>&2)            ; then :; else exec 2>/dev/null; fi
 
 # The user is always right.
-if test "${PATH_SEPARATOR+set}" != set; then
+if ${PATH_SEPARATOR+false} :; then
   PATH_SEPARATOR=:
   (PATH='/bin;/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 && {
     (PATH='/bin:/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 ||
@@ -10453,13 +11167,6 @@ if test "${PATH_SEPARATOR+set}" != set; then
 fi
 
 
-# IFS
-# We need space, tab and new line, in precisely that order.  Quoting is
-# there to prevent editors from complaining about space-tab.
-# (If _AS_PATH_WALK were called with IFS unset, it would disable word
-# splitting by setting IFS to empty value.)
-IFS=" ""	$as_nl"
-
 # Find who we are.  Look in the path if we contain no directory separator.
 as_myself=
 case $0 in #((
@@ -10468,8 +11175,12 @@ case $0 in #((
 for as_dir in $PATH
 do
   IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-    test -r "$as_dir/$0" && as_myself=$as_dir/$0 && break
+  case $as_dir in #(((
+    '') as_dir=./ ;;
+    */) ;;
+    *) as_dir=$as_dir/ ;;
+  esac
+    test -r "$as_dir$0" && as_myself=$as_dir$0 && break
   done
 IFS=$as_save_IFS
 
@@ -10481,30 +11192,10 @@ if test "x$as_myself" = x; then
   as_myself=$0
 fi
 if test ! -f "$as_myself"; then
-  $as_echo "$as_myself: error: cannot find myself; rerun with an absolute file name" >&2
+  printf "%s\n" "$as_myself: error: cannot find myself; rerun with an absolute file name" >&2
   exit 1
 fi
 
-# Unset variables that we do not need and which cause bugs (e.g. in
-# pre-3.0 UWIN ksh).  But do not cause bugs in bash 2.01; the "|| exit 1"
-# suppresses any "Segmentation fault" message there.  '((' could
-# trigger a bug in pdksh 5.2.14.
-for as_var in BASH_ENV ENV MAIL MAILPATH
-do eval test x\${$as_var+set} = xset \
-  && ( (unset $as_var) || exit 1) >/dev/null 2>&1 && unset $as_var || :
-done
-PS1='$ '
-PS2='> '
-PS4='+ '
-
-# NLS nuisances.
-LC_ALL=C
-export LC_ALL
-LANGUAGE=C
-export LANGUAGE
-
-# CDPATH.
-(unset CDPATH) >/dev/null 2>&1 && unset CDPATH
 
 
 # as_fn_error STATUS ERROR [LINENO LOG_FD]
@@ -10517,13 +11208,14 @@ as_fn_error ()
   as_status=$1; test $as_status -eq 0 && as_status=1
   if test "$4"; then
     as_lineno=${as_lineno-"$3"} as_lineno_stack=as_lineno_stack=$as_lineno_stack
-    $as_echo "$as_me:${as_lineno-$LINENO}: error: $2" >&$4
+    printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: $2" >&$4
   fi
-  $as_echo "$as_me: error: $2" >&2
+  printf "%s\n" "$as_me: error: $2" >&2
   as_fn_exit $as_status
 } # as_fn_error
 
 
+
 # as_fn_set_status STATUS
 # -----------------------
 # Set $? to STATUS, without forking.
@@ -10550,18 +11242,20 @@ as_fn_unset ()
   { eval $1=; unset $1;}
 }
 as_unset=as_fn_unset
+
 # as_fn_append VAR VALUE
 # ----------------------
 # Append the text in VALUE to the end of the definition contained in VAR. Take
 # advantage of any shell optimizations that allow amortized linear growth over
 # repeated appends, instead of the typical quadratic growth present in naive
 # implementations.
-if (eval "as_var=1; as_var+=2; test x\$as_var = x12") 2>/dev/null; then :
+if (eval "as_var=1; as_var+=2; test x\$as_var = x12") 2>/dev/null
+then :
   eval 'as_fn_append ()
   {
     eval $1+=\$2
   }'
-else
+else $as_nop
   as_fn_append ()
   {
     eval $1=\$$1\$2
@@ -10573,12 +11267,13 @@ fi # as_fn_append
 # Perform arithmetic evaluation on the ARGs, and store the result in the
 # global $as_val. Take advantage of shells that can avoid forks. The arguments
 # must be portable across $(()) and expr.
-if (eval "test \$(( 1 + 1 )) = 2") 2>/dev/null; then :
+if (eval "test \$(( 1 + 1 )) = 2") 2>/dev/null
+then :
   eval 'as_fn_arith ()
   {
     as_val=$(( $* ))
   }'
-else
+else $as_nop
   as_fn_arith ()
   {
     as_val=`expr "$@" || test $? -eq 1`
@@ -10609,7 +11304,7 @@ as_me=`$as_basename -- "$0" ||
 $as_expr X/"$0" : '.*/\([^/][^/]*\)/*$' \| \
 	 X"$0" : 'X\(//\)$' \| \
 	 X"$0" : 'X\(/\)' \| . 2>/dev/null ||
-$as_echo X/"$0" |
+printf "%s\n" X/"$0" |
     sed '/^.*\/\([^/][^/]*\)\/*$/{
 	    s//\1/
 	    q
@@ -10631,6 +11326,10 @@ as_cr_Letters=$as_cr_letters$as_cr_LETTERS
 as_cr_digits='0123456789'
 as_cr_alnum=$as_cr_Letters$as_cr_digits
 
+
+# Determine whether it's possible to make 'echo' print without a newline.
+# These variables are no longer used directly by Autoconf, but are AC_SUBSTed
+# for compatibility with existing Makefiles.
 ECHO_C= ECHO_N= ECHO_T=
 case `echo -n x` in #(((((
 -n*)
@@ -10644,6 +11343,12 @@ case `echo -n x` in #(((((
   ECHO_N='-n';;
 esac
 
+# For backward compatibility with old third-party macros, we provide
+# the shell variables $as_echo and $as_echo_n.  New code should use
+# AS_ECHO(["message"]) and AS_ECHO_N(["message"]), respectively.
+as_echo='printf %s\n'
+as_echo_n='printf %s'
+
 rm -f conf$$ conf$$.exe conf$$.file
 if test -d conf$$.dir; then
   rm -f conf$$.dir/conf$$.file
@@ -10685,7 +11390,7 @@ as_fn_mkdir_p ()
     as_dirs=
     while :; do
       case $as_dir in #(
-      *\'*) as_qdir=`$as_echo "$as_dir" | sed "s/'/'\\\\\\\\''/g"`;; #'(
+      *\'*) as_qdir=`printf "%s\n" "$as_dir" | sed "s/'/'\\\\\\\\''/g"`;; #'(
       *) as_qdir=$as_dir;;
       esac
       as_dirs="'$as_qdir' $as_dirs"
@@ -10694,7 +11399,7 @@ $as_expr X"$as_dir" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
 	 X"$as_dir" : 'X\(//\)[^/]' \| \
 	 X"$as_dir" : 'X\(//\)$' \| \
 	 X"$as_dir" : 'X\(/\)' \| . 2>/dev/null ||
-$as_echo X"$as_dir" |
+printf "%s\n" X"$as_dir" |
     sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
 	    s//\1/
 	    q
@@ -10757,7 +11462,7 @@ cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
 # values after options handling.
 ac_log="
 This file was extended by Xen Hypervisor Tools $as_me 4.18, which was
-generated by GNU Autoconf 2.69.  Invocation command line was
+generated by GNU Autoconf 2.71.  Invocation command line was
 
   CONFIG_FILES    = $CONFIG_FILES
   CONFIG_HEADERS  = $CONFIG_HEADERS
@@ -10816,14 +11521,16 @@ Report bugs to <xen-devel@lists.xen.org>.
 Xen Hypervisor Tools home page: <https://www.xen.org/>."
 
 _ACEOF
+ac_cs_config=`printf "%s\n" "$ac_configure_args" | sed "$ac_safe_unquote"`
+ac_cs_config_escaped=`printf "%s\n" "$ac_cs_config" | sed "s/^ //; s/'/'\\\\\\\\''/g"`
 cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
-ac_cs_config="`$as_echo "$ac_configure_args" | sed 's/^ //; s/[\\""\`\$]/\\\\&/g'`"
+ac_cs_config='$ac_cs_config_escaped'
 ac_cs_version="\\
 Xen Hypervisor Tools config.status 4.18
-configured by $0, generated by GNU Autoconf 2.69,
+configured by $0, generated by GNU Autoconf 2.71,
   with options \\"\$ac_cs_config\\"
 
-Copyright (C) 2012 Free Software Foundation, Inc.
+Copyright (C) 2021 Free Software Foundation, Inc.
 This config.status script is free software; the Free Software Foundation
 gives unlimited permission to copy, distribute and modify it."
 
@@ -10862,15 +11569,15 @@ do
   -recheck | --recheck | --rechec | --reche | --rech | --rec | --re | --r)
     ac_cs_recheck=: ;;
   --version | --versio | --versi | --vers | --ver | --ve | --v | -V )
-    $as_echo "$ac_cs_version"; exit ;;
+    printf "%s\n" "$ac_cs_version"; exit ;;
   --config | --confi | --conf | --con | --co | --c )
-    $as_echo "$ac_cs_config"; exit ;;
+    printf "%s\n" "$ac_cs_config"; exit ;;
   --debug | --debu | --deb | --de | --d | -d )
     debug=: ;;
   --file | --fil | --fi | --f )
     $ac_shift
     case $ac_optarg in
-    *\'*) ac_optarg=`$as_echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"` ;;
+    *\'*) ac_optarg=`printf "%s\n" "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"` ;;
     '') as_fn_error $? "missing file argument" ;;
     esac
     as_fn_append CONFIG_FILES " '$ac_optarg'"
@@ -10878,7 +11585,7 @@ do
   --header | --heade | --head | --hea )
     $ac_shift
     case $ac_optarg in
-    *\'*) ac_optarg=`$as_echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"` ;;
+    *\'*) ac_optarg=`printf "%s\n" "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"` ;;
     esac
     as_fn_append CONFIG_HEADERS " '$ac_optarg'"
     ac_need_defaults=false;;
@@ -10887,7 +11594,7 @@ do
     as_fn_error $? "ambiguous option: \`$1'
 Try \`$0 --help' for more information.";;
   --help | --hel | -h )
-    $as_echo "$ac_cs_usage"; exit ;;
+    printf "%s\n" "$ac_cs_usage"; exit ;;
   -q | -quiet | --quiet | --quie | --qui | --qu | --q \
   | -silent | --silent | --silen | --sile | --sil | --si | --s)
     ac_cs_silent=: ;;
@@ -10915,7 +11622,7 @@ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
 if \$ac_cs_recheck; then
   set X $SHELL '$0' $ac_configure_args \$ac_configure_extra_args --no-create --no-recursion
   shift
-  \$as_echo "running CONFIG_SHELL=$SHELL \$*" >&6
+  \printf "%s\n" "running CONFIG_SHELL=$SHELL \$*" >&6
   CONFIG_SHELL='$SHELL'
   export CONFIG_SHELL
   exec "\$@"
@@ -10929,7 +11636,7 @@ exec 5>>config.log
   sed 'h;s/./-/g;s/^.../## /;s/...$/ ##/;p;x;p;x' <<_ASBOX
 ## Running $as_me. ##
 _ASBOX
-  $as_echo "$ac_log"
+  printf "%s\n" "$ac_log"
 } >&5
 
 _ACEOF
@@ -10981,8 +11688,8 @@ done
 # We use the long form for the default assignment because of an extremely
 # bizarre bug on SunOS 4.1.3.
 if $ac_need_defaults; then
-  test "${CONFIG_FILES+set}" = set || CONFIG_FILES=$config_files
-  test "${CONFIG_HEADERS+set}" = set || CONFIG_HEADERS=$config_headers
+  test ${CONFIG_FILES+y} || CONFIG_FILES=$config_files
+  test ${CONFIG_HEADERS+y} || CONFIG_HEADERS=$config_headers
 fi
 
 # Have a temporary directory for convenience.  Make it in the build tree
@@ -11318,7 +12025,7 @@ do
 	   esac ||
 	   as_fn_error 1 "cannot find input file: \`$ac_f'" "$LINENO" 5;;
       esac
-      case $ac_f in *\'*) ac_f=`$as_echo "$ac_f" | sed "s/'/'\\\\\\\\''/g"`;; esac
+      case $ac_f in *\'*) ac_f=`printf "%s\n" "$ac_f" | sed "s/'/'\\\\\\\\''/g"`;; esac
       as_fn_append ac_file_inputs " '$ac_f'"
     done
 
@@ -11326,17 +12033,17 @@ do
     # use $as_me), people would be surprised to read:
     #    /* config.h.  Generated by config.status.  */
     configure_input='Generated from '`
-	  $as_echo "$*" | sed 's|^[^:]*/||;s|:[^:]*/|, |g'
+	  printf "%s\n" "$*" | sed 's|^[^:]*/||;s|:[^:]*/|, |g'
 	`' by configure.'
     if test x"$ac_file" != x-; then
       configure_input="$ac_file.  $configure_input"
-      { $as_echo "$as_me:${as_lineno-$LINENO}: creating $ac_file" >&5
-$as_echo "$as_me: creating $ac_file" >&6;}
+      { printf "%s\n" "$as_me:${as_lineno-$LINENO}: creating $ac_file" >&5
+printf "%s\n" "$as_me: creating $ac_file" >&6;}
     fi
     # Neutralize special characters interpreted by sed in replacement strings.
     case $configure_input in #(
     *\&* | *\|* | *\\* )
-       ac_sed_conf_input=`$as_echo "$configure_input" |
+       ac_sed_conf_input=`printf "%s\n" "$configure_input" |
        sed 's/[\\\\&|]/\\\\&/g'`;; #(
     *) ac_sed_conf_input=$configure_input;;
     esac
@@ -11353,7 +12060,7 @@ $as_expr X"$ac_file" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
 	 X"$ac_file" : 'X\(//\)[^/]' \| \
 	 X"$ac_file" : 'X\(//\)$' \| \
 	 X"$ac_file" : 'X\(/\)' \| . 2>/dev/null ||
-$as_echo X"$ac_file" |
+printf "%s\n" X"$ac_file" |
     sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
 	    s//\1/
 	    q
@@ -11377,9 +12084,9 @@ $as_echo X"$ac_file" |
 case "$ac_dir" in
 .) ac_dir_suffix= ac_top_builddir_sub=. ac_top_build_prefix= ;;
 *)
-  ac_dir_suffix=/`$as_echo "$ac_dir" | sed 's|^\.[\\/]||'`
+  ac_dir_suffix=/`printf "%s\n" "$ac_dir" | sed 's|^\.[\\/]||'`
   # A ".." for each directory in $ac_dir_suffix.
-  ac_top_builddir_sub=`$as_echo "$ac_dir_suffix" | sed 's|/[^\\/]*|/..|g;s|/||'`
+  ac_top_builddir_sub=`printf "%s\n" "$ac_dir_suffix" | sed 's|/[^\\/]*|/..|g;s|/||'`
   case $ac_top_builddir_sub in
   "") ac_top_builddir_sub=. ac_top_build_prefix= ;;
   *)  ac_top_build_prefix=$ac_top_builddir_sub/ ;;
@@ -11436,8 +12143,8 @@ ac_sed_dataroot='
 case `eval "sed -n \"\$ac_sed_dataroot\" $ac_file_inputs"` in
 *datarootdir*) ac_datarootdir_seen=yes;;
 *@datadir@*|*@docdir@*|*@infodir@*|*@localedir@*|*@mandir@*)
-  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: $ac_file_inputs seems to ignore the --datarootdir setting" >&5
-$as_echo "$as_me: WARNING: $ac_file_inputs seems to ignore the --datarootdir setting" >&2;}
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: $ac_file_inputs seems to ignore the --datarootdir setting" >&5
+printf "%s\n" "$as_me: WARNING: $ac_file_inputs seems to ignore the --datarootdir setting" >&2;}
 _ACEOF
 cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
   ac_datarootdir_hack='
@@ -11480,9 +12187,9 @@ test -z "$ac_datarootdir_hack$ac_datarootdir_seen" &&
   { ac_out=`sed -n '/\${datarootdir}/p' "$ac_tmp/out"`; test -n "$ac_out"; } &&
   { ac_out=`sed -n '/^[	 ]*datarootdir[	 ]*:*=/p' \
       "$ac_tmp/out"`; test -z "$ac_out"; } &&
-  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: $ac_file contains a reference to the variable \`datarootdir'
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: $ac_file contains a reference to the variable \`datarootdir'
 which seems to be undefined.  Please make sure it is defined" >&5
-$as_echo "$as_me: WARNING: $ac_file contains a reference to the variable \`datarootdir'
+printf "%s\n" "$as_me: WARNING: $ac_file contains a reference to the variable \`datarootdir'
 which seems to be undefined.  Please make sure it is defined" >&2;}
 
   rm -f "$ac_tmp/stdin"
@@ -11498,20 +12205,20 @@ which seems to be undefined.  Please make sure it is defined" >&2;}
   #
   if test x"$ac_file" != x-; then
     {
-      $as_echo "/* $configure_input  */" \
+      printf "%s\n" "/* $configure_input  */" >&1 \
       && eval '$AWK -f "$ac_tmp/defines.awk"' "$ac_file_inputs"
     } >"$ac_tmp/config.h" \
       || as_fn_error $? "could not create $ac_file" "$LINENO" 5
     if diff "$ac_file" "$ac_tmp/config.h" >/dev/null 2>&1; then
-      { $as_echo "$as_me:${as_lineno-$LINENO}: $ac_file is unchanged" >&5
-$as_echo "$as_me: $ac_file is unchanged" >&6;}
+      { printf "%s\n" "$as_me:${as_lineno-$LINENO}: $ac_file is unchanged" >&5
+printf "%s\n" "$as_me: $ac_file is unchanged" >&6;}
     else
       rm -f "$ac_file"
       mv "$ac_tmp/config.h" "$ac_file" \
 	|| as_fn_error $? "could not create $ac_file" "$LINENO" 5
     fi
   else
-    $as_echo "/* $configure_input  */" \
+    printf "%s\n" "/* $configure_input  */" >&1 \
       && eval '$AWK -f "$ac_tmp/defines.awk"' "$ac_file_inputs" \
       || as_fn_error $? "could not create -" "$LINENO" 5
   fi
@@ -11552,7 +12259,8 @@ if test "$no_create" != yes; then
   $ac_cs_success || as_fn_exit 1
 fi
 if test -n "$ac_unrecognized_opts" && test "$enable_option_checking" != no; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: unrecognized options: $ac_unrecognized_opts" >&5
-$as_echo "$as_me: WARNING: unrecognized options: $ac_unrecognized_opts" >&2;}
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: unrecognized options: $ac_unrecognized_opts" >&5
+printf "%s\n" "$as_me: WARNING: unrecognized options: $ac_unrecognized_opts" >&2;}
 fi
 
+
-- 
2.39.2


