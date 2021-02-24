Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDD73234BF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 02:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89145.167700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEifZ-0002yL-1W; Wed, 24 Feb 2021 01:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89145.167700; Wed, 24 Feb 2021 01:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEifY-0002xw-UQ; Wed, 24 Feb 2021 01:08:48 +0000
Received: by outflank-mailman (input) for mailman id 89145;
 Wed, 24 Feb 2021 01:08:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Stqq=H2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEifX-0002xp-8J
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 01:08:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2969239b-9fce-4132-9e6e-acc7c1d74322;
 Wed, 24 Feb 2021 01:08:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2C4764DAF;
 Wed, 24 Feb 2021 01:08:43 +0000 (UTC)
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
X-Inumbo-ID: 2969239b-9fce-4132-9e6e-acc7c1d74322
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614128924;
	bh=oMS5JWEo0m1QcNnQlEKnVo4dkcJkk7R8UoNZxYntNYM=;
	h=Date:From:To:cc:Subject:From;
	b=BFUNfOcEpJdu7L69tia48pzW0abb4l1F2yloITyoDPSthDQIR54fewQKbmoA3LTEz
	 cOSTtLGWj4hSGsgvKt8YR3j5mOEvbaf5EvLHjXWBw0DwjLNk77eK/z3pONIB6Yladd
	 9iHC/lVqfLxCFVxuWak0MTClsNp0q5gIct5KJ8zV1S4uVLULyUai0cFZKpXCksD+Vm
	 vTOznUVjIQAdvS89u1hSAPEHdz0zd/u4hpODV6SJIQieAFJuWkmzf2e8n1BKzgsLOz
	 7+9rglPgJLdT+U60rGaYB4YQ6avZrnzggLB5bBAfTW7SJG3YOcExzB+XvyGuP71r7/
	 e9AQI7Y5yRX0g==
Date: Tue, 23 Feb 2021 17:08:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    wl@xen.org, iwj@xenproject.org, anthony.perard@citrix.com
Subject: [PATCH for-next] configure: probe for gcc -m32 integer sizes
Message-ID: <alpine.DEB.2.21.2102231648580.3234@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The hvmloader build on Alpine Linux x86_64 currenly fails:


hvmloader.c: In function 'init_vm86_tss':
hvmloader.c:202:39: error: left shift count >= width of type [-Werror=shift-count-overflow]
  202 |                   ((uint64_t)TSS_SIZE << 32) | virt_to_phys(tss));

util.c: In function 'get_cpu_mhz':
util.c:824:15: error: conversion from 'long long unsigned int' to 'uint64_t' {aka 'long unsigned int'} changes value from
'4294967296000000' to '0' [-Werror=overflow]
  824 |     cpu_khz = 1000000ull << 32;


The root cause of the issue is that gcc -m32 picks up headers meant for
64-bit builds.

The failures are currently causing problems to the xen-project
gitlab-ci pipeline.

This patch introduces code to detect this kind of errors in the
configure script, and disables with a warning the compilation of
hvmloader if problems are detected.

This patch also updates tools/configure. It has been done by calling
autoreconf -fi.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>


diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index d47936686b..395ed2a6d2 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -51,6 +51,7 @@ CONFIG_OVMF         := @ovmf@
 CONFIG_ROMBIOS      := @rombios@
 CONFIG_SEABIOS      := @seabios@
 CONFIG_IPXE         := @ipxe@
+CONFIG_HVMLOADER    := @hvmloader@
 CONFIG_QEMU_TRAD    := @qemu_traditional@
 CONFIG_QEMU_XEN     := @qemu_xen@
 CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
diff --git a/tools/configure b/tools/configure
index bb5acf9d43..f23a3bb8aa 100755
--- a/tools/configure
+++ b/tools/configure
@@ -687,6 +687,7 @@ INSTALL_DATA
 INSTALL_SCRIPT
 INSTALL_PROGRAM
 SET_MAKE
+hvmloader
 AWK
 IASL
 XGETTEXT
@@ -5279,6 +5280,25 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
 ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
 ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+/* end confdefs.h.  */
+#include <stdint.h>
+#define BUILD_BUG_ON(p) ((void)sizeof(char[1 - 2 * !!(p)]))
+int main() { BUILD_BUG_ON(sizeof(uint64_t) != 8); }
+_ACEOF
+if gcc -m32 -c conftest.c -o /dev/null 2>/dev/null; then :
+  hvmloader=y
+else
+  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: hvmloader build disabled as the compiler cannot build 32bit binaries" >&5
+$as_echo "$as_me: WARNING: hvmloader build disabled as the compiler cannot build 32bit binaries" >&2;}
+fi
+
 { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether ${MAKE-make} sets \$(MAKE)" >&5
 $as_echo_n "checking whether ${MAKE-make} sets \$(MAKE)... " >&6; }
 set x ${MAKE-make}
diff --git a/tools/configure.ac b/tools/configure.ac
index 636e7077be..706c162322 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -307,6 +307,12 @@ AC_ARG_VAR([AWK], [Path to awk tool])
 
 # Checks for programs.
 AC_PROG_CC
+AC_LANG(C)
+AC_LANG_CONFTEST([AC_LANG_SOURCE([[#include <stdint.h>
+#define BUILD_BUG_ON(p) ((void)sizeof(char[1 - 2 * !!(p)]))
+int main() { BUILD_BUG_ON(sizeof(uint64_t) != 8); }]])])
+AS_IF([gcc -m32 -c conftest.c -o /dev/null 2>/dev/null], [hvmloader=y], [AC_MSG_WARN(hvmloader build disabled due to headers mismatch)])
+AC_SUBST(hvmloader)
 AC_PROG_MAKE_SET
 AC_PROG_INSTALL
 AC_PATH_PROG([FLEX], [flex])
diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index 1f27117794..5c395ad738 100644
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -13,7 +13,7 @@ SUBDIRS-$(CONFIG_ROMBIOS) += rombios
 SUBDIRS-$(CONFIG_ROMBIOS) += vgabios
 SUBDIRS-$(CONFIG_IPXE) += etherboot
 SUBDIRS-$(CONFIG_PV_SHIM) += xen-dir
-SUBDIRS-y += hvmloader
+SUBDIRS-$(CONFIG_HVMLOADER) += hvmloader
 
 SEABIOSCC ?= $(CC)
 SEABIOSLD ?= $(LD)

