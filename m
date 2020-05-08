Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D581CBA76
	for <lists+xen-devel@lfdr.de>; Sat,  9 May 2020 00:10:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXBBJ-0003AR-Cx; Fri, 08 May 2020 22:09:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UrFz=6W=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jXBBI-0003AM-06
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 22:09:20 +0000
X-Inumbo-ID: 902e1ea0-9178-11ea-b07b-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 902e1ea0-9178-11ea-b07b-bc764e2007e4;
 Fri, 08 May 2020 22:09:19 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048M3qiu161659;
 Fri, 8 May 2020 22:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=kRJKGgXEcBvkOnkZ00J/8oVZj7ZZskCjtSJZuvcjbbk=;
 b=EkLLPV6+6vDj7ywobWZNfkVpk42vo4sS6Wavr2iWASmCYK+NZexIWqJKpxtkhn63wQtc
 wg7wFDZVVRob2exoB5k+88R3KfzYN92b2An084ssEc7X+glnExqPHU36Czrwp6ErPhnG
 1kBnoJxXMoujtsoNJJGWGf89MgM8QihpfoSBJGWtZ+MzxfZTjRgn2yhP9/4EpbbAGfEV
 hGmeHbj5qaDkwFUH35qkoJD5I9IAz1FzgOrSmuK+4BnrT+y3blK7GcPryYxbQ72tTY8X
 +Q0qMMUAM5J5B7lWZs9C3YOfWClf705gbobq0U85IyCEy8JrbkDDr0PSS9lD+Tq59lv/ 7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 30vtewwe50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 May 2020 22:09:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048M5xSe011008;
 Fri, 8 May 2020 22:07:16 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 30vte193h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 May 2020 22:07:16 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 048M76d6019813;
 Fri, 8 May 2020 22:07:06 GMT
Received: from ovs104.us.oracle.com (/10.149.224.204)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 May 2020 15:07:06 -0700
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: [PATCH] xen/cpuhotplug: Fix initial CPU offlining for PV(H) guests
Date: Fri,  8 May 2020 18:28:43 -0400
Message-Id: <1588976923-3667-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9615
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005080187
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9615
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005080187
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
Cc: jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 sstabellini@kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit a926f81d2f6c ("xen/cpuhotplug: Replace cpu_up/down() with
device_online/offline()") replaced cpu_down() with device_offline()
call which requires that the CPU has been registered before. This
registration, however, happens later from topology_init() which
is called as subsys_initcall(). setup_vcpu_hotplug_event(), on the
other hand, is invoked earlier, during arch_initcall().

As result, booting a PV(H) guest with vcpus < maxvcpus causes a crash.

Move setup_vcpu_hotplug_event() (and therefore setup_cpu_watcher()) to
late_initcall(). In addition, instead of performing all offlining steps
in setup_cpu_watcher() simply call disable_hotplug_cpu().

Fixes: a926f81d2f6c (xen/cpuhotplug: Replace cpu_up/down() with device_online/offline()"
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 drivers/xen/cpu_hotplug.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/cpu_hotplug.c b/drivers/xen/cpu_hotplug.c
index ec975de..b96b11e 100644
--- a/drivers/xen/cpu_hotplug.c
+++ b/drivers/xen/cpu_hotplug.c
@@ -93,10 +93,8 @@ static int setup_cpu_watcher(struct notifier_block *notifier,
 	(void)register_xenbus_watch(&cpu_watch);
 
 	for_each_possible_cpu(cpu) {
-		if (vcpu_online(cpu) == 0) {
-			device_offline(get_cpu_device(cpu));
-			set_cpu_present(cpu, false);
-		}
+		if (vcpu_online(cpu) == 0)
+			disable_hotplug_cpu(cpu);
 	}
 
 	return NOTIFY_DONE;
@@ -119,5 +117,5 @@ static int __init setup_vcpu_hotplug_event(void)
 	return 0;
 }
 
-arch_initcall(setup_vcpu_hotplug_event);
+late_initcall(setup_vcpu_hotplug_event);
 
-- 
1.8.3.1


