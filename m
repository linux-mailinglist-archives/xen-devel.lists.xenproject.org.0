Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49526773919
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 10:36:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579425.907392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTICO-0007EU-J5; Tue, 08 Aug 2023 08:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579425.907392; Tue, 08 Aug 2023 08:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTICO-0007Bx-Fm; Tue, 08 Aug 2023 08:36:16 +0000
Received: by outflank-mailman (input) for mailman id 579425;
 Tue, 08 Aug 2023 08:36:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTICN-0007Br-4u
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 08:36:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a110124c-35c6-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 10:36:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7090.eurprd04.prod.outlook.com (2603:10a6:208:19e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:36:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 08:36:08 +0000
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
X-Inumbo-ID: a110124c-35c6-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJr6EG+EPjaG4zPV/pZvTeQUJEWy+Ys2QanSrB6OOVCfuMSMHBrtqDUYPG0hJ0CAJpc5edKe/LWrxeRTMN/NLK9B4WPBXsVh0Gx9ieNIGBYXmwruoqXlBIJYXgmFGM+/9veQrTuqGo1UwnKG/fxGS+Tcpt2hw507xRv+9mW2OEdB6lNu2c5pCZPHMWJnzysKYa3QtJKwPLrTChM95tlOF9SZ+Z/WUa7AiOc9bntTnUA4mi7SmOIzUNNa4twg+zwg8x7qT8Q24gyx3I6MiWltl7kQXb9lY0YbGtQw4lMdqoS6oG5C6V5k0krZSPFBQh44nk7cCeBjAZ/Fe0UfqSIu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAhpQQaSgLWIXTUHj4amqaa9+AIw6ifGrKeqoVVKn5I=;
 b=bh7drHid3/csu6PFe4j+jGQ5LozTtKoNShhW/QLyjkJQ2X6rJgu06sH4EeXgJPxtwvgOHv6NkXIzPAAxZ4N23DbjtvdKLMUMFD0YF6ZQADBHimUZ5DRIXitkgU7BvyCk3ECeixPLxCeVGvA9bTvC9ql+iKeg3toDHVEm++b14CqQlqkLwtx8lZCJ6/EUPdUx20Jc6jINjMG+P25l/LhFyIPc9lg8VIYemxaV/ZK+riBIR65VA5q/UXNf/PW1ZpyYm6eGyRQ0EVmLVf0yDemba0qpeLUGVclJ2wTs7KHOFJ6bXNkZiI0qs/6E8mjhRMyy/4rGbQM3BbNwb4xtV3Yj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAhpQQaSgLWIXTUHj4amqaa9+AIw6ifGrKeqoVVKn5I=;
 b=Jx+XTET9lc7QHph143leN0Xgd0G/zKQDllqDiB5E9HI0OqIbXRAdnf44tZTPgloivVdM0HvAYMPb6Sx9Fn83AFYNBzD07sMC/zQmUCx/yAcDR3C89fTZsl1SzFbi0TQOjq6wGWVQvnxFGi31ffe98TfsREO3GF4+vPhaPfOkGuseX0Inwphcwg/vmUg7fNZl9W8ibeXddMls9gfA3UOng4ncDiHZeW0REmymNPj5QpAcp6CBFGRq5NLZTxd2KIKS49JYUnC79K9dtjX5PcHz5U0qcU1TooWTsVBDTMP1OGiI14zfRntTkgbg4xFVNOoTQSP1okA4miTPX2pvuzbEdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61ca4a1d-2589-5794-5560-db60e10a7f15@suse.com>
Date: Tue, 8 Aug 2023 10:36:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 4/9] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <63b89c627948015cc9a1c1e5d1775ee9e41508ba.1691016993.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63b89c627948015cc9a1c1e5d1775ee9e41508ba.1691016993.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: c37ce1d1-e0cb-4337-bbd1-08db97ea82fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	psREk+wu81/D6ZWB3Yftp1NEa6xKYEaTitHNYO6wwLau4rWz3AtcwHUvLGDOiUFuUfV9xrMw21C45jvq+RwtlOfaPUvHuXnC1c2M6kGSopIrUdEe97uzxfdOmkiojIM2yQDLO2WUxKP0XM2H58oX+Gkrw2mxZGL25Ojow4fEeYNf+QihoIxxSp2cFNbqXTI2Ya1WuIx5T3oA5WbupLtYGrACSysl24VgA1qICRlRmgH56zWHQCZ2GBeeJeybdQdygc/r6cps4xGjq2v8D7PRyKefSCBBDgMeJphRz/3/bSDdc5nRqJZfX28Uguo06aOLckBh3Q4jSbFrnjDsmZ4P/u/Cx5rartXL9qsIxqarbgkMJBgr/utNPVfXTa13isMxVQtMZ6qCYFbi+d+yohhQSQ3K4Hprs8b53QXkLHMgqk/SQoCnBVLym2quq5OExVCN7kP8sj9JU4YdC9TndiHTnXDhuDNIeAVzSxVbfemkT6or6kV/Tp1L3fT5KM+sv3796wCm2k6pktNXY/9cIKXnEpAazeraTB2zhoCe2TZvADOABcZl1pjgrl2Qz9spc3AzCGesjEf+d8Jn1e6b0H1XvMq2SJ8+E70OR5kq8ymCay5j8kiQPT3oy08q0JZcbj1gpmH9wQdVEvoK/2YAPkcQig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199021)(186006)(1800799003)(6512007)(6506007)(26005)(53546011)(36756003)(54906003)(38100700002)(5660300002)(86362001)(4744005)(31696002)(2906002)(6916009)(66946007)(316002)(66556008)(66476007)(8936002)(8676002)(4326008)(41300700001)(6486002)(478600001)(2616005)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDZUTUJhcnpFTzdoZzFGYjN2ZEd1QnJSc2pFYmcxVUY2SHRadEQ1djlydXhn?=
 =?utf-8?B?YnVSQWJFSlNHeXNJNGZndkVEc2haWVdjRWdIWnMwUzVrRjlDMnRaOUNwTU9a?=
 =?utf-8?B?YUhWV25raktoK3JoNXJLTGNTVG02UmhYYytKbUp4WFVTVzJZWWpQSjNoL0xR?=
 =?utf-8?B?YU1LaTl5Q0VkczNoVGtVcVpjVW1pR3JqVmNaNFl1cWE1dlEvTmc0RStRelpm?=
 =?utf-8?B?aWh6cFVpd1NDczlCM0JUNlhiMTlOdSthN1picHdGNWRoYWNpSFJ2Z3VSMHRp?=
 =?utf-8?B?dHRvb1BhMHVJMmwvZUNvS1dkb0VzV1ZSN0ZZdEVjeFRSdEs2dExVUC9ocFNv?=
 =?utf-8?B?dFhqWFl3Vjl5TGhOSDRPdVc3aTJXT3NXOFN1b1cxYWkwbEFUWTNFWEJ3QVE0?=
 =?utf-8?B?WTFoSnhFT0pBMFBxaFhIZUJjQnFYY0NwdmFXTGtjWUtmQWxRWHdPeGtWQm0y?=
 =?utf-8?B?SWZadzAyYVZsQVRYZW5ubURyOUpnSkVDVVQrM2k2QzI1Z2Fhb0l5dmpJV2NT?=
 =?utf-8?B?ZlVoVENpUERSdkpUOURPdGFBYlZpSDJiQWhROHlWYWI1Q0hBbFpuZjBZVXJF?=
 =?utf-8?B?YzJSS0ZRZTdPcTI0N2RrdGVOQ1lkSWNOVUM5NlRNTmtlSytqc0ZodW5heHhj?=
 =?utf-8?B?SzVJaWpCSm5RTFljUTI5OUVPcllQSUUxL0JMdUlJa0grSTUzUDdiTTZKeWE5?=
 =?utf-8?B?U1Y3MDZJWnJWZGhiRllZN1IxVzJCNVAxQjBqSmY5ZVNKTmxNcjBNVnd1c2l0?=
 =?utf-8?B?SUlzb3lhU3h2ZzN2bTdpSjdBZUQwWjFJSjJMdTBndVVzL1BWMHNSc2o0Y3pl?=
 =?utf-8?B?eWJjV3ZtVy90Q3Zvc1pIZkNmTlEzeWNFWmJYb01WT3BYWEhHc1QxbUtOd3R3?=
 =?utf-8?B?dHNMaUVyYlBKU2pNS3BKSXFEdTEveTNHSFBrQmphc2xhNWRPaUZPNCtqQTB5?=
 =?utf-8?B?MFB6NXhqT0NBWXpmWGp5UW1ZbklHRzdRcGVEbEhaelJsN3NtUXByZ3lzM2NJ?=
 =?utf-8?B?MU50TSt0MlNMR1BhdzBUZ1g4SUtJeHhTL1MvRFRZU2NVU3NjR1FvN21FZ2JB?=
 =?utf-8?B?Sko0STNOeXRJaDloT3MzQk5HSzFSdUN1N2dObWl1aFBDZzJHQmpraVMyMkFS?=
 =?utf-8?B?SWZhTWhDaGtYSTBTUEZLWkFLQ1NwZVcyMy9LVmtnSlFvRE9aSTZjUXNzUC9r?=
 =?utf-8?B?YVpoU0RVNjVwaURZM1pzRkM1UUtVSWcxMjh0dHhZVGJPY281TFI3OFg1ZzNr?=
 =?utf-8?B?WVlzbjhvZndEcUlsdHdmdEFaNlJNUzBaSHBKM1VQSmtjcngrTVVMQzJXTm1C?=
 =?utf-8?B?SU9FbDBMM0VyMjVsa3hUaEczM21NRE1hUFA0SGRyd1Ntdkwwa29pU1pxQXUv?=
 =?utf-8?B?dUF6U2RBVEdzMmpmN1dnTXp3MVJHbHQ3OTY4WGtpb1JBYk5QYnJ1dTFMdUh6?=
 =?utf-8?B?TUwreXVReVVWaVJTVGNmQTNIL0JVdnlQVG1tQkoxQ0ZTdEJxV3FuRG9aSGdR?=
 =?utf-8?B?NzlPQThYUVFYSDhNdGVpUmV6Wm5TVHJuYnVXbE9LOUdDN25IUlJGWEE5YXoy?=
 =?utf-8?B?TjkzTm00bnpidWFTdUd1Vk9vRmkrbUhGZHgxcFl2SmdzT200RzhQb1RhbE03?=
 =?utf-8?B?VTRGamkxeFk3bTVZRWREQVM5UFdqeGc5L1JZY094ZlRjU2dxNEFpNVRYZlNN?=
 =?utf-8?B?Zm9leFVBbGNtNFZvWVVYUzVySFAvT2tYS3l2V3JhaUYrRkdyLzZjSWhabDhC?=
 =?utf-8?B?aWE5ZW5YNUh3ZDFWdDdXVmNhTXBVeGVsTlZpdEg4WlF1WjM5RXp4citpbHRj?=
 =?utf-8?B?dEt2bEZEdmxELzhzbGdIUGFHeTBPK2dXc3ByYUMyRk1oeHliNDNmZ0NKL0RO?=
 =?utf-8?B?SlFhUDhPOWZ4L05zaXlFQ1QyZ05JMUhNSVZ2Wi9SaEhvdTZRNFhSTUhBVWFi?=
 =?utf-8?B?YXk2MzFDTDY3T2FnYWdSdGRlTHEvM0ZIUDZOLzVXbDdOUVZBVnhSZll1OS9w?=
 =?utf-8?B?QWNyWkd0dUY5VHpnQXQyeWI4MXkrUWxJTHpIOVI2Sk1Zb1ZiMUVBQVFYMysz?=
 =?utf-8?B?K2ZSOHlnNERLREl3ZzVZb2VuRForZDZwdlV3OG1OVXpRNmxmS2NqMmlHTHRi?=
 =?utf-8?Q?5L5GuvGixs0pywD9HSBDdRsv0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37ce1d1-e0cb-4337-bbd1-08db97ea82fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 08:36:08.0723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p15Ckc0JoXYTowZM5iDSFzb2qvaCVv9nM9GE8KyRu9uYVwTU6xD59sFruR7msnIppEPDnQ6UKY0McVt6yH2Dpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7090

On 03.08.2023 01:03, Shawn Anastasio wrote:
> Implement bitops.h, based on Linux's implementation as of commit
> 5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc

But with PPC32 bits dropped afaics, and with leading hard tabs replaced
by four spaces - which in turn appears to yield some unhelpful placement
of line-continuing backslashes. And with some
asm-generic/bitops/builtin-*.h expanded. Please mention all adjustments
you made, to allow for some future importing of updates to go as
smoothly as possible.

Jan

