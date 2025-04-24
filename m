Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C683A9B590
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 19:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966720.1356857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u80aD-0008AC-OY; Thu, 24 Apr 2025 17:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966720.1356857; Thu, 24 Apr 2025 17:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u80aD-00088Z-LX; Thu, 24 Apr 2025 17:41:57 +0000
Received: by outflank-mailman (input) for mailman id 966720;
 Thu, 24 Apr 2025 17:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s25R=XK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u80aC-00088T-4Z
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 17:41:56 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20631.outbound.protection.outlook.com
 [2a01:111:f403:2406::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 686e85fc-2133-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 19:41:54 +0200 (CEST)
Received: from BL1P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::28)
 by LV3PR12MB9401.namprd12.prod.outlook.com (2603:10b6:408:21c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Thu, 24 Apr
 2025 17:41:48 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::98) by BL1P223CA0023.outlook.office365.com
 (2603:10b6:208:2c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 17:41:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 17:41:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 12:41:44 -0500
Received: from [172.21.185.2] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Apr 2025 12:41:43 -0500
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
X-Inumbo-ID: 686e85fc-2133-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILYDwdP4ZlLytUuWF3J/WwpcWWPSLyOF142zfF5F20c3xaR73TRvdjFjUqwKD2tcHefJc9MSFAhFXhYNbIkpcz8V6ulLiRLuPzrVdvO5ZUaSCrKqY3SbnwrwqJXKqP73gXK/xt+q2fNzXYdqrO+0EHB5f6P0nSa4NTkMDGbVReaSYB7xEA5Wf/OipUqQ52ffDYboY7mL5bJ9aAFm+mkjV9kKeAiMXdcAKjVhOz14MlNAPLmUJxM3ZFdS+6OiwtjKVMbetW2GoSc6nju8AeTMB1IQvsv6jUThxbnp2BPp2tFU/VE9rzmRXAKMfYMfe9US3n8V/6P9ka3DBKuR3oPPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrkZc7pzRi1FK1PvwqM0L/Jlg5CRJyVJ5WE9W0Urkxo=;
 b=FV1Nrgte1jb/RmvW8ncV93srIHXOiWvQUn5Ri3W3D4a8QyihxPH48u36L2WDRWVSQvJQy8e0p0pYzjyb8Wf9IsQwIqCRDLw064zBFCMDgeOzwqRShW11PC5uUcGs9zmS88WME/TufbPTiPfQHFmIprxznniS9A+m76K/52b4VECbH99BWW0Tk/G3W7IJ8jxAM9aKWdaFryqRGYPTJ0/1FhKWPRZGGDR+DutZFWPlGUYQbEIx8tYDa026fHGtje6CPgn/T5JFckGtP6ogjwnXWCY5QLmftkOXWm+yRMhIVWpj/2fnDioWeI4fU7pTR8Ty0XaK7eve0x5+tRFQebgKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrkZc7pzRi1FK1PvwqM0L/Jlg5CRJyVJ5WE9W0Urkxo=;
 b=lfhPllEcd25B5h1Irzv4BsIsTICzk/Ets0g4ZbL8nxWByPfsotxuS6WtjfbjElCS4ieIDwhO9KGKKyQSTQSBks4prPhCl1BYYsB/tWS4IreWjmZKfKSeW8Df85A3K1makRiqOlV1krbKIgLhgrW30UR3ZszUNrue8T3jG5sdCEs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6a37c1ac-8f5d-4c06-bd74-10d35e0dc1a6@amd.com>
Date: Thu, 24 Apr 2025 13:41:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] x86/hyperlaunch: add domain id parsing to domain
 config
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250424161027.92942-1-agarciav@amd.com>
 <20250424161027.92942-9-agarciav@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250424161027.92942-9-agarciav@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|LV3PR12MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: f146dd45-571f-4c37-2a5a-08dd83574828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjVjZVhkb05OWTNxM3J0R1FuelB4bGRxNUhhV2J0ajFxdGt2d3ZEc0Z6WmY5?=
 =?utf-8?B?K25veEpveWNHdExoazZzRWhremYwdzVTc2hZaDRkUG9IUlUxMWx4aEV1Z0tw?=
 =?utf-8?B?YlJxZDE1SThXaTByTDMrUzdGQUVmYzdmZkMvRTNPUjBVMVdJTElrZmZYcjdC?=
 =?utf-8?B?Zkh0QkZTVGxTSXYwaFJWUHNzUjZhUmJaZjRqeE4xM2ZvR29YZnRlT1RrOEJG?=
 =?utf-8?B?WkdJcUpjY0NtUm9EY2g5NnZaVkpPd0dKeVNTNXUvYjNYUkMxSGNaVENvOWVq?=
 =?utf-8?B?WVNydytqaE15cTE1WVBhRTROYXI5LzhzU2VHS0c4d2JkdDJVV2pvZmlSampL?=
 =?utf-8?B?anVoL096Z05sblZvRTNZcENqaUYwRzdzMEF3MjBkMStUVzd5aDNkd2J5VmhH?=
 =?utf-8?B?L042c094aFhmZHlsUlBDMDcvQUFPbE5nTFhwaG5KWklvTGdDaFQ3aDhDZUs1?=
 =?utf-8?B?VmgxRkJ5OU5TS2FSV1MzYlRkVUJCa2RIS0Frc1JOamdneVdMKzdCOUthMG9k?=
 =?utf-8?B?NjQyTzdjSFhNcXZWNGc0ck1lc0tsVUlaeUlleXRyY2RvcHJta0RKVVB2dG8y?=
 =?utf-8?B?N3dLczJwRnBENDRPTEpRd3M2L3FLU2RZejJqaTBJZlZZalgwOC9CemtpRWto?=
 =?utf-8?B?M3p5Zzh6VXkwV2tkWXpFY2ZNUllMWDJndUFFQ3ppQlUyTEhmWHMwckRMMnJF?=
 =?utf-8?B?L3RaODhaZ0ZsME45cXFoSS80dDZ3ajI4UjBrVVVjMVY0STNyWE9zWjhVVkJN?=
 =?utf-8?B?T203VS9KVXg2TnIzdXR3a25GcUxLd3hDQkoyVWRMQS9tZGYvOE5kWU1tcjRR?=
 =?utf-8?B?MEFWbHlZQ3BGcjhvWkxiOHV2Z0xuM0RwZUkxOElka1Jsa2ROajFMRjl6UXpz?=
 =?utf-8?B?ZzM2cG1ISVJvSE9ZS1RVMEdZS21VVHhqbHhMZGRiY1FaR0dFWFZsMWRLeGI5?=
 =?utf-8?B?QnNZRk1zV1ROQXErQlV0OUNLcUhBQ1BTVTZ6dzJUS0UrL0M3TVhld2x2WHl0?=
 =?utf-8?B?djQ4b3hWSSs1Z2svdHh4RHNFNjNLQlVsT2t3dXNYUkdpVjF3U09Yd05KVFFK?=
 =?utf-8?B?aTgzMWlmMFZmSlozbDg1TDZqNVpxbm81azN0ZTVMSnl4YjhCeUdCVmowN1FX?=
 =?utf-8?B?c2NGMFhRZUdLVUp6dG93L3VEQ25rQWdkY08zRENGTDEyTnVVNFF6eU12bWtR?=
 =?utf-8?B?bXJOY2dtaGxsck5MZVphQkNVVWtaeWpONWRnVnhHS3o1Vmo0blZlSVRsRGVy?=
 =?utf-8?B?ZEV6NkRCRGRJMHVUVTJhckhlczJCUURpZlc4WDZYYStoc0EvUlYxT2VqMkRq?=
 =?utf-8?B?Z2xXV3ZFQWxRWmhDZTZUUjBEU2dQajQ3MVBiakY2cUQxTG16bWRYdlJXbmdR?=
 =?utf-8?B?UFAwZWhLUGlmL0E2NlpOVTlUZ01PMnJwdlVxdUN5MjRTNnMzcXo5WlpLMjlB?=
 =?utf-8?B?cGh6UDVqTHI0Lzh4RStaTHVqT09kdy9CM2tSMDAvbDZDZGdqQTJEN3FkSWNz?=
 =?utf-8?B?ZDNIYWd2bW1wYi9uMHoxZlVNWWtocEpSODN4ZEIrUXlBTnUveVJxSXVYZ2xn?=
 =?utf-8?B?Wm0wVzFEZjNDTSthUVRsMUlTcGNSYitKdFNqcEZVaXF6R1BqeVVOaHZDaHlv?=
 =?utf-8?B?M3A3Y3RiUDJ1U29CaDVHSTBlT1VXcVRpc1Frd2VEMm15NGdCMHlrSWVQYkUv?=
 =?utf-8?B?WFIyWDRmVmkvNWFFM3N5N1VXQTZpQzZlcllGL2pjOHRTQlRValFzNEN6ZkdD?=
 =?utf-8?B?ZS9UaE5aZG1rU1RNT3AyQmFOdFVhcUNISFpYK3NHa0lWS2FGOVd0bzdzemJq?=
 =?utf-8?B?bld4TVNNL2kvV3ZqVnJCaXB0NmM3UEllcUVYMGFiMml4QmowdDVBV09sK1NJ?=
 =?utf-8?B?OWk2UVVEeUlnRFFkNXlsSmhsdGUwZGx3RmYyOGJ3MnJjbVZxWlg2NDgzOTRU?=
 =?utf-8?B?WGhHSXk4SitjSTdmS0VSTkwwZ3VwMGh3alEyaW51ZUNnbEtsRkY5V1ZjY0xE?=
 =?utf-8?B?WVlZNTFZMmozMmNLV2hkc0d4czdqNmoxT0V2MG5GUnp2dTJmQXlVV1NpeVF2?=
 =?utf-8?Q?eFx39M?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 17:41:45.2038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f146dd45-571f-4c37-2a5a-08dd83574828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9401

On 2025-04-24 12:10, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Introduce the ability to specify the desired domain id for the domain
> definition. The domain id will be populated in the domid property of the
> domain node in the device tree configuration.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---

> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
> index 144fcc75b5..5a5b3c8806 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c

> @@ -188,12 +189,54 @@ static int __init fdt_read_multiboot_module(const void *fdt, int node,
>   static int __init process_domain_node(
>       struct boot_info *bi, const void *fdt, int dom_node)
>   {
> -    int node;
> +    int node, property;
>       struct boot_domain *bd = &bi->domains[bi->nr_domains];
>       const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
>       int address_cells = fdt_address_cells(fdt, dom_node);
>       int size_cells = fdt_size_cells(fdt, dom_node);
>   
> +    fdt_for_each_property_offset(property, fdt, dom_node)
> +    {
> +        const struct fdt_property *prop;
> +        const char *prop_name;
> +        int name_len, rc;
> +
> +        prop = fdt_get_property_by_offset(fdt, property, NULL);
> +        if ( !prop )
> +            continue; /* silently skip */
> +
> +        prop_name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_len);
> +

Stray blank line.

> +        if ( !strncmp(prop_name, "domid", name_len) )
> +        {
> +            uint32_t val = DOMID_INVALID;
> +
> +            if ( (rc = fdt_prop_as_u32(prop, &val)) )
> +            {
> +                printk(XENLOG_ERR
> +                       "  failed processing domain id for domain %s\n", name);
> +                return rc;
> +            }

Maybe add a blank line here?

> +            if ( val >= DOMID_FIRST_RESERVED )
> +            {
> +                printk(XENLOG_ERR "  invalid domain id for domain %s\n", name);
> +                return -EINVAL;
> +            }
> +

> @@ -258,6 +301,13 @@ static int __init process_domain_node(
>           return -ENODATA;
>       }
>   
> +    if ( bd->domid == DOMID_INVALID )
> +        bd->domid = get_initial_domain_id();
> +    else if ( bd->domid != get_initial_domain_id() )
> +        printk(XENLOG_WARNING
> +               "warning: unsupported boot. d%d is not the initial domain.\n",

Maybe:
"warning: d%u is not the expected initial domid (%u)\n" ?

It's a strange message.  The domid property is added, but it's not 
expected to actually be used?

With the newlines addressed (and optionally the message change):

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

