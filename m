Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE657CAE2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 14:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372692.604593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVZI-0000eY-Vi; Thu, 21 Jul 2022 12:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372692.604593; Thu, 21 Jul 2022 12:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVZI-0000cN-Sj; Thu, 21 Jul 2022 12:46:16 +0000
Received: by outflank-mailman (input) for mailman id 372692;
 Thu, 21 Jul 2022 12:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6kJ=X2=citrix.com=prvs=194f9e755=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oEVZG-0008VQ-Ts
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 12:46:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19ab8c06-08f3-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 14:46:13 +0200 (CEST)
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
X-Inumbo-ID: 19ab8c06-08f3-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658407573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HAlpDIChBskJIISW7qvJGVshVai7WZqyDUdysqvHuck=;
  b=MpjzucklPChO7QxXd/zk7reCDchzzC448k2o2Hs+AApsDzX71dMxokAt
   Jo52iwa+NQLi0Kr2uhgO9qh6155q/9bzMljITbnnTHBE7VrQg/S1CosIW
   PRHXBwBABuSV/brA3boRJQ+hMNC95Q2qBBmzloIrMT24gW8nz1sktrTEG
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76317781
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AfAblU64YbhhkzbLN3BdB1wxR2vbMJYAXvycv2?=
 =?us-ascii?q?9bIaENr3hjvzP4J6zDmcekdWPrztNzMcNnPa4wPmlJv28rgB4V/YzDj45YBn?=
 =?us-ascii?q?oOIehmiOdS4m1JWvl0QTppBfgQHDvWpMe/+9kbRsIQ8+YpucBSt17uEG9ZvD?=
 =?us-ascii?q?fCwbx9gmzDTinl1BbEx9wiViOdJZqX+8z5UTDW2jj3khVj/5fuhK441iX77D?=
 =?us-ascii?q?itHHmNyQBbiMwJAS3wcQ98JIokfWyDR9F10mcJ+Y7NCDXDhjUJnNrTGknQ9q?=
 =?us-ascii?q?MWajTdf2ui02dBsxgL8DZcXf7iAxSmdqbrYe4GiQPhqEMiOd5k/4OMHiean+?=
 =?us-ascii?q?wTGHA9vNDfss+kcJqxEncjCqkT7zl2cDR2I+RxpKb2HbFjzm6ssSlvNWyyt/?=
 =?us-ascii?q?cBpH71KBvRMIzUMFIPp1g1+WDJVujT6VhO9OSJ+Wz9hQLX5Dtj0uzzniOGBV?=
 =?us-ascii?q?+ONYvz/V676WN21YMFUTbaeHwVwhGpdA6+KauZF2xtdB/YZiO9f2PB7P9jh2?=
 =?us-ascii?q?JWoiKYh+G13BtizrMQAdqaNL+yj6LJlb8qhdjxbQT9LrNsSTxLGQ6miivWDI?=
 =?us-ascii?q?/LxJtdo7LQgrA1iKfYEdXfuq3vFM/jT4wrIfJ+U16RKbkvfFF3SPoMGe4jqO?=
 =?us-ascii?q?563V2px2L1AzPWhlutgkrBC4Z7inJiIMjzbyANmY5wD3K+27VmsuOJ245VT8?=
 =?us-ascii?q?vbWxa5aInRrNpC/wWBQbUn+AiZI8556VV06oOabezFT8uxS9WbUVgfEgJw1m?=
 =?us-ascii?q?ahcLxaAzgTMRDayv0hz8XtW3uHfiy6O3GiUyc0ykUUlwjVcpg45zCorpBvEo?=
 =?us-ascii?q?MiIg4znvKWpclYbALW8MTVNUEHh9mQvKnRxlaZnjj0yMySbfKTE0spewzneW?=
 =?us-ascii?q?kieusoKD44eseNRStUo+lPcbgtoF1L+MVccZGIIkoljiVzbi1aAcFXMp343L?=
 =?us-ascii?q?vkxGSEwmJ+03+eirGNnjYYHfsaSzo0UojK6dOpmJEv7QP5r5g6JoySFQdB/S?=
 =?us-ascii?q?wCgBDufGrKtcrO4rmzvfG6teB+0swZmR7GDE8WfUrk1amIXu6aw36cCuJ8zE?=
 =?us-ascii?q?1GzEkbhS2gBVoPQ2SNYonk3LE4+2IYHMFJgN4Ii6T/jmbukAnQp94XvOIYGQ?=
 =?us-ascii?q?rf344R2lXHvnBH2zwWvK1tDOvLJuTrRO6VI8IjYstoZszv4TY2luziRAmddY?=
 =?us-ascii?q?XzWtB3/LfxItsHFGP1hE+ZWc0pDEslW08PRbwIN8tTog6O10zGGQ+mRu2JIo?=
 =?us-ascii?q?ptmIkmxS+YJhkpC8KAbP4Vo0Z0ZWRhjWBeJuL5o8INBeMVTyvOkfqivAlC8f?=
 =?us-ascii?q?FqqqgWod2O+71KLSLQPAXzcmUv1GJzKTnrgsyF4NfBJo3HXvUhtA76Krm5PY?=
 =?us-ascii?q?hJjMQVe1stqBtMcDv+OZyNxW7yzrk7paeWjhBsG2E2xZ1BeRJ8zzG3Cxg5nn?=
 =?us-ascii?q?BLncmWy3xL3HgbsfK+tScRPfBac0Pbg92DqeQHmcCdYvQtfpvPBl5CZYcwcH?=
 =?us-ascii?q?3b3ACzgb1bm2nhxhVAC+eZdhflSqSVbbsViqG3ExZdoZqXXo55nfGBEl9azB?=
 =?us-ascii?q?8L4ZB/4iRiKqfCLnifMStHnePW559ShnR+9FGXIFv5RvvbbnRY8oHaA2+hxh?=
 =?us-ascii?q?E/wNV6OcRl9IJSIGx8rcWFETbCotgEzz09RrzRPMeFk+29va6Cct9iNPWnHC?=
 =?us-ascii?q?uj16m4SY/MhrJYFw0pvglEdKluiEWOXnJ9uwiLem3M7V924Dk/l9/pkY/16M?=
 =?us-ascii?q?J4+FS2aOnDMu6cYckbTT/Rvs9DGT24epLhWrsR23TXRtqiLkLURsWbOQeNLU?=
 =?us-ascii?q?i2/QQISxf2YwbXYrFcqSEiBTpls4IpzudjFQTdbSW1cmwGTtQOhZmbWjQE0x?=
 =?us-ascii?q?qrt0o/+1zOHkWrZOj7cU1di3WYULSmnZGSaMi1lPlCroaNfutr3L3F2ai7G4?=
 =?us-ascii?q?qj6TqFqByfAX8w63+i3Yfo8LygVHlh7Xlx56qfXYEDJbq0w0azFAvxzd6G58?=
 =?us-ascii?q?UsTJh4Q0pJMpdlgGaKcduqvQe85Qi/OhTq4TWFaJR3EpxJOu8iZL1qozqhvY?=
 =?us-ascii?q?au2xeEisYsy+84j1ugSr2X2HYLKuQbboQT5AGyD0KZBIknximlxC/GZrIj7+?=
 =?us-ascii?q?QHUfJDRkddUoyCd73v5+aXlaFfw4ytdhNI/QabIaGenW1pACZRJm8yAO7Yue?=
 =?us-ascii?q?IHdMuZ8nqqw8AgSSiDmDMo6LZSUXiVvZwKArVyzOsmvPtIxEt9WWAg76b5x/?=
 =?us-ascii?q?ZJBdOqjtWBCcUxuHVb2J3YCOuIdzEyQIOrCQHm/Qdnhda3Lzik+pHG0w1rEW?=
 =?us-ascii?q?SNIDOZatqypi+crX0wV38tySXtL9sU9p6HOdzT5Cx+wU7ZaWRtGXO+Jtu8yE?=
 =?us-ascii?q?ee+OOsZKuIdQla2QPpC8D4yee53GwpuZnUuO3XljuCQE76Gmk93Koq4WdnXh?=
 =?us-ascii?q?E02TvRz/MFvT+5DWlHGA04teEj52fq3mPu4V9JQZBOpJnVb0AXK+qID392fz?=
 =?us-ascii?q?kCNR3mWnajiEsnD+//82/fmxHP9W0kKF4dnZyjM6L8emVX1EcdnJ7OxuGB26?=
 =?us-ascii?q?0dID5v5QdaHBUIo6RO4xC7Tk+XSSdqMV9utDptCL5xMEQUgABHHtei4Miwdp?=
 =?us-ascii?q?9thTvxaxEXNDcXJITDwYGVyrxOj/hifehm2cYPA37h8yE23LcNMX5HuBbZGd?=
 =?us-ascii?q?+cxDTHbvUMQjeDw6wXCqTZ/NPcyU7VSVxldUvDKcenLPEsdQ3vfBNdoqEAXQ?=
 =?us-ascii?q?tX5mzBjWX/8mWUlQe0syOM9p/My8U+WxX6Ox/NzOVmgu547EiOfwNI3ue8Is?=
 =?us-ascii?q?sx28tyPp0p4NXpxm2bGUDpk1HlRpw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.92,289,1650945600"; 
   d="scan'208";a="76317781"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <andrew.cooper3@citrix.com>, <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH v2 2/4] automation: add a templates for test jobs
Date: Thu, 21 Jul 2022 13:46:00 +0100
Message-ID: <20220721124602.9910-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220721124602.9910-1-anthony.perard@citrix.com>
References: <20220721124602.9910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Allow to set common configuration from a single place for all tests
jobs.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - rebased, to include "qemu-smoke-arm32-gcc".

 automation/gitlab-ci/test.yaml | 81 ++++++++--------------------------
 1 file changed, 18 insertions(+), 63 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 42cd725a12..53b43801f4 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -1,7 +1,15 @@
-# Test jobs
-build-each-commit-gcc:
+.test-jobs-common:
   stage: test
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  except:
+    - master
+    - smoke
+    - /^coverity-tested\/.*/
+    - /^stable-.*/
+
+# Test jobs
+build-each-commit-gcc:
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
     XEN_TARGET_ARCH: x86_64
@@ -16,15 +24,9 @@ build-each-commit-gcc:
   dependencies: []
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-alpine-arm64-gcc:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
@@ -41,15 +43,9 @@ qemu-alpine-arm64-gcc:
     when: always
   tags:
     - arm64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-alpine-x86_64-gcc:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
   script:
@@ -65,15 +61,9 @@ qemu-alpine-x86_64-gcc:
     when: always
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-arm64-gcc:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
@@ -89,15 +79,9 @@ qemu-smoke-arm64-gcc:
     when: always
   tags:
     - arm64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-arm32-gcc:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
@@ -112,15 +96,9 @@ qemu-smoke-arm32-gcc:
     when: always
   tags:
     - arm64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-x86-64-gcc:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
   script:
@@ -134,15 +112,9 @@ qemu-smoke-x86-64-gcc:
     - debian-stretch-gcc-debug
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-x86-64-clang:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
   script:
@@ -156,15 +128,9 @@ qemu-smoke-x86-64-clang:
     - debian-unstable-clang-debug
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-x86-64-gcc-pvh:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
   script:
@@ -178,15 +144,9 @@ qemu-smoke-x86-64-gcc-pvh:
     - debian-stretch-gcc-debug
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-x86-64-clang-pvh:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
   script:
@@ -200,8 +160,3 @@ qemu-smoke-x86-64-clang-pvh:
     - debian-unstable-clang-debug
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
-- 
Anthony PERARD


