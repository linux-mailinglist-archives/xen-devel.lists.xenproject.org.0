Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6236A21470
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 23:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878804.1288997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcuAi-0000YX-Np; Tue, 28 Jan 2025 22:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878804.1288997; Tue, 28 Jan 2025 22:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcuAi-0000WP-LG; Tue, 28 Jan 2025 22:35:04 +0000
Received: by outflank-mailman (input) for mailman id 878804;
 Tue, 28 Jan 2025 22:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LT9m=UU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tcuAh-0000WH-MS
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 22:35:03 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:2418::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c72f579-ddc8-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 23:35:01 +0100 (CET)
Received: from MN0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:208:52f::35)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 22:34:56 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:208:52f:cafe::b6) by MN0PR03CA0021.outlook.office365.com
 (2603:10b6:208:52f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.24 via Frontend Transport; Tue,
 28 Jan 2025 22:34:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 22:34:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 16:34:55 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 16:34:55 -0600
Received: from [172.25.15.116] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 28 Jan 2025 16:34:54 -0600
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
X-Inumbo-ID: 1c72f579-ddc8-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxdgHDd4R3LzGBjfVMj6KguK+og0kLJp2h0ym5ZcyrzzmHT4HHKCUOiU9g2IpqfDMaLdXY31eHsQjsP8uGj5cl8T9KT8Hbhx2+w80XxuG+Q2jF9A+ANvUQxub9JZu9Ut3Rt8lTWZsyaE8KtBmb7Go53WZBi22n8ZAGQkTmaYZn37i90KcR2IhyNL864T3RFZ4lhxZo+PrlFES4jza/Nx7hkDrevz8IyryhHRP57bt9qEs7GYrfD91Z7uBdiZdoACmhqp54cETzTOVTlM+TYZ12Z9MZ09OsBZKzLALrNin3ZHhHBiJ/nrT2JtCvXMai8vzx7IHFYqFy1/8tFekEzfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjREZM+WkORLLCFukDoPY3JgX+OtpvlTGAO9r4XIFo0=;
 b=keWZ7KOqni0HIMBBN09LhzWmWL9m6nNr8f7PEZuKPFM/uOiFzVqtTwrIw5GQ8BGkWB34kxsmW+DCsgW5Ceim9/WU1JrnHTl+t9x1hGrMT8wk0hMTgzpdqhCJwplhBH0yM//PUrIEu3qorsuJ5mCzwiKaHrTxxIrILbXd0MJguYigqOLz+j1hUkRyqOeQURqy2JFmzO5yfLX5r2hJgwBsZBQeaaD2KNp7IDh8m9N1qsWCAplpFNeRVf/PRtk0QWcQUwOQRktMLWJ7NkdNcp0vQhwzEVFIZs0krwjfi+pzyERgpTmM5aoh0ZaMtGUDEWIPjQQkgibYJse6BgH8JKR+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjREZM+WkORLLCFukDoPY3JgX+OtpvlTGAO9r4XIFo0=;
 b=xduY/EfC10DVvQE+Z5KjauCv6J6UlFikF83uW0+P9pyTtMyg5Jcfgp8HQvZtlrli63zpeay83+j2WQama/40oKc12TmVjhXpuZ+XhZnngsYNFHvoiPUT6seG5oj56uH6qRAOfEnG0mqSM1mjAvbuFijjx3dc7pm0893FEnStEAI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d58cfd92-cd73-4a7f-8660-6a235ae887e5@amd.com>
Date: Tue, 28 Jan 2025 17:34:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/24] xen/8250-uart: add missing definitions
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-19-c5d36b31d66c@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-19-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 5219ca82-bd43-4aab-fb65-08dd3febfd97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUtSUnFXdEhldDF1SzFiQWtMa1dWODYzd2Y5dC9UVHljcE9YQmwrNCszSU5V?=
 =?utf-8?B?NUplSjd4K05OSnY1MXRrb29ab2V0NG1FalhKOG10NzlsSDVFeFNJdjRlV3JB?=
 =?utf-8?B?c2VDaEp4dmY5N1lPYmlVZjRmM3JiOVhaMFc2U21IOXJWYmRsWnhqa0txS1p6?=
 =?utf-8?B?TWFRZ2UrZDdJZ1JTb1BtR2RsVXl0dW1ES0pWYnJ3M1JyVTVyRGh1WWd4a2pm?=
 =?utf-8?B?TStlbjR0RytZN21lZ1JQR2JrbkxTdnF5ZThJeDdRMDE1TVdLNytkR0llVXZL?=
 =?utf-8?B?Q2owWkNzS2h1bWc1bnIxZmEvdVhVbmlLaWNLZTRJNEVEZWUvYTJwNnJWaW1S?=
 =?utf-8?B?UXRpd0lCY0JFWnRMa0NKWEk5cHVKcVRMdVJ1VjFrT1hzb2tvTkJVU05oWDJ6?=
 =?utf-8?B?bUNkMWhmZVM3N0tlWWJmZFN5YkFUUTBGbnJpcUV1ZFpYb1I1cXBhZGJaVmhI?=
 =?utf-8?B?YU5OZkF4RDVBZnZsWTg0Y0hwRkNHbWVQOWVEZFk2dWYyMmpHNWFxeE5tSU96?=
 =?utf-8?B?cjZoa3l1WThDZytCWnYrQnRPQUYvWnFaSkg3MTA0aERhWms0SG1nb3NUN2xl?=
 =?utf-8?B?Rm5wMUYza0d2QytiUjM1dnJFRWdlS3pMYVNkSFhiQlQ4WDR3VStiWGJpZG1y?=
 =?utf-8?B?UWJobkpuWitDdUhWVmxnNzJvRnJCbmYrMURBNXF5Y3I2T3ZyM0F3aU0xd2RV?=
 =?utf-8?B?bGpRZFAycCtTQTRuaHVrVm92QVB3d2hWNjdMY1dmbE9LZWhZcWxadjYvRjJk?=
 =?utf-8?B?cERUd0pINFZxN1pHbjBaSmhkTFkzSkFOWGJOeUJpY1lab3dwcERleVZXWXFD?=
 =?utf-8?B?T011Y0I2dzl2ckNLVHR6VXZ5YmdQY1hselhqSlp5Vlhodk5iUTNITWU5Mk5Y?=
 =?utf-8?B?UUh4eStzRTUzaUt4amo2TFRyNnc5UmdGMlozbFZFZEJ2M2JrRjAvTEFId0g1?=
 =?utf-8?B?eDlkUU9mS29DMFltWW1DeWtPV1ZIR0JjYXZ2UkJlMlFnR0xGSDRiNzQvbzQr?=
 =?utf-8?B?WnFSdzR4QUpiOHdkNkVFczRtQU5rb2x0enQzTm5sV0VMZUxZZi9oK2Q2V3I3?=
 =?utf-8?B?MGtRcWlpTEQ5ZXRYb0VlL2x6SzZkMnRBemh5My9yYmYyTkI5R0kzaU4yNXpE?=
 =?utf-8?B?dkhVb3Z2QU40TC9LcTJQc1BsOG5DOXp5NXNvVUtRSUhheldEbXBESXJkNm5o?=
 =?utf-8?B?bDZ3c1FxMUdNcUVMWHdIQ04rby9CaXkrTW82eXhaYTNrY1J0b2w3ZU8vdHZJ?=
 =?utf-8?B?bnd2WXlYK2RDSFMwUXhGQk4xcjFGZUVKTDhnUWlydVdJSkR0R1Z5WWJvemR0?=
 =?utf-8?B?ckpUMlZFaHlxeEgxZHZtTkRxYW5FcTZrcFdQN0tpMDN4RGVxRzZJaXcwWEJ4?=
 =?utf-8?B?QmpscDdCTlJDUk13TmsrYnYrQTAzNVJDTzYzYlRGM05uaFM3ZlpEOGhQbDU5?=
 =?utf-8?B?M1BRMFZ2ZmhaTGgxblNoTVYrR2YvTTVvVDU0dFJiTDA1d3VZNm5XU1RDdzBa?=
 =?utf-8?B?eXRXSUh5STk2Mlh3M2VUbU9BWmsyODZBaC9nSGFtOWJRVXdsMkRUYXhkbS9L?=
 =?utf-8?B?RTBqdFBxdmZlUEZxZnJha1FZY2E1NkpoUDBSU1lVZGZpNFBlVjFGSitWSlNW?=
 =?utf-8?B?NDJzNXpIdjFmQzJpMzkvK3dmY2pRc1pteWs5YTBsVzZOeFBUTS9KdTFGUXdl?=
 =?utf-8?B?ajBFVG5QaGRSNlFEWU1qSHVQNCtjUjE2bVZ4MjJqNHhsMWdJdFhUT2VYWHJs?=
 =?utf-8?B?Sy82cWpqbU1pdjBseWRwNFZLQ2V4TEI5ZWVWblM3Q051aXFpd3owdlZ2WEx6?=
 =?utf-8?B?Z3NDMXM2dmlLMVhFUGQvZ2piaDYrNnpKdC9jZ001MVJzbVVOWXdhTlNtMzhH?=
 =?utf-8?B?dllBU3FRUEZ3NGp5Vjh6Qk9tU2FmTVY2aFlVbGg5ekw1dGJJcWJGS3BQM3pV?=
 =?utf-8?B?UDVYUktRb21PNVlGdmF4WForcFZ0NHIxcnNsNVJ6dnhGV2o3VnF4a1h2Wk1E?=
 =?utf-8?Q?jpcCgLMlyM/S95cg5P6KRsLvNPDtU4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 22:34:56.0313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5219ca82-bd43-4aab-fb65-08dd3febfd97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9316

On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Added missing definitions needed for NS8250 UART emulator.
> 
> Re-used newly introduced MSR definitions in the existing ns16550 driver.
> 
> Also, fixed indentation in a comment for FCR register.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/drivers/char/ns16550.c  |  6 ++--
>   xen/include/xen/8250-uart.h | 78 +++++++++++++++++++++++++++++++++------------
>   2 files changed, 60 insertions(+), 24 deletions(-)
> 

> diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> index d13352940c13c50bac17d4cdf2f3bf584380776a..6d1af31d582a3dd674a401d7f649e28c889cdc3e 100644
> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h

> @@ -51,12 +54,19 @@
>   #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
>   #define UART_IIR_MSI      0x00    /*  - MODEM status      */
>   #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> +#define UART_IIR_FE       0xC0    /* FIFO enabled (2 bits) */
>   
>   /* FIFO Control Register */
> -#define UART_FCR_ENABLE   0x01    /* enable FIFO          */
> -#define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
> -#define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> -#define UART_FCR_DMA      0x10    /* enter DMA mode       */

0x10 is bit 4...

> +#define UART_FCR_ENABLE     BIT(0, U)   /* enable FIFO          */
> +#define UART_FCR_CLRX       BIT(1, U)   /* clear Rx FIFO        */
> +#define UART_FCR_CLTX       BIT(2, U)   /* clear Tx FIFO        */
> +#define UART_FCR_DMA        BIT(3, U)   /* enter DMA mode       */

Now it's 0x08.  Is this a bug fix?  Looks like UART_FCR_DMA is unused.

Regards,
Jason

> +#define UART_FCR_RESERVED0  BIT(4, U)   /* reserved; always 0   */
> +#define UART_FCR_RESERVED1  BIT(5, U)   /* reserved; always 0   */
> +#define UART_FCR_RTB0       BIT(6, U)   /* receiver trigger bit #0 */
> +#define UART_FCR_RTB1       BIT(7, U)   /* receiver trigger bit #1 */
> +#define UART_FCR_TRG_MASK   (UART_FCR_RTB0 | UART_FCR_RTB1)
> +
>   #define UART_FCR_TRG1     0x00    /* Rx FIFO trig lev 1   */
>   #define UART_FCR_TRG4     0x40    /* Rx FIFO trig lev 4   */
>   #define UART_FCR_TRG8     0x80    /* Rx FIFO trig lev 8   */


