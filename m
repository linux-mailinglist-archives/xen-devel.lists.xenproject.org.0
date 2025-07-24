Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E841EB1152E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 02:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056686.1424717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6AH-0002jH-Lm; Fri, 25 Jul 2025 00:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056686.1424717; Fri, 25 Jul 2025 00:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6AH-0002hs-HD; Fri, 25 Jul 2025 00:19:57 +0000
Received: by outflank-mailman (input) for mailman id 1056686;
 Fri, 25 Jul 2025 00:19:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf6AG-0002PE-3R
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 00:19:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2414::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 168d81d0-68ed-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 02:19:55 +0200 (CEST)
Received: from CH2PR14CA0042.namprd14.prod.outlook.com (2603:10b6:610:56::22)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 00:19:51 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:610:56:cafe::fb) by CH2PR14CA0042.outlook.office365.com
 (2603:10b6:610:56::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Fri,
 25 Jul 2025 00:19:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 00:19:50 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:19:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:19:49 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 19:19:49 -0500
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
X-Inumbo-ID: 168d81d0-68ed-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCCs6tqV7eLp0afBfbMTTo/EQ7Gdj9NJJwUq5Ggw37ZC/D1JtLGcnW/DbJayedEGaNbwCddYwO4Vj80VB6iraBWyYoQudRNPQMuvBB2pImYrV+Jf6REEW+XORBu63FYKsQKG1hSje4LbzGSM2zo34TCXb9rNHDq9qPhF8XDce2yrjW/dwbh7TMmAmKqCrH85vpnsfoSiIzoFsKpG0Sz5tC5UXekCGYk41pUppgbfYbgZ03vIkTGEkmRxhYwiizL80L4o9spOvlDQK8kzGgclJLuEXA3PmN5zN8j83phqMIvPPQUkCXl2LZkj81e04PJ+X1E2ewm2yp21cJ21TLqLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGfhOmnEH634/wlvIZnlTBdnQbBhnEUPVCWiNLt3aJs=;
 b=tsUeRYvLkOhd76N94eT+ikx0qQJk2oqcZ//OWVI/iatoxuor8zHbIhhI8z/bOJqOQ4wKuFs7ZKeGrL8Ud2Rzn6kIme5SSkIbYs1Rq4jhr8RngpkSl9u9lNr/dJYj6nJIp++uG/smHoFPcsbK6V1g/S8WQTUNBpFHVv+cIdKzCTfWyDh72h3zZDyXbvrZyACA0pO5pZQ9znDYPa5VTLdlDyrXG9U+vyEVEaVFVKl2nk7jhguIqNpqyRvK8FzcnH2OPvRtNwfNL2tjSJzLZA1/N3fuStner+t5KyH4ekqFeRyRNrUMdmXqs0mo7OrO5jNaeIRiBXS+Lm5mE2DFsf7xSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGfhOmnEH634/wlvIZnlTBdnQbBhnEUPVCWiNLt3aJs=;
 b=ZwpS2wQxvGEyaSpVntmCQZH+HWdSkYj32PsyEJ0/xczHsF2+I6a+BApaeyHBzzZqTbuBYkJLZo00IiOQaKI85MEdGv8KXypxCFObj7uY1bw6dk4gyUDmd8/ot3TWBuFNvr2czr24ZWc66MGAn470o4TJ99FEOknLbx0Lxq9k+YM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <19702193-f433-4bf9-8fae-922459fce956@amd.com>
Date: Thu, 24 Jul 2025 18:36:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] tools/xenstored: add missing migration record
 definitions
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-4-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250722140628.28947-4-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: 3182f63b-30ba-4f39-2315-08ddcb10f889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1VVNUw1OUMwWTBTN1lLS1hOcThRbWNMbHRmd2VyZGo3TXlVRUNGamN1dnZo?=
 =?utf-8?B?MWNLTW96TVRkc1UvdG9iN0orWXQ0bTFjekpNSTBHQ1RDMUNnZXN5bjF2Zmhw?=
 =?utf-8?B?VXJhTlBVUGxjcmJmUXJnUlFKL0FQc2ZCQzJOVkxOWVV4Qk5sZVI3MVUvME14?=
 =?utf-8?B?YnJjaXRTQzdXUVlFeDFuYlhlSUtaOWsvaXJVRXdRcVJaUVRMSll6WXlGOGVl?=
 =?utf-8?B?V21PbXROTUxtd21qc3lEZk1oaFVvSGlIV0x6MTlTb2ZyRWltT0YvSVR3MDRQ?=
 =?utf-8?B?d3RMRHVBaEdYSHhyVEJSdVRxNHluVWl4dGs0OTVBZUZPdS9qODVqK00wcEdy?=
 =?utf-8?B?TE9nMklpamFDM1lCa2NDczJVSjJBWGswa29ERmdlQzNuemZ6YTFXekd0YXZp?=
 =?utf-8?B?MVhMZUROVmtxTmg3aUhKOFp1c09VLzJ5UVM2WDVJWmlJY3dDdzVIeWtvVzcw?=
 =?utf-8?B?OHM4MC9aZFluTHZud2hhRHFtNTc4OGw2UVFJcXY4Wmk3TldNWW1mV1RMbG9w?=
 =?utf-8?B?VFlZdDU5Rld2OHFKMzdqYUxMelFCcEZZeFBMOTJrTGMycThEckFwajdpZ09h?=
 =?utf-8?B?d3lzU3FSMXJhd3graktZdzZwQ0kxeVJ4Z0lPaGJiQlhlQmpMZkxVa1lIaFpZ?=
 =?utf-8?B?QUd6Njl5MVNvbDJNTzJHVFBtYnhZRERPQTgweTBCVmNlaGpHMEoyeXVwRXVn?=
 =?utf-8?B?WW9pb3QwNkdBRjc0eUxESnQ0WEg1T3pUd2FrdExuVDljazhKY2NZK3Joelh0?=
 =?utf-8?B?TWJaSGUwQUJjbzM4N3QxL1IyNitTSDZ6SEsxNmhUZzZtM3F5TEdRcXVUckFq?=
 =?utf-8?B?S0FNSDdIZzhJYXJiem9qWVhaWnhGWkxFTWp3VjZTSSt3TjlFaldHR1FZWEFN?=
 =?utf-8?B?Ty9IckhWQkZCZDhsWHlZNmJyUFYySUVhSWE5VDl4RzkzcUJvTTdONmFyMWI1?=
 =?utf-8?B?RTlpWHNuSlFZRktLV2pVUFc0TmZCcWVLakk1cFl4SHdQU2Vsblg2SzNUOGlX?=
 =?utf-8?B?STV1VEZ5R2lCNGlQMm9sTTZwTFdOTGZCc2JBcmNUai9EUkdWQXJMVFE3UUVH?=
 =?utf-8?B?eE1PVHRROUQ4bnlZenMzbFFGTlhPd25WVzI3OGVNMHRsVC8zQzJlS3JEbjNl?=
 =?utf-8?B?WURTK0p2bDBkOFMwL1JaU1pJaGNGc2Q0NDROYTFtbHZzVllKRm8wQ01ITzBa?=
 =?utf-8?B?bkoyeEZGVlRVTkFnQ09wSWEwcDlyV05ZaU0veEl0YlVFMjdUcXlvU0FUYVcy?=
 =?utf-8?B?VU52WlJVanVEK09GbjMrTjVYd3dKbEJBRFJXR0Z5c1BaRURYUE8rWktiMGRO?=
 =?utf-8?B?dUlvbUZENndxTGRnMTVrMTkwVVJ2dWphbURvK3VxNjRsMHpyODZLdFJwZUJI?=
 =?utf-8?B?TkNOcUtWRWJqb1ZDNGkySnY3dmdRTmJsSTgyTXA2VCt6WWdOYlJWZkZzUTdU?=
 =?utf-8?B?RWJ2dUxqZ2dJcFZ6L25TcE5IbW9ScG5TOHdWYTZ0WVM2S0ZFQm9zWnVySUhh?=
 =?utf-8?B?TzBOK1Z6VEQ1VFY4Z3l6d3ZpUkhEWW9vcjF3YnZ6bmNxQU5BVU1uS2RaK1Ar?=
 =?utf-8?B?c1hlazJEYXFFSk4yY3dMQ3ViWEZ4L3VkbEZFTTUyMGpZUFVjUG1hNmIrblRU?=
 =?utf-8?B?em9jdEZhTXhnSUtycEVBMC9TTVNPL1NMOXFpdUZvY20xTVk1K2dMQjY4aElH?=
 =?utf-8?B?UCthRGFYTEl2TWh0OXZ0ZE5ab2NYcjEzc2hPZ3JrU3dubGh2eWZ3YjFXZFpT?=
 =?utf-8?B?NU1kK2h3bk5uN0ZQa1NRSHQzRExPZ1dCMjFFamtna05ESnNBWGo5REhrYkNk?=
 =?utf-8?B?SHlvcE5PdlRsNGdERjNDczFKQUVwVTY0WnBlREVGQ01BaEk2bzg5L1VRKzM4?=
 =?utf-8?B?cGtmU2hEdWEzd2RHeFp3Vnp2VDFUOFdCcXZ4ZFVLdE1nY0x6ZnhEenFhTVdW?=
 =?utf-8?B?TWhSTm03bDEvSXdjelo3bVJCUGJJMWhzdVZ3RnVPZUVTRHcvY1JYa0kzWWtp?=
 =?utf-8?B?UDQvVG81NmYvUld1Z2pYL1VGMEVnWjh2SG1iTHVlL3UwWEV5MHNkc3FXL215?=
 =?utf-8?Q?rL3TNA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 00:19:50.5313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3182f63b-30ba-4f39-2315-08ddcb10f889
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180

On 2025-07-22 10:06, Juergen Gross wrote:
> Add all the missing migration record structures and defines to the
> xenstore_state.h header file.
> 
> Update the version of the migration stream to "2". In order to allow
> receiving version 1 streams, change the version check of the header
> to reject only streams with a version higher than the current known
> one.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

