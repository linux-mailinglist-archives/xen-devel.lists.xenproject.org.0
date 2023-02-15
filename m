Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A1697B58
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495902.766333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGUR-0002yg-W7; Wed, 15 Feb 2023 12:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495902.766333; Wed, 15 Feb 2023 12:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGUR-0002va-T0; Wed, 15 Feb 2023 12:02:23 +0000
Received: by outflank-mailman (input) for mailman id 495902;
 Wed, 15 Feb 2023 12:02:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LhbV=6L=citrix.com=prvs=4037f5ffb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSGUQ-0002d9-L5
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:02:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98d2f2df-ad28-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 13:02:21 +0100 (CET)
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
X-Inumbo-ID: 98d2f2df-ad28-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676462540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/vUeHriTwM3BI+2QtwE/fpQP34e1Nzdh1FIIl05etc8=;
  b=J4IDjLsUke/lWqjB3gfIFnP8o92FRD50FNO97HFmN/0XLe0QOfwr+Dbw
   6heBDkwOFpmAhgQU70SIN8s27TCvwcIHA2V30ENXark2Z1zlEJkQQcFkh
   V5749cSss9cu1Dmm+odtLEV6rtHr8QZ6YB7GqIgY4hc+klFcfY8mV19NO
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97137984
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:7YfmxaxGpqvggbq2ozh6t+cZxirEfRIJ4+MujC+fZmUNrF6WrkUEx
 zYeDz2APv+KNGL8f9lyaYq+oB5SvJOHmNdjGwdtqiAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPK0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU1nr
 dFbEW4SVE+G2t+Sn5GDb/lcuf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZQKxx3H9
 zKal4j/KkAWKoaW5jOlzkit2s7KrwzJeoAZToTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYXUsBcFOAS4wiXxq3ZpQ2eAwAsVSVdYdYrsMs3Qz0C1
 VKTmd7tQzt1v9WopWm1r+nO62noYG5McDFEPHVfJecY3zX9iK0a1j+Md4h8KvGw0+DRRhLI5
 iC6kxFr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eIlcFg
 2eJ42u9AaO/2lPwNcebhKrvY/nGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 snAIJfyVydAWf4PIN+KqwE1i+dDKscWnz67eHwG507/jer2iIC9F9/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnC/zGLnFnhTdSJTLcmv+6RqmhurflIO9JcJV6WAntvMuuVNw8xoqws/1
 i3lBRUCkgCi3iWvxMfjQikLVY4DlK1X9RoTVRHA937xgBDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:waCHuqMuh0iMt8BcTv2jsMiBIKoaSvp037BL7SxMoHluGaalfq
 +V7ZcmPGDP+U4ssR0b+OxoQZPwJ080lqQb3WByB8bBYOC8ghrNEGgK1+KLrgEIfReOk9K1vZ
 0QFJSWY+efMbEVt6bHCFvSKadY/OW6
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="97137984"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/4] automation: Remove clang-8 from Debian unstable container
Date: Wed, 15 Feb 2023 12:02:05 +0000
Message-ID: <20230215120208.35807-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230215120208.35807-1-anthony.perard@citrix.com>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
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
---

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
index a053c5c732..7d8af93653 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -339,16 +339,6 @@ debian-unstable-clang-debug:
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


