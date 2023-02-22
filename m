Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFE669F638
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 15:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499505.770666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUpsZ-0006hI-NI; Wed, 22 Feb 2023 14:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499505.770666; Wed, 22 Feb 2023 14:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUpsZ-0006ew-KE; Wed, 22 Feb 2023 14:13:55 +0000
Received: by outflank-mailman (input) for mailman id 499505;
 Wed, 22 Feb 2023 14:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TNgZ=6S=citrix.com=prvs=410ac2269=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUpsY-0006eq-2Q
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 14:13:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ffcb122-b2bb-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 15:13:50 +0100 (CET)
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
X-Inumbo-ID: 1ffcb122-b2bb-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677075230;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CCwb4C4/pVhn/n+dWOWl4tTtfVWWM2Gf7ytY4MuOlVs=;
  b=F4XyT5lfQDPWGSo7f6xw0D4usctrU7BRxvU7DTGn8GWAnWNzV+UuKT+k
   Qu26HmfSQNjr7nYE3BU0HWBKWn8y21dz8Jd7PGpyN4aglqJEsb+6UANi2
   MnkLJr7L5F8PaL13jtLkcC86ksynari36wnGSPwjY6APPUC74Es/V7VhR
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96903000
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:uX4F/6B3zLst7hVW/xnjw5YqxClBgxIJ4kV8jS/XYbTApGgr12MDx
 mQYDDzQPPeCazf8fot3OoWypkwFuJ7cm9ZhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlC5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5MhOOUZf0
 e0iDhMBZRu63vmR+a2yRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9K4LbHZ4Nxh7wS
 mTuok3BPiMEOY2myBmF+XP2g/fIj2THR9dHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGWfohcWVt5UEus7wAKA0KzZ50CeHGdsZjtAY9wvsIkxXy4n0
 neAmt+vDjtq2JWeQGiR8bq8pjqoNS8Ya2QFYEc5oRAtuoe55ttp11SWE4glSfTu5jHoJd3u6
 y6klRAZlpECt+go266wxAncpAuzr5ecG2bZ+T7rdm6i6wp4YqusaIqp9UXX4J58EWqJcrWSl
 CNawpbDtYjiGbnIzXXQG7tVQNlF8t7faFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGj4ctPupd6Oxwl8AM8OgJsdiNN7JzjmBZLlPvwc2XTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmXpH79BjO56n3hjrY82eXwc5076uYdymVbPEetVWLdwRr1RAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhTRUXX8ave8pQNHsbae1oOJY3UI6OJqV/XU9A/zvs9eyah1
 i3VZ3K0P3Km3yafeFXbMS8+AF4tNL4mxU8G0eUXFQ7A8xAejUyHtc/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:/KZnoaxuYTkR3qUE78YaKrPwFL1zdoMgy1knxilNoH1uA6qlfq
 +V/cjzuSWVtN9zYgBGpTnjAtjkfZq0z/cciuN9UdjNYOCBghrKEGgI1/qH/9SPIVydygaAvZ
 0QDpSWc+eAdGSSSfyKmHjCYqxQvOW6zA==
X-IronPort-AV: E=Sophos;i="5.97,318,1669093200"; 
   d="scan'208";a="96903000"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] CI: Drop gettext from containers
Date: Wed, 22 Feb 2023 14:13:22 +0000
Message-ID: <20230222141322.2376955-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Xen 4.13 is fully out of support now.  Drop this legacy build dependency.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
---
 automation/build/alpine/3.12-arm64v8.dockerfile           | 2 --
 automation/build/alpine/3.12.dockerfile                   | 2 --
 automation/build/centos/7.dockerfile                      | 2 --
 automation/build/debian/jessie-i386.dockerfile            | 2 --
 automation/build/debian/jessie.dockerfile                 | 2 --
 automation/build/debian/stretch-i386.dockerfile           | 2 --
 automation/build/debian/stretch.dockerfile                | 2 --
 automation/build/debian/unstable-arm64v8.dockerfile       | 2 --
 automation/build/debian/unstable-i386.dockerfile          | 2 --
 automation/build/debian/unstable.dockerfile               | 2 --
 automation/build/fedora/29.dockerfile                     | 2 --
 automation/build/suse/opensuse-leap.dockerfile            | 2 --
 automation/build/suse/opensuse-tumbleweed.dockerfile      | 2 --
 automation/build/ubuntu/bionic.dockerfile                 | 2 --
 automation/build/ubuntu/focal.dockerfile                  | 2 --
 automation/build/ubuntu/trusty.dockerfile                 | 2 --
 automation/build/ubuntu/xenial.dockerfile                 | 2 --
 automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile | 2 --
 18 files changed, 36 deletions(-)

diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
index f8d3927ee3ed..180c978964aa 100644
--- a/automation/build/alpine/3.12-arm64v8.dockerfile
+++ b/automation/build/alpine/3.12-arm64v8.dockerfile
@@ -20,8 +20,6 @@ RUN apk --no-cache add \
   dtc-dev \
   flex \
   gcc \
-  # gettext for Xen < 4.13
-  gettext \
   git \
   iasl \
   libaio-dev \
diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
index fbf4aa4d3d63..c847aa82d9e2 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.12.dockerfile
@@ -21,8 +21,6 @@ RUN apk --no-cache add \
   flex \
   g++ \
   gcc \
-  # gettext for Xen < 4.13
-  gettext \
   git \
   grep \
   iasl \
diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index f5264e02d92f..69dcefb2f011 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -25,8 +25,6 @@ RUN yum -y update \
         python-devel \
         libuuid-devel \
         pkgconfig \
-        # gettext for Xen < 4.13
-        gettext \
         flex \
         bison \
         libaio-devel \
diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index 3f86d91f63c6..b152d658d3b3 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -28,8 +28,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 2f19adcad395..1e33e635d2de 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -26,8 +26,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
index c7840d33ab52..d93f74c979ef 100644
--- a/automation/build/debian/stretch-i386.dockerfile
+++ b/automation/build/debian/stretch-i386.dockerfile
@@ -29,8 +29,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index 30fcc5288dee..2c086b197cba 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -27,8 +27,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/build/debian/unstable-arm64v8.dockerfile b/automation/build/debian/unstable-arm64v8.dockerfile
index 0080c22ba21f..b9b1587f888b 100644
--- a/automation/build/debian/unstable-arm64v8.dockerfile
+++ b/automation/build/debian/unstable-arm64v8.dockerfile
@@ -26,8 +26,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         libfdt-dev \
         bin86 \
diff --git a/automation/build/debian/unstable-i386.dockerfile b/automation/build/debian/unstable-i386.dockerfile
index 6ce54a481b07..1c4928b09eb1 100644
--- a/automation/build/debian/unstable-i386.dockerfile
+++ b/automation/build/debian/unstable-i386.dockerfile
@@ -28,8 +28,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/unstable.dockerfile
index b560337b7a10..6ef28782008c 100644
--- a/automation/build/debian/unstable.dockerfile
+++ b/automation/build/debian/unstable.dockerfile
@@ -26,8 +26,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index 60a5d722668f..e55b06a4517e 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -14,8 +14,6 @@ RUN dnf -y install \
         python3-devel \
         libuuid-devel \
         pkgconfig \
-        # gettext for Xen < 4.13
-        gettext \
         flex \
         bison \
         libaio-devel \
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 5e8111f40b13..bac938541215 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -22,8 +22,6 @@ RUN zypper install -y --no-recommends \
         flex \
         gcc \
         gcc-c++ \
-        # gettext-tools for Xen < 4.13
-        gettext-tools \
         git \
         glib2-devel \
         glibc-devel \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index b165c4824536..3e5771fccd2b 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -22,8 +22,6 @@ RUN zypper install -y --no-recommends \
         flex \
         gcc \
         gcc-c++ \
-        # gettext-tools for Xen < 4.13
-        gettext-tools \
         git \
         glib2-devel \
         glibc-devel \
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index 1e5a27c70f15..e15f54431efb 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -27,8 +27,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index 74655b9876d2..9c851c062073 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -26,8 +26,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index b4b2f85e7344..b298a515c611 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -27,8 +27,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index 82171d856dad..2d2ba3e31f63 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -27,8 +27,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        # gettext for Xen < 4.13
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
index 7eb1f22940d6..cb8e9e59bb43 100644
--- a/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
+++ b/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
@@ -19,8 +19,6 @@ RUN \
   apk add dbus && \
   apk add bash && \
   apk add python2 && \
-  # gettext for Xen < 4.13
-  apk add gettext && \
   apk add zlib && \
   apk add ncurses && \
   apk add texinfo && \
-- 
2.30.2


