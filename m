Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F0C244D9A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTb-0004L2-8V; Fri, 14 Aug 2020 17:26:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQO-00024H-0H
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:28 +0000
X-Inumbo-ID: daa8a508-c75e-4f20-aff3-e79041e9cc43
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daa8a508-c75e-4f20-aff3-e79041e9cc43;
 Fri, 14 Aug 2020 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Cb4uZBmyPAuwXWIZ5X4FCPlExKibgY6AbAI+s7FEbxM=;
 b=Qiw9NEXOVWOoiiq26utDZV1x396xP6pLIk8y/MWC+kvB2rlGoupfjdJr
 4WX7+aH5Vv0QmHXW7M1sDY8JfIRGH4fgOiPJ0lGzyzvG8kqv+IoMvyOuT
 vq45plBzz/K4hSlrsnlGQqU19R5ZYoUk+RKWG7Utp7MgPtq8MY/xoO5s6 I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bAJhGQySFnlcl+mQrLKaBRSO9NFhcConVYT6M9+EgceM8Wg+EOnZ1bETigIBj70kHwyKhqRkVA
 5PmKrbd0iNhKJUPGjMRPDHeeMbVk+koXDgG6Tb6YiBdRbb5/WUUDplxpq17Eo8OWgdcQ8i9IXh
 WzbkXgA1KW/zXrENHfa3BZCWXe3gy1iNOSIizrESui2vUVN7eHX4xJUQ1CejK1AvKRs6wyRgnb
 rsrY4TOmu1iKP1Hji/YIk+0HahDQbyPp913ZrEdxPG6zRElI2BLZGCP0qWnCMW6Bdbk4blK0ZI
 Pes=
X-SBRS: 2.7
X-MesageID: 25487824
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487824"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 30/60] parallel by fork: Fix a variable name to $task
Date: Fri, 14 Aug 2020 18:21:35 +0100
Message-ID: <20200814172205.9624-31-ian.jackson@eu.citrix.com>
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

This code came from sg-report-host-history where tasks were hosts.
But in the more general context, the names are wrong.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index f0571189..695d744a 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -226,13 +226,13 @@ sub wait_for_max_children ($) {
     while (keys(%children) > $lim) {
 	$!=0; $?=0; my $got = wait;
 	die "$! $got $?" unless exists $children{$got};
-	my $host = $children{$got};
+	my $task = $children{$got};
 	delete $children{$got};
 	$worst = $? if $? > $worst;
 	if ($?) {
-	    print STDERR $whoami."[$$]: [$got] failed for $host: $?\n";
+	    print STDERR $whoami."[$$]: [$got] failed for $task: $?\n";
 	} else {
-	    print ::DEBUG "REAPED [$got] $host\n";
+	    print ::DEBUG "REAPED [$got] $task\n";
 	}
     }
 }
-- 
2.11.0


