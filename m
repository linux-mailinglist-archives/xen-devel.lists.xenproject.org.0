Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6EC6A9A01
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 15:57:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506054.779069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY6pU-000525-Jz; Fri, 03 Mar 2023 14:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506054.779069; Fri, 03 Mar 2023 14:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY6pU-0004zH-Gb; Fri, 03 Mar 2023 14:56:16 +0000
Received: by outflank-mailman (input) for mailman id 506054;
 Fri, 03 Mar 2023 14:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csqk=63=citrix.com=prvs=4196fa7ca=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pY6pS-0004zB-EA
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 14:56:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 861f2f6f-b9d3-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 15:56:08 +0100 (CET)
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
X-Inumbo-ID: 861f2f6f-b9d3-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677855368;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JjKDxs+lMN2cc1KImaCocyjtIiKyMAl4MTFa7yCEdFo=;
  b=Fe4R8l/wWcGva6K0aTiNbtF31gHc8JugYG9iKXck6hT3mIL8gXfkmbot
   FzSorYIXNqLif3fx7IeHpkRot3m9J/ORnPW91qZCaalCXk86WZLMbjdvk
   95Kogdz4Q5CMKc1/wsomdft8F2jFPVHcjwfXDYo6DuCaLYX2I+8pSHF1h
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 99260285
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:n3sW+ap6/1r15ojc7ZY2pi9Qq6peBmIbZRIvgKrLsJaIsI4StFCzt
 garIBnQOPaNZmLwc41wYNm1oBhUuJLWyoI1HQI++yFkES5G9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzyJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABxQQyufiN+O+ZCAaPVzlPx4dO7RBLpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jOXpTqhWEFHXDCZ4SbVrWL3pLDOpC+hd5hDPpe00Nw3pnTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp6efOIZ6AyluKhR/vFBMJIlI6XA0/bxca8eG4+KYJtiuaG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF7qlxBGFb5J+i8BQ2Sw284WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMYURMsIpJFDboHoGiausM4fFyhVErE3CE
 c3DLZbE4YgyUsyLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCf9dFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLcqn+pQKLbDcc1MO9aNII6a5/I7NsrdNx8x9/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:aJPADK9m0xCYzk16Q0puk+FSdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZquz+8O3WBxB8brYOCCggeVxe5ZnOzfKlHbehEWs9QtrZ
 uIEJIOQ+EYb2IK6/oSiTPQe7lP/DDEytHQuQ609QYOcegeUdAF0+4PMHf/LqQZfml7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpTWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1OcJi+EzS/BkuPJlawkEuTzYJLiJnIfy/wzdldvfpmrCVu
 O84SvIcf4Drk85NVvF3CcFkzOQrArGrUWSg2NwyEGT3vDRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw6xgVyuK4Ii2CrHDE1UYKgKoWlThSQIEeYLheocgW+15UCo4JGGb/5Jo8GO
 djAcnA7LIOGGnqJkzxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NY2SoVC5e
 7DLqN0/Ys+OPM+fOZ4HqMMUMG3AmvCTVbFN3+TO03uEOUdN3fEu/fMkccIDSGRCe81JbcJ6e
 T8uQljxBAPkmrVeLyz4KE=
X-IronPort-AV: E=Sophos;i="5.98,230,1673931600"; 
   d="scan'208";a="99260285"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH backport for-4.15] tools: Drop gettext as a build dependency
Date: Fri, 3 Mar 2023 14:55:35 +0000
Message-ID: <20230303145535.23412-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

It has not been a dependency since at least 4.13.  Remove its mandatory check
from ./configure.

Annotate the dependency in the CI dockerfiles, and drop them from CirrusCI and
TravisCI.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
(cherry picked from commit e21a6a4f966a7e91cb0bb014dbe15d15cc0502ad)
---

Notes:
    As we dropped "gettext" from many containers, build on staging-4.15
    starts to fail due to unmet dependency. But that dependency isn't needed,
    but configure hasn't been updated.
    
    pipeline with many fail due to missing gettext:
        https://gitlab.com/xen-project/xen/-/pipelines/793302203
    
    pipeline with that patch backported:
        https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/794335026
    still several build failure, but less, and not due to configure step failing.
    
    Commit can be cherry-picked cleanly to staging-4.15.
    
    That commit would be needed as well on staging-4.14, but it doesn't
    apply cleanly due to change in configure, and missing dockerfiles.

 .cirrus.yml                                   |  2 +-
 .travis.yml                                   |  1 -
 README                                        |  1 -
 .../build/alpine/3.12-arm64v8.dockerfile      |  1 +
 automation/build/alpine/3.12.dockerfile       |  1 +
 automation/build/centos/7.2.dockerfile        |  1 +
 automation/build/centos/7.dockerfile          |  1 +
 .../build/debian/jessie-i386.dockerfile       |  1 +
 automation/build/debian/jessie.dockerfile     |  1 +
 .../build/debian/stretch-i386.dockerfile      |  1 +
 automation/build/debian/stretch.dockerfile    |  1 +
 .../build/debian/unstable-arm64v8.dockerfile  |  1 +
 .../build/debian/unstable-i386.dockerfile     |  1 +
 automation/build/debian/unstable.dockerfile   |  1 +
 automation/build/fedora/29.dockerfile         |  1 +
 .../build/suse/opensuse-leap.dockerfile       |  1 +
 .../build/suse/opensuse-tumbleweed.dockerfile |  1 +
 automation/build/ubuntu/bionic.dockerfile     |  1 +
 automation/build/ubuntu/focal.dockerfile      |  1 +
 automation/build/ubuntu/trusty.dockerfile     |  1 +
 automation/build/ubuntu/xenial.dockerfile     |  1 +
 .../alpine/3.12-arm64v8.dockerfile            |  1 +
 tools/configure                               | 49 -------------------
 tools/configure.ac                            |  2 -
 24 files changed, 20 insertions(+), 54 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 0efff6fa98..fdb1c9c94d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -4,7 +4,7 @@ freebsd_template: &FREEBSD_TEMPLATE
     APPEND_LIB: /usr/local/lib
     APPEND_INCLUDES: /usr/local/include
 
-  install_script: pkg install -y seabios gettext-tools gmake
+  install_script: pkg install -y seabios gmake
                                  pkgconf python libiconv bison perl5
                                  yajl lzo2 pixman argp-standalone
                                  libxml2 glib git
diff --git a/.travis.yml b/.travis.yml
index 2362475f7a..f3cd15b79f 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -54,7 +54,6 @@ addons:
             - pkg-config
             - flex
             - bison
-            - gettext
             - acpica-tools
             - bin86
             - bcc
diff --git a/README b/README
index de579080d7..efaa1451cb 100644
--- a/README
+++ b/README
@@ -63,7 +63,6 @@ provided by your OS distributor:
     * bridge-utils package (/sbin/brctl)
     * iproute package (/sbin/ip)
     * GNU bison and GNU flex
-    * GNU gettext
     * ACPI ASL compiler (iasl)
 
 In addition to the above there are a number of optional build
diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
index d6cdf5b200..a1ac960595 100644
--- a/automation/build/alpine/3.12-arm64v8.dockerfile
+++ b/automation/build/alpine/3.12-arm64v8.dockerfile
@@ -22,6 +22,7 @@ RUN \
   apk add dev86 && \
   apk add dtc-dev && \
   apk add gcc  && \
+  # gettext for Xen < 4.13
   apk add gettext && \
   apk add git && \
   apk add iasl && \
diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
index 94557e239b..bb8e5ece74 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.12.dockerfile
@@ -23,6 +23,7 @@ RUN \
   apk add gcc  && \
   apk add g++ && \
   apk add clang  && \
+  # gettext for Xen < 4.13
   apk add gettext && \
   apk add git && \
   apk add iasl && \
diff --git a/automation/build/centos/7.2.dockerfile b/automation/build/centos/7.2.dockerfile
index af672a0be1..4baa097e31 100644
--- a/automation/build/centos/7.2.dockerfile
+++ b/automation/build/centos/7.2.dockerfile
@@ -26,6 +26,7 @@ RUN rpm --rebuilddb && \
         python-devel \
         libuuid-devel \
         pkgconfig \
+        # gettext for Xen < 4.13
         gettext \
         flex \
         bison \
diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index 5f83c97d0c..e688a4cece 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -24,6 +24,7 @@ RUN yum -y install \
         python-devel \
         libuuid-devel \
         pkgconfig \
+        # gettext for Xen < 4.13
         gettext \
         flex \
         bison \
diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index 66a6abb381..3f86d91f63 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -28,6 +28,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 808d6272e4..2f19adcad3 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -26,6 +26,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
index 7b6f8eff69..c7840d33ab 100644
--- a/automation/build/debian/stretch-i386.dockerfile
+++ b/automation/build/debian/stretch-i386.dockerfile
@@ -29,6 +29,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index e3bace1f87..e2ee14e201 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/debian/unstable-arm64v8.dockerfile b/automation/build/debian/unstable-arm64v8.dockerfile
index 8455d67b72..4409f596e1 100644
--- a/automation/build/debian/unstable-arm64v8.dockerfile
+++ b/automation/build/debian/unstable-arm64v8.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         libfdt-dev \
diff --git a/automation/build/debian/unstable-i386.dockerfile b/automation/build/debian/unstable-i386.dockerfile
index 86ff3585df..06ffb97384 100644
--- a/automation/build/debian/unstable-i386.dockerfile
+++ b/automation/build/debian/unstable-i386.dockerfile
@@ -29,6 +29,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/unstable.dockerfile
index 1200245c9b..828afa2e1e 100644
--- a/automation/build/debian/unstable.dockerfile
+++ b/automation/build/debian/unstable.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index 5482952523..027b93ceaf 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -17,6 +17,7 @@ RUN dnf -y install \
         python3-devel \
         libuuid-devel \
         pkgconfig \
+        # gettext for Xen < 4.13
         gettext \
         flex \
         bison \
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 685dd5d7fd..573fbd8ae4 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -22,6 +22,7 @@ RUN zypper install -y --no-recommends \
         flex \
         gcc \
         gcc-c++ \
+        # gettext-tools for Xen < 4.13
         gettext-tools \
         git \
         glib2-devel \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 061173e751..8ff7b9b5ce 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -22,6 +22,7 @@ RUN zypper install -y --no-recommends \
         flex \
         gcc \
         gcc-c++ \
+        # gettext-tools for Xen < 4.13
         gettext-tools \
         git \
         glib2-devel \
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index 408063698c..406a97494c 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index 90b4001a6a..952a3172aa 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -26,6 +26,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index fd377d948f..b4b2f85e73 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index 57a71eb8c6..82171d856d 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
index 9457009452..7eb1f22940 100644
--- a/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
+++ b/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
@@ -19,6 +19,7 @@ RUN \
   apk add dbus && \
   apk add bash && \
   apk add python2 && \
+  # gettext for Xen < 4.13
   apk add gettext && \
   apk add zlib && \
   apk add ncurses && \
diff --git a/tools/configure b/tools/configure
index bb5acf9d43..5df30df9b3 100755
--- a/tools/configure
+++ b/tools/configure
@@ -689,7 +689,6 @@ INSTALL_PROGRAM
 SET_MAKE
 AWK
 IASL
-XGETTEXT
 FLEX
 BISON
 PERL
@@ -847,7 +846,6 @@ PYTHON
 PERL
 BISON
 FLEX
-XGETTEXT
 AS86
 LD86
 BCC
@@ -1597,7 +1595,6 @@ Some influential environment variables:
   PERL        Path to Perl parser
   BISON       Path to Bison parser generator
   FLEX        Path to Flex lexical analyser generator
-  XGETTEXT    Path to xgetttext tool
   AS86        Path to as86 tool
   LD86        Path to ld86 tool
   BCC         Path to bcc tool
@@ -4738,7 +4735,6 @@ LDFLAGS="$PREPEND_LDFLAGS $LDFLAGS $APPEND_LDFLAGS"
 
 
 
-
 # Checks for programs.
 ac_ext=c
 ac_cpp='$CPP $CPPFLAGS'
@@ -7846,51 +7842,6 @@ fi
 
 if ! $rump; then
 
-# Extract the first word of "xgettext", so it can be a program name with args.
-set dummy xgettext; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_XGETTEXT+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
-  case $XGETTEXT in
-  [\\/]* | ?:[\\/]*)
-  ac_cv_path_XGETTEXT="$XGETTEXT" # Let the user override the test with a path.
-  ;;
-  *)
-  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
-for as_dir in $PATH
-do
-  IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-    for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_XGETTEXT="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
-    break 2
-  fi
-done
-  done
-IFS=$as_save_IFS
-
-  test -z "$ac_cv_path_XGETTEXT" && ac_cv_path_XGETTEXT="no"
-  ;;
-esac
-fi
-XGETTEXT=$ac_cv_path_XGETTEXT
-if test -n "$XGETTEXT"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $XGETTEXT" >&5
-$as_echo "$XGETTEXT" >&6; }
-else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-fi
-
-
-if test x"${XGETTEXT}" = x"no"
-then
-    as_fn_error $? "Unable to find xgettext, please install xgettext" "$LINENO" 5
-fi
 case "$host_cpu" in
 i[3456]86|x86_64|aarch64)
     # Extract the first word of "iasl", so it can be a program name with args.
diff --git a/tools/configure.ac b/tools/configure.ac
index 636e7077be..6414fcbb44 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -298,7 +298,6 @@ AC_ARG_VAR([PYTHON], [Path to the Python parser])
 AC_ARG_VAR([PERL], [Path to Perl parser])
 AC_ARG_VAR([BISON], [Path to Bison parser generator])
 AC_ARG_VAR([FLEX], [Path to Flex lexical analyser generator])
-AC_ARG_VAR([XGETTEXT], [Path to xgetttext tool])
 AC_ARG_VAR([AS86], [Path to as86 tool])
 AC_ARG_VAR([LD86], [Path to ld86 tool])
 AC_ARG_VAR([BCC], [Path to bcc tool])
@@ -381,7 +380,6 @@ AS_IF([test "$cross_compiling" != yes], [
 
 if ! $rump; then
 
-AX_PATH_PROG_OR_FAIL([XGETTEXT], [xgettext])
 dnl as86, ld86, bcc and iasl are only required when the host system is x86*.
 dnl "host" here means the platform on which the hypervisor and tools is
 dnl going to run, not the platform on which we are building (known as
-- 
Anthony PERARD


