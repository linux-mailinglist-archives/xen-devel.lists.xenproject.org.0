Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449348C7CC4
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 20:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723573.1128549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gIw-0005mn-IT; Thu, 16 May 2024 18:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723573.1128549; Thu, 16 May 2024 18:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gIw-0005e6-Ei; Thu, 16 May 2024 18:58:14 +0000
Received: by outflank-mailman (input) for mailman id 723573;
 Thu, 16 May 2024 18:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lir8=MT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7gIv-00050W-Ch
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 18:58:13 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3decdf70-13b6-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 20:58:11 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a599a298990so398021866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 11:58:11 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d9dsm1003072566b.132.2024.05.16.11.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 11:58:10 -0700 (PDT)
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
X-Inumbo-ID: 3decdf70-13b6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715885891; x=1716490691; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RPPdXWzS+h1KReJUUX36RCkolCXpVxyjNBaSjStXp4=;
        b=O1ac5C0XJC9tJOfKcgJDYNTduuEDcREbhs/ovnpoWPM46u+s51fE9Da4LuZlAiof3I
         HRG4u2XencSUCCOU/mZHLS8bhkqn2TTQ5dso0+20cP7WJ9XXIi7ebUC1DNR4GbFSCB3v
         foAYu3c36F8bKls78CJJgyLbQrjMS6vNKtGcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715885891; x=1716490691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RPPdXWzS+h1KReJUUX36RCkolCXpVxyjNBaSjStXp4=;
        b=oivlzXgvwFM5t6WrGcMG3MOZzNnG178uBQba8VHRpYO9IX0c+AUCxwEExU/JzV0u1W
         cCk1h4SVY3s8qi0/IIZjsJHI6BlvLh0desj3LnM/YY7kDaLv77EofCT9yxIJ/ANNPeRB
         iGc9YcgzYRWA5D4dkleEXjlzpqjcq4LX899OGk2w/fAHpX4qCRkd84RDQSQxI3JpDiuG
         bw9nrSS+kIt0OoY86j8qk5QhYIwoXhDbaM8yhBjVTSRctouEpnPMelvlDw+CkfpgL5fi
         mP3E+1X9WENNOlINDO0yg4+NlyiyDrhuZmUN//2mSTMhnJo95sS6d+n7xgvYkvK/UbWk
         bncA==
X-Gm-Message-State: AOJu0YxigT5bE63CjPeW+XsHxLiDE71nWNJl1xAGX6pK51Hchm7Cru2S
	cG+tCwsNivJeW2s/OSAthVY8NyDd0HjfIDQXsepmNafmoBWpHMbarA9i7/ITUQGaKunyWzWsI/8
	8
X-Google-Smtp-Source: AGHT+IEaucKEm0iXV/PnaVzx9IBaFmUmggPKs+Sh4PcPdsCfdTNeiXwPZCN45OUBuEBa7qPU3ADYmg==
X-Received: by 2002:a17:907:1b0b:b0:a59:a3ef:21eb with SMTP id a640c23a62f3a-a5a2d675b19mr1635240566b.73.1715885891059;
        Thu, 16 May 2024 11:58:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: [PATCH v2 4/4] tools: Drop libsystemd as a dependency
Date: Thu, 16 May 2024 19:58:04 +0100
Message-Id: <20240516185804.3309725-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no more users, and we want to disuade people from introducing new
users just for sd_notify() and friends.  Drop the dependency.

We still want the overall --with{,out}-systemd to gate the generation of the
service/unit/mount/etc files.

Rerun autogen.sh, and mark the dependency as removed in the build containers.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edwin.torok@cloud.com>

v2:
 * Only strip out the library check.
---
 automation/build/archlinux/current.dockerfile |   1 +
 .../build/suse/opensuse-leap.dockerfile       |   1 +
 .../build/suse/opensuse-tumbleweed.dockerfile |   1 +
 automation/build/ubuntu/focal.dockerfile      |   1 +
 config/Tools.mk.in                            |   2 -
 m4/systemd.m4                                 |   9 -
 tools/configure                               | 256 ------------------
 7 files changed, 4 insertions(+), 267 deletions(-)

diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index 3e37ab5c40c1..d29f1358c2bd 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -37,6 +37,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
         sdl2 \
         spice \
         spice-protocol \
+        # systemd for Xen < 4.19
         systemd \
         transfig \
         usbredir \
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 48d0d50d005d..3ef33458a07c 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -59,6 +59,7 @@ RUN zypper install -y --no-recommends \
         'pkgconfig(sdl2)' \
         python3-devel \
         python3-setuptools \
+        # systemd-devel for Xen < 4.19
         systemd-devel \
         tar \
         transfig \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 53542ba1f4d9..a793601c876d 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -60,6 +60,7 @@ RUN zypper install -y --no-recommends \
         'pkgconfig(sdl2)' \
         python3-devel \
         python3-setuptools \
+        # systemd-devel for Xen < 4.19
         systemd-devel \
         tar \
         transfig \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index 7c6a4d07566b..078abd56d56f 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -34,6 +34,7 @@ RUN apt-get update && \
         libnl-3-dev \
         ocaml-nox \
         libfindlib-ocaml-dev \
+        # libsystemd-dev for Xen < 4.19
         libsystemd-dev \
         transfig \
         pandoc \
diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index b54ab21f966b..50fbef841f3f 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -52,8 +52,6 @@ CONFIG_PYGRUB       := @pygrub@
 CONFIG_LIBFSIMAGE   := @libfsimage@
 
 CONFIG_SYSTEMD      := @systemd@
-SYSTEMD_CFLAGS      := @SYSTEMD_CFLAGS@
-SYSTEMD_LIBS        := @SYSTEMD_LIBS@
 XEN_SYSTEMD_DIR     := @SYSTEMD_DIR@
 XEN_SYSTEMD_MODULES_LOAD := @SYSTEMD_MODULES_LOAD@
 CONFIG_9PFS         := @ninepfs@
diff --git a/m4/systemd.m4 b/m4/systemd.m4
index 112dc11b5e05..e4fe51a8ba5f 100644
--- a/m4/systemd.m4
+++ b/m4/systemd.m4
@@ -41,15 +41,6 @@ AC_DEFUN([AX_ALLOW_SYSTEMD_OPTS], [
 ])
 
 AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
-	PKG_CHECK_MODULES([SYSTEMD], [libsystemd-daemon],,
-		[PKG_CHECK_MODULES([SYSTEMD], [libsystemd >= 209])]
-        )
-	dnl pkg-config older than 0.24 does not set these for
-	dnl PKG_CHECK_MODULES() worth also noting is that as of version 208
-	dnl of systemd pkg-config --cflags currently yields no extra flags yet.
-	AC_SUBST([SYSTEMD_CFLAGS])
-	AC_SUBST([SYSTEMD_LIBS])
-
 	AS_IF([test "x$SYSTEMD_DIR" = x], [
 	    dnl In order to use the line below we need to fix upstream systemd
 	    dnl to properly ${prefix} for child variables in
diff --git a/tools/configure b/tools/configure
index 3d557234b319..b8faa1d520c5 100755
--- a/tools/configure
+++ b/tools/configure
@@ -9766,262 +9766,6 @@ $as_echo "#define HAVE_SYSTEMD 1" >>confdefs.h
 
 			systemd=y
 
-
-pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
-
-if test -n "$SYSTEMD_CFLAGS"; then
-    pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd-daemon" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-if test -n "$SYSTEMD_LIBS"; then
-    pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd-daemon" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-
-
-
-if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
-        _pkg_short_errors_supported=yes
-else
-        _pkg_short_errors_supported=no
-fi
-        if test $_pkg_short_errors_supported = yes; then
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libsystemd-daemon" 2>&1`
-        else
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libsystemd-daemon" 2>&1`
-        fi
-	# Put the nasty error message in config.log where it belongs
-	echo "$SYSTEMD_PKG_ERRORS" >&5
-
-
-pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
-
-if test -n "$SYSTEMD_CFLAGS"; then
-    pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-if test -n "$SYSTEMD_LIBS"; then
-    pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-
-
-
-if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
-        _pkg_short_errors_supported=yes
-else
-        _pkg_short_errors_supported=no
-fi
-        if test $_pkg_short_errors_supported = yes; then
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        else
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        fi
-	# Put the nasty error message in config.log where it belongs
-	echo "$SYSTEMD_PKG_ERRORS" >&5
-
-	as_fn_error $? "Package requirements (libsystemd >= 209) were not met:
-
-$SYSTEMD_PKG_ERRORS
-
-Consider adjusting the PKG_CONFIG_PATH environment variable if you
-installed software in a non-standard prefix.
-
-Alternatively, you may set the environment variables SYSTEMD_CFLAGS
-and SYSTEMD_LIBS to avoid the need to call pkg-config.
-See the pkg-config man page for more details." "$LINENO" 5
-elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-	{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
-as_fn_error $? "The pkg-config script could not be found or is too old.  Make sure it
-is in your PATH or set the PKG_CONFIG environment variable to the full
-path to pkg-config.
-
-Alternatively, you may set the environment variables SYSTEMD_CFLAGS
-and SYSTEMD_LIBS to avoid the need to call pkg-config.
-See the pkg-config man page for more details.
-
-To get pkg-config, see <http://pkg-config.freedesktop.org/>.
-See \`config.log' for more details" "$LINENO" 5; }
-else
-	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
-	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-
-fi
-
-elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
-
-if test -n "$SYSTEMD_CFLAGS"; then
-    pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-if test -n "$SYSTEMD_LIBS"; then
-    pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-
-
-
-if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
-        _pkg_short_errors_supported=yes
-else
-        _pkg_short_errors_supported=no
-fi
-        if test $_pkg_short_errors_supported = yes; then
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        else
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        fi
-	# Put the nasty error message in config.log where it belongs
-	echo "$SYSTEMD_PKG_ERRORS" >&5
-
-	as_fn_error $? "Package requirements (libsystemd >= 209) were not met:
-
-$SYSTEMD_PKG_ERRORS
-
-Consider adjusting the PKG_CONFIG_PATH environment variable if you
-installed software in a non-standard prefix.
-
-Alternatively, you may set the environment variables SYSTEMD_CFLAGS
-and SYSTEMD_LIBS to avoid the need to call pkg-config.
-See the pkg-config man page for more details." "$LINENO" 5
-elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-	{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
-as_fn_error $? "The pkg-config script could not be found or is too old.  Make sure it
-is in your PATH or set the PKG_CONFIG environment variable to the full
-path to pkg-config.
-
-Alternatively, you may set the environment variables SYSTEMD_CFLAGS
-and SYSTEMD_LIBS to avoid the need to call pkg-config.
-See the pkg-config man page for more details.
-
-To get pkg-config, see <http://pkg-config.freedesktop.org/>.
-See \`config.log' for more details" "$LINENO" 5; }
-else
-	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
-	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-
-fi
-
-else
-	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
-	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-
-fi
-
-
-
 	if test "x$SYSTEMD_DIR" = x; then :
 
 	    	    	    	    	    	    	    	    	    	    	    	    	    SYSTEMD_DIR="\$(prefix)/lib/systemd/system/"
-- 
2.30.2


