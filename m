Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054CB89BF69
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 14:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701942.1096580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtoQi-0006Kx-8R; Mon, 08 Apr 2024 12:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701942.1096580; Mon, 08 Apr 2024 12:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtoQi-0006Hq-5G; Mon, 08 Apr 2024 12:48:56 +0000
Received: by outflank-mailman (input) for mailman id 701942;
 Mon, 08 Apr 2024 12:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oSlD=LN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rtoQh-0006Hk-2y
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 12:48:55 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a278daa-f5a6-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 14:48:53 +0200 (CEST)
Received: from BLAPR05CA0032.namprd05.prod.outlook.com (2603:10b6:208:335::13)
 by CY8PR12MB8362.namprd12.prod.outlook.com (2603:10b6:930:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 8 Apr
 2024 12:48:49 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::c) by BLAPR05CA0032.outlook.office365.com
 (2603:10b6:208:335::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.18 via Frontend
 Transport; Mon, 8 Apr 2024 12:48:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 12:48:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 07:48:48 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 07:48:47 -0500
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
X-Inumbo-ID: 5a278daa-f5a6-11ee-afe6-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTo/FJOus8SJH2QbTUXm2UZA0i4HYDvvn66RLjQCOwXEUQklq+dtEGJRE+IrgPpiz6Lh4u8MAmRPbcA6FIW1HVACGsZuvuE2z2W4cAOEKa1Vg5ynV+67qEeWSSxeOliUpu330vkS1PpyyLNyEFC/1yDm28QGZgfK12fSVLw+QVsjXTbO+QdogoaYfdi3xlQhSOphQafaadLo1BeDZosUWIrsqqtssehQkhjA83UM8r1TUmXk0+fYhuEjY+rmlcwad6OF97uBugS3g1rnNmnwZmTWedpC25WtnCMwh5jqwRmxLMee2tXSy+Aar+mcWKZpWk3TAdbsb/S9TY3n/BYswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGQCEk5pp9sIrAw4k+KN6KRlvFQ+JHNUZoUdGtL0Cdo=;
 b=lnzqXpu3m70qUlF0eP8AuPe8MG9vrW5F7kpj1L6mrTqXiHs4Sewa4dhiNIfIb5uEDAoK4rbXqDzviRu9K/fsSudLKtGMi39qT56g05LRFaP/j07hG8iG17Ahwp/yrBH6dvkH7AVjZ203lVTZ71Gdn8Oc7tyc3fpqdhXe01ysZQ3kT4/UL//y0/94OdPpcZeV5nIf+sqCUqED0TKsoEnm9zjhKL7jH2Q2z6aVfnCFeDmV7SZTBrhtztEyybxSbR/CNcJUX9X4uZOvLKbg7xQHM4lcdJjyGzM52J/8fhunetyz9d+XikObMjWfMyeQOuJao6y5tOhUbqCq/X3B8SH4Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ti.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGQCEk5pp9sIrAw4k+KN6KRlvFQ+JHNUZoUdGtL0Cdo=;
 b=sIYVMnsjtPceYGllmImgIABrCbFfBQi4aeb/PLz9RARtpJEtEPV5W1aqteYv3Pfy8pWUSi13PvcwKDDtqJFUeGt7Uf4RF/KsmuT+vWxqWMr53oJcUjjJy7qVjA3iLoBuuyMsKGxEJ+6plemeS8MhGstdj3FONNIeuDsNZGjd6Ig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c65a664b-81db-4fc5-b61a-d81c49715f58@amd.com>
Date: Mon, 8 Apr 2024 14:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: char: Enable OMAP UART driver for TI K3 devices
To: Vaishnav Achath <vaishnav.a@ti.com>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>
CC: <xen-devel@lists.xenproject.org>
References: <20240408121152.1302364-1-vaishnav.a@ti.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240408121152.1302364-1-vaishnav.a@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|CY8PR12MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 57969914-5951-4ad7-575b-08dc57ca3cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9J+ZVrwn5qLFz49CkXwV6zWIkws4FTXRZ81pnkkR4eoFTJVpSBeXWKTzK1cl6E5gwdX8WSbaBKaP4XIGCFcXcV6FB9BQQbacV+mgHqZzm4jgYFSS93MN8+O5MMw/zHEMqnr7xtI5SHsi4Fxh/cu8mAboSqLqToogydbnOyjjADz2qFEzY1uhLbxCpFcA+jpQgz0TdQIJPYCVC1dbC/1Pwtqlsjjg1QF2GKFfSZhqXgEn3VB1MSCXF4/Tip4ykpzhQSBJKPcLlK5yRADDTrTPWFrbG+ldjNB7UlEdDDPOFhRfBItLS02hM1nNlzB6YQRIXjpxN4+XfbHk+p7Ft948fw+1A/Ilbn7Ye3snh5Trs/N+FvQhNH8XjPgkPnHKb8oeyqrcVL0fygQF4M4MUCtFchyAFS9SvfSe+Fy19sppdSAdgVAfEO4cxaS8VRA6K5rI9I4U/UpWr8RwXT/vj8KAOHxq0KtenvxdEmMBJ/I70UudbsHWwjOKqdmDNdaRyLRKikldwdAc/qLHe0HKjzeI6472/On5TGift1dgCKdE7HMGUIIJDRH0OJ4ZxdBFrBX+74HDP11hdAQOfppxnOmcQi3imXimAxGNlmJS/+4r4lew35wiavkJjPZZX1jT1ygAjeA84AhAcJH56xfvIz2ed2MFHS/oVLBMTsl5+nrTQ2YaGwt4RYFFiwueBEUfrR4MEmzOzzMfGANoOiXYCE71JQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 12:48:49.3350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57969914-5951-4ad7-575b-08dc57ca3cbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8362

Hi,

On 08/04/2024 14:11, Vaishnav Achath wrote:
> 
> 
> TI K3 devices (J721E, J721S2, AM62X .etc) has the same variant
s/has/have

> of UART as OMAP4. Add the compatible used in Linux device tree,
> "ti,am654-uart" to the omap-uart dt_match so that the driver can
> be used with these devices. Also enable the driver for ARM64
> platforms.
> 
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> ---
> 
> Xen logs from J721E EVM: https://gist.github.com/vaishnavachath/8185e2378981705e1deb121f109f46b5
> 
>  xen/drivers/char/Kconfig     | 2 +-
>  xen/drivers/char/omap-uart.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index e18ec3788c..dcb9e85853 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -55,7 +55,7 @@ config HAS_EXYNOS4210
>  config HAS_OMAP
>         bool "Texas Instruments OMAP UART driver"
>         default y
> -       depends on ARM_32
> +       depends on ARM_32 || ARM_64
depends on ARM please

With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

