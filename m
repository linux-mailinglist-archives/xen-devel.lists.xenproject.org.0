Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD1C69AA8F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 12:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497035.767971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSz2x-0007C1-5I; Fri, 17 Feb 2023 11:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497035.767971; Fri, 17 Feb 2023 11:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSz2x-00079Q-1a; Fri, 17 Feb 2023 11:36:59 +0000
Received: by outflank-mailman (input) for mailman id 497035;
 Fri, 17 Feb 2023 11:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZJw=6N=citrix.com=prvs=405a65846=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSz2v-00079K-Bk
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 11:36:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f3bf4cf-aeb7-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 12:36:53 +0100 (CET)
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
X-Inumbo-ID: 5f3bf4cf-aeb7-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676633813;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NwPIiULrKwhyaclK8T6rOCmB+y/Ja6tg00AxBjFjpWo=;
  b=Q4NgCdjH5cJJFG5AvaIUYtJxFD8AHLuPBgP+Yt7c3X7JyIsFx1F+wdrq
   cIgz+lGXOBXRNjxWdSvQq3aIfUuRY9+ezTl/AemkgkajuQT0bZRGI+lSo
   0sUKeDayztsVdTITdg8bYMWIRl3Bx99elJmzJ0CkGLYJj4LpkBxyV5s21
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97463005
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:HsdU5a1/KpYhETgfK/bD5fRxkn2cJEfYwER7XKvMYLTBsI5bpzNRm
 GcdWGDSP/qPZ2f9fNtzOo7i90IEsJDWy9FjHgJupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZnOqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAjkRz
 fEEFwA0NAmkm+if8r6pc+Nrv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFJoJwB3A/
 j+uE2LRAyhFM+ykzwq+2W+sn+DrnH+hZ7w0C+jtnhJtqALKnTFCYPEMbnO+oPK5g0r4XMhNJ
 kg88y8i66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bjUqQdtt/L56M1MTSBTvZ8
 TyYlSI5vuBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW1C
 KMwkVkLjHO2AJdNRfYuC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyzv9iZ
 s3HKZb3ViZy5UFbIN2eHbp17FPW7npmmTO7qW7TkXxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Li9vmra8WnOnO/2ddKfTg3wY0TWcieRzp/KrTSfWKL2QgJV5fs/F/WU9U8wf0Fx7+Yp
 SjVt40x4AOXuEAr4D6iMhhLAI4Dl74mxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:ZLduJa4JVvsqcShgrQPXwHPXdLJyesId70hD6qm+c20gTiX4rb
 HmoB1/726S+VAssR4b6KC90cW7MAHhHP1OkPQs1NWZLXjbUQKTRekSjvqBslnd8kvFh5FgPI
 hbAtZD4bbLfCtHZKjBkXyF+1hJ+rK6GHzBv5a6815dCSxndq1r8gFjKiveK1ZxTgVdH5Y1fa
 DskfautFGbE0j/rf7LfkXtndKz3uEjWKiWGyLvBXUchTVm2gnF1FcyKWnir2sju2sk+9gfGW
 +vqWLEDqPJiZCGIhu27Q/uxqUTld6k0MtGDMuQhsJQJDPrhAOlDb4RLYG/gA==
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208";a="97463005"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH] cirrus: Update FreeBSD to 13.1
Date: Fri, 17 Feb 2023 11:36:47 +0000
Message-ID: <20230217113647.776733-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Also print the compiler version before starting.  It's not easy to find
otherwise, and does change from time to time.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Michal Orzel <michal.orzel@amd.com>

Example run:

  https://cirrus-ci.com/task/6205638091472896

but that branch also contains the RFC fix for the Clang-IAS macro expansion
bug, which isn't in staging yet.
---
 .cirrus.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index c38333e73633..b133afb74057 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -10,6 +10,7 @@ freebsd_template: &FREEBSD_TEMPLATE
                                  libxml2 glib git
 
   build_script:
+    - cc --version
     - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
     - gmake -j`sysctl -n hw.ncpu` clang=y
 
@@ -22,7 +23,7 @@ task:
 task:
   name: 'FreeBSD 13'
   freebsd_instance:
-    image_family: freebsd-13-0
+    image_family: freebsd-13-1
   << : *FREEBSD_TEMPLATE
 
 task:
-- 
2.30.2


