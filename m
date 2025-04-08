Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88EBA7F959
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 11:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941646.1341082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25Bk-0002I0-39; Tue, 08 Apr 2025 09:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941646.1341082; Tue, 08 Apr 2025 09:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25Bj-0002Fe-VH; Tue, 08 Apr 2025 09:24:11 +0000
Received: by outflank-mailman (input) for mailman id 941646;
 Tue, 08 Apr 2025 09:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wetR=W2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u25Bi-0002FY-80
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 09:24:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061c.outbound.protection.outlook.com
 [2a01:111:f403:260d::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b28820-145b-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 11:24:07 +0200 (CEST)
Received: from AS4P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::18)
 by PAWPR08MB9518.eurprd08.prod.outlook.com (2603:10a6:102:2ed::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 09:23:59 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::f9) by AS4P251CA0013.outlook.office365.com
 (2603:10a6:20b:5d2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.33 via Frontend Transport; Tue,
 8 Apr 2025 09:23:59 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 8 Apr 2025 09:23:58 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GV1PR08MB8402.eurprd08.prod.outlook.com (2603:10a6:150:a7::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.32; Tue, 8 Apr 2025 09:23:23 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 09:23:23 +0000
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
X-Inumbo-ID: 38b28820-145b-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wot8TnMIWltg933+eJEQWH05aQ7tqBgYgMeBTox//scUoeOP1UY/lnvKznVNNfJx/9gtN0RgKmohof+nNrAdCA+yhcvIoNMcWwZaSHz/nPZhVyDhPfrm4ybZu8VAh/gxyGCt3FWRb+blNEgt3rIU6UBu4clEfbNniL9/C0o4Ym4qn2172zXHjBwYbwPVZXcljhYJY39wEHKINH21ZynZdhIrcxJgpUuN4VgxOJVeAEwvbgXE2H7tSUC91yzQP6fE/Hjl+DON3xk1hT9BPpXY707IR2zFQgE3WDSaiq4/31xc3cA8BDcoUKMSbVZypV0ocPzJcGvMTyXAhUm0kP8SjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqbh3V8DkGrmBjH/qQTtr5Z/jekRlOHlsfY5WUZHlGY=;
 b=XxJmysfHYcOwP+bjxTjLC7u+cXaNEB0dQrfGJpYJf/rrO0NlRt1oLVF7BuLrkM4HKAFh3iPNCz8MvLLQcJyjZ6rLdU+V469NksmDbPgiGQAEl0+kedsvsATkS7g3OU2NuxzV3HH3F492/dJ4R6gn+feOu2c7e0xQXg6Mu1Y+Kcoebl6TdyOxV9/MQYIP3wBR4Q9vymsfO+N220SwJV1V75QaN0H/Gc4kZEBKhEnb6QTT0BLwbXzMXxnDBwBMKkf/d3cC4aTTD7caBLaz99hVMyIDf1dFME1RtjwKCDD1De2VLJj9jxW5K4B82rKk/jc6BZLeOhXNj1Ei3emBxzSDWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqbh3V8DkGrmBjH/qQTtr5Z/jekRlOHlsfY5WUZHlGY=;
 b=oyXtUAU+HsUi0LeyzOCw+lbcwNjImwkrO+kf7zCui6YVoc6DMobkmNgnPBKmu8m3nyYVRO0dCAoEEHA1/R/1m66rhd9TW3I+hWgfx8WgjKgIWaY4/FYlwbDLg/2NWzixUpiDVIwHO05WYjljuQIvqgNEzGFw8HrBmIJ/IvXya2w=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuchFA3Q41eoByYY4PskiDQaH2TaD2sdYGR/5qRbpsXFZ6vjnQkl8PMyFqYJGFlBeZ+CVgiY6RlEWOwdiiFrJTJ1m8fr+KZcAIyd5cMKyCCCZ3N+Fghz8aDWWLoaCeofHvdq73C9y6uTmuVyv4pOkn0U1y+9jFOPBVwxRWhwVbbWOXLdnV/lM3Sw8dPO82zs+17DGwLLwZTKF1u0rrVVCcyjMGUYlGTU/dxkEU+UZbdzBXyVY8IDC26Kmpt5wlPOst3r7+Xr0GZX+RQXTDAa0uD1j1kgr2vWmZZPPMkvrO3QhB/rPCO0v8O3/+5wmr6rrTxqKlwO3wzE3BLKZVkRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqbh3V8DkGrmBjH/qQTtr5Z/jekRlOHlsfY5WUZHlGY=;
 b=VIS7kf8iGH0Kel1SIrzzjpQEFbi5Q4I0xtqI/22uJWNiEOeeCvpxo7zwJEYjYZN2ANoQ7kRV6OpwTXJAeWHChvefZtgdigLQDZC+le46/SYPn7R7kkFJR/LJV6TlZ1RLRrSSM6AlUYp0jV35Js8ck8N4R/PKF6o0DxSIDsz5QpdD7DORJxjblbVbxjonEV+VdEdjPjn97dRwRfx73Ktp8iYAR51toQSOzQmIZlk0DOnTewemfChEbFZ21jpdp0iFxFAjfinLbEmv0lUKmp+7EUk4pM7vblMyGzOjFRU5v5Zv9uFV3rPR0NCvEQsCIYZ/OVf9ACUyU8tBzQW+ozXwgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqbh3V8DkGrmBjH/qQTtr5Z/jekRlOHlsfY5WUZHlGY=;
 b=oyXtUAU+HsUi0LeyzOCw+lbcwNjImwkrO+kf7zCui6YVoc6DMobkmNgnPBKmu8m3nyYVRO0dCAoEEHA1/R/1m66rhd9TW3I+hWgfx8WgjKgIWaY4/FYlwbDLg/2NWzixUpiDVIwHO05WYjljuQIvqgNEzGFw8HrBmIJ/IvXya2w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
Thread-Topic: [PATCH v5 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
Thread-Index: AQHbp+07/vC6GU4Tpk2NnzEwwALGgrOZf8AA
Date: Tue, 8 Apr 2025 09:23:22 +0000
Message-ID: <5CFB5A0F-E3A1-4F06-B89A-EDB5574F4910@arm.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
 <20250407184443.1790995-4-ayan.kumar.halder@amd.com>
In-Reply-To: <20250407184443.1790995-4-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GV1PR08MB8402:EE_|AMS1EPF00000042:EE_|PAWPR08MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b7ed85c-ba3e-43e5-f664-08dd767f1776
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?mv2dBT+MxQkNTLDa+Gvy/p5HEeLuxD6JcKpT2Gq7uNrE2huTlhOV9v9oDFVX?=
 =?us-ascii?Q?qkgKGAmCxShE/CP8fuAMe7oIe9G6bpKmObALfbjSgDaEVyjJC5EQJbB4Jxsw?=
 =?us-ascii?Q?0NcKkxUMazkI+Xg3y6u4Mz9k8I8yFelne/nbCLTBKf6bF0/QIVQLPSkuQgrG?=
 =?us-ascii?Q?96IdhV9znv8OGuUvX0UCuiwPwM1BqvEHW7AOLe8u9i/zSCjJZTbL6OJV+Vc+?=
 =?us-ascii?Q?Jg8gcN32gOiC9JlxkA7RIKA/jDOqwbBBKFMVw1L2RSgNbZqq8uqid4vTMeYs?=
 =?us-ascii?Q?e9IXje+W6/3QW2KS5J3FgAogEHgvzFrFyEaPMK50cj8y0D2KezZ5l+m+kP9y?=
 =?us-ascii?Q?RMWYUsya0CHJMUXVTCGi9MbbTInhA309/HXJN3ChoGh3K5z9ImzgBOo1XmAE?=
 =?us-ascii?Q?59jHwufQpTnAp+NAZa7QRpCOcoEg966GVhPw+YuTcSL/iHkJgj7bLoHcrUn5?=
 =?us-ascii?Q?Y7hSIv0URgJ9S+bQ7rFAagA3cphZvGfMn3KIBfwu0rpWtiGsGTPRGCHjg+qr?=
 =?us-ascii?Q?Y7CMPU3O8whWmrWvdr1K2ldIAHR7jd0GV3LJgygYDNKcdOkfYr7xGW4r7meA?=
 =?us-ascii?Q?3O2kBFuTudCiSMrb6PDCnfZZKLYczFt9fnvaAtJPi+bWt1LvIl/Q33kPe7v4?=
 =?us-ascii?Q?mhgXUYU0dQuXswGp4MLh+psV2kD+4EQcC+6u6R5WuBJOtaBcbc8w+/BDhKEN?=
 =?us-ascii?Q?HXIPkrz9qCd868gAvuVLHyI9tqBgRDQ7ehn4E1YklpQSNi5byiUO4WE7I66z?=
 =?us-ascii?Q?9GL1VG7fJBbzRuqValj+lShqrIh9tzIMcZOLIE9f4dOcC78eicYsIpBFOYzN?=
 =?us-ascii?Q?I8xvzKZFrXrG3ZAOoyLd45juyokYllclkZNhnQfi44UuX3AGXpVkX3vJczKy?=
 =?us-ascii?Q?Np5HPC4FHKeXJd2F7ThYry0wFOXdtN9KB9mXS1QGcjM/YtV0XH+9lab2vdBc?=
 =?us-ascii?Q?Vy+4EKHnYYrd93DziFWtggHVsmlB/p47j/PqhlUgTD8KqdVQMTDTC+fkhSED?=
 =?us-ascii?Q?VuA+ktHSdCTeI/joa7wbJJrtMSl3MxZgIoAoa8VKcWnhB7RhvHbhOchkpvjL?=
 =?us-ascii?Q?ovM4QK71GqD7gIPkX7R+F/nCZBwdvNjn4h4xFDKe7o57ANBgcV8pOgsD5giC?=
 =?us-ascii?Q?Ik8SxVFrFO8HiybUUjtlsyaxgTohlbOjbQctPyWnY1tIRkztIajhppPhI+HG?=
 =?us-ascii?Q?P//zZSD5K/Dy7aLR2x8jqukjSRh29PjSa8hYh6zgwW3+riKEIugd2Do9mr4j?=
 =?us-ascii?Q?TKOjtwy9HMSbTiu2fux/QuyGh9cTuFDn7wFaUpP8BRjvN6mETzRnWK12G5+U?=
 =?us-ascii?Q?hcIimLXjkigz2zS+eRWZ8l9+jnhCWpCRGh0kabVrvonw7qU0e0TUFOKN+9nX?=
 =?us-ascii?Q?yO1IEtbdmfbifYEEvmgj0HDy9DshiT2hDUIS6QqAAFmZCViHYouTECfbLFrz?=
 =?us-ascii?Q?FAjJdV4ni7ld9KOb03/e4RENCcoL/u2RhJ1uUciQXGV5DEBzxagKCw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7D6AA61CF7307046BB7C7127B0AA4B4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8402
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d266475-c34d-4428-4e79-08dd767f0265
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|376014|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BbzrLjftB4x99diE9nLmK/LzJNnYsmLonzXoRozTqumsCJYhoL16pPyF/qeG?=
 =?us-ascii?Q?+djgRvdZ70Pl1aswEZRyEvvSmKr+A0rEbaqY6tCfmVp/ezte+lO7eP/+8w9w?=
 =?us-ascii?Q?XQdncZ+iyntZ1TGbgCxfisGicsBq4vdMByQuwPvSX/j7tRmmQvstaHiJixV+?=
 =?us-ascii?Q?8UJSAk+HBCybFwMpv/qO/AfG9FO0gn+1iQdDopu5KcsfEI7MICuQBDO/sleN?=
 =?us-ascii?Q?+8G80oC6VerESJrb/XJHxvYsshPUgMU9fpZuVHJtG39acgXJ80V9eHETvj7C?=
 =?us-ascii?Q?kF2VTGL0VgBclS9lC8dGkmJYFIEpNR4iraOt08X/6kQc3U3dGxqzm09HL7ZU?=
 =?us-ascii?Q?P02jf/BkLICK0Gpm+00zPUPARgkeAcKiM6Rwjef9iEgjVbAIX4J723rUDkSd?=
 =?us-ascii?Q?yT2W3hOf97jZjc2LXaYf37xMdFLP7za1YtUk2kgQFGbEuKpPFDFa1CMCFJWF?=
 =?us-ascii?Q?NeGM0KKct6RIPOFBFTrdYIVsuabFyuLlrOE695WGOHvNHcz2vAhBCI8NriRD?=
 =?us-ascii?Q?3Or5Lwxjq+Zzpgjziqu0GWwUynr9qiDY1vseeRXeSNY1Sqf1twZSlXyuJ3Au?=
 =?us-ascii?Q?BgPLNeI9N/ylM1WBVzBIxrkIbHmItjprXOTmmrD4TYmu1V+zwpYBzuK9fMC+?=
 =?us-ascii?Q?Ap6uK9A9pHADAme9GG65gpMEpmeYXI/3u1BBM5OewKiKEOnUN3hizHxSxf/A?=
 =?us-ascii?Q?dedxHS3vM4cBrNSpJApcOcX0cicDyyPYbfLK4fPs1/vORWPSDU4f1vtsvkhi?=
 =?us-ascii?Q?V8iA3l2S9NKOTfsACaPzPRWMaEqWL/0vS4CrSFWD1DT5OQ42Ky0BuzCFsvXo?=
 =?us-ascii?Q?h48kduuCdVX/UZhlwt80EHWAoGJmOdIJIYqe+aZJx0eoSuxZxZpXJbL+Bzk3?=
 =?us-ascii?Q?XZiQ6u9reS+mqR4CK/Yxa5iQnxK4ghHSbJC+jTH5ubtev2Xlqt/lO70fNrT4?=
 =?us-ascii?Q?uYsfSacGQu+cOPdrci4MuTLCWta47Lvzd9Ll+SYOQFn6YAAky0bByxcmLmjc?=
 =?us-ascii?Q?5/fUXHZNkiB+MC6epHLz3iafjJ5II3UUjtHjHaMpBDvJi792zj3M0edpt359?=
 =?us-ascii?Q?p6TVVP6nDjTZGVJKylUUdOPM3rIhTQtkFEHQlBywgB+aswGf/LtPGlywW772?=
 =?us-ascii?Q?El3p4s+NXj5UtlZTrn4keyQi+auL5WKD9KLl/fUcz0ni3GNgT5yaL9PqtSWr?=
 =?us-ascii?Q?33pXVzAdqUG98WIS2Gt+/dFTNGy2E/ij7Nrf0LHUVysMTLS//bRlophcSUEI?=
 =?us-ascii?Q?4+DUGvzb9XvKsbwa9K0T0d1xQXePC4e/FizI3aXF/CNgtbTlSP1VO4WKHuD2?=
 =?us-ascii?Q?N5XTj0+yugAGoOay3RPqZ3oPPQ0evp7dTKQosYbVtLHGBDTngVJrT3UjuOqe?=
 =?us-ascii?Q?2TnwNaN82me8iYk9pYx9Dj7NysMEOrRHgiPyjzqqHEhy2WsBDHCRZRraFwr5?=
 =?us-ascii?Q?Rroh8J1RpXkVxJBYrLu7a9dO49ChzMZRNYc2arQz9AYKZspfylBP4ER+vDcv?=
 =?us-ascii?Q?capPxGWJ4nwV1Tc=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(376014)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:23:58.2137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7ed85c-ba3e-43e5-f664-08dd767f1776
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9518

Hi Ayan,

> On 7 Apr 2025, at 19:44, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> Add stubs to enable compilation
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
>=20
> v1, v2 -
> 1. New patch introduced in v3.
> 2. Should be applied on top of
> https://patchwork.kernel.org/project/xen-devel/cover/20250316192445.23764=
84-1-luca.fancellu@arm.com/
>=20
> v3 -
> 1. Add stubs for map_domain_page() and similar functions.
>=20
> 2. 'BUG_ON("unimplemented")' is kept in all the stubs.
>=20
> v4 -=20
> 1. is_xen_heap_mfn() macros are defined across mpu/mm.h (ARM32 specific)
> , mmu/mm.h (ARM32 specific) and asm/mm.h (ARM64 specific)
>=20
> 2. s/(void*)0/NULL
>=20
> xen/arch/arm/arm32/mpu/Makefile   |  2 ++
> xen/arch/arm/arm32/mpu/p2m.c      | 18 ++++++++++++++
> xen/arch/arm/arm32/mpu/smpboot.c  | 23 +++++++++++++++++
> xen/arch/arm/include/asm/mm.h     |  9 +------
> xen/arch/arm/include/asm/mmu/mm.h |  9 +++++++
> xen/arch/arm/include/asm/mpu/mm.h |  5 ++++
> xen/arch/arm/mpu/Makefile         |  1 +
> xen/arch/arm/mpu/domain_page.c    | 41 +++++++++++++++++++++++++++++++
> 8 files changed, 100 insertions(+), 8 deletions(-)
> create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
> create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
> create mode 100644 xen/arch/arm/mpu/domain_page.c
>=20
> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Mak=
efile
> index 3340058c08..38797f28af 100644
> --- a/xen/arch/arm/arm32/mpu/Makefile
> +++ b/xen/arch/arm/arm32/mpu/Makefile
> @@ -1 +1,3 @@
> obj-y +=3D head.o
> +obj-y +=3D smpboot.o
> +obj-y +=3D p2m.o
> diff --git a/xen/arch/arm/arm32/mpu/p2m.c b/xen/arch/arm/arm32/mpu/p2m.c
> new file mode 100644
> index 0000000000..df8de5c7d8
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/p2m.c
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +

I would add:
#include <xen/bug.h>
for BUG()

> +#include <xen/init.h>
> +#include <asm/p2m.h>
> +
> +void __init setup_virt_paging(void)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/arm32/mpu/smpboot.c b/xen/arch/arm/arm32/mpu/sm=
pboot.c
> new file mode 100644
> index 0000000000..3f3e54294e
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/smpboot.c
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +

I would add:
#include <xen/bug.h>
for BUG()

#include <xen/errno.h>
for EINVAL

#include <xen/stdbool.h>
for bool

> +#include <xen/mm.h>
> +
> +int prepare_secondary_mm(int cpu)
> +{
> +    BUG_ON("unimplemented");
> +    return -EINVAL;
> +}
> +
> +void update_boot_mapping(bool enable)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.=
h
> index fbffaccef4..5b67c0f8bb 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -170,14 +170,7 @@ struct page_info
> #define _PGC_need_scrub   _PGC_allocated
> #define PGC_need_scrub    PGC_allocated
>=20
> -#ifdef CONFIG_ARM_32
> -#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
> -#define is_xen_heap_mfn(mfn) ({                                 \
> -    unsigned long mfn_ =3D mfn_x(mfn);                            \
> -    (mfn_ >=3D mfn_x(directmap_mfn_start) &&                      \
> -     mfn_ < mfn_x(directmap_mfn_end));                          \
> -})
> -#else
> +#ifdef CONFIG_ARM_64
> #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
> #define is_xen_heap_mfn(mfn) \
>     (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm=
/mmu/mm.h
> index caba987edc..9b98d12b07 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -21,6 +21,15 @@ extern unsigned long directmap_base_pdx;
>=20
> #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>=20
> +#ifdef CONFIG_ARM_32
> +#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
> +#define is_xen_heap_mfn(mfn) ({                                 \
> +    unsigned long mfn_ =3D mfn_x(mfn);                            \
> +    (mfn_ >=3D mfn_x(directmap_mfn_start) &&                      \
> +     mfn_ < mfn_x(directmap_mfn_end));                          \
> +})
> +#endif
> +
> #define virt_to_maddr(va) ({                                             =
      \
>     vaddr_t va_ =3D (vaddr_t)(va);                                       =
        \
>     (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MA=
SK)); \
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm=
/mpu/mm.h
> index 86f33d9836..bfd840fa5d 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -13,6 +13,11 @@ extern struct page_info *frame_table;
>=20
> #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
>=20
> +#ifdef CONFIG_ARM_32
> +#define is_xen_heap_page(page) ({ BUG_ON("unimplemented"); false; })
> +#define is_xen_heap_mfn(mfn) ({ BUG_ON("unimplemented"); false; })
> +#endif
> +
> /* On MPU systems there is no translation, ma =3D=3D va. */
> static inline void *maddr_to_virt(paddr_t ma)
> {
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> index 21bbc517b5..ff221011d5 100644
> --- a/xen/arch/arm/mpu/Makefile
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -2,3 +2,4 @@ obj-y +=3D mm.o
> obj-y +=3D p2m.o
> obj-y +=3D setup.init.o
> obj-y +=3D vmap.o
> +obj-$(CONFIG_ARM_32) +=3D domain_page.o
> diff --git a/xen/arch/arm/mpu/domain_page.c b/xen/arch/arm/mpu/domain_pag=
e.c
> new file mode 100644
> index 0000000000..8859b24e04
> --- /dev/null
> +++ b/xen/arch/arm/mpu/domain_page.c
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/domain_page.h>

I would add:

#include <xen/bug.h>
for BUG()

#include <xen/mm-frame.h>
for mfn_t and INVALID_MFN

#include <xen/types.h>
for NULL


> +
> +void *map_domain_page_global(mfn_t mfn)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +/* Map a page of domheap memory */
> +void *map_domain_page(mfn_t mfn)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +/* Release a mapping taken with map_domain_page() */
> +void unmap_domain_page(const void *ptr)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +mfn_t domain_page_map_to_mfn(const void *ptr)
> +{
> +    BUG_ON("unimplemented");
> +    return INVALID_MFN;
> +}
> +
> +void unmap_domain_page_global(const void *va)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --=20
> 2.25.1

with the above addressed, at least for me it looks good!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


