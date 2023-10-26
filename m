Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B536B7D7D28
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 09:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623499.971382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuLc-0006OE-3k; Thu, 26 Oct 2023 07:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623499.971382; Thu, 26 Oct 2023 07:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuLc-0006Jy-0U; Thu, 26 Oct 2023 07:00:04 +0000
Received: by outflank-mailman (input) for mailman id 623499;
 Thu, 26 Oct 2023 07:00:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvuLa-0005pw-EG
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 07:00:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46a3ffa7-73cd-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 08:59:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8390.eurprd04.prod.outlook.com (2603:10a6:102:1c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Thu, 26 Oct
 2023 06:59:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 06:59:57 +0000
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
X-Inumbo-ID: 46a3ffa7-73cd-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jygDBIWgNztLvu0DLqlNI22lb0+KS99lddalB5RyqhlIdm88qwQlKc+7pLof4quB6DD5U0VRvexxhlSpwGERaTZqsHtv0IemWaMzskiHj7qj7tOd9JUGLJYTvLtj/ut6RrU8SECVXt3/w6mQXTmRe1UP0iVf7gmAIv/m96vyylyeNnRtXHPkFqm6sEEfUuFblO4j2BQTMFMDbxFiWF6kEjv0d4KBIEhPTCEgqhPZ0h4jYQVxQSB//eM+NjPdIa5gBjxIng8Jb1ctZbnhs2uzXGE9AUjKhxb5rBMyfKpfv6xooafnNt+d+a3Xh609iE32XEer9csjf9WVinsVj04CnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwRENgDoaudvlm9RedMCBNrIsbxN/q8CsM7rcTpx0d8=;
 b=eJVta3TgOyhoH/NRfq3IaR0n8iltLfFtesucQMiryQ+36b2Ub76hiNJN0nRXE+LMRZ/m/3S7FHEFRKfkUZMFvAP1P4brc4M5G8meOeAA4RetYdI4DEse2s/fEQ0B0++mnoD0LpGTdonOGo0fH70SvCb7PLJaQuo16F6AfHwNPgW2w5kHNPPAw+adelS3d2vNHhLBIHZVIiAC21+gpQBNN4Nu4BL0EERVoAUkvlAg9E5i1jd2r/w40QaFyUkpKTqa5eZ7S3Dp7MzC5C0H8iw14wKBUGqJH+TnzlX95qkYi9Jgff93jTXNi/GdKw0c7gl7OGf1yspQIsnqI/XU3wtG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwRENgDoaudvlm9RedMCBNrIsbxN/q8CsM7rcTpx0d8=;
 b=BCqcvGcHBmSThTQEuggaRtqzCG4Pp4dNd7eW1kjwfT+vxt3OmZpT9Wo4B9JR7NCnbfSha8XePcmt59e+i3seG6uo8eHnzC+m9ykgm2QG5qT8y+bmuiG3PvqRJp5hC5PK2aYdewdUBnZ3zkcOmy+cP0qEXIodfSdZ/sJGZIjWHiCHFbsAVRTDply9VuCfKlJYOQaKBGNl06jyBycD3GCRdobUH/kCiBe8AhiG/7I/Hu56hwYep9MIGRmpp4+eRcLC30/2Vy51mKTmUpr4w6jsRHBlDbmzGRlhIZruFZnTWaT9tngHcnoHFFCy8VSw5gLVXSXJCMQntxrxH4aOLPTvFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <abd5c802-00c0-eda6-05ef-d10260ddb383@suse.com>
Date: Thu, 26 Oct 2023 08:59:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] misra: add R14.4 R21.1 R21.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2310231628500.3516@ubuntu-linux-20-04-desktop>
 <967caedc-3d10-dee4-6614-1b9dcc0c1c66@suse.com>
 <alpine.DEB.2.22.394.2310241753220.271731@ubuntu-linux-20-04-desktop>
 <1e2991d7-b7b5-2fdd-38e0-ee1eff607f0e@suse.com>
 <alpine.DEB.2.22.394.2310251759560.271731@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310251759560.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 6403b832-9b6d-440e-2473-08dbd5f129d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zA5yC2I2Xa80sUzwom3h7qjqFbNoUuw848ykjhDyFT9gBpdbG8X9y/9l4dMI0ytRDMdyMZSsCD4WRWy2rav4FofdXPzhd0A4rFuuva9QLQC0jSprAmi+YGIfz2IzJMguY+9YPMGjR4KVge/5bGb6H9z6JX6iYEBDuTC95jwWRe5uIyGuonyIdbSOSzdLQRakuB6FLSiXKv8Hhu3v2ReVRJzS2wc/HkbxRuV23twNWHEUyFBJe6MIw0k2r8fSKqGQMx15zZFNa++VYJdHJclRD7+gCJs9fprFCxaCDryQV8pMcLtfn58JeJ8dUvIY3kPXj6PU1BsqE0QDRwHBZSx6ilzJYGk7lDuWlKbuXfYRdjQAvrxPm9drAzBOZcv8AahFCJRBfGVGp0kmwvFQULB2iTiKTGzVq/jpdv3Vg62CTtqUXNBchmGgfcaF1i97MouqlZ1qnOtBWaM5QEIu7IERUGlO5WP1OQ9CLKZRkIue9cATlLJn+xTgz7hek1ceSQOMqpKM13FYXl3aW5suiLzfCqX8cTE7kiyIWpPE9UdnPb+fS7v+6BE5uHAB5m+W4mL6lcMxbAhGRBSQVc8UzTvOhAsh2hwD/Uk9V2M7H+lh1Z6tnomv2vwFvFiK1zCgV1IfK/65ErKCYLdYiJ3yT6BfRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6916009)(31686004)(2906002)(5660300002)(4326008)(8676002)(36756003)(66556008)(8936002)(66476007)(41300700001)(86362001)(478600001)(66946007)(6506007)(6512007)(6486002)(53546011)(2616005)(31696002)(26005)(316002)(6666004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWJqYjlOUW1GZEEzKzhuamhDcURYVExXNmQ2cUpzOGZwbis3V2VTbDc5R3c2?=
 =?utf-8?B?VWtDbW0wWFlySzZ4S3Y4M1FOdU1za3hSaEs4bXZvUTFXdWdVdGdUQWJsTE1z?=
 =?utf-8?B?NVBTZHhFQkVUVElubGpVNzNWY0FQMk1qWjhNY1N0WlNXU3JTQmRtZ3c3TjMy?=
 =?utf-8?B?UU0yUm55VnRGNHVtY0RpZGNnVWJTMnhPakxVSFZrYnR6VXFkaUQxNkFlSWlT?=
 =?utf-8?B?WHRNa1ltZXZ0YnZTcUlCWVRSR2c1eC9QRXJWam1vV09VWWhxYlp0TWZid042?=
 =?utf-8?B?M01FTlgvcXpwSjNpTElSY25ranMwWkh6VGwycmlyd3NaMm5CR1A3eXZCcUh4?=
 =?utf-8?B?SnRPOWZMVkhqQ2c2dnIwVWFGRUsxSnoyclo1YnhXQ1hFZWsraWpGSzQrb3lT?=
 =?utf-8?B?bE1PQ3ZLU20wUXFmRlZSVElhSGlDcWx4R0EyZ1l6MXFEU3pRbjAwQ05JRDBD?=
 =?utf-8?B?ZnRnTjk5YVRYY25LeWxTZXJuZ0xsdkppMTJRNVF4Q0wrRndVVER5QzQ5b1Za?=
 =?utf-8?B?Z1VvK3hMMkhRK0l1RFNQOWJ0MUFrc2NLd0ozVTcwN21pbGhDY0FpaG5WYnl3?=
 =?utf-8?B?ODFZbk9IQ1liT05zb1VpZjl1aTVHSzhIRlpCSHY4Z1dpK3FoSG1CN2dwb0d3?=
 =?utf-8?B?RDVPRVJrZW1ZS0JtQkFtRElHeXljSXdTMVp5T0t1czJBZ095eXJiTWhiV0h2?=
 =?utf-8?B?RnFLVWpKTXd5WHU2UVBhMWVJRVQra2pWbjFPUHZkdDNId3JQTi9pNHYxalFj?=
 =?utf-8?B?cU12eElGaFB3aCtmZlpMcWYwOWQxUTRUR0JwSGdoaFlSanFNYmtkc0hPL0VV?=
 =?utf-8?B?aTlkMDRXVWxnOHozMG9uSTVFSjF4SlljdUNUNng3Y2hjenVMTVhrM2tqMVZL?=
 =?utf-8?B?MXBxYXVIWHNmT3BwV3hZTUhCdW1JbHdDNUFObXVrZ0p1dGtPSWJ5Mmh0UlVx?=
 =?utf-8?B?bjBZVm56anluK3JiRjAxdUcvd3J6K1VzZ3p0VUhIVDloWkhQTzhhUjBQaG9v?=
 =?utf-8?B?di9xN1grOWlYanFuNk9md0VSU3RVRzBGemVENCtaOS96cHVkMzVOR1JKNU1N?=
 =?utf-8?B?M3dUWVMrK2Y3cXNsTDFKMDk4Nzl2T1BXZFB1OGpmQThIb1VQbGJ2b3FiSXRn?=
 =?utf-8?B?cVhldlkxaTk2ZURBQmg2VlNjYmtWUk0weHZVcHMrQVFKTElLYTV3Si9lMXJl?=
 =?utf-8?B?QUs0MDlZWVN4R1pTVlYzTEZ3SGpTNkVQZkFTTFo3c25BNHdMME9hdjZ3NUdo?=
 =?utf-8?B?aGZwRDFLeXBaTCtENUo1bDRGRlVmMEk5QXp4Y05FdGxCZjFSbS9zRWxneXc1?=
 =?utf-8?B?aTlPZDZpS2N3UTFpbml2dzNOdWo0NzFFSWRZQ3hJT0JJNUNTT0M1bXllUHNj?=
 =?utf-8?B?TmhjbmREdTNhNUtVQnlrcXRnM3ZLK05CSlZzOERycmM1aWFIRXRtVWJwak8w?=
 =?utf-8?B?bjFIVGp6dDJLdmdEV1RJelNmeDYreEphQlNVYW9zOTNES0g3VmlRMkFzU3Zm?=
 =?utf-8?B?czZiQ28xZngrOEJ2QnViOFJLSTRxQVI4MEViLzYvaEJhU3dJZ1R5OVQ1QXM1?=
 =?utf-8?B?dWY1MXgvY1lnK2RabThlUUM5cm9vS3lNZXpOQ0NWS3ZCVHpnMHl3UWxiYWhL?=
 =?utf-8?B?TGFBRm0raUNtRnVreUgwK2FUNnJZVUlmYWtjYjlEZzVrY0k4Mi8zc3Bzb3V5?=
 =?utf-8?B?enBlRmdyZzNGTHpTVFRpWUorRGpoN2Q1MnhHbHNGTWoxVG42c0NxUDl1bmRO?=
 =?utf-8?B?QzNoWkxpVVRFRHlpanNFbE5oMkpWVkw1UHprL2I5ZFMzbnBVQ1Y5V1RsN3kv?=
 =?utf-8?B?L21nNTBoU3dGWDBKbVFVU0duT04xWWRWRDZEZzZxaFJOQkFCbmdkS2M0QWNu?=
 =?utf-8?B?VnFWMjlVcmNJRjl0QlQyQTZCVXY0RFZuQ2Z5REVuYk9LbTBjYmpYb0hReVN3?=
 =?utf-8?B?TVNTd0crZDF1RXFLNmxEWTE4OGs1SVpTY1IrVWxEL3FHWDZUdndUeUd6RDgr?=
 =?utf-8?B?UkJTN1RacXVVelJSVDh3a2FhQjlGZ2gzM0c3d1A3WGJ0d0NsVEVPa05FNkw2?=
 =?utf-8?B?Vi9EekJybUt5THZzUmlrYUtaMnkrcWR2V1lPVXlTaWNNbGV6NWRPWlUwajFp?=
 =?utf-8?Q?/BZ4i69aYeHWdqS3bnmdsYVWq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6403b832-9b6d-440e-2473-08dbd5f129d7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 06:59:57.0095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOMpNoVJ0wk6YWysq/uzezd/vvuXe87VFqAw4Ysghv9ciebmCr2NjNGJMGlKlKmg1ORFxpxCq6rCaK5/jPqxpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8390

On 26.10.2023 03:16, Stefano Stabellini wrote:
> On Wed, 25 Oct 2023, Jan Beulich wrote:
>> On 25.10.2023 03:15, Stefano Stabellini wrote:
>>> And if we can find a clear general comment about the usage of leading
>>> underscores in Xen I am happy to add it too (e.g. header guards), but
>>> from MISRA point of view the above is sufficient.
>>
>> But what we need isn't a description of the status quo, but one of
>> what state we want to (slowly) move to. The status quo anyway is
>> "no pattern, as in the past hardly anyone cared".
> 
> I guess you are suggesting something more like the following, but please
> feel free to suggest your favorite wording (it might be easier for me to
> understand what you mean if you provide a short example).
> 
> ---
> All identifiers starting with an underscore are reserved and should not
> be used.

Again, no. Identifiers starting with an underscore followed by another
underscore or an upper-case letter are reserved. Other identifiers are
dedicated for a particular purpose, and are fine to use for (at least)
that purpose.

> Today Xen uses many, such as header guards and bitwise
> manipulation functions. Upon analysis it turns out Xen identifiers do
> not clash with the identifiers used by modern GCC, but that is not a
> guarantee that there won't be a naming clash in the future or with
> another compiler. For these reasons we discourage the introduction of
> new reserved identifiers in Xen, and we see it as positive the reduction
> of reserved identifiers. At the same time, certain identifiers starting
> with an underscore are also commonly used in Linux (e.g. __set_bit) and
> we don't think it would be an improvement to rename them.

Everything else reads okay-ish to me.

Jan

