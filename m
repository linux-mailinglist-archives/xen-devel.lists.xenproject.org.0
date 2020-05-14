Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211891D3295
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 16:20:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZEif-0008A0-Ih; Thu, 14 May 2020 14:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2eD=64=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jZEid-00089E-Kg
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 14:20:15 +0000
X-Inumbo-ID: fc289710-95ed-11ea-ae69-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc289710-95ed-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 14:19:56 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jZEiJ-0004pf-Fi; Thu, 14 May 2020 15:19:55 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 4/4] TestSupport: honour OSSTEST_PDU_MANUAL override
 env var
Date: Thu, 14 May 2020 15:19:51 +0100
Message-Id: <20200514141951.29371-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514141951.29371-1-ian.jackson@eu.citrix.com>
References: <20200514141951.29371-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This takes effect on everything that uses selecthost().  The result is
that PDU operations are made manual.  This can be useful for testing
etc.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 3700a8fe..1e7da676 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -1059,6 +1059,12 @@ sub power_cycle_host_setup ($) {
 	    MethObjs => power_cycle_parse_method($ho, $spec),
         };
     }
+    if ($ENV{OSSTEST_PDU_MANUAL}) {
+	@approaches = ({
+            Name => 'manual-override',
+            MethObjs => power_cycle_parse_method($ho, 'manual'),
+        });
+    }
     $ho->{PowerApproaches} = \@approaches;
 }
 
-- 
2.20.1


