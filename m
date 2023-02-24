Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4465D6A207C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 18:29:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501343.773048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbsx-0000fk-PN; Fri, 24 Feb 2023 17:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501343.773048; Fri, 24 Feb 2023 17:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbsx-0000cJ-M0; Fri, 24 Feb 2023 17:29:31 +0000
Received: by outflank-mailman (input) for mailman id 501343;
 Fri, 24 Feb 2023 17:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+11/=6U=citrix.com=prvs=4121c3e27=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pVbsw-0008WD-IK
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 17:29:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca4721db-b468-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 18:29:29 +0100 (CET)
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
X-Inumbo-ID: ca4721db-b468-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677259769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vL1+kixkoAxqRCdE4M2Z2BxIpHTnvKCzyD7h58x79y8=;
  b=Ep+ljSti8Mf9h+4aAjrV9jqFiH1r7V7cdbvW+9G3fRphFhqCLL7bfB5C
   D9AXeNFDHK/8qD6YWMvUlu2kS0i1U+URpqdScXiWiezpWkuwWkHtRsx/P
   SZjWvageT+Se3XHdmbl/UTk7/guP6WKPXGrzK41Sl24MwDNY4XGhlfJEW
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98447619
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:b8167KKB5VLYO1kfFE+R8pUlxSXFcZb7ZxGr2PjKsXjdYENSg2ECm
 mIYWD2CaK6OZTPzc91/Ptm19UkOu5fRyNRlG1FlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AZiPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5OMH9Ty
 78EJAwgcwibt+a84JCcCctj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbFZkJwRjB9
 woq+UzhCB86C/6i5gC71VPzntPpgyrLcaA7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxastRcGV91dO+Yz8g2Kx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHjVGOYSvDrPHO92r0YHVLazZYPkfoUDfp/fHakZ8usFHTQupODbatvtn/ORPXg
 BKF+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKVBaJtsldzBO
 hW7VeZtCHh7bROXgVdfOd7ZNijQ8YDuFM7+StffZcdUb556eWevpX8xOhfPgDqyzRl8wMnT3
 Kt3lu72UB4n5VlPlmLqF4/xL5d2rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRtcu5TPHu2
 48HbaOikkwPONASlwGLqeY7N04RF3EnCPje8ooPHgJ1ClY8ST5J5j646e9JRrGJaIwJybuTo
 ynlBxYwJZiWrSSvFDhmo0tLMNvHNauTZ1phVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:jRoZzKme+6NaJg1U6sX0NZsprLjpDfKX3DAbv31ZSRFFG/FwWf
 rOoB19726TtN9xYgBGpTnkAsO9qBznmKKdjbN8AV7mZniEhINHRLsSkbcKgAeQZhEXz4ZmpN
 hdmtFFeaPN5DpB7foSkTPId+rIm+P3iZxA7N22pxxQpENRGsNdBmFCZTpzeXcGITWua6BWKH
 O03Ls3mxOQPVoWc+WmDT0/U+DYodqjruOdXTc2QzAm9SiThneS5LT7ChiV2Qp2aUI1/Z4StU
 bEji3k7eGZv/u60x/R0HKWx5lag9f60LJ4dbyxo/lQBDXwqxqiIL5sXLCPp1kO0ZmS1Go=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98447619"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v3 4/4] automation: Remove non-debug x86_32 build jobs
Date: Fri, 24 Feb 2023 17:29:15 +0000
Message-ID: <20230224172915.39675-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224172915.39675-1-anthony.perard@citrix.com>
References: <20230224172915.39675-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In the interest of having less jobs, we remove the x86_32 build jobs
that do release build. Debug build is very likely to be enough to find
32bit build issues.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v3:
    - new patch
    
    Proposed here:
        https://lore.kernel.org/r/7ec61260-0fec-25e2-6fa7-ec1d86e8067d@citrix.com

 automation/gitlab-ci/build.yaml | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 2be1b05d5c..a2891c5937 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -251,21 +251,11 @@ debian-stretch-gcc-debug:
   variables:
     CONTAINER: debian:stretch
 
-debian-stretch-32-clang:
-  extends: .clang-x86-32-build
-  variables:
-    CONTAINER: debian:stretch-i386
-
 debian-stretch-32-clang-debug:
   extends: .clang-x86-32-build-debug
   variables:
     CONTAINER: debian:stretch-i386
 
-debian-stretch-32-gcc:
-  extends: .gcc-x86-32-build
-  variables:
-    CONTAINER: debian:stretch-i386
-
 debian-stretch-32-gcc-debug:
   extends: .gcc-x86-32-build-debug
   variables:
@@ -311,21 +301,11 @@ debian-unstable-gcc-debug-randconfig:
     CONTAINER: debian:unstable
     RANDCONFIG: y
 
-debian-unstable-32-clang:
-  extends: .clang-x86-32-build
-  variables:
-    CONTAINER: debian:unstable-i386
-
 debian-unstable-32-clang-debug:
   extends: .clang-x86-32-build-debug
   variables:
     CONTAINER: debian:unstable-i386
 
-debian-unstable-32-gcc:
-  extends: .gcc-x86-32-build
-  variables:
-    CONTAINER: debian:unstable-i386
-
 debian-unstable-32-gcc-debug:
   extends: .gcc-x86-32-build-debug
   variables:
-- 
Anthony PERARD


