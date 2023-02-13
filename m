Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E6694676
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 14:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494455.764525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYTe-0003cC-W7; Mon, 13 Feb 2023 13:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494455.764525; Mon, 13 Feb 2023 13:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYTe-0003Yq-Sl; Mon, 13 Feb 2023 13:02:38 +0000
Received: by outflank-mailman (input) for mailman id 494455;
 Mon, 13 Feb 2023 13:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRYTd-0003Yk-Ey
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 13:02:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2043.outbound.protection.outlook.com [40.107.13.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af0386a7-ab9e-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 14:02:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9341.eurprd04.prod.outlook.com (2603:10a6:102:2a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 13:02:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 13:02:04 +0000
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
X-Inumbo-ID: af0386a7-ab9e-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MI+tDXM/bFLCaWjNM7xK3WO/r7EbrheAnJp+iQZt14rZ93/QaaEz+X8sG08CBILU3cuoZAQSR5h+Gfr0Uq6PeV9EgpHbeMrb4frfIGz2oNf2mTAStcFIkeV0do+H+b3SR4X0JmGwc3TfFvsuEES/DLZNlBIgJY7Aa2B0eRxNbupSuOvyEvB2YEUm39IfyQJ0hvorlMfkt85cMdQAIVke8ctFwMHVET43JuK7AX35YyygOUWHFhuRnKIc30+TPflDjYX23dNqckmwE1bydUPal/pfJFnPV5savcs4rlOCwdJ9z3GtZki2UBDKkCtlfnXhbDODBraTNXZJF9ijrcEdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pogx/lqPTjqX7PW/pwy+rcn4gQE3t8tp/UEv8pTWbZ8=;
 b=CLB7Z7s4cYN9NJLpQDUvaF1o/zImjt6S0f7tdePJtK4QzLsrwn107uelHGby7izLlaLJhUbICpHSY2/t8dKKII/ugUY8agQuNKTYKFAN6CABNaJcCT120+2E2WJPy62cMfJ44RExiQOuJlBeBXpL07vX2INaonTbrwODwJYxASqrPRMaXJfcQByRmvzWU7DnSyGbEaHHbiWwEwf3ZY55AUqJGH1dZHESD5pdhFx4fibek4ZM9aS/XlVXljoMW9iL5kCKXSwp58MlcMoHBBzgF63FJ5D1m/ueFSt0jGAYSIvw2qYNWYGKZZOMdtwcSQWU/5Dx/cuHkQfX/r+kcA1LHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pogx/lqPTjqX7PW/pwy+rcn4gQE3t8tp/UEv8pTWbZ8=;
 b=akOoRRzZ65X++pgdok2oHQdX2OpBR6/A/7bHBy9EqYPuYoV1hPrRWvP33AP4c3Fe6Sl1uQ7Q0OZ79/DELffzPOUtKkr8l9SiwzPWIMR8Fo/7sVAzSPtA/sp4JKV2dfhpp4lyCpqJJAvQxTLBiP7aAlyoMbFCaOR7ShH5k4JiXWauKT8CiSPKX5iKI8PJznCWy2tta80J/19KtsuejOxQl1LxenTk2hslDYEcma8aj6u61KoJAVH/ntynGPC6TtO/DcuMwOpdrL9EUA2oetwtfj4ikrwVYnwI/m4oaebgJISEuYNzxOvVuBn+ZOKjNw3XDrueLzJynhLK7AajVCAD+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77deb11b-e460-ef70-9710-90b13c88b680@suse.com>
Date: Mon, 13 Feb 2023 14:02:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 2/4] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <6c8b46f2f3326b833c73dbb86674ac5eb6ea45c8.1675441720.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6c8b46f2f3326b833c73dbb86674ac5eb6ea45c8.1675441720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a740cd-cf96-4b6d-29fa-08db0dc280bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rjWt67ExUoXQ4mTi3VHM++/iWralovAflQRukHDAj0jlQokzIePsGi8F8ja5dErk8ObUGIt6iVi+2qJFm0zi6dEyjlixgYo/ZWtgGGsgSzlzSzvyI8HAjOQ2P1vSQfY5dh5hBTIDE/rh6MQtjRni0Xxp9KgmKN2T00cki1XhGk/Tv7Z//2wwMC2ZFS010rWylHUNb+G2o0buLPn3wHAABpKjRD9nQ+xFsiYuA4QFrIqw+Wa2r66fGs55jgFbzoB++pDGM+lpQQGS4uvJs7/ncriYp08x3gEiKlEkHS4WDnVkDnclBntvE9OgvnAo2KTN8Nl++UskIlxDRSYOnclLkXHp/6pVdjKJZkJ+RaP0fhsmuVu8C1Gl5Fxq1Nau56nhnTQWs2Z8fPc5FD+4rNE84M+nP/d/DXrMfocr6l0xs/bo90fUWzg8A/LQpwmnv3VnmfZYt8jBkzAFw614+SA6wgyvDQP5ApJCzfJz9pK/+84axz3WcY+eNQ0bh3uGYKWGi+GpBExNHjuMlT/AB3cvWL0zxsF0xoMBqNNlKarg10zgk3mMeFqasQAstm6ZxiRN8NmfiLNm9CNZSC7y+RdDpPb1riOXLnxy+XxbEw8RqqGK2tZEEZul+d+8NEVl2PLmipXT0SmH0JxstIu/LNgrKzraOaKVxyPKeNbS7cVx88wvB7SNkn/NANV/Yaup6ecxfgPNS5WDhx6lwIPoYRwJqzuSpzFi4Jxvo4qTfw4BQmfSx+LlmPsXsslVz+kebUgLR4hXHYoGr1cX9lYzIwRaLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199018)(38100700002)(83380400001)(36756003)(31696002)(86362001)(4326008)(6916009)(2906002)(558084003)(41300700001)(5660300002)(8936002)(8676002)(6666004)(6512007)(186003)(26005)(53546011)(6506007)(2616005)(316002)(54906003)(66946007)(66556008)(66476007)(478600001)(6486002)(31686004)(41533002)(87944009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVVScUxFUGx4cG5TMXhGZXJaeDhkZ2t0YlRhcUxMNUNvV3VreTJjcmQyYUdk?=
 =?utf-8?B?VFZJNTNUcDdXQUExU0lQb2E4Ty9aeFYzQ3V3NWZHck05TC9oT3pFbklsaHhL?=
 =?utf-8?B?MUVMczJxR2JkaTZpVUtEWVBOVDB3cW5FMlU1T3hPaFozQnNXRkQ2Rnc5UnRs?=
 =?utf-8?B?Snl4cWhJZnNOM2k2OUwyZE1lWmxacENIOHhpZ3pvNGxXUTYxMXdmc3lyRmk4?=
 =?utf-8?B?TThWKzJMWENvSjVNK0MxZFZwa2pNT0ppdzVPM1RVVW1GWUMxRW0zSVBVNEFX?=
 =?utf-8?B?RmZRMUlDZm5tMXo2Q0UxaEtyaEZGd0U3S0cwOVRobXVCSG5aMisxZitpbWxm?=
 =?utf-8?B?TWNNR2JLT2JPY1dIWElIS2t5a00rUWNKRXhLeW5XczVTd0VKL00zZ2VNSnBr?=
 =?utf-8?B?MDVRQmhrTWNlcmtZU1ViYTBEZDF6emZ5SmZuNjU4RzdMK3lKdHVWajFBdyt4?=
 =?utf-8?B?TEFCdnJoK0JvUmowLzhSRnlMVEx0d1VCcVpuY1V5Qm1qcDcxNW9YV004OWM1?=
 =?utf-8?B?dnBGU1RZL3FLc0NScFdCWHlaOXBpTWluTUJ4ajJsdUlrcmUxMTZhWCszRWty?=
 =?utf-8?B?cWYrSWR5MFM3N2xXcko3bEw0WnNKdER6ZHFINGVYQjNHekVSWkFnSkNlVGRN?=
 =?utf-8?B?RkFjV2NrQUVKUldUejQzbHVKSDhQRzdLN0pCNFBhQldzWTY4L0VmVzlqRGV3?=
 =?utf-8?B?Qyt2MTJaNkQwTzJBazZEUlFtZ2kwejhwUWtzcmFRVnMrY0FueDlDSmRlV3Vk?=
 =?utf-8?B?cyt5bWVPR0FWTUkrc09GbWJjMlp5TUZtN0M5UjlubWVXeFMyOEQ0VzMxQmdZ?=
 =?utf-8?B?UDFvOGordzFyc2pqQ0J4YTdWVmhHQ3NJc2gvcFd6WkV4QzMwd0JKTXBuendx?=
 =?utf-8?B?cVhRN0hVRTdmVmpQaDJteENOZWUrTTNXcy9TMUZ2dGRyZnlGcm9EWU5HTFJQ?=
 =?utf-8?B?cEtuUWxrNFZoNm5SR1YySnpVR01uTTBOeWhXaFJzL2dpV1pVWGpuOE1yam5v?=
 =?utf-8?B?ZExKZXA3OEpNQlBTTDBiMnY1VkFXMlVyK0lMaFVONnprZjdpWGdSQUhiSlZy?=
 =?utf-8?B?TkJtS2w3NWIxOUpXelZvWjFRNHpTTmRJM2haN1RRMTgxTVMzbkF1MXBBZlZ4?=
 =?utf-8?B?M3JmbnZ4ZVd4VlN1bGtOdHMyb2ttZHlGVVdEbkVnamZFNkR5UjdndFQzNUZl?=
 =?utf-8?B?UFk3b1lzckVvOE82QWs2UHpRZjIxS1dURFhhUkFobDVSTzhOWlFsaVVrZEFL?=
 =?utf-8?B?SnhXRW9oOXpRd0NJQ01EeHZKZVlUTUFLNTFPVlR6cFA2WGkwSTBNdEd4UDNz?=
 =?utf-8?B?Z1JxdHZxWGdCemZoaXY1V0gvSy9WOWxudlVsSHRxeWM1d2gyV1Fsekh6MEor?=
 =?utf-8?B?ZG80WnVqMFpkTkNQdVFTcmRsdjZ1cU8vNU9JbTBQY3czaU81N1pocWw1SG5V?=
 =?utf-8?B?SVlNWFpBTVZjMVR5c1psYlZ0OXRJQ0RvMW5Lem1RT0REYXlWNktzOWJTQ2pv?=
 =?utf-8?B?cTdnMk9ZZElXM0hBViszK1Z6MVlqMVRwTm9VNXhzSmxkYTZFVVNMZmVyZnZH?=
 =?utf-8?B?ekhjSGlUMHJFVlZGWFhpRkdQc1Jhc0tURzczMGtiazA2ZzFsUFJMTExsVEVh?=
 =?utf-8?B?RE0yd0FaNjJmZ2JtMENoVlgrMDJROTVrdTZlY2cxejQ1VStQQVltUFZNWE5s?=
 =?utf-8?B?WEs0MkJob3RReEwwcmJQOU9hVVpkcTk1WWJ2T0pxaU9IZXc2a0Q4dEtlNHBH?=
 =?utf-8?B?Qm0wUklvQ0xkc2ZsbGRqdGd5MnZCQXRveXZsWFJXMXhIVFYvVkRVWHk4LzVY?=
 =?utf-8?B?a3dEdy9wdWxKR01md2lsNXFkYTNKRWVIWXVLampSU0ppcjkwRXFMckFFWjNa?=
 =?utf-8?B?UkFleVFQSUs4QStzVEE3WVdma205ZUVmbzJIMmRaaDRZeEZFbXNqNjMxUnd5?=
 =?utf-8?B?ZGtiNTlnMUg1R3pvNHFwejA3TDQzZ0ZpemhvTGpRQ0o3bWRzWDl1S1ZqdXlK?=
 =?utf-8?B?Mjg4Wm5ZZ1VWdlVJYWgrVnBFcDhuZ0R6S3ErQVE1Sk4xZkk0TW5mWkc5MmFO?=
 =?utf-8?B?YXBQbFgvb0h0dGJRSzYzZHJLM08rMEZaQzZxSFpRbEhabHJETmR0alJlOThz?=
 =?utf-8?Q?LeqRSjAUticJPLDKcLgLUT4xI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a740cd-cf96-4b6d-29fa-08db0dc280bb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 13:02:04.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcVAWluptMFOZ7ZHGLA51nGkxwIntC3RulLzZ6OwWJ/z21EzGXhhMGnoTZACZrulJWD1Uem30d+Hq14dBpBKUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9341

On 03.02.2023 18:05, Oleksii Kurochko wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -18,6 +18,7 @@ config ARM
>  	select HAS_PDX
>  	select HAS_PMAP
>  	select IOMMU_FORCE_PT_SHARE
> +	select GENERIC_DO_BUG_FRAME

Please maintain (largely?) alphabetic ordering here.

Jan


