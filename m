Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE90F244D8A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTJ-0003xH-Kd; Fri, 14 Aug 2020 17:26:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQn-00024H-1P
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:53 +0000
X-Inumbo-ID: 896d20ac-b3ff-4c88-86d6-f9658b05afd8
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 896d20ac-b3ff-4c88-86d6-f9658b05afd8;
 Fri, 14 Aug 2020 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SF6JrZam2+wPokpUiTs03Zat4tqLyBtCgJsqjxxZn6A=;
 b=cSx3K5O2yGIqk+n5pldrQ6ksDcSGif3/S9Iu0gydXzeECVyHh6OqvT9S
 b3f6Rxve1/82v6acfw7Olk0hiRuCKPo55TXLSJJFQvq97ccpJdyxo16L3
 PdA0WGx90yoqVQYq0VPU5AGjUelnYFhTI52aoJ6L1qAys8Ys9x14xFvN3 c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yQR9GLMmyubOyPDCTK8gsCAWRoXoHZc8EdYCy67UCCHFoPuav9VuDh53vdLYGzafy4ico5lbEj
 k7NCKrjP6mEGV8dmisz00J3VZAfFOFae5Cb/MvQXdyJZZCqFai8uQHsXwCqVWo6YWSM7iaoa4v
 uifl8V955WKHTf9MJMiYGFBJo+MO8Y8yQ61qzmhgWNuoMnsxPDAFJsjqUWJgWFzsEjPDyB10GQ
 /W3QmIzLuzYW57rMag2nDahBaR//oVTTB5iOUw2NLT/xn05XaRO3Icf35S7KhkO1hfkHopzktp
 BzQ=
X-SBRS: 2.7
X-MesageID: 24725188
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24725188"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 36/60] sg-report-job-history: Always write HTML output
Date: Fri, 14 Aug 2020 18:21:41 +0100
Message-ID: <20200814172205.9624-37-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Previously, unlike sg-report-host-history, if you didn't specify
--html-dir, it would would do a lot work to no effect.

This is not useful and nothing calls it this way.  So abolish this
notion.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 3f10a74c..7197a5f6 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -30,7 +30,7 @@ use Osstest::HistoryReport;
 
 our (@blessings,@branches);
 our $limit= 100;
-our $htmlout;
+our $htmlout = '.';
 our $flight;
 our $maxjobs=10;
 our $job;
-- 
2.11.0


