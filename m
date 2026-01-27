Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FBgKWDFeGmltAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:02:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE758954A3
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:02:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214783.1525023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjde-0003Kt-Vs; Tue, 27 Jan 2026 14:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214783.1525023; Tue, 27 Jan 2026 14:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjde-0003IV-T1; Tue, 27 Jan 2026 14:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1214783;
 Tue, 27 Jan 2026 14:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBT4=AA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vkjdc-0003IG-M7
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 14:01:48 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7ef5d24-fb88-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 15:01:47 +0100 (CET)
Received: from AS4P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::18)
 by PA6PR08MB10418.eurprd08.prod.outlook.com (2603:10a6:102:3d1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 14:01:42 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::a0) by AS4P195CA0016.outlook.office365.com
 (2603:10a6:20b:5d6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 14:01:42 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Tue, 27 Jan 2026 14:01:42 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB11509.eurprd08.prod.outlook.com (2603:10a6:102:511::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 14:00:39 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 14:00:39 +0000
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
X-Inumbo-ID: b7ef5d24-fb88-11f0-b15f-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rWr2mCl+9LdaPa8uE+5ie+Pv2EacU1r41ERCRxkXMBRMHaBIvAvyvt68qh0+K5E4v6wzki78wQQMQpjDHLf0LI4Hc0/qPnISwBKBblRMVHQ24QTwyrUVYOu1LTxJ22+8Dp0zYBpu7TT2IHjOtFG4L2/c7K4A/fFweQWzEh5Mfr4CkQyUHrCy1tBYzu/35svz4YRWsxBJI9kWpveuB4cNKFUvriGM6L0N9cnH6ExnOqoSFXjNyDcEZFn9e80CFUcpKRm2P78gEfY1R8VRbyXJrq0PFRA0N0du1i7x4DO32tW+fjONVpIA1HV4o/SdxUwcqi2wPTeXU07Ud8NoKUgdNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weFona43iV+J1iIrlwI0PW5uaaDDpRv69765wIOH06Q=;
 b=o8u2CR8IkVv6v+B7Jg5vw9GRLZjVzSmMzUzuZUPaoqkFFIPiptK/oho4nG1/AzWSwChCis5zu9GrKivEjhhb1zbYELnOGdFOhShHbh4VYaejt3sFrGAEN3jbBDZZ7e0GlTdZWpDgLaFjg84GvUX9H8uA91TDUyFSwPmKqiLzyaL+h/s1n5CFL8g0jY4dQaWXG7svzpgoST+tykeGaQM2vXTGOmwZgUYM2rXAPxP+7/TI2KbXOMg+1S3Dc6nNIiEV1JJcYSgwCU1HOVnZhhzdKSfhyFLWpf0a+SI0AcsPy/cvWlmhTMop5Fbh3gj7l/3WYOogS1F3SsmiE4k2TCfoZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weFona43iV+J1iIrlwI0PW5uaaDDpRv69765wIOH06Q=;
 b=EP9dGLBnytpNOdoTpsmYmG+O7iF8IVizXO8oLxnyQAJBKiztr+JcAzWmT4xnvWE99AQUzElqLx3jOfP/i76zWBd1CQ/EN+cHGDUlac3ARCnOIUEKqZVcug0xvjUD+KPOTuvM1p0St7Ug8fmdmjgns/ed+uc6LI7BQ6LN53Ngkaw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzTl+BcFy7lgwQGvzBI72CmTUsNv7UFsiPrvJwo08gNNWNb5mO8Zu+pei8rkNeh3QVw+O9jsnqnEDflIYpk6boJh+VAuat6QLf0AcKi0g6gmTAOfH2XTqJkXzSNGd7TR6y/8wxO9VF5v6xk+071Tg3BkU/7MwxpIM76dp8Sc3KsDYGShCt5uPNof6RPJweX5WrwPI1RlAGc4DRS2RTNi9cjlrhl5YIfUZD+9dh1djtfWpeD0I6ePFTCbkiBcV0Ur3I2Ed0+MlwgEcYoIjtGcEgDLVraxkwMmD0mvW7Zsn2UsqEatgL5Yi1hYK9uKNvR/QyCRX9vvSS63hS5Ejzs+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weFona43iV+J1iIrlwI0PW5uaaDDpRv69765wIOH06Q=;
 b=lmCBwMhfk3IuUYwaY7NhIsV+ifSUjyNOlkkfJsdoNdXu7AXJX564gtNfjt8hJCNcgsQo5/mRBi6jZbC0x/byityB3rrRIcdxeZDLERvVTarDlhKEtdV6/tlC7UxvM9kVVTYbUKcOpYRqUIX5JbDSbsqsuo6KPzf6jlwyyQ4025D6PqN9UJHpzLbvNvKSdh6JQFSkiBAbHRq1EXHzVA2Rtv+J64TFcGTZSMq5tPg32hAcA1NRmZp8kgh9pPKyp5EnWf8jwMjP7RjixlTfUxBjaiMJzr6g9H00m7V2dYEkDDq7s7xGl2Yie/37Iuzn2juFsM3JSQNeyeEAp2LnsueXLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weFona43iV+J1iIrlwI0PW5uaaDDpRv69765wIOH06Q=;
 b=EP9dGLBnytpNOdoTpsmYmG+O7iF8IVizXO8oLxnyQAJBKiztr+JcAzWmT4xnvWE99AQUzElqLx3jOfP/i76zWBd1CQ/EN+cHGDUlac3ARCnOIUEKqZVcug0xvjUD+KPOTuvM1p0St7Ug8fmdmjgns/ed+uc6LI7BQ6LN53Ngkaw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/arm: Kconfig: Fix XEN_START_ADDRESS input prompt
Thread-Topic: [PATCH] xen/arm: Kconfig: Fix XEN_START_ADDRESS input prompt
Thread-Index: AQHcj4+kgpoWJ67J0EutgEYhfeUIgrVmC3eA
Date: Tue, 27 Jan 2026 14:00:39 +0000
Message-ID: <FAFAA9D7-DD69-4C6E-BEE3-424B8F9008F4@arm.com>
References: <20260127131923.123294-1-michal.orzel@amd.com>
In-Reply-To: <20260127131923.123294-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB11509:EE_|AM4PEPF00027A69:EE_|PA6PR08MB10418:EE_
X-MS-Office365-Filtering-Correlation-Id: ca202f3d-481c-4ecb-ba6b-08de5dac9982
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?EGmGgkeN82ivOwKVMuOZ/2s8icQDnyBfouTW3IsjhGNd1lMZYpunIWh2S3nW?=
 =?us-ascii?Q?HjV7zpvYMAC9LWYhumQbwBrb5E1dcorIBS5Gc1CAdv86noshYMt3/Zbgugt7?=
 =?us-ascii?Q?P+11E/Y9NSAnVBuXE4DpLJCW0vuWKDLptgjyW4hghE4Xu7e6p9QN2dRdSqtl?=
 =?us-ascii?Q?4JNtEbDdD+S5rxiPzz2t2tR4EPa1dDkC8xFQk6zL59waN7f3OneAW7kqx1C/?=
 =?us-ascii?Q?0I09T0aop+hXj+7gvJPH5w5UaJ3ojCUVzSufWlEW6aO29Nt+aNWGWscl3eU2?=
 =?us-ascii?Q?l4wIhiXhf3DhDM6sSRzcQ2Nikb6sFsvNYFA99hpFOSkgUuOy369L0gzjtA4k?=
 =?us-ascii?Q?u62DjhAG5qssjizWpwb32ywEqsG4Uv137pk2kHalOy/gsxfBAvEu8xHEKHQA?=
 =?us-ascii?Q?Izcj7rPCvL8nJYcQXprxldNiKGqy4EnsXDgeRy81bCqbxIYX1iT8z/p/r3mS?=
 =?us-ascii?Q?OyOwA0A/bstOIz46UkzQLqYIzhdn5zvynZ9ZtOIo/9C1SxclEHz4FnK8dTIy?=
 =?us-ascii?Q?poQpBKjVQWN2II/EtPpjL9qP2AOUqtAYm+cwRfcfhqLkXZYzr/cBqjTIFOmz?=
 =?us-ascii?Q?NGT8Li/DoemlmCP8zAqkObnkCVUvRK8XVMgPMj9b99fzPviQLMwvKYs6xLTz?=
 =?us-ascii?Q?UNIE4sX9vm+lSVy5XLAWqDl6Mk9x17c/cC0St0l16INgv2THm8w8wDEbdfcx?=
 =?us-ascii?Q?kn8ditD332U/thkXx0q8DaEWO1g6wMlv8oE6zA+Q/Q4V+M+ZSckpuk9BuVad?=
 =?us-ascii?Q?I3tBxnLRzzoKZrpYqh9KTguQppubZCNnaUeW5kfXu0hqHjSGVGIoSfLl+h2b?=
 =?us-ascii?Q?LfU1laT98IrrHCOlV7FrgkW5hAmrXV4O7qu+8G+tXQhKSgEbJUaabR6siNaK?=
 =?us-ascii?Q?tJ5hA7xsWOdojprZ8jSZcUxnYTrVG5toR1VrzXmEA/NWsEb3lERXZL+BwAIu?=
 =?us-ascii?Q?wc78z3GwvR+tOFy0qDwlehgJVZA2nsoC5GtXdFPUmjQIVW+6bW22/4qR1aON?=
 =?us-ascii?Q?OjY4C8mrCXNUvb8t1CSYkqTMy92rU9dr1GeF4+8JURiTyloOSspMr41ll3wm?=
 =?us-ascii?Q?7fzX7OlfgBxY1XuILHXIVJPy/vEHBBf/re5wxNOQJI3fkZBhEgOrFDx2l6Ho?=
 =?us-ascii?Q?EcGUyqgDDN4h0pJXRi80HOTNcao59gKh/i+pQL8i4+FAvkd8JPZD1q6MQAER?=
 =?us-ascii?Q?VahKi8nPSy8/X621jbtVziDmIVo2p2w/icIPti49uuPPST/OqKXqxis9oNFp?=
 =?us-ascii?Q?8O4i6bBXVrYBIwNHAoZwo7HnTyYnmD4DAHm5OwpcXTcf8fs+jZhCiUtwRkBl?=
 =?us-ascii?Q?KRnpbKvZgB3eQRrYnkL8xHE6ipJOFKIzmi8KIpkKCYQm4zYgiv+bF87mUaSK?=
 =?us-ascii?Q?SnUSmgL6z4F5AdsP/kEti+VW21e3x8lirJEKfE4rahNCue6lmcY0PMUWdMrM?=
 =?us-ascii?Q?StmRH3hxAfVmwjDA+/n2jxEnes42HpAulmJWzbDfHUFC3NBcp1GV+4QsNf/2?=
 =?us-ascii?Q?b3M1dvV04weykcr2V93Qq6yMEqTJD1arJ3EkX3Q1fodFeTE9h7oLItr6sv4C?=
 =?us-ascii?Q?yRF2o91/iLQEOQjTIJkYHnVE8cpZK1wZYLLrr5/khJuYsSQVqzg3d/frUlXk?=
 =?us-ascii?Q?6sNYK7THf4jMz9jBs//ZcdI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7688162A02CB6642BCC048C469E1D13E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11509
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	afc08645-b8dc-42a2-da14-08de5dac7424
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|376014|1800799024|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ec9EDvclq9tuDFMDTCeqF/WerYv9mxDd+ReB2Lnrx/qR5nxH3btvPnda8xPX?=
 =?us-ascii?Q?HFEAYHpB6Pxcy8LegTa7uP5tY4rU8i7bb4RV4MRaxWfifAm95DaJ2q+kqWEH?=
 =?us-ascii?Q?ZyrFEmFMmLfG/VZvQgp9e3FfiUGHYwBGL9AKAJbpi/ErOHYTt2EsSYlFtmDA?=
 =?us-ascii?Q?SVeoVzJZHmChAqLsZJB2ITlKHZv/lme1OceSyq1VWUOzJJ/4t6GT1Rej0vGL?=
 =?us-ascii?Q?rz5hWDa3zYKdxnzDqZqAHPUwThaaeEP/hGnWzDe813EFXvn9ITVJvAyCQm2I?=
 =?us-ascii?Q?pYKRydwad3ziGaiEaPF/qrjgQhrbOaaygNFgcYmKqzqMSRS6/iXBVOZ/ZLNB?=
 =?us-ascii?Q?aApKiuOxZc4FiQUxI1ws+m2AX4ZSoYuhurGZaCLMkBwX3i/P1tzoa3rLp8V3?=
 =?us-ascii?Q?6CNFPLN7Ktoch/tD4oZE+6AXd/PhqDqbalRLLfrjj1ktwGt/KC45+O2JDAMw?=
 =?us-ascii?Q?WZUUEXq5D9GSa2+8cddeQbUDvs0QjOXR8OhGCt1FFfEp9enxmrHqpQUT/n5K?=
 =?us-ascii?Q?BK2ylbDU/klbKrdYVABS0kQQY6qKGDZZA4FIuI2lswwGTq8BOmkrSco3p84D?=
 =?us-ascii?Q?SSeDPHgm2DdHDRauUSfJGjbrF2ESEM+9pIB0aPjGuUszriXMavXuuWMEYYXs?=
 =?us-ascii?Q?YA3+kbkEcLmT3kmJUfYW3ymRUgKJPkIdIQssRXBjLRjj2Jm8Ds1pn7JMsGx3?=
 =?us-ascii?Q?YQHbX9pH56DiHnDpu6QVQTdWBtRha5c8txRGULGe5ZEg6uruA3XzVQtykO4o?=
 =?us-ascii?Q?c1161fxrt9oIIomrYsfpTPAh2lVB9RXxV+0EP2wz7xSCL8oAqvplbM6VwwxR?=
 =?us-ascii?Q?22Trq0DByeNukUdy1sxQDSYqd7jL8AXxqaDnUUzOltSm1/bw31fgypFDNovG?=
 =?us-ascii?Q?gAM1xPKEbJPll5V9959tT+t7ZuCCb6Zo8hqn/y7STZmYREU/Cls9ft0kpfuD?=
 =?us-ascii?Q?Vl86t9v8hcLCuskM4OtLXx0J8+mgeDiZoBKuAEE2zHHKyLbYRKimxDQ5Dtd1?=
 =?us-ascii?Q?FkugNaEfOEHENS0v26VlqrCJS+XqPnk7CbbzcBgScGsmjr0/q+QlGM0D+KSa?=
 =?us-ascii?Q?UIbBgvE3dvZ4I3rDhVMhiDII2RbDBU9v65R847V1T+KXZNJW0UmXnEcuZ/Eu?=
 =?us-ascii?Q?/Pz2wz/vvO+UAGF06aUlDMcc9CLr6Bu9HHgSC3KZSidyG6IMiQmC7tWjgdbW?=
 =?us-ascii?Q?UDFbphkxZYT8FIFnNodUYbbDf7rUlYdAAivMWKk9ewmIEVIPXB1rJwI7qWzU?=
 =?us-ascii?Q?RSc32UPcKnGhAP3Jb+e3CYnxKkhjkN2rTCOGd6pHBgas/Gyf9XdYqHiehs+1?=
 =?us-ascii?Q?bQzr6kIZmaKKz7lpT8uHvCBjexjpyO1Eg+WXZ7w63Gt2XcVLZrWUx2kcMeEK?=
 =?us-ascii?Q?32Efn+RN+FYH61r+X9lB4VxdCmhLM0J0VmN45m0nBukhxQ0c3EnZ8tWpZI1V?=
 =?us-ascii?Q?e7sFzSFB+s/KKqiDtbmzXTJ9UyLMoGvlOPPtYSIb681LlOmFnCGeCpJXiKfq?=
 =?us-ascii?Q?LcW53lMCpIsOZk+GG5usZ9XH0IkLlQDBPiYcbOiI8KonPjUb69h+4SXAeR9U?=
 =?us-ascii?Q?BFAiuORGUO7v7ZPyXXHfJZLVwgH6P6nK29NxEGnbsfKBgj1VsXIz4OESYBuI?=
 =?us-ascii?Q?PYwlR6ebRVUtZInI+1jiNSvTTeHkANsonZZtOJlqUJZVhGwPsSeh5OPRuHMG?=
 =?us-ascii?Q?7wNTew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(376014)(1800799024)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 14:01:42.3525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca202f3d-481c-4ecb-ba6b-08de5dac9982
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10418
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,arm.com:email,arm.com:dkim,arm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CE758954A3
X-Rspamd-Action: no action



> On 27 Jan 2026, at 14:19, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Remove the part about platform defined address which is not true. The
> help text is correct i.e. 0xFFFFFFFF is used as default value to indicate
> that user has not customized this address.
>=20
> Amends: d736b6eb451b ("xen/arm: mpu: Define Xen start address for MPU sys=
tems")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers

> ---
> xen/arch/arm/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 442d353b4343..2f2b501fdac4 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -28,7 +28,7 @@ config ARCH_DEFCONFIG
> default "arch/arm/configs/arm64_defconfig" if ARM_64
>=20
> config XEN_START_ADDRESS
> - hex "Xen start address: keep default to use platform defined address"
> + hex "Xen start address"
> default 0xFFFFFFFF
> depends on MPU
> help
> --=20
> 2.43.0
>=20


