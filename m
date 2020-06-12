Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C9B1F714D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 02:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjXTK-0007QC-9r; Fri, 12 Jun 2020 00:23:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjXTJ-0007MF-7C
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 00:23:01 +0000
X-Inumbo-ID: d4c65386-ac42-11ea-b594-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4c65386-ac42-11ea-b594-12813bfff9fa;
 Fri, 12 Jun 2020 00:22:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vnqa+hG5vBpP5PV2b7uIX+OWR91yp8O1vutZIGwzUvcUs722S8ipAWzMIpFsJmotvH+VFtOPsUmoFf8Xqndg7H8DHVLphgcWtrBSKfk0w9KLiLC25TxfWJ+drA6xbTcFev06X7LY3OjYvxQz7ht3FdfbcU5W7DJP9Cj6sV6jlsUncLVCZ2W9WriY5ny65zoMW1rSxOZwaKWKUL7yAm2E5o7WvXq+Eh+f/eaSo0h/ZM/NFTQ1zjSYdMKh+VdW0mYunXOAsUJhgbesV5UYk/S1u9Pu9H2OJ1VoQ+XEz6yb/ghAIsqsYjreJm5qH3iR82LCFWYfz/jaLCBW5v8CcroKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPxSP0GQhjiILc2BkcY4EKDjsGfYhx91tgpTPBpzd0E=;
 b=f3HvGdIATHStrX5gc1XIHNo09QVKiguk+5YXsR0WR2do7f8MP2HrbpeoKTb59yZ8JFIFJUO423CvOGX9/k4wB7P9jR6bS4Y09tNw/5ZAr0bV4BGVWfJzSFj/zbGjNvjHqiclsZ+zju5USHPmpR0uzvHgqHAt7HYlTie/Fbg/JrnVq6iTz79y8rZI7rB/UqbR0Fdw5gHUbLXlcdYew+H5Sp3tOBJGwVwsMApAXwjYNsPYfwy8sCQym67y9qoBias/UOntIqaD7J8gTUMZ79w14ABHV4BF2z2hAZFJIM8U0pTdt1IbTZr0hk3Numd7uz8Mknv96SQtdY7bKqgaCFc+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPxSP0GQhjiILc2BkcY4EKDjsGfYhx91tgpTPBpzd0E=;
 b=CJZu8c2VGLi4KiNmikSF9I77XgmqSKXjcnOFNqsk+6NWA1oYdyULczjbrNgIX62/fx5VXiWuY6BYj3sOim7sf4g8do1JYvmUl1/cf0R39aU4GUnTHCTkhzhJ/rz/xgiCJshxBWzPYzHooWXPv70PQLBR64Pg+p/80omFWn6ooY++vMFXAS362wODCKTKd0fB0LO/dNWIjKAdJeDMJN3gF0Wx68qk08Yao1tByz6DNvPe3mysp2qgyb6ADLVvct8jyqFV+ZXpe6FAsX7m9iZ8m5HzD8Gzf35qgxLXJHddbRfphpVWv9Y8kTn0Sj2oycJSmIT7gOT4npdApJG0tEkrwA==
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
Subject: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Topic: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Index: AQHWQE+Tib/gTK49mk6bUudd1VvXZg==
Date: Fri, 12 Jun 2020 00:22:37 +0000
Message-ID: <20200612002205.174295-5-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 23a7788d-bd81-4360-1a38-08d80e66b618
x-ms-traffictypediagnostic: VI1PR0302MB2654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0302MB2654AF1F47C33DA096A310CEE6810@VI1PR0302MB2654.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:185;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +WG4zCDKubqHVW8Wsa/b4Nt1wx9y59jcWALTg2ZV2P3zyhTI9J3GWnPGbDsCXruFJ50Sb9VsowieBaQdC7AKQEfGgyINj2aAUmpo3Pjs//BoB1UWKfmVOcDBOT7l/6gPhkyV/MKKkM6COFnuv/Xyj2rAwJJGn4yNA/P1vHsBr7q4UBj3zPLWJFAypWpQQWTrmiFxz1V1Ze2XiLeRIxZ8Zq+t57GNe7FphI7zB6mrV6D6470uLI81u5ArfEa3ZzAl4vSgMRvwTPHOAtGytJuKbjnq6ZP+UPtac1hzF1SPNvvi0Ew3gYfPZJcSbYiF8Hpe5TDZPO6ORkI3IDJoftW96A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(66446008)(64756008)(478600001)(66946007)(66556008)(76116006)(66476007)(26005)(91956017)(36756003)(8676002)(86362001)(55236004)(186003)(8936002)(4326008)(6506007)(54906003)(6512007)(2906002)(6486002)(316002)(5660300002)(83380400001)(6916009)(71200400001)(1076003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 0QYbbdXA4WK1wngTahjcoICVN1QSbFF3wx/kayfpEoemoIHHwaHVfVcDez3KBF/XxTOhCJFEtmK8N3IdQ5D0h+I24NIyV9BRMsnPD7QxhlYfOCdOvAuL9HZRCh8tvFM6PhVF5Y0iih2HLOD56GzMaUYzaWBDY6/q9WBlL7+xb5IORnGWb8PC8OV+tP1aZBGRTxsMVNoi2TUh8mnGG4zuzpnh5KvbTAFsFzbhXAyq/CPMbTkhYE4g47//gs2mjChYUurusFmXO0+pf4n/lEqVwRe36NEwgqbfKYvZzO4b3s8KuwHJUGcSeBWQS8yXalKrAC8V4jXoDZLJrxiEnJnUkWOaEAMzDlPzKjUuXQgqBRfpwgV4gg/9mA74CtvLWesmKv0P/hG9DUVtIBXKY27m5+F8hfK/A1us2bhKUTM6Una2yIBdgr/cYE6zCUYlerpOHXQy8fW+Cvr1j1A/+7Yjhn8T78ghHAUZt5P4siIZ2xk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a7788d-bd81-4360-1a38-08d80e66b618
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 00:22:37.2004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oUl+MaUevMcx4U4o4FvHJXKlzBRK1w6bNGAYD9sp1vGyIupugNLr2PZ6qmJk6wLxf2bTn4MjtG6wDs+fg6i0ZQCf4QYOv4InTbK9VnQ5iKM=
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As scheduler code now collects time spent in IRQ handlers and in
do_softirq(), we can present those values to userspace tools like
xentop, so system administrator can see how system behaves.

We are updating counters only in sched_get_time_correction() function
to minimize number of taken spinlocks. As atomic_t is 32 bit wide, it
is not enough to store time with nanosecond precision. So we need to
use 64 bit variables and protect them with spinlock.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/sched/core.c     | 17 +++++++++++++++++
 xen/common/sysctl.c         |  1 +
 xen/include/public/sysctl.h |  4 +++-
 xen/include/xen/sched.h     |  2 ++
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a7294ff5c3..ee6b1d9161 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -95,6 +95,10 @@ static struct scheduler __read_mostly ops;
=20
 static bool scheduler_active;
=20
+static DEFINE_SPINLOCK(sched_stat_lock);
+s_time_t sched_stat_irq_time;
+s_time_t sched_stat_hyp_time;
+
 static void sched_set_affinity(
     struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft)=
;
=20
@@ -994,9 +998,22 @@ s_time_t sched_get_time_correction(struct sched_unit *=
u)
             break;
     }
=20
+    spin_lock_irqsave(&sched_stat_lock, flags);
+    sched_stat_irq_time +=3D irq;
+    sched_stat_hyp_time +=3D hyp;
+    spin_unlock_irqrestore(&sched_stat_lock, flags);
+
     return irq + hyp;
 }
=20
+void sched_get_time_stats(uint64_t *irq_time, uint64_t *hyp_time)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&sched_stat_lock, flags);
+    *irq_time =3D sched_stat_irq_time;
+    *hyp_time =3D sched_stat_hyp_time;
+    spin_unlock_irqrestore(&sched_stat_lock, flags);
 }
=20
 /*
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 1c6a817476..00683bc93f 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -270,6 +270,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_s=
ysctl)
         pi->scrub_pages =3D 0;
         pi->cpu_khz =3D cpu_khz;
         pi->max_mfn =3D get_upper_mfn_bound();
+        sched_get_time_stats(&pi->irq_time, &pi->hyp_time);
         arch_do_physinfo(pi);
         if ( iommu_enabled )
         {
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 3a08c512e8..f320144d40 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -35,7 +35,7 @@
 #include "domctl.h"
 #include "physdev.h"
=20
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000013
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
=20
 /*
  * Read console content from Xen buffer ring.
@@ -118,6 +118,8 @@ struct xen_sysctl_physinfo {
     uint64_aligned_t scrub_pages;
     uint64_aligned_t outstanding_pages;
     uint64_aligned_t max_mfn; /* Largest possible MFN on this host */
+    uint64_aligned_t irq_time;
+    uint64_aligned_t hyp_time;
     uint32_t hw_cap[8];
 };
=20
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 51dc7c4551..869d4efbd6 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -717,6 +717,8 @@ void vcpu_end_irq_handler(void);
 void vcpu_begin_hyp_task(struct vcpu *v);
 void vcpu_end_hyp_task(struct vcpu *v);
=20
+void sched_get_time_stats(uint64_t *irq_time, uint64_t *hyp_time);
+
 /*
  * Force synchronisation of given VCPU's state. If it is currently desched=
uled,
  * this call will ensure that all its state is committed to memory and tha=
t
--=20
2.27.0

