Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F224A7E9BD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940836.1340466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1r2U-0000aG-Nn; Mon, 07 Apr 2025 18:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940836.1340466; Mon, 07 Apr 2025 18:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1r2U-0000YE-L7; Mon, 07 Apr 2025 18:17:42 +0000
Received: by outflank-mailman (input) for mailman id 940836;
 Mon, 07 Apr 2025 18:17:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1r2T-0000Mn-H3
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:17:41 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2408::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96803c20-13dc-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 20:17:39 +0200 (CEST)
Received: from CH2PR05CA0041.namprd05.prod.outlook.com (2603:10b6:610:38::18)
 by CY3PR12MB9680.namprd12.prod.outlook.com (2603:10b6:930:100::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 18:17:35 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::d8) by CH2PR05CA0041.outlook.office365.com
 (2603:10b6:610:38::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.9 via Frontend Transport; Mon, 7
 Apr 2025 18:17:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 18:17:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 13:17:33 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 13:17:33 -0500
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
X-Inumbo-ID: 96803c20-13dc-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7nF42KNMap4pRXrfatG759+E5aki6l4CLLMgNlx+HOHtr+YhuZSFSIqfLovtI5E6gj7uO4yrbfc9PKxTIhGyvPqOrvX66hsS+scJ/NWOfFRSd+LH7hE7W0BLpFRlOcqsGVIp60Ur7giqXBwwssNTJh6/8gCN9zLu6GRw3RKFUrYeJRCHhyGeJGxg8j2pXahFh78mxq1Cy+Cz2Ve+Dkn7zO/LCe0QB5yHYcAzXMlLkNF/FmmQa69Z4bF+ZFh0n5Q+rbQZEixKVIWJOcgb1Pa5ktNAVxcZn9cAVGczhTu2DzelTVWT+bk7rFFw8b+v4d57vX0s8P67SIcpq0LldLpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HobXPlNt+p2Bv4LM+pPpXt8v2ZDWVNzLqjENRlroOtg=;
 b=nUy7MgFhLrl0oxBS61G/Pvv9nYjaTBLYNP8cyWn/YsytTtT6wHNOZFNyH6KoSgnqjJqoDI8gK7hgK2QdtWrJWu/jgtfNvpaJEg6mMN9wzHez2zTAwRQYfg3NcIAbCEMVBo4QCBoX+kNI1ZOoAWWF96tVc35ObBSkMnxY1qrxZvWSPDELVU4nrjCypp8t9166S2AR5LgQwt7DLXrATR+GtLqkFT8otovIaqFRiSDwBg34DBF0ilvFoAxdzcXQZ9GxK5k5qWwODlcm72BPBm2roHG0ka3ftpFLd5CsfF6tzv/9bHfgzOQOtDcv7GraESG6xF4BwEHF44AKtPoTEcHDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HobXPlNt+p2Bv4LM+pPpXt8v2ZDWVNzLqjENRlroOtg=;
 b=qnAYZmMJUOXSxF4PkMi5iIfH/FMqPAzGfle2jalaNyG+x88z8vld2CX/n8k3hx4B9ZpXLjtehrxNwg/WiUSagzh4vhwLbXlLNIPOGiEsk3R5/gQGVhrm0jOkxs+ow41UyM77LLlQ0jpBHMlgwC9c4zMzfp2pJQd7rclHgEstMr4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <72e2e9e6-db33-4e65-ae11-142f436cb56f@amd.com>
Date: Mon, 7 Apr 2025 14:17:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] xen/arm: dom0less seed xenstore grant table entry
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250403214608.152954-1-jason.andryuk@amd.com>
 <20250403214608.152954-5-jason.andryuk@amd.com>
 <2d0259da-f617-4fda-bc23-840e54a16527@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <2d0259da-f617-4fda-bc23-840e54a16527@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|CY3PR12MB9680:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5bf0cc-76c2-482e-015e-08dd76007828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDZZdERPVkZMcjdPSnROMUV1MFJMdFZOSHgvUTFjOUd1RVVYUUJwajFGNkZw?=
 =?utf-8?B?T3JFWEZYeXJ4cDNIb2xZZ1poNysxSFZHTTVOQU9QQm9ITTJscU5kd1pXU09T?=
 =?utf-8?B?Vk5CdWtMYjNWNTlCQ0dtNUc1c2Zad3JiWWo0VHlKcXJYT1htTENyUlpWeEJN?=
 =?utf-8?B?YThna2pId200M2N0a0RhaFhjRWg1U3paR1VwY0hOMnVFL2tsS050MGpjOFpx?=
 =?utf-8?B?d0ZIWnQ4N3J1S3RiQVpXd0RnQWxteTArckp0WElHQTZxakt4c0VjQTR3MUgw?=
 =?utf-8?B?NVlPOEtwZkcrMFFFaEdmOVllRmNvdU02cFRxZHJtWktYQUdiamRoRUFFMlIv?=
 =?utf-8?B?Vk9LaW01N3RLeHdPalRGSFd4TkFGU0tMRjdrZjNGL0plNGF5bjlPRGloQUV1?=
 =?utf-8?B?VFBscDFZOWx0UDA4RjU3MUdJVWZNOWx4ZXRDcVZKeWtuN2dVL3lmenJuK2dI?=
 =?utf-8?B?WDhuMktlUTlRM3Z3YTdzY04rVWhNQWhpWk9zODliMkxUNy9LZWt5VVlnck4y?=
 =?utf-8?B?bExyaGt0WXl2aVlER0VweXZhYTg5cVcyMk96M0pOWmowWUkzZDA0SE42TVVC?=
 =?utf-8?B?UGRNQklscXBxaDhLU3dNSC9WT3JDampNV1Yzd2hPQkd3alJqd2FmeEpFR3Bu?=
 =?utf-8?B?ZHFBU0t0U0d6RWJIMHBaUDhYaFZ6RnZNZG12REJyUytIWjZDQ1RlRldySk5u?=
 =?utf-8?B?RW5Yd1E3b1NBdUZHRkhWZVgwUW4zU1RSL0U1cERHaitGUndBSHg1TU02bjFK?=
 =?utf-8?B?cGxQS0NVcCtMc0xDRGVyR0JWUzY4OFpqMlJLTjQ1VE1Wd1A1U0dVdXA5UDY2?=
 =?utf-8?B?bVBLZHlDZlNlcUlqU1NyaGJ0aTdxR0VBUVc3SUlGZ3hYRkFFNEtDV3c2cnJa?=
 =?utf-8?B?VzgyaDF4UEVlYVpuT09lNEhXOTVzSjJqWEUxNWVWMFB3UlEyWTNMcFcva1hD?=
 =?utf-8?B?Zmh6WGFJLzgxdHZmMjN6M3pPdFY5Q3ZSOVpSRFJHZFJYdnYzaXMzV1gvOEk5?=
 =?utf-8?B?RE5wY0llZFJYb1dlL2RWOS9vcFRBREppTzNXSDFEZHRESHFtVDhXL3ZjamNT?=
 =?utf-8?B?UW84NW42Rkt6dGlYNzZ5VzJKQWZLYjVFcHAvcDNaRkI2MlRXck8xNWUrMEdw?=
 =?utf-8?B?eGhPZ2d0WXFqa3VjMlZJRUZCQVVxTXVwcjFIenB3d2h1MWIwcTJoV2prRUpV?=
 =?utf-8?B?bTNzQStlZnhtdEVZVUZDaDVrZ0Fieng4dFRVdHlZMHBvWHhpalF1MzdkMVpN?=
 =?utf-8?B?ZjdmZm1vSS8yTWF1emtYdE1LRy9lcXo2Y1o3ZlcySXF3YWxBQmhJV0haeDVG?=
 =?utf-8?B?cm1EVjllSXV4WGZ5N2JLN24xMTROTnRldWpOVGpLQVNYL3krbzNxdER5eDlp?=
 =?utf-8?B?eWh2VytRQUMveEp5NWZ3NXNyU25VUTNxSDdWbm1pUkZNLzhHTkE0YlFYVCsx?=
 =?utf-8?B?RkNVU25CK0NWdGVDekxyd2lHUnQ0R2FVYjVIZ3FobVRKVDlINTQvbnFLVG94?=
 =?utf-8?B?cWROVlV4aVFTQ0EwZnNRSDFhM0ZxZkQ4TFJFR2VrbERkMVlqT2szNTdTbGlj?=
 =?utf-8?B?NzNHWFBKVHZZZ3Y0MGZBd2xsVlF4N21wMjEzN2ROeTRtTDJqM2QzL3VEWG5E?=
 =?utf-8?B?Y0lBS0dKWDNMY25SQU5FN3ZBd0J3TllZMDJNMjQvblhqbkppWVRhN2U2dW5j?=
 =?utf-8?B?amVZc3ZQRHZ4MGZsZWU3UGI2NXdEQ2NTT0hMSVNFZXZGMkFETFI0S2ZCWjhE?=
 =?utf-8?B?c1ovSW8vaHgzb1pUeU9xRDNQWTYxakRNZlI2TW9IdUJyMU1EUXdyYUo0MEZ1?=
 =?utf-8?B?MUVuMkxwMGxYVzVST1dXRys5d3ozcmdMQUQwMzQwRmJlaDJkekRicnVoWEpw?=
 =?utf-8?B?Qk5UNFNJalBnVllQNkw1VXE4K1dIQVpISG1DSHRLaU9iOG91OUpBRERQdWhT?=
 =?utf-8?B?ckROUzdxSGhmZXFyRm9UV0dDVW16bXQ2MG1OSldnR1RqQStCdnVHTFk3VGNs?=
 =?utf-8?Q?uzsM6HCXimYY5KS7aoZkceg6O5bgeg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:17:34.3662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5bf0cc-76c2-482e-015e-08dd76007828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9680

On 2025-04-04 03:34, Jan Beulich wrote:
> On 03.04.2025 23:46, Jason Andryuk wrote:
>> xenstored maps other domains' xenstore pages.  Currently this relies on
>> init-dom0less or xl to seed the grants from Dom0.  With split
>> hardware/control/xenstore domains, this is problematic since we don't
>> want the hardware domain to be able to map other domains' resources
>> without their permission.  Instead have the hypervisor seed the grant
>> table entry for every dom0less domain.  The grant is then accessible as
>> normal.
>>
>> C xenstored uses grants, so it can map the xenstore pages from a
>> non-dom0 xenstore domain.  OCaml xenstored uses foreign mappings, so it
>> can only run from a privileged domain (dom0).
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> v3:
>> Expand commit message about C vs. OCaml xenstored.
>> Remove __init and flags from gnttab_seed_entry()
>> Change frame to uint32_t
>> ASSERT gfn fits in a uint32_t
> 
> Ehem. For this you need to use ...
> 
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -788,6 +788,12 @@ static void __init initialize_domU_xenstore(void)
>>           rc = alloc_xenstore_evtchn(d);
>>           if ( rc < 0 )
>>               panic("%pd: Failed to allocate xenstore_evtchn\n", d);
>> +
>> +        if ( gfn != ~0ULL )
>> +        {
>> +            ASSERT(gfn <= UINT_MAX);
> 
> ... UINT32_MAX here. Furthermore may I remind you that INVALID_GFN ==
> UINT32_MAX in 32-bit environments.

Yes, thanks.

> The ~0ULL may also better be UINT64_MAX.

I'll also add

#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX

>> @@ -85,6 +89,9 @@ static inline void grant_table_destroy(struct domain *d) {}
>>   
>>   static inline void grant_table_init_vcpu(struct vcpu *v) {}
>>   
>> +static inline void gnttab_seed_entry(struct domain *d, int idx,
>> +                                     domid_t be_domid, uint32_t frame) {}
> 
> Hmm. While generally I prefer using such wrappers, I wonder if in this
> case it wouldn't end up more clear if a conditional was added in
> initialize_domU_xenstore(). Ideally using IS_ENABLED(), which - aiui -
> would require moving the declaration of the function.

Ok.

Thanks,
Jason

