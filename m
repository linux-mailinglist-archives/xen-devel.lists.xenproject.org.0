Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24022AB6E29
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984347.1370492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFD64-0001C3-1j; Wed, 14 May 2025 14:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984347.1370492; Wed, 14 May 2025 14:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFD63-00019T-Ua; Wed, 14 May 2025 14:28:35 +0000
Received: by outflank-mailman (input) for mailman id 984347;
 Wed, 14 May 2025 14:28:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CFkY=X6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uFD62-00019N-8y
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:28:34 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b56e90a8-30cf-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 16:28:31 +0200 (CEST)
Received: from AS9PR06CA0099.eurprd06.prod.outlook.com (2603:10a6:20b:465::34)
 by AS8PR08MB8706.eurprd08.prod.outlook.com (2603:10a6:20b:564::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 14:28:24 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:20b:465:cafe::84) by AS9PR06CA0099.outlook.office365.com
 (2603:10a6:20b:465::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Wed,
 14 May 2025 14:28:13 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 14 May 2025 14:28:11 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PAWPR08MB9542.eurprd08.prod.outlook.com (2603:10a6:102:2ed::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Wed, 14 May 2025 14:27:38 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 14:27:38 +0000
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
X-Inumbo-ID: b56e90a8-30cf-11f0-9eb6-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vbTZp731xIQitgZlcdf7WvwxLfZBprQPV9GNorSBPkrO7XKsVdSiftLXusbPqwUQor0R5wuHCnLbaTsYtyBBd7iLm2lFY+QtMtur7xe3LF6GDo0Br2n7pC3nPUquHmBnCHIzqPsoEjM7E0Vi8dVNNU/37Xq3GryBJSS3ibAiLtErMCxHlTTD8qf4lA4YD5DUV9lNhnOxqlaFSugFmYiWzV4sIFFJ6Xm0qYqa4CJdRqDFfQdQJLJRcO5okF36ZEMRHZSX9YxhGqA2PhpjuquXr32mbtqHibPNSo9c9tqb6kX6JumSvbKciE8MJ3E9yvAoEFRxxM/GUAj80yZIe/i8UA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTrrrbM77KNeqeVQJm2I0wmbQ8tBjHiWW/yCH0bPAJk=;
 b=w+14iVAC/9HyO5ZcfAKV+FYMBU2HyHjLfieZZY1pByZ9lEn994+7Zw0L3PrI21PL2Tz6Zm81wWOWPUjlDbtIL1pzxIb/NDK/IzMknFY/7pqp1pwefaglQtNpbR0GDzpFmrrwe8kamarP5PmLJQ81uSOYd5QQuuccu7ZCvoWlqtlXS4FpksH6Jd3Av+7vmX04sBuYwY3lisnN2k+OaNA5bu/R0+mdJm95cMEivjtva2lHAgcKgJnPRWR0qQBJA7VijoiOAhv2jKUafZXnIKmdLlmuUxKabO0C40MrAaXIY3f+2UzYFZiDm1HRwkaZdcN++Pvn8YEuxF7Q+0ZxL3Yq9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTrrrbM77KNeqeVQJm2I0wmbQ8tBjHiWW/yCH0bPAJk=;
 b=cpE/drlgtLE9tHWp+uX0kzwkhlwSKmLolW+lVvJBgjY0rU9XTLNwJZ+kgzgnK4eFSSI/fXqYpDwFeHAevkZdkvRXS1JUpWLJQvdAX3FRrMsRxkdbxBcmyBZYZrAo/1QfNfVOBw8uwbjfvD75GeZt/lZ/ivFrf/CiUiTYZY6iosQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCvGZKKjcbT6a+IBDP7bOVaASjn+Dn+Nk2b1O6okNEAF47dBgnPjszRgcMP/DDRUL3P1XgwQo+DzrsU5arb3vcs8+7B+DRs7vPU6iPqViOD3T9ntbhMOTvUlRvAcdzHe2EhXrc7rHcjBtA2kLWJpR92Gu1k9rrLISK9fuf2giJ4WcMxaWegmgvDQUeD3ONDunr664SZE69xwm7KQM/dFDD6cuF4V6UJgN4sKnWO9gCSyjBhDfp4Cxd10lomIC6NdpwxZEYuUTETTYeo1vtDFy0QVOcHI997pSD69RJrCx+/4xL2ZabSRQqwRWhEdz0+M9R7wFVwIzmEM48IgKdc2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTrrrbM77KNeqeVQJm2I0wmbQ8tBjHiWW/yCH0bPAJk=;
 b=v19uLf/O8Jk4PlB1E77xQHG5plwID7UvguzNnWiUvrPd0uHxhpcX0gp+LaGCdVGdix7rzrlI3NhOmSSWrmJD+A8iPqhNSIBhZFVipBK/otjIScBH4ii7VKKHwk5o/9zgKbcnwMmeb/QT4RliZKoncNi7cQCvpB+iC+1i51asiHGAtqkSS0YWAes5cxpE4e/Zw6PffI2QIBygNLVXSqL7vnTTlVMQ4YJ89QFMwMlOy1MEpONAJmzizcKkbD41jUwuyO7wjE0qDNqBGyU2K+kqDJEEZxzdRqi3hFmh0wqtrNYD+9sgOpNk72drx7QoZX9yFKeuDXUy5cm4VxWeEdGofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTrrrbM77KNeqeVQJm2I0wmbQ8tBjHiWW/yCH0bPAJk=;
 b=cpE/drlgtLE9tHWp+uX0kzwkhlwSKmLolW+lVvJBgjY0rU9XTLNwJZ+kgzgnK4eFSSI/fXqYpDwFeHAevkZdkvRXS1JUpWLJQvdAX3FRrMsRxkdbxBcmyBZYZrAo/1QfNfVOBw8uwbjfvD75GeZt/lZ/ivFrf/CiUiTYZY6iosQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 3/6] arm/mpu: Provide and populate MPU C data
 structures
Thread-Topic: [PATCH v5 3/6] arm/mpu: Provide and populate MPU C data
 structures
Thread-Index: AQHbw+N7OQ17lZ1szkalxBxuriXrX7PRz90AgABg5wA=
Date: Wed, 14 May 2025 14:27:38 +0000
Message-ID: <112E7D85-7BDB-490D-98E9-75D03397567D@arm.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-4-luca.fancellu@arm.com>
 <1e56c7e8-5302-4280-a48d-d1e958eeadc9@xen.org>
In-Reply-To: <1e56c7e8-5302-4280-a48d-d1e958eeadc9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PAWPR08MB9542:EE_|AM1PEPF000252DB:EE_|AS8PR08MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: e98d77fa-afc7-458c-6dff-08dd92f38e4f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Ynp4TE8zai9TdGxscHpvejJISHZLZjV0c202allVeHpreGFBMHc1Wkk4Y1JN?=
 =?utf-8?B?U1NoT2tKYStlZzJSVFRkNk1iUFdDSENDekNtMEVmKytBenltOGcrNnlzZEFx?=
 =?utf-8?B?a0h1Z2tLSkhveG9wUWJMZnp2R2dnTGg4dHpRd0h2Yml4ZDlJUWEzMFNHU0do?=
 =?utf-8?B?QjYvTmE3cW5CU05QbTJudTBvTmZYSERMcnNobjEvbURXU3RxNE1BaEFWNVht?=
 =?utf-8?B?TnZYTHFQaURCNjN0UnpQK044OFdpVDE5UTRKZUZOeXZZVVVYQnhUNStyT1o1?=
 =?utf-8?B?VjI1MTdQdFQ4dHg2cjd1UzFqMWhJM3FmRndEQ2tzQmR6N0tON1V5cnV6TGhX?=
 =?utf-8?B?cUFZWjdxeTM3RHRhblV3bkdwYXJuYkRTdkhvUHJVTFUxeXdWWkJ1cGlacU1D?=
 =?utf-8?B?MDJpN0FNUjNYOWMwaWl3VW5JS0pYSFJzTTh0UEdyc3lXTkluY21HUXhBamlt?=
 =?utf-8?B?alp0ME9VL2tEcTlxYlJQeEhEL1pkYTgwVHIzN09iY0hvdm9ZeFcydE8vcDRo?=
 =?utf-8?B?UzZpVWZ0U0F3c2h1YmsyODdDTzMxSjV4NDFYK1dHVGpPTFdIZk5aV3l5QkUw?=
 =?utf-8?B?UEpCQ1ZlOXhYbDJwZzMyUXRFRzBqUVhUSWdScWRtdHFCbXZYcDM2K0oxOUxt?=
 =?utf-8?B?MjR0MnhKZnZSUi9XQzRWOTAzL2VVNHUxbG1TcitjRlJnRUVyTTRxM0RjRUlH?=
 =?utf-8?B?OHp3ZE9pVEppVllUb2ZTdm90U1lhT0M3NjJXMW8vQkFIakZlaXdyMUs0cllE?=
 =?utf-8?B?MEhFYlBjRkVBV2VUT1ZGRklOc0xISkVJU0xvbUdKd3dvd0d3b1JDNkNJRGxm?=
 =?utf-8?B?ai9NZHVkbjBiVjY5czQzMktOMzRRQmFUT3hiN2M0dDZONHFZWmJ3Z3RlTWlC?=
 =?utf-8?B?TU1TbEFWYzRCa3JYNU1iVUxRNUU1RkxvSE5zZTVqWXZMdUY1b05rMUFpTm1Y?=
 =?utf-8?B?K0pYRFhIaHhka3U4YWNGeitpbnhsTWJuSnRQUmRmU2RLNisyVExTdUd1bjBz?=
 =?utf-8?B?OS9HTDRWK3NzYkZBUU85VlMrUUpOSCswNm4wbnJiUzd5MFhxd0d5eElDMGJ0?=
 =?utf-8?B?ZklrWlM5TWszbnl0M0pHVVIzbFZPRWI5L2k1WGFpbjhOUG5NRmpZOWY3dDZY?=
 =?utf-8?B?Y0tQcjAvUWZ1aSt2VG5zTlBoZHFkZ3dFdXg3V0ZLcGVWMGhvMmxJWDVEcFJU?=
 =?utf-8?B?UElhVFVRckR5c1A2Rm9jZWJweWE4TThyZi9qTkhVV3FydzZmMGJZZVM4NUJX?=
 =?utf-8?B?R2VSeGpTWkkvbnlNWFpITnVBQVpncGJHQ1NXOWhyZitqTWM0OW5LYzNDU1pX?=
 =?utf-8?B?WUFoT1ZYRU1NOENLcnBrSHo2enhZcFFNellpWlF4ekhGeWpDdWF6UGZJOEti?=
 =?utf-8?B?cktlMWs5TmpZdGtFNjNSeW9mdzR1YzVGbFdhdEp6K3QzZm5nZHBBOHJpbXND?=
 =?utf-8?B?Zzk2VHRUNTVySW9TdjYzd0lKOWFKSzFKTUtJZlhHOTRFajFnRmRxemZtZzhm?=
 =?utf-8?B?YnhSODMyMDE0Mno5UUFGM0pXYXJkQjJIbzl2WHpybE5Gc09iYlpWL01iUnhF?=
 =?utf-8?B?OWdQZkI5RklramQzZ1JsdlJxUjRNUy9NOE9rS1JkUjVQdFg5dXNrYStRQ0Vj?=
 =?utf-8?B?cTd3RWhLNElTTGVXQk5BblFxSjZ1Q0hydk5zM2pnVFU1NG9mVThVNDZmcVZB?=
 =?utf-8?B?UzJTVU5lbVVob3dNMTJHaUI3VWowLzBVVzZPSFFiRHk5YzRmOUl2QVltNHln?=
 =?utf-8?B?Vk5UaWNxcUhFNmNtZUtUalZQVTQ4K2RnQkVuVGd5S1FQZFg2bzkxMUNmM2Ry?=
 =?utf-8?B?NTBVcDV1RXoyWEdQM3lMMlpGOU1EdzdPMkh4VWp1Mm1OZzgzTUtlTmtLOU56?=
 =?utf-8?B?NFNHUUhrVHZFSGQ0cG9LdHpTUm0rSTdRWG8vTzRkNlY3Y050SFZ3blQwOUJj?=
 =?utf-8?B?YUhKSDVUbzZxamxkU2l4Qm5XTFVKd3A0UWxXaEpVT0IvZ3FQWlh0Q2ZvMTZs?=
 =?utf-8?Q?SaflBMeoG3XRGmUYKZemZgV2rexweA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E38C57B0F8AE047BAFC012A0C98D112@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9542
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d9b24bc-42fa-4d6a-2da8-08dd92f37a83
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHVheS9IakFELzFuR2NqT0JXVlEvUm1RM3dHMXd4UkZDKzVkTG51QWRjeDBX?=
 =?utf-8?B?ZUtZcDhFb0tyU0h2OCtqaXBBN0kxNlU4T1ltZjRkNG1Pd1JZT1dmRmlyaTFD?=
 =?utf-8?B?OGZDN21zdGJhS1BkNkVtY24ydlU2SWtoUEJjWTVhbzNoUFM2dHZ3Y0M3bnhW?=
 =?utf-8?B?MktuaEVFcHFJNENtZ1dsRERDTHRudW1lYWdOV1NGQ2h3ZFNkRW42RThGSWlq?=
 =?utf-8?B?VDdZTE8zdmR6MlN2Y0pQYStuOEtnQ1hNTnpxRVdTN0dhOUdrSFRIK1FpWWFk?=
 =?utf-8?B?dytBUlBxcmhmditHNGJBS0FtQUJocnpLbUlDbStpUUw2Q1FjUXpTTi9OMjhF?=
 =?utf-8?B?OUhWQVM1TE8xb2VOR2EwSlg3ZXkwSXVrRzZxZHpZUzcvUHJ1cDJ3NVRHakNN?=
 =?utf-8?B?WEYrVUlqQmphU1hMZzlDTnpIVG12bE80RS9xdlRvUTNpRXNyVXlsNVF0M2M2?=
 =?utf-8?B?T2pybHlYbG9RRkIyZUxwSDdYT2ZZcmh5b3NPb2VXeG5pNmxiVnU3RVU1cm8w?=
 =?utf-8?B?RlN5Q0JHaFY0bTl2REN1a2poRG9NRlBoNTVKRHFwcDJxcXlTU1JvUjVJK09t?=
 =?utf-8?B?Ny9mY0RrNFJ4SVUvZXJJN2RlVU1PNDhIQTU1bkdBRlhQdXZIb2VESE51QkNB?=
 =?utf-8?B?c3JkR2VESk1DMW9ZV0RJWlF3M3JjR2E0WHJ3blVRdm53ejU3SmI4TnV1bFZ3?=
 =?utf-8?B?RzFJdG9hQ3NRVEtHRmlGSmx3dnR5a1lSa0NpRDNMRkVPK3ZSYUZZS2R6QjVs?=
 =?utf-8?B?MnAxdzlqUE5jcEptaHl1Z3VFdHhUNXYwM2c1ZTVCcDUxaC82MmtNSURDUjdw?=
 =?utf-8?B?a0RCUjNGazIzam1tbk5MYlVicnB1NXRRWnJKVHovVEFPakhlVnZjOGJwNmtT?=
 =?utf-8?B?R3d1MEpoMThLR0x3d0lTbFROcjZYVzljL2JXMFQrdHpheStJV2hCbE9vclVn?=
 =?utf-8?B?NTVNTktSdThPRzVaM2xoaGRrWGl6QUkwYWMwL2xxbmRyQXZ0QXVPSHczb29F?=
 =?utf-8?B?cmw5Y3dmK05SV1MwN3FmYkdLZHMvVnUzT20zL2ZEVHQ0S2wvWmtkaEdkQTZB?=
 =?utf-8?B?N0FCelFNdUJXem5XNnNDM0RmaDZTQWRXUDBibFd4OFhkZ0lXSWdOUVB5c3Rx?=
 =?utf-8?B?MjV0Z1hmRHNmUkJnbVJPTFhMRE5aWFdsbnNZWjBjN1RLdUh5cUVVNVdEaEJs?=
 =?utf-8?B?ZmcybmJXOUxITnllRTBuTXFqSWt3bWhaRHVhUUJIOFRMaEJCTkhjcDBLZFl3?=
 =?utf-8?B?Nzl2VDM0OWgvakEzYlVjTjRUcFhsVzhva1Bwd0V5TDUvMXRiT0d5eHdydjIy?=
 =?utf-8?B?WlYwdFNoVVB4VUorSjBXYTNhSU81bmlWWUdmcGw1LzFvSDF4bzRDSEJVSmo3?=
 =?utf-8?B?K0UrZ3liM0hSeXZRam9VTzZVc3NnSE41Z05MUGdHZkc2KzlvT2s1eGgwTkJo?=
 =?utf-8?B?Wk5kZFpBMzc4Y1gvdDYwMC9lUmo1NGxYSGRnelVuMkkveWVPZXcvY2lad01y?=
 =?utf-8?B?aUJ1d05sZXgrM2ljTnFqWWY5K25QdUZEZWFqYlduYnJ3RGppMzU0SFdKZmF4?=
 =?utf-8?B?TW5hV08xd280L0YyRkIyb0F0b1RyWGJ1MEc3djFxaEhkUitOcjNjVFNEcWFh?=
 =?utf-8?B?OTZHd1dWRXExN1BBOGMwUC9kbEtvb3Qxc3d5andyeTNWbEJzRjlscnFrQlVi?=
 =?utf-8?B?OXlhMjZzZXdQRmgyNTlFRkVYcjVESCt5Mk85OWhJUnJVOXRyVHRpeWxUelRu?=
 =?utf-8?B?Z3YzUjFTQzZUeXFqT2pLK1pGdjFqdVBXVjZ2Z2FxY0ZCM2M4b1RLZFpuZHFE?=
 =?utf-8?B?ekFtY1B5dStGRVNmUU9mMXBLUGc4Sk9hNG9BajZDMEJWUytNLzlMalkveGlF?=
 =?utf-8?B?d3U3SXk2V1FWSWxRWWh6cGtzekxHRGkyV1Z5RnNDS081WGl4SGV6bFN6bmtS?=
 =?utf-8?B?Mm9ybDhxT2lwQTdZalVLU3Y4ZkJ6VE1FbGp6Vm5xNGczK2djU2NhaU9ESEhj?=
 =?utf-8?B?aC8zQmtyZGdqcHVKelFBaUZHeC9TZHBuakRkbkRCbTcwcXBTV0VNRnNtRmxl?=
 =?utf-8?Q?czNoZ1?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 14:28:11.7804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e98d77fa-afc7-458c-6dff-08dd92f38e4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8706

SGkgSnVsaWVuLA0KDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L21wdS9oZWFk
LlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L2hlYWQuUw0KPj4gaW5kZXggNmQzMzZjYWZiYmFm
Li41OWRkYzQ2NTI2ZWIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L2hl
YWQuUw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L21wdS9oZWFkLlMNCj4+IEBAIC00MCw2
ICs0MCw5IEBAIEZVTkMoZW5hYmxlX2Jvb3RfY3B1X21tKQ0KPj4gICAgICBtcnMgICB4NSwgTVBV
SVJfRUwyDQo+PiAgICAgIGFuZCAgIHg1LCB4NSwgI05VTV9NUFVfUkVHSU9OU19NQVNLDQo+PiAg
KyAgICBsZHIgICB4MCwgPW1heF9tcHVfcmVnaW9ucw0KPj4gKyAgICBzdHJiICB3NSwgW3gwXQ0K
PiANCj4gQmVsb3cgeW91IGFyZSBoYW5kbGluZyBjYWNoZSBpbnZhbGlkYXRpb24gd2hlbiB3cml0
aW5nIHRvIHRoZSBiaXRtYXAuIEJ1dCB5b3UgZG9uJ3QgZG8gb25lIGhlcmUuIElzIHRoaXMganVz
dCBhbiBvdmVybG9vaz8NCg0Kb2ggeWVzLCBvdmVybG9va2VkLCB0aGFua3MNCg0KPj4gDQo+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2JpdG1hcC1vcC5pbmMgYi94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vYml0bWFwLW9wLmluYw0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWE3YzhhYmJmNmYwDQo+PiAtLS0gL2Rldi9udWxs
DQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYml0bWFwLW9wLmluYw0KPj4gQEAg
LTAsMCArMSw2NyBAQA0KPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkgKi8NCj4+ICsNCj4+ICsvKg0KPj4gKyAqIFNldHMgYSBiaXQgaW4gYSBiaXRtYXAgZGVjbGFy
ZWQgYnkgREVDTEFSRV9CSVRNQVAsIHN5bWJvbCBuYW1lIHBhc3NlZCB0aHJvdWdoDQo+PiArICog
Yml0bWFwX3N5bWJvbC4NCj4+ICsgKg0KPj4gKyAqIGJpdG1hcF9zZXRfYml0OiAgICAgIHN5bWJv
bCBvZiB0aGUgYml0bWFwIGRlY2xhcmVkIGJ5IERFQ0xBUkVfQklUTUFQDQo+PiArICogYml0OiAg
ICAgICAgICAgICAgICAgYml0IG51bWJlciB0byBiZSBzZXQgaW4gdGhlIGJpdG1hcA0KPj4gKyAq
IHRtcDEtdG1wNDogICAgICAgICAgIHRlbXBvcmFyeSByZWdpc3RlcnMgdXNlZCBmb3IgdGhlIGNv
bXB1dGF0aW9uDQo+PiArICoNCj4+ICsgKiBQcmVzZXJ2ZXMgYml0Lg0KPj4gKyAqIE91dHB1dDoN
Cj4+ICsgKiAgdG1wMTogQWRkcmVzcyBvZiB0aGUgd29yZCBjb250YWluaW5nIHRoZSBjaGFuZ2Vk
IGJpdC4NCj4gDQo+IElmIHRoZSByZWdpc3RlciBpcyB1c2VkIGZvciBvdXRwdXQsIHRoZW4gSSB0
aGluayBpdCBuZWVkcyBhIGJldHRlciBuYW1lLg0KPiBCdXQgbG9va2luZyBhdCB0aGUgY29kZSwg
aXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIGhvdyB0aGUgb3V0cHV0IHdpbGwgYmUgdXNlZC4NCg0K
U28gY3VycmVudGx5IGl0IHdpbGwgZ2l2ZSB0aGUgYWRkcmVzcyBvZiB0aGUgd29yZCBjb250YWlu
aW5nIHRoZSBiaXQsIHNvIHRoYXQgd2Ugd2lsbA0KcGFzcyBpdCB0byB0aGUgaW52YWxpZGF0ZSBj
YWNoZSBmdW5jdGlvbi4NCg0KPiANCj4+ICsgKiBDbG9iYmVyczogdG1wMSwgdG1wMiwgdG1wMywg
dG1wNC4NCj4+ICsgKi8NCj4+ICsubWFjcm8gYml0bWFwX3NldF9iaXQgYml0bWFwX3N5bWJvbCwg
Yml0LCB0bXAxLCB0bXAyLCB0bXAzLCB0bXA0DQo+ID4gKyAgICBhZHJfbCAgIFx0bXAxLCBcYml0
bWFwX3N5bWJvbD4gKyAgICBtb3YgICAgIFx0bXAyLCAjKEJZVEVTX1BFUl9MT05HIC0gMSkNCj4+
ICsgICAgbXZuICAgICBcdG1wMiwgXHRtcDINCj4+ICsgICAgbHNyICAgICBcdG1wMywgXGJpdCwg
IzMNCj4+ICsgICAgYW5kICAgICBcdG1wMiwgXHRtcDMsIFx0bXAyDQo+PiArICAgIGFkZCAgICAg
XHRtcDEsIFx0bXAxLCBcdG1wMiAgICAgICAgICAgICAgICAgLyogYml0bWFwX3N5bWJvbCArIChi
aXQvQklUU19QRVJfTE9ORykqQllURVNfUEVSX0xPTkcgKi8NCj4gDQo+IFN0eWxlOiBtaXNzaW5n
IHNvbWUgc3BhY2VzLg0KPiANCj4gQnV0IGlzIHRoZSBjb21tZW50IGV4cGxhaW5pbmcgdGhlIGxv
Z2ljIGFib3ZlPyBJZiBzbywgSSB0aGluayBJIHdvdWxkIHB1dCBpdCByaWdodCBhdCB0aGUgYmVn
aW5uaW5nIHRvIG1ha2UgZWFzaWVyIHRvIHVuZGVyc3RhbmQgdGhlIGxvZ2ljLiBJIHdvdWxkIGFs
c28gY29uc2lkZXIgdG8gc3BsaXQgaW4gc21hbGxlciBjb21tZW50cyBvbiBlYWNoIGxpbmUgZS5n
LjoNCj4gDQo+ICogLi4uID0gLi4uICsgLi4uDQoNCk9rIEnigJlsbCBkbyBhIGxpbmUgYnkgbGlu
ZSBleHBsYW5hdGlvbg0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL21wdS9yZWdpb25zLmluYyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUvcmVnaW9u
cy5pbmMNCj4+IGluZGV4IDQ3ODY4YTE1MjY2Mi4uYmEzODIxM2ZmZmYxIDEwMDY0NA0KPj4gLS0t
IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9yZWdpb25zLmluYw0KPj4gKysrIGIveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9yZWdpb25zLmluYw0KPj4gQEAgLTEsMTQgKzEsNDIg
QEANCj4+ICAvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovDQo+PiAg
KyNpbmNsdWRlIDxhc20vYml0bWFwLW9wLmluYz4NCj4+ICAjaW5jbHVkZSA8YXNtL21wdS5oPg0K
Pj4gICNpbmNsdWRlIDxhc20vc3lzcmVncy5oPg0KPj4gICAgLyogQmFja2dyb3VkIHJlZ2lvbiBl
bmFibGUvZGlzYWJsZSAqLw0KPj4gICNkZWZpbmUgU0NUTFJfRUx4X0JSICAgIEJJVCgxNywgVUwp
DQo+PiAgKyNkZWZpbmUgUkVHSU9OX0RJU0FCTEVEX1BSTEFSICAgMHgwMCAgICAvKiBOUz0wIEFU
VFI9MDAwIEVOPTAgKi8NCj4+ICAjZGVmaW5lIFJFR0lPTl9OT1JNQUxfUFJMQVIgICAgIDB4MGYg
ICAgLyogTlM9MCBBVFRSPTExMSBFTj0xICovDQo+PiAgI2RlZmluZSBSRUdJT05fREVWSUNFX1BS
TEFSICAgICAweDA5ICAgIC8qIE5TPTAgQVRUUj0xMDAgRU49MSAqLw0KPj4gICsjZGVmaW5lIFBS
TEFSX0VMeF9FTiAgICAgICAgICAgIDB4MQ0KPj4gKw0KPj4gKyNpZmRlZiBDT05GSUdfQVJNXzY0
DQo+PiArI2RlZmluZSBYRU5fTVBVTUFQX0VOVFJZX1NISUZUICAweDQgICAgIC8qIDE2IGJ5dGUg
c3RydWN0dXJlICovDQo+PiArDQo+PiArLm1hY3JvIHN0b3JlX3BhaXIgcmVnMSwgcmVnMiwgZHN0
DQo+PiArICAgIHN0cCBccmVnMSwgXHJlZzIsIFtcZHN0XQ0KPj4gKy5lbmRtDQo+PiArDQo+PiAr
Lm1hY3JvIGludmFsaWRhdGVfZGNhY2hlX29uZSByZWcNCj4+ICsgICAgZGMgaXZhYywgXHJlZw0K
Pj4gKy5lbmRtDQo+PiArDQo+PiArI2Vsc2UNCj4+ICsjZGVmaW5lIFhFTl9NUFVNQVBfRU5UUllf
U0hJRlQgIDB4MyAgICAgLyogOCBieXRlIHN0cnVjdHVyZSAqLw0KPj4gKw0KPj4gKy5tYWNybyBz
dG9yZV9wYWlyIHJlZzEsIHJlZzIsIGRzdA0KPj4gKyAgICBub3ANCj4gDQo+IENhbiB3ZSB1c2Ug
YSBmdW5jdGlvbiB0aGF0IHdpbGwgdHJpZ2dlciBhIGZhdWx0PyBTbyB3ZSB3aWxsIHJlbWVtYmVy
IHRoaXMgd2lsbCBuZWVkZWQgdG8gYmUgdXBkYXRlZC4gTWF5YmUgcmUtdXNlIHRoZSBCVUdfT1BD
T0RFPw0KDQpTdXJlLCBJ4oCZbGwgbG9vayBpbnRvIGl0DQoNCj4gDQo+PiArLmVuZG0NCj4+ICsN
Cj4+ICsubWFjcm8gaW52YWxpZGF0ZV9kY2FjaGVfb25lIHJlZw0KPj4gKyAgICBub3ANCj4gDQo+
IFNhbWUgaGVyZS4NCj4gDQo+PiArLmVuZG0NCj4gPiArPiArI2VuZGlmDQo+PiArDQo+PiAgLyoN
Cj4+ICAgKiBNYWNybyB0byBwcmVwYXJlIGFuZCBzZXQgYSBFTDIgTVBVIG1lbW9yeSByZWdpb24u
DQo+PiAgICogV2Ugd2lsbCBhbHNvIGNyZWF0ZSBhbiBhY2NvcmRpbmcgTVBVIG1lbW9yeSByZWdp
b24gZW50cnksIHdoaWNoDQo+PiBAQCAtNTYsNiArODQsMjcgQEANCj4+ICAgICAgaXNiDQo+PiAg
ICAgIFdSSVRFX1NZU1JFR19BU00oXHByYmFyLCBQUkJBUl9FTDIpDQo+PiAgICAgIFdSSVRFX1NZ
U1JFR19BU00oXHBybGFyLCBQUkxBUl9FTDIpDQo+PiArDQo+PiArICAgIC8qIExvYWQgcGFpciBp
bnRvIHhlbl9tcHVtYXAgYW5kIGludmFsaWRhdGUgY2FjaGUgKi8NCj4gDQo+IFRvIGNvbmZpcm0g
bXkgdW5kZXJzdGFuZGluZywgeGVuX21wdW1hcCBpcyBwYXJ0IG9mIHRoZSBsb2FkZWQgYmluYXJ5
LiBTbyB3ZSBleHBlY3QgdGhlIGJvb3Rsb2FkZXIgdG8gaGF2ZSBjbGVhbiB0aGUgY2FjaGUgZm9y
IHVzLiBUaGVyZWZvcmUsIHdlDQo+IG9ubHkgbmVlZCB0byBpbnZhbGlkYXRlIHRoZSBlbnRyaWVz
IGFmdGVyd2FyZHMuIElzIGl0IGNvcnJlY3Q/DQoNCnllcyB4ZW5fbXB1bWFwIGlzIHBhcnQgb2Yg
dGhlIGJpbmFyeSwgYXJlIHlvdSBzdWdnZXN0aW5nIHdlIHNob3VsZCB1c2UgY2xlYW4gYW5kIGlu
dmFsaWRhdGUgaGVyZT8gU28gZm9yIGV4YW1wbGUgYm9vdC13cmFwcGVyLWFhcmNoNjQgaXMgbm90
DQpjbGVhbmluZyB0aGUgY2FjaGUuDQoNCj4gDQo+PiArICAgIGFkcl9sIFxiYXNlLCB4ZW5fbXB1
bWFwDQo+PiArICAgIGFkZCAgIFxiYXNlLCBcYmFzZSwgXHNlbCwgTFNMICNYRU5fTVBVTUFQX0VO
VFJZX1NISUZUDQo+PiArICAgIHN0b3JlX3BhaXIgXHByYmFyLCBccHJsYXIsIFxiYXNlDQo+IA0K
PiBJIHRoaW5rIHlvdSB3YW50IGEgY29tbWVudCBvbiB0b3Agb2YgcHJfdCB0byBtZW50aW9uIHRo
ZSBzdHJ1Y3R1cmUNCj4gd2lsbCBub3QgY2hhbmdlZCBhbmQNCg0KY2FuIHlvdSBleHBsYWluIGJl
dHRlciB0aGlzIHBhcnQsIHdoYXQgc2hvdWxkIEkgd3JpdGUgb24gdG9wIG9mIHRoZSB0eXBlZGVm
IHN0cnVjdCB7Li4ufSBwdF90Pw0KDQo+IA0KPj4gKyAgICBpbnZhbGlkYXRlX2RjYWNoZV9vbmUg
XGJhc2UNCj4gDQo+IFRoaXMgd2lsbCBpbnZhbGlkYXRlIGEgc2luZ2xlIGxpbmUgaW4gdGhlIGRh
dGEgY2FjaGUuIFRoZSBzaXplIGRlcGVuZHMgb24gdGhlIEhXLCBidXQgdHlwaWNhbGx5IGl0IHdp
bGwgYmUgNjQgLSAxMjggYnl0ZXMuIERvIHdlIGhhdmUgYW55IGNoZWNrDQo+IHRoYXQgd2lsbCBj
b25maXJtIHRoZSBkYXRhIHdpbGwgZml0IGluIGFuIGNhY2hlIGxpbmU/DQoNCllvdSBhcmUgcmln
aHQsIHNvIHdlIGFyZSBnb25uYSB3cml0ZSAxNiBieXRlcyBhdCBtb3N0IGZvciBBcm02NCBhbmQg
KGZvciBub3cpIDggYnl0ZXMgZm9yIEFybTMyLCBzbyBJIHRoaW5rIHdlIHdpbGwgYmUgd2F5IGJl
bG93IDY0IGJ5dGVzLA0Kc2hhbGwgd2UgaGF2ZSBhIEJVSUxEX0JVR19PTiBpbnNpZGUgYnVpbGRf
YXNzZXJ0aW9ucygpIGluIGFybS9tcHUvbW0uYyB0byBjaGVjayBzaXplb2YocHJfdCkgPD0gNjQ/
DQoNCj4gDQo+PiArDQo+PiArICAgIC8qIFNldC9jbGVhciB4ZW5fbXB1bWFwX21hc2sgYml0bWFw
ICovDQo+PiArICAgIHRzdCAgIFxwcmxhciwgI1BSTEFSX0VMeF9FTg0KPj4gKyAgICBibmUgICAy
Zg0KPj4gKyAgICAvKiBSZWdpb24gaXMgZGlzYWJsZWQsIGNsZWFyIHRoZSBiaXQgaW4gdGhlIGJp
dG1hcCAqLw0KPj4gKyAgICBiaXRtYXBfY2xlYXJfYml0IHhlbl9tcHVtYXBfbWFzaywgXHNlbCwg
XGJhc2UsIFxsaW1pdCwgXHByYmFyLCBccHJsYXINCj4+ICsgICAgYiAgICAgM2YNCj4+ICsNCj4+
ICsyOg0KPj4gKyAgICAvKiBSZWdpb24gaXMgZW5hYmxlZCwgc2V0IHRoZSBiaXQgaW4gdGhlIGJp
dG1hcCAqLw0KPj4gKyAgICBiaXRtYXBfc2V0X2JpdCB4ZW5fbXB1bWFwX21hc2ssIFxzZWwsIFxi
YXNlLCBcbGltaXQsIFxwcmJhciwgXHBybGFyDQo+PiArDQo+PiArMzoNCj4+ICsgICAgaW52YWxp
ZGF0ZV9kY2FjaGVfb25lIFxiYXNlDQo+IA0KPiBZb3Ugd2FudCB0byBhIGNvbW1lbnQgdG8gZXhw
bGFpbiB3aGF0IHRoaXMgaW52YWxpZGF0ZSBkb2VzLiBBRkFJQ1QsIHRoaXMgaXMgZm9yIHRoZSBi
aXRtYXAuIEJ1dCBnaXZlbiB0aGUgYml0bWFwIHdpbGwgYmUgdHlwaWNhbGx5IHNtYWxsLCB3b3Vs
ZG4ndCBpdCBiZXR0ZXIgdG8gZG8gaXQgaW4gb25lIGdvIGF0IHRoZSBlbmQ/DQoNClllcyB0aGlz
IGludmFsaWRhdGUgaXMgYSBiaXQgb3ZlcmtpbGwgYmVjYXVzZSBpdCB3aWxsIGludmFsaWRhdGUg
NjQtMTI4IGJ5dGVzIHN0YXJ0aW5nIGZyb20gdGhlIGFkZHJlc3Mgb2YgdGhlIGxhc3QgY2hhbmdl
ZCB3b3JkIHdoZXJlIHRoZSBiaXQgd2FzLg0KDQpTaG91bGQgSSBpbnZhbGlkYXRlIGV2ZXJ5dGhp
bmcgb3V0c2lkZSB0aGlzIG1hY3JvLCBpbnNpZGUgZW5hYmxlX2Jvb3RfY3B1X21tIGluIGFybTY0
L21wdS9oZWFkLlMgaW5zdGVhZD8NCg0KPiANCj4gU2FtZSBjb21tZW50IGhlcmUuDQo+IA0KPj4g
Kw0KPj4gICAgICBkc2IgICBzeQ0KPj4gICAgICBpc2INCj4+ICBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL21wdS9tbS5jIGIveGVuL2FyY2gvYXJtL21wdS9tbS5jDQo+PiBpbmRleCAwN2M4OTU5
ZjRlZTkuLmVlMDM1YTU0Yjk0MiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tcHUvbW0u
Yw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL21wdS9tbS5jDQo+PiBAQCAtNyw5ICs3LDI1IEBADQo+
PiAgI2luY2x1ZGUgPHhlbi9tbS5oPg0KPj4gICNpbmNsdWRlIDx4ZW4vc2l6ZXMuaD4NCj4+ICAj
aW5jbHVkZSA8eGVuL3R5cGVzLmg+DQo+PiArI2luY2x1ZGUgPGFzbS9tcHUuaD4NCj4+ICAgIHN0
cnVjdCBwYWdlX2luZm8gKmZyYW1lX3RhYmxlOw0KPj4gICsvKiBNYXhpbXVtIG51bWJlciBvZiBz
dXBwb3J0ZWQgTVBVIG1lbW9yeSByZWdpb25zIGJ5IHRoZSBFTDIgTVBVLiAqLw0KPj4gK3VpbnQ4
X3QgX19yb19hZnRlcl9pbml0IG1heF9tcHVfcmVnaW9uczsNCj4+ICsNCj4+ICsvKg0KPj4gKyAq
IEJpdG1hcCB4ZW5fbXB1bWFwX21hc2sgaXMgdG8gcmVjb3JkIHRoZSB1c2FnZSBvZiBFTDIgTVBV
IG1lbW9yeSByZWdpb25zLg0KPj4gKyAqIEJpdCAwIHJlcHJlc2VudHMgTVBVIG1lbW9yeSByZWdp
b24gMCwgYml0IDEgcmVwcmVzZW50cyBNUFUgbWVtb3J5DQo+PiArICogcmVnaW9uIDEsIC4uLiwg
YW5kIHNvIG9uLg0KPj4gKyAqIElmIGEgTVBVIG1lbW9yeSByZWdpb24gZ2V0cyBlbmFibGVkLCBz
ZXQgdGhlIGFjY29yZGluZyBiaXQgdG8gMS4NCj4+ICsgKi8NCj4+ICtERUNMQVJFX0JJVE1BUCh4
ZW5fbXB1bWFwX21hc2ssIE1BWF9NUFVfUkVHSU9OX05SKSBcDQo+PiArICAgIF9fc2VjdGlvbigi
LmRhdGEucGFnZV9hbGlnbmVkIik7DQo+IA0KPiBXaHkgZG9lcyB0aGlzIG5lZWQgdG8gYmUgcGFn
ZV9hbGlnbmVkPw0KDQpJIHNlZSBmcm9tIHRoZSBsaW5rZXIgZmlsZSB0aGF0IHRoaXMgc2VjdGlv
biBpcyBhbGlnbmVkIHRvIFNNUF9DQUNIRV9CWVRFUywgd2hpY2ggaXMgTDFfQ0FDSEVfQllURVMN
CmZvciBBcm0sIGJlY2F1c2Ugd2UgYXJlIHVzaW5nIHRoZSBpbnZhbGlkYXRlIGNhY2hlIEkgd2Fz
IHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgaXTigJlzIGJldHRlciB0byBoYXZlIGl0DQphbGln
bmVkIG9uIHRoZSBjYWNoZSBsaW5lDQoNCj4gDQo+PiArDQo+PiArLyogRUwyIFhlbiBNUFUgbWVt
b3J5IHJlZ2lvbiBtYXBwaW5nIHRhYmxlLiAqLw0KPj4gK3ByX3QgX19zZWN0aW9uKCIuZGF0YS5w
YWdlX2FsaWduZWQiKSB4ZW5fbXB1bWFwW01BWF9NUFVfUkVHSU9OX05SXTsNCj4gDQo+IEkgZ3Vl
c3MgZm9yIHRoaXMgb25lIHRoaXMgaXMgbWFuZGF0ZWQgYnkgdGhlIEhXPw0KDQpzYW1lIHJlYXNv
biBhYm92ZSwgbm8gb3RoZXIgcmVhc29uIChJ4oCZbSBhd2FyZSBvZikuDQoNCkNoZWVycywNCkx1
Y2ENCg0K

