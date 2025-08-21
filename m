Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2B4B2F5FA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 13:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088526.1446270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up3DB-0003Ia-3K; Thu, 21 Aug 2025 11:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088526.1446270; Thu, 21 Aug 2025 11:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up3DA-0003Gy-Vx; Thu, 21 Aug 2025 11:12:04 +0000
Received: by outflank-mailman (input) for mailman id 1088526;
 Thu, 21 Aug 2025 11:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9ZH=3B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1up3D9-0003Gq-Ux
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 11:12:03 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2009::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9913195-7e7f-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 13:12:02 +0200 (CEST)
Received: from BY3PR04CA0012.namprd04.prod.outlook.com (2603:10b6:a03:217::17)
 by DS7PR12MB6359.namprd12.prod.outlook.com (2603:10b6:8:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 11:11:59 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::a9) by BY3PR04CA0012.outlook.office365.com
 (2603:10b6:a03:217::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.17 via Frontend Transport; Thu,
 21 Aug 2025 11:11:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 11:11:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 06:11:57 -0500
Received: from [10.71.193.195] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Aug 2025 06:11:55 -0500
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
X-Inumbo-ID: a9913195-7e7f-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0q2v++h36XcGy6qod4fsrg4QkZYF7gq/tVioGH7Sp/Vz2TjiWh3S4woyitM/SvrcJ9BZucyx2ssummgqZQmO7xa/OImu0PSVVIqm5rtxo0LeN1gBcz+2ux6nO+KhxTwsrJbVudFQ8SwGjvXF7AEghUs+Rbzp37XA9RpA9bmdB8dAh3hbp08/uEteh75U2HTkyNM6k3gziGxabb10p+l5/rOiFoUjS728OzIuv1LeuvDmTUMhGrYlSl5wDxnz5XkQkO3x5H/dK2c8vJ3HVhPahJQETNlHCCM5X52FMnXksYZNGgzm96wAwucW8LxTvBs5iEePmus0lFcy1ssKYfIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vabf4bcgjDRHqEYhpumcdt69oEhwzWckXktEH5MEsIc=;
 b=rHjuNjkJmE2mxwLz/htcR5AYBGzNEx44bhoMUu18P+GkvnFTrjcjfJCQbe/vnTQ8pCPxX0I3T2+t23dDihW2oCkVzE27jpjpLSgCjRFr/4pdm5fQpaL3CXwsksYSFTe8H190X1nnbvYH2+foRo8eyRWp7dNuoa9weKpZx36vfk2IBJEAMpHVdcXm6krHUt1JPE91FDZQvdhPa6mlL+1RDMmgiUkP3uGDMPfWmdKL9LOjwcLOzZhKXJZ11mkvGEWH2Ff1XPgcEKgTjPFijGvrAnWZmVxsxY4NK/cqJjXvswO3ox/XVd4SbYRRYjFmq69sNQey6btxH7UrFkt0s6Ktgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vabf4bcgjDRHqEYhpumcdt69oEhwzWckXktEH5MEsIc=;
 b=CUuYpqQeSbtiSKg/Wmm0NK57Qz+PmGM2+JPWD0lzLuizPTwHisKfBPGSvqGtOuqs8sfqwbaQnu0HAmZXFJhy9r8T50jqQZ2ipyg6s/SDbP+3GfeaqXz2jk0pPIfDBAXzat1Db13u/fwwfdicyH5Pe93t+YOexNjVxDn5LufHSDk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <360f719c-e9ab-48d6-85c3-60593f57faf7@amd.com>
Date: Thu, 21 Aug 2025 13:11:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm/mpu: Disable map_domain_page for MPU
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250814081959.3504145-1-ayan.kumar.halder@amd.com>
 <20250814081959.3504145-3-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250814081959.3504145-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|DS7PR12MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e295b6-f3d4-472f-ec6b-08dde0a38bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW5rRzkwVDZuSlpoYWJwWVdWNkMyWmZYVUZPRkswOWh6cWUwMzFmNlg1UytE?=
 =?utf-8?B?SlkzUUNxYmI2RkFmSjhWNXR5ZW1wY2hvdkF4RE5CWTNpMkNZSU1lT05lanpu?=
 =?utf-8?B?UHpwcExFaEYrcE1rV2ZQemxxeUhiVDdkeXRVeHhjTVZTVHVrVVFMRmJVeEdI?=
 =?utf-8?B?UFowNGpRbjNWMXRFUGNTSlI3dHpxdU5CWlU4NWFyRHV5eUlBY1ZNd09sU3Y3?=
 =?utf-8?B?TG1KdkQ3MW1sbVFaRWZqeVZ1WVVsOGZEVjFmUzViL2hBQXlyTG1iV1YrWkxM?=
 =?utf-8?B?cE9rWWxpSVBqNnMzUk9oaytVU2tsV0x2TXdTZFp4c2J4WENoRngwOUVLS05y?=
 =?utf-8?B?QjdTZ2JUai9SeEZPam5ZUXhacFBDOFlDTytCdlZpN3lRS3Vla3pJeEEzZDhW?=
 =?utf-8?B?T0p6M3dzVmUyUmN6MURNZnpsSWtNNTc4bCtlcVpLeVh4d044WEZOOVk3TUhC?=
 =?utf-8?B?Ym5HL24xOG9YZ05NNUZJU0JHRW1VT1VoKzA3QW5rSHFsbzkxTDhLN25ReEgx?=
 =?utf-8?B?MDdDc2JMYmtyWm4xeHRGTVVEZVBPQWY3ZTNnN1pkNkMxekc4WlN0YUtSdVRa?=
 =?utf-8?B?VndRYnd6b1ZmbmhudzZRVXRxOHhSZ1FZL1BpOWtSTGUvMWZmeXR3WVErMXpG?=
 =?utf-8?B?djJmK1d4SVU3V2hvMThmZUEyM3VNVERaNVJMNWQwL0JkanVQbnk3Z1FrZ1l3?=
 =?utf-8?B?OW43TmFtSkFCb2lZdmNTTkRWU1RrcTgzZm56SXNTMUJMYmpDbEpvUnp1dkpn?=
 =?utf-8?B?UldHTXdmdVkwclZNMFBjNWU2U0FlbjlSdDh0L0lSUnRyRmUzMlBSNHhTdU54?=
 =?utf-8?B?M2xFS2gzVUhraTdJbmUzNzRKK0pIOXBqUFRsL0RpQktjYXZuRnhBaFU4b0dR?=
 =?utf-8?B?bjN4SDU5TWwvOWJzZHA5ZmJ2N1pkUlZ0NWpLdnJTbkg5QXpGamNHNHdoanZp?=
 =?utf-8?B?ZVh6ak40KzVFbnYwNDJIUkRvUE5ERVkveTk3RXU3Umg5ZG5jYSt0TDhPU0FZ?=
 =?utf-8?B?SG96MXFiN09qSHh0Z3VFSW16bXlYRmdRRXh4eCtzQzBoUHBGcFBtczdOQTBF?=
 =?utf-8?B?amc2eVN1MU55ZWEyRzhJSGE0RlpOWjlOMzhoUHVjejlzWkhsZms5c2ZEbXNl?=
 =?utf-8?B?RFNiNVBaSkpOY2xRbG5MVTAyWmxiNzE3OVNXeUg5NkZnQUwxbjl1QXVZUzBT?=
 =?utf-8?B?WWdQWkFqZE1weWJaakRzMXVZbWxvREtTMDB0bEk4SDNGWFRYa2hsWjRZMHpv?=
 =?utf-8?B?dllBekVqYWp2WGpsWVdMdmw0OXp1NDZyNW1aUTJtSllVMkxMWWw5bW5kYzhG?=
 =?utf-8?B?a0Z2aEZjaDNpN09NOE1WeTFMZ0hYekRYY1dIVlE4b1VJK3Y1ZEoxcHNQRDFj?=
 =?utf-8?B?RGtRRUxZVVM2TnFaTy8wVUtVSU1DRDNYWnU3NHVGSGN5VkFzL0l0Qit1U2xP?=
 =?utf-8?B?TXJXTG9xSEhYNlpGVlpGOXJqR3JmcVY2TkIwWFZabmFGS0lJek5iWjJXdWhT?=
 =?utf-8?B?bGZpYkhCNFk4SU1FMEZ0R0NiOGFLZkVjY0F4SnorQ0sxTEZlT0wwVUdvRjY4?=
 =?utf-8?B?ejQ5QVpIWmgrbDREbmJaMWVKTGw3QkFJRXQzZ0lQQ3p6aHVOQUxOUEdpZU1o?=
 =?utf-8?B?TUJNTVBXUERQRkMzcWpxaStKS2IrOXlGY2FKeGJrOGlWVGNxQzlUd3owM1FX?=
 =?utf-8?B?b1ZraGs0Q3NYSm1ub3JpQW1uendxMDBJTWNGSUFTNEQ3WEpPVjA4dENkMkNE?=
 =?utf-8?B?VHZYMXFFSDVwaEVGVlF6UlAwZzUvT2tickRqOUZET3VRczRjdG8yeEQrcUd1?=
 =?utf-8?B?TlRHTmU4N1ZUckg0Z0JqQzNXcWV5d1NVd0RmNHk2T3lWUFFuUDBMZ2QwVDlo?=
 =?utf-8?B?WCtDYzc1ZXo3OGRNcHBOTDMzOWFJU1FWQTZPeUFkUzh5a2k2U1NUN3U4N08w?=
 =?utf-8?B?a0hVdDEyVkZzREZidlRtU3RiZnJaajVLVTRiMkFjT1BxQTZzaTB6L3l1Ly9X?=
 =?utf-8?B?ZU1QUkg5RndzYnBkM2dFb1BwOU5mMUErM3U4SVJkSXJ3M0tuMFNTMS85a0hq?=
 =?utf-8?Q?wyVg2i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 11:11:58.5000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e295b6-f3d4-472f-ec6b-08dde0a38bc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6359



On 14/08/2025 10:19, Ayan Kumar Halder wrote:
> There is no domheap for ARM_32. All of the RAM is mapped and VA == PA.
NIT for the future: It's always better to mention explicitly that you're talking
about MPU also in commit msg. Without looking at the commit title, one can be
confused.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


