Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD21F714F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 02:23:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjXTU-0007VO-TM; Fri, 12 Jun 2020 00:23:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjXTT-0007MF-7V
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 00:23:11 +0000
X-Inumbo-ID: d4c65387-ac42-11ea-b594-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4c65387-ac42-11ea-b594-12813bfff9fa;
 Fri, 12 Jun 2020 00:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1FRzIwqi8MaiPpQT0ukz+r83Mutf9qp8uoEL+e+gOb8FaYY5jZIsqJ1hyPwyNwn0mQCfz7AV8cCKNrg/tQ3lavNSYPbgn0g/yw0aG6Ww8CBY2Il6KU82KvDMwSemkPBqlWgLVOQotkjqNT7t2+m/nqwt0W5rCPwdv2JyEqeii4thZOW6D/iTJrQto2KSWCK4n06IzMNgFY+6NykQOeI54QWWU83EV6QqzFZAJGPM40N+lnHKofjrAwJrqRSoJrPSka/g/Von1fzZjuwIR6HKPMDmRaDCuZ50s34WbkDDlxps40x2TtLUvzBVwOxQOhVibXvrsS4H08LkzKD0Ydpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFyM2tlxS7owCAmfGeZffNBhcSzmXAb+/nDqdHLXNkk=;
 b=oaNEtKE5HJNls9cu54vmsDZRK7MKwPdSlk80tAUbUxgHF6wLbf+flJ98CICp34Web5aYB5C9WP49JLtiP8EFJmtrA5qvCyx2GhwSQRjYLhfUSvya1BrZVmFMvdJ/+nmcsdcn8DzRLm3O9rstH6xa2FmGaLwE5l/EQBCgUdqNSwxg7HRJuUkt6AxkbfOMHoPVIh6vnTbjEQw1Cmfg4FrifBKIIv3nBZqUf5fyRtIrR04NeENHhdCriL+gReDVOR7ghJRQl7oNeDK8kyw4S3NWaJf4wgskorzoHFz2jwT1jN4gjNfKqojt145PDjwgM4ramDfAsccFghSm64dmq48f4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFyM2tlxS7owCAmfGeZffNBhcSzmXAb+/nDqdHLXNkk=;
 b=WzoUUqUw+unQHvd2hdNvqdrgF/zIn4qwUTzJ57vReEYJNnijL1FgGRQp29JYmD/MKcbS4x106pzbxQc+I6kN3rADJ73uP6LMns1PDKnBeNQA+lBc5HJuzdRdvD6M6KzrioCjTXAPXTQIvaT4E6cLffq0p+hZy6NDeawSA8JBg0CMcuP5dij8dBm0LlrJrwrgtwINi75bm0+nAfAFBTfhb8keo9fnmNuDZ33xYBCOVQddrmhWeGBu/i9TZcGRZlFwEgWK2dpMlb6OjeluoGFsGR2Y1DV6lQwZlWeCXJyZiH9YnDCSjWsDmYUYtv6079Ejul3Pga3CIphWa4yFmelbAw==
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB2654.eurprd03.prod.outlook.com
 (2603:10a6:800:e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Fri, 12 Jun
 2020 00:22:38 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3088.018; Fri, 12 Jun 2020
 00:22:38 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [RFC PATCH v1 5/6] tools: xentop: show time spent in IRQ and HYP
 states.
Thread-Topic: [RFC PATCH v1 5/6] tools: xentop: show time spent in IRQ and HYP
 states.
Thread-Index: AQHWQE+TFzeBItaOmEyTKqcXTMXcTQ==
Date: Fri, 12 Jun 2020 00:22:37 +0000
Message-ID: <20200612002205.174295-6-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 26c3444d-dc48-4175-4685-08d80e66b64a
x-ms-traffictypediagnostic: VI1PR0302MB2654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0302MB2654A3A822998F711F51BC87E6810@VI1PR0302MB2654.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3dkx/YE7+OM4uMShWEMttf7KIAQGyTBPVYXYEeHruipcrBRvHQf9VqETR4nJBEaLvfkAvY2s7kzfc8qqQO5Bhv1J7h63hmeW3G5phOZQtLpnnYSffGyFgj9iWXcdsMyGk5Ulio6xVmVfvcXGgjFPbIi/EaQu1o/9SHwedL0DJ44sEfxP4YNiCjIH5ynU8RhPO9HEmsjCPfYDo5UXFtUkpQe/m+WK4mIlGlsyabk90lxsNgA9C0CQfivWaNvfbkgi1QpUiqyyicPKm1cKZ8vEJClhgwXx/6Q6k0DXFZbqoPAy4kJGB2OpvNne4sX5oaevqPt/FNmCIcCLQoSVArCwcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(66446008)(64756008)(478600001)(66946007)(66556008)(76116006)(66476007)(26005)(91956017)(36756003)(8676002)(86362001)(55236004)(186003)(8936002)(4326008)(6506007)(54906003)(6512007)(2906002)(6486002)(316002)(5660300002)(83380400001)(6916009)(71200400001)(1076003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: bi3L2Rd+Ypak3jw+nmFG5AZ45lMFpRn25AIGmlURXqVTKRIDpoP6nRhkIdXhMmGQnsfJhTQiS4vcH90gi7FBNng302CVEE9rkrPgGVhL0b/4d8nXOF5tor+YPsKaYNROyH5PslvM6parVWwFZwFUSgx/e7Fnu3ufkR7aUeMeNsMrfaiEluTpPW1YW/J0zO0HyBX2nNiJPvL8DoaqgyNalu5stGP7FrAF1Iq1hl0MLcoRP2venprQ/FkOo4q6d9yLBelV2zUeDa07Zb3dX8dSjMqtv9S5RwKZkVPXnD5IiN6fBCeCGrbaUylBZcT+4ky9TmtGNN9+aetnyVoeyxnS8osndmelFwbeYeq/dc1JSU5ufVrv3P2UiuiuMfnwLRR8RS92F6tojcju+/EF4yLc0h46/yUJsfHa7OMq0vwHeehaSSWU3PcKIqTr+e4eRzqcnVUG2SVi+yS3KBtrr5dk31Qz5f2kjh4/kHqsJoPrqB8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c3444d-dc48-4175-4685-08d80e66b64a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 00:22:37.5722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kWMZzAL8vjfN53DwivgmgDStxodDGbD9NN3vgiL0qtApBd5BRL1V5okhZx7HL9H0BU4SO8MS/1XiL95tHACPk9He7KDZEjgst3kgkwausnU=
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

xentop show the values in the header like this:

IRQ Time 0.2s    0.0% HYP Time 1.3s    0.1%

The first value is the total time spent in corresponding mode, the
second value is the instant load percentage, similar to vCPU load
value.

"IRQ" corresponds to time spent in IRQ handler.
"HYP" is the time used by hypervisor for own tasks.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 tools/xenstat/libxenstat/src/xenstat.c      | 12 +++++
 tools/xenstat/libxenstat/src/xenstat.h      |  6 +++
 tools/xenstat/libxenstat/src/xenstat_priv.h |  2 +
 tools/xenstat/xentop/xentop.c               | 54 ++++++++++++++++-----
 4 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/tools/xenstat/libxenstat/src/xenstat.c b/tools/xenstat/libxens=
tat/src/xenstat.c
index 6f93d4e982..30c9d3d2cc 100644
--- a/tools/xenstat/libxenstat/src/xenstat.c
+++ b/tools/xenstat/libxenstat/src/xenstat.c
@@ -162,6 +162,8 @@ xenstat_node *xenstat_get_node(xenstat_handle * handle,=
 unsigned int flags)
 	node->free_mem =3D ((unsigned long long)physinfo.free_pages)
 	    * handle->page_size;
=20
+	node->irq_time =3D physinfo.irq_time;
+	node->hyp_time =3D physinfo.hyp_time;
 	node->freeable_mb =3D 0;
 	/* malloc(0) is not portable, so allocate a single domain.  This will
 	 * be resized below. */
@@ -332,6 +334,16 @@ unsigned long long xenstat_node_cpu_hz(xenstat_node * =
node)
 	return node->cpu_hz;
 }
=20
+unsigned long long xenstat_node_irq_time(xenstat_node * node)
+{
+	return node->irq_time;
+}
+
+unsigned long long xenstat_node_hyp_time(xenstat_node * node)
+{
+	return node->hyp_time;
+}
+
 /* Get the domain ID for this domain */
 unsigned xenstat_domain_id(xenstat_domain * domain)
 {
diff --git a/tools/xenstat/libxenstat/src/xenstat.h b/tools/xenstat/libxens=
tat/src/xenstat.h
index 76a660f321..8d2e561008 100644
--- a/tools/xenstat/libxenstat/src/xenstat.h
+++ b/tools/xenstat/libxenstat/src/xenstat.h
@@ -80,6 +80,12 @@ unsigned int xenstat_node_num_cpus(xenstat_node * node);
 /* Get information about the CPU speed */
 unsigned long long xenstat_node_cpu_hz(xenstat_node * node);
=20
+/* Get information about time spent in IRQ handlers */
+unsigned long long xenstat_node_irq_time(xenstat_node * node);
+
+/* Get information about time spent doing hypervisor work */
+unsigned long long xenstat_node_hyp_time(xenstat_node * node);
+
 /*
  * Domain functions - extract information from a xenstat_domain
  */
diff --git a/tools/xenstat/libxenstat/src/xenstat_priv.h b/tools/xenstat/li=
bxenstat/src/xenstat_priv.h
index 4eb44a8ebb..d259765593 100644
--- a/tools/xenstat/libxenstat/src/xenstat_priv.h
+++ b/tools/xenstat/libxenstat/src/xenstat_priv.h
@@ -48,6 +48,8 @@ struct xenstat_node {
 	unsigned long long tot_mem;
 	unsigned long long free_mem;
 	unsigned int num_domains;
+	unsigned long long irq_time;
+	unsigned long long hyp_time;
 	xenstat_domain *domains;	/* Array of length num_domains */
 	long freeable_mb;
 };
diff --git a/tools/xenstat/xentop/xentop.c b/tools/xenstat/xentop/xentop.c
index ebed070c0f..aaeba81cd9 100644
--- a/tools/xenstat/xentop/xentop.c
+++ b/tools/xenstat/xentop/xentop.c
@@ -496,11 +496,25 @@ static void print_cpu(xenstat_domain *domain)
 	print("%10llu", xenstat_domain_cpu_ns(domain)/1000000000);
 }
=20
+/* Helper to calculate CPU load percentage */
+static double calc_time_pct(uint64_t cur_time_ns, uint64_t prev_time_ns)
+{
+	double us_elapsed;
+
+	/* Calculate the time elapsed in microseconds */
+	us_elapsed =3D ((curtime.tv_sec-oldtime.tv_sec)*1000000.0
+		      +(curtime.tv_usec - oldtime.tv_usec));
+
+	/* In the following, nanoseconds must be multiplied by 1000.0 to
+	 * convert to microseconds, then divided by 100.0 to get a percentage,
+	 * resulting in a multiplication by 10.0 */
+	return ((cur_time_ns - prev_time_ns) / 10.0) / us_elapsed;
+}
+
 /* Computes the CPU percentage used for a specified domain */
 static double get_cpu_pct(xenstat_domain *domain)
 {
 	xenstat_domain *old_domain;
-	double us_elapsed;
=20
 	/* Can't calculate CPU percentage without a previous sample. */
 	if(prev_node =3D=3D NULL)
@@ -510,15 +524,8 @@ static double get_cpu_pct(xenstat_domain *domain)
 	if(old_domain =3D=3D NULL)
 		return 0.0;
=20
-	/* Calculate the time elapsed in microseconds */
-	us_elapsed =3D ((curtime.tv_sec-oldtime.tv_sec)*1000000.0
-		      +(curtime.tv_usec - oldtime.tv_usec));
-
-	/* In the following, nanoseconds must be multiplied by 1000.0 to
-	 * convert to microseconds, then divided by 100.0 to get a percentage,
-	 * resulting in a multiplication by 10.0 */
-	return ((xenstat_domain_cpu_ns(domain)
-		 -xenstat_domain_cpu_ns(old_domain))/10.0)/us_elapsed;
+	return calc_time_pct(xenstat_domain_cpu_ns(domain),
+						 xenstat_domain_cpu_ns(old_domain));
 }
=20
 static int compare_cpu_pct(xenstat_domain *domain1, xenstat_domain *domain=
2)
@@ -878,6 +885,23 @@ static void print_ssid(xenstat_domain *domain)
 	print("%4u", xenstat_domain_ssid(domain));
 }
=20
+/* Computes the Xen time stats in percents */
+static void get_xen_time_stats(double *irq_pct, double *hyp_pct)
+{
+	/* Can't calculate CPU percentage without a previous sample. */
+	if(prev_node =3D=3D NULL)
+	{
+		*irq_pct =3D 0.0;
+		*hyp_pct =3D 0.0;
+		return;
+	}
+
+	*irq_pct =3D calc_time_pct(xenstat_node_irq_time(cur_node),
+							 xenstat_node_irq_time(prev_node));
+	*hyp_pct =3D calc_time_pct(xenstat_node_hyp_time(cur_node),
+							 xenstat_node_hyp_time(prev_node));
+}
+
 /* Resets default_width for fields with potentially large numbers */
 void reset_field_widths(void)
 {
@@ -943,6 +967,7 @@ void do_summary(void)
 	         crash =3D 0, dying =3D 0, shutdown =3D 0;
 	unsigned i, num_domains =3D 0;
 	unsigned long long used =3D 0;
+	double irq_pct, hyp_pct;
 	xenstat_domain *domain;
 	time_t curt;
=20
@@ -975,9 +1000,16 @@ void do_summary(void)
 	      xenstat_node_tot_mem(cur_node)/1024, used/1024,
 	      xenstat_node_free_mem(cur_node)/1024);
=20
-	print("CPUs: %u @ %lluMHz\n",
+	print("CPUs: %u @ %lluMHz  ",
 	      xenstat_node_num_cpus(cur_node),
 	      xenstat_node_cpu_hz(cur_node)/1000000);
+
+	get_xen_time_stats(&irq_pct, &hyp_pct);
+	print("IRQ Time %.1fs %6.1f%% HYP Time %.1fs %6.1f%%\n",
+		  xenstat_node_irq_time(cur_node) / 1000000000.0,
+		  irq_pct,
+		  xenstat_node_hyp_time(cur_node) / 1000000000.0,
+		  hyp_pct);
 }
=20
 /* Display the top header for the domain table */
--=20
2.27.0

