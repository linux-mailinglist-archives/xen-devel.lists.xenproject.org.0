Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2F1F7149
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 02:23:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjXTF-0007ON-Te; Fri, 12 Jun 2020 00:22:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjXTE-0007MF-7D
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 00:22:56 +0000
X-Inumbo-ID: d401da07-ac42-11ea-b594-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d401da07-ac42-11ea-b594-12813bfff9fa;
 Fri, 12 Jun 2020 00:22:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpWMGfCCZSJVSokHiAz8NWVDcBgkjz0dIICBn7VgaTItnZcYdpCeYii+awqDg+i5lDsMNCTIxtULcbjNNVsheQ1n6+besrDP3IkrJu4pbYGEWmA6MCxn9Citd4Uq1nGv5TfnhD+YlshYKtJeOP2rk/quiNo/7uHaXAtz4xLQ7SKFJSCnRJT89y9LdO1XGx8hqUiJg65PEQCb0JhBI/KuB9GBLStcZErKQH5HgRMJxyplJHAxnfuvyQYejWtGpx70XGMM8SjKWhLwzeVTkYBxyEFy6ys1Pe2ZNokHr2yzEQb9205vcqPc8rI7j2n3H/p5LABA+GKm66o/aF9W/za0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/q3vwR74SO4t+n7E/mQzwfg4LX6JiGo9tkrL9EGFJ4=;
 b=Fqy3ZLqxZ/pm1El9ahfddqktqa46HX0Ywo3QBPVIU94yllz/Y9YOiLIulPUdTRUzkBOP7kmV64dhz3slmYTQuG+6JASpXHG00hUzidQYhKZt/VglXVB/y2dgWPmlcKjyAYQtoUTZKrkO6SUpP1PNzeFXzlgbwpA2DcSqnopooHI3sbQgYZoYzQ6laaHqvKAMAGC+PyxHCFckXAnBHsSonS78CjkUf5LTy24ifzzByXr6gYwk9RjYvpF/bx47n6nEyVwC2VM4U2IqZDcQFFUPC4S6nP4mJPy8lIFRK9NW6jDCCJyYh7Ln9sXJsOUOMcbYE51Xv6/KE0gx4ai5dYmoxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/q3vwR74SO4t+n7E/mQzwfg4LX6JiGo9tkrL9EGFJ4=;
 b=GaFBPZzhl2MwDnOsG9G+k9TNiApNWnl65zjLNOlneqtv6icQ16qMaHibdtxMhaWnTwyup7L5FVmtsBELux5/fiQz2aaPJK+0a16o8Fghw82ufZFaoRayTjREdwgZlCaMnD/OiPcx2vpsgFpyWnS+vWX+3rG+Svsj5/jhNiJKj60Ho1H7zFsjXZ86V2kC6AzKLkJ+/CnGcjzZuSTvvjMEY8cZGOoQg0YmHb0OlTwyrOH/mZxS9VIyM5rzXiMFAgpP8XZTxO76AepBychP5abbDhqeW638QGhxIy7LdFF2AYpO+4S9veGYV6TAWkCQUY89h5oDYgnlXxFCil8meKtpEA==
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB2654.eurprd03.prod.outlook.com
 (2603:10a6:800:e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Fri, 12 Jun
 2020 00:22:37 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3088.018; Fri, 12 Jun 2020
 00:22:37 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [RFC PATCH v1 3/6] sched, credit2: improve scheduler fairness
Thread-Topic: [RFC PATCH v1 3/6] sched, credit2: improve scheduler fairness
Thread-Index: AQHWQE+TBfX1MPdkGkC6vJ7ur/uY5A==
Date: Fri, 12 Jun 2020 00:22:36 +0000
Message-ID: <20200612002205.174295-4-volodymyr_babchuk@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de4db258-52dd-4a6d-14f8-08d80e66b5e6
x-ms-traffictypediagnostic: VI1PR0302MB2654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0302MB2654FE80FAB44BC5724A2F6EE6810@VI1PR0302MB2654.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:249;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MST4SVLzE67xLf4DmB6pbDIntKiMPc29u+C5QgOqr/3L8YM2uwcxfj8HwSM1RrwWwmeybo+xty+KUU8vW4QBthBV8u6HRwTiEm5eDaKNzP58RpGIg9a5oxvLZJWs44G8NcTlMFo1GdEOT8KgzexWzxAfKi1v74UT9uQ/WNRDlIzVJsEL44xDXGQlR5xP1wH/JMpSTp6urY1qLew3HT23+Zsl4lhoPj1XqOAGtjXVyFKvaSOdfAb85i1pAAry9/X78FYqTJ1Ao53BCZAUJCkatRHPUA1K5+JvCnoIIoSJ5aAP5G/hqsiezNrrpq9hmAnu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(66446008)(64756008)(478600001)(66946007)(66556008)(76116006)(66476007)(26005)(91956017)(36756003)(8676002)(86362001)(55236004)(186003)(8936002)(4326008)(6506007)(54906003)(6512007)(2906002)(6486002)(316002)(5660300002)(83380400001)(6916009)(71200400001)(1076003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 8RLhe3RMRbjQT8lwxVw2mQ4vDohuoTAqS9JK4p2KTlYWKGYRZlfougZneij4TSNmVjZ/zb0ccbJjmVVcnYeqUqtLCxc8OKhI0GnOGzzm2qF0F5MOiI0uXErNIegCADFdTl7OW31RfaDt3N5ya46Gz2NGazabwC3TfU6b57/tlRczk7Xh1r/N8db76bCdRVseoWy94m9xnxG4dxCCwEWv4nABVWlwR9hTwJRWSYODMZkDjvL0+ks0Aiwa6R9sHvfRF2Dq2xiYGIahoToTjFca0lwhu1BUAHvYhigpmZ/9DK/NgrkgXPE9yestkqq/jPS5GXC9h+KWy4VrjTL3S1XUUnavzwQYYWJSshMZCkdyMuOmksfa6PVykG5v2y5u7+xnAZtzlDPIrFjwGAxDEBIpXe7Ui4az3jCc1kdlPV8+qXsT/LEXNjqGIgzRnGvZeuxjGiwhfG1btjuk17X902GLynVsi+tB3pmdJPtZQdTQUKs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4db258-52dd-4a6d-14f8-08d80e66b5e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 00:22:36.9255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GA0TCH7Ztw0IguOTKlSCcOSNU3bchUtqDPJEDwkZedpLtOh/BDZlWtFmD6uF3QJrq+Dw7I5O9/SDdZgIxeKg0t75I5qvP2A58UeyLYNPkg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2654
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Now we can make corrections for scheduling unit run time, based on
data gathered in previous patches. This includes time spent in IRQ
handlers and time spent for hypervisor housekeeping tasks. Those time
spans needs to be deduced from a total run time.

This patch adds sched_get_time_correction() function which returns
time correction value. This value should be subtracted by a scheduler
implementation from a total vCPU/shced_unit run time.

TODO: Make the corresponding changes to all other schedulers.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/sched/core.c    | 23 +++++++++++++++++++++++
 xen/common/sched/credit2.c |  2 +-
 xen/common/sched/private.h | 10 ++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d597811fef..a7294ff5c3 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -974,6 +974,29 @@ void vcpu_end_hyp_task(struct vcpu *v)
 #ifndef NDEBUG
     v->in_hyp_task =3D false;
 #endif
+
+s_time_t sched_get_time_correction(struct sched_unit *u)
+{
+    unsigned long flags;
+    int irq, hyp;
+
+    while ( true )
+    {
+        irq =3D atomic_read(&u->irq_time);
+        if ( likely( irq =3D=3D atomic_cmpxchg(&u->irq_time, irq, 0)) )
+            break;
+    }
+
+    while ( true )
+    {
+        hyp =3D atomic_read(&u->hyp_time);
+        if ( likely( hyp =3D=3D atomic_cmpxchg(&u->hyp_time, hyp, 0)) )
+            break;
+    }
+
+    return irq + hyp;
+}
+
 }
=20
 /*
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 34f05c3e2a..7a0aca078b 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -1722,7 +1722,7 @@ void burn_credits(struct csched2_runqueue_data *rqd,
         return;
     }
=20
-    delta =3D now - svc->start_time;
+    delta =3D now - svc->start_time - sched_get_time_correction(svc->unit)=
;
=20
     if ( unlikely(delta <=3D 0) )
     {
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index b9a5b4c01c..3f4859ce23 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -604,4 +604,14 @@ void cpupool_put(struct cpupool *pool);
 int cpupool_add_domain(struct domain *d, int poolid);
 void cpupool_rm_domain(struct domain *d);
=20
+/*
+ * Get amount of time spent doing non-guest related work on
+ * current scheduling unit. This includes time spent in soft IRQs
+ * and in hardware interrupt handlers.
+ *
+ * Call to this function resets the counters, so it is supposed to
+ * be called when scheduler calculates time used by the scheduling
+ * unit.
+ */
+s_time_t sched_get_time_correction(struct sched_unit *u);
 #endif /* __XEN_SCHED_IF_H__ */
--=20
2.27.0

