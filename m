Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377682517E8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXKA-0003Cc-Ng; Tue, 25 Aug 2020 11:41:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXK8-00030Q-O9
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:41:08 +0000
X-Inumbo-ID: 6bcfeaa4-eb51-4150-8c69-93c5cd2732e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bcfeaa4-eb51-4150-8c69-93c5cd2732e4;
 Tue, 25 Aug 2020 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=vzNPBAJhowa+pV/8E3AV2P0Ul1PqQ2F1jjONTEMhGAA=;
 b=XMy/gy2v2Z7fgkee7LoKw7uzO0KExafmY87O8CrbGXaesgTZ325i79q2
 6Pis/7e08iCQwOQJczrv6+0O6oskAUPxS8j4PK8rmvxWtoGxmn00cb6Yl
 g0GzX5b1caa2mnS/+GPxzrJk/QKWQKvu5RBq1dKMErZY48Z19StqjQqlG M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4t+ME1OGRVj6Rh9rektQjTmUrg6+tuuu0QA4AgD8135fN0HzyTSd7ALKiiyk1Acc3UPGvcAu2R
 tcWEMWPjdGkV+bm+uaFGZa+YO4+1yZHRBatcWUIqugBbaL1mIg6gekMuQZKo2p2NdNIZEFUWeI
 0JK9sLGPRmCORlp59O8SkQqA3gbapgKZ8oro6FftusyXEw3lJMXmWjNQkWyoca1WJseHyM3eGg
 4p4USDYf8KqsSH0a4Jltd/oFYloC4uypFy0xCOPdOD6VXScWX/ozHRCNvl4gIvPh+ZigxkUduA
 2Cw=
X-SBRS: 2.7
X-MesageID: 25567116
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25567116"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Ian Jackson
 <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 05/12] show_abs_time: Represent undef $timet as <undef>
Date: Tue, 25 Aug 2020 12:40:34 +0100
Message-ID: <20200825114041.16290-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
References: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
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

This can happen, for example, if a badly broken flight has steps which
are STARTING and have NULL in the start time column, and is then
reported using sg-report-flight.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Osstest.pm b/Osstest.pm
index b2b6b741..734c0ef6 100644
--- a/Osstest.pm
+++ b/Osstest.pm
@@ -457,6 +457,7 @@ sub visible_undef ($) {
 
 sub show_abs_time ($) {
     my ($timet) = @_;
+    return '<undef>' unless defined $timet;
     return strftime "%Y-%m-%d %H:%M:%S Z", gmtime $timet;
 }
 
-- 
2.20.1


