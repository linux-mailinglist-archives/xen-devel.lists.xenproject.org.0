Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D063257A6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 21:30:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89955.169999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNHM-0007vl-5S; Thu, 25 Feb 2021 20:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89955.169999; Thu, 25 Feb 2021 20:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNHM-0007vI-0e; Thu, 25 Feb 2021 20:30:32 +0000
Received: by outflank-mailman (input) for mailman id 89955;
 Thu, 25 Feb 2021 20:30:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFNHK-0007vD-M8
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 20:30:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df6720d4-3744-49de-b4d1-09441e620fab;
 Thu, 25 Feb 2021 20:30:29 +0000 (UTC)
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
X-Inumbo-ID: df6720d4-3744-49de-b4d1-09441e620fab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614285029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=2KPiebheJyKHjlqvLctYPjbzkFONFknSVoRbxujFVEE=;
  b=WtKRWOZOQE3NpbUysrR8U9Mf1hy6RIIFO86Ps8M8/8/I10xx+Hj7rtpO
   Sgm9N7e4PfB0ZdXphI0XKBB1tWWNMiOlox/8rdue6NMjhq7bPDHw/0zaW
   mN4CmGzMocBLNQ60FnkhL6RDZOMI6hD+2r+YThHFdUHRUdSHbvcPvXGPT
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NePu1J4P/KYBJYnQPEvgTTrX62mpxFDZpqQPpwPq53wThMHrfGNYe9GkQgSnUt+MlZwPmZ2jnZ
 T1nwU86VaQccohBP6vqE1pswVZiisDvvug2bX6Rz8q2YqT/XyLfkQIxEG+7K44fU5QQ1rmhYQX
 WAHDpNi1OEeyjRkdxSi2+toy+Kwfku6D9OJi8NDP66+QhL/lCgVz6Gwn+5b4mrFWmu6s1IumCa
 zs1/5Kj146QGEVTx8aUN7XpL5kHniPgoM+CLZE0A7/4S8cO/YE2krv+9tQdRI62n55/153s6Hb
 Q/8=
X-SBRS: 5.2
X-MesageID: 37980454
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,207,1610427600"; 
   d="scan'208";a="37980454"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH 3/3] automation: Annotate that a 32bit libc is no longer a dependency
Date: Thu, 25 Feb 2021 20:30:09 +0000
Message-ID: <20210225203010.11378-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210225203010.11378-1-andrew.cooper3@citrix.com>
References: <20210225203010.11378-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

We can't drop the 32bit libc from the existing containers, because they are
used on older Xen branches as well.

However, we can avoid the dependency being propagated into newer conainers
derived from our dockerfiles.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

For 4.15.  Documentation changes only
---
 automation/build/archlinux/current.dockerfile        | 1 +
 automation/build/centos/7.2.dockerfile               | 1 +
 automation/build/centos/7.dockerfile                 | 1 +
 automation/build/debian/jessie.dockerfile            | 1 +
 automation/build/debian/stretch.dockerfile           | 1 +
 automation/build/debian/unstable.dockerfile          | 1 +
 automation/build/fedora/29.dockerfile                | 1 +
 automation/build/suse/opensuse-leap.dockerfile       | 1 +
 automation/build/suse/opensuse-tumbleweed.dockerfile | 1 +
 automation/build/ubuntu/bionic.dockerfile            | 1 +
 automation/build/ubuntu/focal.dockerfile             | 1 +
 automation/build/ubuntu/trusty.dockerfile            | 1 +
 automation/build/ubuntu/xenial.dockerfile            | 1 +
 13 files changed, 13 insertions(+)

diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index d8fbebaf79..d46fc9d9ca 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -20,6 +20,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
         iasl \
         inetutils \
         iproute \
+        # lib32-glibc for Xen < 4.15
         lib32-glibc \
         libaio \
         libcacard \
diff --git a/automation/build/centos/7.2.dockerfile b/automation/build/centos/7.2.dockerfile
index c2f46b694c..af672a0be1 100644
--- a/automation/build/centos/7.2.dockerfile
+++ b/automation/build/centos/7.2.dockerfile
@@ -34,6 +34,7 @@ RUN rpm --rebuilddb && \
         yajl-devel \
         pixman-devel \
         glibc-devel \
+        # glibc-devel.i686 for Xen < 4.15
         glibc-devel.i686 \
         make \
         binutils \
diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index e37d9d743a..5f83c97d0c 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -32,6 +32,7 @@ RUN yum -y install \
         yajl-devel \
         pixman-devel \
         glibc-devel \
+        # glibc-devel.i686 for Xen < 4.15
         glibc-devel.i686 \
         make \
         binutils \
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 1232b9e204..808d6272e4 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -31,6 +31,7 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
+        # libc6-dev-i386 for Xen < 4.15
         libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index 32742f7f39..e3bace1f87 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -32,6 +32,7 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
+        # libc6-dev-i386 for Xen < 4.15
         libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/unstable.dockerfile
index aeb4f3448b..9a10ee08d6 100644
--- a/automation/build/debian/unstable.dockerfile
+++ b/automation/build/debian/unstable.dockerfile
@@ -32,6 +32,7 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
+        # libc6-dev-i386 for Xen < 4.15
         libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index 6a4e5b0413..5482952523 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -25,6 +25,7 @@ RUN dnf -y install \
         yajl-devel \
         pixman-devel \
         glibc-devel \
+        # glibc-devel.i686 for Xen < 4.15
         glibc-devel.i686 \
         make \
         binutils \
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index c60c13c943..685dd5d7fd 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -26,6 +26,7 @@ RUN zypper install -y --no-recommends \
         git \
         glib2-devel \
         glibc-devel \
+        # glibc-devel-32bit for Xen < 4.15
         glibc-devel-32bit \
         gzip \
         hostname \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 084cce0921..061173e751 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -26,6 +26,7 @@ RUN zypper install -y --no-recommends \
         git \
         glib2-devel \
         glibc-devel \
+        # glibc-devel-32bit for Xen < 4.15
         glibc-devel-32bit \
         gzip \
         hostname \
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index 712b2e4722..408063698c 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -32,6 +32,7 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
+        # libc6-dev-i386 for Xen < 4.15
         libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index c1c1f8d58f..90b4001a6a 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -31,6 +31,7 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
+        # libc6-dev-i386 for Xen < 4.15
         libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index 397a28061d..fd377d948f 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -32,6 +32,7 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
+        # libc6-dev-i386 for Xen < 4.15
         libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index ce0e84fa2f..57a71eb8c6 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -32,6 +32,7 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
+        # libc6-dev-i386 for Xen < 4.15
         libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
-- 
2.11.0


