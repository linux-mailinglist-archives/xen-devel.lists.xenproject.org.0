Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68E9AC9884
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 01:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001651.1381785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL9ZK-0004AG-8w; Fri, 30 May 2025 23:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001651.1381785; Fri, 30 May 2025 23:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL9ZK-000483-5u; Fri, 30 May 2025 23:55:22 +0000
Received: by outflank-mailman (input) for mailman id 1001651;
 Fri, 30 May 2025 23:55:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Ydo=YO=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uL9ZJ-00046w-0W
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 23:55:21 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2415::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89f5fea4-3db1-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 01:55:18 +0200 (CEST)
Received: from SA1PR03CA0005.namprd03.prod.outlook.com (2603:10b6:806:2d3::6)
 by CH3PR12MB9022.namprd12.prod.outlook.com (2603:10b6:610:171::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 23:55:12 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::2) by SA1PR03CA0005.outlook.office365.com
 (2603:10b6:806:2d3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Fri,
 30 May 2025 23:55:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 30 May 2025 23:55:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 18:55:10 -0500
Received: from [172.31.32.79] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 30 May 2025 18:55:09 -0500
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
X-Inumbo-ID: 89f5fea4-3db1-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beSUZqRkHyGVhab6OBUexRP2NFCPbph2rbPzJNMAP3wZj4L6E/LDvHgWfvAv7YJx5+5eJp5Z28+bwDXjdg5biKF8qOZHd4Nh31VcYRD8k7/5RdHxWyiT0e8AM4Vt/KVWqr3k9jn02z9tneG0LK3c4zE6/zzktWfaVPuJNhDBiaq82k86P4uWo/2fS5FgI9+J+Hn9lTMEm6l5I6wU4BuXU4mGOWp+cc5ElgWTjs+b8DGkK3SFp1pM2pSfxmR/qri12WbB+HsrnZ8T3dRB6RnJqKap8BgPRmF5Bod6ajVBnTdsEXQc/U77d2kPeG6J+ezInNKF2h3+H5S3gVl9rBfbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSitg0yvv/akCMm3T4phuNb/n4z5QYfKBxzh90qkE5o=;
 b=nUSvW8NBqBZUMHvgOWpL83Lfe9mLybhV1leA19aplvWQ1izqnm40s+kndBnfHIiNv8td2OWLryYC/44JteyxOZThCuOBy1WSMNCg4QotT2nby+GPxtt+t2+UIqDr/rmwZ/lNe4658aIlUgC9qimPM5HjGVY3RTfUS0Dn6ZXximZCBrlsqFjGNXvxjx7wWgzxyNnBDc8ZZPk8+C30cnvnXG2bNT5E/QA0YsrSMTklkjRQIECd2jIHZqbo64lEf4lWYbgJGy9mWqZlnY9asGLfwLw3vcGgyhBR/unGkhPiXSt8ciopaqnBrAaqIcactAvpqy6L9ZrCPG0/pT/c/QybRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSitg0yvv/akCMm3T4phuNb/n4z5QYfKBxzh90qkE5o=;
 b=WfHDmjAZLKE6QULTFu2uXTlhjb+KzllUBQJR3LWA4KnhS7fopWGbVGkPzQHn0CAWJgkBkCfYXktEV2PXLYaA+cVNHol6c5J/xMtG3Ii6VGfG0JNpD/aC1bE79DZJkeBqIb606PX1Z/S8f8C3rerNYU+6Z1oRB6YfGdCNJkV39fQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c94dd42c-a2be-4759-a5de-7c9db46acd16@amd.com>
Date: Fri, 30 May 2025 17:04:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm/gnttab: Break cycle between asm/grant_table.h
 and xen/grant_table.h
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-8-agarciav@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250530120242.39398-8-agarciav@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|CH3PR12MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd670e9-0c32-49a6-2b70-08dd9fd56a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFZDSkNjVGYwRTQ2dnlaSEwyZTlTbjVGTWFGelVaR01jRlkwK01aUXRFaDl0?=
 =?utf-8?B?dkY3WVRoMWc1eVdnK0VjQW5LVjZqVFRSVE1xZUljZVpUUktCbXpyVXVVK3VQ?=
 =?utf-8?B?WUx0YUlpaHFMaTV1bjhSVy9hL041a2NLKzZBMEJmRy9ZRnp0dkpEYjhHZmo4?=
 =?utf-8?B?VVcrQ254bG1RSEV0bFJNeURxem5uYS9TeVM2ZEE4dVlLcGVnZDNkRUVrTXVT?=
 =?utf-8?B?ZGlVT0YxVUh1cTNnMC9ZT0E1WlZlS1M2UDBpRmc3VUIwWGM5dWFsK0ZPNlYy?=
 =?utf-8?B?RGhkdXp5OFBQb3lTQTY2R0RLUWdMWm83QlNXbXhaYWNtUDJSV3dHRFZwRExo?=
 =?utf-8?B?c1ZaZVViTHNkQnZ1ZXlSZUNwQ0FpRUtHdUtiRTdjS2dOamUzMGhaT3R2c0Vq?=
 =?utf-8?B?Zkc3UmM0MFJQcGRvb213aUVDdUNZVmxha2ZlNmoyTDZ6T2xoRlJjNjVvSGdD?=
 =?utf-8?B?SmtyMUJHc3FuUnpKRXExSnc3ci91dlV3UitvS3FCei9hTk1TNlRWWVRSVU9k?=
 =?utf-8?B?QUhmQ0d5OVJTNEhoa3hGbnBHNG42UFpvN3ZQK0NZYnV5MjlOTytLdDlmdWpG?=
 =?utf-8?B?bll4QndtekxwSzhGa2R2N00xdHdxdDR3eXdqM2p6Zkp2V2xJWkRNdlJ2bjJX?=
 =?utf-8?B?REIyNnRwTnBsRi9YOEw1Ly9adDluNHJRdkJ5bTJYcHNoUVFyQnZVODJsd1NO?=
 =?utf-8?B?WjF5V2I1eWJxRkpuL0V1WXVZVnhGanIyYWhObUF5UDZKMW5EMEJsK2tScDB6?=
 =?utf-8?B?MkhEVWF6Q09ZV2JVZEE5TTVnNStiOGs4OEgzUldDYThYaWwyZjlSL3FUNDNv?=
 =?utf-8?B?MFR0L1dhMVIxQlJob3B4T3ZDL3VkeXZzTkVmbnlpK0pqMjVjVXE5eXlZRjVQ?=
 =?utf-8?B?a0t5OXIzTm4ybFNmVXE5b0l3QUNmUkpQK2t3MWpJTERub0h5SkxzUW1GdEdT?=
 =?utf-8?B?WnBLVTNEV1o2NHhpY3lZVHlqdGpYQVYzZXl3Vlkrc1QzSlpMZjBITGs5emlL?=
 =?utf-8?B?MVNrclBBVFhFRDRTMjRxM1ZTVEZXN0Y0ZG5iKzlpdTF5U3BnVkMzQlgrMjI4?=
 =?utf-8?B?Ym5qWUg2c1B1MjRvTDRjZ01LY041S3RsODF5OGhsM3g3VHg5d2pxRVJYVkZU?=
 =?utf-8?B?QTZSWlNYLzIvLytPUENmTGMya1JxYm1jYW5DQXMvSFB5bDhvWUVZdFlnc1Bx?=
 =?utf-8?B?dVVHdWdYR2djcjZYRllTZVZHbkpUYjBhQlAyZWxNK2RoMHl6bzhWUmo5Rjhp?=
 =?utf-8?B?RzNrdFYraDRtaDhDSkhLS0NzNk95Wm9Vc2kxVFRVTFBta3Y5RG0rZHA0RTlm?=
 =?utf-8?B?TEdTQy9uMUNMdmZ6VW1xczc5RzlXbDl0ZGs2U3BDSllKZEhJckVxWlNNbTlS?=
 =?utf-8?B?cHVMSUZHcCtVMlV2SGsvVzMvVjhiWmhpMFlZcURaNTNyNkVMaGtOQ0Vnd1pw?=
 =?utf-8?B?cUdvU2RXd0RtcnhWN1NCTFN1VVZqRVJMdDFFdnJyT1NnMTZ6THBTZ3BqREpB?=
 =?utf-8?B?OHFvU0cySnMzdDFaTUtKU1JIamdDRktXemwxbnNFMWh3TXAyeFpMTE1rTFVT?=
 =?utf-8?B?bm9mT3ZnQTlKRUk2Z3ozZmdDRDQ1VTRwS1pGbkpZV1VYdlZpVk9WSGVqbmFy?=
 =?utf-8?B?VE5GMnhwRVpMQ3FFcUFvamQ4eG5mUDhyMldqRDF1eTBoMjFKeEJYRTYwQVo4?=
 =?utf-8?B?LzBkQ2hmeDdoRHk5Zy95U1VsNkI0Tm8rQnhpYVhKR2xIZUlvOStja0E4Z2Rh?=
 =?utf-8?B?bTlESCs4dEcrRmlpM2wySlRNQ25RNnZXMm5TM3pJZWUwc0hVdDhnQTNuaXJk?=
 =?utf-8?B?WmZaY2FlREYvdmU5UUFON2FnWDM0aVI3MkxEQWVmOStQVmpPazBHeWJ4RlY2?=
 =?utf-8?B?T1NES2hLb1BBcjlFTmpVVGxYS2tLV3N5NzRxOTdCMEw5aERSSkxCSmdFNkEv?=
 =?utf-8?B?dnllMHl5VUdPaVdaWExIem1kYURqek9mSWxSQzUrWExxOVZMZ3V4bGtLcnBD?=
 =?utf-8?B?WStqSkhxdjFGY3VSTDMyQWJVczEyaWI0YmZVZ0FlcVdPdkFUbGxLbzU4Nng4?=
 =?utf-8?Q?TrJ1iz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 23:55:11.3219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd670e9-0c32-49a6-2b70-08dd9fd56a22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9022

On 2025-05-30 08:02, Alejandro Vallejo wrote:
> xen/grant_table is meant to pull asm/grant_table, when it exists.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

I think you can also remove this one:
xen/arch/arm/dom0less-build.c:#include <asm/grant_table.h>

With that,
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

