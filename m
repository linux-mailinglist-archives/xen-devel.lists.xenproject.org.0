Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F337921BC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 12:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595539.929140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdSs3-0003tJ-UF; Tue, 05 Sep 2023 10:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595539.929140; Tue, 05 Sep 2023 10:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdSs3-0003rR-RH; Tue, 05 Sep 2023 10:01:19 +0000
Received: by outflank-mailman (input) for mailman id 595539;
 Tue, 05 Sep 2023 10:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdSs2-0003rJ-Vu
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 10:01:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7d00::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27382ab0-4bd3-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 12:01:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:361::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Tue, 5 Sep
 2023 10:01:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 10:01:14 +0000
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
X-Inumbo-ID: 27382ab0-4bd3-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIrQF8pN6xH4lkk3KUSCtH1dGkV9JgMil3CUXhez3CON+BVH0weARSthx0uaNwCCavwbr9upy+Y/MZFkKOfP85WYAiuxHSPKTqcCOqRyciHpq0tn8+DuVGuG/zYl7ut9GHPN+2qmZhh8+2sKwRgJiMZsr9Rlhw+He7Y/cMbPUviazE/0/tDR7++J9ALQvTRA5HM0hTqh8ZDYhGbOqHL0jPmT8vNSeHhhDIuBb7uc9EzyS4bm9nVe7qA0Oa7UvCzUAhy15xY+/yU3P5m3aTm24rFjmN1iRCxSNamCkCi2U8+MHL99LGTqKSnb2W/ZDAxKbV9uk2Jt97wmbdIWjdkzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ct+2GTJx/tV4RjCTobD8cm1WfBCadZ7+XWHPybvZ2Y=;
 b=X8HsluVbZGp/eNvG6Eupu88CXby6ws+C8NfVutpGOzNzA1VcvV74dxdvPznK/4E0LuOqBtn48ngiRNiJa3dH2BoVAaLK+jhQgAiqC3Qom5uDkm97zUipNd6H1VvleceSllMRrp7OECWe/ddoY/CFvFHVmUJdiqmn/umbxWPDGWoagx/V4EWjgI3LCyO+0LhPO4uJRFayO/swbH5EZs6wUy3MrFnl7jH28/ne0qcLZjGLjmEzGVVw00sDlnZxIpZLHdfuXByw2XOHDTxWREHlGACacuybr/5iZ9VV6uLcr4ugfRGOkBuXImSomkaOdWNywUNtkQpLQ+xjcoMtuDD3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ct+2GTJx/tV4RjCTobD8cm1WfBCadZ7+XWHPybvZ2Y=;
 b=nuwpqjx6UptAW5dgmVbZXRBYKf6Wcs1KoYT2GL4mQ/Ejdzi/spkxhUHL5mbqg0TMBaNtRn67tnh1e/jkz/cGLzvaw1Ri0bs+Av6FeNkgMPfrADcUumPK39nS60VJXAJjS7n5B1AqXM5HdVjR8TYJxlAiOmzmP43/hdkrhnw0qawrSrGzVp40Us0cc42of+K4DBGs3yoIyQRojeYS6Nz4C/+HXz+adD35ZFH8BvgVtv9ZegU1T/urxK+ncADCC61zN/nbA62nOCUAXVNH2x9EloH8mwXFR1AgjuI82/nazHVfpualkO4U7DkpccD3fVBSONTJ2YJFLp8AfJSBZa22Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45081782-69cb-1b8e-7925-fd9fb4e3d0c4@suse.com>
Date: Tue, 5 Sep 2023 12:01:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/3] xen/ppc: Implement initial Radix MMU support
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1692744718.git.sanastasio@raptorengineering.com>
 <7cebc2962002c36ecfe712bf1bcb251e083910b8.1692744718.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7cebc2962002c36ecfe712bf1bcb251e083910b8.1692744718.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: 0212de84-a02a-4b8f-5b79-08dbadf709f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RlZmMTL8iCnJVXXgXttGzl3KaZKjYW3i4WG79vFg0obdxEjPp2XEbrXpO1GOvA6iSl2Dro2n9SQNGjGz/vIE/s31zHDPBtKiZ19dr6SdYwBh+45wSHNJBRa8KW2C/g+tkQKC+jiPNu4L0a+Itv/RXfycArZ3wBcfGFmeSXOegKAnT7S77EbZ46DGXflXF67558c5aKxxMLSN0CSPdcjyxlmssEXIW3hNv+AhJpEqsb0hDIGGyFXgno3+NOA7KAFKudqltRw9tkVAM6wx6dVxAVU7bvGWBwneThLXZnQeOWXRO+J8cEYjXyCxXGbjwikBOQY56xrcQ/pxnmDQzH4aYbzmUpnfejIKjF2jWki3dnx8qdRNq7P0ssyiy1S+0L9utaaJqUU45J9OaJNN3McFK+5qeS3oMzEMTj3bUe3xdlJRMOLM97AO48PQpcJ00VmahHyGdozOlMJ1mAyF1Q9+oUhei88a45lA/9FG30jTA8KZhryKbS9k6Kohid0wpLIdFxqpGwN/a32BBAtEDsatRVuxGIGLbomv0gQyCiF6qrsOqYnmIev6fFPIAFizpBirg8aFwrq5jmUBwI66m3OXs1pU26se0lUeJE8zNYJ7Iejlbp8T0dtIMQuD9kCtLz0/uWgt2mGVU8Pl9KgljhM6Zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199024)(1800799009)(186009)(2616005)(26005)(31686004)(6666004)(8676002)(8936002)(4326008)(83380400001)(5660300002)(6486002)(53546011)(6506007)(41300700001)(54906003)(66476007)(66946007)(66556008)(38100700002)(86362001)(6512007)(6916009)(31696002)(316002)(478600001)(966005)(36756003)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmY2a3FEekNpRll5cyt4cjBmcFpNTHg3emR5dXF4ZnFVMytsQ1lXMTdjYjlD?=
 =?utf-8?B?b3pNNDAwYVhIUGxlQlppeHdSK21qNE5LcHdGeFFoeGw5eFo1TmZ1MUNFQjZV?=
 =?utf-8?B?SERQcFZUWVlsaGkwcGRRQ3o5eUZVQWNRU1c2WURiTWtpMFdjZmtyaU9KVS9Z?=
 =?utf-8?B?UTMwMU5KQjdQVStKcnVoK3BSQlVqaURON3A4V2Yyb3dkbDkvMmhsbjBqMC9W?=
 =?utf-8?B?ZDMxZTVnZmpmWFkreEtvcDhZQ0x2b3I1MDZDSXQrUEtYbllTbW9FaGxVZmxY?=
 =?utf-8?B?NjY5N1hYd1pXWTdVN1dOY29YS1gyZXM1cVRkUUlya0ExeXZJNzE1SloxSVBi?=
 =?utf-8?B?UDFxNVI0RmVZV2R1ZktUclI0eUlLWjVpQ3prbFluQklCb1VCYWdFYk1EYlRw?=
 =?utf-8?B?VzZieW91OGxYdjhYRFUxSU5NbFZPSlNaRW9yckU3elpVc1U5K3lWMndSUUsw?=
 =?utf-8?B?WVN4eTFGWjZTa1FaYnI0dHYzVURCcDQwaEJNZUpmRzNwVnJ1QTN1VHU0NklC?=
 =?utf-8?B?NUpCUzE1eXI2Q2xEbHluZ2hnUDJyN2V6dDdCRk1TQW4zaFRBWVBDb2VxdDNH?=
 =?utf-8?B?RDZkeWUxNE9UVDBVRTBHQ01OeDN1eUN3QWE3ZjRrSnExOVhIaFoybCtPWTNB?=
 =?utf-8?B?SVIveE4xNlBhRUVOalhnY1JHekdqa0NReklJMWl4R3lQSmVGT1dXcFJUSUxp?=
 =?utf-8?B?YnpRK1RqZ2N2bk8zRndpWFIwWmdIZWdJUDlsQVZIMGFwc3E3bzA1cVFSSFBp?=
 =?utf-8?B?N1Z3Nlh0SElxR0doMFlkQW96MmV5d3FSMnIvNERYcU9IbGJ6NFIyczRvcGtW?=
 =?utf-8?B?eUttMm5oV05lbkJzR1hXRWdaSkxVSFRodUxWZ1V1dlgyMFpQSC9IaFlncGhu?=
 =?utf-8?B?emtHdHo4L0o3UXB2a2txTWd6dy9TSW5mL1ZGeEF4WE1FeHJMaHlRWXVNQ083?=
 =?utf-8?B?ZkFmZEVrRnVpY1NNRmlvYUJ5UzMrK1NhOGQyZmh2TWkzZmsxdXQ1NVphdEJP?=
 =?utf-8?B?d2dGZ3l1N0tkWkx5WDhBOE5QbjNReDAyYnRjeHFxTDlVaW4zcEptSUh0M0xj?=
 =?utf-8?B?QmU4Zm9VT0ozcU9keFp1MGZzYUcxYVpad1V6Vk55bGxROFN4aFRINUlJNDZR?=
 =?utf-8?B?ZXB6Z1k2dTJJVHdSRHVyMnZLVDIxbjJDRDMvbGJqUCtRREhNRWp5czJ3RWt0?=
 =?utf-8?B?Wlo3MzdDZWxMTUZKclp2QVkxTC80Z0JvcmhmaEhoZnRUanZ1WER3ZWxsK3ZH?=
 =?utf-8?B?UTU0aXFRQ0U5RXpnVjNCazlPY3FLcFZXRDRGbHc2RUZ1R0dBeGMzRko1Y2tn?=
 =?utf-8?B?Wk85cVhJNktSWC90Wk5ibUYyL0ZVMEtNbmkyTG1jNjNJb2RldFFaWnQrRERU?=
 =?utf-8?B?UnZQZnkzNTk0c1VHdzFzbzN5cUlFQUNKN1VDSWpDbTFPUEYvSWNIbk92Vms4?=
 =?utf-8?B?VWVpL1ZJYVZXa3RBUitRMkZSeC9lYi9sd0JhcXJpZTRxY1padVV0SXdLY1Fa?=
 =?utf-8?B?U0d1NmRpN0EyNks1ZmYrcGE4WkxseFNFSkhjM0NoaFNhR21UN3B6a2J2Y1lG?=
 =?utf-8?B?UjMvVzF5b2dkSGVXZ0lKczQ4OVdZWUt0NHQ2S2ozWjhISURJVGttUm55OFJx?=
 =?utf-8?B?Ny8vZlBkOUJIcWx0OFIvMGJhZUs1czdqTXdLenRoOEZSRXQ2ZFkvVzBMTG1w?=
 =?utf-8?B?TVFRMDlJdGJtejhBNXFNRGhCVnhvRU9VR1N4LzBlbnl2NWdRQ2YyRnZycEtX?=
 =?utf-8?B?YzVjMG1oalVCaXNaR1hMaW9FRVh1bHhFVjgycm1kSDI2am9xODQ4Q2RPeXhK?=
 =?utf-8?B?Z002TWprWFdEMVZPVkw4UTFiR1NVT1RUallzUkt0WUV0bnV1clkrNDBwcStF?=
 =?utf-8?B?dmFNTTVrRSt0WTk1YnFpaFZxRXlZM0VPN1dJSitRZld2Y2VXcm1CcHpqYmQx?=
 =?utf-8?B?M0FTZTh0enVsd2ptL0x4M0RZWEdJNHFHdlhSUk82SUovY3hIbEtWYnNoL1NC?=
 =?utf-8?B?TnVWbHVYOWdYK2dSNzlyeEhmWElRK2FDSThmaDB6SENCNHFlakZxSW85RTJt?=
 =?utf-8?B?Z1hIajBxb1dYTm1ZNzBjSWt0U3RtTlNjTkY1aW1sTEt2Z2JUR0IrYm9QS0dw?=
 =?utf-8?Q?nPC6r1qf/oQYW4GcJEgvezLds?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0212de84-a02a-4b8f-5b79-08dbadf709f6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 10:01:14.0266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjAplYN7rXtw0NigKZ8jFJfrXgMEMHbFU2KEKMs4v68ZYS3D7DTaL4NCZFxyQouE0uRBcZeH0TT9f8JtDebqRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233

On 23.08.2023 01:03, Shawn Anastasio wrote:
> Add code to construct early identity-mapped page tables as well as the
> required process and partition tables to enable the MMU.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Having committed this, something broke in CI. As per the artifacts of
https://gitlab.com/xen-project/xen/-/jobs/5017915681 ...

> +void __init setup_initial_pagetables(void)
> +{
> +    struct lvl1_pd *root = lvl1_pd_pool_alloc();
> +    unsigned long lpcr;
> +
> +    setup_initial_mapping(root, (vaddr_t)_start, (vaddr_t)_end, __pa(_start));
> +
> +    /* Enable Radix mode in LPCR */
> +    lpcr = mfspr(SPRN_LPCR);
> +    mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
> +    early_printk("Enabled radix in LPCR\n");

... this is the first message missing; setup_initial_mapping() appears
to be completing fine.

Jan

