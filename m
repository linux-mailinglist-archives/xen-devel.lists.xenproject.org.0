Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF3AB39072
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 03:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097279.1451680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urR3T-0007Jk-5d; Thu, 28 Aug 2025 01:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097279.1451680; Thu, 28 Aug 2025 01:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urR3T-0007IE-1x; Thu, 28 Aug 2025 01:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1097279;
 Thu, 28 Aug 2025 01:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urR3R-0007I8-GE
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 01:03:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:2418::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db64d393-83aa-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 03:03:50 +0200 (CEST)
Received: from SN7PR04CA0160.namprd04.prod.outlook.com (2603:10b6:806:125::15)
 by DS0PR12MB8444.namprd12.prod.outlook.com (2603:10b6:8:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Thu, 28 Aug
 2025 01:03:47 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::54) by SN7PR04CA0160.outlook.office365.com
 (2603:10b6:806:125::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 01:03:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 01:03:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 20:03:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 18:03:46 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 20:03:45 -0500
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
X-Inumbo-ID: db64d393-83aa-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxzFWYc7IIlTfS5uwEJDI29JYjUNEwPA9r5bK07Y8o6hZ/Ox3kiSXldfop8p0ZAmY5BbzuLum3A0fqokM4c7VM83Y18oqvLEYmnkmklLxu+UwAJHehZqe6O8PdMCHvmSUufCAF+0gcCKHanoWUv/FJxjsFQSgLwXrEGsnUWrm0RXtDGzqjcW/XNYagIAMEOxzlb68rONV9r/xsyI1e2jnZpF1raqR1HQ3X51LV/ztBbZ06ZYRGOgKcQr4fO8qdFRTTbjEMG5wOmLP2t3MdVZpIiFZbt25LOVEQwqJXRJN5kwZrCkEkZmo7J6qfe38C8iG7nyO/LRHj4888X0yPzgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1Ciq4GupciWF9egcdPDkIS13U2ubphnBrWufWE0OKA=;
 b=te7sL78JoTxOB14Qr3Zla+qwfoMZZr41ZF+4sh84pO+vc4mD6Vb6KsSkXRMk2GoWKz4cj4yYLai6ITFAVA3BH7TRZP7NeITyfHhPk/0VJ4SNBDv17bjOSCmmfRgJ50u1n36pH1SkjCMX1ivjKda5EwkjpRMT9ubmn1+MOlCx9meC9tdQ3Co2/D6gx814vSPzdknS7uPZDb9rmXa2AwmKOQ5vFXpl4FClhhDIoHS4SoElgGQ/x6DejRXcW5kVyl47hUoBCZe8IlrMfDdOu9Ww2+ZS0aOW5rUC6rA/DxZUqg4+Zaoo6B84vGGeK9e1jy0SyYrCcBf5SYtXeKhoVXsI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1Ciq4GupciWF9egcdPDkIS13U2ubphnBrWufWE0OKA=;
 b=1HRFg/IFe55N9bXgy0Qwr2TSXeowlzLrgvdRRul1KxAqfmEpLPm3zGh3DOt3Eb8IgFu4z6pvZd/hnL0cWxU3k/sxuh1xOVVGR9n1lOzV5JMeg5pdZ7s5/5/vuDofUcpxvSK6FrGO08NsdvJ4JUb1IhM1CgjHYjb1e1kXkrVbw9g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <24fd00b5-3053-43ae-8342-887eee94869a@amd.com>
Date: Wed, 27 Aug 2025 21:03:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] symbols: arrange to know where functions end
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <10e116c5-5a62-4abc-a52a-e2ca12118cfe@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <10e116c5-5a62-4abc-a52a-e2ca12118cfe@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|DS0PR12MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: edecfaf7-b8ae-44fa-a713-08dde5cebe4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWFSbnYvSW41a3lhS1Q0cnlsRUxUWXhDOG5HYTV3Z2l2TWFjVnRPek55Y3g4?=
 =?utf-8?B?R2xnNjZIR0tiYkQ0R0tlUER5LzJkV1JUd0FIRWZXdVViYWpnUGJuQlpNMHJN?=
 =?utf-8?B?QW43V01rb2lwNUhaOEhXR0FISFQyMVBXK1UvY2F6bWFoL1pmVXBRcTkrQVhq?=
 =?utf-8?B?V0U3Wlg3U3kvWWJTbHJiWkFXbkNXT2h4N1p6UDR5Z3VMQ1ZDYUZ6Skh5OVp4?=
 =?utf-8?B?RFpYbmxrU044VmNnekZYb0szMTg3ck1IY3Zmc3RyZU45Y0NMZFh0YXRBWi9h?=
 =?utf-8?B?Zi9JOGZuZEVGaGRkNDJKdmEwVnRzWkloZ2QreStmUVJvaXdWcVZlSEVKb0dG?=
 =?utf-8?B?QW5VRXJhQWllN3VMSXZudzdEUE9QWmgwM0hlV0hxTnhVM3JIM1lVWGdaUFFU?=
 =?utf-8?B?RHZEWGZpVHN6MmRBNHJKMkVmTThwSUk3UGc1U2VSQjQyQWdJdnFmdlU2SU5B?=
 =?utf-8?B?SmZ5UWtkbmFaQWJ4TDA5MVlLYzVqam5RSHlvK3ArL2M2OHJlZ3B6dzFkNFFI?=
 =?utf-8?B?L3poWkZHVERzRVVRL3BjUXV0Y1ZLdXh2bHpYcnJyVG00bERSRFVMcW0wY0pr?=
 =?utf-8?B?SU0xVjFjYWdmRkVvN1VFNkVmdEZrSS9JWExVNFp0RUMrcmxYOGpuNjVtS1Ri?=
 =?utf-8?B?dXRlT09VRlJqVlNNcnZsVk1wZkRpR1psR0V1NE8rSzdiZ3YwSTFzMEl4UE9I?=
 =?utf-8?B?OWkycTBWN1VvODJlNXd4NXZCaFNNZldUMDZMVzBjc2ZDWTU1ZE5LdU84YTRu?=
 =?utf-8?B?SDJGVjhkc3k5L01IMk1aWG9xZGd0ZFRZdDhSUU5jQ0dHV0wxMG1OWmY3SHhn?=
 =?utf-8?B?VUIzdjZGaHh2MCtJd3EzRHZZOTdReVJGYVNFNDBsWHh1ZW1yTW45dW9RVEcw?=
 =?utf-8?B?Unlub0hpMXJkZ24vWS8wOGNLRWVqV2NjbFpkWElZcGs0eHNVMHFXeTJjN25a?=
 =?utf-8?B?aHVZMEROSkVZRFRsOTJRY2FqQURVaitlQ2pkQVdsL2dMcVgxcGN1SHlrYXpG?=
 =?utf-8?B?SDgrbGl2VWl6NWRmUm14M1Y3dTl1STdHa04rZjhnNGR4Qm12dTVrcEhtcXNr?=
 =?utf-8?B?UGp0S2paZ2QwOXh2bFZUelgrMDF6S1dCZTU5ejFtT2NMSVBDSmdQZjNCUTJ4?=
 =?utf-8?B?T3l6T29QYldQZGJRWjVWNHdRSGFSUlpuR2JKQTMvVDdCU29VMUErQUEvNTRz?=
 =?utf-8?B?V083LzJ3bUVFSkZSRHY1b2czbFkyQ2MzbjlGVGEzd0FOZFd6ZXNTWFAzRXE4?=
 =?utf-8?B?RGRJbkNSZGl2K25kdU5YcndBdC82ZTBCRE1uOCtjK3ZMSTNIcTE2Y2I2S2FW?=
 =?utf-8?B?eG1uRUc2dGNGZGt2NEdpZlNvN1VjaWJ1b3JFQmR2MVJoa3BaeDl0eHJwVzda?=
 =?utf-8?B?R2JXeWZsSTFuL05IUGs2Z015Sm1qVmhoQnUxVzZvVmpVSFdFTWFJbHlxWmp1?=
 =?utf-8?B?SnA2UjNJQmxXNlJ2NDk4cEJsTzhLR1pqaThLREFHVjVPSldhUDZqckJBQmhJ?=
 =?utf-8?B?R0h3Zm84M2dDUHJmdUZuTjdMTWF2dTJmdG0wRko3bjBTTmNsRE5FNW1pSE1j?=
 =?utf-8?B?M1hzNHJMVlRKc0p2ajMxSTZidkE4T0VOMWI5cEp1c3RHWkQ5SDc5RHM0dWRZ?=
 =?utf-8?B?NFZlRGdEV2VJd0N5SnhIN0w5VWkrd1NMT1c5aXBaMEI2cWVvM0FiaExVTXBO?=
 =?utf-8?B?R0lobWZCaXM0TkhOaFBSV3VZd0V5RlJnY0piZWs1LzRtdXE4aWdmSzlBbHFl?=
 =?utf-8?B?NDZKNVJaSEtnMnlDQjFLZWNxOTk5dVlEaGU3TW1QcWtHa3gxaFE4MThQbllo?=
 =?utf-8?B?dFpKbWp4alFRMnlaWnR0VGFEYWloQWxoWXU1VFhYcXBSa1dXYzVEY3dHc3I3?=
 =?utf-8?B?V2dlcDRvRFVpSDZoOXVQdFhwVnZYcG5YYmZ4M2kzaDlhckxJQWg0cUJkRkRr?=
 =?utf-8?B?RmpXT3NNVTdSTDBBSDN5bTcyMjRGZSt1OTRSV2I0c2NCUXpFWTVTM2gwdnVz?=
 =?utf-8?B?a2lzSWN2VDVua0dtY1A2YzJKNEVydVNwNWRzYXNQYnRxSjBlOU5Xd2FyazA1?=
 =?utf-8?Q?nM9yG8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 01:03:47.4328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edecfaf7-b8ae-44fa-a713-08dde5cebe4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8444

On 2025-04-02 09:58, Jan Beulich wrote:
> When determining the symbol for a given address (e.g. for the %pS
> logging format specifier), so far the size of a symbol (function) was
> assumed to be everything until the next symbol. There may be gaps
> though, which would better be recognizable in output (often suggesting
> something odd is going on).
> 
> Insert "fake" end symbols in the address table, accompanied by zero-
> length type/name entries (to keep lookup reasonably close to how it
> was).
> 
> Note however that this, with present GNU binutils, won't work for
> xen.efi: The linker loses function sizes (they're not part of a normal
> symbol table entry), and hence nm has no way of reporting them.
> 
> The address table growth is quite significant on x86 release builds (due
> to functions being aligned to 16-byte boundaries), though: Its size
> almost doubles.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note: Style-wise this is a horrible mix. I'm trying to match styles with
>        what's used in the respective functions.
> 
> Older GNU ld retains section symbols, which nm then also lists. Should
> we perhaps strip those as we read in nm's output? They don't provide any
> useful extra information, as our linker scripts add section start
> symbols anyway. (For the purposes here, luckily such section symbols are
> at least emitted without size.)
> 
> Even for section start symbols there is the question of whether they
> really need retaining (except perhaps when producing a map file). The
> main question here likely is whether livepatch may have a need to look
> them up by name. (Section end symbols may actually be slightly more
> useful to keep, but that may also want considering more closely.)
> ---

> --- a/xen/tools/symbols.c
> +++ b/xen/tools/symbols.c

> @@ -318,24 +334,42 @@ static void write_src(void)
>   	printf("#else\n");
>   	output_label("symbols_offsets");
>   	printf("#endif\n");
> -	for (i = 0; i < table_cnt; i++) {
> +	for (i = 0, ends = 0; i < table_cnt; i++) {
>   		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n", table[i].addr);
> +
> +		table[i].addr_idx = i + ends;
> +
> +		if (!want_symbol_end(i)) {
> +			/* If there's another symbol at the same address,
> +			 * propagate this symbol's size if the next one has
> +			 * no size, or if the next one's size is larger. */

Why do we want to shrink the next symbol's size?

The code looks good - I just don't understand this condition.

Thanks,
Jason

> +			if (table[i].size &&
> +			    i + 1 < table_cnt &&
> +			    table[i + 1].addr == table[i].addr &&
> +			    (!table[i + 1].size ||
> +			     table[i + 1].size > table[i].size))
> +				table[i + 1].size = table[i].size;
> +			continue;
> +		}
> +
> +		++ends;
> +		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n",
> +		       table[i].addr + table[i].size);
>   	}
>   	printf("\n");
>   
>   	output_label("symbols_num_addrs");
> -	printf("\t.long\t%d\n", table_cnt);
> +	printf("\t.long\t%d\n", table_cnt + ends);
>   	printf("\n");
>   
>   	/* table of offset markers, that give the offset in the compressed stream
>   	 * every 256 symbols */
> -	markers = (unsigned int *) malloc(sizeof(unsigned int) * ((table_cnt + 255) / 256));
> +	markers = malloc(sizeof(*markers) * ((table_cnt + ends + 255) >> 8));
>   
>   	output_label("symbols_names");
> -	off = 0;
> -	for (i = 0; i < table_cnt; i++) {
> -		if ((i & 0xFF) == 0)
> -			markers[i >> 8] = off;
> +	for (i = 0, off = 0, ends = 0; i < table_cnt; i++) {
> +		if (((i + ends) & 0xFF) == 0)
> +			markers[(i + ends) >> 8] = off;
>   
>   		printf("\t.byte 0x%02x", table[i].len);
>   		for (k = 0; k < table[i].len; k++)

