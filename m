Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC05671685
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 09:51:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480229.744506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI49q-0005wI-FA; Wed, 18 Jan 2023 08:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480229.744506; Wed, 18 Jan 2023 08:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI49q-0005u1-B0; Wed, 18 Jan 2023 08:50:58 +0000
Received: by outflank-mailman (input) for mailman id 480229;
 Wed, 18 Jan 2023 08:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI49p-0005tv-6D
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 08:50:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38aec754-970d-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 09:50:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7291.eurprd04.prod.outlook.com (2603:10a6:102:8c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 08:50:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 08:50:54 +0000
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
X-Inumbo-ID: 38aec754-970d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ni5F42P38v1bF85DzMiPZOrUlWu/vqAbeO/q3SKWpNV7HQWHSwU/M4wdFq3WFGkk7Nr39e9OA2F7a8p3tN2D1I3Yze1uLZjwa93q2DOBZuixGFliDDxvxAUAtoYExJiomd7o3Gg5zqS3bl2WP1Pbf6yhOCygQSsz6y8s7aRa+/AfRue9QgvIm4n55CY+skLV3M3J8cPJYG+Ox8NSHXZdbI8aH1cjg7SlclqrLqZH5IvNe6E1m/hCwOg/eQLKbrOH09PSkgTINCRbUEhmBd+4pK3MQcW2KMhc1lREW40iWfysC3irRlsIZkir+eUFo8S0p4fmXvCvfaMEUj86gqy8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMP6Ax4MV+910RQf3bz23z9fo9ecWxfLuUkM/UYhYZ0=;
 b=h5DKwP4GQumEmHWa2z7W6aim23xTxgcOQtIGW2YzYby+t07XM8U3vaqEjltWNOKQ3IHWjMbka7zt8v0l0FLPU3ezZNxjmoX8rwiYFGlnpgCbo3eiMyirngsee7J/SPzHq2BB6Wapd/dBad1PyyYo/Fznswoq+qyhfgQmeHxdGlHiJQcadvGjgde6OSbiRn7PNCX8KCxNKC6Y0wZ1eofGbaRGlzZIXAeSAnGSgnjwVnALYU6KSgmktJ1rMXTSD13He1vDKhYxj8GDkDxDSqJH8xP48sFMvopaZh5ls3XjSFUtiBOae1awxGLQwfceM2lKOORyKgQItdhULFVbcIb/Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMP6Ax4MV+910RQf3bz23z9fo9ecWxfLuUkM/UYhYZ0=;
 b=l7Mo+GFLuphDlpcVn10zuBL5B356xLBF80uVnRF7pm9A5RAlIGj7+dnYOw3DFuZ+ummJ/2Wa4eZPHxaIzCEa6H2y7WalmSNjMXs4oQC1V08kKFrOnAez6CkaaX6RlFTMCKC4aJqXZ179pvX79mvHzbGtXHRDrs7G8CdOwBd8uoW4iF78myHk02OW9U42hShpFubc9VmrXCCyVNjCI7LQrlollC6mwk8YUgDnxwaO11A679oAX6CqtEnMIkXsBaI8fWNmqkaeB1PiWW/YMPPXbvxMluCiJcKYI2xxKsQsLb0DRJ4lwwiu5Jk813VsMmww2C8mZPpFwM6CbVsyDZ0sIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49228d15-3f0d-eb89-6107-40ae9f0b9b92@suse.com>
Date: Wed, 18 Jan 2023 09:50:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v2 09/11] xen/arm: Introduce ARM_PA_32 to support 32 bit
 physical address
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-10-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230117174358.15344-10-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb11066-e356-4f4f-1712-08daf9311b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mep/cw84cuirsrp23gweiyQYh2Q4/fgOVp3KJI70WHCuS55fXgRYQ0ovNEsvlGogG6D4PRzFtUBWX6DKYv1BGogMODs65rUIOHC5d4DPi/lfhOmdWvgFGDY1EgEDz6GtFb0F89ENWq4yKCzwGB0dPjkabjrkFuy/yl3pp+kgLUEX0vwW8p339PJuKkQlmqlhJzKZOAy8h2YgYOrG6FfhqKn0BEa9lWOixLS6JLXK0gyD9Ed8yGtqdZTEjVkEh0jKmFo60JoRULvsBmiEVBI6//QPMNzWm3fDhGdOJtDvVkp9xxnhnNO3MZ70pPiaY5VwLmpSo8JDU6XRDxphMZxoP0dJkhIBN5z60w9t6FF+cB22pT/I56HxDXpVsIpkrTsMz9IJptToxm7AtMhxCEnfWV/yX6pIJZZTMJYdgF7FEVw1yk8i5xN8F6i7ErNWrLwhdzk8oaYzDjHshtCb2CdZbz758NTyTN3Jt6V+6s/stfz2DL4hwsv8H7oIOpX3h1ArnlxK0y5KdVbvjlmkcZ5Y1iB69Ulk4p3y9Zn93nJlEpQPADTWGM8q9lDr5PHHieZMIpvkV2yZ1MszY+RNhfTEyApmabnzUGgSQWnuKv7Y6LdleZ/+oSROJChQcBmDhJjz3a6eQv/TRtqLbAZrZeooWZpsrwVHX96sGNbQ9GWtXFB0CtQMa0UxlatxDbrleTKVn21bdCAURUfFZanfWw/XcJ2kKt1GcYh8pm4p8W8f3is=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199015)(31686004)(2906002)(66946007)(66556008)(4744005)(8936002)(5660300002)(66476007)(31696002)(38100700002)(53546011)(6506007)(316002)(6486002)(86362001)(36756003)(478600001)(8676002)(6916009)(4326008)(41300700001)(186003)(6512007)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1FoeGk3RnV2Wm4wcG9RV0VzOGtTYVNOWG5sQURRcXpDYjJqUS9SM3M5UHNP?=
 =?utf-8?B?UFByM3doNGl6eGRPWWE5THdvWG5iODU4dVFuV2pYUDFMWE5WOFZRa1Y5ZWFl?=
 =?utf-8?B?cnh1WVJEZncrTlJhZTQrNmVFV2VvUFVmNzlQUmNkWTcrd0JlSUxBTnV1NmRl?=
 =?utf-8?B?YlJ2eU5CWGFJQmpWL0I2N2g5czJsU1lQYnZ0NU4xNWtoWVZ6NU56TFYzbmdH?=
 =?utf-8?B?elMxVTJENjBFTEhhYUc1aXFEa1ZjU29uMFJjdEw1UWVXWUsyWGdKUGNNN1Q3?=
 =?utf-8?B?Mm02WDdDTDIzeStrR3k4UFNQcy9pbit0c3p1ZVovT3Y2YmZORUhEcSt3a3RP?=
 =?utf-8?B?NnVROU9Melg4N2lreDlEa1Y2b05LK3hBVHVzL3BxWlZDMDYyYVJxYVFOWXRl?=
 =?utf-8?B?eXY3cWFiWGkxRVArRVgxdUxpV0o3VlpkN01iZzdBLzlDU2FvMHowZWFvUDRk?=
 =?utf-8?B?UURTNlRZVVJGaDRHTk9NZ0tneHY1dmZ2N204aUVYanA1Ry9zbEdGZGFPTjc5?=
 =?utf-8?B?OGVsMGlwN2VQOGNzQXFZYUE1MzM4REVha1dSYjRCN05zTU52b1NsNXUxZ0lk?=
 =?utf-8?B?Tnd6SEpDd2JUZ1BYMWRKM2FwOEtjVjl1aU1PVWU3QmRLZHltdGhtSGRaYVZC?=
 =?utf-8?B?QStJUk9OVmFWdGJoT2hhV1V0NGtER0VKQmxlUnFsSkhLeUZvRlBSb0xmRSt0?=
 =?utf-8?B?T3psMkdxRXlYcFY5YThVN2VlS0tqNDZKTVFqek1Vczk4UkdYeWI0RkJYdVhX?=
 =?utf-8?B?aUJQWGx4dUlMc1hXN0k0SnhrZ29YRmovWm1qMWxkeG0xNmhPTGRHMW9oQzZo?=
 =?utf-8?B?Q1pPa29YdjRmdnpNT2djSWNXclRjUEg3OStxbjBMUlpQRDIwdUhTWWRNZzFO?=
 =?utf-8?B?TzFrTnZCN1RlS2NHREEzRkRSdGxCR09xaFRzc0FQcldyK0dYaXRwejFkOWgr?=
 =?utf-8?B?YkYwRGRmdzVxL01wZ2ZGUGhaL3F4UnNFRXZPaVlUODRBS1R4U3FhSklLRnVJ?=
 =?utf-8?B?MWZZMEJlblY0ZkVkRlEyZkFyRWh4emZMWFNJbnZwV290eE1ZcGtRMFpsR0c5?=
 =?utf-8?B?bmNWWE5GWnFQdDlRKy9lQ1NZQ25keEF5SUJVc0FPRnN6eGpRYi9WbWNDOHJU?=
 =?utf-8?B?dURzeVpWMTZHc2N3eDM3KzhsS2JWdmtLTXVRZTlaN2RHNmFmUktyRG9Ebk5Z?=
 =?utf-8?B?bGFDV0JzakFQS3dXVXo3d3VaWnVpcm1mMXlUZ3BheVR3anZkdlVMUmV5RUts?=
 =?utf-8?B?aU1SaldIeVBIUUtMcUNuSU5ERUxXZFB2ckYvK3lBb0ZTb1RQb0hRbERibitM?=
 =?utf-8?B?ajROcXpoMWd2UDZBbDBkNi9aSDNOQktGM05UZWlpMWRET3B4SmFETGtzbFV4?=
 =?utf-8?B?Q3YwbXhNMVpoMDUvSE9BTWdxaEZndmpMSldROENyK2NkT3NnMnJobmU2NkhD?=
 =?utf-8?B?eGQyR2dnWU9NdTFkVDNsVjdkYTRBNVh6Rlluclp0WlR3MlQ4MHBQUEhkY1lJ?=
 =?utf-8?B?RXZIRVZoazRFaWpuN2krRFFpNlJqQXNnd0lsMS9GcFh1dVM1L1dzbHJScUFC?=
 =?utf-8?B?N21iMG1DRkxzOFNMODFISXZ3bkE4alZmUk5VSHJmUFltN0lPcTlFcklzVytI?=
 =?utf-8?B?SkdHUTZoNm5QT2pqU0pWSG5rRlgwTUZSQjQrT2ozU2haV2pRRUl0SUFmcDdZ?=
 =?utf-8?B?Zk54ZU0rN2h1YVkvOWsxTFB3a0hUNTBVY2FHYlBJU1JKOW9oMzNhNEFvS0ZG?=
 =?utf-8?B?c2xLWmRXamdka3BRTXhXd3NRRk9zbHdCdGNqUlMzQysrRC9PY2x4SFkvM2Ni?=
 =?utf-8?B?N0d0dnlDMFdTRFAyRTZvWk1CTkswSmhjYnJtdDB5WDVZZE1vODBXUFcrRHVW?=
 =?utf-8?B?U3BmSjlJcEh3YzE0UmxKbWhLN2JLNUpLYTdoVTF4MkNLcFBFSE9mY0RueHhU?=
 =?utf-8?B?eEFmbXByMXdnUHV4bHRIZjc4UVl6V2VwZm1NR3laeDdDVVcvSTRKakM3K2p5?=
 =?utf-8?B?YkYrZGV2Qms5SzZpVFRzOVBTUGFSRHpqNHhLaDVEbnJCUWcyV3QvSERmeHNZ?=
 =?utf-8?B?NExuM1FEWkdWbjhXZmg4bUNOK05aek5ZN0EzUm93MUtMVmFKdFVia0cyVElX?=
 =?utf-8?Q?Ms819adY6Z4XctMy6vOckLIll?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb11066-e356-4f4f-1712-08daf9311b95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 08:50:54.0628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DSTAlxQsNe+HofZC3n9ML6rFx7jIC13THC3ey88KaUNnHgyFQ8rBQSTVWrRq9jVE8rOSvZLrnxqI/x5t+mH0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7291

On 17.01.2023 18:43, Ayan Kumar Halder wrote:
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -37,9 +37,16 @@ typedef signed long long s64;
>  typedef unsigned long long u64;
>  typedef u32 vaddr_t;
>  #define PRIvaddr PRIx32
> +#if defined(CONFIG_ARM_PA_32)
> +typedef u32 paddr_t;
> +#define INVALID_PADDR (~0UL)
> +#define PADDR_SHIFT BITS_PER_LONG
> +#define PRIpaddr PRIx32
> +#else

With our plan to consolidate basic type definitions into xen/types.h
the use of ARM_PA_32 is problematic: Preferably we'd have an arch-
independent Kconfig setting, much like Linux'es PHYS_ADDR_T_64BIT
(I don't think we should re-use the name directly, as we have no
phys_addr_t type), which each arch selects (or not) accordingly.
Perhaps architectures already selecting 64BIT wouldn't need to do
this explicitly, and instead 64BIT could select the new setting
(or the new setting could default to Y when 64BIT=y).

Jan

