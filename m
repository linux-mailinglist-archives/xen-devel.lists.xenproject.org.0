Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA301AA968
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:10:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOikS-0000DL-6x; Wed, 15 Apr 2020 14:10:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fIs=57=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOikP-0000Ch-W5
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:10:38 +0000
X-Inumbo-ID: e0be7daa-7f22-11ea-8a58-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0be7daa-7f22-11ea-8a58-12813bfff9fa;
 Wed, 15 Apr 2020 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586959836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0E+K3lFSiHcbDUF4mBJQMunGkHuYRvoLndX2Kqbkwvk=;
 b=St6qT2gp1GYjcx/LcluA+//L+XtoizGsjpV7bYW9I29KYTB96MEDMzCY
 yGf3RLiocO4Xe0H6nJ9X2S30u1T64Gyso1L25Nu9fuPjTrpsRJLsx0kxG
 5ahRaBuZ8MaW3OpEVVLQztspXQF3z+QemhTuJ4S44BOfqj0XOZNIOnzze M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: x3ypCWGmt2rRapt6wQ4shjlF4lc2DjEAxQ/Msb1KnsxKGyysirgQ23ZQd+cYiFq4oN6NTW9Mql
 GoquxqmpfL6rqrVypOPR7onrDAU0zTU9VBa9K2//jVCvD+DaDgwCushe1bYRBmklSpfmLF6SAd
 xfGfKSlr3k8nbfCML1Ee9W64xuw1B7a/+ZZz15OiAYOuKc2y1ZTJCDtYNd5mUDzQOztTmU/Wh7
 UanDKu9PsJ1uf0iGNlOUBMIn65Anz2mgVdOMDqSPJwbKTWxsGlcXRqawnOnp/CKmQTffqlpw9u
 8ic=
X-SBRS: 2.7
X-MesageID: 16120055
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,387,1580792400"; d="scan'208";a="16120055"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH OSSTEST v3 2/2] make-flight: add a core scheduling job
Date: Wed, 15 Apr 2020 16:10:09 +0200
Message-ID: <20200415141009.10912-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415141009.10912-1-roger.pau@citrix.com>
References: <20200415141009.10912-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

Run a simple core scheduling tests on a host that has SMT support.
This is only enabled for Xen >= 4.13.

The runvar difference is:

+test-amd64-coresched-amd64-xl all_host_di_version 2020-02-10
+test-amd64-coresched-i386-xl  all_host_di_version 2020-02-10
+test-amd64-coresched-amd64-xl all_host_suite      stretch
+test-amd64-coresched-i386-xl  all_host_suite      stretch
+test-amd64-coresched-amd64-xl all_hostflags       arch-amd64,arch-xen-amd64,suite-stretch,purpose-test,smt
+test-amd64-coresched-i386-xl  all_hostflags       arch-i386,arch-xen-amd64,suite-stretch,purpose-test,smt
+test-amd64-coresched-amd64-xl arch                amd64
+test-amd64-coresched-i386-xl  arch                i386
+test-amd64-coresched-amd64-xl buildjob            build-amd64
+test-amd64-coresched-i386-xl  buildjob            build-i386
+test-amd64-coresched-amd64-xl debian_arch         amd64
+test-amd64-coresched-i386-xl  debian_arch         i386
+test-amd64-coresched-amd64-xl debian_kernkind     pvops
+test-amd64-coresched-i386-xl  debian_kernkind     pvops
+test-amd64-coresched-amd64-xl debian_suite        stretch
+test-amd64-coresched-i386-xl  debian_suite        stretch
+test-amd64-coresched-amd64-xl kernbuildjob        build-amd64-pvops
+test-amd64-coresched-i386-xl  kernbuildjob        build-i386-pvops
+test-amd64-coresched-amd64-xl kernkind            pvops
+test-amd64-coresched-i386-xl  kernkind            pvops
+test-amd64-coresched-amd64-xl toolstack           xl
+test-amd64-coresched-i386-xl  toolstack           xl
+test-amd64-coresched-amd64-xl xen_boot_append     sched-gran=core
+test-amd64-coresched-i386-xl  xen_boot_append     sched-gran=core
+test-amd64-coresched-amd64-xl xenbuildjob         build-amd64
+test-amd64-coresched-i386-xl  xenbuildjob         build-amd64

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use hw-smt instead of smt as hostflag.
---
 make-flight | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/make-flight b/make-flight
index 2f445d95..a361bcb1 100755
--- a/make-flight
+++ b/make-flight
@@ -763,6 +763,17 @@ test_matrix_do_one () {
   *)                test_dom0pvh=n ;;
   esac
 
+  # core scheduling tests for versions >= 4.13 only
+  case "$xenbranch" in
+  xen-3.*-testing)  test_coresched=n ;;
+  xen-4.?-testing)  test_coresched=n ;;
+  xen-4.10-testing) test_coresched=n ;;
+  xen-4.11-testing) test_coresched=n ;;
+  xen-4.12-testing) test_coresched=n ;;
+  *)                test_coresched=y ;;
+  esac
+
+
   # xend PV guest test on x86 only
   if [ x$test_xend = xy -a \( $dom0arch = "i386" -o $dom0arch = "amd64" \) ]; then
     job_create_test test-$xenarch$kern-$dom0arch-pv test-debian xend \
@@ -894,6 +905,15 @@ test_matrix_do_one () {
 
   fi
 
+  # Core-scheduling tests are x86 only
+  if [ x$test_coresched = xy -a $xenarch = amd64 ]; then
+    job_create_test test-$xenarch$kern-coresched-$dom0arch-xl \
+                    test-debian xl $xenarch $dom0arch $debian_runvars \
+                    all_hostflags=$most_hostflags,hw-smt \
+                    xen_boot_append='sched-gran=core'
+
+  fi
+
   #do_passthrough_tests
 
   do_pygrub_tests
-- 
2.26.0


