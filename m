Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92602B02029
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 17:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040986.1412180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaFOp-0001Fb-0X; Fri, 11 Jul 2025 15:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040986.1412180; Fri, 11 Jul 2025 15:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaFOo-0001D8-Td; Fri, 11 Jul 2025 15:10:54 +0000
Received: by outflank-mailman (input) for mailman id 1040986;
 Fri, 11 Jul 2025 15:10:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cwzd=ZY=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1uaFOn-0001D2-3Y
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 15:10:53 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b2d9b2d-5e69-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 17:10:50 +0200 (CEST)
Received: from AS4P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::15)
 by DU2PR08MB10303.eurprd08.prod.outlook.com (2603:10a6:10:491::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 15:10:48 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::8a) by AS4P191CA0005.outlook.office365.com
 (2603:10a6:20b:5d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 15:10:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Fri, 11 Jul 2025 15:10:46 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by DB9PR08MB8700.eurprd08.prod.outlook.com (2603:10a6:10:3d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 15:10:14 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 15:10:14 +0000
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
X-Inumbo-ID: 3b2d9b2d-5e69-11f0-a318-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nW1tTNAc9wyqFOBXbJf/NxCTwPnRpUwbOraXVUNWbWiLPtASE5MW+/piichF4f4Vt3IxwoRWGKU5QEbgOZ6BDgDL0Kdy5oT7Yh06s400iMmm41SlBzlxaWFIHpSq+KxfTMRJrrkObm7d5lXIBvmbEiQzfiQzzmv6kE/U4fXpZzsYME/fAPuhq4HRLRXrU/cfmtQDJzftIPb957SYRlo8Q7H7rT6nsocXfGClZUoPwDZhqf2JLHeoCH+6TQ7rubVSeN7K9/ncaG+GV4NC1mgM4jnUxe7tQhveZ1DTdQRwl/27mhRJuKPS2LYKEkSanor2eQ/vpwJVIwiNIE949qSfdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlTiRJQ8mZ5wi2sckV11pmO+dZ1BAlzX1ovRpXCAuMI=;
 b=mUgrWzqYgrPigRGAoNR35PV+rCFPLYJGJb7q6yUzWVGreVsGR1WqHPbSZpB6+WNlIOUW+AYtWrbSBO3/ptlQHhguVBfWK0rl9tLG6lWmJhOezEsWFip9T+tCxJcRnFJQ0PLHw5M2tAjNe0IHTG8l3ffuHBqrf5yttbWWOiKKreyXOw21xkWdAIZWflWlW2Iuq90HitSuMfFZ3WbtarGLn+8SG+OIU7+jOkCgY0pk9RvVvSgCFq8WN+WSnK4Xeymi116VsjWVVFHtVWL3GwVzbKxhcDP6DORh1D0YTJiDCtKouVTqvFgoqjrB9pEmI3xYUVaZrh968rrVXqCvZpPirw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlTiRJQ8mZ5wi2sckV11pmO+dZ1BAlzX1ovRpXCAuMI=;
 b=a/PUuvK4kf9nySRwhDDbfEfdO2qgWKGpx7VfM1bU/tUAJkn6+EanB/UIYewrHyHtXqZ6433vjHH4kI6kfyHFIEZMAjA6jiLq1x9oUG7o4P56fj3laWkX7UBrdr7+6OYqePyPwCWV7T6iQp0TIYit8xwMHlNIGdmXskq8BMufRxM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4kJPQjRBWsj4LQMciFAEl5x+il2/O8hLlcJOClHtMHf6oIvoJah6jFzq1b99ImwW1BUgDhoFIfb1thDOX21oWoCiKTVMLGRKhgquxuJiP4DR9FdJ+XLFLo/znBXVF/ML/hgtJrSdoeFBCW82ur6ziJoXPYSxhh4jmhifJ1og+4cdV1ihmXNbV5WcDWD0eMbS/Pzdy0ZaAKtZFug4rL+TW8588cxkAwFuu2U07F+vpOdB26TOEilABJ/AVS+I0OBBLuZdS7ka7YHlXQ6W2MrTe5sIvJpIwbQCqBY+wWPcQXl9OajEMpkQj6yaI+A+LPeP4C94D7awT3jTzsX3/N9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlTiRJQ8mZ5wi2sckV11pmO+dZ1BAlzX1ovRpXCAuMI=;
 b=haq30ZtLTiDkn2h+Dooyr2fswURvJYZzI8kDROvNzH9VY/Q4tGtiAEjwygYbj8NetFvzUw4HumSWro9qsEO/TPYDZ/KVAY9tFnyIO+9W4iTCxsp2jCJfVEQ31X+tUNB4nwDegGFZn+wMZaOVw4MZonPHvmG86d/jJ/0VuiyYc1qV/JhPPwsobpJ5aHfyIWteFPde8Pke0tnHVll6t1pfarUEQjotv8hpoo8Otiq3GvCm+gQnRljvEvGvng6laYcseY1oIgct6/xWujr7AGKLktmbwZS28NGiNgUSOVDjx5ZOSpHV8GbD2RO5M7qlyiS/HcJxmNte9yh4dWRUG8VhpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlTiRJQ8mZ5wi2sckV11pmO+dZ1BAlzX1ovRpXCAuMI=;
 b=a/PUuvK4kf9nySRwhDDbfEfdO2qgWKGpx7VfM1bU/tUAJkn6+EanB/UIYewrHyHtXqZ6433vjHH4kI6kfyHFIEZMAjA6jiLq1x9oUG7o4P56fj3laWkX7UBrdr7+6OYqePyPwCWV7T6iQp0TIYit8xwMHlNIGdmXskq8BMufRxM=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v2 3/6] arm/mpu: Populate a new region in Xen MPU mapping
 table
Thread-Topic: [PATCH v2 3/6] arm/mpu: Populate a new region in Xen MPU mapping
 table
Thread-Index: AQHb7xapMqVBDEQHDEWQJpPnvrkhn7QtDZOA
Date: Fri, 11 Jul 2025 15:10:14 +0000
Message-ID: <0A1A20B1-6F67-4D64-BC56-C68EC2AC46A4@arm.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <5b67459af62106197fb551d35ef1708f0bb5beb6.1751464757.git.hari.limaye@arm.com>
 <93fd423e-b104-4679-8b50-69b982ae14a4@amd.com>
In-Reply-To: <93fd423e-b104-4679-8b50-69b982ae14a4@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|DB9PR08MB8700:EE_|AM4PEPF00027A61:EE_|DU2PR08MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: 169f9f40-49e2-43a2-bdea-08ddc08d1cc9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?c09hOVhnOTRKVGZESWFtMWRPY1A2MUJlQVBlVmhpbm9yWXhyWnRKZlBXSHFZ?=
 =?utf-8?B?ZkczdXhRL1BmQU9OaFQwRXVuL2RrMmd0TnhpU0xvQXV5cDA5b1c2aFFjTDZC?=
 =?utf-8?B?UUdGU1pRMUR0WjREbHZ3SlZRWFI3WEJ2dldzUVpYTUtOeDREQjRZam4ydmw0?=
 =?utf-8?B?ZEJzTm9RQmhubFEwWDRaRm1jSUJnUnJpUXU1UUxUcS9NdUkxMEhTTkphM3N3?=
 =?utf-8?B?QndoRU04eEY4TkVKNEFjNGU2OFNOUG9RTzdDM1Zkdk1OQUJvNkJIRllPNkpC?=
 =?utf-8?B?elVpRWtNR2N0bEJFVG5hclMrUDhNT1hZeE5LVC9pWDBwRDRaR01SVGhoYWRB?=
 =?utf-8?B?dUw0OXlZMnhVMitXR0RBeXhVQTIzd2VjZ2EzdkJheHQxa0JyV1RENjhQcWhp?=
 =?utf-8?B?UitSM21vTFByNFVjeHFXVEYxaThreDRORkR0L2t3NFRTRUE5MWtzNDNKSlIx?=
 =?utf-8?B?bUlsUHN4d21vR2hZYlFvOE5NaWxrZWVTazJLcVdCcGk1WW1ySnowTFhGZExP?=
 =?utf-8?B?blEzT0xLQ0l5dEd2V0NPYnlyOC9pR21mWitJL3JmMDByUUFCUGZ2UUZ0cm8x?=
 =?utf-8?B?amE3ZzQwc1hRZnhsdFVHQnE2K0k3SWdLSFd2MWs2R2RPWE9GS09ucm9VbG1h?=
 =?utf-8?B?cWRaTlNvNnpUb1hhSXFPWEJ6bi9mUHg3ekcyNGpHSHhmS0tSVzI2dzBkRWZi?=
 =?utf-8?B?Z0syZ2JhYmJCS1dxUVFmd29ZMjFYekpzUTF2aDZNWDVweGxzVXpJaUlFNWxz?=
 =?utf-8?B?anhJTnI1RVlyZ2pIclFTS2R0K000SVRqTW1HcURTTUl4dHFHUW5mRjlKZGhr?=
 =?utf-8?B?aXpQdVlyTjcxTm5CU3NKY3JaaWZ6b3Fhc3dJejVZMVY5QWk4cEttazZ6c1ZZ?=
 =?utf-8?B?aDZTQnpZbDM5RjAzdFdEMGtmZEFqRVhsK2pSdnBWdjhDaHNqWWllb2ErbmZ6?=
 =?utf-8?B?U1ZSc1pVVnc3cDBPdTZmR01NM2ZXKzBBTWhENVdZU1l2NW9IVkxvcjdPRkFy?=
 =?utf-8?B?dzUyRSt1STc0aTFCYzJ1bUxCMGR0ZEhZM041cERiYXpvVWMvN3E4YmwraU10?=
 =?utf-8?B?aVN4MjNNcXZTRysyUmVLb3l1NVhuVzB0N1pVamR6VkdoV2ZMNG13d290Q0tM?=
 =?utf-8?B?T1ZGMkRPWmlRRGd3Ym93Q1RZVFJER3lDV0lUTklwYlhTYTh0L1poaklSWWlH?=
 =?utf-8?B?WGRjTHYrbG1md3c5bmRrQlFOQllTaW9UQXVaWEZkbzlKRzh4Zng0M3prajFS?=
 =?utf-8?B?bnlQWllFTzN4UU1GaWZBdzFjamN4N2xMbkJGc3hvTEdDcEp3ZmgzckF6cXh5?=
 =?utf-8?B?S05lcEVUTkpsRFdoTS8yMnF1K3BzUkRKVThjUnVnMEczTFVzYS9HWFNoa0VF?=
 =?utf-8?B?S0VnOFhvb1pIMVJ4UHZTNkh4SFI2NTZ3cHd5LytmY1h3UDdZRi8zbmdTdDc0?=
 =?utf-8?B?VkFEYXlnZlVyZ1RscFoyN2hyYTdvWXM2OVcrYmVRcFZ5SnN5T2JZVk93aVFx?=
 =?utf-8?B?THJGb1lKQzhISC9SUmszM01HcEZ6d1VIeUhJcU9GenUzVndKVE1peFVrQnJ0?=
 =?utf-8?B?TzJDMzZlVmUzVVE1S2FKbGRoNmh2UklkTkFnU3ZxYkhuNGxsUlBTVG9rTDFJ?=
 =?utf-8?B?c21hOVFsRVpWZVVKMTd5OWtxRDl5cTJNTk1wTzF2QmJScGhSRk80VzRFSXJC?=
 =?utf-8?B?Q2hEa2J3YWJFZ3BFYUNORGtJa3craDZMakYwUDdKcG5iak9nbndMZjJLcDky?=
 =?utf-8?B?NXZsV2oxcUduZTNSOUcvbk1pWE5ORGRLc216c0RKb1NCR2VRcE5EcDZvUWRj?=
 =?utf-8?B?elo3T1RGd3ZkK20rQ24vMHlXTTM0SHZPWmVhZFg2aXE0c0pqR29oUFhMWHJ5?=
 =?utf-8?B?My9oYURaSWltMUlKc09iU1diWnFlbitOVTBBOUhVNkswMVdIdjRxWFZrWHQ0?=
 =?utf-8?B?enFibitXR3NYOEhVeUNmQkVnQ21wNVdTeTBQaVhzc1NlOWFGMzNmaHl1L0l5?=
 =?utf-8?B?YU1IOTEwakhnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A07301611D2054E8AA4EFB3ABFD11EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8700
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2fdd362f-8619-47d3-8ed7-08ddc08d09a4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXdOUkFWMXZSZ0pobDAwTmF3eDNzUElMa1J2aUdyUTN5eGx6YjVVWUlKdHZ0?=
 =?utf-8?B?czNLbWlONW4xNDNidDhZMkxTQVlsUm5YN3l4LzZCUHRXcG9BT2FjRnJsQ0JI?=
 =?utf-8?B?cHdLb1Z1bVBLUGNGY1FCeVBSTlZWTWpobmNnRDJTbFhHTEVMVVgxbHI1a0ZU?=
 =?utf-8?B?UDBvWk1TRGI3ZW5VaDVKYVQrTmFIdVNMeWVuMWIva0FYbDdYU0hLOFNMckFD?=
 =?utf-8?B?YWUrbU45SG00KzdweDVUZDN2WlhjcEd5YWFNZFJMUFY1dHBya0N4K3BKdmc2?=
 =?utf-8?B?cnNLNkFBT0F6ZUltZEdrQmcwL25MYVhBaVZ2WXpyYzVvYXUyaVM1UTFrTzhH?=
 =?utf-8?B?OUxUTnBVSkxRVmoreWEyRStwaXJaa1NUM3ZGcW5Eb2p4U1FZSGRZWVJ1NFRr?=
 =?utf-8?B?cmplTU1kUDFTR1dxaEU2aEZnakUrT2dnV3RqdkxmTlBTRUhFQ29vL2tra3dx?=
 =?utf-8?B?QjU4WkF2QlpSTmZVM1pmdVkyYU55aXo1cXNNdHA5NmpPR21NT2Y3RllYSWZY?=
 =?utf-8?B?SHFIb3czOWwyKysyNGFzUk4vSldGWEV2ZW94NU9iMDRNd1Y5UUpFYmZTUFpx?=
 =?utf-8?B?V2ZZWGZIcjhlQkZVdUMvb2VBcmRRVUxXODlHUEhBMmd3UkZlRHNoa3ZkWCs5?=
 =?utf-8?B?dGtIdDcvUE5xK0RET1dTUWN5QldtaW1aNGhYWWJxQ2wxZUJxakd1dEFGZWxW?=
 =?utf-8?B?R0JsTFQ3WDlac2NzanpBaGoyYkJvN0dBVmRhdGZCU3FDUVdEdlY2bDZUTVdv?=
 =?utf-8?B?czlLa3FjY1VqZElLazlxSUl2UXl0YWhETjQ5L1lQZ2pORVUrSHl0amZJTUM5?=
 =?utf-8?B?YUxFMEtXcVN3aFhYdmZSZUREdmVMZ3VHdEV5ckJkYzJ1aDdGVUh3eDc4aGFn?=
 =?utf-8?B?SEFpUnI1T3NDWjQ2RlNpOVdlVlVBVkpBU3V1bTJsekxXNW16aDFta0hOZ212?=
 =?utf-8?B?WVNPVHpaVHlmZVcxMW1XU2hsaVBaMytWS3c5RFJWRmZQN1JzTE5VS1BHZmFt?=
 =?utf-8?B?MmVqOWlkbEcreVJwS05WdWZYdTZhall3L0FIRGpHNFozSUwxbVkxNFRBVUJE?=
 =?utf-8?B?S3R3c09SNXNHcmJFMXE0dU5hOHpiSmNiR0xicUl0aHBYYjlXc3VmcWFCRjN0?=
 =?utf-8?B?TWJrSEQvaExrOTBud0dCK2lWeEFmNEN4dDR5N1NiSCswcTZ5am5yNkpRZkZX?=
 =?utf-8?B?N2tEMmpySXFOWTVVK0pGRmp4Z2lJTVVEY3NlUThqemZlbitZNDJ6czJId1Jl?=
 =?utf-8?B?S3FacmppRUdZTTAzb0hpL2IyL2VXVFpZOUlSM0NIT1NBNFozMlp2UjlNbWZZ?=
 =?utf-8?B?d3lPaEF6Z0FLMU1tMUFUNGNxQllGQXQya0tta0xFV2dxOW1na1hYRVV0Q3lx?=
 =?utf-8?B?UzlYbG14ajYzY0Q0WlptNllHeFN0U1lmYVNLZS9jQm5JRFhjb28wbTdXdE44?=
 =?utf-8?B?cmpyYzFPWUNXSHNYS2FEM3R5UjRZY2lDZnZrSjhLUUVuSjlyQUVBb3lzYlFl?=
 =?utf-8?B?Zzg3VEFVa0ptYVNpaDJiQy9NZmhQWTY0Sk5yQXlsWWRmQnFJQmVrbmQ1NUpV?=
 =?utf-8?B?MndlWXdQc09pNTBRbWppZ2grcEdrOXRwUkNSTHRpREZmeXU0WGZYUVFIcHJY?=
 =?utf-8?B?cUt3enhEUVZHdkxzOFNVMTltK3M0cTY4czVhbkp2SXhSRFJDNmZZZ0FVaS96?=
 =?utf-8?B?RGx4bDhyTzFWSy9qMG5BeDhyTGQzajVFYW1oRlBUTUdQeTlCNlB0L3B6V0dM?=
 =?utf-8?B?ZENTb1dNQnAwNlA3b0ZQMmg2aFNzbW1XeWI1ZmhyMUVzb0FBTG51R3VObDF0?=
 =?utf-8?B?TTN1aCtXcndZSHpBV1AwUHJ3NmdyMTd1Ly9rUEVkVmZlZk9FMjJ2Vkd4bEkv?=
 =?utf-8?B?ckZpM3FLQUs5Um0waTB3M2VERkJnbDFjQVl3NXNVM01pcVBSZmQ3VmZwYlVz?=
 =?utf-8?B?bGxNeHQyOCs1TUF3czR4SjNtUXFOVFpVaE94c2pMaUlwVTRxWklxNE54UldV?=
 =?utf-8?B?eVJ6M1M3c3pwK3ZBK1RHcGM2NnhFZ0lSRWQvZkEwREY4ZVQrVFJYSkVMa0Za?=
 =?utf-8?Q?MzVRYf?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 15:10:46.1490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 169f9f40-49e2-43a2-bdea-08ddc08d1cc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10303

SGkgTWljaGFsLA0KDQo+PiAraW50IG1hcF9wYWdlc190b194ZW4odW5zaWduZWQgbG9uZyB2aXJ0
LCBtZm5fdCBtZm4sIHVuc2lnbmVkIGxvbmcgbnJfbWZucywNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpDQo+PiArew0KPj4gKyAgICBpbnQgcmMgPSB4ZW5fbXB1
bWFwX3VwZGF0ZShtZm5fdG9fbWFkZHIobWZuKSwNCj4gV2hhdCBkbyB5b3UgZXhwZWN0IHRvIGJl
IHBhc3NlZCBhcyB2aXJ0PyBJIHdvdWxkIGV4cGVjdCBtYWRkciB3aGljaCBjb3VsZCBzYXZlDQo+
IHlvdSB0aGUgY29udmVyc2lvbiBoZXJlLg0KDQpJIHRoaW5rIHlvdSBzaG91bGQgYmUgY29ycmVj
dCBoZXJlIGFuZCBpdCBzaG91bGQgYmUgZmluZSB0byB1c2UgdmlydCBkaXJlY3RseS4gSG93ZXZl
ciwgdGhlIG9uZSBwbGFjZSBpbiBjb21tb24gY29kZSB0aGF0IEkgY2FuIHNlZSB4ZW5fbXB1bWFw
X3VwZGF0ZSBpcyBjYWxsZWQgaXMgaW4gYHhlbi9jb21tb24vdm1hcC5jYDsgYW5kIGhlcmUgdGhl
IHZpcnR1YWwgYWRkcmVzcyBpcyBub3QgdGhlIHNhbWUgYXMgdGhlIG1hY2hpbmUgYWRkcmVzcywg
YnV0IGl0IGxvb2tzIGxpa2UgdGhpcyBpcyBvbmx5IHVzZWQgZm9yIExJVkVQQVRDSCBhbmQgd2Ug
cGVyaGFwcyBkb27igJl0IGNhcmUgYWJvdXQgdGhpcyBvbiBNUFUgc3lzdGVtcz8NCg0KQ2hlZXJz
LA0KSGFyaQ==

