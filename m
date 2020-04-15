Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABF1AA969
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:10:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOikP-0000Ca-Rm; Wed, 15 Apr 2020 14:10:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fIs=57=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOikO-0000CP-35
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:10:36 +0000
X-Inumbo-ID: dfe00890-7f22-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfe00890-7f22-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 14:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586959835;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MCT9iaP9hqthD1TJioFT3LOvApm5sCvM4OiVAxcsBdg=;
 b=Fpet0uH6nscgqK9CPx2wg8TrVfWi9+3qr1iOiAn9vGnRnqEy5BA7XDbs
 PzGPVU6JE0M0dRiIc7f7wBOgtZPUmu5ZENYfrqBJZvRsEhoZKb2BO9/0w
 g4neEBvYzxdt8j+PjdEv3UPZ4/c41RIcqOBkqxkl+INSzvaxiurRqn9mU Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3eXi28DNUq0OnBf5u457LPO/8hOfR6TZqOniFEe6ePFsY+cj/65VYIrGatTFqMNXUd/OxNc3xJ
 IHCxIl3GjCDUtIhOhqDX8s5qjz0Rvqp6Hw1TSleIT5EWvfeKvCVijLHTgRI0HDA1WDcy9tR2TL
 AX0qIrU9GvSioaS1Vv2TztXquGKYEaGCPzbX9IqhjAk7lcN+5yfZdGBhQq7QhN9JRmVPB5J7lj
 1m8X/EAyF6gIMSQyU1Ji3BQxGv16LmlEd7LQbCHRR5Ohmr0I+UjPnJpeBabRH9FQSXiKn745yn
 TdY=
X-SBRS: 2.7
X-MesageID: 16036222
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,387,1580792400"; d="scan'208";a="16036222"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH OSSTEST v3 1/2] exanime: test for SMT and add a host flag
Date: Wed, 15 Apr 2020 16:10:08 +0200
Message-ID: <20200415141009.10912-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
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

Check if hosts have SMT based on the number of threads per core. A
value of threads per core greater than 1 implies SMT support.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use hw-smt.

Changes since v1:
 - Fix regex and set SMT if number of threads per core is > 1.
---
 sg-run-job     |  1 +
 ts-examine-cpu | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100755 ts-examine-cpu

diff --git a/sg-run-job b/sg-run-job
index 97011843..aa7953ac 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -679,6 +679,7 @@ proc examine-host-examine {install} {
     if {$ok} {
 	run-ts -.  =           ts-examine-serial-post + host
 	run-ts .   =           ts-examine-iommu       + host
+	run-ts .   =           ts-examine-cpu         + host
 	run-ts .   =           ts-examine-logs-save   + host
 	run-ts .   =           ts-examine-hostprops-save
     }
diff --git a/ts-examine-cpu b/ts-examine-cpu
new file mode 100755
index 00000000..81cf7544
--- /dev/null
+++ b/ts-examine-cpu
@@ -0,0 +1,32 @@
+#!/usr/bin/perl -w
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+#
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+#
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+use strict qw(vars);
+BEGIN { unshift @INC, qw(.); }
+use Osstest;
+use Osstest::TestSupport;
+
+tsreadconfig();
+
+our ($whhost) = @ARGV;
+$whhost ||= 'host';
+our $ho= selecthost($whhost);
+our $info = target_cmd_output_root($ho, 'xl info', 10);
+our $threads = $info =~ /^threads_per_core\s*:\s.*/m;
+
+logm("$ho->{Ident} threads per core: $threads");
+hostflag_putative_record($ho, "hw-smt", $threads > 1);
-- 
2.26.0


