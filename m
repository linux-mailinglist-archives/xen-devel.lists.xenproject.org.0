Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FDF64C6FC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 11:21:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461996.720151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OtF-00063H-Lf; Wed, 14 Dec 2022 10:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461996.720151; Wed, 14 Dec 2022 10:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OtF-00060Q-IU; Wed, 14 Dec 2022 10:21:29 +0000
Received: by outflank-mailman (input) for mailman id 461996;
 Wed, 14 Dec 2022 10:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5OtD-00060I-H2
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 10:21:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2048.outbound.protection.outlook.com [40.107.14.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10890151-7b99-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 11:21:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7069.eurprd04.prod.outlook.com (2603:10a6:800:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 10:21:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 10:21:22 +0000
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
X-Inumbo-ID: 10890151-7b99-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLh/wcqNnYJMX7ZEFbgkH555dYT12GRlpNQi4SiNW5f+yvPFcBEvgwM+vI7ZUDhfLCtSKcvgKmnAStuRwU2yMf5l17Sgdva9XdrXoRwaPXEN8KLC12jof96O+m12Kin/b9d9XjfyCxHZuSNEsQCIPo8u9wYdcgztQqKrvBkYvGYzPx6Jo5jV0u/15wasbvaquXv+G9e00fak3Ng3PigzBdKW3HdYgcgTCJrVeaBA6bD7VmQ6d4chjholQMNYJCZdYtpjhXJg34mEmpNHF5AWYUBHKjzxHRfnZXYUKar/K7HmSHt7SRWc5HaqVjfR766gfx3L13MQZj5YzBs78D9rQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTUGgviKbTddHLQh/4IWDvQPPFqEPSjZ9Pgapw5bwX8=;
 b=L2iQrBQ1c6dTrrw+qN/SjbBhCLHF+cLvlSuPciluBnpH2wjIuY3CdDaAhSJEGq4qWA3Pkrs3Oh3loBNHAZsILaZZ2kLmipLZ3HBoLPTlpg65n/tG/P2oiMMCgUrdCPtXYdhE274469UdK+lqnfmlk64a/8yfKKuWKHfgqb5EYE8aPj2hJvkgLmq7ySSBRemKoKrFIfzJKIuR+dww5X/YHcVNHWtLPCYYQDMQUViGGbeGzac89oy7UYiMFrquC2io2ybN0y1tm9huKv2ImVYr6iPf2g2NTr6GdWywRuR9xXee6AEK1q2Sfc2OdLRGC3mrHpKuvppspro4++/H0x87oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTUGgviKbTddHLQh/4IWDvQPPFqEPSjZ9Pgapw5bwX8=;
 b=JGHzARbC5cTVfI1J42N1Ca/XgJbQPglFgX3rjA8t++Lxphgx/pOJZAC56S1ZttCokqx3GYDTZG29Bd2fml5qIw8Eo6wfU2l5FRLcdALaYDEHYF3OU4fYjMwV98u4BH8F9bx/iWq1kCPAHBUNl/IDv8KdcEvWXenkW/RXVLR9K+EgejIYCXuQaDSF5uS2EiyaT6Tb6VOmJMlMNaIGwDuMgAlbOeSYCcxDTJ5rcSvaNuGay6jA0ZW8fUtX2YI15jlOJn0801lyRzMvGmkIQaJmwGh6DS/+UXzxZJtvZhvQ0y8YdIZSJO+sPhtrjfYUHYj1fcHBwW2wGSMubyS3Va2sOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a3c8cd5-7f78-aaaa-0338-d063bb04e357@suse.com>
Date: Wed, 14 Dec 2022 11:21:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 1/3] xen/spinlock: add explicit non-recursive locking
 functions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220910154959.15971-1-jgross@suse.com>
 <20220910154959.15971-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220910154959.15971-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f1e8d6-97ea-4385-5f97-08daddbcf2b1
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PYv/Tt361kXs2kMjGMZbllt1PHtDAuxsUoK+P27sjInscQIEJY1Jk9RpOh09HleukRts6+QZaddV1fki25TCWAYxvqxs+3KIsmjT/3aq3IWQ9QPnL+gK41dp4nnoaNhhUkxOcd28hBPhNdqXdz+sU4NACnJVrRL7K90rDIF3tz5mbBx9ns/+JABNGxPn1oI+/+9px7oNapfRQQ+Xq+G8mbCy2O9lGSBuZ8t/cokyfp3Cyu6VGy+pwuZCbdHb1WAogaJ6S0SgodFtN0kRryHbCEA48jUgXDZLVXkx6VUmqvgYQcUUcuLQzd4eyr1E6G4DNzI2/2UXFQcE0yvXWjXly7YzArA+cYa1sb2Y8/Nm2/njA7Fu7H9UDCZoaKS5YURnr5mlYArFUaNH0Ta3kcpO1l8NQMdjQJsToBwp2uzqrPvGqZwa7Heqz7swT0YaRuCJ6xmCnRTzNvK/bWts4eumFAZmjgP7l8GR7u/LTysEJak7RR2TWBZYqFeRnK0fFDdI0kFrOhSzIYLPmF4K+nk0XhMYMcboo2lmgR9qkBQIBRy+iWPXOyzx7gxDsXChDH0uC4Ig8BerA6ugd3BttaIEual5ilPWkliQEKe3EmhrZDhNX2Cqn1tDsXCw3C8vM82JuK2n4uq0VotTBCaKzqbgbuL8m60UZUdTZSSStdW7HhZtxl43WgqbKhuXUyqsrjpNdn8tSUDFdFO+oVNzn1Z2X0qZgRdqB0IiICT50V1dcxkoRWT9c+FgKIsdciBXqP0VS38mLqXeQSrl38t7uvPxOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(2616005)(31686004)(37006003)(31696002)(54906003)(86362001)(6636002)(316002)(478600001)(6666004)(83380400001)(36756003)(6506007)(53546011)(6512007)(26005)(186003)(4744005)(2906002)(7416002)(38100700002)(6486002)(41300700001)(6862004)(8676002)(66946007)(8936002)(66556008)(5660300002)(66476007)(4326008)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGZxR2xqOHNlSWxLZVFHZHUxRWhBUlZiNFZVajJXdVB0eWQvd2RFeVNNY0pP?=
 =?utf-8?B?UGt5NXduaDFBeEFadm9MSkV6T3JaakphVHB6QWRuNnhnT1RrUkRkbnp3Mk5B?=
 =?utf-8?B?Q1VzTVo1TnVlTFIveGJ3TThTaHZxMG8yR2FBMEMvMjBCL3hrVjlXeExnYkxn?=
 =?utf-8?B?UGYxMk5NamRDTVA4T0xBSENIYzJpSEZEWkoxMmN6Q1ovbzh4dys0anBKYVJP?=
 =?utf-8?B?a3lCWVFYK3JkbmQ4NFlabVZKRVpTanh4SXBqVEs2OU5tc1cwdTMzTWxFRnhj?=
 =?utf-8?B?QW5LQ01HblBOb2dHYVIvZVMwUkRFZVlRcFk5YmE5d1ZGMFNUVGQ4cmlCL1pi?=
 =?utf-8?B?SUxrMDk2eUpSTUZQeHcyd2owSUZEMmR6RHhITkVrUUNmQklBb2RheE9PSnNn?=
 =?utf-8?B?VWlYbXVBWU9vbEJjQW9YTnRPY29tOFNITDdxVGdJOGxhckN0c29FZityVHgr?=
 =?utf-8?B?dElYTyt2b2hvcjlJZGxHaHBSNm84dy9kTDF2TWNTRngya2ZBbkhadStLWUZE?=
 =?utf-8?B?OUYzbnp6SUVQNllYSENvQmNHNUZhd1Zzb3B5NlNLb1AramJ5OGwydllIL2ho?=
 =?utf-8?B?amR5VkNlNXlzMFpHS1NHek9zWGd0WmV3Z2xtaThwTEFEMW9IaCtKN3F1REVW?=
 =?utf-8?B?WDhWQVFVNytzcEx2OXNnL0k1NVk0c2tyb0NuWnVvd0ExOG5lVHI5ajEzNzkv?=
 =?utf-8?B?eE9hT1RYdTJiYlV6Q2p0cFp2SGozT25Ic0hKd2twanp5MTdSWFNXSHdLbjNl?=
 =?utf-8?B?dnNncFVuWnJlWmlVdlRoMU9yMW9IL0VjeFpWa3UrcUw5VmJIQXdsVUMvL3JI?=
 =?utf-8?B?bmJ1UUZzZ2dtRk1aYzM3dmtVTlpaMGpjUUtEWDRTWkRqZHNBRDBzNzRXMmhM?=
 =?utf-8?B?aGhHMmMxQ0JNVHJUbFFwTVRTWnpidzFaQ0h0VVhLZE9FUDA2OFNEV3BOOURP?=
 =?utf-8?B?STZ6UzdoVzZGZXVCNXFMVG9lKzdsSnMzekVRcURnMWpNL00wS2xoeEJzNWJu?=
 =?utf-8?B?c2ZRU2drOXdDMzFsV0xLbXhuNlpNZWxlcVptdTU1RGtnS1EvY2U1dXQydit1?=
 =?utf-8?B?emVOT0dFNVJsaStwVUZ3Zkcrd0FnZGlpZVZTRGlXOVVsL25JT1NvS3FpWG14?=
 =?utf-8?B?YmhaN2FvdWJ3ODlnQmNGa0UzSUVKK3MwNjlPbjZsV2dLWngwKzMvRFVjWS9B?=
 =?utf-8?B?L1g4UDVIZXBwYkFjaTdsMHBLSmlGdE5tRHkxSVovTzlNZmF1NVVDdnZOY2pS?=
 =?utf-8?B?MVdtSlMvZHdIdGVnV1JKakVzbHdndkRoL21SdHlsYUZBbUo1a0J6eXQ5dE5J?=
 =?utf-8?B?RVFlcmtXMDlSb3JMNmNLNUZsU2ZmS1VNSTlJOXFxLzNaZndiS1ZjRWY2SThH?=
 =?utf-8?B?SGJlN2tFQnVZOVNBenRldHdpaXl3VXorYkU3MUxaeldxaEF3Wk5xYkw2b2xm?=
 =?utf-8?B?SitZdzFWR2hHaDAvV1RKSUJxMXRYclNBMnYrOUs4ZTY4allIa0pyZjZpL2N4?=
 =?utf-8?B?ak9oZEJZZDRxY0MrZ0REdW93R3NHTnhaOE5wRHhJVGxwclFmSlhJUm12OWdP?=
 =?utf-8?B?dm50NmVlR3huazYxbUNHUWpnSjd0M3dKV0REZXg4a09UQVhjQmljbzlEVGpr?=
 =?utf-8?B?V3V5RTlmSW9xSDBpZnFyRDdHNXkwZzYxbUowM05UeCtqNzhHRGZEWHNXUHZR?=
 =?utf-8?B?MTRTMWRkUmpuU0hGNmNGYnhIcHAxUlBRVzBVWEEvY2ZvVzZ4bG9Pb3laRk02?=
 =?utf-8?B?RDVCMGJpNWl1a1l2ZjYrTk5SZWx4NzNaQTlwLzBWcE1CdkRMR1BaVmxsUmJa?=
 =?utf-8?B?RnNkbUlxK2pUL1M4TSs5NncyaVQ1c0doWmtycUdIQlZ1RE9PeUJtT1ZGSlFu?=
 =?utf-8?B?cVpLUXM5REhLNmtNUHJmQXFmcTVWZTZtQTYzQ0VibGJEUVh5NlRBbWhDU0RS?=
 =?utf-8?B?cnFvVEdoRzBNM0VXYVh4cU1Wc0FqYVVONzJYdHhPazhKMzRBN2NvUDZwdDMz?=
 =?utf-8?B?WEJnajFVUmFwZUtWcGp4ZWZCYlFaUzZQcm5lVG5TRTRPWUdHWVdJeXQyMzhx?=
 =?utf-8?B?ZU5jdDB0clV0NUJMV3NITDNsdlNxajlQd0paK0ZjMEUwL3Bud3c0eHdPMk9W?=
 =?utf-8?Q?FB04KCkD/Qj6V+PN72Zume007?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f1e8d6-97ea-4385-5f97-08daddbcf2b1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 10:21:22.5553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2DHIEjCDjmxY0kzWjGgFpxJ4yMVM+9DjCeWq3nZse+xcyJA+F2TbhPqZ+XN4SwD8+5qKXwAI9Exr/IW84F//Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7069

On 10.09.2022 17:49, Juergen Gross wrote:
> In order to prepare a type-safe recursive spinlock structure, add
> explicitly non-recursive locking functions to be used for non-recursive
> locking of spinlocks, which are use recursively, too.

While I can see that something needs doing, a function name like
spin_unlock_nonrecursive_irqrestore() is really unwieldy, imo.

Just one minor further remark:

> @@ -64,7 +64,7 @@ void pcidevs_unlock(void)
>  
>  bool_t pcidevs_locked(void)
>  {
> -    return !!spin_is_locked(&_pcidevs_lock);
> +    return !!spin_recursive_is_locked(&_pcidevs_lock);
>  }

While touching this line, could you please also get rid of the !! ?

Jan

