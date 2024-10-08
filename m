Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5020B9958BF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813562.1226552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syH8n-0002eo-Vq; Tue, 08 Oct 2024 20:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813562.1226552; Tue, 08 Oct 2024 20:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syH8n-0002ct-TD; Tue, 08 Oct 2024 20:49:09 +0000
Received: by outflank-mailman (input) for mailman id 813562;
 Tue, 08 Oct 2024 20:49:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syH8m-0001ix-4R
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:49:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2417::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c26b68f3-85b6-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 22:49:07 +0200 (CEST)
Received: from PH7P220CA0033.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::33)
 by IA0PR12MB8088.namprd12.prod.outlook.com (2603:10b6:208:409::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 20:49:03 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::59) by PH7P220CA0033.outlook.office365.com
 (2603:10b6:510:32b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24 via Frontend
 Transport; Tue, 8 Oct 2024 20:49:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 20:49:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:49:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:49:00 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:49:00 -0500
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
X-Inumbo-ID: c26b68f3-85b6-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krEIg6NcTCoE+Fqk2JixqHkL+DWrtqNmpi/CqJWebnyku90g18Q3CWlpJRwPuRnFK9gCA5IJPfC9/QRwGmdcN7SHtte5LG72w0yJDBkKx/ygIrNmDboShRliU84p3VT0SWx+v7oi66lYzVeJtwmlbYD5GStRlU+0wRL4I/io/Q1eKqRV4x3xPF8GkiDCDjGVnS5pBRZiPGq3gPWc0OxVLXYHyVNsYWhSGY9I7pf9LQPNDIANnr7hxIAERBcrYnWYWYDUIe73mr0aDdB0Unf6h2zM0l6YHzSL1bma84aCow78gDU8TDsp319kQc8r+CjUHyzi9NsxmHdC2jVbxYp//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g3dcwdHby4ZdYU/WA4WKgagK1TAEoysiyWn+YMwo+I=;
 b=MztKPXbhptnpO3hgN3KdUpAwKLJhLYA6dzEmpZpKCGcTyOIxukk7mfWMnbiYaofrIXWdRaaqFeHzR33+8vBy+J4tECWPY4BTjrW5g+O+EVJN/Q+8VChQQ8BOpBwybH5Yn6HRSdCYJ9hRnN0YvmYrIvP0JzOzhmhws59UqOdh32mS05R/bnQE9+0P0J18y9udTKL7FE/Ore99wGXRTFePl7lpx0f4zELh16oQZiLW+MvhZZW6px3DUp6R1TIIInr4oaGLWdxC2tJcGxf3p5k9Q7sjNHtmKoSBj2smr8EYfWLonPYNiN3l+0n7jZg32snK11Y5gcYx1fV3RKVGv4MoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g3dcwdHby4ZdYU/WA4WKgagK1TAEoysiyWn+YMwo+I=;
 b=ARLfIMioSXK0rr/6jDI8rBeOJCkjSfogu5SNRpcv0UwxxUwDOa5G1EEvHa26AK6KxghLnNmwOdMwaw5eUcKkJghnEicpEyTiaEr93QQ34eUnTiHqetbZG+AXhHLkl2O/LRlPQ01suW8kY3RNkUcUbGSixtKit41Q/744VeOSWq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <949190c5-07a2-44dc-a4de-bc59ae88beec@amd.com>
Date: Tue, 8 Oct 2024 15:48:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 41/44] x86/boot: add struct domain to struct
 boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-42-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-42-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|IA0PR12MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: df2247e2-02ce-45b1-f3c8-08dce7daa3d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHFualFOK3UrY08zTWMvdjVOek1nYXhQajJDVlRLNG94RGtLbEZjUFc3aXFz?=
 =?utf-8?B?L2FMbEhjNWhzODNSdHJYTlRrRDJjL3VMZDhyM2dscnd4STYxSmRwSXc3UHVl?=
 =?utf-8?B?ZXhSSjJiYVVKcS9PNDFCT3k3M3RDVit2RlliN0lCSTIyTFJnL0djSmh0cHJv?=
 =?utf-8?B?QzZOT1FaY2JCSWN3SXYvVjgyOEc1ajJldFJrQU5VN3JXMGR4TGdneVg5dkxa?=
 =?utf-8?B?bU9VMTllNytWTHN4aDBQZ3dEOEZnY0hTaGlkNk1kZ2hXUnZYRDQzS1Z5V3ZE?=
 =?utf-8?B?RWNHSU9KZm9OM2UraThYakVMcDVNUmI0bDhMQ1htdVJoVjF3UkJNend6Mklj?=
 =?utf-8?B?S2Q4MzdCUXVPQjdOSG9tVG9CWm5RSXhHVFY5VFhWWTRuREtBNTlqSXdCM3lG?=
 =?utf-8?B?RmhUYkgyc0xXRU1ZUEV6Qyt5T1ZxaHZWVW0rM3g0SmNRcnJ2b1hyN3ZDMmpv?=
 =?utf-8?B?QVl3MVEyRERoL0hUTWZwQmhPbEVtMXArS2Zka0tRb00rRlRMMnVjYnRkL3BI?=
 =?utf-8?B?MCtwWCthV2o3MjRYMjErNkhnd0lXUVA3dGliZU9tK1M4MnZUS01nSzhPQlpu?=
 =?utf-8?B?cmxVTzdjeHZIMGg4bUZ1QVg3cThBcVhnRmo1UGN6MTAzMEt4alhUQUxUSElX?=
 =?utf-8?B?NkhQVXE5SWxSUE5XOHlkT3ByL2RHWUNtWW4rbURpWkRsZHNjakJEa05RSFo3?=
 =?utf-8?B?UDF1NUQyU3I5VDlMbTdjSytsYTFrRnpKT1dheW1kZDIwUlNUeGNjSlc0Q2du?=
 =?utf-8?B?dmZZYkVwT0hadStwOFV2SElYMHA1VlJtWG5vR1crQ21ndlRwTWlSYjlJUVFv?=
 =?utf-8?B?RklWSkJLTnVvVXNvRXg0dkdiOXk2UUppbjNERW9SSDd0YjV0TERmV1hMQzI3?=
 =?utf-8?B?ZEVWalIxM05Ka2NnMkFjVGRrb0l4NmlsY0lBRndzUXlEa0VBR0R6NmpyelJ1?=
 =?utf-8?B?ZzFVcGkzZEJnUEo5T3BzbFhzMEt3SEY3ZlZVenFkR3FiRVpndi9uVW10ckg3?=
 =?utf-8?B?cWUxQ0RRUG1RYlBsSmptVG9lbjh1bmxEY0ZxeXhGNVJHMTV2VlhBemhndW1m?=
 =?utf-8?B?UWxUZkQ3Z01ib2hsci93Mlk4V2VIc0l2SGNiTEJZQjg2ckJncVloQUFJbmti?=
 =?utf-8?B?TDRvd2ZqOUp5RTVNNnE1YkNnaUVmTzI3a3ZwdW5DdEhhYkh5c3VpRE11Z1k5?=
 =?utf-8?B?QjlySnI3SGRDdFpYZWhYTU5YcDhFVlNzYis3VmFiQUZYUVZ0TWZkTmhZUnI1?=
 =?utf-8?B?eXRJTnpHMFlzdmVBTXhPS29wWXQ5SjE2emJCM2tEamo0Ulgvd2s4b1Uzc0lE?=
 =?utf-8?B?YjJNQ3B6Sy80L3JjL1U4NFBaN2Q2MTVjOHR4cXFpM0VTaEVXSXhKMG8rOHJI?=
 =?utf-8?B?TDR3Snh6d0NRaHJidXBuSDg3aGRUQThBZEN1WTRCQlRUcTBvNFdjblpDRjg1?=
 =?utf-8?B?eExTMThSZkdlY0F2UW0zNjYraHJRa2E5K0RVYW1yV09vVzZHRDlxUDZYQzFk?=
 =?utf-8?B?STB2UmViL2JTTjVpd0VmRW41b1cyekZFRlNHZjBDQlR3UElqaVQ0Q2ZDQ3hD?=
 =?utf-8?B?SG41Tlo0VldMS211eEQ4V2tNVVlGRUFjbmJVTlR1dVl2OFh1d2RlSmpoMnBW?=
 =?utf-8?B?eTJ2S2ZWN0h4T081ZVFvVEQ4cVBDS09PSmZ4OHd3TnBQbXBCQ2k5bnQzeDhB?=
 =?utf-8?B?c1R4WDlNaGNQdHNTM3ZadnFPc0hwOVh4Tk9xd2lSUkxEVVFGVXdWemk2QkYy?=
 =?utf-8?B?ODB3NHNNRlExU3pHUnFKNDRWMklOdGZ1eENnbXpiSk1XeHpyTFBoRTcyVXFC?=
 =?utf-8?B?UXJ5MGplRG1yM2ZZRnV2VGp6OWkzeDlXZWdHVlJOWm5xWmNqOVFYMHBYdUZz?=
 =?utf-8?Q?7vmx4Fcp4Ak2B?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:49:01.6162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df2247e2-02ce-45b1-f3c8-08dce7daa3d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8088

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Store a reference to the created domain in struct boot_domain.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f250638edf09..e6a231bd2d42 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -959,7 +959,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>           },
>       };
>       struct boot_domain *bd = &bi->domains[0];
> -    struct domain *d;
>   
>       if ( opt_dom0_pvh )
>       {
> @@ -976,13 +975,13 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>   
>       /* Create initial domain.  Not d0 for pvshim. */
>       bd->domid = get_initial_domain_id();
> -    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);

It's a smaller patch if you keep `d` and the line above and then do:
        bd->d = d;

Regards,
Jason

> -    if ( IS_ERR(d) )
> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
> +    bd->d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
> +    if ( IS_ERR(bd->d) )
> +        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(bd->d));
>   
> -    init_dom0_cpuid_policy(d);
> +    init_dom0_cpuid_policy(bd->d);
>   
> -    if ( alloc_dom0_vcpu0(d) == NULL )
> +    if ( alloc_dom0_vcpu0(bd->d) == NULL )
>           panic("Error creating d%uv0\n", bd->domid);
>   
>       /* Grab the DOM0 command line. */

