Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1DA5B34C9
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404116.646456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWasS-0006Hp-3M; Fri, 09 Sep 2022 10:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404116.646456; Fri, 09 Sep 2022 10:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWasS-0006Ea-0U; Fri, 09 Sep 2022 10:04:48 +0000
Received: by outflank-mailman (input) for mailman id 404116;
 Fri, 09 Sep 2022 10:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWasQ-0006EU-Pd
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:04:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbe4f2ca-3026-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 12:04:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5570.eurprd04.prod.outlook.com (2603:10a6:208:116::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Fri, 9 Sep
 2022 10:04:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 10:04:43 +0000
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
X-Inumbo-ID: cbe4f2ca-3026-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAl7DgmYUUx6AeR7TifPQsb5s//6d39y6lcKuxCRYHO2JRfROZNGVuETYWTibOC6BPVE9kaawgPtLtyIepOvvXIjNUiXwH0uqDs+EXdUVan76k3t6vzqw2LC3W1MD7VWHACbVv9nWxZk4W4EoxrjgOmUIsqjh2xtMidOI3tAQ2b09qm/TzqyT2D1jdW69+YUUSVzYoI2VAj/GTAYOcqaCxznFIzTbVdDW8oe7PwBDR8luV/oTRYfnuRl6Jfo622O3n3mcKzkmO9i0s2EQr7KDsdCYhUSUMjlzMXfaDFlRyBaIIUFJrtkq+oYyG3ElthrT/KqAY9HIyappzuTiioXdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xs4vdQmDQTe9kAwvVnupcLLjjgW3PAzWEIfeQrL0Ga8=;
 b=TsgKSYOGMwTBsAXHdSRZiUiCKI3ZKoxECSSZiN0Zz/ru1jCFVAyf1n/nx5cLP7huiLmX8Hto53fOhTYxnJqy2EhDEAUeBct/pI2IeTEUrwe+373aD84PReUXJRdkKZYIFeAOcth/uonNC+u5387o09gSFMD9918OHLq4ARgIFRJCfUcsSv9LVLqr4r96k5StzBZIHL2gzJ55eSPgVpaWxDfnSzCWbwhw5EYW4hOr5Z8ZcfyTMTYWgQGuEvKE7EkYARfnzc8eofoIoW+uvXvvD6QZF0Df/6F1Lv+Wv3rul5uM+cf2sLxSwFXM2RhQoMLhq0u58N5ofuOqm+mtn85x6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs4vdQmDQTe9kAwvVnupcLLjjgW3PAzWEIfeQrL0Ga8=;
 b=jIirmfZtL1CKVlRqv5fDzMVfaBlkQtIpAeupK8R7y/kpWkXp5TUAzpLTCJ9spfy15mz7d677Wob7IdNrW2u6Wt4YA6z4KGDuc/J8YWSKyXRnBLsz/n/I2GKlu5TjPh/WaRmbYVo5P9jfSqy6R4qu1Y5dMNTlY3toj3wILo5k682zWmLil48c13yzBOf6E2ZfDDq8DEIpASa7j/g2Jx1vgO9scolHSwodHS07mP9vWGV5pNylpEqFKLMJYbGMYmUwtZajIvKJcc461HNzp8xChfhGPSHWHsRY/HFKUvRH71jAdWAm+5nmYN2yPly6lWFwinXho/BnKRAjJaRUpeb0Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3da17c12-1cbe-165e-94f4-44face9a181f@suse.com>
Date: Fri, 9 Sep 2022 12:04:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xsm/flask: adjust print messages to use %pd
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jandryuk@gmail.com, xen-devel@lists.xenproject.org
References: <20220909095012.4251-1-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220909095012.4251-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB5570:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9246a0-75db-4b4d-6311-08da924ab7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x38vSf2MJRdeFKuhTYQaLDF1rbJ9cfYSRSbi8S9tvV1XpYkkVxqDRhUKC2EkHJSKMZ8nl4/944yhD5fwg516EWsjhtUH+alrKGKVmecobRN4hpNCp/ORNNj1L45SzBDHBRnwbs7a87ycAEruGE9nqwSEvDuKgkxcUYYuYc9ZVJMxgYvgTHC+qMUrlXxUl2sSd3JzV3G4eHfojmO/oRbypRUM7gi1A1re3shGFET8zvgzXDl2A4hZaM1y9mKZLQbD3RVDBRbGHBjMZWU6XNP/SNM0oQp6m+fKpYxEeNlxlJ3WA6a2soVNXs2q3bzyHEoJgbib4e8eWvbNpcvEIyRqqp3Y/bhvQByX+jCWxqB2Xpv1l9nKcVa1O0tPJpwL7Oc1hEqT2KqgnT11wN057uCduf/J/ccw2E5YAIJ7rO+LvKxgeWM7XprpR+gq+BuEwSSG/VKjQJRGFtR8jAhtOs38E/WvJV2fIo0IxUt2yPDcqUcmDjzNvs5CAgsGxYm4JV0X+eb0k6UvjaAjTHM/NQ9wc/t8FODIsGnvBVclbnBOQjhzus0q0PwWRN6hzmLJGNUsR7R+7yxXodeb1Bon5lCo5xq/eCZ2Lo/wJ2w7vJmRAU5Ld+Q87Stn717IY3Z8VOa1meS89yEMA+Gm4jXbhIsJUb7w3tPEU+N6480VGDRbsp5UN8GaTRn/Ze0sYWKkG9UWMna8Fxv0MyyuZSyR5eOFvcMEWzx8nzWn9Zp33GaUUic51QU9ECPq2c92VpKBFXLmiu5A4F48CYa75nb6YkCMhT6eNvDqI/GvAc+SOlAIHwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(366004)(136003)(346002)(39860400002)(66556008)(5660300002)(2616005)(8936002)(316002)(36756003)(8676002)(66946007)(4326008)(66476007)(83380400001)(38100700002)(186003)(6916009)(478600001)(6486002)(41300700001)(31686004)(31696002)(2906002)(86362001)(26005)(6512007)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzlEci9kU1JPbXA2UGcrcHpUN2ZHT3Vqb1M1SEg4cXd3Y0pNOGF3blZ2SGtp?=
 =?utf-8?B?OTlqRERLOGVKa2lKMGprb2FXOHhXWk4rVlhHbmVCd2xWZEVBZGNvNHI4WTA3?=
 =?utf-8?B?SzhHSFFWU1dpaW1yVUxPU1YxY0RRc3VzSEdtUDJXSWJpbEFmL2gwQm1ELzlD?=
 =?utf-8?B?MzY4amd2cS9jSkc5dEdmZVcrMTJQTkJEWHNaczM1cjNkTkt0VjU5ZkV4OHBS?=
 =?utf-8?B?OVF6Nzlkam5HcnNzdi9kMXFXZWE4bzJPeXVCNVFTOUQyUU1qc1V3M002TWps?=
 =?utf-8?B?K3oyVHZtTTRUZXQ4YWVseFJvdjM3dmx2ejFUenZ5NC9XeUxSSXJYU0tKYU10?=
 =?utf-8?B?T3gyQm5zbHNkY21PMFNqRmt4Tit6bjJIcmNJSWI0UFlwOGVqQmNPb0lUOGVV?=
 =?utf-8?B?Yk93L2JYemxNSzFVU1RKalFCaU5FalFtakdYZlptSWc2emZrbWNHb2NTeVlH?=
 =?utf-8?B?RkpUSkZDd0tKYm1xQ2tEUE9sTEI1eHg4TDlhdzNpWXhUSHNNTENXdi82YWdv?=
 =?utf-8?B?RnZZZldjMmMwRUIvdThzQnZKSzIwbTdPRUlSdHBreGtjanAyelkrNm9mc3oy?=
 =?utf-8?B?NmdXMUh0anRXVmsvM0JOMkhoa09OdmR2Njh3ZEtLQmlVTEJ2QjRKdEo1M2lD?=
 =?utf-8?B?SEhibTlpNDhMMVNiMk9OSVo0cE51UmgrbkErdlhBMmJmTThVaHBUQVhwVTlZ?=
 =?utf-8?B?ZzJKdmhMKzVldldNZVNoY2VsdVRVaDNvckxmcmZqeVp0N0hwejRXQXpPSVpX?=
 =?utf-8?B?RGUwVnk4ZE1YaDZCTzI5OGhHZ0lETDhrci9YMHZlNFZCK25veGp5cFZzRE8w?=
 =?utf-8?B?U1liZFJHaktyUUxNN242b2dodzhkUnZjWnZQZVQvUkJqWDZMdGtHT1l3TUpX?=
 =?utf-8?B?eE8zVFp1RHFmTDdGY0NpeVBuNzRYcXlhdExzb0h4K2Z4REdtblEzTlNXc1NV?=
 =?utf-8?B?VkdjL3ZiZ3pFSkdJNUtmVnAzMm5pS0V2L2dNdmZYc2FWNjF5ZmxuR0FVMnl3?=
 =?utf-8?B?VU1LazV2d0wvdU1yM0JWUzJHV3RIcGNkNEd0aHB6a09TY3RUcEZUeU0vQzUv?=
 =?utf-8?B?bUFpa1JDRkxYUk9MSXY1SnhCZ1dYdndjNy9LM2NaeE1rZHRiSHlFdUF6Zm1S?=
 =?utf-8?B?V2VKT1ZRZm1PUFFGK2laYnNaeHI0VnA5RjlMUjkyak5ud3RBeFRVMUhKZmxQ?=
 =?utf-8?B?d25jQ3BYbEJnaE5rNllYMjNJUnRGQ0JRVUlyWHpZZ0RYcE9VM2IzSmUvdlpw?=
 =?utf-8?B?ZTNFREF0VjE5RDQ0WFU5UUFTeXlQQXZPcDdGdFZZS0cvU1gvR2YwQmp2NkZj?=
 =?utf-8?B?ZGNrODk3R09TVnhVQkg2T2N3SjAyMjVQQ0oreGRiNVE3SFlYb1hOeTV5aE8r?=
 =?utf-8?B?aE03S2tXaGlzV1BhVUdtc1ZpMDFHSGZnMzUxcXkzUFV5bFN6d2htVzl3alRC?=
 =?utf-8?B?TWw2eFIzSVYvN3p6WmxidUhoaXFheHREQWcrTUlvMVFrREpRc1lvSnpyU1ZQ?=
 =?utf-8?B?NVNTWGpURENsVmRJd3FNUnF0QmFBNHhUaU9qam8xRUpvT0ZiMUVmWXFYMWhN?=
 =?utf-8?B?WVkvODY0SXhEQ1ZKTEpjRW9UOVFacnpXaGFzMVZIcjZrKzN0N2l5MWZKSnlC?=
 =?utf-8?B?VEFUajdadmVzNVlZdVNQVHkxbDlMTFprbkpiM1lMR0NjMkVkM0NLeStuYmNn?=
 =?utf-8?B?a1h4R0dHeXkxVlRmMFFjQlZrTTNRVms3alByamF1ajNWZ0R5S3ZRdEtwODB3?=
 =?utf-8?B?VzFzWWZ6dUMycGNRTzljclVwRmlGckZvZ2tpVGdONEVTZHJyeDEzYzc3RGpG?=
 =?utf-8?B?cGZBTUx0aGV0ZG40SWM3b3ZIN0hEUDVHazlqcWN5Vk0zRGNPS2J5STVER2Fw?=
 =?utf-8?B?SVZmWFd6cHBlU1RoV0dmTFRFWXZ6OVpVdUtNTjNFYmtpOU42MHFvNTYvYkZj?=
 =?utf-8?B?NVQwUnBydDRXUnZQMmEra2E5UkNmUkRONjRhQU9pSGpnWTVvRUtHdFI5Zmd3?=
 =?utf-8?B?UktmVlFHVFlSamhsblQ1cGQ5elRiUEdZL29Dbm11aHk0bXBmcWtsamowRUho?=
 =?utf-8?B?R25RdmlJbkM3L3lDOWN0SnNoWW15VzNTSVY2b0Q3ZENqTk9JY2wrUmEvTXZv?=
 =?utf-8?Q?H/ZZJlNVT/AOrK8ky2TZ7azZT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9246a0-75db-4b4d-6311-08da924ab7ab
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 10:04:43.4294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YsTD+e8vAilvWLSTS1zDTPJwwqjAZlKcmWar3fVbSH5n9OMx59uIrHY5P1kPqBYebH+I/DLZViqrAAFzcei3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5570

On 09.09.2022 11:50, Daniel P. Smith wrote:
> --- a/xen/xsm/flask/avc.c
> +++ b/xen/xsm/flask/avc.c
> @@ -566,14 +566,14 @@ void avc_audit(u32 ssid, u32 tsid, u16 tclass, u32 requested,
>      if ( a && (a->sdom || a->tdom) )
>      {
>          if ( a->sdom && a->tdom && a->sdom != a->tdom )
> -            avc_printk(&buf, "domid=%d target=%d ", a->sdom->domain_id, a->tdom->domain_id);
> +            avc_printk(&buf, "source=%pd target=%dp ", a->sdom, a->tdom);
>          else if ( a->sdom )
> -            avc_printk(&buf, "domid=%d ", a->sdom->domain_id);
> +            avc_printk(&buf, "source=%pd ", a->sdom);
>          else
> -            avc_printk(&buf, "target=%d ", a->tdom->domain_id);
> +            avc_printk(&buf, "target=%pd ", a->tdom);

Apart from switching to %pd to also replace "domid" by "source". That's
fine in the first case (where both domain IDs are logged), but in the
second case it's a little questionable. Wouldn't it be better to be
able to distinguish the tdom == NULL case from the tdom == sdom one,
perhaps by using "source" in the former case but "domid" in the latter
one?

Jan

