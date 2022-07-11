Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4423B56D4AE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 08:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364824.594760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAmt1-0005iv-Lw; Mon, 11 Jul 2022 06:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364824.594760; Mon, 11 Jul 2022 06:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAmt1-0005gH-Ib; Mon, 11 Jul 2022 06:27:15 +0000
Received: by outflank-mailman (input) for mailman id 364824;
 Mon, 11 Jul 2022 06:27:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAmsz-0005gB-CR
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 06:27:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f7205f6-00e2-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 08:27:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0402MB2916.eurprd04.prod.outlook.com (2603:10a6:203:9d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 06:27:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 06:27:08 +0000
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
X-Inumbo-ID: 7f7205f6-00e2-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1PAAqTpvpjrTe1FNqZZELMdSSPZnmrx+ZrkA60ABV3ywbfd4OU+SNB5gy/Q1Ji1MAbLD896pHG86b9k7IBVSgQ2LdinMmXP0EbtIEpXyQ7DNHQ9LdUayWYjttbQcUTjV0vrGSQ8JHS0GicQyswf/eFmmxFcxjwVW8MxK6TQAkmwzu2iB/Kkr81vxozMdPqGW6/GkVpNDebvmb6sb/s+pjKk7XYGnaYw/8CugGEkqgnU3oCGGkevuWx2M+4CArFXaphzw+g0G7xw6FvS3T8CD9G9BPWseYK3NACI07AMtD/X5otQ/EzbJLphCbdibLMuULpF/q97GwaJM6OyJ+A1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWLBQmHfGuHpotrsQwgdjey05YgjSg/pkJoyOWwi5j8=;
 b=Qq6Lh57Fqzy0WmGg1tbofD10t5ADjSyfXtbJ71fOIR9o35kBiQfqdSCaylF4C+GBS/43Xnc8wFHutNmajgT42xcqLGlXi3YWGmsT9z+JWktTwrQeLLzsIISa37crdu0IUOzFBI1GGDg4+P9yl3GbNrWK2AUTvwsFfzoYnvitDQJePCKyHvm/FB5HzZjIQOGqLWcBTEfTRNMyuXvvXVftYyeguMMOhgYk0armRyeMxqrmlg3cT4w4tLpy13DbKNF7BxcvwT4RHTjLKEDBeJGra1iQYFBaOb4nRHpIZO0zM4fZN3m5izlNnS5fADn/+p7vo1Ky4MMiuMWjQq8QSoE+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWLBQmHfGuHpotrsQwgdjey05YgjSg/pkJoyOWwi5j8=;
 b=kWDuPapVkLAGG0R6Lzjwl/uSIdFVvTiyvO26GBzmyvATq7QgnDMd5WMpV7r0ylmvzhnf25/cOQ7OEuTLHkFVhqQY1z4OASL35nWIcnthcHr/uLApQ+Wg2wwL3fW4wzHWeRfzN9p8og8gEEVUGF+seicYem6e/3G84A53UOJInzOHuQO62laoDevQw+6hNhN++eoahw23tKVXdvUqsDfwnVlPkLvA47+hfumhMK+WoWRsUuTaow3SsdPRk+k0a/TeI8SKOMw9cnjBjrxDQj8/bwmkqsurPM5iIuUJtGbDyDnDbfS9dtLZZxC35WN3npKsJGPBYD3hKft/f7/HhnHsgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9dc4bd95-302c-0b39-8954-7c1822c091b7@suse.com>
Date: Mon, 11 Jul 2022 08:27:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] xen/cmdline: Extend parse_boolean() to signal a name
 match
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220708161934.10095-1-andrew.cooper3@citrix.com>
 <20220708161934.10095-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708161934.10095-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0069.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6074ddd4-b1fd-4255-b7dc-08da630661b5
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2916:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	13rkFz7KTwyFcmQUAWYS30QlskFqpSnhK0z5Z7s2fakG+gfSVZmdsEpAi4W9nMBcs3U0YHXyd9hvu0PJSvjBphoIOMNzPhcCcxGikXn+E1lwRTuYgrxo68yNIULLuC1zp/ROX4VagW9OO4GDc2sTrlORPGQcERQ7uUC8nAzb2QC/vJ9qybR4miKqq9Wu0fmOrX+zJ+u3fV+lmXn5M7wsurQSsB2Bce892CZbQT6U1tglgX3Wuh6fLaIDPV6TyE00/oMt4ErHnxQpbswooDvuO/Re1yBXe4SGnmKgPL2uZ6ouIuAPFos5cIvp4CfIWzG6q40LbHu61AsWCHXXv6WpqLmpts7MQ5gkf5vlhh61PVSGxIHPqd0+WUgH271PE+uZxVideeAN9w7HF4hpdaWLfrBj/P03qE/Gk/yWHdZJv897YM/R+gPQHJJkx+uA3IRF0VLiNWCNfMm39c09E59aJHSTvSoBeQZHc/pxlAG2B995TG2BKBzTnXuBuDAdrAadWF+28alVN/UUFFYdzO5NOs+adwVCEt/M4+RUo/cHsxP261mvLQAwX7n6JFmlFFwHknmR5vvckTphOJV/TyBtdOlCO/fuCXXtVxJJED45DXxV5rz8y9m8LkwMqudogmMqV9EWgeHK6UVcc0vh+faJw020CZDtdqECnWUJLsRWfbFsw3C9jrCKDYJEZGoO2xg6ziwv4mKbJcee3DeaG19TNge6HdB1XEb6Beuic2n4plpwNkfTNs6+YUu+1AKqCi+Eysg/DvdaiD+yBN4b+II/nVw8tTdJ8X1JPA7ZynaxeUsEnWsDT5amOOj9SnyKt48mOiCj5y9YFTT+UFUUMwyTLgmIPOOI0q99wmmsQjoZsmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(376002)(396003)(346002)(366004)(136003)(6486002)(31686004)(478600001)(4744005)(38100700002)(36756003)(4326008)(8676002)(41300700001)(2906002)(5660300002)(6916009)(8936002)(316002)(54906003)(2616005)(66556008)(66946007)(66476007)(6512007)(53546011)(186003)(26005)(86362001)(31696002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVB2UnNITWlrdHZuMjh3c0tFSzlCNVVZd1ZNcnc4ODFqOHhmTy83a3Mya1ds?=
 =?utf-8?B?SkVMa1gvUno1NjVxb2ZDb1dJZ056WDFYcytiRTVmeitvWjZSamgwUExRSTZq?=
 =?utf-8?B?MS9uOHBaZWo4OEJkcWUyTTd6Uld1NmxoNHNUQmZlZ1dpbjVtUnVoWTNSRGdK?=
 =?utf-8?B?RXEyNTZaVk83M3R5SkM5aHNKYmdVZEpqMEE0M0RhVit5OWZsYjh0L0xweHZo?=
 =?utf-8?B?Y2U0aWpDdlhGNm4wb29odzhsTXBZMXJVYys2dHRwY2R3WVlRUVBzWWtoUHVL?=
 =?utf-8?B?THdEbUVIamhpZnZndllNSm1CTjRPSW01dUoxRVAwRGFXcmx0dlNDVHIzZWJi?=
 =?utf-8?B?UjJZbmVFL1N3UE9JVDVxYTIveC9YMk9QWHVFc3k2bWx5bllBclJCcUc1NzJT?=
 =?utf-8?B?dUlKblJNdy9xL0VaSHphM0NCRVg2SGI5dXdVMS82cXExS3UxeGZtb0ZOTk5E?=
 =?utf-8?B?bW4wSVlnUlI2S0h5RDRzUzhqTjQvTllBZkx5K1BTNXB0RS91VFQ0MnJWVEMy?=
 =?utf-8?B?ZEVCZVlmZjYvcjZRSUozcUVzSzVGV0c1Q2ZvRUJhQmtKaDVsNFF5YkFDK3p0?=
 =?utf-8?B?MGs1TjVxc0R0c244SzlZcUxmaXlyRVc3NGh4d0Z6YUlMQUd6Qi92OVk5YmU4?=
 =?utf-8?B?QkhIaHpIdFhuZ1Ztb1RwMmwxc3ZqQ0hTK1lOd1FxeUlWTlF1NSsxYittTFVB?=
 =?utf-8?B?eENtekJmaEJFc21KS3JFWkFDamxic1lSbFBWTHcrQWJTaC9tMU53ZkVRWG1N?=
 =?utf-8?B?WTJEWTdlNFpjOXJpWFpXMjZVSHB1Q1IvL3B1bDJXZjBrekRnMmFtRkN3QlJ5?=
 =?utf-8?B?bWF0SE5VUjhMTzZWZzZmTWk1UHIvUmFSU25tRktVZFg1dlNhZFAxekhLYjVr?=
 =?utf-8?B?S0lId0RMT0tSWXllWnlJZlZPTkVDSzZnRVdUL2tPTWNPUEhtR1lBcElLYWZh?=
 =?utf-8?B?TCs0YzVPWUgxN2N5QTE1MUg4NFVWazc4YmxCVlo0MDdsWFgreHVrdms5dG4r?=
 =?utf-8?B?WHE0NVZiNFlkcVZyelh2eEVTOE1VKzExMzJOWjdXR2pJY3drWitCRDg3K3dr?=
 =?utf-8?B?MjRKNUt4RWNCR1RCN0t0OUFESHBSd3BKY2hMbW9MTTJ3Y09wTldRc2FuNFJj?=
 =?utf-8?B?SmF0dzdyN3NtMzZDeGhEWU5oenJVV1VrOTlkaTNhOVEzUFNUV0JOTEVrZ29J?=
 =?utf-8?B?Ky92UDZyaklFbU1WNWRCN0J4ZmFodnpRaVBpRUlZbmx6Tjh3L0kvYjlBcjl2?=
 =?utf-8?B?UW5JdDc2ejFFelpXNmN3ZUU4VmpzU3RVS2tJWVBQOVRQUWpTcHZYZ1R1dEhk?=
 =?utf-8?B?WXpWVDZzTGlyVEVVaGtmVWF6QXl0NzhGSmc2aVYzaW9mU3k1S2tFVXh1bEtt?=
 =?utf-8?B?QXRjZzdBOWNTOHFiNmdxdlRWVXN3U3RKT1RlTUZhclI5YWJyUlAvbngzRjNZ?=
 =?utf-8?B?dEd1N2J3V1ZYWDhNNCtSMzlhQ2Mvc2xXZUtmTG00a3lUd1d0RHo3UGpUaWlm?=
 =?utf-8?B?eWkzeEZSeUFTblNaMFJZbTArR29TUmR4KzNKMEFwMDJFNmdHYUF3RUJia3R0?=
 =?utf-8?B?a29JaHFsTlpNSXA0SVBSOHFKVDhzajdDTWMrcE1TTC9qZXN1MmhXWWJNelZw?=
 =?utf-8?B?TWt6MVF0Sk1wTGEvK1V2QnhUekJxc0RDYW1zWngyQW9DamlPQnZrNjI0MHhn?=
 =?utf-8?B?M1ExaGcrcmgvL0I4TjV2NnhsK2RQMytDak5YNVNQUm5EV0Nvem96a2FZS3M3?=
 =?utf-8?B?c1hQSlVFd0dHOS9FM2x3dmR1SkZOQnBFZmUxNGVsZk1LclpLYmR1TUNFUU1k?=
 =?utf-8?B?RUVreUxPcDBVUGZtWVRCN2ZQQjY2MFhGQ1JydCtLM2RQL0EyQnFhSURFcFda?=
 =?utf-8?B?N3gxZWUvYXFXMTZJSzFOTVFJNko2L3gyUGE1TkRtZDU1c2dxaDNteHR1M00w?=
 =?utf-8?B?akxicHFVNkh6YmJrT1IzWkJrYWY5MW9CZW1GWkhwNG1UZEpTNTk5cXo1OFZa?=
 =?utf-8?B?cHFRRUpkU3lubGI3bnhLdGJZUVpIbWtpd0hyZzNmZGp4cnN0QnhIcDZQNmFt?=
 =?utf-8?B?Rm5jWlBVUzhrc2tya2RnblZNODlES3pUcVhBaml6SldFS0VNbVJDa1AwbDVa?=
 =?utf-8?Q?atnqD5llXjJZIvwsfOP3VHCuO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6074ddd4-b1fd-4255-b7dc-08da630661b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 06:27:08.7849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbFuX+hFUpVatCDxXTc9ixEfI2h/AzZPsxiuW78bU+IrPBGRYwLcOVxe6DW4pVjFfRUhLdMFPpHQFJcIuFE1mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2916

On 08.07.2022 18:19, Andrew Cooper wrote:
> This will help parsing a sub-option which has boolean and non-boolean options
> available.
> 
> First, rework 'int val' into 'bool has_neg_prefix'.  This inverts it's value,
> but the resulting logic is far easier to follow.
> 
> Second, reject anything of the form 'no-$FOO=' which excludes ambiguous
> constructs such as 'no-$foo=yes' which have never been valid.
> 
> This just leaves the case where everything is otherwise fine, but parse_bool()
> can't interpret the provided string.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


