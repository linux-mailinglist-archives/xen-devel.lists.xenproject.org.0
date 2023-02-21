Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C7369E535
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 17:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499021.770037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVwA-000728-IW; Tue, 21 Feb 2023 16:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499021.770037; Tue, 21 Feb 2023 16:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVwA-0006yU-Cs; Tue, 21 Feb 2023 16:56:18 +0000
Received: by outflank-mailman (input) for mailman id 499021;
 Tue, 21 Feb 2023 16:56:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJL1=6R=citrix.com=prvs=409c08766=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pUVw7-0006DG-Q3
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 16:56:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a64f8060-b208-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 17:56:14 +0100 (CET)
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
X-Inumbo-ID: a64f8060-b208-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676998574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lZPdRI/rCKRxPfrcQsNJIuk7eF0eSCT4HXLvudQRh+U=;
  b=U8Z5C+5cecy1PfLbdbjTDmq3eakqtVa17ZAM7OTegr3FwPUbVOpfYsJe
   sl36hen2JMlKHHjvyDH/I93zYhnZygKaS7Yv5pAbEXNK1N/9Mj1Inec+2
   uGrDsk79ZcuAopz50GK90uS9inj08oT/QQUmPFC0ZSLh+h9hzV4qRK0x2
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96765394
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:nwrPIKxJ1wEjfQ05Ow56t+ctxirEfRIJ4+MujC+fZmUNrF6WrkUFy
 GIYC2+GbK7YZDSge9gja4mzoEpUvJDWyoI2SwNurSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkP6kT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXN23
 t09DhIyVC6svuC9g5jqVfdrndt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZQLwRjF/
 TOal4j/KiEfDOWY5AXUznOXu+Dphz+8W4wrT4Tto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYXUsBcFOAS4wiXxq3ZpQ2eAwAsVSVdYdYrsMs3Qz0C1
 VKTmd7tQzt1v9WopWm1r+nO62noYG5McDFEPHVfJecY3zX9iJMLpTPqaPRcKpCat9/+Whuh3
 C6Ntzdr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJFcFg
 2eJ42u9AaO/21PzNMdKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhdywPhvY
 cfEKJ30ZZr/NUiA5GDrL9rxLJdxnnxurY8tbc2TI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4GX/ZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt7JdI7xf8Ozr6Ql
 px/M2cBoGfCabT8AV3iQhhehHnHBv6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:SkJ8sKM2FDyxHsBcTjejsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="96765394"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v2 3/7] automation: Remove clang-8 from Debian unstable container
Date: Tue, 21 Feb 2023 16:55:38 +0000
Message-ID: <20230221165542.7642-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221165542.7642-1-anthony.perard@citrix.com>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

First, apt complain that it isn't the right way to add keys anymore,
but hopefully that's just a warning.

Second, we can't install clang-8:
The following packages have unmet dependencies:
 clang-8 : Depends: libstdc++-8-dev but it is not installable
           Depends: libgcc-8-dev but it is not installable
           Depends: libobjc-8-dev but it is not installable
           Recommends: llvm-8-dev but it is not going to be installed
           Recommends: libomp-8-dev but it is not going to be installed
 libllvm8 : Depends: libffi7 (>= 3.3~20180313) but it is not installable
E: Unable to correct problems, you have held broken packages.

clang on Debian unstable is now version 14.0.6.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---

This change will break "staging-*" branches as they would still test
clang-8. So patch needs to be backported. (at least build.yaml change)

Current container have:
root@f3d1fc4f58c7:/build# clang --version
clang version 8.0.1- (branches/release_80)
root@113cb5730b2a:/build# clang-8 --version
clang version 8.0.1- (branches/release_80)

(built about 3years ago)
---
 automation/build/debian/unstable-llvm-8.list |  3 ---
 automation/build/debian/unstable.dockerfile  | 12 ------------
 automation/gitlab-ci/build.yaml              | 10 ----------
 3 files changed, 25 deletions(-)
 delete mode 100644 automation/build/debian/unstable-llvm-8.list

diff --git a/automation/build/debian/unstable-llvm-8.list b/automation/build/debian/unstable-llvm-8.list
deleted file mode 100644
index dc119fa0b4..0000000000
--- a/automation/build/debian/unstable-llvm-8.list
+++ /dev/null
@@ -1,3 +0,0 @@
-# Unstable LLVM 8 repos
-deb http://apt.llvm.org/unstable/ llvm-toolchain-8 main
-deb-src http://apt.llvm.org/unstable/ llvm-toolchain-8 main
diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/unstable.dockerfile
index 9de766d596..b560337b7a 100644
--- a/automation/build/debian/unstable.dockerfile
+++ b/automation/build/debian/unstable.dockerfile
@@ -51,15 +51,3 @@ RUN apt-get update && \
         apt-get autoremove -y && \
         apt-get clean && \
         rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-
-RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add -
-COPY unstable-llvm-8.list /etc/apt/sources.list.d/
-
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        clang-8 \
-        lld-8 \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index aed8fc0240..22ce1c45e7 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -329,16 +329,6 @@ debian-unstable-clang-debug:
   variables:
     CONTAINER: debian:unstable
 
-debian-unstable-clang-8:
-  extends: .clang-8-x86-64-build
-  variables:
-    CONTAINER: debian:unstable
-
-debian-unstable-clang-8-debug:
-  extends: .clang-8-x86-64-build-debug
-  variables:
-    CONTAINER: debian:unstable
-
 debian-unstable-gcc:
   extends: .gcc-x86-64-build
   variables:
-- 
Anthony PERARD


