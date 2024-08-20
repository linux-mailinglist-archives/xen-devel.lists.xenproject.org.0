Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C4958194
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 11:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780220.1189846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKja-0006qG-Nb; Tue, 20 Aug 2024 09:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780220.1189846; Tue, 20 Aug 2024 09:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKja-0006oP-KL; Tue, 20 Aug 2024 09:00:58 +0000
Received: by outflank-mailman (input) for mailman id 780220;
 Tue, 20 Aug 2024 09:00:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+i8=PT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sgKjY-0006oJ-Bb
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 09:00:56 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2409::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b49e1e27-5ed2-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 11:00:54 +0200 (CEST)
Received: from PH8PR07CA0005.namprd07.prod.outlook.com (2603:10b6:510:2cd::29)
 by LV8PR12MB9418.namprd12.prod.outlook.com (2603:10b6:408:202::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.26; Tue, 20 Aug
 2024 09:00:47 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::9e) by PH8PR07CA0005.outlook.office365.com
 (2603:10b6:510:2cd::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Tue, 20 Aug 2024 09:00:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 09:00:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 04:00:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 04:00:46 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 20 Aug 2024 04:00:45 -0500
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
X-Inumbo-ID: b49e1e27-5ed2-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfDqjrU8tf1waTNY6BGRZ2d8N22ML8xm2X312as5MkodEnyQLsCtrZUvgv/Y2VHxDq+I3BVYc6mBTn8Rbd8Jhbpod2RQniz9KJo/aPRGLJKGtEh+GWL62M7VDyvl98LX2NWhZgs5xRD6u3f2SRrTmIkqTslNUwCK8bvR3Fzlpmj+HBGrHltrLcfJuoXZHqxOCHoXKqZYB6fFUPbiZ1SvxdVEfAx6T2qhClS+/eUdCrIiJOTwBMD3hvm2kDcZJX3as0Wq5bq7dj7lI2c11q7TSpjF36poWQ5YXLeiA1h7AkwjUPVKScBfesuAShQFnLdEiasyHo/QlkV+eiqgeaV8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hq7eMJacCeYJc2bLXgAFyeAFQUs91jOB/O9Z75cf2I4=;
 b=wWyJZfjZa0BvsC3CutSBtZhtMk34Zi7xRfANCZ5hNJPKrtsE7cvZ7YJa0yQIUYFpiVjyHYG4JM+vI0qVFwdbEC69fn++3OWzPBMZeK5GWSpG7FIxpNkfbb4Fx+78wDhfGxKuVHMkcFd9dExTHEFOv3g2MM86t79PVholK0A1RCA777zxTzR2S2WF79EDoqmYHV/QIG5sVhtBuUfxy3QLl1cV7pRxbmJ01CQg/1j0iVW0vFY4dGu4xWnnDUC9PR5Eql8Bs3tJl5viQqRf5lKffor0eybMqOWy3Qn/ZYaZfRpTV/9zWCci5PqQ1uaU6waqSkArA0wMmKqnd50ggG/b5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ti.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hq7eMJacCeYJc2bLXgAFyeAFQUs91jOB/O9Z75cf2I4=;
 b=o+psJGr0HkNzI3lucsFn4UVUd/ikIzAiwRzM7MFfEfHmCDQJEMV8cctaGpLNK178BkDK3BtmZK6RI9isO6NBoBaKvtgTPi19oo8hbdyQe8L8r4+5Wg+YVXFj5RPQ6rt1iQxM6U69RxMQnS3dhPgi4rO04a5E6TbUVTq9cbmiOik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a75c4202-1d66-45d0-be57-f29cacb6237c@amd.com>
Date: Tue, 20 Aug 2024 11:00:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: char: omap-uart: provide a default clock
 frequency
To: Amneesh Singh <a-singh21@ti.com>, <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <sstabellini@kernel.org>
References: <20240820082202.326644-1-a-singh21@ti.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240820082202.326644-1-a-singh21@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|LV8PR12MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 34779b93-d5bf-4298-0987-08dcc0f694f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVNxempXeUdhMEVYekVMMzRrSTRtbEpXK0FyYzBybFdoZG9PaXJpWGtMdjRI?=
 =?utf-8?B?aGdCT0JtNHlDSXRaVVdHTzVUOFpTSWtnZGZKOFU1ZDJzSWNVelBVUXcyOEJ4?=
 =?utf-8?B?VjVLckhCb1dHLzNSOWU5TDFCUkJpQmx0YlNGRXZWeWlPK094TU5uQ3U1Zm5F?=
 =?utf-8?B?TThHS2t6b2ZoK2tPZHQ5WVJsRFk5bGdLWEZadGVBUW5jTVlCMXBpcytXcDk1?=
 =?utf-8?B?ODlubWpmRUxtQ09pc2czdnk3UDhWSnJnY0cxOXh0T3dlVWo2eFVrbzRQZkdk?=
 =?utf-8?B?RjVweUFQNVZ6L2QrZktwV2EzaS8yek1pbk5EdEJTTjdsMVZwRC9KVVdVWUZY?=
 =?utf-8?B?WFRXS0x1TmpaL1dNcnJVMVdOendZLzJoYnVvTTVuaVZJdTlseTJFcGszOWJu?=
 =?utf-8?B?TGxVWGgvTUszcUFKQ0U1WkVpc0RETm5vTy9ZMkF1OU9lQjM1bTQ5S3plbDF1?=
 =?utf-8?B?ZHdzUmk1MHNGV2EyYVdINlBVNnRuQXdhT3FCaTI2NmdXMlgydW1XVGtOeGdX?=
 =?utf-8?B?aDVBbnRQZFpoa0VHVlJBeTQyTUYvckpJeG9KSGZXSStORWFHM1ZKV3dzQklW?=
 =?utf-8?B?TDhZWnlqMHl3eUc1ZGt3QXdLMzlsL003VWNMcjBNTnZuL0hBWTBpQmhCNStY?=
 =?utf-8?B?SDAySU5IdmErYmtaZmhEMVNDQXdZTEtlVmJqYjJiWGREUE90bVkxMUJhcUs2?=
 =?utf-8?B?Nm5qOUxCb2FZWDlQdG8vMkpxOVNaOHRqbWtvMWlFdGZOSzhYVHR5ZUk2TDhQ?=
 =?utf-8?B?cVlmeWRoNC90RUhObGc2dUhuQkJLeE1wS0c4UmhpY09USTJkdkNHdk1wZVFO?=
 =?utf-8?B?VkQ5Z2pEcGlCcW9VaDA5OFBGNlB1L0pwaWlnVTVlVjM2Qk81anFtREJOR0E4?=
 =?utf-8?B?MUZXMGpnMFlBREJQbXFQOFhnOVVpSVViSmpFTmtsTHFvbmVSZTBvMTJ1bDRo?=
 =?utf-8?B?REVncUluRC82MFh0aHhtaFpMbkNETkh6VUpSNTU2VHNVTEJ1S2JKNDRmYTBB?=
 =?utf-8?B?MS90RGdKTnFOVjd5cTVyaGZ1YU5Ed2JKbHlwaUJ3OXpISXphU2ExL0pIK0ky?=
 =?utf-8?B?VDdMK2NEV3lXRDdudWFWYXh6WW1vNW1icElZVmhMSFFxOU1YWWJob0dpbUF2?=
 =?utf-8?B?b3lwK1JkQmNyOXl4THRQODFJbEZNYVZBM1ZXT041YzdUN1BSQlJKZmRwSnlj?=
 =?utf-8?B?VFEzcmgrei9JbE05MVBzZEwybjZmbEQ5bFg4ZysyS1RFQXdXbXN1LzlqeU5u?=
 =?utf-8?B?dC9pQ2p4OVMvVkNMaTlDQXg5bkF6M2x3OTZWbVQyZCtPR2E3akNkM21OZzY4?=
 =?utf-8?B?ZE1FaEkxczFhMUQ1SGE5T0h6b0djRk9FNlE3Qnh5UFRTeGpISlo2TkFhU2NZ?=
 =?utf-8?B?d0IwQnVzVXJQMnBMMkxYcVlqa2JBdzJESnZMb2FsSGlINm1wMDh3amZidmJP?=
 =?utf-8?B?b0wybjJjYmI4c2Z4RlRRWUM0ZXFYU0llSEtKZ2ozaWxXNGRsUnAvekZvTVp3?=
 =?utf-8?B?cld4OEZMcVg3T3JqeXR3dHl3T0lPNzNJbFRTMkswSm9hanBoVGxQSlNGZXYz?=
 =?utf-8?B?WHhlTmNxUURWLzloZ3pkVUQ1TDlrbDBzMnFNSW0rT2hjemdVYWFla2srYVcr?=
 =?utf-8?B?QVZCOHkveTZrWE9ST0xkdWVpY3AwRXNFdWc1UXpEN0g2Tm5wWkpxVFJmTnF5?=
 =?utf-8?B?Y21PV1BZME9EbHFDWnlPZDJvaUF2SXhwQUZ3U0JyQ2VKdy9rNnY4L1AycEcr?=
 =?utf-8?B?VWtJeUhIOVNkS2pRa2x4bkFzS2JQbi9PZFY0NnFsMFN3MFZPRFlYY3VzSUQw?=
 =?utf-8?B?U1VJQ0tzb0VTaHlLNWlKUHRXTHY0UU01dGJMb2xLcEpTNGZmNG5uY1ZzQVpo?=
 =?utf-8?B?R3Y4cnQ0WlB1R2lTYXNwdlpDSmRDTDlYdkNVRGJWOWZDN2RyOGlvTzh2akRZ?=
 =?utf-8?Q?O+eD9SmUy9VJgFzRJyKBJsU4n8TmZj1A?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 09:00:47.2823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34779b93-d5bf-4298-0987-08dcc0f694f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9418



On 20/08/2024 10:22, Amneesh Singh wrote:
> 
> 
> Quite a few TI K3 devices do not have clock-frequency specified in their
> respective UART nodes. However hard-coding the frequency is not a
> solution as the function clock input can differ between SoCs. So, use a
> default frequency of 48MHz if the device tree does not specify one.
I'd mention that this is same as Linux

> 
> Signed-off-by: Amneesh Singh <a-singh21@ti.com>
> ---
>  xen/drivers/char/omap-uart.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> ---
> v1: https://lore.kernel.org/all/20240719113313.145587-1-a-singh21@ti.com/T/
> 
> v1 -> v2
> - Ditch adding a dtuart option
> - Use a default value instead
> 
> This default is the same one as found in the 8250_omap driver of the
> linux tree. Already tested with Xen.
> 
> diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
> index 1079198..9d3d39c 100644
> --- a/xen/drivers/char/omap-uart.c
> +++ b/xen/drivers/char/omap-uart.c
> @@ -48,6 +48,9 @@
>  /* System configuration register */
>  #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is enabled */
> 
> +/* default clock frequency in hz */
> +#define UART_OMAP_DEFAULT_CLK_SPEED 48000000
I think this should have U suffix to please MISRA 7.2

> +
>  #define omap_read(uart, off)       readl((uart)->regs + ((off) << REG_SHIFT))
>  #define omap_write(uart, off, val) writel(val, \
>                                            (uart)->regs + ((off) << REG_SHIFT))
> @@ -322,8 +325,9 @@ static int __init omap_uart_init(struct dt_device_node *dev,
>      res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
>      if ( !res )
>      {
> -        printk("omap-uart: Unable to retrieve the clock frequency\n");
> -        return -EINVAL;
> +        printk("omap-uart: Unable to retrieve the clock frequency, "
> +               "defaulting to %uHz\n", UART_OMAP_DEFAULT_CLK_SPEED);
Even though there is a comma, printk messages should not really be split. In such cases it's fine
to exceed 80 chars limit. Or do:
        printk("omap-uart: Clock frequency not specified, defaulting to %uHz\n",
               UART_OMAP_DEFAULT_CLK_SPEED);

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

