Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219D3AD6C5D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012682.1391207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeM2-00053S-7C; Thu, 12 Jun 2025 09:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012682.1391207; Thu, 12 Jun 2025 09:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeM2-000521-4X; Thu, 12 Jun 2025 09:36:14 +0000
Received: by outflank-mailman (input) for mailman id 1012682;
 Thu, 12 Jun 2025 09:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ISu5=Y3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uPeM0-00051v-B4
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:36:12 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac39690d-4770-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 11:36:10 +0200 (CEST)
Received: from DU2P250CA0018.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::23)
 by AS8PR08MB7369.eurprd08.prod.outlook.com (2603:10a6:20b:445::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 09:36:06 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::10) by DU2P250CA0018.outlook.office365.com
 (2603:10a6:10:231::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 09:36:06 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 09:36:05 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DU0PR08MB7947.eurprd08.prod.outlook.com (2603:10a6:10:3cb::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.19; Thu, 12 Jun 2025 09:35:31 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 09:35:30 +0000
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
X-Inumbo-ID: ac39690d-4770-11f0-a309-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sE74iQKNFmKp4QeCIHHkaKumBPffEBtGe+cq4BIuisITOsgIdeNy0Y+qQD8dzLUYH1bsnnTpQBrvhyuzpN8b9vDY8sk7ZP4KGqyj0kQhz5deV4fqvDCkI1DNnjF5EsOfRs3sWq3iGGc5QXcqHsNz6Qn9Tw/eVdd0vulenLOw4W2UI0H94W5TvnTQ6+/S+8y0PN2gOj4q8XCL0A5egJeHbR8ula4GThG1c1YieK7jb/EmmWCoST3/dMeo6LTlV7m0cJf4bNYPhUOw58ixfs/nwpc2d2l9IwTw0U8LkClZfdrZIrQOU8Daqur79Did1z/YO5WRBMgHGKIfV9/8PrDhvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlbuVXEhrs9MyyeX4BvQmIBKEboRfF+W/4hIcY4UHXw=;
 b=BhmhD3hzx+xHA3FXTmmdgwBaSgPuUaZgfwER2+x7duqLBnMQpEtQu1pmeN0/FS0zg5ipdunXqyYaNWgEAMq8YBluVRSbqlBNC+985QOjCoRy4QSOb9Nm7uoTpjsi9aDIVsTZKe7b38tH9mR9mLYlJFFnCvzsE30DyETWCLeL7FH1sQoARVGiCFatPDAK9UpYRCK0zfiAE7WVZW8QMSsF0MkAiojghCe5ZdUudD+EQTFujUM7r1hJMRwrIorqJ/XlTzavQDIaIpIx1m49hHtDFQ37xOqMssE0MQPcjg+nsQiA9eLWSTl0QHs83NUSQkAvPPrsuKSxaHQ8B+r0mBOjww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlbuVXEhrs9MyyeX4BvQmIBKEboRfF+W/4hIcY4UHXw=;
 b=Kf4Q7l4KXMVtrSrVXDDN9qneSHM4kVprqXfXzVcwSsHHbcR94/jIi3sZNhl/oVhghnb1JnKIrp1c96kzemvQhgBq7EHH2QxOiSEF5NoaSDW1Ci7WpTPyyY2b0YTqEQASdtbLtdMyWGw2QSpeBkrGQT3v4qaW0Y4XoTSfDAErkUw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFBR/iTdK1iKa6xB76Wdy3WajzQgrkI093r7JFYNwE4k7d/59YeqklaD89ggL8CcTeIYp4Jp6sagVt2DApk6yICZQhdCFcvKAMzxqV3qfs3ZbBfc7qm3X6KsjAZitrHzU8lGG4JKhBq3GfO6ZiaZ2HZkVBhLhafjfx9qU1MbMj5yckbf4seqWCPqxCyKd+W87I6mxH6MFFf0626H682HzP2dcmvGkuk9yT1w5zuKiVn/1K7lK9447rnb0yF6XRQlSvXaGyzRMRgs1ZN3ctOKy0H5oLckNjA+5hC/U4dLXX8mkaRNW03A818AbRdkt920n85r0Dqsk8Lz5PxiEJq00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlbuVXEhrs9MyyeX4BvQmIBKEboRfF+W/4hIcY4UHXw=;
 b=UC6J5Ik+L+hhhoLXhFVaw4lsy1BKvVcHzIISGGCJEWYAIVSapDyXngT0Eyyk+2Z6ElCR/mpP4a5A3tTKQIBVB9Oadhi8EgruoctKtou+lqNM8Oac5V5jtXb0XGfVSLXkXHLvYfRv2e3p9//4ATdhaFHPf5ZoAnQqzth2zL+MsPM3nzWb1WtuIyV8q6Tjtyhwf4DYURD1suJ1fEVhHc/mkQNJjlONDqJe2d0dvantBKy2/VwHQdOmGQuB5HeY1SMrZE1FYC38cD3IvbAXSSSWxzy58h/4ohJfYdcwVBdVzochbiUZkXK1YLf9IjhbhAuErrX6SqOPDhH4c1GDXgJurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlbuVXEhrs9MyyeX4BvQmIBKEboRfF+W/4hIcY4UHXw=;
 b=Kf4Q7l4KXMVtrSrVXDDN9qneSHM4kVprqXfXzVcwSsHHbcR94/jIi3sZNhl/oVhghnb1JnKIrp1c96kzemvQhgBq7EHH2QxOiSEF5NoaSDW1Ci7WpTPyyY2b0YTqEQASdtbLtdMyWGw2QSpeBkrGQT3v4qaW0Y4XoTSfDAErkUw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/6] arm/mpu: Enable read/write to protection regions
 for arm32
Thread-Topic: [PATCH v3 6/6] arm/mpu: Enable read/write to protection regions
 for arm32
Thread-Index: AQHb2t7jddptbtJu60em4gEBgB1jlLP/RMoA
Date: Thu, 12 Jun 2025 09:35:30 +0000
Message-ID: <43768317-3409-46EA-B545-C78937EF42DC@arm.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-7-ayan.kumar.halder@amd.com>
In-Reply-To: <20250611143544.3453532-7-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DU0PR08MB7947:EE_|DB5PEPF00014B92:EE_|AS8PR08MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a3aac7-52c7-4a1b-4e4c-08dda9948d89
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?rf29tfwWGL50eRg46BhfZ1Ba8Y0EJ8+9mGDAh0ookB88t4y8K/rgQ9gbIVGG?=
 =?us-ascii?Q?FT/0ia18Bgy8Q17z8SOPckPKPU5yUlrspDTIGJJR1cALxhOpY5hus0Dapzx+?=
 =?us-ascii?Q?79EtvB4Nlkfvr9azOSDE6fKzbaysQHLaFw+b3SLGJ+ECHdsae5h2xfJ11NfN?=
 =?us-ascii?Q?+RctAI5jLUUvXpPSN/3whCaaVePHWiTRWMCaHx+8jdIIImPw1nhUPMqx2yJA?=
 =?us-ascii?Q?73/qBDv52CTY69oGpb1bQvnoJaNlFVo7MnteIsZEUAeJjHgxWWBNKgnCkPXf?=
 =?us-ascii?Q?wrbfyoax3m3mxSMAJvHiRBIYO1d81s9pskLsI7nLIpcNVMTPNJbLs0EW3gA9?=
 =?us-ascii?Q?C3luVi7TdqMzMS1QAcQ5llVdT6aztJp2kx5wamSQVYvGwpj8Qy5MbJCeDC5K?=
 =?us-ascii?Q?3j78xlu8px1F35bjGju4GD+zfJv5GWEJiJwO1VmTaZRdxO0n0JxPMUhP6Fyx?=
 =?us-ascii?Q?GLHJDK7oWi5+aXwpBWuzhU7Qhgjs7rmcE6v7Vz7NVhfrHHLxB+pkH1F8vX7Z?=
 =?us-ascii?Q?CmbVliDPHnvwRGyJEFjnvtstAKlYW6umykuFGH6ne4kihHlQv5HoTTe7yFZL?=
 =?us-ascii?Q?+gBMyWbdCU2lcZEKTZqVbg5Ztl5ue2tpzqELCiKi9FoBdLoSBPJNw+O7STxH?=
 =?us-ascii?Q?Xt49BSHRLet7sGPsSa9EOEI561ptPtz1XCCM3iw5uxozjpl4snuju+W0mL8D?=
 =?us-ascii?Q?ZnzXbGDxaMvJGn4D4sEI5JolqsqeEb1ofe/6FX0byV2B3v4VapBWZcIEnWU3?=
 =?us-ascii?Q?yo1j+KyofGsTAp+/lRQbxb7FH/6xhE6+6BMWPG4Gx1AzTWCzzo6U7z3eEszW?=
 =?us-ascii?Q?u2nWO4QKSmeL2HmYT3OAHe3kgcovV+X6LgmBcbalAesPKjfANYA19SEAi/dO?=
 =?us-ascii?Q?PIZjOZz6vRnL279x7oZgwfQiNzp4m83WZupbVm8ZD9V29+OhubH5a8CnbqGZ?=
 =?us-ascii?Q?yn/ad6Np8MOFQHWrdCL20uq3tSoV9mELbXjGKfZc3bzSEomOlxIogiw9WqKr?=
 =?us-ascii?Q?cZofGGPD049fJ/fGp2cyQZHDpiMncfdAH9ZDpGyaZ08a3PQKBjgVBVOOX6MH?=
 =?us-ascii?Q?WALVoBAPw5dnU4TvbWSLXIz1KQB7qYA0MPgUKLrXzxPhYTFWetg9r5dDHXQ/?=
 =?us-ascii?Q?TmxPOXvhTDg8h6gQkeoJkpcPdTwyl0yLS5b2VCf6mLlDMZvsr28ou6vRbgyU?=
 =?us-ascii?Q?i9cKt3q8DtSUL5hg+anE9wjhu3URL+ZryckbPfE41nasBw0sYjfUewu7iBce?=
 =?us-ascii?Q?2F1F6b7gUj8XsnxmSmQupYyYULTDgGXSu4Y8e4mStVCWMAni2k2v+kCd9isy?=
 =?us-ascii?Q?P1wES98TSSiFVDyYpsD8iAbhWahKOVPWP7RtWqOAAhB8rbxwGqJ1J58asfsX?=
 =?us-ascii?Q?PQkm0KQjUqT/JbDFWTy+Pzw17zkzFuyz3Awp+8wAalfmZ776+MaMp5I1Swaq?=
 =?us-ascii?Q?c8EJw/HPTPSP05GoCG8eu6QaK8wdIsl0fGjDfQSJSGMPsZBJ6arX9idTVaxN?=
 =?us-ascii?Q?5X9scOLpFlbumZE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E34933B553EF7419FF8F8B1D5E879AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7947
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6fc931a-7135-40e2-66b4-08dda9947924
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vzVaNv1k5y2jY0zNTJAfxxiYJwNzkbpNaxPeSsiUqBFmvCRnUSMbKApzgA9V?=
 =?us-ascii?Q?51ZODo5Nr6APO0KLIapLtiPdIzMSzE9CrMNd6hNg8ajpGUsEzF1caLWwQKLY?=
 =?us-ascii?Q?rP1VDMMwBVkTeDDWwjpzqMDs+q+UVFLKo+UbLdhuNdsAVhH8xpofcamQFx+n?=
 =?us-ascii?Q?yDPwoQaUK48CWQ2Zg/yEfrNmDWO9G1c313IE6kt0Ak/IFt2HVnyBSe6fXYKq?=
 =?us-ascii?Q?59mRM0ogBF32bmglaDq2X+S12ZpVFPc1Lw5PjDT/k4L9pnMaozxh8VSTFww8?=
 =?us-ascii?Q?e1FcRJtQFPQxYf+kGWR5nTEZ7Olx+Hp3zxmrXm07AXruA8ieBRAW2qH56ObI?=
 =?us-ascii?Q?thiBFA5jgpRVaeqLQXMES/L52Afm5a49tlx0xVo+NT3Tullwnys+21laJv8m?=
 =?us-ascii?Q?kIwglrJS8JoKqe+zUg+NA2CzG11Z/SFLkLQY/aaMsSZSGWEd2yPzKJRWepFL?=
 =?us-ascii?Q?IzIf1xhU+JoIel00zTwz1EJ4EkK04JrlvfxMTdksfdsQT0Eg0WhDu/4yQKCV?=
 =?us-ascii?Q?fW3FeNMbZYoK6GIcyVIVzRUgFJ3mDAWTfmSISljw4mEKQ3mvP7s4xl65nCOH?=
 =?us-ascii?Q?bPguYIcWNNzkrxoVu10AOEpq12TVkGYR+s9HB2UqNJHYjt1XA1e51ZQlBjJk?=
 =?us-ascii?Q?RvX9VeQkN8Lpelv5yQ8fmLL0VrNdNLIWaRR71h7QRycOTNEvRLI0SQVn2Zwz?=
 =?us-ascii?Q?Bl9/xoZocN2/D9P6GUc5PVtYfOHVNr5oG3XGltX7PTL82nhgtAbBJp0111xk?=
 =?us-ascii?Q?Q31vGlrmHLLM1iktu/Q5EpHC3KRwwc+mNl2OwduXvezZsPbUbO8rJkdKM2Gy?=
 =?us-ascii?Q?mzEhZ01RXuI2/p/rQVXE/LkW5mij9JBe9mVHtlOmJRdnqGrajU8SFhMjNGV+?=
 =?us-ascii?Q?DErYIwQAvs5IAzJa/1P03t+3w8rl7PiPXixBh7Z3ZlsbFiIHSbbJmzJ/BsM/?=
 =?us-ascii?Q?9OlMKkiJ1JTaCQWxWoVHZB6YRiXsjCFd3pg+wXuRXVcMDGxu4tMP6YkqXbPK?=
 =?us-ascii?Q?/NKqWpQzahrhTiYb0FjVBcGxgkOq5y2ddq7CKvO/N2XXhv4hg/FUXJLRFpkb?=
 =?us-ascii?Q?viCBt0+4xKs5O4Yytu7F+L8uHY0fF/S7A/7LqJf0l2r224obm5yMFVUa3lcN?=
 =?us-ascii?Q?uPgyfTPkIA+DCS3RYCcJdwFosgqvTMFtFNL+mz1PlsofHNfjKLqXvixiW2Vs?=
 =?us-ascii?Q?du98OEsZK3ed/UzCGKW/pa/j6lkXs738maXRScQBXkRMXwvrYcTr/9QYn2an?=
 =?us-ascii?Q?uLTTgk+HrkUUfjkdY65w6EsqAi8twufaTALg6w/EakFk8f0TaaBjRYl+t1dR?=
 =?us-ascii?Q?nlPxD7pViTdz3ryQklprmiZ0/CHl+ECWOQkhWU570A5jgKySL5YRJ9Q6szxn?=
 =?us-ascii?Q?Y7dD27I+l3eUKz0U57wVuvlWi/y180WnJZxnzEUbV5dMhshlUq30E1QiQbT3?=
 =?us-ascii?Q?0HdDw/kQjmWbA4LEvZ8APP4AxsHqJxs6VIo0ApSfUYZcxWTrwaqzslcP9YPk?=
 =?us-ascii?Q?dgpKkB5GeBbDjnNMi2vjNBrHPP1y282RPW1ya6grme6Doz+6eim+2mokmA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:36:05.0337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a3aac7-52c7-4a1b-4e4c-08dda9948d89
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7369

Hi Ayan,

> On 11 Jun 2025, at 15:35, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> Define prepare_selector(), read_protection_region() and
> write_protection_region() for arm32. Also, define
> GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 255.
>=20
> Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
> Enable pr_of_addr() for arm32.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---

Based on your v2 (https://patchwork.kernel.org/project/xen-devel/patch/2025=
0606164854.1551148-4-ayan.kumar.halder@amd.com/) I was imaging something li=
ke this:

diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 74e96ca57137..5d324b2d4ca5 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -87,20 +87,28 @@ static void __init __maybe_unused build_assertions(void=
)
  */
 static void prepare_selector(uint8_t *sel)
 {
-#ifdef CONFIG_ARM_64
     uint8_t cur_sel =3D *sel;
=20
+#ifdef CONFIG_ARM_64
     /*
-     * {read,write}_protection_region works using the direct access to the=
 0..15
-     * regions, so in order to save the isb() overhead, change the PRSELR_=
EL2
-     * only when needed, so when the upper 4 bits of the selector will cha=
nge.
+     * {read,write}_protection_region works using the Arm64 direct access =
to the
+     * 0..15 regions, so in order to save the isb() overhead, change the
+     * PRSELR_EL2 only when needed, so when the upper 4 bits of the select=
or
+     * will change.
      */
     cur_sel &=3D 0xF0U;
+#else
+    /* Arm32 MPU can use direct access for 0-31 */
+    if ( cur_sel > 31 )
+        cur_sel =3D 0;
+#endif
     if ( READ_SYSREG(PRSELR_EL2) !=3D cur_sel )
     {
         WRITE_SYSREG(cur_sel, PRSELR_EL2);
         isb();
     }
+
+#ifdef CONFIG_ARM_64
     *sel =3D *sel & 0xFU;
 #endif
 }
@@ -144,6 +152,12 @@ void read_protection_region(pr_t *pr_read, uint8_t sel=
)
         GENERATE_READ_PR_REG_CASE(29, pr_read);
         GENERATE_READ_PR_REG_CASE(30, pr_read);
         GENERATE_READ_PR_REG_CASE(31, pr_read);
+        case 32 ... 255:
+        {
+            pr->prbar.bits =3D READ_SYSREG(PRBAR_EL2);
+            pr->prlar.bits =3D READ_SYSREG(PRLAR_EL2);
+            break;
+        }
 #endif
     default:
         BUG(); /* Can't happen */
@@ -190,6 +204,12 @@ void write_protection_region(const pr_t *pr_write, uin=
t8_t sel)
         GENERATE_WRITE_PR_REG_CASE(29, pr_write);
         GENERATE_WRITE_PR_REG_CASE(30, pr_write);
         GENERATE_WRITE_PR_REG_CASE(31, pr_write);
+        case 32 ... 255:
+        {
+            WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2);
+            WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2);
+            break;
+        }
 #endif
     default:
         BUG(); /* Can't happen */


Is it using too ifdefs in your opinion that would benefit the split you do =
in v3?



