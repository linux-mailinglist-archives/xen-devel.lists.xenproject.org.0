Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E8B6593DC
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 01:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469766.729205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QM-0003Nn-RH; Fri, 30 Dec 2022 00:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469766.729205; Fri, 30 Dec 2022 00:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QM-0003Jf-Iy; Fri, 30 Dec 2022 00:39:02 +0000
Received: by outflank-mailman (input) for mailman id 469766;
 Fri, 30 Dec 2022 00:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dJX=44=citrix.com=prvs=35664f79d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pB3QL-0002si-AQ
 for xen-devel@lists.xenproject.org; Fri, 30 Dec 2022 00:39:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5876866a-87da-11ed-91b6-6bf2151ebd3b;
 Fri, 30 Dec 2022 01:38:57 +0100 (CET)
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
X-Inumbo-ID: 5876866a-87da-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672360737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=3uvwBZDagvMzDqVYqDkSVs+tyCn4o/+n0Up/1fWJMJA=;
  b=RJ3IvMhoOmGh9XVXK50pNezjxw34z9Od4E3VRtlsBIOlBHEE8/qV2ajL
   Gt5gSsvxKR28g80xlyie807NdVpvjO4sqwQHPrW7WsNnVGHWzRwW7yYyx
   1jNqqF6JFoakmAG91+Cd5fpHXsiKuh0aKuI1EEE5d8ciR10Z3tAqfp/7E
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90529779
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0jPNZ6/m/rYZNxCqjT4jDrUDTX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DYYDGnTOamMNmv9eIt0Oom/phgBvJLUnNFmHgNu+Cs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6oa5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkS/
 /gBDT1cXyuhhuGM3beeZLh015sseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZQNwxzJ+
 T2Xl4j/Khs6O+KR6iSCznmDpf7Bhz72ca0bSoTto5aGh3XMnzdOWXX6T2CTpPiyike6HdVFO
 UEQ0iMroe4580nDZt75Uh6joX/CvQMGXNFQEOoS5wSEy66S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTi7IyQSIEcJbDUISgZD6N7myKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEr55AdgQYP0VreK6Fvh8PNlAteBHwaO6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBO
 he7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSiay4hTuFfKsEy/tX1
 XKnnSGEUx4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgTUNbtpvP3V+lSOm
 zq6Cydt40wFONASnwGNqdJDRbz0BSNT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7FYc1Buvr6Qp
 BmVAxYIoGcTcFWbcW1mnFg/MuKwNXu+xFpnVRER0aGAgSl+PNj+tPdEH3b1FJF+nNFeITdPZ
 6FtU6297j5nE1wrJxx1gUHBkbFf
IronPort-HdrOrdr: A9a23:TZcQsqpl7CA6urnqftXFdEIaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.96,285,1665460800"; 
   d="scan'208";a="90529779"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 3/6] CI: Only calculate ./configure args if needed
Date: Fri, 30 Dec 2022 00:38:45 +0000
Message-ID: <20221230003848.3241-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221230003848.3241-1-andrew.cooper3@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This is purely code motion of the cfgargs construction, into the case where it
is used.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/scripts/build | 63 ++++++++++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 8dee1cbbc251..f2301d08789d 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -39,37 +39,6 @@ if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
     hypervisor_only="y"
 fi
 
-# build up our configure options
-cfgargs=()
-cfgargs+=("--enable-docs")
-
-if [[ "${CC}" == "clang"* ]]; then
-    # SeaBIOS cannot be built with clang
-    cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
-    # iPXE cannot be built with clang
-    cfgargs+=("--with-system-ipxe=/usr/lib/ipxe/ipxe.pxe")
-    # newlib cannot be built with clang so we cannot build stubdoms
-    cfgargs+=("--disable-stubdom")
-fi
-
-if ! test -z "$(ldd /bin/ls|grep musl|head -1)"; then
-    # disable --disable-werror for QEMUU when building with MUSL
-    cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
-    # SeaBIOS doesn't build on MUSL systems
-    cfgargs+=("--with-system-seabios=/bin/false")
-fi
-
-# Qemu requires Python 3.5 or later, and ninja
-if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))" \
-        || ! type ninja; then
-    cfgargs+=("--with-system-qemu=/bin/false")
-fi
-
-# SeaBIOS requires GCC 4.6 or later
-if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
-    cfgargs+=("--with-system-seabios=/bin/false")
-fi
-
 # Directory for the artefacts to be dumped into
 mkdir binaries
 
@@ -80,7 +49,37 @@ if [[ "${hypervisor_only}" == "y" ]]; then
     # Preserve artefacts
     cp xen/xen binaries/xen
 else
-    # Full build
+    # Full build.  Figure out our ./configure options
+    cfgargs=()
+    cfgargs+=("--enable-docs")
+
+    if [[ "${CC}" == "clang"* ]]; then
+        # SeaBIOS cannot be built with clang
+        cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
+        # iPXE cannot be built with clang
+        cfgargs+=("--with-system-ipxe=/usr/lib/ipxe/ipxe.pxe")
+        # newlib cannot be built with clang so we cannot build stubdoms
+        cfgargs+=("--disable-stubdom")
+    fi
+
+    if  ! test -z "$(ldd /bin/ls|grep musl|head -1)"; then
+        # disable --disable-werror for QEMUU when building with MUSL
+        cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
+        # SeaBIOS doesn't build on MUSL systems
+        cfgargs+=("--with-system-seabios=/bin/false")
+    fi
+
+    # Qemu requires Python 3.5 or later, and ninja
+    if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))" \
+            || ! type ninja; then
+        cfgargs+=("--with-system-qemu=/bin/false")
+    fi
+
+    # SeaBIOS requires GCC 4.6 or later
+    if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
+        cfgargs+=("--with-system-seabios=/bin/false")
+    fi
+
     ./configure "${cfgargs[@]}"
     make -j$(nproc) dist
 
-- 
2.11.0


