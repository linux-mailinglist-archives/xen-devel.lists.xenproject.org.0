Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8ECE6750
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 12:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193972.1512478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaB7F-0008Fp-H9; Mon, 29 Dec 2025 11:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193972.1512478; Mon, 29 Dec 2025 11:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaB7F-0008DK-EU; Mon, 29 Dec 2025 11:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1193972;
 Mon, 29 Dec 2025 11:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHFx=7D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vaB7E-0008DE-7t
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 11:08:44 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bafe3507-e4a6-11f0-b15c-2bf370ae4941;
 Mon, 29 Dec 2025 12:08:41 +0100 (CET)
Received: from PH0PR07CA0034.namprd07.prod.outlook.com (2603:10b6:510:e::9) by
 PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 11:08:37 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::aa) by PH0PR07CA0034.outlook.office365.com
 (2603:10b6:510:e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 11:08:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 11:08:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Dec
 2025 05:08:36 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Dec
 2025 03:08:36 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Dec 2025 03:08:35 -0800
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
X-Inumbo-ID: bafe3507-e4a6-11f0-b15c-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqpJGpXr2LKuONK2CmzCNgcyep2h+nG5leVlScEt9m8K2UlP+uvOaFVo5YO3fMIRr2iwPa7jI7TvCy79qih5g039OH0Sks1JrOkRETY6QdD8d2X6LXBNV5lA6wmCSQ/6vls3C7sWd3NFAn5mx404JEEs5OGTRPN9NwpQ8aUy07GnV0GpswpW7hmsgM8Ik/a78tLjdVonYPcSnQnnPISIZMwKskE31hpOgbC00Tqx/15tMRTzNcW1/Q6guxI99wtpgx5jHY30jC4eif79OVqDt88sVGyzU/RgRbKDLrMHQfMQTn3u1HfT0X4y3pl1oD5nHLkna5jWAhBwrMfOfOsm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSTLIE8bHMgEiSHrlpMrwwNtA5SbWqRVudIAsXzGG/Y=;
 b=R99VSZMFc5baZAawQwnoqMaIlV4j5nTUIZoGZDR4M07OXdhqUL4UTXF5D5/5SJoaMu1XZhR9tLBh7qxvWEy3LLvlQIKAv/PI6iELrg6gdzYYEN6LwUIONxfNwERRorhwGZDeN67zjFHUIYxGDHfjzFnCkSxDTVQ9f88XS5mkJDuovzpyPw1X5HImol6jolAH/y67FE48J6dV3gYntnk1eLiplXau7u/ueE2NEOXKFQSd7x6SOD1BHpXt5/YEnQng6Iy44ra8MajKEc23FL+Tdt19o2PEfv/oIOZ8zV2zBVaU9699sC6bfYvXymndi3chP7NfD86aLnWVaVhrLHOarg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSTLIE8bHMgEiSHrlpMrwwNtA5SbWqRVudIAsXzGG/Y=;
 b=S7z7O5Hq7c6YIFZhxmxY7PgZGEw5ioSexwJkwyVoSo0LY7GG0DavdrpXPR0sxenQaq8A1BDlnY5bdQP7Fznzf4IkQTbPiPD4ZCccoNDI0ccIpVo6d64abndUTvLw4zTUndOx9f54J1ldABvSs8gOMuuIt91VD2dCsF8AM5mDRQ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <9f2c9e4a-64e3-4e5e-b5da-976ab433f6cd@amd.com>
Date: Mon, 29 Dec 2025 12:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/arm: optimize the size of struct vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
 <0756ee97dd47f6acdefe593694b743eb6bfefacb.1766504313.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0756ee97dd47f6acdefe593694b743eb6bfefacb.1766504313.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 49299ae5-6540-4d9d-5130-08de46ca9d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXB2dG5oR1JPdWszR2YrMHlXM3M4VWNyeTJ1YStDdWZmeEloQUNjdEVpZ08v?=
 =?utf-8?B?ZDFkSDB4WmZ6Z09OcGpLZzNJc2FqaU1SK0JkQmlKYTl2dEhhQTZjeDRlei9p?=
 =?utf-8?B?OXE0QXRnRGtEa29GL2k4WElVWVhTV252UFBIWVA2R0ZFVHBzeGE0em5Zc1Vq?=
 =?utf-8?B?QjRyV3ZsVENIdWZhckdGbStGTjRmU0tXWWVqUVF0UTd5RXE3QTQzOVZZREtI?=
 =?utf-8?B?VU1QN1dPQzJUdklNaDBGTSs3dlN0VGZhMXVNSFIxYXVmekRLT0Y3dDRDWEwz?=
 =?utf-8?B?emI5RkRRcnhYcE1SU1BSNUlsVmdicWw2Rk5rbkovMS9NTjNvU0hLRWhLbno0?=
 =?utf-8?B?aHdPdVRXUjZITGRacnp3Rk13ckc2R1hiQm13Z3U1NHIvY3k0dzUzenpnbFJl?=
 =?utf-8?B?OGhhZVp4NGNvWXZzZkJteHhGMmZnNUdVNGh4K2xiSkhsRlpINnkwSmk4M1Nx?=
 =?utf-8?B?TVdUU2NkbHZPUmphaVVuSVgrdkpod3FHMWczNzlwbytnbWQxUDk0dXJVMVdL?=
 =?utf-8?B?RVI3a1IvRVdCdVFBcENrSGtsQk01YkYyTTNuOHNKUlQ0UVBZNzh1Mjl3S0Vt?=
 =?utf-8?B?MnZuSDJKR3NJVkp1RXB0L0dBZDJTRGVXZkFXYU1EZ0tJWHFMVCt0SngyNXBJ?=
 =?utf-8?B?SFNqcDlONU0zT1FZazBsVzB2VnVjR1JOYnFMbk9wNy9TYXhQbDNCU3RnaVJn?=
 =?utf-8?B?a1kyUFRFKzk2ZElEZVhMMzJpK0pkMUhZOWM0WEdUaDJacmc2dmozbUJBNjdk?=
 =?utf-8?B?SWUyWmxNb2pFTFk4UGl5ekxpZVRWU0E5WlhiUUE1ZkRPWFh5SjZKMk5NMlFs?=
 =?utf-8?B?amFkMTJkSjVmbm53Z3RYQ2dZSjY0elpkaVlTYjk1c252UnlXTkxLV213RFBQ?=
 =?utf-8?B?c3Njd1Avc2x4V0pEQUtCZHNxV2cwUVo2UllkbFIrckUyME5UYkdJZ3VZSEJU?=
 =?utf-8?B?RWZuNGV0blFTOFFleG9CYll2SnZQSTZHTy85MXNNTXMyZzNuRE9SdS84OVhE?=
 =?utf-8?B?YkhWUTJ0YnhPWkh2RWEyZko5ZDQ4WDlsdmUyR3cyZXkvWFJlcGIzbWdXcXpC?=
 =?utf-8?B?ckw5SFE4T3pWY09WcE5FMU1vYzRVbHNvQWJLUnVPR2liQ2dpM2ZFV1B5eWZK?=
 =?utf-8?B?QnAxSlZjTm9SR0lTaGFjbVRzY0dveGlGV3J1enRZRkVraS96aHpRUFc2SGVi?=
 =?utf-8?B?WDcrbXlVSFBOTFlUUFBMVEZ1WU5VVXFhVE82VEFUb1VwSGZlaUw5dzdmVEJP?=
 =?utf-8?B?VWZkZmZmVUxlVG9xaFdSYjE2YitHYjlhVWZTTlczTVpuNUNHZGRqbzJsc1NT?=
 =?utf-8?B?VjErcTdBeXZRZlBQVHVkaWwrd2dBOHI1UHcvUGI2Qk15c0xlS1d3MGNDaHBW?=
 =?utf-8?B?VzNiWGUwZVY5NXNuM0w2eEJHUDNxSEkrQ2E3MFZDbCt4bVVTdHNyVkc2SHYx?=
 =?utf-8?B?S1d1b3BNL3dWb3NqNE5Wc2NhSEYzdUMxNFQ3WmZMcXliY1ozMjNtekZ6aEcv?=
 =?utf-8?B?VFhJdTRmdGhMcmxod3dvckJiNnRxQ0REK1ZIVXMzbzY5QTVYaENQMUpxSFd0?=
 =?utf-8?B?eCtDVXFMdHBLK0pjMW96UGZTeVIvaU5nOFUrNzhSejZKZDhlWkFlK1Y4NFdv?=
 =?utf-8?B?RUhCekFqWTFacFhmRk5OS2F5d0Y5eUVWbGtTdGlSM2hoTjJoeGlkSEtsNUlU?=
 =?utf-8?B?RG9oUWhHek9UZDI5MmI0MlRreW5UR01xQmpaL01PSTVkdEs0a2c4N0l3WXRB?=
 =?utf-8?B?eENxUVIzL2VNWWVqZjlHNlhFZXNwT3RmSkh0Q2lzV1ZYSW53S3M0UUJtck10?=
 =?utf-8?B?eXJkdUQxSTN1ZHJTOGFLaDNlRFJCenJJQUYwVTYvSDRyUCtuUkhpbS9CWVhT?=
 =?utf-8?B?czQ5Y0lwaVIrZGpZSkkza09ZVXFkTHVMT01KUHZEVTV4VmpNd1dQTlo5TjZr?=
 =?utf-8?B?NU5KM01BSDlSZzQ2b0l1eEpvSDR0NzBIbUZyTEpVMlNYOElyL1VQMGlwMnl3?=
 =?utf-8?B?RWtYWElHRno5Mmh1U0VEaU9NUUJXaUdTeTdHa0thL0FtMHd1MkNSMlh6OEFG?=
 =?utf-8?B?eEEwZlBJMVYwNmtRRXI4QlNCQ2M4Z25KK3doT2pHUHIrVXMzSi9rOHJvbDI5?=
 =?utf-8?Q?fbdM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 11:08:36.6663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49299ae5-6540-4d9d-5130-08de46ca9d2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012



On 23/12/2025 18:01, Oleksii Kurochko wrote:
> When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
> exceeds one page, which requires allocating two pages and led to the
> introduction of MAX_PAGES_PER_VCPU.
> 
> To remove the need for MAX_PAGES_PER_VCPU in a follow-up patch, the vgic
> member of NEW_VGIC's struct vgic_vcpu member private_irq is changed to a
s/vgic_vcpu/vgic_cpu/
s/private_irq/private_irqs/

> pointer to struct vgic_irq.
> As a result, the size of struct vcpu for Arm64 is reduced to 2176 bytes,
> compared to 3840 bytes (without these changes and with CONFIG_ARM_64=y)
> and 4736 bytes (without these changes and with both CONFIG_ARM_64=y and
> CONFIG_NEW_VGIC=y).
You only touch new vGIC, so there should be no size reduction without it but the
paragraph reads as if the change affected both old and new vGIC. Also I would
mention that probably you provided the numbers based on a defconfig target.

> 
> Since the private_irqs member is now a pointer, vcpu_vgic_init() and
> vcpu_vgic_free() are updated to allocate and free private_irqs instance.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Other than that:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


