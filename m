Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACBA222715
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 17:34:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw5u5-0001ge-OY; Thu, 16 Jul 2020 15:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jw5u4-0001gZ-FY
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 15:34:32 +0000
X-Inumbo-ID: d76b004e-c779-11ea-94d5-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d76b004e-c779-11ea-94d5-12813bfff9fa;
 Thu, 16 Jul 2020 15:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594913671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yo0e+eVcoUNmo8qcJeqb09b3DNk81JPuxOK5U0VhGBg=;
 b=QMyYD831qjBj80/aCs15RKZUvxYzEmELjCtPh0zExgQL54T/qbG+OeL9
 CUJhRzCjuSg3dd7WDXqA5A63utcDfOUULkvl9RGP/4BrJJjxhPKkyI2AA
 EBoSBCM5L4AghwRUT5MOaOm85FcaJpyYUMxknF6D4HwZeWf06tyES8CTg 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: U4y800+yX2wnwbhFPL8jNTMeKK5ujNqT1UfVlHUL9mcul4XnKXAAjlPDQsyJYv66KCV/2IX4a9
 Z8BaDB1hkDXwGvcO3HhS0jImLBJB5EP4JnT4Y6FT9PwzPZArLLdlsWh1kxQ7OJm1D99B2C7Mu2
 U34LByF7ublHiX0+gtXfZgzAuWV4YXFMgNWJSJmuMb1Jp53Pd7ydLW60NwnJu51ykDDWY4KUDT
 MY7JmwxWjz5DQq/3rDYCghdbssCbvyayjTS84LF4FVyuSiLv4PcrooUNQwDwG3UvLfBLqg2wgy
 2tk=
X-SBRS: 2.7
X-MesageID: 22860474
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,359,1589256000"; d="scan'208";a="22860474"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [osstest PATCH] Revert "make-flight: Temporarily disable flaky test"
Date: Thu, 16 Jul 2020 17:34:24 +0200
Message-ID: <20200716153424.40953-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
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

This reverts commit c436ff754810c15e4d2a434257d1d07498883acb.

Now that XSA-321 has been released we can try to enable PVH dom0
tests again.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 make-flight | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/make-flight b/make-flight
index b25144f7..b8942c1c 100755
--- a/make-flight
+++ b/make-flight
@@ -774,7 +774,7 @@ test_matrix_do_one () {
   xen-4.10-testing) test_dom0pvh=n ;;
   xen-4.11-testing) test_dom0pvh=n ;;
   xen-4.12-testing) test_dom0pvh=n ;;
-  *)                test_dom0pvh=n ;;
+  *)                test_dom0pvh=y ;;
   esac
 
   # core scheduling tests for versions >= 4.13 only
-- 
2.27.0


