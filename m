Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5hXpHd3IS2rSaAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:25:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05597128A9
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:25:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=selector1 header.b=FHKsHWLB;
	dkim=pass header.d=arm.com header.s=selector1 header.b=FHKsHWLB;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=2")
Received: from list by lists.xenproject.org with outflank-mailman.1355418.1610193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglBy-000726-04; Mon, 06 Jul 2026 15:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355418.1610193; Mon, 06 Jul 2026 15:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglBx-0006zH-Td; Mon, 06 Jul 2026 15:25:05 +0000
Received: by outflank-mailman (input) for mailman id 1355418;
 Mon, 06 Jul 2026 15:25:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wglBw-0006zA-BI
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:25:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglBv-00AWuJ-8u
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:25:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a4bc8c7-5cb7-0a2a0a5109dd-0a2a4506dab0-20
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:25:03 +0200
Received: from [52.101.69.58]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a4bc8ce-08de-0a2a45060019-3465453ab87b-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:25:03 +0200
Received: from AS4PR10CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::20)
 by AS8PR08MB7356.eurprd08.prod.outlook.com (2603:10a6:20b:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 6 Jul
 2026 15:25:00 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::83) by AS4PR10CA0026.outlook.office365.com
 (2603:10a6:20b:5d8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 15:25:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 15:25:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GVXPR08MB11741.eurprd08.prod.outlook.com (2603:10a6:150:312::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 15:23:55 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 15:23:55 +0000
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
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IuzzCqf/3dkX8PA4X7zXKMbI22Nb0uUEufKddLQuiiG7AJBp76wPg72J2/CFV+C24pf1QkjjChTDClY8i3nKpbjjUa40DdFu7uVoZKiPiXnaaDWhbed3LBsSG8pyuRcPiJhovEcc8wsRtS5LrBCxJtzpYORvuIHtcGIXOQ4chC9AMzLAka9z7+DgUNlk5U7MrLa38CaO/zIm1ipKsWg/A/4n/7qN92EV7zG4nTYOT6Ectf5hQJTngwsLLhHLXVO5HJc+quIx1XX7U08GIY3hZHfMx9ni3l9SfnzlmQjN3Ttmxzqm/ySekaFLeRgTMHFHnvDuNJZ7smdHBErQSDjuig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXCh5GaYpui7p0JrA657JujuGRc/psFIDkPEotlaC8A=;
 b=vp6mwoNYjeHvTGrrdhuIEf07iy293A6tKgjwDw5Y9Tp0tRSB4W1O2wirW7C3JnSj12r4MsdDniZKXl2W7ndp+Ys4AfHxOhjRPQYt7rjWeMiQziNXio2d3JHHdxJfoIRM6yaNqEQcJbix7QNzkarI3Fcfpfp/+h/86rMM8FsVVAXxCAgzuziC411Du5xhSupuWLHUhf8RnKHc9N5sURFwrRHi15mhTtM71OjmMZXGPQuRFhHb17AxeuTIoFtP1DgB87HiuM/sFXgiY7V6bXn+UvbqDE7gTuIKgynacdzyo+O4GolY8x/OmXcTwfUDurr6jX8qkl1dcYqYDkVTBhZ5pA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXCh5GaYpui7p0JrA657JujuGRc/psFIDkPEotlaC8A=;
 b=FHKsHWLBwfKJ3IOwoA26Y2sUczt48YQVrPwM+rWlE633Ff7Rqh/NoMIiOPby76CYqie7rc0JSgcmpPbSReAsBTgK98nW16umT1iKy8xZaJx5GPQfOzKtnXUEjU01BrmoA3HQE/lzpqP6cE7RtopzGZOavyoS6FK40JjQJA/ElmA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1/U/OL3BYgnoOb78YP+KTzp/vTMr+snqyU3Bp6TVpHdeq51fEvHKHXMGLJjpwmHslDonkTOn62eQbHHiVvMNftaJjP73373MN3vFnoGy1miBZYGApJXtgqFnDGpkwYfxfpLREw+mMveNG7EoLwbBkvXsNHIv3v+c3AvKkFcCV9ZCRiNCEMO5r1oWVEQwob6RrJ+DTI5PfGMbwWCg2cAAaqht/NC5l8a79Z2LO+i3aJCMVcJLy3zOgSYueD5kLQTWLwXjybnhTcnXX0CyT2LO+18S3Ocyhp9Q8r0vPtAT1g+1Bi3wDNDt5u2Bv5SVfdnmeatJs5TEEWBIAzgwTgd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXCh5GaYpui7p0JrA657JujuGRc/psFIDkPEotlaC8A=;
 b=pFhRfppRrUAMS90h24Y1fko4FYK/h20+k9L8zvuxUCUgTQMFb4sMv93xFCKCJFMEPySqPQcJUU3MPkUUTHX9rszLU9oWOBohotD4/ytAurYai7t4A0r3nvhahqEigujum8AVoJNjZlvgZsHlc3S4RFPB2qr4D2AU9go80oI04/KEqhbitUBsbnvmEPZrv6XCgKObY5DcpHQyC6cqwa609hzkt9RLlnqFi9YFyjJIDFuxe7HCEacx5IEUrS861WUnbwUTalT8pqhNT4tIiqbWc1BFHaEitLTWueOMyVUCYYGOXvCg53J3cur246MLpLgpQujL/FjqqxozHIKncJcoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXCh5GaYpui7p0JrA657JujuGRc/psFIDkPEotlaC8A=;
 b=FHKsHWLBwfKJ3IOwoA26Y2sUczt48YQVrPwM+rWlE633Ff7Rqh/NoMIiOPby76CYqie7rc0JSgcmpPbSReAsBTgK98nW16umT1iKy8xZaJx5GPQfOzKtnXUEjU01BrmoA3HQE/lzpqP6cE7RtopzGZOavyoS6FK40JjQJA/ElmA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3] xen/arm: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Thread-Topic: [PATCH v3] xen/arm: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Thread-Index: AQHdDUx1aTYp1QlnvU6G8jJKuMyIC7ZgmzWAgAAA+IA=
Date: Mon, 6 Jul 2026 15:23:55 +0000
Message-ID: <AD40E6B4-7614-409F-91BB-09D9E9904C73@arm.com>
References: <20260706133553.3026786-1-ayan.kumar.halder@amd.com>
 <DAB048A7-AE4F-4E28-A613-8FFE4F0AC359@arm.com>
In-Reply-To: <DAB048A7-AE4F-4E28-A613-8FFE4F0AC359@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GVXPR08MB11741:EE_|AM3PEPF0000A78E:EE_|AS8PR08MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e7c618-8da4-48dc-56b9-08dedb72be9c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|4143699003|11063799006|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 ttuuGgUvZdZecaGFpzAzqQXW77yTvvo8UsB3o/GUOMEN420OKYzEMRMQ8x4ROvkAbj/LgbVUMLf0plt2Bcqre7aNMkLgWJNmiDX3DRbHtrsbUIRdsqB5XIrAJnjfYv5aVoewAgi7JOlkUoHol3GGNvPkJCom0dUR3UOe1jRFxRcGRb2RJm5MeOAl7Y8GQ+L/9d8CDaUYZyCyVzSTOH4jQckWADpCMhQ8kDJo0vintsRdUEGxgqcUI9duL+p3aHFMtyjX0Jq/DYvY0f+2kAy165HzrGRvOGmdO1ilATjbbgA2x+LPb/oO8W+Oghkz9fLUpJUEFu8FhM3N6jpOj/zkEO1HRUcngloGMnXi2E/lCFnyitR/H5wGhcTKGiS9ls9hcFxFogR4LrkF9PK6td5fUj1aPeBpqS4BDV+uipYzqGYTQkjdvz3QIvIvqJdcqZ/MY5FVM3uwZLlSIbQPhYkWbXohUw32Bk3S5HEOuKCvkAhHlysUEQltjhLZ3jGuQg1BPNu4ITitTFHoT170D3ZxgJgKzAFfhRrrXjhd4GvZ64AMoQtkrtBQX6yTnOKyXKuu7eE5i3EihkqhHUUlMOp6+xMsZ6YIcj6wdYX6ganfnfTrnJYYTYibG8a7Wqy0Qnsc9capGPTMd01uIokXnWQQK9QWcgCOoTlJ7+We2Yt+Z/9qMfJtCyuvxv/IEbObcRViHBwFy6d+AKYTT+MqSgrY4ws2/Utv+h14s5Z1Jwh4G0M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EF02749365F5A24DA4C22D63E2E2833E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 c71KYiMeWD7u3sC3EP2+MuWB/9GWY1PIzDa3iarEzAtacUF2sNDAjcp9PBZZiGJvFHIqWXIH0IXc1NPfByLzDQ2ph0Swyvac1IM97WA/s1p1ghhcJQceU1qb80QX4Uc5UTgHJFZFCJHRchh2mVMJs7Cq/QVLDJ1pDyVAhzPTQS4HcpOuyHEe+6mu8D8tf76qoIVb9kB3L8mZqvPMv+4kOjLfKu4rpk8E/t87lupVlxM6D+qU2BdIKRcRNV4ZYpZ0y8Mw2lID6jDi1QXtj44c7g1JaR/+MuDoAq1bRpIN3I5lk2IzNmimQiK9symqnw3sTbFbOjUBEKuXlgqhNSnMCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11741
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50f1dee2-891e-4c82-e4bf-08dedb7297cf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|35042699022|36860700016|14060799003|1800799024|82310400026|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	UQMxSFuJNhV1SWFjBiO1p2KlqVGQ/qJSXnjSQwCpW4geUa6MWohQ7xBprjLDElTeSyzBj9gy/8McDGUyeROYNYWsSI0KF56xkyAtBZAMQdj6iuYDkHJ+JqZf38HoKL+s3AusVW2dMSQ6MD/XLpfCWqCz5RQFh9RhyHFH9zcvvNaTi01ghIIBi8bzE9aC4XRgjH1JNW888fN375lz7Qth42xtks8FTprs4VTBX2OTVRo/oGm9SQNBfDUB25eO0HOc2nplfP4MlUD+ImB0xPj7DTRY+zZb6ernnSzUDy6Ikxu4wOHWtzTpYJDUnYsRlvtV5XXlG9GSomoo3s/scohT7vXtGSyBdkIRlv/2njypLl3xKpUgxDaE5t8q6MCZN23qBdJErW8jQ6ljmYYmsR5wqB75fsGzNWyQWb72EnBdAMs7ehb2oHTcBGDopF/Amuh5q2KN1g3Sq9cxzOMRpNgznqrqRDDFntJDlhp1gSdADe+eEPQkgHiV6lg4FaI/i7hBIeDcStPAHm/4udt5/MmT6iVacHf+kG5FHJuzTcDBXPjlMB6caD4kGFIZ+kcWahZPhOzH07J9fCxuwBt90KSasRou0WifEolewoYPnQMqAblrIjoQF5qJvxcPMghgUmI4exvJq7vZOTsxkc9t/5nRjiqFvPcyoHQXxvNAHV2cWR0qKkSSzhxuOjec1F4nTIjIRcdQSrLiW+jiTPEKWkJglw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(35042699022)(36860700016)(14060799003)(1800799024)(82310400026)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BCtaSQ5MEejgmV9IdmeqPomiD/F+BQzex9+mZ1P0g5yEgEceX69brH/OCJ7n13W7GXhL0zmdTqsH74+KSUyXcoLZR+i5JFHseLudyWv+Cam/ag4SwkEZGYVyLrEQsOvYyiFVkGDlnBCfZ8KRowpPXMNTbOF3eN1LxSRA2gDVYoMVVZHIyt09CN8EcE6vuu8nrT6ypwfUgFEWrHKp6t2Tfjip7a+G/3Lf/TRlLANjzQx4CUTwxZKmoFEuR+da3HPBXzlHpF4BRRqISv+pO3CDOurVcjTq8gOTK+a0uEB85nwvCnD3nqRL3SPbMSq8EH2SqNLyRV6ko5hCOKv2SHOElTyJL6ebPAaI1cUuawQBIydhZ/+pwPsNKUunTL5lEJ9YQsQxqCXAxINtgKiJmb9PleJj05KRvqz+oSIwmQXYNu+Dry7mde+rtB3R0Ir7riUZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:25:00.2973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e7c618-8da4-48dc-56b9-08dedb72be9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7356
X-purgate-ID: tlsNG-16d1c6/1783351503-C6F2468D-2158FD73/0/0
X-purgate-type: clean
X-purgate-size: 207
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D05597128A9


>=20
> With the above fixed:
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@gmail.com>

Apologies, I meant:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

>=20
> Cheers,
> Luca
>=20


