Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC173B179
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 09:28:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554262.865358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbD5-0005P4-GW; Fri, 23 Jun 2023 07:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554262.865358; Fri, 23 Jun 2023 07:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbD5-0005Mo-Dr; Fri, 23 Jun 2023 07:27:59 +0000
Received: by outflank-mailman (input) for mailman id 554262;
 Fri, 23 Jun 2023 07:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCbD3-0005Mi-N8
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 07:27:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78601ddb-1197-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 09:27:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8166.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 07:27:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 07:27:52 +0000
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
X-Inumbo-ID: 78601ddb-1197-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5Gc1cj1EwItcZ6/Ee/TgZ+8mKgUE5m1iTBkV1FIXNqG+Cn/9xwVnpFQtzpXjBfyWqivl4w8sLw3bToF5fIN2ZttgAP1PFTibXcvH2Fe9CgqS3OVKGnTeJxcmD3duyxUbHF1+CqbXTNcB51+bfbfwzY4YZdzDAnikPBWCVLGH7CHF082+/UZPN20Mg5jONcdVhtOfgzgwGjgm2o4AU4BfganGo8a/Ig4MeCrRaqrsSrrwtK8kRO6aQ+TobMucS5gRP4v7vcA6OsDYrDSSGmPFz3TSvjcmvZjQiRRsoT2ZKhGHOqvy4Wv6crwChdHMbtujP1AnvSg8pAdj0GVlp3pQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnglgTf45V6XR3g53Zj4fKPBR5Jp8KXD+x4sO2CjuwM=;
 b=GaWBGZtaWTOprtAtO958rGktwklXKMhaTebBWnucGxo84kCvfjpfHga274ogIdwqjRHrIfR2KQDIuyFAKI5uCejtnB5RT2Xft40pC3d+ntsJ8oBRbMa1H8gdpguurd+9A3kId8ZiHKv2peJO4JKUmseJxStG1o2LYHiMMclfcEAqsqfMqJ6zMM2zThykdlTf8WDs1DDjRsELFnP4BhBniXZd3x9XbQhIp1amsxX/qwuVvY23gHjoq828Qfn+MqOiY9Pd/CkXoUVXaGnK0QQ+BTfHBlQ+/7HN7fBjfeWLXWWmL1AoPEXdlwkO6RSg+fyoMYJaZ2XTzITQAeAuKwO+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnglgTf45V6XR3g53Zj4fKPBR5Jp8KXD+x4sO2CjuwM=;
 b=ChDjTonNYyb9uUBDdOeBPeB6d6CETTa5s1Fmew7rMtK6DiRyesQ1pIRyx/38jHRumsOpUJYlZSVcDSneYPWE2tjAw1+9VPCQxJe++L/Zfh/9w096Ti82IdUtBJxzmdO+JKhjIW1dTzi/Z72j+4ihu7z7/0lpZjgNNfce/wx+EF2eRuimE4sS0LA9uT9JO+Py+F0pr6ciTBzT+5WIgHCUPQR5CtQolmeA3Gpe1I1A/yTza94wjNZdq4hubwXxYJc5MRD4bMv4mdh23djoVI9TR+w6fs0pYfvOHvkfhIq/T3svAZLL3NtufBefM8OhPHymV/G5/i4TiEa5WYS6Ewdhow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6fae32fe-0403-6a14-8485-aa851a594f0c@suse.com>
Date: Fri, 23 Jun 2023 09:27:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
 <20230622174219.8871-3-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230622174219.8871-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0010.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 5863a3f8-7699-4f11-c8b9-08db73bb5aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rc4aDQNvdpbtqt8nOQPoUGhup6AIfeUgA3D+MWJXG6NPWFN9SS4K4Vf4gWgwsE/ZgR9vEhbbBGnBpr5pGXTF9cy9ImAGapjrRpm75azOKNMsXtHnZGeyyC4trzOjohJtwHt+9QIMjTCGZ/s0fCLIFo4R9+S6ECXzF2a3Cl3KvB0vuexcb14chxeaRrxMoLrcRPCfU1GYnfAKhsSkR1ivo7oejkbylo++I0MqODKxpdJflHj0723pAEtg36TlAUmkTMx9QrsXc7BF7To+ANS29pcCEwOEwFAyXiVAYgho14pScXWhqmLZ4uOekRnXBUlwOWngg0CFMXzXcYqJFj0ma7197roxxwLf02iw/ogCzKktNwCwxbJj6DNsnBpXdqdlGnjHoXUmUi2PDPGxMARdasGYzXLln5CWyByoizR+mlwtJDagwi1o3rg8AruOu3aSU8wrPBGIhj+9b3gexYJU1DK72ZJlb/+HD4el88FuQJOMn5VbDEVxSfDDMHjOlsw3g/zS8PpwULphEyKuOFey9UTaaik5yva+ZwiEJzsPj7wcYBpYGZhBfyZnZ5zNMTar98ibE53vorlVK+6BFdv09F7eou/5H+DxqpH8BFxU4urzxPQBsHqDvypqJ9Y4B/ed6Qclh/Rgt9lJRQsfeNl9Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199021)(478600001)(6486002)(54906003)(6512007)(6506007)(26005)(53546011)(186003)(66946007)(4744005)(2906002)(66556008)(66476007)(8936002)(41300700001)(316002)(6916009)(4326008)(5660300002)(8676002)(38100700002)(86362001)(31696002)(36756003)(83380400001)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEFlZ2hqeDhOQ2wweUpBazBGaHI0dHI4RXNlRFRaLytEVEVUK2tMblBWNUoy?=
 =?utf-8?B?dENFY0lsK1dLbitac0JUOSs0K0hSS2txM3pwbmFIa09LanFCdk03R0VBaTFG?=
 =?utf-8?B?VGNKT2lqdm93K1R6UFl2bXZkbzZFejdUcG8reGU1aktLT2h3Vjd3NWpPR3Vj?=
 =?utf-8?B?QzBLVWFRSnluTkZZcWdtUzh1aFJIczc4VDQvaEdWWUlsYlFObjFLNGtKV0dO?=
 =?utf-8?B?cUNFR0pBR2F3cnZsTmFoUm5NaHIrTlhwV2xwN2xOYmJCQzhQTVZGNllqT1pU?=
 =?utf-8?B?TmZGN1NjSU9FOW9CQjhZL0YrMmh0NzlLWk83RjFnZXgrZm1iQUJSeTkzQ3dy?=
 =?utf-8?B?S05mcUNKSnQ0Q01BQlNrSnkwZTNrazRoVWVoaWwxeWhwRU1zSWlVZFljb2Nm?=
 =?utf-8?B?NXV6Y0ZKUWxUZm5CS2tYV1BLcmVMbHphMUZhKzR4a0FvYWsyeVI3S3pXbjJl?=
 =?utf-8?B?ZzZLbzdRMFdoN0svS2ZjTkdHdjBDbHBZWnZUeDZkNE14VlEzTk9KUUJQdXgr?=
 =?utf-8?B?TGNtVEdKZEc3OC92TVRFNUZJSEg3WEpRS3ljTStqd25LMk1xbHJCODMvUldv?=
 =?utf-8?B?R0l0ekdGNW5rMUR0cGRwTFV6QUZ0SjFPanpmU1M2YlBqekZLQW9JYjZ1UlN6?=
 =?utf-8?B?emlHejZKVEZYTnFmcjRLL1cwNEZnN2RJR1NhbGJQVDdzWjNkQ3VURktGZmhl?=
 =?utf-8?B?ZmtDV3p2NnN5QUJWaVo4eTVUUkNzRHYxUkF4TUpqMVNKQndVbG1yZ2s0VlRI?=
 =?utf-8?B?REhhTlRSRFNwUWRrNXNhb0I1Y0dDaXllS0JUc21LdWs2SVkvTVNIWlkvWEF1?=
 =?utf-8?B?bytzR2p2WEhoODI3bytwY2JORkdvUXBoUXhHVThBa3pudmpPeXlVL0RFcG1N?=
 =?utf-8?B?eHFVN0JER0t3OFlJTk5VNjJPKzdudG9IQzdBcG1aZWxaNTJwVFVLcW9NN2F0?=
 =?utf-8?B?ZGRLVzYzMkkwL01aL0JlSHBPV3hvYUE3Wmd2YWlkaHc2Y2FQa1YvODBKdHhw?=
 =?utf-8?B?TlFsZlh6QnM2aEdaWUNvUnNQWHdaak1IOGlLL1BlS0JNZW5RWk5qVWpvMFZh?=
 =?utf-8?B?UTYrRWphZjVxWHhRUzNWYldndTgzeWVWVExCdERERFFZRXpXRjdqSzNSYnR5?=
 =?utf-8?B?R3JFeHVUeWpONFFDdmRTZ0RyMm5yS2UxV2JvZ2NpYkx6U1Y3cHlZTjVHemtl?=
 =?utf-8?B?RFc5cFRibGxNbmVYS25uK1c3UkJOOXRwaXRVeHpQK0hzTjdFblV1QVkzeFB0?=
 =?utf-8?B?NkJpenpDdDkvYWx2ZVByZU92dnFrUkJjNm9MSGFxU29PRzl0azVYaXlaZGhV?=
 =?utf-8?B?RENXRGRNZ1hodkJrMG42ZytCd3pTQldUa3Bobml0Q2NWTXEzSUxjSkQwUERp?=
 =?utf-8?B?b1BiTFA4cHRxbnh4MFZaREJQSzlUSHI2cDJkeVVSSCt2dW15Y1o3UlJycUpU?=
 =?utf-8?B?YXNsQit2QVB3Tmp5U0w2TUhyd2VSdEZtd1N5dmVpZjd1Z004aExpV1JzNkNF?=
 =?utf-8?B?dStwbkZ6UEZ5TndIT0VDS1FNNnZYbElscGJZOW83Q0JYYXN4SkJERkw5NFov?=
 =?utf-8?B?QUFXbG9ZbkRIbFJFZ2t4WmM1LzZ1bTlpUmFxNWUvUWFIVVRqdnRHQm5yZ2VL?=
 =?utf-8?B?TlJxT2lUU1VHQjB1SG05WDZRdHFQbWhYRGZqVDRoWW9LYXRaU29hb0hManVW?=
 =?utf-8?B?Z3FON0RVcm9tdEJWQmQrbXRWUHpMRkUyclhjOFpBa3drSi9KTk5oTVNrRVpL?=
 =?utf-8?B?TXFTWnZMWi9MRHB0SWZKMklWMC82WDlZVGxNL3BnTWJZc0ZKZy9TSGdNdW5O?=
 =?utf-8?B?WmpYM3hUZDc2UTdkOGFxaGZJeXh0WW5HbmlTc3dKRnFJbHlkOFh5c0dMbG8x?=
 =?utf-8?B?OEY0Um1kcnIxSXRsZHk4eXJKY1lYYVJXYnNuU3hqZDI1R2JTRmxvK0NxZHJi?=
 =?utf-8?B?Sk9Da083OW5TZWYva3VXME90YS9yQUpXZjM0M1NzZnpiZWZrRnRqRDJZSlJz?=
 =?utf-8?B?RlA2QWYyVGRWMWR4OURlMGprUTR2MFNBaE1SVUltQUFIZWwyUHhMd0ExdWVn?=
 =?utf-8?B?WUhYVXlTeVJIK1l5SnhaeWtDRzUrbTNrdEpyRE56cVBLM0JoN1lMOXhLTHQw?=
 =?utf-8?Q?Fa3KDKEftkvYU/PSrkXFUSiW6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5863a3f8-7699-4f11-c8b9-08db73bb5aaa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 07:27:52.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EKer3ARhEaoacwjBOzUL+RA1zdUwnILyXT1bbNt44OYtmPWsfeE5rpSLHG9mAKYFTyHxQHftDGUJX72+HnA3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8166

On 22.06.2023 19:42, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -867,10 +867,21 @@ int __init early_microcode_init(unsigned long *module_map,
>          return -ENODEV;
>      }
>  
> -    microcode_grab_module(module_map, mbi);
> -
>      ucode_ops.collect_cpu_info();
>  
> +    /*
> +     * Some hypervisors deliberately report a microcode revision of -1 to
> +     * mean that they will not accept microcode updates. We take the hint
> +     * and ignore the microcode interface in that case.
> +     */
> +    if ( this_cpu(cpu_sig).rev == ~0 ) {

Nit: Style (brace placement). Can probably be fixed up while
committing, if no other issues arise.

Jan

