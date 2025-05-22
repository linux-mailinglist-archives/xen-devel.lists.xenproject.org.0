Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A1AC0BFA
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 14:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993868.1376984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI5Nf-00089x-C2; Thu, 22 May 2025 12:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993868.1376984; Thu, 22 May 2025 12:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI5Nf-00087u-9N; Thu, 22 May 2025 12:50:39 +0000
Received: by outflank-mailman (input) for mailman id 993868;
 Thu, 22 May 2025 12:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yp15=YG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uI5Nd-00087m-Vw
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 12:50:38 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20602.outbound.protection.outlook.com
 [2a01:111:f403:260e::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aaaf327-370b-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 14:50:35 +0200 (CEST)
Received: from AS4P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::15)
 by AM9PR08MB6163.eurprd08.prod.outlook.com (2603:10a6:20b:2de::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:50:32 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::fd) by AS4P191CA0005.outlook.office365.com
 (2603:10a6:20b:5d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Thu,
 22 May 2025 12:50:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 12:50:30 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DU5PR08MB10657.eurprd08.prod.outlook.com (2603:10a6:10:51f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 12:49:58 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 12:49:58 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5aaaf327-370b-11f0-b892-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DGXgiwJdyTNKFPplPIQUXvkXxZdRkxzXj/y2cFgobnacbNj+yAb1T8Ngg5FEjsytfhg10x0EDaiZBlg60ZOF37fhaHM+YAalYAk0erxJ+fL6okWviYdD0ymXab0vYa8pobHLoGAE32Vteojc8W9H3i/E820mCXsXcsJc1iLzEE5X1d98Nw2qb2cGKlsmxEFsdB7Bp/WZEtqIw7MWLBV4BDtpbcc3TjtrxtAdatBcOY3OiiPcch+N8nG2eKZfsLgaZJeAyqahbby6bUWrJp/xv3HBDvO/X72yp2l2lfy5x1w0aJbawBbO+G8vjl7MTiDWpWb5ne7IONqCoxsu3tp1AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAzyU6d9kX4RtXlRuczQHHpwxjnnsPMeEzp+de58qZA=;
 b=J7EbxDWHu3fDPuFzufXX9Yy3s2kmL1SzWr/d1mzquqxzxqgaCT60iWGvcKhkH/PH5Awbk7u7ycP5flZfQKg+rc5cePTaaoTPHahDpT4fuWZQ5GVQWocx/YMN9/fKvlrd8ZMfpi7W1qzGmMDuDsWPbD7Y8pWh4PpZp2zLTSkyYPoq5lWOO/XUW3fcxynOayFXO6krB5nDE6fyrAwPgodMhdLSF/rNnOvZqpzpP9g9uhYsoELgK4E4aHAC2LOUdOKRTZ9jzTvlh9xn7jP8FLk5mbZuVGhlZVjrrcbwwCYJgIwWi3CwC5u1Xw5asIrhvctAwWCfvDiQIgU+EzixuJlaqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAzyU6d9kX4RtXlRuczQHHpwxjnnsPMeEzp+de58qZA=;
 b=fvjFwfxm57p1ctJqOYCVrDUJoTSYs2Wp/O9B09s347nwnCyvQpRWnrP/3f7z1yf9ONikgRPxS25xxzUxguz0CpoFCKuoD7lgXnnpAWMMZN/77XNq46N2ZuSdVukFR4va2oPyvJ/0b8unmhsvba/lzZizCo1WinIHTKndrJ7f8Xc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfafZ3Zh35X763bbtIWsqZqrTG2sa9bJd2jP6y0hnQbBb4pX+TLqZtXdmLt1pL4mpu2Xaagi1lQTuwjCA3nDm7RjnJ82LIg1czUgtfYjLS+15z2GCNLWLr7FfkdlM2HXx39V8afOQTJfK9aK5gxUK5piGWvHm3wDlNKmvIYNw7tGbyweVTUYfsCoaya5ZaO9i69y8M87l/WObLNqPGdDqVbgObqYC1g6E8Eh8CEk0oTd29NeeskisVVfk3bDXz9SRmEqEJCvGnRAfRvxRCzOEP0t4dRlTWCNkKXoa9SoGQ0TTuwbwlveViHiEz1AppAfUqxRji0Bx0qjKQDOOVWzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAzyU6d9kX4RtXlRuczQHHpwxjnnsPMeEzp+de58qZA=;
 b=RWumEsMi057NGjCEOtL+1aEomaz6Q1q1ZJJELqZiERDmvE5iZSD0E/AqA9ZJhHHy+Q7cqQp2j2M36vFpIgQMivR5u6EgH3mcmPx7FA0T9cv+F/4ZOGRwGlphe+JF4iYFvWonkINZiLPcmSq3P4nL9LfrUUY9vrvDJTpE1BfqYCqtpsDx9F6CFTmupJ1TsPCF+KPYVjeKPIiPG08hLtCWSX8T/jPd3aBgOLxd+LiTTJBIuMd5yVlXdHjiDllVXFPhZVlAzZxYqgkXUNQZ2Crrxp2SXvYOAtB4GmnKdr0nA7XSEcCEiRWQu0GtglhWdj1MiksLrU8S6pnAK1aF0v0eCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAzyU6d9kX4RtXlRuczQHHpwxjnnsPMeEzp+de58qZA=;
 b=fvjFwfxm57p1ctJqOYCVrDUJoTSYs2Wp/O9B09s347nwnCyvQpRWnrP/3f7z1yf9ONikgRPxS25xxzUxguz0CpoFCKuoD7lgXnnpAWMMZN/77XNq46N2ZuSdVukFR4va2oPyvJ/0b8unmhsvba/lzZizCo1WinIHTKndrJ7f8Xc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 6/6] arm/mpu: Provide a constructor for pr_t type
Thread-Topic: [PATCH v5 6/6] arm/mpu: Provide a constructor for pr_t type
Thread-Index: AQHbw+N/uOYJE2XMKkGQJY+Wc9WWnLPebdYAgAA6SoA=
Date: Thu, 22 May 2025 12:49:58 +0000
Message-ID: <6D22B504-4D83-48BD-8679-CB68DFE444E7@arm.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-7-luca.fancellu@arm.com>
 <dfbac65f-ed9d-4118-b6d3-238b075961ba@amd.com>
In-Reply-To: <dfbac65f-ed9d-4118-b6d3-238b075961ba@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DU5PR08MB10657:EE_|AMS1EPF0000004A:EE_|AM9PR08MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 53006085-671c-40e5-babf-08dd992f3c51
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?q4yI1v/Rr2JWRWY+8v2N8gncPabGhxR8GSSb/4TNRNy77Q5KncmHlmGdaYr8?=
 =?us-ascii?Q?4q3eplaO+Frnksp5ldvYURwTnxksKpfPlTNVda5eBuurHhyxa57cBLJTzsKG?=
 =?us-ascii?Q?jX45RD7A2M5G5xJavc9E6udhv/j+3KjBpiPBD5XBWvlaYvblUrpo7NfkcOKf?=
 =?us-ascii?Q?5tCeGi4nclMd+eyK4HhCMWY3883bVF8Ucza5eFb1uQ4oHGy6v3GN0dyM2pwa?=
 =?us-ascii?Q?KL5xTqLEq08KxcT/BDKoewNqHBXMtCjl9vZkQXpLSajeueFMFmpTk0OQArd0?=
 =?us-ascii?Q?xuM6Yp8v9keqWDRTNxKENepvaPGLnhbPqSAUXehzLaabZ2vfJgc0ZPcPgTav?=
 =?us-ascii?Q?//zk6bPIEzCrr/qhQqWJolaXRid6Z4gQtKmW5nVCI3dL9+cPU/2wCYb6ulfY?=
 =?us-ascii?Q?OXUvWXWgMuRExqyz6Z8IVKHuBOANnG8b9pcq0ReuYuKTlW2QhXfpFdXoqhas?=
 =?us-ascii?Q?v+ArQqcf0IVIuCLplH2mqtoj8egTDU4pzZFKIxwHzLechdDOQGeOHBpcN9pC?=
 =?us-ascii?Q?x9hpeJeZpjDbPDcPoeVlJxUPUVSK22gzdwJQOZkt4kjxxvgMZSLGrXan4rAB?=
 =?us-ascii?Q?UiAnu/UncdJQ1Ob4/HMSBngzU8ZjYonA0GbHQ9bsrffDIjBogn31bcy/O7tL?=
 =?us-ascii?Q?+b8SAhVM+g5TZ5suPXlbgluH2kJUnoI3eflsxLg9YbitZRzFgPH0V5/NPpN8?=
 =?us-ascii?Q?VcEH3duvtbndoBjyZ4IqORyxsVHTC0hBNCQP3vc79v5cQD0SwPZIfK36wLcW?=
 =?us-ascii?Q?9UmfEKYPEwniGNAWtnkgtg9wAZ+Lg30TsvmjGsjcEQMiiE/l2UmCqcHO748I?=
 =?us-ascii?Q?3SIKJUdUl449ZB25jt7BqlNvMR76PmErqcYX47bJVPWNIcRY1sYQpkcri4s0?=
 =?us-ascii?Q?Fhvg2YRqLg/EERmMWtIDo+XmCCQTz7KY1irNNJTdf0dLhH2HKB2TgH/8WSYx?=
 =?us-ascii?Q?q+2lIEYNjWnb30LuIGVPEw1ypVDNjXT/lNvifzdUKm+5/MVks77ckimpOQAQ?=
 =?us-ascii?Q?QyzUrEDH8inXaaw8bjXQqTpWm4k27jf3S1aS9bIMBOHDtn/fJjFl5g/BtH/O?=
 =?us-ascii?Q?y2ciF2l9EgP/Luz7cP2JSjLihn6Q/RVZsj8ufTMK1wCkmuyTkY9NFg6fazkW?=
 =?us-ascii?Q?/Zr8toRoB7CfGtatqylKvGFiNjB3BvoL3cm3EJD8OKo8NM8UaaoO1Ja/ApB4?=
 =?us-ascii?Q?DOWtDvyQccPxYPkEjK7m7YBvtVht0mQxCH1kKPVwNfYuDri9ZLTOb2I6l04V?=
 =?us-ascii?Q?fyZNX4/itKSblYX2AhcmD8LIqG9onXDqaWfkFlnsjSKLKWfFO63ogG7vheIn?=
 =?us-ascii?Q?qIrwC5tinnt+GIajlilWk4uU0YioBPOPEj6j++5T3qurdsMoRur2YoDD8OZv?=
 =?us-ascii?Q?8cVhQmKWV+b8xM1iHaZ8Kct5VWtkwbhsAR9OdEAw/WVeG25XvEDWUO+xzDCs?=
 =?us-ascii?Q?NuzK0DOBGR1sdybfw0AcE0SIkSR6YW28JDFcdw2XU9xmmfb8pQtNEQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5DE4A5145982874B95D2EB96C6C6CE73@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10657
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1c56268-320c-4abc-210d-08dd992f28c7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RFN6BfxZte1GTGkIoFCgHDjUnlDGenYtbOpApjE/Aus0d9ypiPwuf1+IAVFM?=
 =?us-ascii?Q?7C3wB2HGNdwBprwAwnYA2fqsGdi/g1zCCuIaQGB205A9jYJEU64uKc+8NIGq?=
 =?us-ascii?Q?H2IvhMwEdRUYPiofU8rrd4PCuuFThUJGyAA8iP58yN1kSrQtqKUwSSsfTz0F?=
 =?us-ascii?Q?4at9meq1/NixWDODBGRNh9Ie+dhpH7j51NyWMmY68reedDjHhCo+34Ht9mUA?=
 =?us-ascii?Q?d+ABa1+fbdVXMcPbfjQVUaBm3vxcw3dmmS8/kMxAjsD2ahhvTQMysA2wuuc5?=
 =?us-ascii?Q?H5yfk8a4MCol0foNESCwObLMMoHrzYlomVHzDeAnraYebZYWmmbd/aVUxb3a?=
 =?us-ascii?Q?o9EXeYPcNg+lfJUbFFPB8xwK+DIIR0gjs7ZjmsAZMqOS6mWFlGz3slHqd7Mm?=
 =?us-ascii?Q?tkb+R9JMTNfPXMi63CedINvQPk8Luf7M8DTjZbpWsSe8OTlPFp3xUi4JOnp1?=
 =?us-ascii?Q?b4UUCtDKUxfOFndMV4SNZrWOgzKMZVW9BbNOf8Ml7DqrQByTkQCBShIo9Ira?=
 =?us-ascii?Q?ObVZ+4/ClU9uHw/emXDNuIrTB71NGaFFP7qkdBxNNkmhSSKDSpbA8uKC8USu?=
 =?us-ascii?Q?BcJeW2wyydxNe909/0bl2+KRyQ6N/gewjFpp9ok2kNPNHsHRCLhPciN3BcRZ?=
 =?us-ascii?Q?mD5j7WYvuOlHtWkPAwFLWWlMMC/z7UZmvOS/UWGrQ2GtD1a/nt5ukrufBiE3?=
 =?us-ascii?Q?chod/avK7J7Jv6Gjqm2pkaIKU8keC9iz6wOj+PgGHvuGqb/M37RvglLWUI2N?=
 =?us-ascii?Q?5/oYlm4Fz6eN+GOsyyn63Hzl2OCdmbgWwWQS49ylh/Q5Tz0aNO1asLIjA2Bq?=
 =?us-ascii?Q?rLfZTvzrw6p1isYUkqdSQkBkaJz0M+rloUX/ji5QJEpEZg5i2JuRDXZikG71?=
 =?us-ascii?Q?CLB6qSWGioZPjqo2a6eiMIEZ871geeyEoHfbsdF3T/MOftNOqQc+ClbvDM6H?=
 =?us-ascii?Q?6gnUOR5Ch5sMHMtZ8jMVKeeceQyvyCcjU+UuNibAMAWAh87utJFkOONea99o?=
 =?us-ascii?Q?NBQ9AQCOBYZfE7Uprx1HWn88BJmroJpkoDb+97Nf11s8V4JaIGnb8vOhmYDw?=
 =?us-ascii?Q?VMlxObFIpoF6ZMKeE5ecW8JxqRIqLOxs3BfEalS/4rAbR1z20GiiuH7PF4r5?=
 =?us-ascii?Q?DuY9QedrOYPaBifhQgSCGiNPfAuilxvPmpJW7ufCmMUow1qJbgNcmpe9nlUH?=
 =?us-ascii?Q?5oeP5KDw6Qt4+2YFZAy6jDCO76IYPyycs9uYeZvN+s+1+AZtwfJTYIuglm4u?=
 =?us-ascii?Q?gu8Xp+8Wm1blTJyLGcVhUIM50H9fGiFNA2dlakr/ttgRZIX7EuSk6f688yJh?=
 =?us-ascii?Q?rNFnhwOST83Bs1pbRJbYLx8BkxvAGtucroP9InAEArhVAAc8MQoViLtMOoR+?=
 =?us-ascii?Q?Jq856KTc5Ds+Y+yBj0mG+k+qvyQ7DPi2Bvoz3Nffqn0Lt1wzGLQtuW25t8+I?=
 =?us-ascii?Q?pKsqiwLE8h+jkVACWFhEj11/shqzcRluVdwKyogI7u8DPeGyoHh15MGoZgnh?=
 =?us-ascii?Q?lXw+IauSHxK7nXKjEencLwHXzIUzjlDGDw/n?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:50:30.9895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53006085-671c-40e5-babf-08dd992f3c51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6163

Hi Michal,

>> +
>> +pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>> +{
>> +    unsigned int attr_idx =3D PAGE_AI_MASK(flags);
>> +    prbar_t prbar;
>> +    prlar_t prlar;
>> +    pr_t region;
>> +
>> +    /* Build up value for PRBAR_EL2. */
>> +    prbar =3D (prbar_t) {
>> +        .reg =3D {
>> +            .ro =3D PAGE_RO_MASK(flags),
>> +            .xn =3D PAGE_XN_MASK(flags),
> Shouldn't you also initialize .xn_0 and .ap_0 or you rely on compound lit=
eral
> implicit zero initialization of unspecified fields? But then you do initi=
alize
> .ns to 0 fror prlar...

Yes, because there I would like to specify that value 0 means Hyp in secure=
 world,
but of course if you want I can explicitly initialise also these two

>=20
>> +        }};
>> +
>> +    switch ( attr_idx )
>> +    {
>> +    /*
>> +     * ARM ARM: Shareable, Inner Shareable, and Outer Shareable Normal =
memory
>> +     * (DDI 0487L.a B2.10.1.1.1 Note section):
>> +     *
>> +     * Because all data accesses to Non-cacheable locations are data co=
herent
>> +     * to all observers, Non-cacheable locations are always treated as =
Outer
>> +     * Shareable
>> +     *
>> +     * ARM ARM: Device memory (DDI 0487L.a B2.10.2)
>> +     *
>> +     * All of these memory types have the following properties:
>> +     * [...]
>> +     *  - Data accesses to memory locations are coherent for all observ=
ers in
>> +     *    the system, and correspondingly are treated as being Outer Sh=
areable
>> +     */
>> +    case MT_NORMAL_NC:
>> +        /* Fall through */
>> +    case MT_DEVICE_nGnRnE:
>> +        /* Fall through */
>> +    case MT_DEVICE_nGnRE:
>> +        prbar.reg.sh =3D LPAE_SH_OUTER;
>> +        break;
>> +    default:
>> +        /* Xen mappings are SMP coherent */
>> +        prbar.reg.sh =3D LPAE_SH_INNER;
>> +        break;
>> +    }
>> +
>> +    /* Build up value for PRLAR_EL2. */
>> +    prlar =3D (prlar_t) {
>> +        .reg =3D {
>> +            .ns =3D 0,        /* Hyp mode is in secure world */
>> +            .ai =3D attr_idx,
>> +            .en =3D 1,        /* Region enabled */
>> +        }};
>> +
>> +    /* Build up MPU memory region. */
>> +    region =3D (pr_t) {
>> +        .prbar =3D prbar,
>> +        .prlar =3D prlar,
>> +    };
>> +
>> +    /* Set base address and limit address. */
>> +    pr_set_base(&region, base);
>> +    pr_set_limit(&region, limit);
>> +
>> +    return region;
>> +}
>> #endif
>>=20
>> void __init setup_mm(void)
>=20
> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20
> ~Michal
>=20

Cheers,
Luca


