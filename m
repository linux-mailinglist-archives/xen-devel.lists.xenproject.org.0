Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57839779A5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 09:30:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798003.1208124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0jl-0005wu-PZ; Fri, 13 Sep 2024 07:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798003.1208124; Fri, 13 Sep 2024 07:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0jl-0005uR-MX; Fri, 13 Sep 2024 07:29:01 +0000
Received: by outflank-mailman (input) for mailman id 798003;
 Fri, 13 Sep 2024 07:29:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwZy=QL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sp0jk-0005uL-PE
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 07:29:00 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20629.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7502414-71a1-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 09:28:58 +0200 (CEST)
Received: from CH5PR05CA0010.namprd05.prod.outlook.com (2603:10b6:610:1f0::22)
 by CY5PR12MB6225.namprd12.prod.outlook.com (2603:10b6:930:23::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 07:28:53 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::86) by CH5PR05CA0010.outlook.office365.com
 (2603:10b6:610:1f0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Fri, 13 Sep 2024 07:28:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 07:28:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 02:28:52 -0500
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Sep 2024 02:28:51 -0500
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
X-Inumbo-ID: d7502414-71a1-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvWXupPewOeBJNpM6xCI/1NU0O3Lq1vqOWEkM7D5TcNydlIZWvXrWvU8mXC9ME1r5pEktwbL+22tOMyL/TAX+kknUSwmubo5dq8+uUbAHX/DQFkBaigoX6xXGkPqzlGPCzUc9YnwMLaLgFgKCZLSemxWptrvxeIZyM8Jf1jh8KWlnaazLG7E8J0XH9DszyYWnXKY7vFT4T1nYGVRuCOjNAduLh8b2ANqU+XMXEKNv2t8qwlyKNVI5Qs2DWagUVrhT6xZ9dw6jl54Dyy1oaFWbhm/Dn4bB/5BYMKqnSkxz4pAxhD8atSbRCBcPR/cLMkvpB3BzxBl71BLuPPun+3fSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTXHH1ir/t+Nht7gGRFT1ImLSvImThE6txZ9jRwFxcQ=;
 b=MDt0w5swV/DcD8xJwJh9e8I2GATEkwXdzv+0oy+3t5ObSolRMPZmA96WTCmXEM2st9hgDAdKJCyUkH/bafxFG63fI9CG9xtI0ZwgGo2Ao6tK9PBd5/WqHO9GlQj9s+TD+yhO/ZzZdERCBNYVinZO+tu/uV7bfpSXH3OQu6EMms1eeVBTIwb6OVf4dh9r2vzzWFBD9/wg9xa4/2nRC1GfrYzoJKEoXcpJqOUPqjAYJDDK5c9zOk0wpUMKwV0zmygOaTXvLIqpturASjBXb3rsRoaIdKWYVCviLeWtxnsoiealWYkzsgYivLhAUFAmg3TF/8pholgpbon7piRiwsRG/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTXHH1ir/t+Nht7gGRFT1ImLSvImThE6txZ9jRwFxcQ=;
 b=F+EtOSkcuxhQcd8Ya2XuW+eWGh7N1uunGfjTwjiAfGRERyed3p0hRF3KLoTlH9mLt1Wn4/dxxHUfutiyajjr/po8EeGG/L/2vQ7J01giOF1016z/kvZ1e/qIGF3mznvveXUXqEcPSIx8N7oqAhooaCXWGHK93dy1Etkc6vO2Rbo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7f0dcfb1-82d0-4649-a978-65aac4f292c7@amd.com>
Date: Fri, 13 Sep 2024 09:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: Drop deprecated early printk platform options
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20240913061529.213002-1-michal.orzel@amd.com>
 <3307FCC0-8268-4D7F-A988-F460552CB83C@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3307FCC0-8268-4D7F-A988-F460552CB83C@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CY5PR12MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b79b6a7-c3d2-4e37-04a9-08dcd3c5b7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0twRUxaNm5XUmNZem1pRFdtNy84S3RNbHMxRmhUVlc2OVJkVlRWRG0xcjN3?=
 =?utf-8?B?M0dBMWhRUm9sV2oxT3FXMHZrYTk4Zk13VzEzc0JCREhCT1lIQmNhQ25FdHp0?=
 =?utf-8?B?b2pWdERDVm1BTUg0Q0RJekMyQjVzWnVqRnRoQUR0NzRHQm1qWkM0Y2JRY0xK?=
 =?utf-8?B?dk1rMmhzR1ZmOEJUMUVaWE1xb05hcjlnNTZWSWViemVNWm1KTVlHKzJ5T0xr?=
 =?utf-8?B?ck1WM01QYUFaYS9aUkpSeTExN1FBbUtNbnZONktzMDRjblVjL3NheTE5Zyt4?=
 =?utf-8?B?eHpaNHF6V3lPc2YzaGxFbjVIdVczRWkvU1ZwWXZYcHBZamIvdkwyUmpVMUNl?=
 =?utf-8?B?K21lUWxWZ3FYRWo3bFJUUm81ZVRrNWh3SHk0WjFYYThYSU5ib1lPTDZjQnVZ?=
 =?utf-8?B?cmdhM1EzTDR1OFlFQXJhVUttb2pRWkJLb2JuS0xBTWU1SVFzeGN5UXk3TWlw?=
 =?utf-8?B?TFk3cHdYKzhTcmtBZGptaERZcTFERHF6dFh0S2pkRStsdGlDSkdwdnZuZVAv?=
 =?utf-8?B?SE1wVFNUc1NyeTdGSTVvRE1haHhtU0FSWHpVakx5Qm9yS3c0ak4wSjFWU0lv?=
 =?utf-8?B?YjE4WThRQllPeXlPL1JUbEtsNW5rNDk0SWNFTGtGcUNXazZFaEQxc2R1Y2t6?=
 =?utf-8?B?bkI3Y0N6YmtNcHZzREVxRWRlWUdCRHYweGxZbzhEOGYxak15QnIvMWVTM3I3?=
 =?utf-8?B?VExJb0dxZzlNTzlFQUtnT1BXdWg2eWR0UFZqRUZaWnF4aGgzYnBrZ3RSVkVw?=
 =?utf-8?B?MkU1eVRNSVkrL005QTM0YWVFMWF5Z014RFVPN0Z1VGZ0TlpjT25DU1dtOTZ4?=
 =?utf-8?B?a3FUbndOT0w1bStGVWo3dDg3K3JzSE9nbFdsWXgrSGtrQ3NIRDY5MDdsTGc5?=
 =?utf-8?B?VW40aG1WckRYWE9hbTdha09YTmZSUUJTb096TDAydmpCK0dSOU82RDd5emRQ?=
 =?utf-8?B?OG9oVFBKdW9wbW1wSlpiVk93S3UxSE9rTjliU1dOMU5IUFpZMzkwN2xvN3B3?=
 =?utf-8?B?SEZBWHlFcmlEb2d4OWZRQnJlTXJUeG5ZQTBqSy9IZ3RDRWlUZEV3cnBSbUJH?=
 =?utf-8?B?bEdHRVcxRnh0UWVVdGV6bjNCemhKZ3k1WkFMUndtRUlxVlBkUktTYmhFVnpa?=
 =?utf-8?B?YkZQTm1VTzA1UWF4Wlc5eDd0WXZrdlZpRmlqeithcjNLU0dtbW1ISVl4UlM3?=
 =?utf-8?B?Qk9lcWJTRXBLYXR2NzhYUzk2RkNSSldlT2NHeUo1Q2lSd2JVN24reVVYRUlP?=
 =?utf-8?B?VEhrU0MvRnpOMGttNWxoZUN1RTJVVE9sVTJ4OTBzeTArUFRoZkl1SjIvbm1X?=
 =?utf-8?B?YTJvMGtsYlV1aEYzZW1PL0prK1JaOFptQVNQanlKVllQUzBUdFR4d3QxNHRz?=
 =?utf-8?B?VzA5WTNLTTRuN2wwcDk3a0RUZVZ5b3NBeVRQZys5ZTh1WGR1TlR0a0V3RG9Q?=
 =?utf-8?B?R2tRN3YvVGpHa29yNFBRSFRpbTZYUmovTk5JTkNZNUtkdnFmQXExMjdZS2Rw?=
 =?utf-8?B?YXdiWVFKZjRMMHpvSnNpZ1RKc0ZoWHhCUktIVXBSb3N0WFZRRlBxSnk1MUhT?=
 =?utf-8?B?Ti9IRVlxN1l4Z2N6WFdlcHpqZEpOMlVBNko1VUlZaFVFUVQ2RnZVNzhxdE5n?=
 =?utf-8?B?bXZXazNFSmxkbTdtcnc0cVhsTDdDbDdzOUdzWEdjNVhna3NrWkgrRVJsUDlS?=
 =?utf-8?B?UitBQzQ5eVdycUdDemFNVGkyd2s1ZlBWL0FJRjVoMHpmVXNOeTBpVUMzbHp6?=
 =?utf-8?B?eng0TTlYMnZYZldhaXpYOFlJa1ZwY04zbnp0bmExbVJDMGwvSXM3aWIzK0lM?=
 =?utf-8?B?S1ptTGlRN1Q2ZmpqbWsyUC9zYS9qYTZaWTZZN0prbDlKZWxCQVA2Ly9zUXNr?=
 =?utf-8?Q?1xmNPNgNA5zMI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 07:28:52.7136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b79b6a7-c3d2-4e37-04a9-08dcd3c5b7f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6225

Hi Bertrand,

On 13/09/2024 08:54, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 13 Sep 2024, at 08:15, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> The predefined configurations for early printk have been deprecated for
>> a sufficient amount of time. Let's finally remove them.
>>
>> Note:
>> In order not to loose these predefined configurations, I wrote a wiki
>> page: https://wiki.xenproject.org/wiki/Xen_on_ARM_Early_Printk
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> docs/misc/arm/early-printk.txt |   4 -
>> xen/arch/arm/Kconfig.debug     | 155 ++-------------------------------
>> 2 files changed, 9 insertions(+), 150 deletions(-)
>>
>> diff --git a/docs/misc/arm/early-printk.txt b/docs/misc/arm/early-printk.txt
>> index bc2d65aa2ea3..e6b9124a38e3 100644
>> --- a/docs/misc/arm/early-printk.txt
>> +++ b/docs/misc/arm/early-printk.txt
>> @@ -35,8 +35,4 @@ Other options depends on the driver selected:
>>
>>   - For all other uarts there are no additional options.
>>
>> -As a convenience it is also possible to select from a list of
>> -predefined configurations available in the list of choice for "Early
>> -printk" for specific platform.
>> -
>> By default early printk is disabled.
>> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
>> index eec860e88e0b..2fa0acd2a3f1 100644
>> --- a/xen/arch/arm/Kconfig.debug
>> +++ b/xen/arch/arm/Kconfig.debug
>> @@ -13,177 +13,67 @@ choice
>> Choose one of the UART drivers for early printk, then you'll
>> have to specify the parameters, like the base address.
>>
>> - Deprecated: Alternatively, there are platform specific options
>> - which will have default values for the various parameters. But
>> - such option will soon be removed.
>> -
>> config EARLY_UART_CHOICE_8250
>> select EARLY_UART_8250
>> bool "Early printk via 8250 UART"
>> help
>> Say Y here if you wish the early printk to direct their
>> - output to a 8250 UART. You can use this option to
>> - provide the parameters for the 8250 UART rather than
>> - selecting one of the platform specific options below if
>> - you know the parameters for the port.
>> + output to a 8250 UART.
>>
>> - This option is preferred over the platform specific
>> - options; the platform specific options are deprecated
>> - and will soon be removed.
>> config EARLY_UART_CHOICE_CADENCE
>> select EARLY_UART_CADENCE
>> depends on ARM_64
>> bool "Early printk via Cadence UART"
>> help
>> Say Y here if you wish the early printk to direct their
>> - output to a Cadence UART. You can use this option to
>> - provide the parameters for the Cadence UART rather than
>> - selecting one of the platform specific options below if
>> - you know the parameters for the port.
>> + output to a Cadence UART.
>>
>> - This option is preferred over the platform specific
>> - options; the platform specific options are deprecated
>> - and will soon be removed.
>> config EARLY_UART_CHOICE_EXYNOS4210
>> select EARLY_UART_EXYNOS4210
>> depends on ARM_32
>> bool "Early printk via Exynos4210 UART"
>> help
>> Say Y here if you wish the early printk to direct their
>> - output to a Exynos 4210 UART. You can use this option to
>> - provide the parameters for the Exynos 4210 UART rather than
>> - selecting one of the platform specific options below if
>> - you know the parameters for the port.
>> + output to a Exynos 4210 UART.
>>
>> - This option is preferred over the platform specific
>> - options; the platform specific options are deprecated
>> - and will soon be removed.
>> config EARLY_UART_CHOICE_IMX_LPUART
>> select EARLY_UART_IMX_LPUART
>> depends on ARM_64
>> bool "Early printk via i.MX LPUART"
>> help
>> Say Y here if you wish the early printk to direct their
>> - output to a i.MX LPUART. You can use this option to
>> - provide the parameters for the i.MX LPUART rather than
>> - selecting one of the platform specific options below if
>> - you know the parameters for the port.
>> + output to a i.MX LPUART.
>> +
>> config EARLY_UART_CHOICE_MESON
>> select EARLY_UART_MESON
>> depends on ARM_64
>> bool "Early printk via MESON UART"
>> help
>> Say Y here if you wish the early printk to direct their
>> - output to a MESON UART. You can use this option to
>> - provide the parameters for the MESON UART rather than
>> - selecting one of the platform specific options below if
>> - you know the parameters for the port.
>> + output to a MESON UART.
>>
>> - This option is preferred over the platform specific
>> - options; the platform specific options are deprecated
>> - and will soon be removed.
>> config EARLY_UART_CHOICE_MVEBU
>> select EARLY_UART_MVEBU
>> depends on ARM_64
>> bool "Early printk via MVEBU UART"
>> help
>> Say Y here if you wish the early printk to direct their
>> - output to a MVEBU UART. You can use this option to
>> - provide the parameters for the MVEBU UART rather than
>> - selecting one of the platform specific options below if
>> - you know the parameters for the port.
>> + output to a MVEBU UART.
>>
>> - This option is preferred over the platform specific
>> - options; the platform specific options are deprecated
>> - and will soon be removed.
>> config EARLY_UART_CHOICE_PL011
>> select EARLY_UART_PL011
>> bool "Early printk via PL011 UART"
>> help
>> Say Y here if you wish the early printk to direct their
>> - output to a PL011 UART. You can use this option to
>> - provide the parameters for the PL011 UART rather than
>> - selecting one of the platform specific options below if
>> - you know the parameters for the port.
>> + output to a PL011 UART.
>>
>> - This option is preferred over the platform specific
>> - options; the platform specific options are deprecated
>> - and will soon be removed.
>> config EARLY_UART_CHOICE_SCIF
>> select EARLY_UART_SCIF
>> bool "Early printk via SCIF UART"
>> help
>> Say Y here if you wish the early printk to direct their
>> - output to a SCIF UART. You can use this option to
>> - provide the parameters for the SCIF UART rather than
>> - selecting one of the platform specific options below if
>> - you know the parameters for the port.
>> + output to a SCIF UART.
>>
>> - This option is preferred over the platform specific
>> - options; the platform specific options are deprecated
>> - and will soon be removed.
>> -
>> - config EARLY_PRINTK_BRCM
>> - bool "Early printk with 8250 on Broadcom 7445D0 boards with A15 processors"
>> - select EARLY_UART_8250
>> - config EARLY_PRINTK_DRA7
>> - bool "Early printk with 8250 on DRA7 platform"
>> - select EARLY_UART_8250
>> - config EARLY_PRINTK_EXYNOS5250
>> - bool "Early printk with the second UART on Exynos5250"
>> - select EARLY_UART_EXYNOS4210
>> - depends on ARM_32
>> - config EARLY_PRINTK_FASTMODEL
>> - bool "Early printk with pl011 on ARM Fastmodel software emulators"
>> - select EARLY_UART_PL011
>> - config EARLY_PRINTK_HIKEY960
>> - bool "Early printk with pl011 with Hikey 960"
>> - select EARLY_UART_PL011
>> - config EARLY_PRINTK_JUNO
>> - bool "Early printk with pl011 on Juno platform"
>> - select EARLY_UART_PL011
>> - config EARLY_PRINTK_LAGER
>> - bool "Early printk with SCIF0 on Renesas Lager board (R-Car H2 processor)"
>> - select EARLY_UART_SCIF
>> - config EARLY_PRINTK_MIDWAY
>> - bool "Early printk with pl011 on Calxeda Midway processors"
>> - select EARLY_UART_PL011
>> - config EARLY_PRINTK_MVEBU
>> - bool "Early printk with MVEBU for Marvell Armada 3700 SoCs"
>> - select EARLY_UART_MVEBU
>> - depends on ARM_64
>> - config EARLY_PRINTK_OMAP5432
>> - bool "Early printk with UART3 on TI OMAP5432 processors"
>> - select EARLY_UART_8250
>> - config EARLY_PRINTK_RCAR3
>> - bool "Early printk with SCIF2 on Renesas R-Car Gen3 processors"
>> - select EARLY_UART_SCIF
>> - config EARLY_PRINTK_SEATTLE
>> - bool "Early printk with pl011 for AMD Seattle processor"
>> - select EARLY_UART_PL011
>> - config EARLY_PRINTK_SUN6I
>> - bool "Early printk with 8250 on Allwinner A31 processors"
>> - select EARLY_UART_8250
>> - config EARLY_PRINTK_SUN7I
>> - bool "Early printk with 8250 on Allwinner A20 processors"
>> - select EARLY_UART_8250
>> - config EARLY_PRINTK_THUNDERX
>> - bool "Early printk with pl011 for Cavium ThunderX processor"
>> - select EARLY_UART_PL011
>> - depends on ARM_64
>> - config EARLY_PRINTK_VEXPRESS
>> - bool "Early printk with pl011 for versatile express"
>> - select EARLY_UART_PL011
>> - config EARLY_PRINTK_XGENE_MCDIVITT
>> - bool "Early printk with 820 on Xgene mcdivitt platform"
>> - select EARLY_UART_8250
>> - config EARLY_PRINTK_XGENE_STORM
>> - bool "Early printk with 820 on Xgene storm platform"
>> - select EARLY_UART_8250
>> - config EARLY_PRINTK_ZYNQMP
>> - bool "Early printk with Cadence UART for Xilinx ZynqMP SoCs"
>> - select EARLY_UART_CADENCE
>> - depends on ARM_64
>> endchoice
>>
>>
>> @@ -219,25 +109,6 @@ config EARLY_UART_BASE_ADDRESS
>> depends on EARLY_PRINTK
>> hex "Early printk, physical base address of debug UART"
>> range 0x0 0xffffffff if ARM_32
>> - default 0xF040AB00 if EARLY_PRINTK_BRCM
>> - default 0x4806A000 if EARLY_PRINTK_DRA7
>> - default 0x1c090000 if EARLY_PRINTK_FASTMODEL
>> - default 0x12c20000 if EARLY_PRINTK_EXYNOS5250
>> - default 0xfff32000 if EARLY_PRINTK_HIKEY960
>> - default 0x7ff80000 if EARLY_PRINTK_JUNO
>> - default 0xe6e60000 if EARLY_PRINTK_LAGER
>> - default 0xfff36000 if EARLY_PRINTK_MIDWAY
>> - default 0xd0012000 if EARLY_PRINTK_MVEBU
>> - default 0x48020000 if EARLY_PRINTK_OMAP5432
>> - default 0xe6e88000 if EARLY_PRINTK_RCAR3
>> - default 0xe1010000 if EARLY_PRINTK_SEATTLE
>> - default 0x01c28000 if EARLY_PRINTK_SUN6I
>> - default 0x01c28000 if EARLY_PRINTK_SUN7I
>> - default 0x87e024000000 if EARLY_PRINTK_THUNDERX
>> - default 0x1c090000 if EARLY_PRINTK_VEXPRESS
>> - default 0x1c021000 if EARLY_PRINTK_XGENE_MCDIVITT
>> - default 0x1c020000 if EARLY_PRINTK_XGENE_STORM
>> - default 0xff000000 if EARLY_PRINTK_ZYNQMP
> 
> Shouldn't we put a default 0 value here ?
No, we should not. It's done like that on purpose to trigger build error
if user enables early printk but forgets to specify an address. Adding default 0
would remove this guard behavior.

> 
>>
>> config EARLY_UART_PL011_BAUD_RATE
>> depends on EARLY_UART_PL011
>> @@ -250,7 +121,6 @@ config EARLY_UART_PL011_BAUD_RATE
>> not try to initialize the UART, so that bootloader or firmware
>> settings can be used for maximum compatibility.
>>
>> - default 115200 if EARLY_PRINTK_FASTMODEL
>> default 0
>>
>> config EARLY_UART_PL011_MMIO32
>> @@ -274,13 +144,6 @@ config EARLY_UART_8250_REG_SHIFT
>>
>> Default to 0.
>>
>> - default 2 if EARLY_PRINTK_BRCM
>> - default 2 if EARLY_PRINTK_DRA7
>> - default 2 if EARLY_PRINTK_OMAP5432
>> - default 2 if EARLY_PRINTK_SUN6I
>> - default 2 if EARLY_PRINTK_SUN7I
>> - default 2 if EARLY_PRINTK_XGENE_MCDIVITT
>> - default 2 if EARLY_PRINTK_XGENE_STORM
>> default 0
> 
> Seeing that all know example are setting this to 2, wouldn't it
> make sense to change the default to 2 ?
It would be a change in behavior and would not fit the purpose of this patch.
Also, the EARLY_UART_8250_REG_SHIFT Kconfig help mentions 0 as a default.
There might be platforms 8250 based where we don't know the correct reg shift value.
Better not to make any assumptions.

~Michal

