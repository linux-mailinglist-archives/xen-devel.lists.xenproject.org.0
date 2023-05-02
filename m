Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A79A6F4B97
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 22:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528836.822478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptwuy-0002Ij-1v; Tue, 02 May 2023 20:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528836.822478; Tue, 02 May 2023 20:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptwux-0002H3-VH; Tue, 02 May 2023 20:48:11 +0000
Received: by outflank-mailman (input) for mailman id 528836;
 Tue, 02 May 2023 20:48:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5QU=AX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1ptwuw-0002Gn-K3
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 20:48:10 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a523253f-e92a-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 22:48:08 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz42Km3eaa
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 May 2023 22:48:03 +0200 (CEST)
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
X-Inumbo-ID: a523253f-e92a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683060483; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YphspjVUr1YpHqRikiihIxJoLv2OCITtQV2UvMFMZ2PhF0noh9mB5RGWXjV+mAczkw
    L1D8CF4IovVOq4qUDTdEpIMR0bq6FwITgN0BhrxC1JsM2ThblhlULPZSoA/H3ylwwWpZ
    lJKF1YlpJhho+lVjd8yYd7KAsby9JrXF/DUnlZZ7TdUTpdGpNOm07UscfTohjdte4dnX
    /M2F6nIIxMjUfBO4hGi0/n6D6Se+FyRilaw0Nn9Ql9SRv0g94y8rBPDMg9ye+zM6cpHP
    vLhgBSlKBl6oQl/FO/K2gBFVFsabShGgQDKZAzFJ6s3qoxqTRmc8UeQ+GZaS/pwFnNOs
    AL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683060483;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=QAmU+/VygWvLyKR/GJw/qjknyykgRWf7rx6CpuHmpt0=;
    b=JZKUUpuNJbmSYa79RF9EtvehtI53BYpwqF27R7Xb0vE6y9JiDhBdiahv8xaMttbDzD
    JYVebTs4az3SUiq33cVM1mG60iOju+tuA8HzdgVowSe2WSLkazyPMXuLwl+LCK6bhfwR
    /5XTEM7Hgxf5N0Intn9oRtQ4Z735QDIWZkKB7qmBUju0M723cSJLcBVYcd/ZhFBEUoOJ
    s9ZdgVk2SAOHU/U0e2RZ/Cuhd2dNaz0DJLWUYuXFYs4N1yR8oa+qa9Lend3L6JEce7Sb
    oVKSRpG4wXIDD1oWPnhXIgbbKnZFcszRybkb2InYmvYlb4b8VjcQm/IfsnfOZ2kl9omX
    05tw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683060483;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=QAmU+/VygWvLyKR/GJw/qjknyykgRWf7rx6CpuHmpt0=;
    b=OzvPmEsxeE2vTN5SuQfki+E/p+3fuZVACtCtI2ckS9oij4NX5t3tm37W1cfbh/VWB9
    tycdyhkLAvDcHNa+8BZh6VDtqLZ01phSFgKtJHSjRwnAg4w2DF23wkrycAujdhwJJ9a3
    tIdo1c6kwidHeMmaQqJrTefbTa7AHpuf3pZpt+A/ZshFeU083lk/rVopJEWQDeLHRHEM
    hTSL21bDBRh3IaDxleayoIz6NL4gH2AuxfbvIdxTYbhLuv/AXXjH+bVMkJ3jTpT0BFfT
    idqlR5cAX7cG5zCUmMgJXzIXGyvadPXmTxTtYJCwkz6gUqte0LWin4GbFtDUMPZIpp/X
    Bkfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683060483;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=QAmU+/VygWvLyKR/GJw/qjknyykgRWf7rx6CpuHmpt0=;
    b=BkQP3SKq0gNjF4VeD4vRL+gay92bML/DQMIgjjOJL2Jn0X4euM9t0Umb6TwfbfvmYF
    KdRauizvLKwtf1oIg4DA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wqVv7FZ8tH5EUSbMVU80kUr7f4QlYaI60OjHt/Q=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] tools: drop bogus and obsolete ptyfuncs.m4
Date: Tue,  2 May 2023 20:48:00 +0000
Message-Id: <20230502204800.10733-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

According to openpty(3) it is required to include <pty.h> to get the
prototypes for openpty() and login_tty(). But this is not what the
function AX_CHECK_PTYFUNCS actually does. It makes no attempt to include
the required header.

The two source files which call openpty() and login_tty() already contain
the conditionals to include the required header.

Remove the bogus m4 file to fix build with clang, which complains about
calls to undeclared functions.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 m4/ptyfuncs.m4     | 35 -----------------------------------
 tools/configure.ac |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 m4/ptyfuncs.m4

diff --git a/m4/ptyfuncs.m4 b/m4/ptyfuncs.m4
deleted file mode 100644
index 3e37b5a23c..0000000000
--- a/m4/ptyfuncs.m4
+++ /dev/null
@@ -1,35 +0,0 @@
-AC_DEFUN([AX_CHECK_PTYFUNCS], [
-    dnl This is a workaround for a bug in Debian package
-    dnl libbsd-dev-0.3.0-1. Once we no longer support that
-    dnl package we can remove the addition of -Werror to
-    dnl CPPFLAGS.
-    AX_SAVEVAR_SAVE(CPPFLAGS)
-    CPPFLAGS="$CPPFLAGS -Werror"
-    AC_CHECK_HEADER([libutil.h],[
-      AC_DEFINE([INCLUDE_LIBUTIL_H],[<libutil.h>],[libutil header file name])
-    ])
-    AX_SAVEVAR_RESTORE(CPPFLAGS)
-    AC_CACHE_CHECK([for openpty et al], [ax_cv_ptyfuncs_libs], [
-        for ax_cv_ptyfuncs_libs in -lutil "" NOT_FOUND; do
-            if test "x$ax_cv_ptyfuncs_libs" = "xNOT_FOUND"; then
-                AC_MSG_FAILURE([Unable to find library for openpty and login_tty])
-            fi
-            AX_SAVEVAR_SAVE(LIBS)
-            LIBS="$LIBS $ax_cv_ptyfuncs_libs"
-            AC_LINK_IFELSE([AC_LANG_SOURCE([
-#ifdef INCLUDE_LIBUTIL_H
-#include INCLUDE_LIBUTIL_H
-#endif
-int main(void) {
-  openpty(0,0,0,0,0);
-  login_tty(0);
-}
-])],[
-                break
-            ],[])
-            AX_SAVEVAR_RESTORE(LIBS)
-        done
-    ])
-    PTYFUNCS_LIBS="$ax_cv_ptyfuncs_libs"
-    AC_SUBST(PTYFUNCS_LIBS)
-])
diff --git a/tools/configure.ac b/tools/configure.ac
index 9bcf42f233..c94257f751 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -70,7 +70,6 @@ m4_include([../m4/uuid.m4])
 m4_include([../m4/pkg.m4])
 m4_include([../m4/curses.m4])
 m4_include([../m4/pthread.m4])
-m4_include([../m4/ptyfuncs.m4])
 m4_include([../m4/extfs.m4])
 m4_include([../m4/fetcher.m4])
 m4_include([../m4/ax_compare_version.m4])

