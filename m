Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9024249A97
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 12:41:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8LWq-0002tt-4D; Wed, 19 Aug 2020 10:41:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8LWp-0002to-8F
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 10:41:11 +0000
X-Inumbo-ID: 50e6b973-a8e0-4d2e-af14-40300ef1ad02
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50e6b973-a8e0-4d2e-af14-40300ef1ad02;
 Wed, 19 Aug 2020 10:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597833669;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Ma7Xfj8gw1gvbhitAODawue641E/hETwMkNTzYrjp0w=;
 b=Rz0rz4usmkUGHdeLA4fnCoxovQImDrAs5gb/FcMcmoK2wdZk1bhxBiiT
 Ofjv1aB+meb9Jj4mHumESv4gTOd/VNWe56vQKYgqQfpIsQgWw7DCWvDHh
 SVI8l3HyXXIHfjDGcukQv4rQNu8uWJCC6FDZ3euEBEF+936UzL+GvnOJG k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ONaHGzhYJhDU+v/Zyf3eoztmrzmU1zHvBaEyGc+VZl0zG1rtcf8wFs+UEJppSi7ZRyCxi1PyQE
 c5rwctvCJMQsx2hd8sAiotNdMfLxdh7wv3tmFUZZmjRYDJqaosu4I/6zPY2cvegsEW2d1zbMkA
 7UzyBRWTbexGL1EuwK1Hyft81IQeZqkTe2qJFytvbRDqk12OegKjz5AVyPL1JpYCh83nt36Usi
 9/K21gt5SKIxYYj8rb/T8bg27IgHirL4t6+n3DHebOalY7YB9uIBKnQS+WSLgq7OX9nVQa3LZA
 BNQ=
X-SBRS: 2.7
X-MesageID: 24999055
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="24999055"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] production-config: Use infra.t, not infra
Date: Wed, 19 Aug 2020 11:41:02 +0100
Message-ID: <20200819104102.9245-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
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

This works better with some quirk of the networking we seem to now
have after the buster upgrade to the colo systems.

To avoid blocking on resolving that issue, change the the config.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 production-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/production-config b/production-config
index b7b9a062..6055bd18 100644
--- a/production-config
+++ b/production-config
@@ -131,6 +131,7 @@ CoverityToolsStripComponents 1
 #DebianMirrorHost 10.80.16.196
 DebianMirrorProxy http://cache:3143/
 
+HostProp_DhcpWatchMethod leases dhcp3 infra.t:5556
 HostProp_NtpServer infra.test-lab.xenproject.org
 
 DebianPreseed= <<'END'
-- 
2.11.0


