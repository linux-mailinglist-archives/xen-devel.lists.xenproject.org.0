Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC589F62BF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860165.1272223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrDK-0003I0-2k; Wed, 18 Dec 2024 10:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860165.1272223; Wed, 18 Dec 2024 10:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrDJ-0003Fk-VT; Wed, 18 Dec 2024 10:23:33 +0000
Received: by outflank-mailman (input) for mailman id 860165;
 Wed, 18 Dec 2024 10:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bs8F=TL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNrDI-0003Fe-CQ
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:23:32 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20631.outbound.protection.outlook.com
 [2a01:111:f403:2408::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fc2d9a9-bd2a-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:23:30 +0100 (CET)
Received: from BYAPR06CA0057.namprd06.prod.outlook.com (2603:10b6:a03:14b::34)
 by CY8PR12MB7756.namprd12.prod.outlook.com (2603:10b6:930:85::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:23:26 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::91) by BYAPR06CA0057.outlook.office365.com
 (2603:10b6:a03:14b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.20 via Frontend Transport; Wed,
 18 Dec 2024 10:23:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 10:23:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 04:23:24 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Dec 2024 04:23:22 -0600
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
X-Inumbo-ID: 1fc2d9a9-bd2a-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8W7i7pGLAEav1Vz4AtQX01Km4qDmEwk2wLyKOIeGsMrJieJMbMS+IYoU8aQfKGIrlmMYyootOpm7WA/jTTePq9rA2a8upniHdEM7uSOceZlC1hwUWVK4+cm5JrlEQyDYol7hZhSLiMo9Zj3nnxMK7uysFAqRxeNuwPOoRPBWBsZZ7xAtZYJ0J1N57R0kJCyoJCbzwxJz9e1ZZGQxGiY6UoXG7wQUGozfV8nCQrIb0MPZj3CfDfS2nsByUt0opbn28dvWvZvUhG5v/4hEJyCwnKwfV9tl3mBk0MgEV6ynhG6juyLJ4BQWTdplbby5i4UsbrNxNClj5hpsJuDk3Wkyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIwXgD8LDZivLejsJkktFq+0L34VyBvvrz06ovUazmg=;
 b=jrtIyliumdEc+Jk6NOBFta0AUQJHQQp3mJ+zU7WIUZCfwvEVQBDXUTeRz5cIvmUsEXyBpDnAdiIeF038equrTiEj7Gl3ym1q/Jlchx/s+EgK1zJut3InTrZcZgFK3l1Oazo595LlUv+l4Tukia5hFYA8oZfs40YFPXEF5wwrLQcwwjuiKcWoWVvY8hBvSAg+cMCIE5IO+nlU1E8VPLAVgG5jFfqYLiwM5KYrigGWQ+2rizJKKXdsEIhKbb3f0PhDWbW4nhOWAK1cPvfUv7HUd19ypTV6S8/dYN/OmJtdUMTe1+kWIwLMlREvwlUbJVs6g82BCd1VO+pufT5BnjYnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIwXgD8LDZivLejsJkktFq+0L34VyBvvrz06ovUazmg=;
 b=mzRwkmfI3dfMLltopEYRFDQ+cs3B3m0EKMRlMsy6ThnK/OsZsl5hvo1KvZoem9ZG7UnLbE65O1z9Sbl99pTwjPBw8Fe2uCkLrXuEqmXZmLkaOLvHS3x5vwZL6QyW4MfA1FURJPFOblOqtswZK04oQzNBVhSzYaEjfnZ+BByCxFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a91597fa-2e6e-4b18-b818-ad56a296b322@amd.com>
Date: Wed, 18 Dec 2024 11:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 12/12] xen/arm: add cache coloring support for Xen
 image
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
 <20241217170637.233097-13-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241217170637.233097-13-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|CY8PR12MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 119ed289-420e-4842-55ad-08dd1f4e01e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEtxMkEwZVI2ZlJlWUJQS0t1d3dkS0JNM3k2RDBYT21TMm9vbkxxTnpyeWNU?=
 =?utf-8?B?VjFyQ3J6Q1V6VEFVaFFwdkJXQXZZR3BqeldsZExMdTM1QTVPZmtVRkZYNzlt?=
 =?utf-8?B?TnlQVG9tRWRPU2ZxSjNXSXBmSXg3Qmh3OWVlWi82NkNsNzlKajF6VlMyM3k3?=
 =?utf-8?B?N2RwMEsyeDhhcGVhQ2JuNzM4Snl1SVR6NVZkR3RIMnMyVjN6b3BDUU5EWG01?=
 =?utf-8?B?ZGZBVTN5OVh0a3NPUTVhU243bGd5S3lyUUdudHRlZWdiSmliWEJydExHYUx3?=
 =?utf-8?B?SS85SlFDTkRzcEJDNFhFTzRYblk4NEM3ekJXNkdiZ25aaTBjSVV1a0tyMzNi?=
 =?utf-8?B?MkFKYm5qUGFZYklCb0hMcC84SWZUMzkzc3IvbUJndkt3WU1tRmxHSExHZjBB?=
 =?utf-8?B?Q3loN09EU0tPVTQ4ZXk2KzlCK2ZSTzZ0a2tzY01JNWtYVlM3SHF4WGgwVUo2?=
 =?utf-8?B?R1VWRVAwa1QvRFEyWGE1NVF3Yk10SEllSnE4SHdQUXhzTWI4bEUrbU1yQnY3?=
 =?utf-8?B?YXZSekttY0dKWXp4UDFLMWR2MnZhVkRHZWhBS0xVS1dYVkxtN0h2QWJDSVNL?=
 =?utf-8?B?SnVIdGhUNDF2MHlyVmNWQzVpWnlHYTM3S2FNeDllZUxiNW9KeUs3MlBDMmh1?=
 =?utf-8?B?MFJRSHFzZGVqeXVFVXFaaWhBTzFBTUwzUXEwYU9uYzYzTm95TXVLeExXUURZ?=
 =?utf-8?B?V2dYSUY1Q2lSV1hGVUJhSXpjd0RjNW1ZUGZVblVETUtvaVdWSERORnBZRU1I?=
 =?utf-8?B?dm5wYWprRk8zSmRvMEtJVGNBYVlmVWVsRHdJOFEwMm11b3dlMHJuRmtTOFhn?=
 =?utf-8?B?ejJSaVp4RG91ZDk0aGkzNUorRFUvT3MyZm1yMHEzVmYzVzdabUFSNTNxV3Fo?=
 =?utf-8?B?SUV4djNSVGZseGZ3Q1ZPM1FXbWR1WmRXSWVpSGR0UVRCRXdDbURjbVdRYWQw?=
 =?utf-8?B?M29NbU5ERGNyVUVDZkdPU0orV0FoVS9ZRWtkbGpNR3lpSlVWcTBTWUpzWHE0?=
 =?utf-8?B?NU15KzNTcUczVFZwditWNW5qNVpYekxSUzd3d0JTZmlvZng1SUdKWkwwVytm?=
 =?utf-8?B?YTM2a1I1eW8xN1NIdzBkSlJoSkEwRGxFeUh4UG1xZ2pRYWJoL0FJQ3MzYUVi?=
 =?utf-8?B?TndmNjBjMGJhNFdRdE5jYWZZQ0dnbnBDV3JuNU5qNjBxdmhhNkhKM2xXWDZs?=
 =?utf-8?B?bEZueU92QStUMldtWmZIbnRaVDJLM0IzcENCcklYNWZXbmZpWGc4ODNmUUF6?=
 =?utf-8?B?ZVVidlhtZ2kybXFCZ1lWNTVVWXh1d21VMWR6NnNWSzZBTzE1emlPTFVyTmd4?=
 =?utf-8?B?YjQ1Z29oOG4wL3dXR0pCZG1Mb2k4aE51MkRqemVIQm82em5pTElwZGVyRTkw?=
 =?utf-8?B?OXRqWnZ0RDRKbDZTMmFCR1dSeFpHZUFpYmZaVjB6QUs3SmFiRWRBZXBQL1lq?=
 =?utf-8?B?N1NveGZ6K1BkK2F1R0VVZnpscE1ybWhHMUM2dTZNY0UvS21lQVg0eU5HN1ZC?=
 =?utf-8?B?UlYzQjZURDB6NHpVT3VuSy9lOTlMQm1kU3YycnJ2ZlM0UUg5UlR1SkhvYlFr?=
 =?utf-8?B?cHl1VFR2ZXFtRFIxYkQ3bUczbmYyR3oyamc5NTViTTdCT2lPZDV3TWVPNktt?=
 =?utf-8?B?L0V1M2x2RGEwb3lhdlVSMy9tWGlFWTMyS3diT2Zkc2NlT0xMenVCU0JXNUI0?=
 =?utf-8?B?a21GdjJDNktBMEZDY0p0bEg1SjFDQjV5WW9zTmRHaFVVMXNGWU5oK0c3aTJw?=
 =?utf-8?B?WTZMN0l5MU9XNXdTSmRVSHg2RWNPSjZ6VTNEQ083U09lanQycW1xTDFvbHBz?=
 =?utf-8?B?QU50THFZbWpkY1hoNzZ6U1paOVNQZUpmWEFCYzRzSDdxd0lKNFJtNXhMVEVl?=
 =?utf-8?B?ZmY0bXliRXhBc1ROMlpyS1VBQmNraGJVSWozWWRUR2FlS1d4eXR3Q01NZ1hx?=
 =?utf-8?B?akdaZTUrYnd5RWR0UjNmQXREdVRVWkpoNWlWZStpYkNSdENkUW1QNkxhSXJD?=
 =?utf-8?Q?/ZWp16YFuP8E7cWEOGF5z1cvjeuoiM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:23:25.5348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 119ed289-420e-4842-55ad-08dd1f4e01e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7756



On 17/12/2024 18:06, Carlo Nonato wrote:
> 
> 
> Xen image is relocated to a new colored physical space. Some relocation
> functionalities must be brought back:
> - the virtual address of the new space is taken from 0c18fb76323b
>   ("xen/arm: Remove unused BOOT_RELOC_VIRT_START").
> - relocate_xen() and get_xen_paddr() are taken from f60658c6ae47
>   ("xen/arm: Stop relocating Xen").
> 
> setup_pagetables() must be adapted for coloring and for relocation. Runtime
> page tables are used to map the colored space, but they are also linked in
> boot tables so that the new space is temporarily available for relocation.
> This implies that Xen protection must happen after the copy.
> 
> Finally, since the alternative framework needs to remap the Xen text and
> inittext sections, this operation must be done in a coloring-aware way.
> The function xen_remap_colored() is introduced for that.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # common
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


