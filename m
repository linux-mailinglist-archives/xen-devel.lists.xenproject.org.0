Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B0669E217
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 15:15:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498970.769948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUTQ1-0007nN-TB; Tue, 21 Feb 2023 14:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498970.769948; Tue, 21 Feb 2023 14:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUTQ1-0007kk-Pw; Tue, 21 Feb 2023 14:14:57 +0000
Received: by outflank-mailman (input) for mailman id 498970;
 Tue, 21 Feb 2023 14:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0sS=6R=citrix.com=prvs=4098cc5f9=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pUTPz-0007ke-S2
 for xen-devel@lists.xen.org; Tue, 21 Feb 2023 14:14:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19c92644-b1f2-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 15:14:51 +0100 (CET)
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
X-Inumbo-ID: 19c92644-b1f2-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676988891;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pFo4aVLkOcxmiWbJUtshp9TPp+36939f/k5lOtsAwZk=;
  b=eZ4pjHPk3sR7laYnCPWdb30xQGmlKPEsLD7OW+qB3RMUwGukFtlUJqo2
   7L74UXr6z91dS7Eor8pGmOU9Z2yS5e60LJywN4Fs3kb2xMomaC6Fmei/4
   yhgkTcXv+Uzpcv7W7mfmtz9pvGSflgiNZZFTRz8Z7/WGtJXzaiFwL4LFm
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100318756
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rqejVK37AVGWF/O8PfbD5dNxkn2cJEfYwER7XKvMYLTBsI5bp2EAn
 WEeUW+GPq3fZGbyeYx1Yd7g/E0D68eBxtVrSgVlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkPKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfXXNj/
 voIIgo2bw3Sgfyr/LCZSMxQr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tP2vnWK5dzRXpUiKrK4zy2PS0BZwwP7mN9+9ltmiHJ0NxR/I+
 T+Yl4j/KiA7aIWAlAqJyXCLi9fjgSfcUa5LFKLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8gqsVNaVdx6/pmSNslgDWt5TO+og4QqJx+zf5APxO4QfZmcfMpp87pZwHGF0k
 AbTxLsFGACDrpXJW1+W8KeelwizJHkTM3I+Zw0GaDcstoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStamC0bb1HRcNJG9GRF5mLJNk43d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa/S4W8BqiEMYMVOvCdkTNrGwk0OCatM53FyhBwwcnTx
 7/GGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlnyaPU6lTCfNE98taQLeBt3VGYvY+G05B
 f4DbZrVo/ieOcWiChTqHXk7cwlRdydiW8yrwyGVH8baSjdb9KgaI6e56dscl0ZNw8y5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:Hfu0M6khvru06LbsIh6sMiFp1qLpDfIJ3DAbv31ZSRFFG/Fw9v
 rPoB1/73TJYVkqNk3I9erwXZVoIkmyyXcW2+gs1N6ZNWGN1QeVxedZnPLfKlXbakrDH8FmpM
 VdmsNFebnN5DZB/LzHyTj9P9E8wMSWtICE7N2uskuEBmlRGsddBnxCe2Wm+5RNNXF77EwCZe
 Gh2vY=
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="100318756"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xen.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] livepatch-build: Check compiler version matches
Date: Tue, 21 Feb 2023 14:14:32 +0000
Message-ID: <20230221141432.972145-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For reliable live patch generation, the compiler version used should
match the original binary. Check that this is the case and add a
--skip-compiler-check option to override this.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 livepatch-build | 54 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/livepatch-build b/livepatch-build
index 91d203b..e4b4dba 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -33,6 +33,7 @@ DEPENDS=
 XEN_DEPENDS=
 PRELINK=
 STRIP=0
+SKIP_COMPILER_CHECK=0
 XENSYMS=xen-syms
 
 warn() {
@@ -266,27 +267,44 @@ function create_patch()
     objcopy --set-section-flags .livepatch.xen_depends=alloc,readonly "${PATCHNAME}.livepatch"
 }
 
+check_compiler() {
+    orig_ver=$(readelf -p .comment "$XENSYMS" | grep -o 'GCC.*')
+
+    in_file=$(mktemp --suffix=.c)
+    out_file=$(mktemp --suffix=.o)
+    echo 'int main(void) {}' > "$in_file"
+    gcc -c -o "$out_file" "$in_file"
+    new_ver=$(readelf -p .comment "$out_file" | grep -o 'GCC.*')
+
+    rm -f "$infile" "$outfile"
+
+    if [ "$orig_ver" != "$new_ver" ]; then
+        die "Mismatched compiler version: Original \"$orig_ver\" New \"$new_ver\""
+    fi
+}
+
 usage() {
     echo "usage: $(basename $0) [options]" >&2
-    echo "        -h, --help         Show this help message" >&2
-    echo "        -s, --srcdir       Xen source directory" >&2
-    echo "        -p, --patch        Patch file" >&2
-    echo "        -c, --config       .config file" >&2
-    echo "        -o, --output       Output directory" >&2
-    echo "        -j, --cpus         Number of CPUs to use" >&2
-    echo "        -k, --skip         Skip build or diff phase" >&2
-    echo "        -d, --debug        Enable debug logging" >&2
-    echo "        --xen-debug        Build debug Xen (if your .config does not have the options)" >&2
-    echo "        --xen-syms         Build against a xen-syms" >&2
-    echo "        --depends          Required build-id" >&2
-    echo "        --xen-depends      Required Xen build-id" >&2
-    echo "        --prelink          Prelink" >&2
-    echo "        --strip            Remove all symbols that are not needed for relocation processing." >&2
+    echo "        -h, --help            Show this help message" >&2
+    echo "        -s, --srcdir          Xen source directory" >&2
+    echo "        -p, --patch           Patch file" >&2
+    echo "        -c, --config          .config file" >&2
+    echo "        -o, --output          Output directory" >&2
+    echo "        -j, --cpus            Number of CPUs to use" >&2
+    echo "        -k, --skip            Skip build or diff phase" >&2
+    echo "        -d, --debug           Enable debug logging" >&2
+    echo "        --xen-debug           Build debug Xen (if your .config does not have the options)" >&2
+    echo "        --xen-syms            Build against a xen-syms" >&2
+    echo "        --depends             Required build-id" >&2
+    echo "        --xen-depends         Required Xen build-id" >&2
+    echo "        --prelink             Prelink" >&2
+    echo "        --strip               Remove all symbols that are not needed for relocation processing." >&2
+    echo "        --skip-compiler-check Skip compiler version check." >&2
 }
 
 find_tools || die "can't find supporting tools"
 
-options=$(getopt -o hs:p:c:o:j:k:d -l "help,srcdir:,patch:,config:,output:,cpus:,skip:,debug,xen-debug,xen-syms:,depends:,xen-depends:,prelink,strip" -- "$@") || die "getopt failed"
+options=$(getopt -o hs:p:c:o:j:k:d -l "help,srcdir:,patch:,config:,output:,cpus:,skip:,debug,xen-debug,xen-syms:,depends:,xen-depends:,prelink,strip,skip-compiler-check" -- "$@") || die "getopt failed"
 
 eval set -- "$options"
 
@@ -358,6 +376,10 @@ while [[ $# -gt 0 ]]; do
             STRIP=1
             shift
             ;;
+        --skip-compiler-check)
+            SKIP_COMPILER_CHECK=1
+            shift
+            ;;
         --)
             shift
             break
@@ -383,6 +405,8 @@ OUTPUT="$(readlink -m -- "$outputarg")"
 [ -f "${PATCHFILE}" ] || die "Patchfile does not exist"
 [ -f "${CONFIGFILE}" ] || die ".config does not exist"
 
+[ -f "$XENSYMS" ] && [ "$SKIP_COMPILER_CHECK" -eq 0 ] && check_compiler
+
 PATCHNAME=$(make_patch_name "${PATCHFILE}")
 
 echo "Building LivePatch patch: ${PATCHNAME}"
-- 
2.31.1


