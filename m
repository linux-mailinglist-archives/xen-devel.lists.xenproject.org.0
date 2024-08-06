Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D2948AA8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 09:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772546.1182995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbF0O-0004uf-4I; Tue, 06 Aug 2024 07:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772546.1182995; Tue, 06 Aug 2024 07:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbF0O-0004rq-18; Tue, 06 Aug 2024 07:53:16 +0000
Received: by outflank-mailman (input) for mailman id 772546;
 Tue, 06 Aug 2024 07:53:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT90=PF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sbF0M-0004rk-G5
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 07:53:14 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2407::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed6f23d1-53c8-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 09:53:11 +0200 (CEST)
Received: from BY3PR04CA0015.namprd04.prod.outlook.com (2603:10b6:a03:217::20)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 07:53:07 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::76) by BY3PR04CA0015.outlook.office365.com
 (2603:10b6:a03:217::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Tue, 6 Aug 2024 07:53:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 07:53:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 02:53:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 02:53:05 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 Aug 2024 02:53:04 -0500
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
X-Inumbo-ID: ed6f23d1-53c8-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAW0Wojw0amHvCnlIs/t2lWx+I3L1Me6PkhNxWsEga4Salpls1mbCh9LLU0NH3t8OkFaqhQTp7ocMMd43SBAHySRUspoiFPf1Esv9Ag0Bg4z6lgYb1MCgQvrZweSDElnugVIVrrMQ+Dzx0LI2qwC7dyOcpAyIbqC7klRLe9iNpxIQHSFJ83GJ8WNN2cZT5n55nQiOOEODlmpeOYtybBdolfNnmt3yVpi2VpNCzDNU41cFxoJ5lTi26z3WILy2wvzNxaV6czQbo63YxJTOBgNhzbTdPdobdQuprMBlegcPRlMhnHNbh4rAU8HcmGjOaA+8zR2iUKwCy6ttUUIRiKW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoWegJJ4Ymx+vaz/2bMq0zzTdvUXMeTrlvOUuMU4GRs=;
 b=OicCNPd3GzlHVPWGhlUU5CNXsVzme4yAH6f7273im/8vYjKCkPeZ96S+PHO7lMnPW5GPW0J3pqVNW3LshoJMde029zdeFjRtsyI+3psrlkpMws1a+o8+EGMObkldP2e0NL/Lqw7sTWXOK+klrPRyNJTTW5opy7y/Ez12zNyJNRKg1NGVwejn4pMCyvgY46QDQm1ycZ5/N5AF5O0TBX9efwdBLiLHdy4w/zfwymDkbzboukRhJ52IR3jbo5bUsIwSOTlMI5D0HpmCDIBsG0iFgGFfNHAzx3Oj505+Cm6PVntIaMdoDthfeQsARv13w1tjULdJW5MvuyfSbzFWpsCitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ti.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoWegJJ4Ymx+vaz/2bMq0zzTdvUXMeTrlvOUuMU4GRs=;
 b=1KeGgj0YXGmSoR4O0banjuQhuA77G6/9LNvJsvz1+eQY2H3OBD2/a7aP/xlSwmgASxqGLCM28hbDtmKS8IfadFfz+k1SPnFPs3IuIAlwptc6+zq3x9Vk06QuUkSquiC2hGWyoJaHg0wjzIZ9l0m6PbipMXw/njCQwTjNGZqDX24=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com>
Date: Tue, 6 Aug 2024 09:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: char: omap-uart: add "clock-hz" option
To: Amneesh Singh <a-singh21@ti.com>, <xen-devel@lists.xenproject.org>
References: <20240719113313.145587-1-a-singh21@ti.com>
Content-Language: en-US
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240719113313.145587-1-a-singh21@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: b28d6f26-5784-4700-06f5-08dcb5eccf0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWJPejNkdlNka2VDcGt1dTExVExsSlhsaVNIalhmVUxLbWtFcGlYWkFTVmNx?=
 =?utf-8?B?aFNRZnZ1WWVrWHB0andUV24ySE5WbUVmZ2hmaStzWGVnOFBFbklzSjQ4NFZv?=
 =?utf-8?B?a1p3U3RjRGN2dXRpcnVrWDE5RWovMis2QWZxSlU2MkY2T2xZbk44YXZ2NHpT?=
 =?utf-8?B?OWx5M3JJeHZwRlpKcllPRmNVRTdqYnhwZUVvRk5YRU5Qc1ZlUldrU1dROVFq?=
 =?utf-8?B?ZXNLdHFZM1JQTitneWY3UUVQRFhGdklpTVVYb2hGUXNtMU1RK2kvb1ZTQzQ0?=
 =?utf-8?B?UWZnREFtcTMwWjU2U2psMVRWUUdRR3J1TmFCdzZXd3hIQkh2NktnV2ppZDY4?=
 =?utf-8?B?cUY1MEZzVllYTlRnOGdXQ3ErTnlnaktqakdIcHhJL3l1VkRKYUJna0lCYWxB?=
 =?utf-8?B?SmVpR0ZYVG9sTGVNVmxKVVJiNWRBeVoxZHFJcHZkWEVXYkhyUTdCZENWYXN4?=
 =?utf-8?B?Zk5jTzFya1RDNXFFYStyWktSVk4vc215RElVaWYzZnpjelNKTExJNkFCeTg5?=
 =?utf-8?B?MUE4Tnh6eE5yZTBnZkdTZmxTc24vQ2JaN3FjeXBYeVl6Z1JaYlZpNHVqTDdF?=
 =?utf-8?B?Q0VRVFpSNEZPaVlQY1dndURwa3NqL2dIWkZIMWlZWkVYYXhEZVVSUXZJSGRM?=
 =?utf-8?B?REhlVUNkQmg1dlNtQ2Y0bEZsbEIwOFVOYy9rN3FKdXpYZWp3Z2QxS0pGNEdy?=
 =?utf-8?B?Z3pWaFNUVis1ekdxajRaeHhXelBybFpoelBtcUw0OXRXbkJQZTFDS2tQVWxJ?=
 =?utf-8?B?SkhsQ2k2a1JQcG9YZCtsMWdicFZ1Q2J3VTEveFFTZzJha2hpaGZRdGZPZml0?=
 =?utf-8?B?MjQrckk5b2pUN01yT3hCNThpRGhKdkNIQjNNQSs4Nmh2NVBxS08rbUxPVisz?=
 =?utf-8?B?ZFkveEZZRG94SVNaV05JS1hTOTRtaCtFdngzT0Y4YWpSOGljeTluTExKZXhn?=
 =?utf-8?B?SFdiQm5vdVoxMnlhc2U3RTNweHdjNlVhMndOUEJhaWhoc0JQTk54WVJvblB5?=
 =?utf-8?B?ZGFtL2M3N3k5RzVWSFc2eVowRVR1M0VvSE1rS010K0hyRWNTVXQzMHhRYmJG?=
 =?utf-8?B?Y3E4YTdIdEVkUjh5aVRpd2h1ZG1VbDdKQU1KZ09nRTBRcFNaVU1yZHZoWFhK?=
 =?utf-8?B?ZWN4Z2p4M2kwNFk1ak55Um1tNTBpdFNlL3VISDJ4WEtWVlVnazZSMWZUM2tJ?=
 =?utf-8?B?SjcvS2NqSFdTemtMenZIUG4wN3I3YTAwTXo0SE15dGtERHFhcVJKV0Q4VVRJ?=
 =?utf-8?B?WEt4bVJNWFp0QVRhaDRSSzZ3dW84bUdOQnlGRmtBS3ZXSmY3MkFQb2thRUdF?=
 =?utf-8?B?NFdEV3hqSHJ3U1Nzd3plMFVjQkpmdm83MHNwT0FwbkRRQzh6V096V2FsTDVW?=
 =?utf-8?B?WG04RHZtUk9rNTcxOGo5emVIMDJKWU5JejNkVWNlZHc4cUdKS0dpTm5VS1Ex?=
 =?utf-8?B?dVl4UlpUNXVDWmY3QUlFU3VUa0srZWRoVklaMVE0OWMwUSt2QmFVV2lON1hr?=
 =?utf-8?B?QnFVYi9EU0JmdzkycFBUNzZiS1I3R2l1M0x2K1VNYllXcGpJMXptNE9tTmEv?=
 =?utf-8?B?ZjRZMUgrUGdYLzRvVi9BNWgxamN1RFF5aDA2ampDaDNnUFZyVHJDSUVHK08w?=
 =?utf-8?B?K1IySXlUY1M2UkF2OExhNnZvdXdBcHh6RWZMaFVkUTJ5K1BzOWFkL3NUcUt2?=
 =?utf-8?B?TUl2WnVTOUJrZGNaT095dzNQV0hweFl5THJpWUw3NGkwM3dYeFpTejhma3hC?=
 =?utf-8?B?NFhONlhSM0tJdHVqUWl6QkgvcFhFS0dNaXRuN1crUlQydWxyT1NMZCtwcWtK?=
 =?utf-8?B?RndiQktLZmFuN0pQWCs4SzRLZWdXaEFyanR3aXNLYjlISG13Um90VC8wNm52?=
 =?utf-8?B?R3BaTlcveEhjdkkvaWFGU2tJY05uRExOamd2S1hlM1ZqdStkV2V5c1NXaXdH?=
 =?utf-8?Q?b4BkD6BdtjjQP9jExXFQIMm5MnPLvWUc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:53:06.8408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b28d6f26-5784-4700-06f5-08dcb5eccf0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312

Hi,

You sent this patch to xen-devel but forgot to CC maintainers. For the future, please use scripts/add_maintainers.pl.
CCing them now.

On 19/07/2024 13:33, Amneesh Singh wrote:
> 
> 
> Quite a few TI K3 devices do not have clock-frequency specified in their
> respective UART nodes. However hard-coding the frequency is not a
Is this property is required? If so, I'd mention that this is to overcome an incorrect device tree.

> solution as the function clock input can differ between SoCs. So,
> similar to com1/com2, let the user pass the frequency as a dtuart option
> via the bootargs. If not specified it will fallback to the same DT
> parsing as before. For example, dtuart=serial2:clock-hz=48000000 can be
> a valid bootarg.
> 
> Signed-off-by: Amneesh Singh <a-singh21@ti.com>
> ---
>  xen/drivers/char/omap-uart.c | 62 +++++++++++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
> index 1079198..660c486 100644
> --- a/xen/drivers/char/omap-uart.c
> +++ b/xen/drivers/char/omap-uart.c
> @@ -305,33 +305,71 @@ static struct uart_driver __read_mostly omap_uart_driver = {
>      .vuart_info = omap_vuart_info,
>  };
> 
> +static void __init omap_uart_parse_config(struct omap_uart *uart,
> +                                         const char *config) {
Braces should be placed on their own lines. Refer CODING_STYLE.

> +
> +    char options[256];
256 is a max size of full dtuart string. Since we only parse for clock-hz, do we need the same size here?
Could we say e.g. 64 and extend it in the future if new options will be added?

> +    char *value, *start = options;
Scope of value could be limited to the while loop

> +
> +    if ( !strcmp(config, "") )
> +        return;
> +
> +    strlcpy(options, config, ARRAY_SIZE(options));
> +
> +    while (start != NULL)
White spaces missing. Refer CODING_STYLE.

> +    {
> +        char *name;
> +
> +        /* Parse next name-value pair. */
> +        value = strsep(&start, ",");
> +        name = strsep(&value, "=");
Can name be NULL here? This would want checking for the below strcmp.

> +
> +        if ( !strcmp(name, "clock-hz") )
> +            uart->clock_hz = simple_strtoul(value, NULL, 0);
> +        else
> +            printk("WARNING: UART configuration option %s is not supported\n",
> +                   name);
> +
> +    }
> +}
> +
>  static int __init omap_uart_init(struct dt_device_node *dev,
>                                   const void *data)
>  {
>      const char *config = data;
>      struct omap_uart *uart;
> -    u32 clkspec;
>      int res;
>      paddr_t addr, size;
> 
> -    if ( strcmp(config, "") )
> -        printk("WARNING: UART configuration is not supported\n");
> -
>      uart = &omap_com;
> 
> -    res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
> -    if ( !res )
> -    {
> -        printk("omap-uart: Unable to retrieve the clock frequency\n");
> -        return -EINVAL;
> -    }
> -
> -    uart->clock_hz = clkspec;
> +    /* Default configuration. */
> +    uart->clock_hz = 0;
>      uart->baud = 115200;
>      uart->data_bits = 8;
>      uart->parity = UART_PARITY_NONE;
>      uart->stop_bits = 1;
> 
> +    /*
> +     * Parse dtuart options.
> +     * Valid options:
> +     *   - clock-hz
> +     */
> +    omap_uart_parse_config(uart, config);
> +
> +    /* If clock-hz is missing. */
Apart from missing, clock_hz can be 0 also if user specifies 0

> +    if ( uart->clock_hz == 0 )
> +    {
> +        u32 clkspec;
We are moving away from Linux derived types so please take the occasion to use uint32_t here.
Also, there should be a blank line between definitions/code.

> +        res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
> +        if ( !res )
> +        {
> +            printk("omap-uart: Unable to retrieve the clock frequency\n");
> +            return -EINVAL;
> +        }
> +        uart->clock_hz = clkspec;
> +    }
> +
>      res = dt_device_get_paddr(dev, 0, &addr, &size);
>      if ( res )
>      {
> --
> 2.34.1
> 
> 

~Michal

