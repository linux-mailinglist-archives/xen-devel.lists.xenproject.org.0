Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E51E5D23
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 12:27:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeFkh-0000yC-EO; Thu, 28 May 2020 10:27:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNTM=7K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jeFkg-0000xw-0o
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 10:27:06 +0000
X-Inumbo-ID: c4a47ddc-a0cd-11ea-81bc-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4a47ddc-a0cd-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 10:27:02 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fQkIDVo0sLcVE7teoc9gsdNSHk0LZJYVkmGtBwTinVq4F+B1CnCB+KP2sR8tc1D9HVFfThXuOW
 hmHAiu7yrL7aRKo2Va/oFZ3J3jNq/w25Ay1Y4M6GwzYvOKcu/NNhtg1NI6ngAWUKR8QbmHb9Su
 VWtmXg75HJpYYzhOICrTfT7Nsffj2TqsECzh9Xzc6QmpgmL/tk8ejiQD3HJK2lWZx86ClGWqU2
 PTcZxTFdLCp8nBJQkeJ+7489ZXReTHarvqc53v2WlQNNdTbrlPkS72BePS50YqLzb0qX/N4r2m
 k6o=
X-SBRS: 2.7
X-MesageID: 18936375
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,444,1583211600"; d="scan'208";a="18936375"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 1/2] freebsd10: refactor code to generate jobs
Date: Thu, 28 May 2020 12:26:47 +0200
Message-ID: <20200528102648.8724-2-roger.pau@citrix.com>
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

Slightly adjust the code to generate the freebsd10 jobs in order to
avoid exiting early from the function if the dom0 arch is different
than i386. No functional change expected, the freebsd10 jobs are still
limited to run on an i386 dom0. No runvar diff created as part of this
change.

This is a preparatory change for adding new FreeBSD 11 and 12 jobs
that will instead use an amd64 dom0.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 make-flight | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/make-flight b/make-flight
index a361bcb1..af74bb4e 100755
--- a/make-flight
+++ b/make-flight
@@ -230,19 +230,18 @@ test_matrix_branch_filter_callback () {
 
 do_freebsd_tests () {
 
-  if [ $xenarch != amd64 -o $dom0arch != i386 -o "$kern" != "" ]; then
+  if [ $xenarch != amd64 -o "$kern" != "" ]; then
     return
   fi
 
-  for freebsdarch in amd64 i386; do
-
- job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd10-$freebsdarch \
-                        test-freebsd xl $xenarch $dom0arch \
-                        freebsd_arch=$freebsdarch \
+  if [ $dom0arch == i386 ]; then
+    for freebsdarch in amd64 i386; do
+      job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd10-$freebsdarch \
+                      test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
  freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-10.1-CUSTOM-}$freebsdarch${FREEBSD_IMAGE_SUFFIX--20150525.raw.xz} \
-                        all_hostflags=$most_hostflags,freebsd-10
-
-  done
+                      all_hostflags=$most_hostflags,freebsd-10
+    done
+  fi
 }
 
 do_hvm_winxp_tests () {
-- 
2.26.2


