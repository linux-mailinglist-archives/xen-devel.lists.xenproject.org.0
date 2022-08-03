Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21BD5887BD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 09:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379586.613150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ8Wp-0008AW-Ra; Wed, 03 Aug 2022 07:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379586.613150; Wed, 03 Aug 2022 07:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ8Wp-000874-Ny; Wed, 03 Aug 2022 07:10:51 +0000
Received: by outflank-mailman (input) for mailman id 379586;
 Wed, 03 Aug 2022 07:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ8Wn-0007xM-W0
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 07:10:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66b927a4-12fb-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 09:10:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7721.eurprd04.prod.outlook.com (2603:10a6:10:1f6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 07:10:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 07:10:47 +0000
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
X-Inumbo-ID: 66b927a4-12fb-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD+yuSr64vu8LLe2C0ziPD3djIsPo17xAjrx+ifjm6uUbtoKp0ptTH2h4nARkxZUT5BiD1VqW3WcfAsSIZGnEqKfILt04XdWYkqd7opEC49dUVg8P+91wW31ms/PM9fyi97/HfBGy5F0ooRMkeLHjdEd4IyGOO41/txfR2w7y3FTR4nMsYccOmhbdzQbianlr1VKpj7GFvz4oI/qF/x+Y++i9n/bSGH8pQyKfDEYS8wFB4SC5inXKqvvk+wjK5X04looPhSX+iIuJMZjMKLGC+D5gjCpTeOKc+OsErE+yO842sOJLYoWb04v19MzMSpxAD55yhPPGm9AVl8gl9fV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpaqcIPRp/SD/qO5v9kDSfLjx6mKTwCIa+UN6oOKuHA=;
 b=bAoMVxNuc7SxOCULeK4zA6rG459xLDAef2vRjQQfHZ8RMtLmf44OAaYfsYJTScSE8XUnHlY1q5VxS5xf0SMi8XUZJ8UpQULQlPffSXWIaW3o1kd5hZC+I3gQacCfPoMZu7i/mhePAh+jnVEr48tE63RAq10D9AM4w2+ynhIWocMCRH60JCSgdV4CfN2taOr7qEGz4rgYokvfGPdf7x3hmyS4Ig3Qp01dbzlJHKAcbwqSOUt+ch5yFeOqmS/1TTbNF3nyUfRP5F6i35IG787msnrui0XRNBgS/tBNpklCsSdFb4qqgzL6JEX/K8/fJUgMD+2l/KDphMI9473OryZv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpaqcIPRp/SD/qO5v9kDSfLjx6mKTwCIa+UN6oOKuHA=;
 b=PBo8sTJX8KaG6u0r4msFwSnyo45rM0IeN+EvKdRbylHpMGifVZI8AKK+J3pjwB2pJ6sntkOH9zehEa/xAQYkHXlCrraZ1UOQKjnP42TpwwaDhUASdxBJFIBp6hgu52ataQtQ6toEwym97W6fxwFVRRfptD/M1cJRl9umEVCs5Gkniup1MCY1zVh9ZIskSw1mj4gNAK8ltIJmw/ztmFzy+ynymaChqS8+006nSNLlkj7/4JSI0lUkAlB1C/A6YEijIdiPVDoym1pi15s1lNAgzuZb0/kuXmbuKGGHJiLOSiPUFjk712OfUskhwCGNoGfXrOYrlsKD8Wma7niMCFWbfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ccdde721-cde0-917f-1023-f4f4d0bb2a6b@suse.com>
Date: Wed, 3 Aug 2022 09:10:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] xen: remove init_constructors out of start_xen
Content-Language: en-US
To: boyoun.park@samsung.com
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Chungwoo Park <cww.park@samsung.com>, Gang Li <gang30.li@samsung.com>,
 Lei Wang <lei19.wang@samsung.com>, SoungKwan Kimn <sk.kimn@samsung.com>,
 DongJin PARK <djpax.park@samsung.com>, Joonjae Lee
 <joonjae7.lee@samsung.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1470588578.9967963.1659494457934@mail-kr2-1>
 <alpine.DEB.2.22.394.2207291447080.4648@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2207281251160.4648@ubuntu-linux-20-04-desktop>
 <97499212.9948800.1659000157467@mail-kr2-3>
 <88025800-66e2-4fb4-facf-5989e75ba08f@suse.com>
 <20220729110313epcms2p5f9b24d5a65b98c220a6e99675298560f@epcms2p5>
 <CGME20220728092237epcms2p53821bba31388763f45b5204d56520c20@epcms2p2>
 <1238367271.9969045.1659494647714@mail-kr2-1>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1238367271.9969045.1659494647714@mail-kr2-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0012.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10ae4caf-d42e-4b26-9f8d-08da751f4a0c
X-MS-TrafficTypeDiagnostic: DBBPR04MB7721:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tz9eiDLxSoDkoGx/GIhxVAwHkHOB3IU6s9OEnXjq7gRihkE4nNTD8zr+cNLpbmigUex1c82tIEdXx5wL5U3g9T+Nu9usvP+XAOYznT5A4vzygFW6o6vNvTdX7hr9F4VPCN26o0EWfQgM5ZtkX5PjPMgQV2bbKLVzFkHYI0cyn1AnxcsvHEOZksLW6CmCgca9L7WZ7HRfIWRp7mfn8JWtVQ9RkWQa9ZnshfYN0W6RJgLKX/nlMULEyBYqB5Wc+5vOoAR1Ae2eE8KItdvyMXbd8qwfePMxLtNgYZq2QSAY4oxboqsRHxQYg1AGY7JKArkN72hR4JpZs9AloP2cVlPA1sTg9F6ijj3aMMjtApx1njYGOIyW0RkycU44umdJrTq1/xE/RmKzsKoZ1uE3FzYtuXuzgR7w8oXTqrjiJCZejM0tYAgGfdIulAhTjbAlJATT4lVwgQj/oEqFxcbmebus/NRixbANTtAy1SF7awpgDRo1Sb53b96pZTYTLmbRI+Sjd2PyC55qlKve6AYgzX3wmplu2YdWyr+JzLLomQhNJd9MfWNQh4uWqbGPONLWLYWaFF09+p9ZERtynhuFt50/jw3dMBgm9Zr0D3W9LlamkvIbeaM4xNe9XqNCfGmdCjRsTSZlNalix4ahtE+Ec4VASebTjxiU9cQpsC9zhluI0KOoRPz9K6nNka9GY9xY3pAduIdBvf0GjjWyQ1lXtt6z4hg8FhwMu8WuN8sRpq872BaM/JldRp7jqQ6GA191K9lcIqmddN7r/cKQEGy54aIYnshglIf9VQDF5ZNiMsaKzM4na6/PwT0Wy4ZJM7p4HAc51HtSFzo5uwCFbIy+NLyVWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(396003)(136003)(39860400002)(7416002)(5660300002)(8936002)(36756003)(2906002)(31686004)(66946007)(66556008)(8676002)(66476007)(38100700002)(4326008)(53546011)(6486002)(83380400001)(6506007)(86362001)(6512007)(26005)(31696002)(316002)(54906003)(6916009)(2616005)(6666004)(41300700001)(478600001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmZCQms5NWFTeHZSUnFmaDRUdE5LZlk2ck1yNkJmSFh6QjZSc0dmZTl2ZVF3?=
 =?utf-8?B?UHUxUXBWY0hCRktOVUEyY09OTmRnREk1NFFoQXVYKzNrSFJSRWM3dFhsV0Vu?=
 =?utf-8?B?TkNIZWVuTmtSUDh6bFl2VkpPeFlYMHFXM0hzbXhJdncwU3JvK0tDTDV4T0Yr?=
 =?utf-8?B?ZDNvZzM3MFRNUWxIQkNFQ1p4d2hLVm92d1ZWclNhNmZLcHQvUW96OTQzNzlO?=
 =?utf-8?B?Nk9pcFRPQzJOdEtVWEtPK21QMkhYNk9TUWYrTzRpK3ZjR1I3WjJmYVRhWkhR?=
 =?utf-8?B?ZXdST29hclNDNTFjNXRlQkNZbUJOMHd3RXpRNmszaGovYWRkWE83cVUyKzg3?=
 =?utf-8?B?eExJN3VrRnNZZFFaQzZKakZIcUdoZHdidVM1eE5LY2Mzekdpb1NielZzbkIx?=
 =?utf-8?B?NG1KUFZGME8yS2JlY1g0SFZqRm5mcnlYYWUxdjJKWkpZeG15dHZXbURUSm1Y?=
 =?utf-8?B?QkplZUo1STM1bjdaYTdkWFpWdjU1cTZCL0pEWUlYeWJMaVhRZTZ2eXNsbXlu?=
 =?utf-8?B?dlJ6S3g5NHJIYlRIZjVwbUwvYXNqOUx2d25TSFM1QmRTdUtiNHpHbUpsMmM2?=
 =?utf-8?B?VGd4YnVIT25LWEZENlNJbWdUZnFVdFpVZGI5b1hxNmJhK3NmOVdtQldteDdR?=
 =?utf-8?B?WjZUZ1ZuREdNd2R5cTlxOFN6SGI1SkkzVGJJOFloZGhPY2o3S0xlejZ3L1pG?=
 =?utf-8?B?Y3JUZCtodDBrQ0J3NzlZRFlGTFlmM1FnY2Z1bFIydEtCOVZ0RzZOWDhjZnFG?=
 =?utf-8?B?SHZyYW5aQ042YVpveFZsZ291Unk3VVZRRDBWTDFLeVlydGRFVEpESEpUUFFY?=
 =?utf-8?B?eFFxWmF1TGpWY1RlU1ZBZkM1M1B6RlZMaEJycUpBcVMxajhNQ09iVnNzc1dO?=
 =?utf-8?B?RFJaUXlhNjIvQjBpZ3gwRnBaVDZORDhMcGhsWXZMMloxb2VJbitWb3E2Sno2?=
 =?utf-8?B?UXdmM1oxdFNCSnFqc0ZsRnBZN3dDdWNvYTFSRjlIYzlCTWorWGR0VVNhSGp5?=
 =?utf-8?B?UldCU3hKSDJTVDNGaGljclcva2s2SjdqSWF6blNBTW1GK1ozS0h4OVJ2NnJU?=
 =?utf-8?B?MDBXdndmcTRxZ3VpQmJzbzk4N1RiRmRza0s5UG91emYxTzNHK1h2SGx0NmM0?=
 =?utf-8?B?dUtDaTNMdXBpV3F5UGdEanRpZVpHVWRNb0preU1Xc0F4T2Z3N1hLYzM2WXZC?=
 =?utf-8?B?MFNMM3lIdndoME9pdDhVT2VsOUF6MWRlNDUvSUlPOEJFVVFzbzNiSHBUcXNy?=
 =?utf-8?B?RFBDeUJSUWloTHY3eW1zSXNnZEoxNFhQbEcyT09sVVQ2R0NVSndxT1ZwcGhw?=
 =?utf-8?B?L0VNRFdNbnU0UkdRRFBqam9zUEVjNXM3eXFYWVl3SUgyUGRKR3RySmVpT3FJ?=
 =?utf-8?B?MEIxeWY5dys5S1RscWRWV01JcStnL3g2SzdjQjJhc2sxRG1WdXVnWVVqd3Rn?=
 =?utf-8?B?ak9LdDJxMlQzdW5zbk1oNUNaOXFHZG8vbW5kVThlZm01RjNwTExXdy9wYjU2?=
 =?utf-8?B?UDM5WHdJbUs2ZXF2ZzRtY056M0svMi9Vcys0c0dpRDJTTXpvQk56WnZHUEFP?=
 =?utf-8?B?ZVhlQ2Zlb1ZoenJRSkJIaFNYRlR5cHYvYW1RK2NGdGFzbHZTRlJpZFlLK3hU?=
 =?utf-8?B?c0NtNCtISHB2cEs1OVdQTkxPQ0ZPSXVRRlVCb2NPM3I2Z2trOXp0M1JWTEhQ?=
 =?utf-8?B?Ymk2UnpmYnNNZlRIb2lzUVFaUzRBSU03eDVoU1NYRmNNcHNDNUZ1RTN3Sm5K?=
 =?utf-8?B?M2dxang2ZzZNTEp4cmxibTQzbkptRElSbW5ibWg2WE1LTEN0dVM4emI1RVY3?=
 =?utf-8?B?Z2dwMnRVVlFaQzJFd0VmYXp4SGN4SkkxazVvZFZkU0I4cXF0VWJTc0lCVUtu?=
 =?utf-8?B?dmQ3em50bk51Q3ZvZlN5aDZwRDdGVGFEV2JkUnprT1dlbktxa0FGaFhxK1BG?=
 =?utf-8?B?dzNBdEpMamxRMVpUWXNDZk50eVJhZTFTOUpVaU01N0wrK3pYekZtZUF4cllo?=
 =?utf-8?B?MDV1MU9LY3NDWCt3T1NFT2xqZzdENENzYTBSZ1l2NklPa2lJSnBoWFVPM1Vn?=
 =?utf-8?B?VHc3OWg4cmVBT3VyRXlrNWQ5Nk5aZWxIRzYxQkJTeXR6elJMaUQxMzFPMmd2?=
 =?utf-8?Q?aRDHDuCUW+fCgOtt2wqxktrv/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ae4caf-d42e-4b26-9f8d-08da751f4a0c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 07:10:47.4373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hswc8oGsKOQ5xFbtOaawcLggZV78ubuutyp0Qr880/k3/4cMSQt4L2eqQXgPyCqySvbTfq1odSZwCw6+h/PeJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7721

On 03.08.2022 04:44, Boyoun Park wrote:
> From: Boyoun Park <boyoun.park@samsung.com>
> Date: Wed, 3 Aug 2022 10:31:55 +0900
> Subject: [PATCH v2 2/2] xen: remove init_constructors out of start_xen
> 
> This patch removed init_constructors from start_xen
> by using __late_initcall.
> It can be applied to other init functions in start_xen
> so that only main init functions are included in there.

Only if the relative order in which they're called doesn't matter. In
fact ...

> To use __late_initcall, the format of a function should
> be changed according to initcall. Thus, the return type
> of init_constructors function is changed in this patch.

... you're changing the point in time when the constructors are called.
This _may_ be fine, but the reason(s) why it is would need supplying in
the description.

> Change-Id: Ife13484d346cff15983aacbfefde21d508f4690a

Please omit such.

> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -211,7 +211,7 @@ extern void add_taint(unsigned int taint);
>  struct cpu_user_regs;
>  void cf_check dump_execstate(struct cpu_user_regs *);
>  
> -void init_constructors(void);
> +int init_constructors(void);

This wants to be removed, with ...

> --- a/xen/lib/ctors.c
> +++ b/xen/lib/ctors.c
> @@ -4,7 +4,7 @@
>  typedef void (*ctor_func_t)(void);
>  extern const ctor_func_t __ctors_start[], __ctors_end[];
>  
> -void __init init_constructors(void)
> +int __init init_constructors(void)

... static added here.

> @@ -12,8 +12,12 @@ void __init init_constructors(void)
>  
>      /* Putting this here seems as good (or bad) as any other place. */
>      BUILD_BUG_ON(sizeof(size_t) != sizeof(ssize_t));
> +
> +    return 0;
>  }
>  
> +__late_initcall(init_constructors);
> +
>  /*
>   * Local variables:
>   * mode: C

We prefer to not leave a blank line between the function referenced by
__initcall et al and the __initcall() itself.

Jan

