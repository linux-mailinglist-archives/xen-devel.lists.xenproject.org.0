Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E4BB39888
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098054.1452185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZ7w-0006dP-86; Thu, 28 Aug 2025 09:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098054.1452185; Thu, 28 Aug 2025 09:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZ7w-0006bT-4j; Thu, 28 Aug 2025 09:41:04 +0000
Received: by outflank-mailman (input) for mailman id 1098054;
 Thu, 28 Aug 2025 09:41:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zjrZ=3I=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1urZ7u-0004yu-G2
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:41:02 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b3de217-83f3-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 11:41:00 +0200 (CEST)
Received: from DBBPR09CA0029.eurprd09.prod.outlook.com (2603:10a6:10:d4::17)
 by VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 09:40:53 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::2c) by DBBPR09CA0029.outlook.office365.com
 (2603:10a6:10:d4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.22 via Frontend Transport; Thu,
 28 Aug 2025 09:40:53 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Thu, 28 Aug 2025 09:40:51 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by AM8PR08MB6403.eurprd08.prod.outlook.com (2603:10a6:20b:355::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Thu, 28 Aug
 2025 09:40:19 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.9031.019; Thu, 28 Aug 2025
 09:40:19 +0000
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
X-Inumbo-ID: 1b3de217-83f3-11f0-ae26-e363de0e7a9e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fSaftOncjEI2DuZ/r0S96IfFvUFmtpMu5H7pGzECS0TivcyAlSpWpCeUOENkajnw1LktDJFSy2LuEPnvf3j4/77eLza6ybUrT3+PYlf76NTtcxM2eoqtuCSoMq9TwRMA8PJj9yT+nWcH6T3SBz9jSiKtIJ4qmvYx8k9g4o8U+E2DtxvJY+y3UUd0mxfM7Cf6J/BTbU9G044jDDZBvSC7H7JPUxk0ePXrru8daiM7Nuz90yWYdAJjgUfaZY4CFIoXEEVXjnHVOINRl27L8b2kAIkb0LYlTrYwUkO0RNAuyUmQjiZCUb8wQqrbEBRdHMMKGVqQOmmU6mTiNuI8TiNRmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n52Ym4k8awErauqtN8zpuL5y/bRLdy0wyKuADI0mL8w=;
 b=qXi9T52ucw49NUAgB7hhJ9c6RKpHg+Mx+e0EDEhBBspyY/RzOLYdbE0jsbatcHaKPrnSSJuVC7Rv4Oi5Mb2oB0vwaMhB90pgdKvCysYGuZFHDevH0st2aKv1Y9mFvhYTuE0asluXHRfybtPzQDHwrWbh8iN6D/tbszGqzWDHiRXrCkowdYPNEnmh3HSwMfSH1tUCdrFwUcVyf4+pIna3T1LEGCgg35Ab02cif6fuCG9o8FrJvlqqthLgEStiF1lEjOFFXfatOz7gu0MxRXu6HfxNeViCiGq0IJ8GcVKk68EQEBDlMRAgO14f9CsHSdcKjQIrMHYOwc2n0uRYRiGqEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n52Ym4k8awErauqtN8zpuL5y/bRLdy0wyKuADI0mL8w=;
 b=Elxva6QzTapiGr/3uNbuG/MAqJB6aSGZv128vVSjfL+yBF5acbLkUMgfdJ+XCU6uC4k9iD3Dbs/HIUTfeev2yOjWAXtZOAn+3wphc0Gi56e0a/tm0+5fdzOt36vc2ijT/3q1ZJzgnncio+MnU8e88lTyqgcKxygqsfvwK90hw/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6B1PtggluCRANcGYLZnL73Shfl3pdL0dw0Jq/fcVWXfuiwJtmxqFzvEcqREtkFbO0tczIM6qEv4bQsFm/0WZbqmvhPqOKWqLXTtEM+TZecpdoEIeienA/2aPeacod2l8wrNHcAAKgEY08Pj0CWOOks5S85GH2PxSdQnUeLbXZaKZEqGQeGQCSrbxygibdxU35+jHxzySU8fUCCThOHCGOCWUDPLi3bcBnxhn/2oQT6IJ9OPlYv0vqRaFpPal6YIHXgEjRhG77Dj3nZQP0oHh2xCTh/NHBb4yXAFtJOdTysFC84xNNp+xn3s/D0sycCnyHsiOwFdTgGW+HuuDH3pLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n52Ym4k8awErauqtN8zpuL5y/bRLdy0wyKuADI0mL8w=;
 b=SxV2+NjGt10wLC8YDM38NJwpLKgnz8CvBgxOd+2igcE9x3c/OfbyM5Y4ZDb/ZtxQqDHE1gz7Vsqe9K7VP41lHkmHDE1N+XxeaRQYBZjREIYcOqIhFZyFu6EHeZ2NINSVOc+RS2MUrh+a1AxCvP5ASbxbyGcd2T5NUfMXHgUBD3S1qCtQAsRJKjkhF//DT+XjTqeiLlayubCeAQuTZArZkv3jk5MzYU6naQb9x2e4dvM7KWUmSHKXWMObRlmDXUhuzguFw9MlGVIy+WKRnSx8JfuHCOFWrvNPzStPukVi5trgOFDfe6d/K5tCgSuFgagRafPWHUUKRYV+jsv1KN2Eew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n52Ym4k8awErauqtN8zpuL5y/bRLdy0wyKuADI0mL8w=;
 b=Elxva6QzTapiGr/3uNbuG/MAqJB6aSGZv128vVSjfL+yBF5acbLkUMgfdJ+XCU6uC4k9iD3Dbs/HIUTfeev2yOjWAXtZOAn+3wphc0Gi56e0a/tm0+5fdzOt36vc2ijT/3q1ZJzgnncio+MnU8e88lTyqgcKxygqsfvwK90hw/A=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/5] arm/mpu: Implement transient mapping
Thread-Topic: [PATCH v2 3/5] arm/mpu: Implement transient mapping
Thread-Index: AQHcF/1H84gXhbGzU0K5yIusBBold7R3z2EA
Date: Thu, 28 Aug 2025 09:40:19 +0000
Message-ID: <4FA3E89D-A3F1-4A80-9E76-CF7544FD5795@arm.com>
References: <cover.1756312498.git.hari.limaye@arm.com>
 <80b0b3f84ae73f7d92d1b1cfe057ffc438882725.1756312498.git.hari.limaye@arm.com>
 <b9e9a44b-c718-468b-993b-419658c44667@amd.com>
In-Reply-To: <b9e9a44b-c718-468b-993b-419658c44667@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|AM8PR08MB6403:EE_|DB5PEPF00014B97:EE_|VI1PR08MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: dcbf449b-fc91-4d0a-2067-08dde616fa32
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?0WwKcycxSDTLb823x9BmMHb3AaFkq2JZXFFtocF7aozvfxPcK2MsdgB5eAGs?=
 =?us-ascii?Q?yB02RNu16sccfB49Sq6/YDHMA9zVO7W4oleud8g/nfAK+KWM4WTCCpY0dMla?=
 =?us-ascii?Q?4vcUMvPCH2nksRvacvrCpNsXxGGTxlSinpScENJdnB2RaXEm5ooHlbf1WqNB?=
 =?us-ascii?Q?NtQfS51PHYVz56my2RQcgRl9Ab1HNFdFXC0iy7sDG0swLke0+PsYfUiXlMQY?=
 =?us-ascii?Q?j6KLetdxJXwNXn3w+8owm6MAxBK8VyTEh2KuO6Cxq5I9UJsMHtsvnnzYdIZt?=
 =?us-ascii?Q?vF4DzJloFpa/vWQXSZ2LWuaWMOgIihBDt5dAr8Redtnub2vp5AN1bhewEA3b?=
 =?us-ascii?Q?1EqUeB9VvOzHGGGp4uG+FNQBIOvg06TrkLHEg7aPP0ouddkZ/4BKt1isIgYZ?=
 =?us-ascii?Q?iFseYJMbftiskYeTjZHeqOh5ZS4TTHNIhdyaLQe5JoHIR7Vvd7r9Mbecn/0U?=
 =?us-ascii?Q?AbdldNyRTY2cHmHWYFcz5KaF4oDTzZ3Rozz6eEe5qLXWudJDNDbHFgJtgTdt?=
 =?us-ascii?Q?EwrJqYo+EtS9BLhPcz+tLZBCdw8r/O5YTqgvoIk3kNHHuN9LpiISjDpaokbL?=
 =?us-ascii?Q?mwVhMrDX91fG5gnbIdFsvbz4u23V2zlqOjiVpqdhjYM2xzuEeTzxJ9YMNmU/?=
 =?us-ascii?Q?MqGiqXhcyMTR8LWQs9ioAP3F3LpEbmcH9TNOonOAA2lMdSslFBeu/zSOw4Go?=
 =?us-ascii?Q?jPlRFZj+GBdezGoMxCWvAgF3Ls+WAPp8zgeh58ORkvrmF3tZtcLjL7ZQnmRL?=
 =?us-ascii?Q?WinGRkE7O7hRSEsCTRxtfjB70JYioBMVgUjdglwG1/Fa3lK5dHlftdG3BpM8?=
 =?us-ascii?Q?7YuW0/ExGpxgU/1aa4n9PwsKII+G01wYXgg4Edbg74BCFerJuGjjCs1e9O1K?=
 =?us-ascii?Q?OQ6wC13MCe7UeQjnHcgE5lu4JluGI7of94tP+odSVAUqwDD1UJfNCNJaAwvi?=
 =?us-ascii?Q?jAvWWQ8eskVS4DRnW9jzzD1zxxowun9KSWI4bMl0wpd5x223ae5t2GXyWXeO?=
 =?us-ascii?Q?aA2N4rZRNTTKSqZ7p8eiEFNUEIayqJlAfUWroLZJE3XiJcjPjIfTmeKdO2mC?=
 =?us-ascii?Q?UfdFvzc9Jgrww5WJHTRHP2ZWrBydTZx2/d4fuJ5zIze2BqBz+DXDxD3qZ6v6?=
 =?us-ascii?Q?6Gyg/nczT4Zs6qwNM7mWpSK9vwJuwVjwz+T0MhGtAXha8dYBWGnayOuTuyFg?=
 =?us-ascii?Q?JMxEcQyZvutGXPuIE5x3fjozC2xVPGsPxRxnIluKDGo2nn2ss41qQR5/LTUu?=
 =?us-ascii?Q?pzWZ+6W1mJOklQxBGdZxRpCpz7a61LECBJZUyY2JuawwO6HzKxBTPbcWwxCq?=
 =?us-ascii?Q?U0DjG6PM5/b5IS/vRGWCd8Ol36937i+pQUNWBe3+5F9Ak+Ax75pYaNtprD+D?=
 =?us-ascii?Q?wsiKSFU1IPb0ZCpZ2TE0gVcMqvs0gzthCAZtRNfM6afngZ0qUZuttiBr3cBW?=
 =?us-ascii?Q?wq5JdipGwwFaWmKeaG6kLxA/Y0M22l+N9ClXHWah6u6CG0JkOeG+mg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <038234FAA12130498D2EC1F25762016F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6403
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c6fcb658-4445-4cdf-5e76-08dde616e71d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|376014|36860700013|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VCHghIGmOExRiI0BcFID2uz9N0V+u1bTQ+2ENNJrq0Ba46oTzEvqw72vdjOn?=
 =?us-ascii?Q?7PX6N+l1bKtyHRcfVEPF9FzBVIbsZpwGtiuw1Rm6pg+meFVapyOsR0dw1dvz?=
 =?us-ascii?Q?1wiNDYYs6JzBdosyUVOB2lz6GrvD/M5Plas3HO2f5WJ3DjlBvAw5DJ4JXYDe?=
 =?us-ascii?Q?lay92WRP3N9Ak2dIOgY2fZqBuvSFlhEWeS/gv7OocP7AuKzzyu47MOxiHk6i?=
 =?us-ascii?Q?2GhKx+B9qVg3FYMlvDNUHlEbECYdk5woBuJ0s9CBj5tFOLJG9zcvwEBMr7Re?=
 =?us-ascii?Q?2bQa8N8inwV+0cS8h6GinaV6iXTR6acAR3v5+5+FW6mj8HT09lEasGwVTSvn?=
 =?us-ascii?Q?ULeGabIHaq2f6iRojULwUtQrLW1v9dhE0hm756uNtX20olkbhiy5klbnpSUX?=
 =?us-ascii?Q?3MumLvC6waMAQ1jEivs98/LG6IpKBpz80PGavJ57iDZnaknkxSRPeZk0B/Jc?=
 =?us-ascii?Q?xatVlolu82b+Y+yOcTypBMhFVQ/nTk/r7Sreap+jNmol5vGk+yFYtKKYlsVR?=
 =?us-ascii?Q?JRlrfOzASnwJGaZPjc9wpbg0BadddcCnjbMZtRBQATvBCxkcODMlFfaHGrB0?=
 =?us-ascii?Q?I1Cjlb/OJoYyc7+NngVG37xXWcj+mD21uWnNozsOzsUoOjxmutZjs/+ruxOb?=
 =?us-ascii?Q?G3Pe+FNZJHcG1+f3YN3yS5w/eQv+pdZ/Z2CaIT349fN2qOammkik3wZ4VFW1?=
 =?us-ascii?Q?O50kR8f0raqHoGenztdzc6o07cnZsSjvxJWVRI9FBaa+KSVmyknW1s+9p0iZ?=
 =?us-ascii?Q?VOssMXnbg36gKASV+z2zYU04Wq0OXajyyqKPHjbmiNN5O3sUoI1lIlEFqlyn?=
 =?us-ascii?Q?hRlu+4yFvQIoGJPrKGevwOv7o2kHzRzG+PjItAklLfDU40tocHrlDjn458US?=
 =?us-ascii?Q?4V6ghHDn1BjsaUCSPl9Cp0m+obFO3zcw5g3FBxHWFdsDA8PXBKqXju5KURJW?=
 =?us-ascii?Q?BOHIctZ8tYlQudCsJmd7wN7hVApbtoyExYqxHU/mAvp0fCiIlHfixeXsT+Vv?=
 =?us-ascii?Q?bOinpgkYw5eYBANJ/nP46wbu1QpW7ObE395dIPFiVkV9fGA29CiI5gXWmVif?=
 =?us-ascii?Q?aiaFSiBHhKt+XzQjUTBLMFceUJbKQ+j3MydTWsRgrCM6XXf7nhfoCteDmA2D?=
 =?us-ascii?Q?QuecotZZIChirGT71DcZPKFQbuShWW7AYp0cM6hylyYnu51K+8JZvSta0mSm?=
 =?us-ascii?Q?dJA9fBhHvurFC4U8T4fCqMm7aH6uDJ4SXALPsEmDGXY8qGNpXVUhl1bDwxBC?=
 =?us-ascii?Q?iG+/p4kgf3vqPGesWBnDEzs9ca9tIXZj0t3iyGRuclnX8qS6ctcg8Cypvri2?=
 =?us-ascii?Q?JN6cwADv69u6/tTatbqsniUtpx7hYJJ9zYxvqUs5H/Ug+p0BKy9LwCGwbRi9?=
 =?us-ascii?Q?/TjQHkvyQcd3gsyH8rUHuYK2XtnQXDS6xxmwl8uxcW1kHbYVI3A/nhp7wxz/?=
 =?us-ascii?Q?TIqW382qbnygc38elyZG2wZTP/EWuRgrmQyOG9Mfix1h6KO+C+YJo0Drj2cb?=
 =?us-ascii?Q?BnybQp2DyMbL0TKkrIbYeW8RhrfHhhuuRd+B?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(36860700013)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:40:51.6770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcbf449b-fc91-4d0a-2067-08dde616fa32
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5503

Hi Michal,

>> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
>> @@ -39,6 +39,8 @@ typedef union {
>> typedef struct {
>>     prbar_t prbar;
>>     prlar_t prlar;
>> +    bool transient;
> Do we expect to have any other flags? If so, it could make sense to use a
> bitfield right away.
Yes, at least one more flag at present - I will update this to use a bitfie=
ld in the next version of the series.


>> #ifdef CONFIG_ARM_64
>> -#define XEN_MPUMAP_ENTRY_SHIFT  0x4     /* 16 byte structure */
>> +#define XEN_MPUMAP_ENTRY_SHIFT        0x5   /* 32 byte structure */
>> +#define XEN_MPUMAP_ENTRY_ZERO_OFFSET  0x10  /* {PRBAR, PRLAR} is 16 byt=
es  */
> To avoid having to update this over and over again, maybe define a macro =
using
> OFFSET?
>=20
> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20
> ~Michal

Good point - I will do this in the next version of the series.

Many thanks,
Hari=

