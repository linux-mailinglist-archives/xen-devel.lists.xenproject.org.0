Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F68FA09E9E
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jan 2025 00:08:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870072.1281528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWO6B-00013w-1k; Fri, 10 Jan 2025 23:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870072.1281528; Fri, 10 Jan 2025 23:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWO6A-00011X-UV; Fri, 10 Jan 2025 23:07:26 +0000
Received: by outflank-mailman (input) for mailman id 870072;
 Fri, 10 Jan 2025 23:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l7mG=UC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tWO69-00011R-A8
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 23:07:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2417::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6124501-cfa7-11ef-a0df-8be0dac302b0;
 Sat, 11 Jan 2025 00:07:23 +0100 (CET)
Received: from PH2PEPF00003847.namprd17.prod.outlook.com (2603:10b6:518:1::64)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.10; Fri, 10 Jan 2025 23:07:19 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2a01:111:f403:c801::5) by PH2PEPF00003847.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 23:07:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 23:07:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 17:07:17 -0600
Received: from [172.31.88.124] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 10 Jan 2025 17:07:16 -0600
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
X-Inumbo-ID: a6124501-cfa7-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWAlsN17qD+JfrJ4GtOn2ysR2SKaqq6xnk894YFy9ZydxIz5ffGp1otrGnhO6mONyouhQPt4vfZevuP+a4gdcDeZJddSTsoyK23EjFfpUl0J2JXXhxh95YsgOi2zADovKenmaolQxEibE1dPCt++zDM8sWudCagOwX9rSx2F7sDeWWtbwrbIzzKzupyS64BiQfCWRhxIl6JiQSwv7l34MKGX76+t8x1iyA+UWA2Sv7pNLodoEJeX8qtBVvUHYuTzMwPlEpNCF29x+02GhX8nqgsh7D+vjRo8tHSFYWhXZ5kTe9MnjUver0r1cO+cTKP21dUjsiwTERPW8IcZHvWAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHq90pJkmtfQxQ8Aqrr9UR9evEFgX9UuVNZNytC2qGw=;
 b=DOFGA7hDPnRuPElwrwsBW9hTAM5MMWU6KzcGQtlgWsXYx974rJAOkyglLBiKeSeFA/PzNmyypHVJmnu8gURH0MWoHWASF7baiMk/swNx+LDq3cX432FzYctp/Cwp29m475eJTj6FbokH3NNpqLCIOeQ7VNyapUvr+66TxwIZckl3FR2UBk5fo/1MwXWCLffDXV2PpoYQ3HM+z/b2+OEJ2lhEGzFmSvyQLH2LUKcO6Kc7slPmHQ7eWTrMt8upFKAHsOYHdbAa5NAdx/M5QZ06Fta6x9waWvOd9gq3cNeyrZ4TAqyQ6oqji6yMAzE/rdW1YuAQGJTG1HbrYpSgjgycMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHq90pJkmtfQxQ8Aqrr9UR9evEFgX9UuVNZNytC2qGw=;
 b=Lu0NRhgw1QKa9fBUEnzHkHc1ttlg0Hms2Kk2rseE0s9ZN55gjvl3jLXGvgGYAIM1saSi5jhFKoDzEhh46+naTLRCzL7CeR/R9XaV68vYsy1idZo6xuGL1gm3BamgvEEsH597LyG/FB2RCqGyeWSuUG4kdjNXPN3eKGvr4V5Os/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1fa208ec-f4ba-443a-ac4d-d601274ca5d5@amd.com>
Date: Fri, 10 Jan 2025 18:06:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-9-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241226165740.29812-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4d974c-0c54-43ec-46d5-08dd31cb87e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHJLdUQxTHlsR3p1bE4rb2tkZExkeWxodkZqbnY1UnFWOGdDT2VDQVloN2Y4?=
 =?utf-8?B?Z3JmaExJSXFaZ1pxVWVlS0ROeE1jTnZKTFNlTFJiaVZ6S1NEK2NPZ0xZYWlo?=
 =?utf-8?B?VHEvcXdzQ1QydzFWUWZiUkVrWHYvRkJ3ZzBuQjlUeGJqZ1FrNEpZRHlNSElM?=
 =?utf-8?B?YzRWeU9EYXY3R29nQ29BdkZjcmUvNU5WZDF5anJUdkkrV2dIZm9CYWNQYzQ2?=
 =?utf-8?B?VlJjMHFTcGxnOEFrbERrdTdpTGJPQ082ZFcwaFIySUREaTExK0NoYzJOcjVL?=
 =?utf-8?B?RW5RS3BkSjRGZGQ4WFI4RDFhYy9FdFNDSTJFMnl6U2VjRDlkNUpzU3d3VTJn?=
 =?utf-8?B?TmJlREZGYlpCSU9VS3granBMSUpmSHJ3amg5MHpXaTNRRkRZcWlEbDdMMjdN?=
 =?utf-8?B?disvOTR3aWIzV29WeEFpNFdUVG1CVlZNc2YwaE1CWi9uQllSalZYSWxNUjlw?=
 =?utf-8?B?S1MvNVVjRGcrZ0lMV1MzdWpkTEl4cVdGd2QzVTdWWHlWUEU0d3hPR0lBZmg3?=
 =?utf-8?B?ZTNmL2JCV3pJOGw1NkkwKzlidDVoZnJHTGlkdy9aMDRybmNwK3haeldwbmRl?=
 =?utf-8?B?NklMN3BTZTAyVEhxMkNjZk5ZaEdZVCs4QmVacWNLOG5IeEpybU81Vlo2ckFW?=
 =?utf-8?B?SVNiWWswRUhObDliMjAyUnRxbDB5SkI4TENUWFlZOGYxcGhnalBrL1lHRm1R?=
 =?utf-8?B?alBnWUNrWmRMRWRIODIwd050VzBsNWZuZ1U1U3QwbGEzVVlxOTErcjFZSGdX?=
 =?utf-8?B?MDBmMzhHRkRCM3c5Q2pER3QvMkxHaWxMV3FRMml5VmVtdkhzS2pWc2hzaXk5?=
 =?utf-8?B?Rm1JMzZsS2lHZ0ZZUVJtOUZ4TmdJbHdHaSt6Y3pmUjF3eVFnbEtoQVROdkRm?=
 =?utf-8?B?NlZ4ZmZZUHVFamYreUU0ZmMyS1RGOHo0Um01a3RZK3NvTUF2WXR2LzY3bjdU?=
 =?utf-8?B?QlNrOHJLWHdmcUQvTWNaUVRLUjBFN1N0anJPem1GZmFaMWpzcUZ3WXNjTnZJ?=
 =?utf-8?B?WjRPQXMwSEFPMHltM043T0xTUkV1aER3VlpDY0JrWGJoY3ZKY0w5N3FOanZk?=
 =?utf-8?B?WlhadUpNdndNaEFTMHJyRTVWYk9sLzkvZGxJUnhsd1RTZnl1YjJUWVRSZjY2?=
 =?utf-8?B?d1ZOSXhYQytsMWdudDF3Y3V3dmhUQjArdG9kLzFGUTcrc2NOK0s1aEYvbGY5?=
 =?utf-8?B?SXNGRWRQTVdOUjZ2djVPNnpaSkk0bGRxdk9JSjYzWHdDWGpaYkw4dnFkd09t?=
 =?utf-8?B?ZzZOM2JIbHJ5djZjOWpGYjVUNTZKbHd1OGJsa1Q1ZW5rbHpMdHcycUVRMi9C?=
 =?utf-8?B?WE5LbEFxOU9QUEVKRSt2a2Mrck9jc0FINXlZR0c2blZoQWxGYjArMU9PcUM1?=
 =?utf-8?B?eEdoSnV3WTdIVGdkZ3lpT29iVVNFZXladWtIYXBKazdUNU10VDNPa1BadVE1?=
 =?utf-8?B?a3lUK05lbDZma003VDBQN1kvVW0yeEF1MVAwSXFvWm5YNWpQQTJ2TDFySGZs?=
 =?utf-8?B?S0grT0o1ejFXTEpvRmJGOVNLNkt2MGRzaUlLckJXNzFGSnlCcUgyWmFrOXJW?=
 =?utf-8?B?R3lRU3BmelptaUx2d3FqM2VtakNuNXBEQ1MxVXFEUm9MYWVKMDA5MGF2WWJi?=
 =?utf-8?B?TUNoeWJKU1p6cTBjSm5hOTVPRzdIY3ltTDA5NlRpUW04dTQreHJ6MDZuWnNW?=
 =?utf-8?B?bXA3Wk9zNlE1dDJtY2VOYitrdlVFdDl4d0ZmMG5HQzhES05BVlJFZnh3eXJ5?=
 =?utf-8?B?OWh5d0JCaXdkenc0YzM1a3pQV1QyWGdEZVlnQ1Buc1I4YnVVaE9qTVI4QTBJ?=
 =?utf-8?B?V2kyWU5iT3FWaERaUWNyVWx0RWE2M1JsY3FWYWUvUmFaTklTMHU2dXBpaGFu?=
 =?utf-8?B?K095N0p0YWlWMTd5LzZtbEZsb1ZlMGttKzlqRG5SV1NJemtCZkZWU3p5Y2Z5?=
 =?utf-8?B?NjRGdDBqNy96a2Y1TmdVd2JuVDZaNVJaLzNYTlAxOUVQTktjY2d4cmhCMmtR?=
 =?utf-8?Q?3SQqckwHIdLC7Ny+CUsQmzqjHJRTUE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 23:07:18.3572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4d974c-0c54-43ec-46d5-08dd31cb87e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446

On 2024-12-26 11:57, Daniel P. Smith wrote:
> Look for a subnode of type `multiboot,kernel` within a domain node. If found,
> process the reg property for the MB1 module index. If the bootargs property is
> present and there was not an MB1 string, then use the command line from the
> device tree definition.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Changes since v1:
> - moved low-level fdt handlers to libfdt-xen.h
> - coding style changes
> - moved default to "unknown" up to a local declaration
> - moved the general fdt parsing code out to libfdt
> - reworked device tree property parsing for module index
>    - reworked parsers to take index as parameter
>    - parsers now return success or error value
> - added check if kernel was already located, warn and continue
> ---

> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
> index 5793bdc9fd47..bcaee50689a6 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -13,6 +13,114 @@
>   
>   #include "fdt.h"
>   
> +static int __init hl_module_index(void *fdt, int node, uint32_t *idx)
> +{
> +    int ret = 0;
> +    const struct fdt_property *prop =
> +        fdt_get_property(fdt, node, "module-index", &ret);
> +
> +    /* FDT error or bad idx pointer, translate to -EINVAL */
> +    if ( ret < 0 || idx == NULL )
> +        return -EINVAL;
> +
> +    fdt_cell_as_u32((fdt32_t *)prop->data, idx);

fdt_prop_as_u32() provides a few more checks and would not require the 
cast here.

> +
> +    if ( *idx > MAX_NR_BOOTMODS )
> +        return -ERANGE;
> +
> +    return 0;
> +}
> +
> +static int __init dom0less_module_index(
> +    void *fdt, int node, int size_size, int address_size, uint32_t *idx)
> +{
> +    uint64_t size = ~0UL, addr = ~0UL;
> +    int ret =
> +        fdt_get_reg_prop(fdt, node, address_size, size_size, &addr, &size, 1);
> +
> +    /* FDT error or bad idx pointer, translate to -EINVAL */
> +    if ( ret < 0 || idx == NULL )
> +        return -EINVAL;
> +
> +    /* Convention is that zero size indicates address is an index */
> +    if ( size != 0 )
> +        return -EOPNOTSUPP;

We wanted reg = <addr size> to be converted into a new boot module.

i.e. if the user is using grub - they should use `module-index` to 
specify binaries.  If the binaries are loaded in memory, they must use 
`reg`.

> +
> +    if ( addr > MAX_NR_BOOTMODS )
> +        return -ERANGE;
> +
> +    /*
> +     * MAX_NR_BOOTMODS cannot exceed the max for MB1, represented by a u32,
> +     * thus the cast down to a u32 will be safe due to the prior check.
> +     */
> +    *idx = (uint32_t)addr;
> +
> +    return 0;
> +}
> +
> +static int __init process_domain_node(
> +    struct boot_info *bi, void *fdt, int dom_node)
> +{
> +    int node;
> +    struct boot_domain *bd = &bi->domains[bi->nr_domains];
> +    const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
> +
> +    fdt_for_each_subnode(node, fdt, dom_node)
> +    {
> +        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
> +        {
> +            unsigned int idx;
> +            int ret = 0;
> +
> +            if ( bd->kernel )
> +            {
> +                printk(XENLOG_ERR "Duplicate kernel module for domain %s)\n",
> +                       name);
> +                continue;
> +            }
> +
> +            /* Try hyperlaunch property, fall back to dom0less property. */
> +            if ( hl_module_index(fdt, node, &idx) < 0 )
> +            {
> +                int address_size = fdt_address_cells(fdt, dom_node);
> +                int size_size = fdt_size_cells(fdt, dom_node);
> +
> +                if ( address_size < 0 || size_size < 0 )
> +                    ret = -EINVAL;
> +                else
> +                    ret = dom0less_module_index(
> +                            fdt, node, size_size, address_size, &idx);
> +            }
> +
> +            if ( ret < 0 )
> +            {
> +                printk("  failed processing kernel module for domain %s)\n",
> +                       name);
> +                return ret;
> +            }
> +
> +            if ( idx > bi->nr_modules )
> +            {
> +                printk("  invalid kernel module index for domain node (%d)\n",
> +                       bi->nr_domains);
> +                return -EINVAL;
> +            }

The earlier MAX_NR_BOOTMODS seem superfluous since this is the one that 
matters.

> +
> +            printk("  kernel: boot module %d\n", idx);
> +            bi->mods[idx].type = BOOTMOD_KERNEL;
> +            bd->kernel = &bi->mods[idx];
> +        }
> +    }
> +
> +    if ( !bd->kernel )
> +    {
> +        printk(XENLOG_ERR "ERR: no kernel assigned to domain\n");
> +        return -EFAULT;
> +    }
> +
> +    return 0;
> +}
> +
>   static int __init find_hyperlaunch_node(const void *fdt)
>   {
>       int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");

> diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-builder/fdt.h
> index f5b89cb54b29..0be4ac771bc4 100644
> --- a/xen/arch/x86/domain-builder/fdt.h
> +++ b/xen/arch/x86/domain-builder/fdt.h

> @@ -10,6 +12,7 @@
>   #define HYPERLAUNCH_MODULE_IDX 0
>   
>   #ifdef CONFIG_DOMAIN_BUILDER
> +

This newline should move to a more appropriate patch.

>   int has_hyperlaunch_fdt(struct boot_info *bi);
>   int walk_hyperlaunch_fdt(struct boot_info *bi);
>   #else

> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
> index a5340bc9f4e1..27d23df03af3 100644
> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -13,6 +13,82 @@
>   
>   #include <xen/libfdt/libfdt.h>
>   
> +static inline int __init fdt_cell_as_u32(const fdt32_t *cell, uint32_t *val)
> +{
> +    *val = fdt32_to_cpu(*cell);
> +
> +    return 0;
> +}
> +
> +static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
> +{
> +    *val = ((uint64_t)fdt32_to_cpu(cell[0]) << 32) |
> +           (uint64_t)fdt32_to_cpu(cell[1]);

A cast isn't needed on cell[1] since it's not shifted.

> +
> +    return 0;
> +}
> +
> +/*
> + * Property: reg
> + *
> + * Defined in Section 2.3.6 of the Device Tree Specification is the "reg"
> + * standard property. The property is a prop-encoded-array that is encoded as
> + * an arbitrary number of (address, length) pairs.
> + */
> +static inline int __init fdt_get_reg_prop(
> +    const void *fdt, int node, unsigned int asize, unsigned int ssize,
> +    uint64_t *addr, uint64_t *size, unsigned int pairs)

Your other function uses address_size and size_size compared to asize 
and ssize here.  While size_size is fun to write, I think addr_cells and 
size_cells are more accurate names.  It's the number of cells to parse 
for the respective values.  device_tree_get_reg() already exists - is 
that not usable?

> +{
> +    int ret;
> +    unsigned int i, count;
> +    const struct fdt_property *prop;
> +    fdt32_t *cell;
> +
> +    /* FDT spec max size is 4 (128bit int), but largest arch int size is 64 */
> +    if ( ssize > 2 || asize > 2 )
> +        return -EINVAL;
> +
> +    prop = fdt_get_property(fdt, node, "reg", &ret);
> +    if ( !prop || ret < sizeof(u32) )
> +        return ret < 0 ? ret : -EINVAL;
> +
> +    /* Get the number of (addr, size) pairs and clamp down. */
> +    count = fdt32_to_cpu(prop->len) / (ssize + asize);

Rounding down seems okay-ish.

> +    count = count < pairs ? count : pairs;

If the caller is asking for "pairs", should it just be an error if there 
aren't enough?

Regards,
Jason

