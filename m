Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730291A9A3F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 12:16:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOf5D-0001Jx-Nj; Wed, 15 Apr 2020 10:15:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fIs=57=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOf5C-0001Js-Ne
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 10:15:50 +0000
X-Inumbo-ID: 13b1b6f8-7f02-11ea-8a29-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13b1b6f8-7f02-11ea-8a29-12813bfff9fa;
 Wed, 15 Apr 2020 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586945750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RqN8L0g5SnM+Z809FeY9xp0Pjnq0aBv7T4zdYHpAYdI=;
 b=XPS0n/FtKokdHrsc5EFfbu5JzL7LQ5bfNpheqr7DQOAc6ks6Q9Nst5Bh
 73vbupF3PseaaGWZndJMsh1H2Nk23jX8b7BiPyDpEbhvZTqyi9zlEAH13
 8Q267/9og8cVdPJBTGSZPIls5kfEw316Td/jm7wlAdCg+xcHLet5m5R7s 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +7CT/fD0CjmUV+fQ2je+RVbd1B1GVGElboN0GfBDESj8Ic3YL5cT/5U8oasYibaSoQnYivOxKO
 W/QdOS8t0WcQmFrTOKBD0Ey+ZlnikX7RZCgldGoDTwot5FFAjNPU7QuFdKRiuXWBXA8KDHhNwc
 86iFwrCZp4c1Dpjs6afoWNsHnONXhvXA2gcz4WFUlMKEzzyMmseDL63M1D9TjPYtm9CtsCxy2C
 5DGWmus205099RRmxb3Zq79ecMammkC3e8y5FsV+f1qnUdq+XJJf3ZbqzGxyMpR1MoF792ZZPP
 bPk=
X-SBRS: 2.7
X-MesageID: 15687943
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,386,1580792400"; d="scan'208";a="15687943"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH OSSTEST v2 1/2] exanime: test for SMT and add a host flag
Date: Wed, 15 Apr 2020 12:15:09 +0200
Message-ID: <20200415101509.8763-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415085246.7945-1-roger.pau@citrix.com>
References: <20200415085246.7945-1-roger.pau@citrix.com>
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
index 00000000..c30311ab
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
+hostflag_putative_record($ho, "smt", $threads > 1);
-- 
2.26.0


