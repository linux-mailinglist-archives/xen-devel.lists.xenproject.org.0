Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1269E4F0E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 09:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848973.1263723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ6nE-0002VA-1x; Thu, 05 Dec 2024 08:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848973.1263723; Thu, 05 Dec 2024 08:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ6nD-0002Ty-VF; Thu, 05 Dec 2024 08:00:59 +0000
Received: by outflank-mailman (input) for mailman id 848973;
 Thu, 05 Dec 2024 08:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtMJ=S6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tJ6nB-0002Tk-Vu
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 08:00:58 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2009::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d4dcfc9-b2df-11ef-99a3-01e77a169b0f;
 Thu, 05 Dec 2024 09:00:55 +0100 (CET)
Received: from CH2PR18CA0036.namprd18.prod.outlook.com (2603:10b6:610:55::16)
 by SA3PR12MB8804.namprd12.prod.outlook.com (2603:10b6:806:31f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 08:00:48 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:610:55:cafe::34) by CH2PR18CA0036.outlook.office365.com
 (2603:10b6:610:55::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.11 via Frontend Transport; Thu,
 5 Dec 2024 08:00:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Thu, 5 Dec 2024 08:00:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Dec
 2024 02:00:47 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Dec 2024 02:00:45 -0600
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
X-Inumbo-ID: 0d4dcfc9-b2df-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jw05rkG7lehNWehSKdCrtzkIQxD/onDEKfW95A431NAclux8vvttH6cyqIlnfrAaRsMhUvjXJMNrfxeKZFymdlvojxXRCFO136Ijb3zckFYvghwF49/ZJALcBWhn3hB9xtT650VDLkLCwoFenkoEqhikqK6ql8Z7HqDCvSNo5hVtzoSoAOBwIx5J8xwU1GJ+Hle23rCcHDqjGhGuP2GssvKDArw/3ApWjPZ/3qBFIcc8GWaOeq26d7af5BJ/r/hyI5+P2TcIVxeNKyIEyacgF/AQg7HUo8Was9EPW/IJ64SvpkzImowYQeXHouWYRkaAeP6PYbBnKvAJBzHuNWcQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plQNE6TWr7v7kQSdtLfGstmPpnq1hrQ6jr0kiD+3wJQ=;
 b=fRxpOl5ViMBwVbmc8/NRNKNXMy5R7kAgOP/8K3lfI8KqfkKnb6AaK7FSDH1Rmrs7Z9TjzHN18ZZ4MQi6X1q94Ru4WFE1Zf0jsk5POb5RtsO7VknUR48+xtS+zoOc+SKQChPSKmD/PErKa0l4u7CTSKwFW6s5puCoyNPDgY1O7H+Ew57JPXCKMb8jDqFWBkclfzhnrh5JmGPksvmSBirZmB+lkjtPS/AcApDjSQo4NYkHRCl+jtR7U0g/A1HHjZSLuM4yazgbutsvzAm9gqRk/pnsL0kIBgmQ+Wt+2nDhTQPJuO4eZRotUj7Dz1V4rEc3qEuLB6g63SiOvWXiCBf6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plQNE6TWr7v7kQSdtLfGstmPpnq1hrQ6jr0kiD+3wJQ=;
 b=CuXV1VZJQIEaEfNtJC7d2E4BQWdgpjOTCXKuTnJ5xCvLvHx+BMBoeS5M/rvctmsPw6JVp4D4NQIHKNTfjZcGzgYbRCiDiTsHF7Ox9Xuv058pcyHeXasIDNqyjgrpFfmtnaDIUMlgO1rmK0X75ecCDxsdNKC1a0XHxw7Xeo14kow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <201c8fb0-83d5-4647-ba4e-6c8cf60c0ed5@amd.com>
Date: Thu, 5 Dec 2024 09:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/12] xen/common: add cache coloring common code
From: Michal Orzel <michal.orzel@amd.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-2-carlo.nonato@minervasys.tech>
 <a5c7fde4-6db2-4c34-b4d2-7c5ec5a4cc0e@amd.com>
Content-Language: en-US
In-Reply-To: <a5c7fde4-6db2-4c34-b4d2-7c5ec5a4cc0e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|SA3PR12MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: afeaaed3-5a35-425a-45df-08dd1502eda9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHllcm9YdCtMUi9FYi9ocUdqNHNRekJZdi9vZDRkaGtXb2NVeEZLTkZkNllK?=
 =?utf-8?B?N0JZK21pakpIaGZ0dU95RlNKaWVwdDNjUUl4N2Fia1lYZmhuYXB1eVEzaDhx?=
 =?utf-8?B?MjNvZ2UwcnRGODBDQ0FWSnpoZmhtaUZUS2wxR2xGaTZzdWUyYTcyTDJOZ0ti?=
 =?utf-8?B?TTkyaHZtN1pTQllLUDNmSWdSRmtjZHcrVk5maUZuSHhGZVg3Y2UvcFdKWkpI?=
 =?utf-8?B?NXF0ZDhJSnpyNWQrV3ZrWlBpbUlRYk01cHNlaU9ERUpSemd2cjdSSHhyT2U0?=
 =?utf-8?B?NHdNRmdsYklRQWUrSDg1UllDZldoY3hXbTdwWkVMVHBJb0N0S0ZmT1h5K1Nq?=
 =?utf-8?B?MDVLT1pzdm1DdmRJekx3ay8rRUJsdytHVzRQSm8xT3ZTVVdtZjlzNy93NnAx?=
 =?utf-8?B?ZGF6cVdmSEhDN2N5eUtKelYxczJ2eUhTbWRqc0N4K3pOayt5elhGUHcrN0Nw?=
 =?utf-8?B?clhDZjZLOW90TjdtV2JwL2dhYlNEQ2xqZGtnMzRpZE5pc1d4WmZtSnNFOHYz?=
 =?utf-8?B?YVBkRG4rU3o1U2c0Z21mSmRRbnIzSGtDVUdlcWYrc0d3c1kzdlJSRTEyL1Fn?=
 =?utf-8?B?bmZxcTROU0Y4UXRxMHVDMUJrcjNxekNtZ3pWOW4yeXQzWHpMUkJzb1lSUGw1?=
 =?utf-8?B?VWoxZWV5Mnh3aXlyK0Ric0JqWEx0d2JoeTVVTTJJYWFYUUFiYU1RcmpSUmV3?=
 =?utf-8?B?VWFSajE4RnpMR0hYbHVaZmF2TmV5dERuSStPeFhBa0JsWE4zM2VMTy9JcUFq?=
 =?utf-8?B?Rk15K1psOUZZWEdVaklYTjcrem43S3hmS05nd3ZuODJBdmpTNWhJM3BuUkFr?=
 =?utf-8?B?Zi9nNE5zR1RWNFdBZy94VU1aR2V5eFFjL2xIbTdBR0lZaFJVdjR0RDVvcEk1?=
 =?utf-8?B?N2hTMjdNODY1Y3BPdzl3TlZSMzh0MC9ZNzVEVWx1MW1YNkFrM0xoM0pwUStt?=
 =?utf-8?B?NE84b1FoUFIzbXRQZlJieVNyWGhoeU8xTVZhVjhEdURLWEl4MUlkMGkxRTJm?=
 =?utf-8?B?THArUXIreFVkVlBSZUUvVnpTcHFvUFJ1dmZwc0ZVSk1Lc3NPdEFRcnQ4Z25i?=
 =?utf-8?B?ZW9FblNmQnpZVHFxSFVveUduM3FXc1ZnMElUOHJwemdxc3NqNElzNW5IdCsz?=
 =?utf-8?B?UTk2S0xuYlZ6QjVLMmh0TFVnVnhRMjFFVjduT0pkbE80OWlSZzFCdEJNaWx3?=
 =?utf-8?B?SWFMZ1NIKzN3dU9xMGM4Z1cwTnFmcEtCc2RFTExHQ3VQUFJVcWlvNS9DUHVI?=
 =?utf-8?B?TnpqOFNXTGlwa3JXNHJJVXJ5SFBSbDVqa1Bka0gwTTlKM2ViaXpLOEx6RmNu?=
 =?utf-8?B?S0Ywdy9QVjBUSXpEWktFKzRMZXg2bFpPV1RSZHVqc0VtU1pVYm5yRlBjd3Jr?=
 =?utf-8?B?UG91bGpUdmNSOTdvUUhxaXlFN3RjRmxNZWV2N1VTTldtVWNnK0NwclhvaElJ?=
 =?utf-8?B?VXA5TVR1M3U0cUl3MFlFSHlFTmFRNXZhcjRPUWFqS2toUFN4VStGQjB2enZI?=
 =?utf-8?B?MTU5SUZTSXJXWDUzL0tDUWVSblNoakg5M21YTGdYMW5TZkFkb1d6TTB2NTdO?=
 =?utf-8?B?c2E1RFRjaG05dWJCUXMxQWlDR254ZUtXSEZQS1dHTG5Nb2ZTTlVReUhVSmNT?=
 =?utf-8?B?UkxWa1V6QmhRL3U5Uk9MaUVLS2NNcXgrd2xWSVIxREVOdEtFYll0N3FOZ2JC?=
 =?utf-8?B?SllhUWNXU202MlR5UlJ2eEFwaGFaMlRhbFhsWVNXdDFQS0UzYzJNTXZ3RnVk?=
 =?utf-8?B?ZmN3WXN1TjZCNGRoUmpZTFNobmdkNm5oTHNLcnZpNHBSRGN4eHJzSDZvenZZ?=
 =?utf-8?B?SmNKalVhUWZwSW4xSDluQi9MK3oyYW9nZEZhSUZCOVhxWm1ON3c1ZEtEaW1O?=
 =?utf-8?B?RmhHNk9PUmRSdHd0OEdXNUZ1RmtZNzNxWlBoTTlqNDA0bVNXQklUaGNXeXBs?=
 =?utf-8?Q?xfbJvho88BDM9Smik1O0AhpnlzOApkWM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 08:00:47.7108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afeaaed3-5a35-425a-45df-08dd1502eda9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8804



On 03/12/2024 10:55, Michal Orzel wrote:
> 
> 
> On 02/12/2024 17:59, Carlo Nonato wrote:
>>
>>
>> Last Level Cache (LLC) coloring allows to partition the cache in smaller
>> chunks called cache colors.
>>
>> Since not all architectures can actually implement it, add a HAS_LLC_COLORING
>> Kconfig option.
>> LLC_COLORS_ORDER Kconfig option has a range maximum of 10 (2^10 = 1024)
>> because that's the number of colors that fit in a 4 KiB page when integers
>> are 4 bytes long.
>>
>> LLC colors are a property of the domain, so struct domain has to be extended.
>>
>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
>>
>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>> Acked-by: Michal Orzel <michal.orzel@amd.com>
> 
> [...]
>>
>> +### llc-coloring (arm64)
>> +> `= <boolean>`
>> +
>> +> Default: `false`
> By default, it is disabled. If CONFIG_ is enabled but ...
> 
> [...]
> 
>> + * -1: not specified (disabled unless llc-size and llc-nr-ways present)
> the user doesn't specify any llc-* options, LLC feature should be disabled.
> In your case llc_coloring_enabled is -1 and due to 'if ( llc_coloring_enabled ... )' checks
> all around the code base, the LLC will be enabled even though it should not.
> 
> You can either set it to 0 if (llc_coloring_enabled < 0) and other llc-* options have not been provided
> (this would require modifying this comment to provide different meaning depending on the context) or
> you could do sth like that:
> 
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> index 2d6aed5fb4ac..560fe03aa86b 100644
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -18,8 +18,10 @@
>   *  0: explicitly disabled through cmdline
>   *  1: explicitly enabled through cmdline
>   */
> -int8_t __ro_after_init llc_coloring_enabled = -1;
> -boolean_param("llc-coloring", llc_coloring_enabled);
> +int8_t __init opt_llc_coloring = -1;
> +boolean_param("llc-coloring", opt_llc_coloring);
> +
> +bool __ro_after_init llc_coloring_enabled = false;
> 
>  static unsigned int __initdata llc_size;
>  size_param("llc-size", llc_size);
> @@ -147,15 +149,17 @@ void __init llc_coloring_init(void)
>  {
>      unsigned int way_size, i;
> 
> -    if ( (llc_coloring_enabled < 0) && (llc_size && llc_nr_ways) )
> +    if ( (opt_llc_coloring < 0) && (llc_size && llc_nr_ways) )
>      {
>          llc_coloring_enabled = true;
>          way_size = llc_size / llc_nr_ways;
>      }
> -    else if ( !llc_coloring_enabled )
> +    else if ( !opt_llc_coloring )
>          return;
>      else
>      {
> +        llc_coloring_enabled = true;
> +
>          way_size = get_llc_way_size();
>          if ( !way_size )
>              panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' missing\n");
> 
> I think that this would be better in terms of readability.
> 
> ~Michal
> 
> 
On top of my previous comments, attempt to build patch 2 with LLC_COLORING enabled results in a few
build errors. In general, this should be avoided to allow bisection. There are 2 issues:
 - error: invalid use of undefined type 'const struct domain'
   You need to include xen/sched.h
 - error: unknown type name 'int8_t'
   You need to include xen/types.h in a header (regardless of whether you stick to int8_t or bool)
 - implicit declaration of function 'isb'

~Michal



