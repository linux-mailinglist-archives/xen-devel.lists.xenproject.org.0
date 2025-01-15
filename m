Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B93A12BDB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 20:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873056.1284039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY9Fd-0000E2-33; Wed, 15 Jan 2025 19:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873056.1284039; Wed, 15 Jan 2025 19:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY9Fd-0000Bi-0A; Wed, 15 Jan 2025 19:40:29 +0000
Received: by outflank-mailman (input) for mailman id 873056;
 Wed, 15 Jan 2025 19:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZO=UH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tY9Fb-0000Bc-HD
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 19:40:27 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2416::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ff76f51-d378-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 20:40:25 +0100 (CET)
Received: from DS7PR03CA0181.namprd03.prod.outlook.com (2603:10b6:5:3b6::6) by
 DS7PR12MB6141.namprd12.prod.outlook.com (2603:10b6:8:9b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Wed, 15 Jan 2025 19:40:19 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::50) by DS7PR03CA0181.outlook.office365.com
 (2603:10b6:5:3b6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 19:40:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 19:40:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 13:40:18 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 13:40:18 -0600
Received: from [172.27.3.102] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 13:40:18 -0600
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
X-Inumbo-ID: 8ff76f51-d378-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kghExDesPkVx+i/z4CqhbWzKEk0uDhzmc+qtnfNbVMX9cgWPfw2E7JbEoO4NLyJPqNmslSSZ+CQSvPvNUERV6tmBiAaLdcGLnawBTXWnOIG14Vd/qxxCmI87sozKsj/WeqZe+psouLktM+5Nnu0FSzT0sWEjM/tsPDPHgsR7i6lV5+MyH+mpuuVD92+Jx7kbO74Vz2+uqA8GnDFKu+/ZslwEClAX4WGV9W5tGgudgeIOsRLoZuM9SkjXsHMK9n/vnPr7amoA1VTFV/WgwdG+8cGRdI+/EN0bNhS+ljj8Z9FW2S4ZrYWrpKR6xWuDH8TlBoYsYd8BE6f5h/z/ByXmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udt1fbaIw7+u/kBiW+PlOwvsGK27pKZIQeuT72Zs2hg=;
 b=PGqnS2Od4j+3SkJmgW3p0sAx0X7ii4QIV0xl2fRnUoeL2z2aVCro1qaZpktgUJOym1mVFhoP4yitcf7kLmBgpvDUBEhriGxWvLgQJFZWt39bwTNJQgaRo7h1z+m3JmuSAI0rSFLoWMsrH6HWBPz8FJt3mSde/mvyLY24b6dOLsx4hTWc2ZgNAsD/27dxCoRAp4N04YrOeIU4HlyZLEZH0JpjlbpMrh1+i+DXduoxqj2Tuz4CpJxUwlvSmrxL8Y7K5U30OuwZ+JuSbTMVswqJ4b2yFiKsxEizR3lJ1s+Hx/A81LEA0+1X29KnHbt5dFiwCDIQA6w/v5k2c6uIbMSxdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udt1fbaIw7+u/kBiW+PlOwvsGK27pKZIQeuT72Zs2hg=;
 b=1ybeAh5SRvca/9EykacDDBzD4t92ADx2JvmG9O67lfvMmkGKrP+1hmVjwkNUHMMkbUrP6z7p+v7dUgxIzh2voZ8VnKmN/wpTPg6QOWzVu9Rri6bp1+1zJDnOHwrdbE2nfopwr0MYlZ+D+4tlkwrbpuKqHbRXTq/dk7BXrVhGUng=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f9fc3f4a-f5ff-4974-aafc-8229ed46b7d2@amd.com>
Date: Wed, 15 Jan 2025 14:40:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-15-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241226165740.29812-15-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|DS7PR12MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: d576f32c-7c9e-4c31-b94b-08dd359c71ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTlpRDFQMVNRZnpqbk1WYUs5TXViMnRwTG9SUi9Gb3BLbDVva05SQldOOERn?=
 =?utf-8?B?dEZZWHZ4d3J2YWtWbHR1U3ZyQysvODVhZzRROEdmN1ZKcnZ1dlJnb0RFTEVU?=
 =?utf-8?B?WkMreDRwT29qSzFOaFM2WUJVQkE5VVBjeTcvVjlYSVpCMGVJRHBRdGtZekdR?=
 =?utf-8?B?eWlhQ01pZFEwOExEMDZEdmQ3bkFtcndXM3Jtc1Vvb2hHejVZblRmYTUrWndw?=
 =?utf-8?B?SzYvM3d3MFNlL2ozUFdxMktaR2dJRUZPOCtqMnFQNmNHR2o4azV5aUhPR2w4?=
 =?utf-8?B?SjM0aGJPUlJoZHczTDRyVGxVamZYUTNaNS9Gdi9iMW1MeFVSVXJ2TWRwTlJq?=
 =?utf-8?B?RCthTFJRQzhhQzF6cnRaZTRWT3dGcUFjOFNhQ1BhMkNlaUFYWkw4a1pBNDY3?=
 =?utf-8?B?c2twR3V5YnhvcnBqemtxZTBqUzRraHgrUnNRQlZFeThXejhJR2UvYU5BY2p1?=
 =?utf-8?B?c1BWY1hMTUs1S2dFTDg3bnUrbXZSWXdPT3pGMzNydTZlRDhZa2JGUVFnMmFH?=
 =?utf-8?B?d1FCYmJsTnVzei9ZeDNNOFVidE5TQ3V4S0F6eFo1K1F3bUgwZ3Q0eHlHZUx1?=
 =?utf-8?B?dTdSQ3hITkoxUlRsN1FRb2VObSs3MGhrUE1tRjU5eUJaYmRBQWlCWGZsaHVj?=
 =?utf-8?B?bVJ5REpTbWpPSEViTEo1NWJET255alVRRmdwdTVpZnUwcTN1aHhkM3NRaGdN?=
 =?utf-8?B?eXcvd1ZyeWNNZkRDRXVHa3RTRzJkSWRHRkQ4WmsvbUJvdGJtajk3MjFXRGtK?=
 =?utf-8?B?SFRGMk81cy96QVpxcWVLR1BNaGhtMFVVZm4zNGF6VHk3SzdXWkYwaHVZdytp?=
 =?utf-8?B?N0J4RTRjSElVbmhlNU9FbW1OQUw0VjBnVWdkdUZpRFR3QW1zTkdseE1zQjVR?=
 =?utf-8?B?VTY3SDd5eTlsWDYreXhYRHkrcjQrdWt6Kzg2aGVrSWZsQlhLT0NFS1dXbmtB?=
 =?utf-8?B?dlJLMzM4RitBVStuOTFjY3hNbjVBMVUrQjRnK0RMenI2cjBLTENkUjhZQlhT?=
 =?utf-8?B?WlFvc0laZ1Vra2tIaEowQUR1WHVNeTFSUyswWjFlZ2dtTmJNVXNzcEZhcmdx?=
 =?utf-8?B?bUpZUGh5NGt6d2VLeTNNUGdlRHpjQUk2RkhGSHNMd3d2QjdxT2hFZzV3YmpD?=
 =?utf-8?B?ZXFLcXltaC92NVUvdktKMm5OZFEwMlEzMUFnUkJnOTNCVlBSeTZ5Tlk5UnNT?=
 =?utf-8?B?THdTUzJoLzBTNk0zS2JWc2tuSjk1Y2dWem5iejZmbWV6aS9lUkt1K1VqVTRm?=
 =?utf-8?B?R1h0Ukgrb09jL2swMzExdGY5UFZJUHJlSm1QR1VUSjJiN1pIK21XQ1ZPa09x?=
 =?utf-8?B?WFg4ME93QllTM0wvVkM1QUQyY2FoQXdobHU3aG9VcDgyOWlZcnB3bHRnZy9D?=
 =?utf-8?B?SzIwaGRnbFJSb3VSWVhrYUs5eXRLSEpoRnRPMmdwNndrVWxwZ1FLM1M5dkNr?=
 =?utf-8?B?YUNRT2psK2EzNEFOTk9PYnFCbU1IeS9kNStyekpZNHhHUS9ZSkFneHc0a0xO?=
 =?utf-8?B?UFR1blRNVFhwakNMMW9wQWNXTEpQYjJZL3dZSU12MGMxTnltRWhJNmtFSDA4?=
 =?utf-8?B?dE9HMUhIYTYwOStQYXdOUDlKS3QrZ0FnaStXbXhHUUZXdlRzd3p0aElZV1JT?=
 =?utf-8?B?aWt2ak92WFVCZDhoWGN1QlVOY1lwam5ObjJLcTBJTWdoMTFUcUtwZGRwTm5N?=
 =?utf-8?B?QldZNXZCVi9WREZVdHVFRHp1WU02cW1FcjFEbzJoekhtb2dVOEwvTWtaWU1M?=
 =?utf-8?B?cU9UeGw2RzdQcjdZOExPU05hVXhNbU85VlZmaWlieDFNYVpWdnNZbExjVHN1?=
 =?utf-8?B?R2h0N3NDVFlqbTdxUFhLTnRrTWtVTWRlUlBKVEN6cHRnenhoQXh0Um1rMEtQ?=
 =?utf-8?B?WWRWeTloK2I2UElXNlQ2dGVEdTJXSGVJazZCT3ZEdm9rU2FVS2VIek05aWlj?=
 =?utf-8?B?cWtuTnZUb0t5UzJrS3N0NkZyb2o0RHR5Mm9tK0c2azRKKzBMMXV0S0Z3YUZU?=
 =?utf-8?Q?xUJNxJDNMUPDWQGjafxlFWjqlSMsm0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 19:40:19.5303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d576f32c-7c9e-4c31-b94b-08dd359c71ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6141

On 2024-12-26 11:57, Daniel P. Smith wrote:
> Introduce the `cpus` property, named as such for dom0less compatibility, that
> represents the maximum number of vpcus to allocate for a domain. In the device
> tree, it will be encoded as a u32 value.

s/vpcus/vcpus/

I would remove "maximum".  Today, the DT only has `cpus`, and you get 
all of them.  So implicitly cpus=max_vcpus.

I could see a future max_vcpus property.  In that case, you would get 
`cpus` online and the rest offline.

> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
> index aff1b8c3235d..70a793db199b 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -147,6 +147,17 @@ static int __init process_domain_node(
>               bd->max_pages = PFN_DOWN(kb * SZ_1K);
>               printk("  max memory: %ld kb\n", kb);
>           }
> +        else if ( strncmp(prop_name, "cpus", name_len) == 0 )
> +        {
> +            uint32_t val = UINT_MAX;
> +            if ( fdt_prop_as_u32(prop, &val) != 0 )
> +            {
> +                printk("  failed processing max_vcpus for domain %s\n", name);

s/max_vcpus/cpus/

Regards,
Jason

