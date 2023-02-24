Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCAB6A2079
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 18:29:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501342.773039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbsu-0000NG-HK; Fri, 24 Feb 2023 17:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501342.773039; Fri, 24 Feb 2023 17:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbsu-0000Kx-DJ; Fri, 24 Feb 2023 17:29:28 +0000
Received: by outflank-mailman (input) for mailman id 501342;
 Fri, 24 Feb 2023 17:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+11/=6U=citrix.com=prvs=4121c3e27=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pVbss-0008WD-RP
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 17:29:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7b10a3a-b468-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 18:29:25 +0100 (CET)
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
X-Inumbo-ID: c7b10a3a-b468-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677259765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zjChtf1zSIMhYiy5u8WzrbNRWG5mnbhddn5BxMoTNO4=;
  b=BABzUmCMWJsczGGGGxlc9SUMkl2QDKukHb9f8rxllRB+703NrlHqOMQ+
   ORhMyV8fH8j1Rt/mVQOVI+1Ihi/L6eSRfrRpnssqyMamdMDpdkLCO8Dsy
   prkCHeR73dKGktaqfqZu+fF5YT+Ey8m6TPVGlmymxvbc+1eQtHWrjItEx
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98853267
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:/UAwdKM706krZw7vrR29l8FynXyQoLVcMsEvi/4bfWQNrUoihWQOy
 mMWXjyFMv2CYWT1L4tyaISzpBgE65/XztRiHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5ABmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sxsX2MS1
 sRCExIUMBmB2+buyqCWb+Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3aFZgOxBjHz
 o7A13T/XkkZZcWi8mGAqlCOj7HvgAO8Zo1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaPtwQQXNd4GOQg5AaAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRSXKa9ECzHsO3O9HXrZHZTdDVZDcMZcecby/P4/oNvrSqVdfR6Tqe30tmtEyPd5
 j/f+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlgnPdD4PuRE/XCetK8dd9jBEjFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm8zb67omhezO
 ic/XD+9A7cCVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOgD+0zxd2zvxua
 cbznSOQ4ZEyU/kP8dZLb71Fje9DKt4WmAs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6OOneh8I9Q4xsy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:MaOqz653dHIKE+YmgAPXwdeCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTP+ftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdk0NDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zutsDGj5XvZD8BHloC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69B7icbs0dxKAe2Lk4wwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsPuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59cs5Ufa/peVFZil/1dwKpnKuZDIMs80vFjLA
 BaNrCd2B+RSyLfU5mWhBgp/DXmZAVPIv7PeDl/hiXS6UkboJkx9Tpm+OUP2ngH754zUJ9C+q
 DNNblpjqhHSosMYbt6H/ppe7rBNoXhe2O4DIupGyWSKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFFdVr3Q7dU7iAdCHmMQjyGGFfEytGTD2js1O7ZlwvbPxALLtLC2YUVgr18+tue8WDMHXU+
 u6fJhWH/jgJ23zHpsh5XyJZ7BCbX0FFMEFsNcyXFyD5srNN43xr+TeNO3eIbL8eAxUKF8Xwk
 FzLwQbCP8wnnxDAEWI/iQ5c0mdC3DCwQ==
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98853267"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v3 2/4] automation: Remove testing on Debian Jessie
Date: Fri, 24 Feb 2023 17:29:13 +0000
Message-ID: <20230224172915.39675-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224172915.39675-1-anthony.perard@citrix.com>
References: <20230224172915.39675-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Jessie as rearch EOL in 2020.

Even if we update the containers, we would still not be able to reach
HTTPS webside with Let's Encrypt certificates and thus would need more
change to the container.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    While we remove some x86_32 testing, there's still
    debian-stretch-32-* and debian-unstable-32-*.

 automation/gitlab-ci/build.yaml | 40 ---------------------------------
 1 file changed, 40 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 22ce1c45e7..2be1b05d5c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -221,46 +221,6 @@ centos-7-gcc-debug:
   variables:
     CONTAINER: centos:7
 
-debian-jessie-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: debian:jessie
-
-debian-jessie-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: debian:jessie
-
-debian-jessie-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:jessie
-
-debian-jessie-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: debian:jessie
-
-debian-jessie-32-clang:
-  extends: .clang-x86-32-build
-  variables:
-    CONTAINER: debian:jessie-i386
-
-debian-jessie-32-clang-debug:
-  extends: .clang-x86-32-build-debug
-  variables:
-    CONTAINER: debian:jessie-i386
-
-debian-jessie-32-gcc:
-  extends: .gcc-x86-32-build
-  variables:
-    CONTAINER: debian:jessie-i386
-
-debian-jessie-32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
-  variables:
-    CONTAINER: debian:jessie-i386
-
 debian-stretch-clang:
   extends: .clang-x86-64-build
   variables:
-- 
Anthony PERARD


