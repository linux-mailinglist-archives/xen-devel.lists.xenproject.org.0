Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2B86593DD
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 01:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469765.729199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QM-0003J6-K4; Fri, 30 Dec 2022 00:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469765.729199; Fri, 30 Dec 2022 00:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QM-0003BF-9W; Fri, 30 Dec 2022 00:39:02 +0000
Received: by outflank-mailman (input) for mailman id 469765;
 Fri, 30 Dec 2022 00:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dJX=44=citrix.com=prvs=35664f79d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pB3QK-0002si-OW
 for xen-devel@lists.xenproject.org; Fri, 30 Dec 2022 00:39:00 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56e116d6-87da-11ed-91b6-6bf2151ebd3b;
 Fri, 30 Dec 2022 01:38:56 +0100 (CET)
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
X-Inumbo-ID: 56e116d6-87da-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672360736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=VB66xEr6Tey5l6eg89k3VvaKnsgW9wbDO6YnR8fWeZo=;
  b=TkRbML7LkYEnXGLKnewbTZoONxncHFJIi7zcgmqt8IeLzbKKlNXnJLxA
   wuRGchchwj6rvqmtkFYnLmUh2tbraFFXBme7T+dGSJosLBYk6T7i8MmGx
   bEWJhIY+C8g+cThULjuZ5ZGMtAiC9sikaiNiGqKI1na9BhbnWdtq/HdsP
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90033202
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:m51u/a357TjtsQUWHfbD5Qdxkn2cJEfYwER7XKvMYLTBsI5bpzYBz
 WpKUGrVbvrcZzP0Ko8lPou19UxTvpbdytBnS1Y9pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZkNKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfH010r
 aYqMy0xbCuRhOH1kb2edfBgv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TbHZ0OxRzA/
 Aoq+UzGEDNAH8KyjgHdsUi0muiQ3iPfSLArQejQGvlC3wTImz175ActfV66qvmwjgi5QcBSL
 2Qd/yZopq83nGSsStT+RBy55n2ZpBkXW9lXO+I/4QCJjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+fpCm+PiU9JmYYaSgJCwAC5rHLu5ovhxjCStJiFq+djdDvHzz0h
 TeQo0ADa6471JBRkf/hpBae3mzq9sOhohMJChv/QE6ftllLf5OZZbe66luYvPllE5+VdwzU1
 JQboPS24OcLBJCLsSWCRuQRAb2kj8q43C3gbU1HRMd4qWn0k5K3VcUJuWwleh81WioRUWWxC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRTLt4wOuBJ2+U3aB
 Xt8WZjEMJriIf47pAdavds1374x3TwZzmjOX539xBnP+ePAOyTOEudVbgrUP7tRAEa4TOL9q
 ow3Cid3408HDL2Wjtf/qub/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNsI9NYgJItQ/94wMz7egw
 51IchMAoHLlm2b9IBmHAlg6LuuHsWBX8ShqYkTB/D+AhxAeXGpYxP1OKsZpLOF3r4SOD5dcF
 pE4RilJOdwXIhyvxtjXRcCVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:LEBoLa3k6H1BEqxEg7juOAqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.96,285,1665460800"; 
   d="scan'208";a="90033202"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 5/6] CI: Fix build script when CROSS_COMPILE is in use
Date: Fri, 30 Dec 2022 00:38:47 +0000
Message-ID: <20221230003848.3241-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221230003848.3241-1-andrew.cooper3@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Some testcases use a cross compiler.  Presently it's only arm32 and due to
previous cleanup the only thing which is now wrong is printing the compiler
version at the start of day.

Construct $cc to match what `make` will eventually choose given CROSS_COMPILE,
taking care not to modify $CC.  Use $cc throughout the rest of the script.

Also correct the compiler detection logic.  Plain "gcc" was wrong, and
"clang"* was a bodge highlighting the issue, but neither survive the
CROSS_COMPILE correction.  Instead, construct cc_is_{gcc,clang} booleans like
we do elsewhere in the build system, by querying the --version text for gcc or
clang.

While making this change, adjust cc_ver to be calculated once at the same time
as cc_is_* are calculated.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/scripts/build | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 4c6d1f3b70bc..206312ecc7d0 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -2,13 +2,12 @@
 
 test -f /etc/os-release && cat "$_"
 
-$CC --version
+# Construct $cc such that it matches what `make` will chose when taking
+# CROSS_COMPILE into account.  Do not modify $CC directly, as that will cause
+# `make` to double-account CROSS_COMPILE.
+cc="${CROSS_COMPILE}${CC}"
 
-# Express the compiler version as an integer.  e.g. GCC 4.9.2 => 0x040902
-cc-ver()
-{
-    $CC -dumpversion | awk -F. '{ printf "0x%02x%02x%02x", $1, $2, $3 }'
-}
+$cc --version
 
 # random config or default config
 if [[ "${RANDCONFIG}" == "y" ]]; then
@@ -50,7 +49,14 @@ else
     cfgargs=()
     cfgargs+=("--enable-docs")
 
-    if [[ "${CC}" == "clang"* ]]; then
+    # booleans for which compiler is in use
+    cc_is_gcc="$($cc --version | grep -q gcc && echo "y" || :)"
+    cc_is_clang="$($cc --version | grep -q clang && echo "y" || :)"
+
+    # The compiler version as an integer.  e.g. GCC 4.9.2 => 0x040902
+    cc_ver="$($cc -dumpversion | awk -F. '{ printf "0x%02x%02x%02x", $1, $2, $3 }')"
+
+    if [[ "${cc_is_clang}" == "y" ]]; then
         # SeaBIOS cannot be built with clang
         cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
         # iPXE cannot be built with clang
@@ -73,7 +79,7 @@ else
     fi
 
     # SeaBIOS requires GCC 4.6 or later
-    if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
+    if [[ "${cc_is_gcc}" == "y" && "${cc_ver}" -lt 0x040600 ]]; then
         cfgargs+=("--with-system-seabios=/bin/false")
     fi
 
-- 
2.11.0


