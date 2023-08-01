Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058D476B61B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574212.899455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpek-00078V-Ui; Tue, 01 Aug 2023 13:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574212.899455; Tue, 01 Aug 2023 13:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpek-00075B-Ro; Tue, 01 Aug 2023 13:43:22 +0000
Received: by outflank-mailman (input) for mailman id 574212;
 Tue, 01 Aug 2023 13:43:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQpej-000753-T5
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:43:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 601c0d20-3071-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 15:43:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8175.eurprd04.prod.outlook.com (2603:10a6:102:1bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 13:43:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 13:43:17 +0000
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
X-Inumbo-ID: 601c0d20-3071-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kaa55exP1dH53h6NXOA8g9mLqzi0vWhJQ7Qfvoa8ODFOexS4acFTMp0xDZxsQhCuiaARLbImLpFXjY3RQap19K/HyFM6ThPBrlixHIor6eGoGQnTWAXLK05L6nFUjus6ImW8TP8D3q128YBHn0yv2DDQIBRT3zU52h4WingD7KzrY6eWB0JCfeRrWAiolIie1tgU1IXHaHzD9QYPcf/enPp/eMroMSRuNDt1rAXmSLrCzqceFhuMCCGhUQ5ZOAgM3UUD7m1hya4ctXBmvtpNpfVM8c1EgfDsXOYmkxLgjAd/YoByuvmlitdWSb5PcI6QNcRiUA3++X1knrLV6hQg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4fHfafuHZMx5+gVWA6f0qz5qDoXR/Uug1l1ra//4ec=;
 b=EVgNO5z3DsC16/2CjFelOQV1xXnFQ3dJfChH7MMdyQ37TzNImJJkJNTXUMFtyy/UZuRQl+fhK0vowciR/Hp6UUkH7u/vVf7dhtxToflDAsa5mipDMiIod0zV3iA9rBknTgOCVjTe6chNso9aD5yiugic9HoBbvTn/dA6dU50aKU6YOjqr78yhhWHRpt5jOeMW0RCb0MxBA7fUezavoNozY4SL3tskTWwfabCT0XAmVqe7G/Nt/jMk6sHKC/IoWUFELEAbqFMLhAz+JLOR8tatI3AUsJJ+u0MK5+bWzYLNw9ocxkg0XPARlwFka6KC/6NIqVnCprhB3Go4Bf59Ci4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4fHfafuHZMx5+gVWA6f0qz5qDoXR/Uug1l1ra//4ec=;
 b=zL05pNQ8Yqx0j1Nan+0x268mp3ciKxTeYQjIy4GnQ0vvmiddfFoqZByiv5upRpg/PUeieVMKERtyUnXih2Y5lxiS7SKnBRIHIz68kdiLMc0msG/m5NumfTCRlnmG0xN+yZxivTsagw3qIy3C1JC6DOjMdWfqwKQx/Cm4ZyDieEk8v7jo32zDpJ65stmLXXDxg7CDMTYiyWCvUWTlzkRpOMtxWDxnwyKTqvQ+qi/y/HTzW8eBtdoKwWTNmJRijyWyku/lq6UB2zgr/p7z5wIcLu5+phF5mxluOubpZHFPE0xClVwZUZI8QzCDQ0TUuIFxnFvLSBQ8Sg4mCvIeF/ctwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d76dd1d-3001-3d5d-996c-7bd3e0319a77@suse.com>
Date: Tue, 1 Aug 2023 15:43:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: xen | Failed pipeline for staging | c2026b88
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <64c90a07e72e5_2810b7bdc200923@gitlab-sidekiq-catchall-v2-d6969f8b4-tmdbc.mail>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64c90a07e72e5_2810b7bdc200923@gitlab-sidekiq-catchall-v2-d6969f8b4-tmdbc.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: f18b262e-57b0-4c1c-3d02-08db929542d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L1+TjBuhQ82ffeJBPZaREd3VIvavG5cTgyrOIRPZChQbIIsW8cJ4AvUbIdUj4g9I6xuJanReiiFXKl4woPWIBPzRrY/UkuAszBEfr36X/fVVghfAhRAAVBWQKhq8RUpRe+oTQMuRatEvGJtcK2XRLboZHVACKiTFLlYujwCTpuVwp10Tz5JxSZyOq5AzvD08pV3tnSj6H9urOTRlEv9sFbtH1iQahBCM/44RfvJOME1fnRUg3tJK5UngvoFrhfu9L5Qxo5TN/xhWFC47eojfBySmW0LyMhxy94KtTSpApdc57uSHgwA5pBgycJL38z9rBfoBKkagF1S3UDjjxVHM2WqHW5wNXooSgBS/FMc+qqRxhojCA8smzl8ycg1jKcxBzwS3ySo3AinR18SMZ6W57xB8o1jK+XfrlBeDFApjfzloMpPzEUXiL2zpX6QzmpAZ16pQyGcZZRichhNAkbCNWTzyv/Kr9cQ8Brpkn4eigG26tJGaO2tZq3KOK5tqqXpJjRCiZ2MPPRxCwS5WGCqH4WBz58yv1bKIi242YkkIjkDtdr3lChBcoHAXm8h9g4Wj0saFJS/o5Mhcy361VRRQV0T0f2nI/5NIYY9Za4QZYQ0qfqqAgcBaS97BvrhWqLfujEylvv8EmWKI5rppstgIuqmMi6pXpfRHSxEnRluKN9qoB+atZkWSz15z3eMv6vwy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(6916009)(2616005)(83380400001)(2906002)(86362001)(186003)(316002)(31696002)(38100700002)(31686004)(41300700001)(478600001)(966005)(6512007)(5660300002)(66556008)(66946007)(66476007)(53546011)(6506007)(26005)(8676002)(8936002)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTFKTGNlanZOTUdwTVg5M3VLN1EyN2Z1MTdaTVhJYUM1NVYrZUFWL3I3akox?=
 =?utf-8?B?Z0NURyt3ZWlVNm1JNWV4elhIdVdiWFRsdE1qKzltV0lNL25sWTU5ZFZqK09V?=
 =?utf-8?B?NFJ6TmZpQWZPT0VLdTZnWmZETkc3SVQ2cjMzazZ4eXhhbGdrNm9RWEVtblpB?=
 =?utf-8?B?NDdwdDhEVC8xWm9QNVEvR0MzNkNncHpKV2JqcUdYeXJlYnoxUExUbVBKVndC?=
 =?utf-8?B?NmNQYjBGTndaSmRXaERtSGUydWNyakJsUEpZZWtqalFkeEtzRkI1cE5keGRD?=
 =?utf-8?B?UVhicVdIZXRQMStGSXdKN2sydHBiQVp1bjZlQWhZWmlqS2RRNTUrTXg5Ylg2?=
 =?utf-8?B?TURmS1JVcnprTi9icnZySnplSGhOaUNQd2RsY3NCb3hYMVlBcEZGKzQ4MXNI?=
 =?utf-8?B?a3l0dmdkTHJKb0x6NHlvclRvU2xEcjhFZ3U5d3N3bXU0UGNEYVpuWnByNUxZ?=
 =?utf-8?B?QTdPMnpIWXVTQi90eE1GUEw3L2xBTjhTTlZZd3BGVzZHY0ZvbVE2S1BmcGNN?=
 =?utf-8?B?OUcxUjdFVUtna0kvWm13bXZsa08xem9nekJEV0hlQ0hmVW13Ym5iSTNTRndC?=
 =?utf-8?B?ZnlEek00cjEvK3hSOGgxWXQybHd1OGFpSDVlUVRDaUp1bmFYUVVqM3E1MTlB?=
 =?utf-8?B?eEIzZGNGdzZLZnVlZXQzSHRZeG5CWlhaNTdLSy9USWV0TzlZT1RRRVhCVGdG?=
 =?utf-8?B?NW1mNEUzQ2w3WGpnaVQyS0FsYXVKb1h5eTU4aFpHUVFSMVdiRU10ZlpGYkNH?=
 =?utf-8?B?TWZINHVZMmo5Q0JCZXNXMVNLTTcvcGQvY2hrb3ZNTmFlbTVwRDEvcDJ1T3FG?=
 =?utf-8?B?MXdlZkNscVJ6eG1CanZGWXRmcHV1RGY4TEpDMkQ4enNxM3o4WWJ0M0kxYU9k?=
 =?utf-8?B?aU9qR2RsaTV6VGlzeUgwanphVEJHUTVxaFkxOXFITTFEZjN2bGNzbU4vZEd2?=
 =?utf-8?B?Wk96ZFIxenl3eE5ZQTVCczNFWUlURUlZa2pRRHpSNDZtUUNlVVdQN01oN3pN?=
 =?utf-8?B?MzdZaXFwQzc1OXpuMEdYbWJxMWJlRjA3NU9SWlk0TXpWNjd5MkIzQ2ltVkJQ?=
 =?utf-8?B?L3ZlVWZQSm5zWHB6S1I5RmdiUEpYVkJaMWtPVGpEdGhGS1MxSVp5TXM2ZnRn?=
 =?utf-8?B?NGppTmsybmZUTFF5UjVNNzhWT3IzbTFZZ2dYU3RZck1DcWxZYkVwM3BkbnNw?=
 =?utf-8?B?ZjVmNTFkc0VTNjdPelhpVVRTVlRORU16MWlSaldzdStjLzY4Z0o2dUEzWGoz?=
 =?utf-8?B?c1VtcnRnTGFQVEtXcnY0a3JoL28xZ3ltS3ArU1dwKzAyQmhRbm94Y25LdlIv?=
 =?utf-8?B?eG5QeHdkdkxZSG93TjJxNURzcXhCQzN5Y2JBTzlmQ2p2SVFQSDlFTVNmKzYy?=
 =?utf-8?B?UE9vT2ZsMW4wRlJqdDJ2TXRnNzJkWmtxQmtRWFFUWGlNZVNtWjdyNkxmQ1gz?=
 =?utf-8?B?VmRjbnErdE5LNTZBSkRZTE9aQWRoVlgvTVJ5M2MzNTlxTW1qdDBzT25NVGRO?=
 =?utf-8?B?dlJHYXhQcFkyaFlGeWJQUjRUU2FmK1hXck0rRHBEeTkreHhKRU9lcU11MGc2?=
 =?utf-8?B?TmlWRGlMK0hWM01JNVY2WkVxQ1djanNkZWxST3B5NGtxckd0Y2FyOHBWMnNz?=
 =?utf-8?B?MXlRSW0ycW14Y0VKeGRGbjhQY25HcWN0QlFNQmFoZHk0dW1UL3pSSGIwU0tM?=
 =?utf-8?B?UkFrVG9QN01TSWhnQUhNTU01eTdSR082YThJZTlDV1hMaDkwV3VaMCthNlZD?=
 =?utf-8?B?MEJHTXBwTjQzbkowT05mOVZrRG1VZno0ZDd2UmswL0RPR2ZMUk9vTnk3TWJv?=
 =?utf-8?B?b0R6ZGYxeE1oZUZSVHFST2Q3bnFtZ01RV2dUWjNLOGYwVHNicnJvaE1NOWlp?=
 =?utf-8?B?ai81aDJ4OXhhS05LMHJqSHlDMkQwMHQ1U21Hb0lzNW1TbXl4b0xhOEhuYWFP?=
 =?utf-8?B?NnZ5Smt6c2hsSy9mWi9ZeVB5Um51SFpTRzF1ODVSZjFXZndqRHgxZnE0Zjdo?=
 =?utf-8?B?YUVjSEJTanlzeVIvcGhIY1pGdXI3WGdvL2R4dFhQaGc3VkxoRFl0T1V6SllN?=
 =?utf-8?B?NlowSEpMSHRobTI4NlVpQWRPazlGWm8zMUV2cjFzTGkyQ3BzSk1ySkxaNGk5?=
 =?utf-8?Q?lV7BhuNLmcQR9bOh/Hitvg+i5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18b262e-57b0-4c1c-3d02-08db929542d7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 13:43:17.3318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IL5SjDQ+KOt9lVtIEZRaW/67tTobAbyQLqavEBQJRl5YAd4QkNjPhAsOcdOH81SAt7gECE1BldePsrTFOW7sWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8175

On 01.08.2023 15:35, GitLab wrote:
> 
> 
> Pipeline #951705012 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: c2026b88 ( https://gitlab.com/xen-project/xen/-/commit/c2026b88b58cbb6a84e2885c320a8cfe08f8ffc8 )
> Commit Message: xen/arm/IRQ: uniform irq_set_affinity() with x8...
> Commit Author: Federico Serafini
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #951705012 ( https://gitlab.com/xen-project/xen/-/pipelines/951705012 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 11 failed jobs.
> 
> Job #4777864648 ( https://gitlab.com/xen-project/xen/-/jobs/4777864648/raw )
> 
> Stage: build
> Name: opensuse-leap-gcc
> Job #4777864742 ( https://gitlab.com/xen-project/xen/-/jobs/4777864742/raw )
> 
> Stage: test
> Name: qemu-alpine-x86_64-gcc
> Job #4777864646 ( https://gitlab.com/xen-project/xen/-/jobs/4777864646/raw )
> 
> Stage: build
> Name: opensuse-leap-clang-debug
> Job #4777864652 ( https://gitlab.com/xen-project/xen/-/jobs/4777864652/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-clang
> Job #4777864633 ( https://gitlab.com/xen-project/xen/-/jobs/4777864633/raw )
> 
> Stage: build
> Name: ubuntu-bionic-gcc
> Job #4777864636 ( https://gitlab.com/xen-project/xen/-/jobs/4777864636/raw )
> 
> Stage: build
> Name: ubuntu-focal-gcc

At the example of this (the first one I picked; I didn't look further):

../qemu-xen-dir-remote/hw/core/qdev-properties.c:974:1: fatal error: error writing to /tmp/ccxkeJPr.s: No space left on device

Jan

