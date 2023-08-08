Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658F77394B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 11:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579505.907504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIsl-00010Y-MN; Tue, 08 Aug 2023 09:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579505.907504; Tue, 08 Aug 2023 09:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIsl-0000wS-IY; Tue, 08 Aug 2023 09:20:03 +0000
Received: by outflank-mailman (input) for mailman id 579505;
 Tue, 08 Aug 2023 09:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTIsk-0000hK-Cp
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 09:20:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf52cd76-35cc-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 11:19:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8887.eurprd04.prod.outlook.com (2603:10a6:10:2e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Tue, 8 Aug
 2023 09:19:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 09:19:58 +0000
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
X-Inumbo-ID: bf52cd76-35cc-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzRSsHT3A88ZYnQzzid4kJZR61AJt04pxrTLD+XLdHR37eFkUsKSGB+ctPTmgqwrE3fpbp7vqawJXfqA1nd1is7CNF3ZIuUqrdqsHsTGZqSixXplZ1A1l6CFvH4YlUMo92TL9/O4EH7nUCdw63udjzKI50kJzR0BC0maz+akn+NiFONfpD4jWMECLLXjcANKuka+QkNvq3WIqP9ZeGl6VeCwwMXu7lh3jxT+uadDW1I2Juva16uNqK2AuuflJ3KrU56jj9yGY+msVQk2CfFe59zo7IziG5JZwimZdCAKKGBAtRPbek+hKyevKtpn4EZwic1BnsqIEH2sNvFw7lm8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kX3Jb1H36shYj6GK+7YjzVzxy2ryONoD+u91GGcdpM=;
 b=djFiDYo7/lbPmP9JX1WhtnLG3xpgP/MO7zaoyaCCQOhEFp++5JgiMAnkPSCslnsCUqYPIz4lsNEmYahBJZxZXolqjQ7PEa0LhFTMvSjyOPGCsvt+o9SNymQO8526dr0KVaUfab8vj+YKu2zPQseDFLH+TNVfKCOHyVIr9gR7RR762samogvYsjHolpzNyF5YVfCaRbLViQcoPUVUsDDmWzXxhs/py+/1nM3c6Aow3vy3SJJPHebqd1Kyk4ZwsRKSK7HyqxtK8H56feSjCWVj8GCY3wnmLqIF3/g5vbyS1zowHGiqrZzszbEjq2CF2FlcRooMfKs8Xlb0YJapGP+Ptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kX3Jb1H36shYj6GK+7YjzVzxy2ryONoD+u91GGcdpM=;
 b=Z8uuGm8sxBIvufyXdDhEEDF1dW5UvwSpq1fDyZOjkFyZ9UN9vYnBoAzNx01XB8cbBs+6ASsn4fw9Lv5b34I+lh4xWXf9y+/TOWuoOcQbPXQ9IeTMt4iWYW8qkAJE5cuwAugb0zjRTCE0ZebILti4Sv9yuCAKTuWEL6YoZgWZJmZyfb/HUbohKR6vlkwI3MA3Ubkui+VnWeYS3wma9ZRNU/qjvJKbZmn4m37ujM5otePv/3/ebWM1tJTMfTqz52vPDodVar1R+Xs57fER6A4gLF2rqbJFKNirzjHWgfkNb23q7MRN50tAlnqr/0ChpLZx0lEEhoCU5lwfT3FIP4DN5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01fbd921-8092-aedd-33ec-ef170d8ec6fc@suse.com>
Date: Tue, 8 Aug 2023 11:19:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: MISRA violations in hypercall-defs
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: jgross@suse.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <5972799c-99a6-73f5-eff2-b24469f7428d@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5972799c-99a6-73f5-eff2-b24469f7428d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: 8462c055-604f-43f1-47c0-08db97f0a2b0
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mEukfATbTrjU/12pmu+izgqg0VhyhcdLZOGcw+8vx86+NtF/AOvIi1dPnD3YTVKk4loZN7BvpQBO7VwvgqlcRBw1IRWH6V6lVEUodCPXnixcEU388VMoA4BLyc2Rft0kTWmHTMX0PVtlF6OfCnA3ci9zO+sO6jdEzfC+UovgwfDhrcbx6SfWojNjJdMVw1VDO84Qx9RlK6W2tVzOG5zLenTP6huaVvw5b37ipiE6+aViFeipWyYYhAwLsSvl7kmDGu1J+IiYgrgHNxU2AIbJW4b1ZAaKE2vaxny3tXD1e053eeRtQvWhPx87vligoP6IWIwkrMjcwOWHqLvaMwDKLBYkA+f9h2w1iFwbuaE2tjP7iy0IK8dymkYhysVoXCAzlvQKCVI8a25Rs7K/SHR5IlOMVUjGRuJuZzehfY+R4vhxIysDfKQdKYgRW19zNuKR4vRpuEJMSLJOEoK27DvEDTbn7mX6tawPEzmg9YdZX1j8xf2yh+mU3fGx8J0+P9M0BlxMLj7gLvtmHanc1ynckuTbJshkrlLaxtl3tmY1bPQBSy/DIa2wnYYu73g13l3/2rZ1fiIcdxRvsF3pQBvBWNBbFA0SAzfD015sYFPO1nlQqmhmi4QYj7gcURlf2gVnOGRb5yrSGDIhk91WTFZwiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(1800799003)(186006)(451199021)(66574015)(41300700001)(26005)(2906002)(31686004)(5660300002)(8676002)(8936002)(2616005)(6916009)(86362001)(316002)(53546011)(6506007)(31696002)(54906003)(38100700002)(478600001)(6486002)(66476007)(66556008)(6666004)(66946007)(6512007)(966005)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWt2SkdaQjhMTlQ0V29jdk0vVE5Dd2ZPaHpoWStMRkhHZXdTdVhpNE1haW11?=
 =?utf-8?B?bnlMcytJamhNNDAxVk1CMmJ0Y0MwS1ZQQjB5eWpoek1YVjJTV0tvejNTWFJw?=
 =?utf-8?B?SmlkMUw4eFRYMzdybEVFWGJjTDVFUUkvMENadm5VVzdEcjhNNDlVMXNnQ3V2?=
 =?utf-8?B?MVhVREdiU2drNE0yTmdVRUZsVk82Y0N1MWFWdGFKRWFkTHlGZG5HelY0MG54?=
 =?utf-8?B?T3Z2UGZpRmR6a0dBSG42Z0hNenhhSURFUXVWQ0hpM25XZ04wdk5LcFgwNUk3?=
 =?utf-8?B?R3pDRWhOUHBzS1A4MHJPblNFbk13RENGTVQweURncnBMeDV1UmN4Y1ZhU0VN?=
 =?utf-8?B?ZFc5MDVIU3NjMTkvMjdSN0h5YU4rMVpGdkRkaTdXZ01IbUczN0VWOXBxMjgz?=
 =?utf-8?B?eXMwRUE1aUd5TXFkV3pxYUhWNXgyQXZFdzc2U0NOYUwrZHRzVUZrUWhjUzYy?=
 =?utf-8?B?TUN2dzlzNU04eUQrMUJYUmFwN0pwOFhVc0RuSUZ0S3BTcDFSK2NLWS94WWpN?=
 =?utf-8?B?anV1clVnZEpwYkZ4Skw1bmxobnErZ1FPZ3o0Kzk3cnFOZFU5MzBSRHNhYjUz?=
 =?utf-8?B?T3lWK3JWK2paVVlLYmxRVkltN1hxUHppVlkzRjMwK2tteFhXTkNFdmhEbXRx?=
 =?utf-8?B?THl0bkZZL2NpcFo1UnhDSVdsT0xMVW1ZY0VBbFhlWURlSEJLSnluWDlaQkww?=
 =?utf-8?B?ZGswdlIwdzFxTWl5ZjVBN3VHWTFTa3N6QjBSWGMxMmEwT0k0VzBiK3VsZUNs?=
 =?utf-8?B?aHkvS2dobDRIaTZyUjlVTzNGWjlyc2dEWWwrUUZzWC9CdmtjeFdIUTRLMm9E?=
 =?utf-8?B?enFsK3hOZFBaY1hHa1VnT3R1WnlrODVpZzdONVNDd21aSGk3cnRFN1ZkS1Zk?=
 =?utf-8?B?Y0FBY0ZrWGlsSzVKT05MdysyaEEyS2F4SVQ5T2EwV1RReTk1LzdzOWVJMVlL?=
 =?utf-8?B?Zjd0b2JCR0ZreFlOZ0VUcVlZN0pUc1VoRWcxay9EYWI4MXJvWS9rTm16bWZi?=
 =?utf-8?B?Q1NESys1YUpNN3ExTmRvUW4yQ1F0V0plbThnU2lUSDFsKzcwcU1xbXUxR24v?=
 =?utf-8?B?djIrODA1M3VUcWhaOUVaVThxKzNqT2oxUkIwV0FuMWw1ZlNIb2x5RkE3U1Mx?=
 =?utf-8?B?Y0ZrSDRPSFErRnJyZ05aencwNi9aSkZxT28xMFZPemE3bUIvbURSOVJVd290?=
 =?utf-8?B?d2R5T3lIUEh6UUQ4dllXRENyelJhTkFuUzlqRnAvTG52cXA4WWk5KzVQSmJN?=
 =?utf-8?B?Z3lvT0VqSVU1aXRuNFFyS2U3NWh0YTc5MTQyRFgxZDlLWWJ1UTc5ZzYyR2hT?=
 =?utf-8?B?TjlUZCsvY2JhSkJPcGQybDl3Tkw4RkcxNjFBREhXMDlQYVZrK2pEMGxXckFV?=
 =?utf-8?B?bmU1bUpNM1o0VG9wYm81Yy9GNC9tWnpiUTdvMmZnSTVXL25tMFFqWUNhcVZW?=
 =?utf-8?B?T3JQMzkzVjcyd3RUUEJuK3ZROEk0Tk9QeTRCNDNYem5mNHhYTkdJRmxKanBN?=
 =?utf-8?B?WlJXYjVkbE5VVUsxU05ZSExCaElPMzJYbzFzdmw3NGZxaHAvbER1SnR2RWhR?=
 =?utf-8?B?c0Qzb1QwLzJndkZ6NTJQTC9MRnRsclV6d2hQTXJnMDBaQUhLVVJzS3lYRlJG?=
 =?utf-8?B?S1gvSVRvQWVtQzIyS1JuSmErdk9Qck13MTIwQzVOU1pzRHJwNitPQ1kwamxa?=
 =?utf-8?B?b1BkQ2gvaGdrYU5FSEptMWt1ME5DenMrQmEra1NXMURqWFR2dE9QbHNOaDg3?=
 =?utf-8?B?a0xvUXkyaFZkc3ZEVERuUkQ4NWwvOG9LR2ZSZDgwUjdGMk1VSG02Z1d0NVpB?=
 =?utf-8?B?UnR6TTUwWTJOVmVNOGFURXVwT1pYZDlhZDQrR0p1dGNvQVh2M1l5djAraDNh?=
 =?utf-8?B?YThEMlJER2o2cmdPUHFGaFNIa3JGa09SeXc5elFMajFvK3R5TGswNmNaanJW?=
 =?utf-8?B?MmJaQTEyR2hjRmhMYVVTNCtLcHlSZGNsa0xjeDhlQXpNNzdsL213Z1VYNjVF?=
 =?utf-8?B?eFprT2pBVlV6UVVlYXdxZFUyQ3JyL3FlSWh3ZVRvWVEybUJyZ1h6bkFRV2VH?=
 =?utf-8?B?Z0NmaWRmL1Fac25XWWVucmViYmtVUzBTOTYwYW4vcXQxVHNHY2pKUGk1N01F?=
 =?utf-8?Q?FkKFax5dQQ4IYmRUYCbDo3xsA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8462c055-604f-43f1-47c0-08db97f0a2b0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 09:19:58.1750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRhIx5urfCQyRmrCAcSG1vm1syoXuNdSrikwXOZ9ZE6Uy1Ng7yL3+9oNXGG4q/1QQgFRzhH2J8jauQPbVlDymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8887

On 08.08.2023 10:47, Federico Serafini wrote:
> Hello everyone.
> 
> I would like to to ask your opinion about the auto-generated file
> xen/include/xen/hypercall-defs.h which contains some violations of
> MISRA C:2012 Rule 8.3:
> "All declarations of an object or function shall use the same names and
> type qualifiers".
> 
> Such violations can be seen at the following links
> (copy and paste the link on you browser, including also the characters
> after the '#'):
> 
> - arm
> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/ARM64-Set1/218/PROJECT.ecd;/by_service/MC3R1.R8.3.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/include/xen/hypercall-defs.h"}]}]}}}
> 
> - x86
> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/218/PROJECT.ecd;/by_service/MC3R1.R8.3.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/include/xen/hypercall-defs.h"}]}]}}}
> 
> Some of the violations are due to mismatches on the return types
> and the use of `ret_t`.

We already said that ret_t will need deviating. For parameter names
it ought to be possible to suitably rename, like done elsewhere. Whether
that means renaming in the generator script or in the definitions likely
again needs judging on a case-by-case basis.

Jan

