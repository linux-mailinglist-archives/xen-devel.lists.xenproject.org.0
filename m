Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A1D68EFDB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 14:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491789.761085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPkZg-0003qS-C0; Wed, 08 Feb 2023 13:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491789.761085; Wed, 08 Feb 2023 13:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPkZg-0003ol-9H; Wed, 08 Feb 2023 13:33:24 +0000
Received: by outflank-mailman (input) for mailman id 491789;
 Wed, 08 Feb 2023 13:33:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPkZe-0003of-Hr
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 13:33:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 260dfba2-a7b5-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 14:33:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8108.eurprd04.prod.outlook.com (2603:10a6:10:25e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 13:33:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 13:33:15 +0000
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
X-Inumbo-ID: 260dfba2-a7b5-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+G1cDwOPEVzu79Ql8tu+lYrtMH2znRDF4KJRGy7tDbJrmux2UFcWIkjc6TbOrTNOHeN/KgKT5p6iXo4fuB98UgNvaWlQiDqzK08rz7sb4KM9lekxfnIiIpERd1XAqf+/Yd/Vake6kzGOOwHwIb1yI5g1J5vhbibkuRPWPpMVu00DLMgWcIzO2loTqkisajiyAfwZMPaw5wur7GX159AkfL6/lzO5Qs++Q2c45+0C7qeDKc2ucQfbr6rxUL1IB/UVDeQXxZlx4RBXiyZn+d68c2nH0uG/lOEDVBuBf001JA86qWCk7XD/AmzOCRpIaGrc01etjg/j400KbqUKObjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7yzqllAbb4kLy8ohe30N8uaVTRIW2+hh/616DNZETI=;
 b=E6vm6b1SoJf8WI5iKcrM5ckfHBHSNQj+ZRsJOoJGssvGNsa3F9a3/D4ynTdenas4RDKhtEJF0QequYQ1vhnjkmCHy+92nT6DF2mjGUI+G8uOMjauTcCpLLTw4H0hXvu9aPvs+swpVDrqjfdLsVxmfNqc1p89HBlc6NaEpZdAuX1srfe/CdQXX01Dh35uBkNhpsYDFs9vYRwMr3Ce0aZeJSTuawZ3I9DBxhozRBE4G34QYEW/B9t/7vI4ydZRNZFpapow5Ff0DmlF2a+F3QOU7W9P9m0U/OhT88wK+72jrB/lqvMkrrV1PPckcBAh2wjK9Y96324vsJeldZhpmNuI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7yzqllAbb4kLy8ohe30N8uaVTRIW2+hh/616DNZETI=;
 b=qeM7v2rjbJg4K/mVDKTmTXfQZYjaQEV795Y6DPGm5o3/Mm662yDJiPAycUJtycQn6aZJYdSapBwd8vrg8ELOt1e7CjBUSTkqT2wvUul4bP/56jGX6+0c23T0AszyNuXvhb/y9GolnxMYWUxWRZGtCzA/LV7eS8Po72UCnOF/+Y4nflOUkyMb5yqm8zzIljdw8XLrTa1eJlIWHajUEszLnnPLnpa+ag0hD3Dm7MMADakPewJOOzD6VhjyQQjLEh7UhuEqT5WojnEVQNHale0clNEhPhrBuRCmto/B8QizYsMznxzQerzsRHY9q7mkgavIhLeuBUaLNUScKY/J5TnHSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c11f89da-9487-1e32-57b4-2ddd1142c6cc@suse.com>
Date: Wed, 8 Feb 2023 14:33:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN v3 2/9] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-3-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230208120529.22313-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ac2c45-1073-4950-a567-08db09d90833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mf7qNS/9CfnTMS2dWEYnwNuhEWyZ/JUdveQ+MXRK/mqUWUeksG3xiOpoCQ9Tw0QlHvgow45utHYQC6Ob4QgHqHaMYnQ3mFCdBzewD7LNN+9FlwHH/Pg8kBMw1rBHiJtd9rvvNQnfDTdIw+Jt7bEcKSjg6jmOW0PhICJTz8ltnRKkK4+7bor6snhdud8S16fiiRxxAfSLMDA7j7MiaHB44m5hBR0+wFleTnX4Tsxa7P5ZHDo1u60TNO9QuhFxtVGb235XO256ujenSiF587uEhrDG6+NgT0Sd0TqjcJ8qqUbp5AjtJr7mUu5fFwH4R2rVmdGfHdo3dhOHWEcvEyx67TczKUzR0KX+6eBVonwieFolb7hTBYa42W9UWLFfiBxi/WpvV01A66hclq0AJ0WkInZ/60m5bTGUtSHKd08qGbq+6ScPFbPUL0WfkdyQm8YljX6EkrHoZG2rv5aLJ3x0BH8/8lVdrNfMaRa7HqchrDgaphMKbwJnq1F50MfZBihFQq4DZL1jmwjNGlwgejwxt+AXCHijUe2hFXSXt0hhuQLW1vOB3gW6jPnmO3+pXpJffZaY8FZEO5iWgYkgUZkpiL5AuJjvuXhlMXEgsrt4IYeTDMNT6JDODaa1dnAIrc7MTjoqtUFX89H8Hk5TSGrk8rpag3VM4aabjUDth6X68DQx4EPh3zlCAWLeNjo8b5b/fl9SNzUSCrDxfX5OzoGH2FRXfhuQKd5pNcH/6pU3sdI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199018)(7416002)(6506007)(53546011)(31696002)(8676002)(6512007)(38100700002)(316002)(186003)(86362001)(6486002)(26005)(478600001)(8936002)(41300700001)(83380400001)(5660300002)(36756003)(4326008)(2616005)(66476007)(66946007)(66556008)(6916009)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDlSMFFnb2VQOGd0VjN2Q0xITXhGUERhcnVpRjR4cnpqcUpmWE8zRjhrYjdT?=
 =?utf-8?B?TE81cExpQUxWWExRRkFLczJGMVlFa2VLVEZMOWppdERXK1MzQ241TTNvR2Zp?=
 =?utf-8?B?ZWZQaC9HVk4vQVYyckxBdGtWSll5WklnaEg1eExKbUdFR1JUOVpjK1FZNURt?=
 =?utf-8?B?dVIrTkRERnp2Rk9vcm1TZlJCR091ZE8rVk9QSkdlUndIeGI2TmtuRkZoRmZG?=
 =?utf-8?B?V0grTmlWdms4UE4reGRKcFJ6NmJWUXVOMjF0VFZHSldiYVZabitTNUwzS0x6?=
 =?utf-8?B?RTJjbm1vdVNMbm5RMWZNdmlFaEFkbkxHeWtHV1dEcllBOTk0QURpMVBaMDFC?=
 =?utf-8?B?RnREeTQ2QzJsZUNXeDI0L2dHOVhrMXRwY053N1VBaVA0cVEvdC9jQ2p5blkz?=
 =?utf-8?B?cFUyZWQ5YzZLb1lIOE5NNjhQSTBGOVU1bDNIY2tOZjE2VE5DODJtcVN4dnZE?=
 =?utf-8?B?ekMySTZhZVlYNUc5Sjdwa3F1bVV5YVQ3Rlg1Z1pJTk1NM09hTkZ1N0FXek0w?=
 =?utf-8?B?Ukl4RUZ2Q0ZTaGxoSDd5MWFOendxakxOa1BnUHJNWGV6Wk5LMHRKQmpCNC9O?=
 =?utf-8?B?NTVjWm55SGN1amlqRllXWWVDQ1p6NkVNd0dURE9BZUkyTWhNWm9NMDFwK1A1?=
 =?utf-8?B?UkhRd016ZGl1VmRMSEw2bVM3MGE0T3Y0S2pWSk41dTVNVDFjVVNpNVBTVXFh?=
 =?utf-8?B?bmxjK0tHcUJReWxQUExYRlk0M1pOUlZtZjlFZVVmRlFobVMzVEdQdUF5RjVK?=
 =?utf-8?B?YnFhTjZMRDk3TmpKYVlxb0hXTVJIQWl4OFhZYXU2WEtldEgyK3dXMDIzcE0z?=
 =?utf-8?B?M29xOE4ramZRMWVFVFFvaVVub3lJQ2hDUUsybWdXRlNBWjYwWXM0QTFZRjVv?=
 =?utf-8?B?L00yVXB4Mmh3ZVFIZFRKUmNZM0NWais5WDRUWU0wZjcreldkcWFGRE1DekFB?=
 =?utf-8?B?akV3K2lpWSsxK1hsNGlKeFl5M0lmemxJK1BPUzBhc1F5SEs0UWhzVUZodTlL?=
 =?utf-8?B?QkNvejFmbGZuRk9FMVAyOXJJTmpidUZtV0hhVVdSNmlGc2V2Ukp2RWVUeHh1?=
 =?utf-8?B?eitoRlRqeWV6Nkl3eGVUcDNWci9xMi9sQ1dMWk5lNStyMVVTZDJKM1lld01i?=
 =?utf-8?B?NCtlV05IS21qRUYyWS9VMDcvc1o3SjhMOExPcDB0UVNUMllsWmRJb2J0U29s?=
 =?utf-8?B?bVJrSGdwQlRrb0lsclBkRVJGd28wdFVXbFYraVBjN3RVMytKY1poUFZxdFFm?=
 =?utf-8?B?ckhjQ1Fsa1ZKNm00cWI4bzI5U1FrWmNrb0FZTHExNW5wSlg5N3pYZjhONnJi?=
 =?utf-8?B?eFZMNVpCL2xVMjQ1ZGlyTWJiUksrVjg3RVhMeVhTeVF2QXJPNzM0QmFMcitP?=
 =?utf-8?B?WDhDRlhPQzhHMUhFOVBYWUZGdUdqdHpQeUF0S2xzaFIyY25Gc2dyclBFY3d5?=
 =?utf-8?B?aGwwRFlIaGE2aEJlTkpIS1ZZZFdGTnpLWVZOWXN6R29TSUo0OWRsd09HdEpN?=
 =?utf-8?B?NXBvL3dPRHA1NXQvbDRocjBvUTNMbUl0elY1ZkcxWFpvRkcyQ0FCWHJtcXl3?=
 =?utf-8?B?aWxPV3FBWXp5ZUNQcGo3NUdTcHE2SUlBdjZoUVI2R1AzUXNKcTRGZjRhZTJy?=
 =?utf-8?B?Wi9HbUdZVWtRa0lCbkU2b21HWk1sbFU2SWxIUll5NnAyczlTajcwS3JxdmV2?=
 =?utf-8?B?a3NPeXVoMGxmWmV4SzVvRnBRMXlHeHpkK25QTHc0aXc3OGJVZ0ROVmdaMkIy?=
 =?utf-8?B?WHNpNWV6ZlgzdzgwaUZhRytoN2NsYTA5U3B2OXVQTFJsVXVHQ1dzcW1qS2VE?=
 =?utf-8?B?RHBaK04zdTBSdUdwRW41T1YwR2ZTS0dkVGprRDFsY0lJVk1Ub2oxVXpvaHB0?=
 =?utf-8?B?NkJ5dUhSNWorVDZ5Y3c5ZzRuTzhCSWg1NG9PeFdYSzdzUnlVUnNKKzlES2VT?=
 =?utf-8?B?UW90TlVGK1VNMEpqT05Ra29KNmZGOWVlN2x2eG5IN1FROFhFQ2d6VUM1bFgy?=
 =?utf-8?B?aWJqdVdiQ2tVRVViNjhFbnpUN0FBQXRVemxxNnhuemxoNmZTSDJjYmdSMlI4?=
 =?utf-8?B?YlN3RVJQTThGRFVoK2R5RUxIRzJrbUtXT0wxZDg4bFVIZ1p1SmFJVk9sQzJh?=
 =?utf-8?Q?Peg/3Pp/etiY58ALOhiIBfVlT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ac2c45-1073-4950-a567-08db09d90833
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 13:33:15.5400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1dHdAHKRKaTb7YSH4oG7tySZA7kOF/B04faGEzRZy71RdDNU3FbQUaBsz+qIhmP3hGbNGnfRgQcMLOVgrE74Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8108

On 08.02.2023 13:05, Ayan Kumar Halder wrote:
> In future, we wish to support 32 bit physical address.
> However, the current dt and fdt functions can only read u64 values.
> We wish to make the DT functions read u64 as well u32 values (depending
> on the width of physical address). Also, we wish to detect if any
> truncation has occurred (ie while reading u32 physical addresses from
> u64 values read from DT).
> 
> device_tree_get_reg() should now be able to return paddr_t. This is
> invoked by various callers to get DT address and size.
> 
> For fdt_get_mem_rsv(), we have introduced wrapper ie
> fdt_get_mem_rsv_paddr() while will invoke fdt_get_mem_rsv() and translate
> u64 to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as
> it has been imported from external source.
> 
> For dt_read_number(), we have also introduced a wrapper ie
> dt_read_paddr() to read physical addresses. We chose not to modify the
> original function as it been used in places where it needs to
> specifically u64 values from dt (For eg dt_property_read_u64()).
> 
> Xen prints an error when it detects a truncation (during typecast
> between u64 and paddr_t). It is not possible to return an error in all
> scenarios. So, it is user's responsibility to check the error logs.
> 
> To detect truncation, we right shift physical address by
> "PADDR_BITS - 1" and then if the resulting number is greater than 1,
> we know that truncation has occurred and an appropriate error log is
> printed.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from
> 
> v1 - 1. Dropped "[XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the translation between u64 and paddr_t" and
> "[XEN v1 4/9] xen/arm: Use translate_dt_address_size() to translate between device tree addr/size and paddr_t", instead
> this approach achieves the same purpose.
> 
> 2. No need to check for truncation while converting values from u64 to paddr_t.
> 
> v2 - 1. Use "( (dt_start >> (PADDR_SHIFT - 1)) > 1 )" to detect truncation.
> 2. Introduced libfdt_xen.h to implement fdt_get_mem_rsv_paddr
> 3. Logged error messages in case truncation is detected.
> 
>  xen/arch/arm/bootfdt.c              | 38 ++++++++++++++++-----
>  xen/arch/arm/domain_build.c         |  2 +-
>  xen/arch/arm/include/asm/setup.h    |  2 +-
>  xen/arch/arm/setup.c                | 14 ++++----
>  xen/arch/arm/smpboot.c              |  2 +-
>  xen/include/xen/device_tree.h       | 21 ++++++++++++
>  xen/include/xen/libfdt/libfdt_xen.h | 52 +++++++++++++++++++++++++++++
>  xen/include/xen/types.h             |  2 ++
>  8 files changed, 115 insertions(+), 18 deletions(-)
>  create mode 100644 xen/include/xen/libfdt/libfdt_xen.h

Can you please avoid underscores in the names of new files, unless they're
strictly required for some reason?

> @@ -53,10 +53,30 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
>  }
>  
>  void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
> -                                u32 size_cells, u64 *start, u64 *size)
> +                                u32 size_cells, paddr_t *start, paddr_t *size)
>  {
> -    *start = dt_next_cell(address_cells, cell);
> -    *size = dt_next_cell(size_cells, cell);
> +    u64 dt_start, dt_size;

No new uses of this type (and its siblings), please. We're in the process
of phasing out their use. See ./CODING_STYLE.

> +    /*
> +     * dt_next_cell will return u64 whereas paddr_t may be u64 or u32. Thus,
> +     * there is an implicit cast from u64 to paddr_t.
> +     */
> +    dt_start = dt_next_cell(address_cells, cell);
> +    dt_size = dt_next_cell(size_cells, cell);
> +
> +    if ( (dt_start >> (PADDR_SHIFT - 1)) > 1 )
> +        printk("Error: Physical address greater than max width supported\n");
> +
> +    if ( (dt_size >> (PADDR_SHIFT - 1)) > 1 )
> +        printk("Error: Physical size greater than max width supported\n");

While I assume you wrote the checks this way to avoid "shift count too
large" compiler diagnostics, personally I think this is making it
harder to recognize what is wanted. Already (val >> (PADDR_SHIFT - 1)) >> 1
would be better imo, by why not simply (paddr_t)val != val?

> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -71,4 +71,6 @@ typedef bool bool_t;
>  #define test_and_set_bool(b)   xchg(&(b), true)
>  #define test_and_clear_bool(b) xchg(&(b), false)
>  
> +#define PADDR_SHIFT PADDR_BITS

Why do we need this alias? And if we need it, on what basis did you pick
the file you've put it in?

Jan

