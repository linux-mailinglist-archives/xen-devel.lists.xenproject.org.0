Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD19CF400
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 19:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837971.1253881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC17H-0002ba-U9; Fri, 15 Nov 2024 18:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837971.1253881; Fri, 15 Nov 2024 18:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC17H-0002YQ-RG; Fri, 15 Nov 2024 18:32:23 +0000
Received: by outflank-mailman (input) for mailman id 837971;
 Fri, 15 Nov 2024 18:32:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cuMk=SK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tC17G-0002YK-HY
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 18:32:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2412::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb9f36d7-a37f-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 19:32:15 +0100 (CET)
Received: from PH8PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:2cd::20)
 by DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.18; Fri, 15 Nov 2024 18:32:04 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::26) by PH8PR07CA0015.outlook.office365.com
 (2603:10b6:510:2cd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22 via Frontend
 Transport; Fri, 15 Nov 2024 18:32:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 18:32:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 12:32:02 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 12:32:01 -0600
Received: from [172.17.143.135] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 12:32:01 -0600
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
X-Inumbo-ID: eb9f36d7-a37f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjE3IiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImViOWYzNmQ3LWEzN2YtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjk1NTM1LjA2MDA3Nywic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN7/aOXqr3JcbPDjy3v8iH21m7DiaAN+hxHbKusvckB9qr3SFWjctZ9FiWDXiAeeCWd19OOnp92E7nyWyrNzfPXhA5okdN5Rx6hjgBa1H9nyPm5KbS+qCAEdi19lX90mxkAvDnEgqsPgIuFiWbB9Rt9eXPnx4o12pMTED9xb28b4k5ALPaIr+VvNWIrurdlT99Ax+YWJWBo5fUPG/jupkVhenyW2UreVBrTAzG/+QKwTpHOiWMbeeF351jveLuzyWtAsh8D1gpru2SG4k8Y7dX/4BVWagQvxnS0Gbng2LU8Cl8nGQWP0Q/zqz5+r0Mmw427fOuDqajqTFs5RkVy2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HvI5g1oVPNQgvVjBow9877QqwdGu+DwxgO8myBkoLg=;
 b=X6OBgD3Ar2bCjeG6knanerYklcAY0nvn3raotRKJ3HRL9qU5jBxMpwHrgRY+8MYJRTP8VB1eNN2IOfBDU80AddwJAHhjaC2f01LnPnTC/K7IwSjwC2QxJ/zKvrx4oLi5Y/l8VAN1ytHUCWNVK/VgejqmzMK+qdXAqDgr9MTmzCeCzyg5a6I4YsQQvPwKK318ZMrUx1rfuaa7eKhnNkmpFu0oYGRQYwXHH5JZPzClP0NDbgfrhMlqjsOFZ9lKgS18mhDo30ZCVgkm+Nw1TtmVFFd+h5IYHBGyHGPqUadd8cwcPGOC+ZQxuOm3rBnaAbvjJSxah1ugWn7DuqLsrkr76Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HvI5g1oVPNQgvVjBow9877QqwdGu+DwxgO8myBkoLg=;
 b=u1EUmkGLlloCrGR1/ihtL6q3/PJ6QxL6/dU6wfRgvn1dKDpOJvtz2DdbEAC9JxNt2etW41pcb81O0JpRkeYPMD1rD/9Dfy3lpWC5rjB/5LwFHmUQDVczqNHZr53knaQW8PBb1sT73IA5Zy1KmcpPM33qrNgy+3iXE/+FeN53pUQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c4b37832-efaa-4a26-8bbf-a3cf7caa3468@amd.com>
Date: Fri, 15 Nov 2024 13:20:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] x86/boot: add cmdline to struct boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-7-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241115131204.32135-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|DS0PR12MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: deda968a-dde7-4223-5d69-08dd05a3cd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dG5uelgyMDliVlZNc2xUazdJNVdIdTlIU1paOWpmSzZFZE8yK1QxTjFKTDk0?=
 =?utf-8?B?eWIrazJ4TjJzY1p6eno0aVBqdUIvQmFDZDg2M1J5cnFqRmdFS1FHR1k0dStT?=
 =?utf-8?B?T1hkaE05TEIyNjdaTUxvYU1tMSt6K1E4dk1Ha3FHUWk0aTN3RzI2YlBwUnpi?=
 =?utf-8?B?MHdFNXVtYlVYWjhocnNLOHp0ek9TYUIxK3dzLzNsMjdOVDF6TkZmUzFwdkw2?=
 =?utf-8?B?bUxEWXcwMTBZblJiQlZENDkwQXlHa0RsSmlIK0pCTUdBSW50UUN5b0s2b2JH?=
 =?utf-8?B?LzVRL3BRQ0pDeGdISzFkeHpTQTAraWRXVStiVUJVZ0lERVM4czN6Rm43ZzUw?=
 =?utf-8?B?bzllNDFhOVVIVVhRY3U2YkloekNoWWhDZWpyeDEvNllzL2V6VUczTXUrWVFO?=
 =?utf-8?B?aHA2NnFCcGJCR01LbHhPUnMxNzA2VndBQWk2L3l6UStmUUFRamRwYzJWdTUv?=
 =?utf-8?B?VnpzRTlYUzRGSnVWQVk1a3UvcmhDUlBXUU1ySnh4TE9QRzJCKzM2NDh2VXAv?=
 =?utf-8?B?NXAyVnB1REQ1TUtSL2xaUklzNlpPUnNlNEtXS1dWbm1tMU5VbzVQWEtDdnJP?=
 =?utf-8?B?OGV2MENGZWo5cy9nb2dLazlabnM0bk94QWNza3liMVpLOU9ldTZJbFBwRThI?=
 =?utf-8?B?MUlnSkUzV1VqMEEzZVlGZVJGK1JWVjlIZEVraDdsVWwxZjhzb2JqWUhSbWE3?=
 =?utf-8?B?YW1NbkExQi9Dbk5HM0FsK0Yzclc5NVZnZGpKMzdlUHkyT0NLUXlEOHg4eEUr?=
 =?utf-8?B?RGVuY0tQYU1HZWpEMU1RL251anB2NHpGamEvWWJEMnNrTmhzOGZVRjRuSlNm?=
 =?utf-8?B?VE9kK291eUtXVlZmdzVhbW1GM2NVOXBFNUZtZENqK3VIUDZmbmtScmFoaU5l?=
 =?utf-8?B?d1liRk5qUjlEb2lScFZ4WE5nUm1nSmRmVTg0UVdSdm9oYUdLMnQ3emhZZ0Nm?=
 =?utf-8?B?OENUSlpZbjNCR1hwVVBjVDJJY0UzZXoxSm5xSzZCbEhoUXFER3JraE1sWFQv?=
 =?utf-8?B?L3RNQWRQTFJFSTdhc1JsSDRJS0F4dURNVlgvd09wL2x6MDhZSEpGaDBxSkky?=
 =?utf-8?B?WDhBTHhzOG45NnpTRldMa1dNU2JrU0xIVVJSaGUwUEsrajQzTnpiM1JpRjcy?=
 =?utf-8?B?dXdGTit5UVc0cWNOTm5BWVVyRlhPVG5MYmJEL0l4RjQ0bVVZMjU4a29FRVFZ?=
 =?utf-8?B?Zk9PWVVvTzRBbGVYSTRzRlZUdXdIY0lkeWtYY0ZxajJOTHFXTEdSZ1lvUFpG?=
 =?utf-8?B?eHV6RmNlekFhQnhCVUg5WWRJZENlNGpobGNxeFlMQUtlaTlJWUxKVU9KbGRw?=
 =?utf-8?B?MG9DTUM4SEhTdWJjbndtMG1CcnB6dll5amVSQWttOFlDUjZPWDRlOWh6b01Z?=
 =?utf-8?B?ZFlqcG9La1ZGWUMzYTZyRE5sUFJvdE5IMEppQkg3bUxxRy9WbU1LNzBGc3Zh?=
 =?utf-8?B?YXZucjdLd1pOeTAwalM1UzJ1alY2RFgxSXBzb05sTXVReGw2YlJkQUY4bHgr?=
 =?utf-8?B?akdyUGNrTEx1RGZreXVMWGMrZ1FESE5CSTBBcEQvMDBUZlB1NWluSld4ZkFk?=
 =?utf-8?B?bjBmalp1L2Jwck81a1BPQ1I3cEd1RisrNGNRcElvQm1LNlBocEoyRW1CdzVy?=
 =?utf-8?B?K2ZwZnpaVlNDbzVVUTA0VFdtcmZwQzVHWWZnTUZUclRMNkVSN1hNL3NSZGR4?=
 =?utf-8?B?aFpOcVllUDI1UDhEcEdhallTbkFIaEhRRFVsZmhBZ2haR2pzc2dtV0p5akcz?=
 =?utf-8?B?dTlZRFh3RFZSc1IvaVZka05OTkZEYnlYbXNjVldpSEFmTGZHellmWjhmT0pJ?=
 =?utf-8?B?Qys3ZEdqQmJTelRwamttendXaHRlSHZONUczdmFoR05QMld5TC9oc0YzSHVw?=
 =?utf-8?B?NGJIQ2VGRGh5WmQxWS9La3I2R1ZrTmpFRDFReHNXdXhBclE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:32:04.0138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deda968a-dde7-4223-5d69-08dd05a3cd7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6390

On 2024-11-15 08:12, Daniel P. Smith wrote:
> Add a container for the "cooked" command line for a domain. This provides for
> the backing memory to be directly associated with the domain being constructed.
> This is done in anticipation that the domain construction path may need to be
> invoked multiple times, thus ensuring each instance had a distinct memory
> allocation.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>


> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 533a1e2bbe05..b9ca9c486fe5 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -963,10 +963,31 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>       return n;
>   }
>   
> -static struct domain *__init create_dom0(struct boot_info *bi)
> +static size_t __init domain_cmdline_size(
> +    struct boot_info *bi, struct boot_domain *bd)
>   {
> -    static char __initdata cmdline[MAX_GUEST_CMDLINE];
> +    size_t s = 0;
> +
> +    s += bi->kextra ? strlen(bi->kextra) : 0;
> +    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
>   
> +    /* Should only be called if one of extra or cmdline_pa are valid */
> +    ASSERT(s > 0);
> +
> +    /*
> +     * Add additional space for the following cases:
> +     *  - 7 chars for " noapic"
> +     *  - 13 chars for longest acpi opiton, " acpi=verbose"

option

> +     *  - 1 char to hold \0
> +     */
> +    s += 7 + 13 + 1;

Seems a little fragile.  Sizing but also depending on code elsewhere. 
Interesting - "verbose" wouldn't actually get updated into acpi_param. 
Anyway, using sizeof(acpi_param) seems better.  Maybe:

         s += strlen(" noapic") + strlen(" acpi=") + sizeof(acpi_param) + 1;

> +
> +    return s;
> +}
> +
> +static struct domain *__init create_dom0(struct boot_info *bi)
> +{
> +    char *cmdline = NULL;
>       struct xen_domctl_createdomain dom0_cfg = {
>           .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
>           .max_evtchn_port = -1,
> @@ -1008,17 +1029,23 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>       /* Grab the DOM0 command line. */
>       if ( bd->kernel->cmdline_pa || bi->kextra )

 From your other email, since you don't need the length, just non-zero:

     if ( (bd->kernel->cmdline_pa && __va(bd->kernel->cmdline_pa)[0]) ||
           bi->kextra )

>       {
> +        size_t cmdline_size = domain_cmdline_size(bi, bd);
> +
> +        if ( !(cmdline = xzalloc_array(char, cmdline_size)) )

Just xmalloc_array since it'll be overwritten immediately?

> +            panic("Error allocating cmdline buffer for %pd\n", d);
> +
>           if ( bd->kernel->cmdline_pa )
> -            safe_strcpy(cmdline,
> -                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader));
> +            strlcpy(cmdline,
> +                    cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),
> +                    cmdline_size);
>   
>           if ( bi->kextra )
>               /* kextra always includes exactly one leading space. */
> -            safe_strcat(cmdline, bi->kextra);
> +            strlcat(cmdline, bi->kextra, cmdline_size);
>   
>           /* Append any extra parameters. */
>           if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
> -            safe_strcat(cmdline, " noapic");
> +            strlcat(cmdline, " noapic", cmdline_size);
>   
>           if ( (strlen(acpi_param) == 0) && acpi_disabled )
>           {
> @@ -1028,17 +1055,21 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>   
>           if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
>           {
> -            safe_strcat(cmdline, " acpi=");
> -            safe_strcat(cmdline, acpi_param);
> +            strlcat(cmdline, " acpi=", cmdline_size);
> +            strlcat(cmdline, acpi_param, cmdline_size);
>           }
>   
> -        bd->kernel->cmdline_pa = __pa(cmdline);
> +        bd->cmdline = cmdline;
> +        bd->kernel->cmdline_pa = __pa(bd->cmdline);

Should cmdline_pa go away if we now have a valid cmdline variable?

Regards,
Jason

>       }
>   
>       bd->d = d;
>       if ( construct_dom0(bd) != 0 )
>           panic("Could not construct domain 0\n");
>   
> +    if ( cmdline )
> +        xfree(cmdline);
> +
>       return d;
>   }
>   


