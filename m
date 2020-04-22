Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051DA1B3B58
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 11:30:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRBi6-0006X0-Dq; Wed, 22 Apr 2020 09:30:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cUjI=6G=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jRBi4-0006Wu-NG
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 09:30:24 +0000
X-Inumbo-ID: e44e818c-847b-11ea-b4f4-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e44e818c-847b-11ea-b4f4-bc764e2007e4;
 Wed, 22 Apr 2020 09:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587547823;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=H1tzBodFfLZl2PzsVtHMvT84Jmeky0w/e8zXs1bdyBQ=;
 b=ZVnCvN7unU5aC7/dxaxoQwHEMvAP3pigyeOj4Lio0Zsn62F8EU26o3t4
 jA5vW728D5z1uC0Lg9jvnRCWtfSzDks+sm/DEKsYE9HfV5EIincHGwcp9
 Fdk+rZwdG1vV9zSWbl+RsLkXbw0PCVvwEZ+MPyNbB1B+gZGtWHPqeCZ+b 0=;
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
IronPort-SDR: vcc7NVwL3g0jnfCKRteDH5h5+L8cJyhUS5T0e7Wf+c8b0CI3CzKvYt7JbWDFX3jTKe33y89q70
 0yUIJgVCkPo+xj1bBj1D6uG3RRyG5v9NdqY2E/DHncuqS6y9fu8sTTYqjVTBaYW5gcZUfFQbKN
 k67JkvhlyzioqmctBRopaFFxtyx5ipfrD0sZ5bXVPEyeK3c5YyqN6Ss9bBNXbjW5jM1hnYXqI/
 N6RucdKo5fjhrogunF35QQIshgSH6YyPEeTAeRw1O96d7NPe5oXvKLvKhEZDHUpIiMoXpiFSJm
 O5I=
X-SBRS: 2.7
X-MesageID: 16733751
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,413,1580792400"; d="scan'208";a="16733751"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3] sched: print information about scheduling granularity
Date: Wed, 22 Apr 2020 10:30:10 +0100
Message-ID: <20200422093010.12940-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Currently it might be not obvious which scheduling mode (e.g. core-
scheduling) is being used by the scheduler. Alleviate this by printing
additional information about the selected granularity per-cpupool.

Note: per-cpupool granularity selection is not implemented yet. Every
      cpupool gets its granularity from the single global value.

Take this opportunity to introduce struct sched_gran_name array and
refactor sched_select_granularity().

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v3:
- use const char*
- use sched_gran_name array instead of switch
- updated commit message

v2:
- print information on a separate line
- use per-cpupool granularity
- updated commit message

CC: Juergen Gross <jgross@suse.com>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
 xen/common/sched/cpupool.c | 51 +++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index d40345b585..b60799a558 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -40,19 +40,50 @@ static DEFINE_SPINLOCK(cpupool_lock);
 static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
 static unsigned int __read_mostly sched_granularity = 1;
 
+struct sched_gran_name {
+    enum sched_gran mode;
+    const char *name;
+};
+
+static const struct sched_gran_name sg_name[] = {
+    {SCHED_GRAN_cpu, "cpu"},
+    {SCHED_GRAN_core, "core"},
+    {SCHED_GRAN_socket, "socket"},
+};
+
+static void sched_gran_print(enum sched_gran mode, unsigned int gran)
+{
+    const char *name = "";
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(sg_name); i++ )
+    {
+        if ( mode == sg_name[i].mode )
+        {
+            name = sg_name[i].name;
+            break;
+        }
+    }
+
+    printk("Scheduling granularity: %s, %u CPU%s per sched-resource\n",
+           name, gran, gran == 1 ? "" : "s");
+}
+
 #ifdef CONFIG_HAS_SCHED_GRANULARITY
 static int __init sched_select_granularity(const char *str)
 {
-    if ( strcmp("cpu", str) == 0 )
-        opt_sched_granularity = SCHED_GRAN_cpu;
-    else if ( strcmp("core", str) == 0 )
-        opt_sched_granularity = SCHED_GRAN_core;
-    else if ( strcmp("socket", str) == 0 )
-        opt_sched_granularity = SCHED_GRAN_socket;
-    else
-        return -EINVAL;
+    unsigned int i;
 
-    return 0;
+    for ( i = 0; i < ARRAY_SIZE(sg_name); i++ )
+    {
+        if ( strcmp(sg_name[i].name, str) == 0 )
+        {
+            opt_sched_granularity = sg_name[i].mode;
+            return 0;
+        }
+    }
+
+    return -EINVAL;
 }
 custom_param("sched-gran", sched_select_granularity);
 #endif
@@ -115,6 +146,7 @@ static void __init cpupool_gran_init(void)
         warning_add(fallback);
 
     sched_granularity = gran;
+    sched_gran_print(opt_sched_granularity, sched_granularity);
 }
 
 unsigned int cpupool_get_granularity(const struct cpupool *c)
@@ -911,6 +943,7 @@ void dump_runq(unsigned char key)
     {
         printk("Cpupool %d:\n", (*c)->cpupool_id);
         printk("Cpus: %*pbl\n", CPUMASK_PR((*c)->cpu_valid));
+        sched_gran_print((*c)->gran, cpupool_get_granularity(*c));
         schedule_dump(*c);
     }
 
-- 
2.17.1


