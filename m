Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85736A8827
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 18:54:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505302.778049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7r-0001Tq-VB; Thu, 02 Mar 2023 17:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505302.778049; Thu, 02 Mar 2023 17:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7r-0001KV-LB; Thu, 02 Mar 2023 17:53:55 +0000
Received: by outflank-mailman (input) for mailman id 505302;
 Thu, 02 Mar 2023 17:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPDg=62=citrix.com=prvs=418368d91=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pXn7p-00086v-JC
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 17:53:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30dc18d8-b923-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 18:53:51 +0100 (CET)
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
X-Inumbo-ID: 30dc18d8-b923-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677779631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=41sghBoO8iiYFjw7w2/Kh+k/zWU5vL4WETIJdv/Xr+s=;
  b=Q/6Q8A6j9h2/xtFXQduEIXd13SZ1BFAQTHioesI4RblOOCjmr4Hc/DYh
   ElnwAuOhn1N3wCZoH057wjqVXhl1l94boKVJ//nY67b77cdxKhpXRZcJM
   tBCRUqd43u3G4GdCd4pPcOJz5jzgcTZa/7wRpTD7vJhwTSsCcvvmDjB6l
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101652784
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:iLOzna/X/pGLjus+D6a7DrUDmn6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2ZLDz3QPvjZN2Wgc9wkat6x9RgCv5OExtBmQQc4+Sk8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqgR5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklI6
 vpbCigKUSvAlue/34qCZexqgtYseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Mxh/G+
 ziZrziR7hcyNO7H0BymzXOXpczkww7GZt5OEKOf+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9FZCeE95SmGw7DY5AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8biA3JDfR7F5GOzczwEC7I+
 h+PqiwsiOBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW0C
 KMwkVkLjHO2AJdNRf4fXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZzzv9uZ
 MfDKJ/wXB727JiLKxLsGo8gPUIDnHhilQs/u7igp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bqO3J+FkeLSmOEH/qNdDRW3m2FBnXfgaXeQLLL/cSuencUl9Y8LsLUQJINc5xP8MzrmRr
 xlQmCZwkTLCuJEOEi3SAlgLVV8ldc8XQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:+qKd+KEYYTsD4xFtpLqEPseALOsnbusQ8zAXPiFKOHhom6mj+q
 yTdZsguyMc5AxxZJhYo6HmBEDYewK7yXcX2/h1AV7BZmbbUQKTRekJ0WKF+V3d8kXFndK1vp
 0QEZSWZueAbmSTWa7BkXGF+8lJ+qj4zEi47d2utkuEU2lRGtpdBg1Ce3mm+hAffng9OXIgfK
 Dsm/auvFKbCAgqUvg=
X-IronPort-AV: E=Sophos;i="5.98,228,1673931600"; 
   d="scan'208";a="101652784"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 7/7] automation: Add some more push containers jobs
Date: Thu, 2 Mar 2023 17:53:32 +0000
Message-ID: <20230302175332.56052-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230302175332.56052-1-anthony.perard@citrix.com>
References: <20230302175332.56052-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    WARNING: This is an incomplete list of jobs needed to push.

 automation/gitlab-ci/push-containers.yaml | 49 +++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/automation/gitlab-ci/push-containers.yaml b/automation/gitlab-ci/push-containers.yaml
index d7e7e2b9e2..3785e29250 100644
--- a/automation/gitlab-ci/push-containers.yaml
+++ b/automation/gitlab-ci/push-containers.yaml
@@ -18,6 +18,33 @@
   after_script:
     - docker logout
 
+push-archlinux-current-container:
+  variables:
+    BUILD_CONTAINER: archlinux/current
+  extends:
+    - .push-container-build-tmpl
+  needs:
+    - test-archlinux-gcc
+    - test-archlinux-gcc-debug
+
+push-debian-stretch-32-container:
+  variables:
+    BUILD_CONTAINER: debian/stretch-i386
+  extends:
+    - .push-container-build-tmpl
+  needs:
+    - test-debian-stretch-32-clang-debug
+    - test-debian-stretch-32-gcc-debug
+
+push-debian-unstable-32-container:
+  variables:
+    BUILD_CONTAINER: debian/unstable-i386
+  extends:
+    - .push-container-build-tmpl
+  needs:
+    - test-debian-unstable-32-clang-debug
+    - test-debian-unstable-32-gcc-debug
+
 push-ubuntu-xenial-container:
   variables:
     BUILD_CONTAINER: ubuntu/xenial
@@ -28,3 +55,25 @@ push-ubuntu-xenial-container:
     - test-ubuntu-xenial-clang-debug
     - test-ubuntu-xenial-gcc
     - test-ubuntu-xenial-gcc-debug
+
+push-ubuntu-bionic-container:
+  variables:
+    BUILD_CONTAINER: ubuntu/bionic
+  extends:
+    - .push-container-build-tmpl
+  needs:
+    - test-ubuntu-bionic-clang
+    - test-ubuntu-bionic-clang-debug
+    - test-ubuntu-bionic-gcc
+    - test-ubuntu-bionic-gcc-debug
+
+push-ubuntu-focal-container:
+  variables:
+    BUILD_CONTAINER: ubuntu/focal
+  extends:
+    - .push-container-build-tmpl
+  needs:
+    - test-ubuntu-focal-gcc
+    - test-ubuntu-focal-gcc-debug
+    - test-ubuntu-focal-clang
+    - test-ubuntu-focal-clang-debug
-- 
Anthony PERARD


