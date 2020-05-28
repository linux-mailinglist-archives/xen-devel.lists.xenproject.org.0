Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54AE1E5D21
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 12:27:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeFkl-0000zF-Nc; Thu, 28 May 2020 10:27:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNTM=7K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jeFkl-0000z4-0Q
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 10:27:11 +0000
X-Inumbo-ID: c5a7a678-a0cd-11ea-81bc-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5a7a678-a0cd-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 10:27:03 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Ib42O0XlrVzhAxmWHsx9scWP7f3LZbKckKwtcVmGNUiPu4YcwZ3KLHX6UcvZyFaCI7y6zkrMSs
 K9X+fL1F7IuqBPMso2V6zhvkvjcqR1+4U8qxEPlecyqQZvqqG+RIwAxyv28hBVH4QesbfeFNMr
 vt7B4FvxDxOR+X3gNj46RZrCbAmKSzHaiBLnjWcI2nsHVwZNA4Zm4FI6Hi3lP14qjTjbEEx1BF
 42zAHYaHosPX3R0KdKTW1HwjIJ+XyjLi0ISQ9wJ4mdI/yjreW6vuHABECilNLLRlJYElBtvebJ
 V5M=
X-SBRS: 2.7
X-MesageID: 19379557
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,444,1583211600"; d="scan'208";a="19379557"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 2/2] freebsd: add FreeBSD 11 and 12 guest jobs
Date: Thu, 28 May 2020 12:26:48 +0200
Message-ID: <20200528102648.8724-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528102648.8724-1-roger.pau@citrix.com>
References: <20200528102648.8724-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Those are based on the upstream images and are run on an amd64 dom0.
The runvar difference is:

+test-amd64-amd64-qemuu-freebsd11-amd64 all_host_di_version 2020-02-10
+test-amd64-amd64-qemuu-freebsd12-amd64 all_host_di_version 2020-02-10
+test-amd64-amd64-qemuu-freebsd11-amd64 all_host_suite      stretch
+test-amd64-amd64-qemuu-freebsd12-amd64 all_host_suite      stretch
+test-amd64-amd64-qemuu-freebsd11-amd64 all_hostflags       arch-amd64,arch-xen-amd64,suite-stretch,purpose-test,freebsd-11
+test-amd64-amd64-qemuu-freebsd12-amd64 all_hostflags       arch-amd64,arch-xen-amd64,suite-stretch,purpose-test,freebsd-12
+test-amd64-amd64-qemuu-freebsd11-amd64 arch                amd64
+test-amd64-amd64-qemuu-freebsd12-amd64 arch                amd64
+test-amd64-amd64-qemuu-freebsd11-amd64 buildjob            build-amd64
+test-amd64-amd64-qemuu-freebsd12-amd64 buildjob            build-amd64
+test-amd64-amd64-qemuu-freebsd11-amd64 freebsd_arch        amd64
+test-amd64-amd64-qemuu-freebsd12-amd64 freebsd_arch        amd64
+test-amd64-amd64-qemuu-freebsd11-amd64 freebsd_image       FreeBSD-11.3-RELEASE-amd64.raw.xz
+test-amd64-amd64-qemuu-freebsd12-amd64 freebsd_image       FreeBSD-12.1-RELEASE-amd64.raw.xz
+test-amd64-amd64-qemuu-freebsd11-amd64 kernbuildjob        build-amd64-pvops
+test-amd64-amd64-qemuu-freebsd12-amd64 kernbuildjob        build-amd64-pvops
+test-amd64-amd64-qemuu-freebsd11-amd64 kernkind            pvops
+test-amd64-amd64-qemuu-freebsd12-amd64 kernkind            pvops
+test-amd64-amd64-qemuu-freebsd11-amd64 toolstack           xl
+test-amd64-amd64-qemuu-freebsd12-amd64 toolstack           xl
+test-amd64-amd64-qemuu-freebsd11-amd64 xenbuildjob         build-amd64
+test-amd64-amd64-qemuu-freebsd12-amd64 xenbuildjob         build-amd64

Note that only amd64 versions are tested at the moment, i386 had some
bugs that are being fixed so new releases can be tested.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note this requires adding the freebsd-{11,12} hostflags to amd64
hosts.
---
 make-flight | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/make-flight b/make-flight
index af74bb4e..48dc927c 100755
--- a/make-flight
+++ b/make-flight
@@ -241,7 +241,20 @@ do_freebsd_tests () {
  freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-10.1-CUSTOM-}$freebsdarch${FREEBSD_IMAGE_SUFFIX--20150525.raw.xz} \
                       all_hostflags=$most_hostflags,freebsd-10
     done
+    return
   fi
+
+  # NB: limit to amd64 ATM due to bugs with the i386 versions (11.3 and 12.1).
+  for freebsdarch in amd64; do
+    job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd11-$freebsdarch \
+                    test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
+ freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-11.3-RELEASE-}$freebsdarch${FREEBSD_IMAGE_SUFFIX-.raw.xz} \
+                    all_hostflags=$most_hostflags,freebsd-11
+    job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd12-$freebsdarch \
+                    test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
+ freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-12.1-RELEASE-}$freebsdarch${FREEBSD_IMAGE_SUFFIX-.raw.xz} \
+                    all_hostflags=$most_hostflags,freebsd-12
+  done
 }
 
 do_hvm_winxp_tests () {
-- 
2.26.2


