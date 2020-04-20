Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7475B1B0C43
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQW8m-00063p-7H; Mon, 20 Apr 2020 13:07:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FXEW=6E=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jQW8l-00063e-1y
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:07:11 +0000
X-Inumbo-ID: d7888e87-8307-11ea-905f-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7888e87-8307-11ea-905f-12813bfff9fa;
 Mon, 20 Apr 2020 13:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587388029;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=L3PQ48H6KQFQdpQ41RB3Eoax7eA/K+aSt4iO3iwbA0Q=;
 b=KxmgF63CwqTHsy/XsRt1HI5Sn+sCCSs0hAmAsBqC5mEER9A5LzuPgqjR
 421EZP9Uf/ckIFaZ0AY7RB9dyC/OzInXJKyA3TN0PIeBiQv8c3kLl5oEF
 drVdtb7VWLK5eYEdB55qi/4wVrVauvCly3AEh9OyWo5nwi5ZWCCWtNC0H g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KPcc98wCAz7VmNkfybLHtCKZadOKWATAuQcK8CQIuHZOeFd02qSJp87ki60Q1JlmZjaF4DXIbe
 EXCB2QgPNCP8sqMP2oj6gVH32W3ETDunncqS1ZuFF5k2BaqeaGjJkWPw+as9wdCBdBej5D/B4Q
 e8LvkTLd3LZ7UkEl9BA03Umsu35ZA9VnRLSDXPbeFJxjjxitttlsbnj9rssj0fiF8nk//3fRg2
 tx/jz6IS5qaB5+6B+HuubCsZ05XxEyThe6RkR5Y0mtZYXO2ZP7zJoOqTSeat+2PzqFZRD3dsvs
 CQM=
X-SBRS: 2.7
X-MesageID: 16611592
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="16611592"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2] sched: print information about scheduling granularity
Date: Mon, 20 Apr 2020 14:06:50 +0100
Message-ID: <20200420130650.14341-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Currently it might be not obvious which scheduling mode (e.g. core-
scheduling) is being used by the scheduler. Alleviate this by printing
additional information about the selected granularity per-cpupool.

Note: per-cpupool granularity selection is not implemented yet.
      The single global value is being used for each cpupool.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v2:
- print information on a separate line
- use per-cpupool granularity
- updated commit message

CC: Juergen Gross <jgross@suse.com>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
 xen/common/sched/cpupool.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index d40345b585..68106f6c15 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -40,6 +40,30 @@ static DEFINE_SPINLOCK(cpupool_lock);
 static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
 static unsigned int __read_mostly sched_granularity = 1;
 
+static void sched_gran_print(enum sched_gran mode, unsigned int gran)
+{
+    char *str = "";
+
+    switch ( mode )
+    {
+    case SCHED_GRAN_cpu:
+        str = "cpu";
+        break;
+    case SCHED_GRAN_core:
+        str = "core";
+        break;
+    case SCHED_GRAN_socket:
+        str = "socket";
+        break;
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+
+    printk("Scheduling granularity: %s, %u CPU%s per sched-resource\n",
+           str, gran, gran == 1 ? "" : "s");
+}
+
 #ifdef CONFIG_HAS_SCHED_GRANULARITY
 static int __init sched_select_granularity(const char *str)
 {
@@ -115,6 +139,7 @@ static void __init cpupool_gran_init(void)
         warning_add(fallback);
 
     sched_granularity = gran;
+    sched_gran_print(opt_sched_granularity, sched_granularity);
 }
 
 unsigned int cpupool_get_granularity(const struct cpupool *c)
@@ -911,6 +936,7 @@ void dump_runq(unsigned char key)
     {
         printk("Cpupool %d:\n", (*c)->cpupool_id);
         printk("Cpus: %*pbl\n", CPUMASK_PR((*c)->cpu_valid));
+        sched_gran_print((*c)->gran, cpupool_get_granularity(*c));
         schedule_dump(*c);
     }
 
-- 
2.17.1


