Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB50CAED5E3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 09:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028879.1402551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW95y-00061w-Jd; Mon, 30 Jun 2025 07:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028879.1402551; Mon, 30 Jun 2025 07:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW95y-00060D-FP; Mon, 30 Jun 2025 07:38:30 +0000
Received: by outflank-mailman (input) for mailman id 1028879;
 Mon, 30 Jun 2025 07:38:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qu4G=ZN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uW95x-000607-6l
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 07:38:29 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35a6bd7e-5585-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 09:38:27 +0200 (CEST)
Received: from DB8PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:10:120::36)
 by AS2PR08MB9641.eurprd08.prod.outlook.com (2603:10a6:20b:60a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 30 Jun
 2025 07:38:22 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::79) by DB8PR06CA0062.outlook.office365.com
 (2603:10a6:10:120::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 07:38:22 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14 via
 Frontend Transport; Mon, 30 Jun 2025 07:38:21 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS2PR08MB9595.eurprd08.prod.outlook.com (2603:10a6:20b:609::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Mon, 30 Jun
 2025 07:37:47 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%7]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 07:37:47 +0000
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
X-Inumbo-ID: 35a6bd7e-5585-11f0-a312-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=E4qk3pESZtJMTpyTPBKewly0Gx0vAEGG734+al38ozisq41Q1hvtX86YiozqA/hPQXFIFavJFtcUBSGHlC+0g0PBNh55+2chPKKBX5nFMxNfevxQVh2G4feOsbJt6xVKjbiSh9LTrfODcj9XvnpBmo2hXp4wJfnoiyeAD26nPPI8zJZbil3kJijiz1oXe7dCaN4tJQQEq9EYaBVNDJ3RMfMJssyPiHljoVmhwQy/H5EzQwByuoFnQvdoQEV0NQJ2dUJMF5ZDL2V+4/sZdHrrfI6omc3e51MKXJmv2XtRFxa7jebEh1qotSvcLK2R11y2E9RV7UJEPB3v2X9CoKRUbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peA+UmPyEvP+3FcgYX5ahP2mIrSZxO78lzjDHiF/nqQ=;
 b=d53D2DKISqU47z9KaEeAXhHHq+qCb2sDCg7fSFD15JWGIgE5AYJL6y74SNI/hXqFtWSO4vwT9SG/95n1KErpwYGAVSvP/D+hhs37fhJrMbLYnnh8XvEVAV68IORyPAK5Mldqwppx7sNLEpdIbIoMk/Z4tgE5vlPe2b9WLBJ+tEE+YCkN8YsYLO75NzPPxF+jbWguIQf8uJdTbfNZy4vCuM5jfyyy7hWiJH1puvA+C6ZHzlmb9cOwDOPkN8URSCNOwsGnyRJt9sUhgLCgh2lmol3X4Oy8hfb2ZFT30is01t+mNtiZKdcZGS6PknmlmMgINcNZZy0mD6vtuBLk0fo6ig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peA+UmPyEvP+3FcgYX5ahP2mIrSZxO78lzjDHiF/nqQ=;
 b=ji6FZxSQLzdCyemPagk5VtJH5dDBKExaEYVXdpS5qP3JZPkTY6IKmAh4FSgQKGxK9ZtC0DS5bxPaAqp15NKg81ehdAA7hHhl3sRdgR0vv3/wF0+b2ulQEvtv8UQbtajfI2dmb5OSicp0MH8/gVcYm3Z04Qpc8gVUSdzz+cXySWU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBNLxhBlqsLcIO70KxOhP0EDi7XMerwNMFWNWM1NNLgnTrXMC4qkt/AVWC20owZl1KYrjEwWfqHMn8o0VQERhXvECSVMld/5BS5qSfG+pvsbaQ/7VbZb9MaytdMU0NcbXsIDR8Gbb0HlkyjClN3U2zZ2ihDotqMMxUKgUzAWsAmUfSHv9K+NQk+AnTX6PtGCmfHANqO6WHHqU2st/6SOrTVENfPcY5+9TYdTK82clgNf6OUsgHCEeQCqeWArW5A+HwFG+ISvjjR1Y5k/Ok9h6ehxYQMG894l1OoBWsjLT/2ZnyHgTKyMuMiNUmk0E9ZIrJlzpWgGCNLHqRXa8JGReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peA+UmPyEvP+3FcgYX5ahP2mIrSZxO78lzjDHiF/nqQ=;
 b=tScdID4/gsQPRt7dqUtx0aWnbs0aJNnmQYmkiVbqYFPpyVCMo+kEbbP/Gz+262XHjhUj/T+grbi8JpRh8YQgddsK4FkrJafXpfJxfcDZrZtKIMq0U1g1BWDPTAMOyD4P8HL4AWxDRyXLkbcZtN3Ecm43m5l8jg9V6wfQXhPKq9PCzgcGb2Zkiw7Yw5f2MnHicjEfNEMK8xKOrLuliUm1F03mvNMa65pYwwIdLeEdH2rYx+0KDoNrnOm97IHlR+8vQISXnjpf04pmQIxVKZcUhs7yo/vzG0HYqukf3g8jhMXOLTsizaoF65tGIS9hgTz7Eh11E3ZkQW6uA/5fp5i/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peA+UmPyEvP+3FcgYX5ahP2mIrSZxO78lzjDHiF/nqQ=;
 b=ji6FZxSQLzdCyemPagk5VtJH5dDBKExaEYVXdpS5qP3JZPkTY6IKmAh4FSgQKGxK9ZtC0DS5bxPaAqp15NKg81ehdAA7hHhl3sRdgR0vv3/wF0+b2ulQEvtv8UQbtajfI2dmb5OSicp0MH8/gVcYm3Z04Qpc8gVUSdzz+cXySWU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Fix booting hwdom/1:1 domU with
 CONFIG_GRANT_TABLE=n
Thread-Topic: [PATCH] xen/arm: Fix booting hwdom/1:1 domU with
 CONFIG_GRANT_TABLE=n
Thread-Index: AQHb5bnKrH6hbt4bekO2oCqePGx44bQbWCiA
Date: Mon, 30 Jun 2025 07:37:47 +0000
Message-ID: <1EF5D001-222C-4FBF-BAC1-FA1A2D4BFCA7@arm.com>
References: <20250625101230.49653-1-michal.orzel@amd.com>
In-Reply-To: <20250625101230.49653-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS2PR08MB9595:EE_|DU2PEPF0001E9BF:EE_|AS2PR08MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f72e087-ae4d-48b0-674e-08ddb7a916e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OFRXVnlteCtTTG4wTmFlUHJITG5xQTVGVWRUNGYyblhyS3NpTUN4RnlPcytY?=
 =?utf-8?B?d0ZSblZDYXczU0JZQUxMdU1WemgvZXI3RFRiOVpmU2JrWTZwM2tHa0QrcTN0?=
 =?utf-8?B?UHU0TWM4ZWZyTFBZWkNkWEZWa29FVmRldGxBZ20raXBvUmRWWWJCZ0cvT1Bu?=
 =?utf-8?B?VFZYdnJWc3FsMkR1eDdiUHYyZEdJN3BLN3o4WjBZVTJLd01vVVRIWFZMb0VU?=
 =?utf-8?B?aGljNCtBSDcxaU1EUU1kYkJtTE16Q3ozWXJmOTZVcWkzeWRUdFhSRDBSSzRM?=
 =?utf-8?B?MTU2NG5zVHNmSkdIazgycVpxcmd0TEN6T0pINUEyWnRlMW5xUGFHOW5QRkNZ?=
 =?utf-8?B?YnVWZ2N2ek1vWHdocHBjUWljUjdFd0VDYlBYd2pFT3VhZ2w4NmNIeURhTlU5?=
 =?utf-8?B?ajdOUXVBUy9MQVMwcUQ2MTZlZUJVTVZWQmFhY3BoeW5iVlZpL3R5eFRuc2lV?=
 =?utf-8?B?KzZ0blpuVjF0QjgyQlBMaXRDVTZPTWZLU0M5YU9MV0JCUWZ2U2UxNFBIK3Ro?=
 =?utf-8?B?QXBrS3hrQlpXVE82NHp5a2hFSllTQ0xsbTZkMGtYZWpLWWxXelZveUpLcFZh?=
 =?utf-8?B?SVJDOHlySGVCY2wvRzJxQWZPQU9KVzc3T3prMVVRZWJ2VzFSc2VMOTgxMzZE?=
 =?utf-8?B?ME9OZmlpd2JCN2F5c3JNaVV6dGhzNW1IbHIyb1N3cFRtVCtvVEVPb0ptV29O?=
 =?utf-8?B?L0E2TVBrdzdSQXd3Nkx6NU96V1I3T1lMVEwzN1ppcS9MTlo1eGNIVXpqMmo1?=
 =?utf-8?B?NWJOZTVCbm45UTJoa3RUNnlzeFRqOTRHRTJaT3NqcFJremRPU0gzR0xJS1Mz?=
 =?utf-8?B?cjZkWi9oMzVQTUtkRzN5Nzl4TERyWWp5Y1RoTk5Sa1JuL2QrWlFzVmRqRjc0?=
 =?utf-8?B?eHdGaWh0NEVJRlpCWmY3ZHFsYW01SWNhVzhyUXR4dmNLbkVoUHFNVzFQNSt2?=
 =?utf-8?B?eEN5MEdyNU9oSStQQVUwY0UvZnZScWd5K1B5aXBuVmR6TmZBV2ZHa3phNmRy?=
 =?utf-8?B?dWd2MVprQytFNEtnNnhDMjEzQ25VTmRtcWczOUtlM0d1V1BxbHkwOEhsdWFa?=
 =?utf-8?B?dFlWTmM0QmgzbS9lNGRvNi9qZEpHT2RqMUNMZTdXTE9HWVhYZkFNTmt6U2Zi?=
 =?utf-8?B?V3pXejVrdDcyV3NnRFMxYXI0SlVKL2o1ZEowUEJqUytUT1BMRS9IVzExbGJJ?=
 =?utf-8?B?MDJuK1lRWHRXY2lFbEtFVTNPbUw1NVZzaGpJQmlTOEw3V25zREQvRUtBZFNm?=
 =?utf-8?B?Rmx4WHlGTzdnWEthOElNYk5SMzBXclZWeFlzZVQ5UkhRb280aytZOVBEQjVL?=
 =?utf-8?B?cHA2elNYc0gyMDhDMGJOSzQ3dGhpSW1EWjd1Q2IxK2VGOUJDYlF5WGVqZkY4?=
 =?utf-8?B?dnBpWDBzY05rOFdtM3o1RXl4QWprY3MwRlBpa2NsVlZOM2pzSXM0U1Z4bXor?=
 =?utf-8?B?QTVweGV3RDdia2RhUlZTZFVSSUE0RjNMNmJmc2xDa0l2QkhHeENYV2tIOHNN?=
 =?utf-8?B?dklOV3NycEZnSTVieDlyMUFZRlZQL1VnUi9EQnpvYVJSd0tyM240VmFyaXdm?=
 =?utf-8?B?VHBZQ1A4RDJrSzJMZjRIRU9ZcHpKdzVxY0NuVWNiZ0czUDMzUkdvVTVpem5q?=
 =?utf-8?B?Vis5eElIeCtJd20vQ2w2clRnNENySjRnWjFxeG1CMkF5Z2NFZlJuOUlCWGY1?=
 =?utf-8?B?VVRXdG55ZzhjR01wTkt3dmc0K0Z5UHRHY28xekNlOWpncGtOZTMvRTRJdG1D?=
 =?utf-8?B?TWVHV3pNaFo3K0lLaEx6b29HWWh3eU9BNGNhQ1dtdDc3QzRZY3ZmT0szTUM1?=
 =?utf-8?B?bWxjS3pMOW5zU3hUdlpEK2trT1o3MG5DMkhwMkRuWmVKTUJaTnI5TXBDNlY4?=
 =?utf-8?B?dDFPa0hTNXdSZWtxR3F6NTUvWlNvUDdDdWRqMFhiZWhLQWJPM3o3Q3h2SW0r?=
 =?utf-8?B?Q3hQVGRWVUpqRkVPSWVyYUNWWnVlRWRTTEpKZXZVZXdQcyt4S3dRSUtpOFM1?=
 =?utf-8?B?V1h3VzJpSjlnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB11C089D723364589376BD1BFA8FAB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9595
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c97924ed-9276-4fc8-407c-08ddb7a90286
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1F4V2ZmSUJFektRZXJIa25FL1J5SlBneUJTMGpFMVIweXZZemc4QnhIS2Nx?=
 =?utf-8?B?Z21XOVBqUFMvS1dERFlReWtyK3l6ZUF1UXpaL2JSZkNjRWtjZVZweU5ZZG5Q?=
 =?utf-8?B?M1hzeHZRQW80RXZEUDllVXhYaUtLV0k2bHpNbmNPcVVhVU12cm9ybGhGaVpE?=
 =?utf-8?B?K2M2NXRjQVJkbUg5U0dDYVhOZE5pTDFqcUE2WGFEbmVTWVNMVWNjbTQwME5J?=
 =?utf-8?B?cldpTit2ZmJQRHlvMVNTczE5ZU5SNkJoVFBqQWxMUzB1L1B3RTd2V1ovaVU5?=
 =?utf-8?B?cjNvWUhleDNZRFBZQ3dDMVIxUzA0WWpWSmxNSGNNL040TkZNeTYvNDJJYUpj?=
 =?utf-8?B?YUNVL05UZTdiYkJka1ZySVZlVmJtK0ovcXdqWWpBOHI4R0s4d2lCVUxZbmhK?=
 =?utf-8?B?ZndQWFkwY3dhY21CdFNRUnIwb2wwaE1QZE5lQmdnWFpxeTdXVGVzNHVjYkFv?=
 =?utf-8?B?dDRlN1JXWTF4b2RSV3lPME5acit5YjZSVlU5YTV0YnZ4ZWp3SU1JQkhPZTFB?=
 =?utf-8?B?L1BPMU9oZmhFNEtjN0tRc0xhcWlDdnExdnNqYmszdThadWYyd0dUeWZRVHdq?=
 =?utf-8?B?SzVhU0FmTWhrR2lNWjlScE1FRWNPdmZneUY1Y3NIcGtYYy83RzFNWGJHU1Z4?=
 =?utf-8?B?OEp2TU51ZGpxdmo2MU01Zkx2ZGFrSnpUYkRUM29FRG1TQ0xjd0pvTHI5VitO?=
 =?utf-8?B?c1JKMEJyU0E0dUNuWnJlM1dvTFR3a3VDMWk4NHRPL1kvN2lKMGw3QnNKZ3lS?=
 =?utf-8?B?cUYzYTJGdldZT3dlTG0xQjFBdmQveEszQWFpb0tpODNWTUE2OG52eHhhQ1ZV?=
 =?utf-8?B?TEJOR2x6aEM0NmppRWFkNnVKdGVwUUJmT0xXZkY0bCt6ZkhPTWJ4aW9xYnJB?=
 =?utf-8?B?bFRnL285YlhOMUN1Mzd1Z0JLL2VFelFjRVdyUjlMRGZhb05yTmVMd3o0ZHQx?=
 =?utf-8?B?c2hZWXh5NFhrMFFGY2dUVU5MdGtjeU1ESVFjSXdTSmNmaDR4cXlIZGdRdXJD?=
 =?utf-8?B?SDIwTEpVUVpzQ05ybmg2QnRsOU1iZzB5bjV6SjRoYTR1ajRQZWhveWMyS3B6?=
 =?utf-8?B?UnMxdnd1K0EyUTZJWHVkTytRMUh6eTdmeW9sRTdkaStNdmxUV1YyQ1RvOEp6?=
 =?utf-8?B?S1NWS2RqQ2tKcDY5NGE4NXB0azJXbzhvc2FaRU4vdG5rTFI2MFVnUktCY1k2?=
 =?utf-8?B?QSszVXNEQU9rL1U4TkpHOWxodVJmUmtkRC9wM1UrY2pGb2lNTEFWQXBzNi9w?=
 =?utf-8?B?dGlNaDl4Qy9wOEQzZnRURW9OakFCMXprbkhiVWoxNjQvbk9zY1U3ODZtRGVT?=
 =?utf-8?B?WkI3Z0pWYjRKamVXR0JRcVA4YzdKM24vL3VvZkQrV3JPWGJMRnJYRFQwMXpI?=
 =?utf-8?B?aDRpVk9EM3FYL0w3TWRjdlQ1dVIzZ2tIZmVWaDJnamtRbGNLb2EvRndxampY?=
 =?utf-8?B?eURlWmxsYnFac2pORmRQMWdqakVjeGF4end5cmN2Nm9vTkpxS3BBOVlweXNh?=
 =?utf-8?B?ajBnbXhqVkFITlcyK2pZVDFSUFRhTEhzRStkWHc3SmY2MUZIeHN5NlU3ZXd4?=
 =?utf-8?B?cU5RYzM3NDRNcEt3QzNjRzdHZmx5RDdON2VxNWFpVnBocDArVDVXeHB5d2JR?=
 =?utf-8?B?SnZzeldwUjVxeE9BODZpNmwzbVBLVGNQUlBkZ1JKSFVrWFcraUJZc0hMRXB4?=
 =?utf-8?B?UkJTMFBrZlY5NDB5cWxRRnJFQ1FZbzRuK2ROQmN2Mkhoa01mZDlHTTVGdDdD?=
 =?utf-8?B?Y0NYTTBYOHZVZFdlU0FxS1R2KzV5T3Q2WGY4Y0RnK1ZvaTEydEFzUHI2b3Vs?=
 =?utf-8?B?V0t1dHk3S2Z4U2Q3L3Vhb21Vd1Z3ZjVWeUdmK0VJQjM0ai9vbkRzbmtHQUF2?=
 =?utf-8?B?TU9yQlYvL0FhZFJoUWhZMVd2M3lQUnhoMzhnb1hDRS9ldUdNMDRnWW9CRm9J?=
 =?utf-8?B?NGtRRElRa3ZrTVpsL00wL1c1cHVTTTV5bkF2U3hzNXh5S2dPZlpJeXF0bW5t?=
 =?utf-8?B?R1BtTWVMc2poV201M0kzc01ZNjA5MDhZYzIybUVaVCtaZmJndzEvaHJjYmlW?=
 =?utf-8?Q?iY/cjt?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 07:38:21.6930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f72e087-ae4d-48b0-674e-08ddb7a916e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9641

SGkgTWljaGFsLA0KDQo+IE9uIDI1IEp1biAyMDI1LCBhdCAxMToxMiwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBBdCB0aGUgbW9tZW50LCB3ZSB1bmNv
bmRpdGlvbmFsbHkgYWxsb2NhdGUgc3BhY2UgZm9yIGdyYW50IHRhYmxlIHJlZ2lvbg0KPiBtZW1i
YW5rIGFuZCBhZGQgaXQgaW4gdGhlIG1lbWJhbmtzIGFycmF5IHRvIGZpbmRfdW5hbGxvY2F0ZWRf
bWVtb3J5KCkgdG8NCj4gZmluZCB1bnVzZWQgbWVtb3J5LiBJbiBjYXNlIG9mIENPTkZJR19HUkFO
VF9UQUJMRT1uLCB0aGUgc2l6ZSBvZiB0aGUNCj4gcmVnaW9uIGlzIGVtcHR5IGFuZCBhc3NlcnRp
b24gaW4gcmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKCkgZmFpbHMgd2hlbg0KPiBib290aW5nIGh3ZG9t
IG9yIDE6MSBkb21VIHdpdGhvdXQgSU9NTVUuIEV4YW1wbGU6DQo+IA0KPiAoWEVOKSBBc3NlcnRp
b24gJ3MgPD0gZScgZmFpbGVkIGF0IGNvbW1vbi9yYW5nZXNldC5jOjE4OQ0KPiAuLi4NCj4gKFhF
TikgWGVuIGNhbGwgdHJhY2U6DQo+IChYRU4pICAgIFs8MDAwMDBhMDAwMDIxOGI1Yz5dIHJhbmdl
c2V0X3JlbW92ZV9yYW5nZSsweGJjLzB4MmQ0IChQQykNCj4gKFhFTikgICAgWzwwMDAwMGEwMDAw
MmI4MzcwPl0gZmluZF91bmFsbG9jYXRlZF9tZW1vcnkrMHgxNDAvMHgyMDggKExSKQ0KPiAoWEVO
KSAgICBbPDAwMDAwYTAwMDAyY2MyOGM+XSBtYWtlX2h5cGVydmlzb3Jfbm9kZSsweDMxMC8weDdl
MA0KPiAuLi4NCj4gDQo+IFNhbWUgaXNzdWUgd291bGQgb2NjdXIgd2hlbiBib290aW5nIGh3ZG9t
IHdpdGggTExDIGNvbG9yaW5nIGVuYWJsZWQuDQo+IEZpeCBpdCBieSBwZXJmb3JtaW5nIGNvbmRp
dGlvbmFsIGFsbG9jYXRpb24gYW5kIGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQpUaGUgcGF0Y2ggbG9va3Mg
Z29vZCB0byBtZSwgSeKAmXZlIHJlcHJvZHVjZWQgbG9jYWxseSB0aGUgaXNzdWUgYW5kIHRlc3Rl
ZCB0aGF0IHRoaXMgcGF0Y2gNCnNvbHZlcyBpdCwgdXNpbmcgRlZQLg0KDQpSZXZpZXdlZC1ieTog
THVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KVGVzdGVkLWJ5OiBMdWNhIEZh
bmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg==

