Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BD1554544
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 12:25:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353739.580711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xXx-0000UF-LL; Wed, 22 Jun 2022 10:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353739.580711; Wed, 22 Jun 2022 10:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xXx-0000RO-HR; Wed, 22 Jun 2022 10:25:17 +0000
Received: by outflank-mailman (input) for mailman id 353739;
 Wed, 22 Jun 2022 10:25:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3xXv-0000RI-Si
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 10:25:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a9efd63-f215-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 12:25:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB2956.eurprd04.prod.outlook.com (2603:10a6:7:1f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 10:25:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 10:25:08 +0000
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
X-Inumbo-ID: 9a9efd63-f215-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAskq3TSYQOjcGS7YqvDZ0WVf+Sil3IGXpCfwL9j6eZ9dd+x9PjdlfhVQsAy/UmLGcXXwZsU/ENjJpNNwEys1r+q61FV/67bOZ2HLtNUPCNBp4OJjSliJr8F0AEvT9WPbgwEGcwCnkERhksdB9UQmE7NKXXgFhiVUyiUmqlC336KEHLl4tJY+2sWrZz+hcdM/Jks/2neXImTcPSDx9nz3wvBaIiUFGDp7KRzOwG2B9WpxhLCQGFig4epk0aGiBrqK2EGNE1bzikuvrWAxGHsO/hGBrPKSsev1bR2/Ox+FVtE/niQtImwp/goH0poWEiFrh34gF2/k2Lmfq1J0iH5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPo/RNvkzGPfFu6kMx1RbynPeIl9D+qzg3qIYnt+g4s=;
 b=JREifI5JcYw+2BM/l+0Jn9eIKh6DWpUP9J1hAYzY0/HXMjLkNHxn4UhklcTOd6E7dJa4ySpgBCD8cocqq+U7awYvJzFwtn4NSf4SBeRJg8855Jh9sfxDSqQhoapVQ23lHBdGmFBqHrbZcFtY1M/Arm1GgMc6ttr1fGc1KOQpudg+O09UfFiFA0S8iBwlCN9LAwB25xr2nEfBGncri1pfUdIlLcTkt6bwMCW3wJzkc1eFH4yCgmhG3cjnry3lTnXs3uPjvlcbq4r/kuzllwNDBidcxEAeVVRjKql5ht+Ww9hjvqxz+BVT/iOd1z3zYLzJoqN35yrHnXXj1jO1qftH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPo/RNvkzGPfFu6kMx1RbynPeIl9D+qzg3qIYnt+g4s=;
 b=G/HM5Z2cuqBGCD6W29BfMXUTd+AFRt7nZk0W5iU7nj23862J/FU2EYahQgqIvU6h8LykILVdNSkP7kxKY5gGv2YWIolSDAoOTtTRsqXl1WMWgAr7UHHN6Ky/1klkD5rvtmXCXAAJAegJWUpReSLMxQn1FWP9TL2B/gaG+OcvU64XUwcpzD1/thD0VSVWjF6bJTtYXCbq2xJZJLPeh5lDUpp7OMKglqTg1VvYlSzWmxTENClogCstaa7HeIn9eln9eKrx9NRUnHjQMkuxyqG0VEJnqsiCK2S9UEGGPtvZ6gTFObQunrNYWR7FvgaU9kWoYWhfvIHs0MrDYMiRUCplDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
Date: Wed, 22 Jun 2022 12:25:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20220620070245.77979-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220620070245.77979-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0750.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3e3b9c5-ba8f-45f6-5e37-08da54397b11
X-MS-TrafficTypeDiagnostic: HE1PR04MB2956:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB2956988411375473A9A3F08BB3B29@HE1PR04MB2956.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ATAV3WT2O2QS6MBn+gi4V8QIb0ruloHp9s6nE9Dla2xqawUiFnhOCVJcar7RowBUNOomf+t7R376Sccte0hGg3S5EAWz/47kIY1emm2feqitHiuuEjxBc9FvRBDYeJR6QuyMcHPBYDvr3oUjjYXS7KAwkkR+XBNCU4n84WraUSc8bep7oaJG2utjPgw6fItdCtCAiNHpQ0k7UrM4al/go5VH96DDMO0Ho0cDCm0VWEZPSluMATfwS/94sGky0qqjECSqZBLdhjoqbv2IKZEQQUQfeSX3Vff5+Yyb8fqh13ICY9pOKuCv8kfFHN6XLDoyNyu2FoHRO3Vfo9DhDT8xBH13M3s4pSAR2Eu2R6cwxh7Gn8nROtfOeuTxzu7A+c0dhUH12nDAA1+q6L1o76jSSOPgJ3yGc37m0g1zPo+fopybBK0sEh4EEQXK9q9XHx6d4EztnKhuSgLxV4e38KZhTzFJbIFnPThDsfnaNKeYVHPesbySDWi/Qlz1QDd7HUEUGac3q398mrMmApXJc6+nZX+3NqhK7RxdtyLCJtfV0Y/MMzsUKUnyoQ/70gIaYJE5SfhfY26CxZg52ijgV+Jd7yfiI9/NDmIfTv1Ytj4Qvks9eQ7Yx+hMi2IL8xTnJ5WwOofhptuemEzU9LucIW2Glxxw5wpNxQ1z0UfIX+6FIvMDZFhgvAqwVzuhTsfWTeTAFx1SaeOXbzc6yhZgPhf82tcsMGj/j8vM0klXoh5LS959HWJXHSZkXsiI2NmpTafVBZsk7qX9Q+2mF8LGe0tnA6pmKtwhLJo40MEtE8ij6xo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(346002)(39860400002)(396003)(136003)(6506007)(186003)(53546011)(6666004)(2616005)(41300700001)(66476007)(26005)(66556008)(83380400001)(6512007)(38100700002)(31686004)(4326008)(6916009)(7416002)(86362001)(5660300002)(36756003)(66946007)(54906003)(2906002)(31696002)(8936002)(8676002)(316002)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1d0SUptdDNVWGc1OU00ME9pRmVBb2xTeWQ0L0h6cVh4bVRvenNFVnZJL21t?=
 =?utf-8?B?bDJwOXZMUEhVU0RxdElXdkFiQStobEZ5N3p6TEJacVNnNzNSUjJmYkVpSlh2?=
 =?utf-8?B?QkVjS0x0RVBEdkdlQlVVWWhaMnpFWnUwbytHbFBHc2ptMTcwUUQ0UWt3M1JM?=
 =?utf-8?B?dS9vWnFBeldibU9oWXpFUmRQL3hUT3I3Qm1jUFZUNW5jb2M3WkVpejJEcnpZ?=
 =?utf-8?B?OVg3aHAvczFIMWVjTk5rNTh6QlhyUkZ6a3JSZWVYUTVVWjZGbkdYNFRyRUtS?=
 =?utf-8?B?RDFIbERHZEkyZktGM3BOV29VMkRPYnBEZFNKazA1U1pjbkY1NzZtM3Zzc3Rh?=
 =?utf-8?B?RjFhdnAvam9VZmJnQTBrWUdXRC8ySXYza1kyZHF4TWtUYVpGRERpTDhVaGhN?=
 =?utf-8?B?a3Z5S2w4VVVRSUYzdUU5RXlyNzEwZnNBSkU4YnByMzZiNCtpOTlaQ2JQZnJr?=
 =?utf-8?B?bEU0VzNuaFlEbElET3QxbkFMb1FIMHo3UHR5M25MdUJtemtvSVdVSStZd0I0?=
 =?utf-8?B?bENLOFQvaS92SUlXaFlhRUt3ZnZJZWtKaWY1S1RqTm9LbkxCMEFrYVlVWUlZ?=
 =?utf-8?B?aDlRYktvb3pYWWtTbFBYaEZSTmtzSTB4a1hDc2ZoRnc4SFZjakJ5cS9tMmVB?=
 =?utf-8?B?QjNtVWZLSTZGcnB6Y1orbUdmTllsbHZOMmUyQ0gxazNPNkR1MUM3d3dPL3Bp?=
 =?utf-8?B?STRmUmEvUmVaa29rWHNQZTI1TUVKenF1OFA1QlBaa3ZnQXZEcU1rZmg4bmFX?=
 =?utf-8?B?ZXZ4T2pUMUxmd2FIeHBzbWo5aDJRd1dpd285NWZMYTVKR0FmT1VMSnMzRHhK?=
 =?utf-8?B?R2RmYjdxMXdWcElvR2Q5dnMvVkxtSXpSd3ZsMi9ORTdTU1Rha1VQaWlCYzA0?=
 =?utf-8?B?WmVqTHBKM1QzclFNWGpPbDRSUXM4SGN2NHkyUnFuS1VWTlZ3b3c4SUZXSFR1?=
 =?utf-8?B?ZGRseWZnRG9NdXhENU5iVVJSQUlFT29UL0NFQmhlQlZmeWR6R3pXb0prWFhN?=
 =?utf-8?B?RlBSRE9KYXVHSUVLajFhTlh0N0treEhrdDViYjdVcUlOVzM3dDBxbEhxbHN6?=
 =?utf-8?B?UW4waDNIOUJvRmhKamFVOVJKWllZN25EVFdtOWZkcWRBd3MwMFNwbVdlMGFT?=
 =?utf-8?B?QlFFY0lidGNCTDZpYVFLQnprVkQ3VTVNYVNuazYvVnVLTm1Ua0Uxc3pFNGhB?=
 =?utf-8?B?ak4reGRKL1pjNWVpa25VaHo1d0hBNEh5SjlvQXdlQWRtYSttWjg5ZlpBckRP?=
 =?utf-8?B?YmxKcnp4L3JSRnVZVWpWQmxrbTZKMy9FTDRncE4xUlY0eWZqNnNRd3dKUk9Q?=
 =?utf-8?B?TEtYL3d5K0ViMDJYQ2hWRzM1VWF4LzJRd2NsNU8xTGtkTDU2WFNPZnA3TG5T?=
 =?utf-8?B?aVFIdVNpbTlQZEMwYVRBMDFGV3ZnUzF2MFVvcytJT3drdkhyRmViRUFhL2hk?=
 =?utf-8?B?cVh0QjZtVjV2WXA3S0xjSDZFQkQ1UUpsaGpKTTFBZTBSL0U5bDBMRHZVakdL?=
 =?utf-8?B?NStXQXBvTHp4SXdBV0JTbWNOVGMyNUowNkZKdjN6RUVFNDFpOWZSeC9kdW9B?=
 =?utf-8?B?U2dGS0N2d2dFbWlUS1BHREthaTBYYk5RUUtjYnpsamYzRVNRUnQvQ2NCTmZi?=
 =?utf-8?B?UXVJbWtjNmhuK3p1Y0IxZzZoQTlSWlRNMko0Z0RFUWJTUjVtZDkwTk9YU0E2?=
 =?utf-8?B?b2lnR3ovQ3hURlo3dFRQMVIrelByRzYxREpvMldvalIvRi9xdXVOK2l6eUxu?=
 =?utf-8?B?M1hkak8vZCtIaWZmbjlvY1R5TWIwajVFb0hhVTloVjdTTEZ2UU9FeWhZUjVt?=
 =?utf-8?B?ZndNWkoyUklDbE5rSGNkb1hTWDNCa3hPWnhEK2pwNVJLeUVWL2FlL3NIZXFK?=
 =?utf-8?B?eFo5SmxxdWRCK2o0eDh3QUhHUWFUZWtGLzdxSHUzeUZOY1ZGSmxQQzZDbEk3?=
 =?utf-8?B?aGdVWEgzYUJYb0VveFdaUm1tVkV0L2J0dFhWUks4Y0lIcWJuQW91eUNVMzUw?=
 =?utf-8?B?ZTZpUVIwWlFReGNmWmkyVnpab28rOW5lK3RFZ3o0c3pYVDlFdXVpYjdsamJM?=
 =?utf-8?B?eHg4czdPMXhmRHk1ODM1V0ZjREpxbDJtcUovMVNpRGVkZUN6VnpaMDlwVllL?=
 =?utf-8?B?Z0JJU0ZrUWJtUktNS0krbE5XbHNySitMc012aGxRRHo0UEN1Z1BPRG50b1Jr?=
 =?utf-8?B?V3hvNTNUTTFGN2tBM1E0am9Gem5TUGxRWnFKSHNLKzAyOUJvREtsSXB2dTVS?=
 =?utf-8?B?dTVSYkpUOUVZVUpESGxtSHF4QVBCakRYZEQ3ZDJUMnVvZ0htdVVXTlBGN2Jn?=
 =?utf-8?B?RXRyQmMzY2xTSE1Ham1ieXllQmFkaVBSMTdudEYyVUNwcnZBNzdUZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e3b9c5-ba8f-45f6-5e37-08da54397b11
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 10:25:08.2513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0x6DKQLUcVvg2F1v4tfzAB3Hiv0u92yVLfdnXC1h9dzD+ibkRA8jD0rVMlhyMACLXw1DLQ841NBaWtagyOvbrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB2956

On 20.06.2022 09:02, Michal Orzel wrote:
> This series fixes all the findings for MISRA C 2012 8.1 rule, reported by
> cppcheck 2.7 with misra addon, for Arm (arm32/arm64 - target allyesconfig).
> Fixing this rule comes down to replacing implicit 'unsigned' with explicit
> 'unsigned int' type as there are no other violations being part of that rule
> in the Xen codebase.

I'm puzzled, I have to admit. While I agree with all the examples in the
doc, I notice that there's no instance of "signed" or "unsigned" there.
Which matches my understanding that "unsigned" and "signed" on their own
(just like "long") are proper types, and hence the omission of "int"
there is not an "omission of an explicit type".

Nevertheless I think we have had the intention to use "unsigned int"
everywhere, but simply for cosmetic / style reasons (while I didn't ever
see anyone request the use of "long int" in place of "long", despite it
also being possible to combine with "double"), so I'm happy to see this
being changed. Just that (for now) I don't buy the justification.

Jan

