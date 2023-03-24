Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194196C8680
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 21:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514404.796591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfngx-0000we-BK; Fri, 24 Mar 2023 20:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514404.796591; Fri, 24 Mar 2023 20:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfngx-0000ut-7e; Fri, 24 Mar 2023 20:07:15 +0000
Received: by outflank-mailman (input) for mailman id 514404;
 Fri, 24 Mar 2023 20:07:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfngv-0000dh-AO
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 20:07:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75b496b4-ca7f-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 21:07:12 +0100 (CET)
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
X-Inumbo-ID: 75b496b4-ca7f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679688432;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KqFcwvJ/px9m13jhQZPwpIU32h/bfpIOJyd3nQj7S44=;
  b=Yw1ekJkcExAHa9Y68mSEaN4wZL+Ln90vf/9v5SoQevTKWmLLFQ1wDAnS
   o6yMUq5WCLEOxRfxCaWsKqE4H+vcj5uR+9H5ISMAuxJtGEEXm1LfSmRQb
   fIloJOVkiTtp8TQwqK7fCf5BLo4+9gO51liqsz+GR48C24f9ytAUIwvC9
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104683464
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:V3fW1Kz9qDZo/TLjCNV6t+coxirEfRIJ4+MujC+fZmUNrF6WrkUAn
 GYZWz2DOfmLZ2XwL9x2ao+yoEkD65XUxtAwGwtp/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6wT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTps0
 bsIGiEvVTGstuSwzpWlaelor8t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwNwhjI/
 T6YowwVBDknOPWCyiuZ3kuuqeDjtCj2XqsNEpyBo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QOsc49RTUuk
 FiTjd7tLTVqvPueTnf13rydtz+1NAAeJHUOYiJCRgwAi+QPu6lq0EiJFIw6Vvfo0JusQ2qYL
 y22QDYW3Jc3yt45xoeA3H/2hTSigYbqTgoc6VCCNo661T+VdLJJdqTxtweKs6gddt3BJrWSl
 CNawpbDtYjiGbnIzXXQG7tVQdlF8t7faFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGjoctOepd8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyzvBha
 czDKJf3VCty5UFbIN2eGY8gPUIDnHhilQs/u7iip/hY7VZuTCHMEupUWLd/Rus48LmFsG3oz
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6CPmux7K9Q8xcy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:M/alAaP/gPzYZMBcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208";a="104683464"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] CI: Minor updates to buster-gcc-ibt
Date: Fri, 24 Mar 2023 20:06:58 +0000
Message-ID: <20230324200658.3245418-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

 * Update from GCC 11.2 to 11.3
 * Use python3-minimal instead of python
 * Use --no-install-recommends, requiring ca-certificates, g++-multilib and
   build-essential to be listed explicitly

The resulting container is ~50M smaller

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
---
 automation/build/debian/buster-gcc-ibt.dockerfile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/automation/build/debian/buster-gcc-ibt.dockerfile b/automation/build/debian/buster-gcc-ibt.dockerfile
index 441d9a9ab37a..96ab4fe8a2f1 100644
--- a/automation/build/debian/buster-gcc-ibt.dockerfile
+++ b/automation/build/debian/buster-gcc-ibt.dockerfile
@@ -4,10 +4,12 @@ ENV DEBIAN_FRONTEND=noninteractive
 ENV USER root
 
 RUN apt-get update && \
-    apt-get --quiet --yes install \
+    apt-get --quiet --yes --no-install-recommends install \
         bison \
         build-essential \
+        ca-certificates \
         flex \
+        g++-multilib \
         libc6-dev-i386 \
         libgmp-dev \
         libisl-dev \
@@ -19,7 +21,7 @@ RUN apt-get update && \
 RUN mkdir /build
 WORKDIR /build
 
-RUN wget -q https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz -O - | tar xJ --strip=1
+RUN wget -q https://ftp.gnu.org/gnu/gcc/gcc-11.3.0/gcc-11.3.0.tar.xz -O - | tar xJ --strip=1
 RUN wget -q https://xenbits.xen.org/people/andrewcoop/gcc-11.2-Add-fcf-check-attribute-yes-no.patch -O - | patch -p1
 RUN ./configure \
         --prefix=/opt/gcc-11-ibt \
@@ -53,13 +55,14 @@ RUN mkdir /build
 WORKDIR /build
 
 RUN apt-get update && \
-    apt-get --quiet --yes install \
+    apt-get --quiet --yes --no-install-recommends install \
         bison \
+        build-essential \
         checkpolicy \
         flex \
         gawk \
         make \
-        python3 \
+        python3-minimal \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
-- 
2.30.2


