Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30EA18896
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 00:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875724.1286154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taO4G-0008Gn-QC; Tue, 21 Jan 2025 23:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875724.1286154; Tue, 21 Jan 2025 23:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taO4G-0008DV-Mz; Tue, 21 Jan 2025 23:54:00 +0000
Received: by outflank-mailman (input) for mailman id 875724;
 Tue, 21 Jan 2025 23:53:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eP5S=UN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1taO4F-0007sr-N5
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 23:53:59 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fab46cdb-d852-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 00:53:58 +0100 (CET)
Received: from BN0PR02CA0044.namprd02.prod.outlook.com (2603:10b6:408:e5::19)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 23:53:55 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:408:e5:cafe::93) by BN0PR02CA0044.outlook.office365.com
 (2603:10b6:408:e5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Tue,
 21 Jan 2025 23:53:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 23:53:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 17:53:54 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 17:53:54 -0600
Received: from [192.168.62.40] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 21 Jan 2025 17:53:53 -0600
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
X-Inumbo-ID: fab46cdb-d852-11ef-a0e5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8SejpETBUgZzvhJBA4UfMP6ksRSEY2XzX8oSNMvp2lxQ9e+5M+xX9zWYUj725J7KoOD46FXPfM/H0nST5KmpcXteBCeAmfgjVEzO17YQooYwMbHnBEG3giQ6S6FJVHyo9nQ1ReA0no2TbcaM2IOUeuOEW122VK21Dk0HWQcfe2SPeeZnVQd3N8QamlawBSV7ODT7rolhqRyE+waqAhZI5yzlGmiGpeoxiRnTEUbAJQlRgjTIzzbx9uhMVINzQO3hFjAOWKoIoM26lat+zlEPuEY4NfMFeCo/0M4lYE4EIKRcysil5lnWPlV4mP8B8HaB0GmKZi1Z9ngomxusJgruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtwZNlSo1PT/CNoHxOp2k22F/4id72rjUEgzv0Q3XUM=;
 b=JXfc9+JaOIU28hNCOd/5mT8cksoc/KrIzb3UIfHWjYv12U499LIMO9zi5drXCCTASGllcLANvdAUKDCe/0wGt8nYpED7PdOPzB7sS2I7Mf3+ZZCuh7wVCyW/mpRnwm0PzwwRnLLusY3OBxYw2muTl1HrPZIIOIKnes7VGqC5qHTkkWScgnhTxM6YaTLTqe9QdIDbxhpwQJhFU0GUn18yu7blgFFOQf9z7VeeA4FvXX8DgTNHY9gOFVMhdkG4EIDpqSRQ2bUAEd+qbHuuXfItV9GbQuloh5VpKfj990gSjvsZkKQdyzrxIcrrDXKvD3AsdwxCw2IdlEho1l394ZpMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtwZNlSo1PT/CNoHxOp2k22F/4id72rjUEgzv0Q3XUM=;
 b=kjSZ2aA5Pk7nZdusRxCDO0dijmCiJhLKZLLABHPjtB3mAtvTAWPq6uGwflq1IvWERx95i8j0c3TYldz+Wfo+BAP6qfkHtsln6iR3MmW2IARseTpuBHrT2sPS9FDFNap30FMJp/ZHqlvDpR/i+2K/K1TWnzEl0/RAYQHngjr3nlM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <99bda095-391e-4825-9bb4-c21b7c5e1813@amd.com>
Date: Tue, 21 Jan 2025 17:56:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/24] arm/vuart: move vpl011-related code to vpl011
 emulator
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-2-c5d36b31d66c@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-2-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 4035c2a0-8903-452b-bfc6-08dd3a76dd34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmIrZkVlWU5TVzBQc1Y5bFc3SVU5eGtKbjVycVo4NWJLY0lwaEZvQjFwbmd4?=
 =?utf-8?B?VTk2dzljZzVnSmFZbkkwSXNRcWVGR2pnWE5LWmlnODVtZlU5VzdDR1ZCS2tM?=
 =?utf-8?B?Z1NuMytDbjZablM1aVdHbjY3WmlTYnRhcjEzVktsZEJEamxtTEt2ZVJVVGZE?=
 =?utf-8?B?cDFiUnI2ZUhjUnNxLytYMWExNy9HYlRNY0NsUHdqVE5RQXBpWkUyU001Nngr?=
 =?utf-8?B?RnZwdVIyT3RzWFVkcmpld0xHbUZZWDVYTUtDZ3NJSXNvYS9TaXBneG10Qmg0?=
 =?utf-8?B?N0VPcmJxQkYrTlp1T2YwQWJaOWdzV0pQNEpXdkdrQ3RIMG9RU3NORXpFQ2Fx?=
 =?utf-8?B?WGd6R1NoL3hlTmtiTUZkRVpYRmM5UjhtOGZqR3dPU3EyMWk5TXAvcnI3OGJw?=
 =?utf-8?B?UG1VVG5iMnZKdk12dDlkYU9OVmY5V3RMZ3hldy9VamlzcXhtTWl5Z213RThp?=
 =?utf-8?B?RXRHM3pKNHIvL3pXUDZxOTh3R21JdUMyV1R5N0ZFVGxqeVNJQUdLcHNCTThO?=
 =?utf-8?B?ajZ3cDQ4WFQ3UlFneTJYUTNXSzRPWUZ2QjNJMDFWWTJFaEQxVkJFcWNWa1ZG?=
 =?utf-8?B?U1BJdWw0WUg4cUtxZXRpcEJvWEdtdHRyQ3JOTjJZKzJhTjVnSlpaV0RoOURV?=
 =?utf-8?B?ZVFIWHZ3cVZZTk9teHdrbTlNUzB2RnRra1FoSmRnNUZXcFpJL2EySVMvZjNY?=
 =?utf-8?B?cDJjdDZXUWFUS0tpU1RLcWRxQUQrVmJNR0dnSFc0ZlNobkJZS2laZkZhZ2VK?=
 =?utf-8?B?SlcwYjJhMklKSUZ3MDBqNE9ocUFqV2tzZDJpRVN2TGtKZlNZSjlVQnM1WjV2?=
 =?utf-8?B?d2FQM2xFeWlueEtnaUJkQ2JYWDVLZWNZcWVZWXBFSEJLZGZkN0pleUpmNVNa?=
 =?utf-8?B?OW9xNy9OdkVXRG9STjRVOTA3U0o5K28vSHBCY2RrZ0VpdWkyd01FdGlzMWNC?=
 =?utf-8?B?bU1BUnk1N1pYcWxmYU56aUt6SFZncnhQOXJhR1R2RXlUVGRLc1V6VXdwOHhq?=
 =?utf-8?B?S0FSdENtdzR6M0Z1YmhqWDRmYktteGFmYi85RTc1ZDFQcVo2VzZFMHZ5L0Nv?=
 =?utf-8?B?Z3FXUnQxQlM0Y1lrNzhvU2xDN25DWVJjR210TUU1aUdyTi8rTzQweE0xMisv?=
 =?utf-8?B?clFvN3FTSFdiK3JqZmVMQUtHMEZiTW94bXE5OUMxMnZhbFAzUWhFMHM0TWo4?=
 =?utf-8?B?YmlIY1gxSVhjKzJZTW9hZTBpTFJ0UXRaWVZUMFg4NGlXbm1SR05ZNUt1NGo3?=
 =?utf-8?B?RHVJZkhSZ2JrTXpGeEU0NGVlK292MEdKcGpwejBQazNJM0UvSHFOWS9PekZr?=
 =?utf-8?B?WFdwZ3JQWjV6YUpUYnJHQ01Vcmt2cTFDV253Q1hvNndNRjU0OXFiak9FczdE?=
 =?utf-8?B?MVJGb09qWDJDbzMwZERlbXZjUzZ2ZUhrbngxTThNdHRpVG9JZTBmVXRDSUJs?=
 =?utf-8?B?MCtPNlp0bk9ZYk9SOFBKcGRoYXU1dVh6OWxrMnJybVpZeGxhcXpSVk1US0hX?=
 =?utf-8?B?Szc0TU9FaElvalVWbUtzVHU3K2VMZjd0cmh6Qno2RmlTL2p6ai95VWxUdnVO?=
 =?utf-8?B?VXdQdWRQejBrTExoZmVLU3lNenBNQWQzWUNUYlJLWlJTQVpyOTFjK0ZyRkJr?=
 =?utf-8?B?MlFYME1DRlZXSEdUdkxNR2g5Zk03SWxtZ2hLWWg1SXRYYzBZUDZ3L3JxdGpF?=
 =?utf-8?B?L3phZWdtRFF1Q3cveHdYVlFOZ0c0V2pHOUhSU2Y0d1REb3BNU01hZ0huZzl1?=
 =?utf-8?B?eGI2dVBtditqUkh3ZjAwRjJHZ2dZYUVydHpPTEdmZ1BPZnp6VENDU3lKbVhn?=
 =?utf-8?B?blVmemlHQ3Y4SDl0a0lWRzVpK0Z1bWVFbnZGMU5zZ3RQckRRL3h6Tml2eXho?=
 =?utf-8?B?WGR2ZktoRStjcWxZWXJvcnpwU1pYdkYvTmhickI0TzlQTUxSU0RDZE9KYWNJ?=
 =?utf-8?B?U1lmYld3TDNnUmpvOXBVdmsrVTBra3pweXN2VERXbVZEdDRTaHRMckRMNzJ6?=
 =?utf-8?B?ZWFSbGVleXN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 23:53:54.7627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4035c2a0-8903-452b-bfc6-08dd3a76dd34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892

On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Xen console driver has vpl011-related logic which shall belong vpl011 emulator
> code (Arm port). Move vpl011-related code from arch-independent console driver
> to Arm's vpl011.c.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 4cb397116b44935214801c496b30e44c9399c59a..1411c991977b5fb26ee5709e523b7bc32b612808 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c

> @@ -579,6 +571,9 @@ static void __serial_rx(char c)
>       if ( pv_shim && pv_console )
>           consoled_guest_tx(c);
>   #endif
> +
> +    if ( rc )
> +        printk(KERN_ERR "d%pd: failed to process console input: %d\n", d, rc);
>   }
>   
>   static void cf_check serial_rx(char c)
> 

This will print the ENOSPC that was formerly silent.  Since this is 
input from the console, that seems more informative to the user and okay 
to me.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

