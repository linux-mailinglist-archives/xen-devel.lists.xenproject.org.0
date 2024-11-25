Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF459D8FB7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 02:17:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843236.1258877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFkC3-0006Fk-0Y; Tue, 26 Nov 2024 01:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843236.1258877; Tue, 26 Nov 2024 01:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFkC2-0006DY-Tg; Tue, 26 Nov 2024 01:16:42 +0000
Received: by outflank-mailman (input) for mailman id 843236;
 Tue, 26 Nov 2024 01:16:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFkC1-0006DR-Jk
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 01:16:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1222ae79-ab94-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 02:16:33 +0100 (CET)
Received: from DS7P220CA0070.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::33) by
 DS7PR12MB6360.namprd12.prod.outlook.com (2603:10b6:8:93::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.21; Tue, 26 Nov 2024 01:16:28 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:8:224:cafe::90) by DS7P220CA0070.outlook.office365.com
 (2603:10b6:8:224::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.19 via Frontend Transport; Tue,
 26 Nov 2024 01:16:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 01:16:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:16:23 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:16:20 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 19:16:19 -0600
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
X-Inumbo-ID: 1222ae79-ab94-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwOTo6NjAwIiwiaGVsbyI6Ik5BTTEwLUJONy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjEyMjJhZTc5LWFiOTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTgzNzkzLjIyOTc1Nywic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gumWYY/nDHKdn+bGawRqxUo/qh3dOui48v58XGHxmHrPw9GPepV3rkhdGaxddF/8wEYy7hEnCJiIhINkHQ7IgtMRY4U0pUTGPzwx4PGWu0g2HYdIs/j+csoEiRgJapa86na59b+fMykoMnTEcW8tOaPwqvBn4JeGU+Sk7CbkvuaotPIYOYqgMWKSlLn/S899TNRTi105zFrfBQUCU69yYopNe/zN/BupXM0PAxv+bmhzogPwTRI7WWaByWoqPLKHwIdbMXnCgNo0tJVD2zR5XoOmoNIw2vSk/eT3hUZ4dUuuEWg4zFFoMIMNblt3LJAoH308z2ZRkBERb5DawR4Szw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXvWFCpTil9BzfuAWj8uUkenC1NqcphInLmX4WubRhw=;
 b=QxHufHxwGitlrkGsoNjqeziFgZoMl+rOd8nOktqtDwXr3+ptEzor1SfyqKSqjaqAkExl/3hssAOkUX/L57oHcGKiKtTBa26H5fytpTVp0bXZVHeJdoi1JMlnigFNVKtB4QvrOw84Gn7wtnO+V/WXivWaEiZYsM/8/mUKPTYqUww8gU6OWQkx/p7fFIyG4to+erQ3Gs/YJhtt3kbUvyvfnrq3fwWLskR4KL9vCUjgO2JKPiZJPB1iJWaa47NEtF+waXXuTlc+M8rCvPvGvtqA4oaFXVJ7sL67+QnsMXc5l4q7dYetn6hybsUicpi/CJi5Zhf9sb2kS+tXDLwveNP38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXvWFCpTil9BzfuAWj8uUkenC1NqcphInLmX4WubRhw=;
 b=u9/5S4lu+r4cclXl4t48daUVAstBYu67Cl+2F1bnuAeBgN+roklo2epjzS/r/TYdtRJT7RJCAqgS5jl96XH45/8kNqgrrHDwY0FSs77i9HarNISoeBzzTZmJFM3vrhFwCbXzb96GSsqlAL/VE6/QlUnEr0QZzEOIER0SeTq1uhc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4fe95739-1873-401b-b253-5d13c13abc9d@amd.com>
Date: Mon, 25 Nov 2024 18:34:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-11-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-11-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|DS7PR12MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f6dce5-17f1-4245-63d7-08dd0db7f435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2FZZzVCR2NIZDdodE9KL2JqRGs3Ym4rNVpPV0x0aGRveWZEeHJKWDBYNkRB?=
 =?utf-8?B?MWRsRTVyZHptTldVc3VHUTFqZ0lMNTZ5bXlrcmJEK2xkSmphSHJwelBnWUhi?=
 =?utf-8?B?bVRIVFdsdlcvTjQ2dzRIY2Nac3ZPMENBcFVKTWJUbHRWUGp1NmViWDN1Nkl1?=
 =?utf-8?B?bHMxOEROYlVFTXJKNGJRakZGellUYmtvZjhaN1RXSEVNb3hSTW4rT0dpb3Ft?=
 =?utf-8?B?RVY2cU92Y2dSR29jSktaVlozWmZESSt1T1dZcU43alhJbTRvai85dStBa3VN?=
 =?utf-8?B?SlhjQXJPWkpKZTFzTlQ1MTNCdDJsUUowNTZVNEJoRmlxTFJIMnE2b01lUmxO?=
 =?utf-8?B?OWJrNEkvWi9KaWdYNGNSVU40bS9wYkdvTXNXTkRSUHk4dVN4SE11VkRNdXZF?=
 =?utf-8?B?S01QSVpGU2FFS2dXUVlDS1Eza0xQdDU0dFJaVEwzeExhV285aW8rQUkxK2wy?=
 =?utf-8?B?cVB1VW9ySjV1REFkeUlZdU1sdzlkZVZ3VHhqRVBuYUJKUjJnMWc0RHRKc0Jr?=
 =?utf-8?B?aDZKUDk2Mm5kdXMrNFpmR2IrN0VGTnFWR2lTWUlMcTJETWNzU3B2WlZydkdT?=
 =?utf-8?B?V1hjODc2aysyUjBwdjJJTVkwVXo2WkZWaVI1end6ZHhURyt1RUErNldqM1Za?=
 =?utf-8?B?WW1sMThXdTl5R2NXd3FsUjRFdjJvYjA4eWVjYWlJNTFNUmJEbWdLczlBN3dw?=
 =?utf-8?B?dUE0TWgwK0JLeEN1RGFBUTU5dlNDUkZqdWR2WFFMSFQrWnZDVy85R21GS0xH?=
 =?utf-8?B?MzIwNm5zK2dpeGdacFRjWDJvSmxqWEh3U09GL1Z1Z0NDbW00aStDOUtvbGt5?=
 =?utf-8?B?TkF0V3I5ZndDMkxSYktKaTZkbUZHQjhQWmQ3TlpjYVFZcHJWM21Jbm0zMGsw?=
 =?utf-8?B?VWRBWWdoRHRZUW4rT3lXbHROWXkvUGtCcHhNNG9uZDlpdHBwRFlxKzJQUjQx?=
 =?utf-8?B?TCtRZjQ5OWh2YldHSHNaVEozZGJPT0x6RDIwRVlrcDdxdTE1bmdka2VNMHZq?=
 =?utf-8?B?cE1XdU93YXlhTFdzWTNhRWNFdWhrUXJ2VXAvUFptMjlBSTFXN0tURUpFTGhF?=
 =?utf-8?B?N0loYXVpK1k1M0N3OGNEbFVTaHZKZ2tPRk5KK3V1VHhDaURwa1I1M3ZtZnEz?=
 =?utf-8?B?cXZjQU5DMEVqQy96S3Z6UDZmWVNYYVE0S2FIM1l0dUJJTWFISDRsUjhJZVln?=
 =?utf-8?B?YmZwY1pUU0hJSUN3cVdqak5EQ1g4R0ZVVmQydG1jS0UwOFFtUTU0TWhHVmJq?=
 =?utf-8?B?VjJVOEFQeXE4akY5b1JCQ0tFZU8vbnBXZmc3Zjc5M1NzL0RoK0F5RndhVVV5?=
 =?utf-8?B?VWpXQlZMdm5xNFl1d2luZkRoOEVReTlrS1VwcmpkYTlWa00vdFk2VE9DWEZI?=
 =?utf-8?B?Nkh3Yi9udmZmR0NCVHUyRkJ3Ti9aZXowbzY2RFAxd3pGODlsemd6KytrZ0RI?=
 =?utf-8?B?UndjMnQ4TnQwRG5oMjlIMFF1Z2tCNGdXM09pdlVXcFg1REl6VkU0NHV2ai92?=
 =?utf-8?B?cWNKQ3lMREQwWC9OZWozaUg3eXRRWXBrYXcwZkpPWE9aUzQzWS9ldFp2UWkz?=
 =?utf-8?B?am12QmlZNDN1cjVQZUFmbXRISTJONHhEckxHekhyNTZvYUR0RjYwV25ZT2R0?=
 =?utf-8?B?ZEhlLzM4V3FReHNpTC9IcDlpUk9SS2Vjd01FUmYwQTJGbm9CNzhGSHByclZT?=
 =?utf-8?B?Z2RUOEdZU2o1L3F3ejM1U1RQaWtDT25TR2tyK1lydUNYMFVBK3U1L0N3czNx?=
 =?utf-8?B?SXFldHNCVVdVMEZMQ0JMSmhyUFM0MC8vZ2RWdjc3Z0hmZ1pYdVpXMnRyMEVK?=
 =?utf-8?B?Z1hFYUpXeHh6UUpXcDlQWVplS0NBOHJyYmVNcm93WXUrWWk3UkRTR2tnWGdo?=
 =?utf-8?B?cm82TjNySTZBLzlvQm43cVgwM0ZmMGJNS2JBdERNV1Q2Qm5odDViaWJGZ0Vk?=
 =?utf-8?Q?EKHo/ZlZgbtZuDZsONRig4TEg8vFvePn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 01:16:28.2856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f6dce5-17f1-4245-63d7-08dd0db7f435
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6360

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Look for a subnode of type `multiboot,ramdisk` within a domain node. If
> found, process the reg property for the MB1 module index.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/domain_builder/fdt.c | 25 ++++++++++++++++++++++
>   xen/arch/x86/setup.c              | 35 +++++++++++++++++--------------
>   2 files changed, 44 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
> index f8ddb11b339e..bc8054a80ec1 100644
> --- a/xen/arch/x86/domain_builder/fdt.c
> +++ b/xen/arch/x86/domain_builder/fdt.c
> @@ -152,6 +152,31 @@ static int __init process_domain_node(
>                   if ( ret > 0 )
>                       bd->kernel->fdt_cmdline = true;
>               }
> +
> +            continue;
> +        }
> +        if ( fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )

I think
         continue;
     }
     if

should change to

     } else if

?

Also "module,ramdisk"/"module,index"?

Regards,
Jason

