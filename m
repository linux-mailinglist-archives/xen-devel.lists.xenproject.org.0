Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2333244D8B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTQ-00047B-SC; Fri, 14 Aug 2020 17:26:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQT-00024H-0L
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:33 +0000
X-Inumbo-ID: 18e06ca4-8e91-4e14-8870-2ebf0dd220ae
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18e06ca4-8e91-4e14-8870-2ebf0dd220ae;
 Fri, 14 Aug 2020 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Q2DHznUSzDCiwJvbTpK+EsflStSwpJzgic3yYjwBj88=;
 b=W3936b+dKOxBpLppvk2MLg3vgGqGkrBhwO+0A3FffcuuEyOgP9R+ZcaQ
 FNKO/YM93Rb8pAUT7ayj6pia/7Hv8AsMMjU/7i1WH9NLUPufGScqLFmfD
 4BYd6/MmzYdV4kYk/rrNlR2dmNRud/QU0kWzBnljbGA7OfMsgrUztn/HO g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mt2cdu9oNkD8xicT9fbKvliQ7A3TX45j3aCLdnPz5GAglhXZhphN5SIeIVjMX23WqG1ZqrWqk0
 jyZrJH8rGukQPspN49o847UUVUmOM+/0nh0rQgRtHecmCtvPKdmIq2gV0LHt4W5xI0NO6AvUhy
 Tus+KnbGK9nIYqzYELKs44iCbUJxtIOJ10PemoNxBVoSdqfgdBoA+IxL2WTE/WhKxwliMYSFNq
 6sQRRK9/n20WzhR0BwjaAU9YNMgZvvtK+/Pp/Q5j1d7OgxqeRsKzgMHAo0c1q8XH0ACIIehyph
 9LY=
X-SBRS: 2.7
X-MesageID: 25487825
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487825"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 29/60] parallel by fork: Disconnect $dbh_tests as well
 as undefing it
Date: Fri, 14 Aug 2020 18:21:34 +0100
Message-ID: <20200814172205.9624-30-ian.jackson@eu.citrix.com>
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

If the caller is buggy and has statement handles still open, they can
still "work" even if we have thrown away the db handle.

Where, after forking, "work" means "use the same connection in
multiple processes simultaneously, without locking".  This could
result in arbitrary crazy nbehaviour (eg, TLS crypto failures).

No functional change with existing callers since they don't have this
bug.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index 0b206de4..f0571189 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -245,6 +245,7 @@ sub parallel_by_fork ($$$$) {
     # db is reopened in each child.
 
     $whoami = $set_whoami;
+    $dbh_tests->disconnect();
     undef $dbh_tests;
 
     foreach my $task (@$tasks) {
-- 
2.11.0


