Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D347D2A42
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 08:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620973.966871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quoH3-0000Oi-1n; Mon, 23 Oct 2023 06:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620973.966871; Mon, 23 Oct 2023 06:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quoH2-0000MO-Uw; Mon, 23 Oct 2023 06:18:48 +0000
Received: by outflank-mailman (input) for mailman id 620973;
 Mon, 23 Oct 2023 06:18:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quoH0-0000MG-LF
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 06:18:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02hn2238.outbound.protection.outlook.com [52.100.203.238])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04877682-716c-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 08:18:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7989.eurprd04.prod.outlook.com (2603:10a6:20b:28b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 23 Oct
 2023 06:18:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 06:18:40 +0000
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
X-Inumbo-ID: 04877682-716c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2YoQMi0ybY9PflSMuHqJQSlD2wHYMb5t/w7qHAc6vJ1dMaTnrAQmNY2sZANiFdbftTiNSaKyvS3JezQ2MsvdBM7/8ApJjXrJnoZ0To9aWViemnNouR341aiZcs71ls5kQqdhUD+baQDaFrmZ81ABGHidbc3ZLbJU/9s+y8Cp3RZI/rZNYPF7izOC8evC7rb5dgZwPSJEzwBVLXLf5tEeCHnOt0Ub4APoenlvT1fegTp1JJ6N4oVj5UUgHPHqpYwdZ1cl4zoWtONQgDFkcKf4CVKEfFNghI8V2UfsXxPIEXDIFfJBfwM2N+POvKqGdOzT2J+03OYx+JleNfgMEam4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nDR7Gy1z7OxTvTZHoAtl3h6py764BiHy+ln2fuYRM0=;
 b=jJ4uzb4qZXfpGcNTIFUo8Wm/9kqfkHQsA9serssPpx9gtVJWp1NzPdE2O3e5jcz7zrN1PI7qYHlyVXZTB5+tOMEOXU+uBxCYc47e0zwhOsaimxZTY0TSVKnArhd+tA3ltXvaGtXjxLcIBTaPEjLdklkgNNaBKt+TUrcF69YWhYhsFJqy3GKFJAKcCeHf63785WVUTiN0DbMDGmmwZEJzv5lJIz4UCfHOBcvAVUUdTn1LNnzvcFwG2z6VJ4MwRyhZWcw7YvnjrhKQTUqrAItda8Oq1hvdsgqMDK2EQJv3q20o4sXRCG93L9wpqwr5H63bw0veRPQU5l2KnNpDDAxd0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nDR7Gy1z7OxTvTZHoAtl3h6py764BiHy+ln2fuYRM0=;
 b=ysQ9/8Qviz/p86hZIhUrLeFheXmnTMcPdzF0PxJdDbi5f/0fKf1/Uiup089K6WkMYqv/K2Kpt0m65p68buLCNlWrmCBFfXUd2B+4YMu1kii+Lf9+2y/guOGeoFH3asCDT+7Z9xdxKo4FUPp8tn25vvKmoCy/OyrPmO4ZHiyZpSkyhhrFic/rNkG2L1Cy3PND9iZB7DIuQHby+KaeFb+yAnJy1ZhNyEHcP+ABz9QWSZTVHmFITNGHv6twbqDSS5VRwiU8MyAR9FBlUGoBbSS6OqXDaP64HYY4nhK8D6H7qLbt93Afp861oIbj8JPOLSSRKCNmvnd1OED1WIZVzw1VXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0e7320f-1317-fe31-88c0-16b580eee8c1@suse.com>
Date: Mon, 23 Oct 2023 08:18:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] CHANGELOG.md: Set 4.18 release date and tag
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Chen <Wei.Chen@arm.com>
References: <20231019052050.1032492-1-Henry.Wang@arm.com>
 <20231019052050.1032492-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2310190913360.1945130@ubuntu-linux-20-04-desktop>
 <8327F8D2-72B7-42CE-A31A-9E845A38DAC0@arm.com>
 <42132ef5-ddf5-a7a4-70fc-ccb42419300f@suse.com>
 <4418D961-2A3B-4062-A888-55EBE6A4CFF6@arm.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4418D961-2A3B-4062-A888-55EBE6A4CFF6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 29dce805-a893-49a3-771a-08dbd38fe690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkN6UU1mMlRKR0tWY2d3dERrNVAxbHR1MzFnRTBTYU9zSnlmazBGSEorZDVj?=
 =?utf-8?B?YnRVZUlUTzFaREpBcGQ3TW5TbUFRaXlXQ2F0MlhWR0JhQWZnTGxIYzA2ZGxL?=
 =?utf-8?B?VlZ3QlBrZHZmOUFRenlSZmNZUFF2V1V0NGRuVHMzZ1hKbTRBTmwrZm9xaExI?=
 =?utf-8?B?MXZyNnU3QmQvNXVCNE14RHZrWEZmSDduZlk2YXk2a0ZNazVyTmVOUGJXUC9S?=
 =?utf-8?B?bHpnM1JyV2RPTDhXUU11eXJIaUxISnRFVkVmRkhmR2VhYWZhbWQ4a0Q0VVZi?=
 =?utf-8?B?N0UrWkxTSXRKVFVpRW9QbkdKSnVqOExnU3Z5R1RxdGR5dTBFTEh3empSRWJr?=
 =?utf-8?B?QjdrWHlidnl5TjJiTG5XZmxsSnl4ZlpydENkYmdwQU9KQVo0M3JiQll3dWNx?=
 =?utf-8?B?emxXTWREVmZaNTRqTTkwazA4NHVqYkFtV1B3a2dQOFNqZ25xZzV6aFNESVZl?=
 =?utf-8?B?eGZRQjB0cUovUlBEaXFrWnpLaHJ6ZFE0ejAxMk5ZYUdzcDgwUGdjSXdFb2RX?=
 =?utf-8?B?SVVnaG9qTlhBWGUwZnJVZWxYd3dlbXhzWUNpbU1RTVRaVmt4T0pZZHAyTitj?=
 =?utf-8?B?cFl2aHlveVZFOGNHa3c0bC9EbmdVSkRNUGNMbXQ0MzJLd243aTdBelc0VUN0?=
 =?utf-8?B?aHlhaTB5Tkx0Qy96TDhoQkpldlk4NmhEYTJPSmU4T3ZwY0RmaC8rL1VPQWNR?=
 =?utf-8?B?M2s5TitNMkw4T1lDSVpUczFLZTFrLy8rY2NyTzNmb1Awc0NwREc3Z3FDNlVj?=
 =?utf-8?B?czk0d0VoMGh4QWxBeCs2b1pDVmhaRGdma25TNWxKcFlhaW5TM2dreHhpRk9R?=
 =?utf-8?B?Y04yNU92RWlzdnlXQXhwY09RT0FnMTg5enU4OC9OSmJBa0kweHVDWW1JSm0w?=
 =?utf-8?B?M01kMzU4OEFNVTdkZkRlZUx5eHM0OTVFcndDL0VvVDdnVWFyTmt0cFhkZTVy?=
 =?utf-8?B?Wi9wdjJ0bHpURGhEREE3NU1EUGM0TjE2T1Qvc3pmNldmcTRreGV0eE1nM1lu?=
 =?utf-8?B?ZWFYVWdCNmp4MnB1ZlBxd1gvVkR1a0JpS291bWhkb0dxWVdmWjlLbnpYcG5a?=
 =?utf-8?B?SHJ2RlFUN2Z0aHhSYVRtVThySnRKd0M2d01QanZ5Q29jUFNiajhZTzZzak85?=
 =?utf-8?B?RjlTSmtkaUk1akFCaUQ0em5UOHJwTk5UTEd1NmRneUtuVUxwYUxFLytXUTFP?=
 =?utf-8?B?NWpjR29rVlRrb0s5ZWJOcW9jK1hNOFJaTk45SThBT01JenZvOEhOK01JNDFu?=
 =?utf-8?B?RjdTTloxUDZDcGxIL2sxWGsrVnZXQ0Y4MFlVazBPdGI5am42WHpZYUFwZzQ5?=
 =?utf-8?B?M3lveC9nYWVwcWptcVZMNG51VXNJS2c3Nll4RnNjVlBCcnJ0dWM1am5rWUFa?=
 =?utf-8?Q?U4zN/nA5IlkQWpYuxkv6NUH1HiXkUuZ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(4326008)(8676002)(8936002)(41300700001)(4001150100001)(2906002)(7416002)(5660300002)(53546011)(36756003)(6512007)(6506007)(83380400001)(38100700002)(2616005)(26005)(86362001)(66946007)(31696002)(66556008)(31686004)(6486002)(54906003)(66476007)(6916009)(478600001)(316002)(71176010)(59356011)(207903002);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHpxRFFSaXBFR2hGSjBBTzZ6VzRscm9qaGwvVzZOWlFoOW1uS3Y5WGJnampD?=
 =?utf-8?B?WVFpZ1VGR1pDL1M5WkFnbEF2Q2psM0lFUnB5cUQwQ1ExQytKL0Z3WnhGN0Q4?=
 =?utf-8?B?MTRMaG4wQk5TTm5TQmdIUndqS0hNNTZaN0s3OG5TRHY5VTNSdmo0eTlpdG05?=
 =?utf-8?B?RDFlWldjTmdFOFVLNGhVNWdqaG5WZmxlUFNOeVh0UGRLVGg2WmN6eFVjSk5z?=
 =?utf-8?B?WkdUWVZBaFBEdHJPM1MzVzFBWmptZndpelA2RXVQSnNGQTY1djQwQ0R1d3NK?=
 =?utf-8?B?OHFlTlR4WmQzcW1waWZBUlZXL2lzVldzeE9XNEdnR1gvSC9wY2l0bW5zZXFT?=
 =?utf-8?B?WXZQR3NaVEYvN1B6MjUvOStubXN2RlZuTVVSK00zRHZQbHk2em4za0VkYTlp?=
 =?utf-8?B?OVJ4NHlYRk1Od0RpUmVSWDhiZEJSclFZTFZ2eXptNExvK3FFNHdHV2x0L2FZ?=
 =?utf-8?B?ZWVwMlQwUkdlT1UyTjhNM1RSM0ZOOVJBbk40VmlQN3pURGRLa2hwdTd4bzNp?=
 =?utf-8?B?M3JIaVY3UDB4L29lVUk1dFRlWDdSM0lTRkZ0SEJtaFpOaEUrS1RnaVc4SkpZ?=
 =?utf-8?B?aUpYNG56b3VaR3I0Wmw1R0F2bDd1TXh0eU9zd1Y1YzVSQ25tNTVsK3ZxeG04?=
 =?utf-8?B?STRPZUVHL2laU0xtM0M2RXlEM1hBS0FSV1crejlkd2wvSXNOODZXajZ0RnUw?=
 =?utf-8?B?TnFrb3UxbGI4bW1XQUJPQnFaK2JkWU5yMUxFcm9pWkZ2V3FLak5aWll0VWIx?=
 =?utf-8?B?NDJYbW1kYlYyNW1zU3FTMDNManVkZitnQUg3bThTbXRjeldhMnZzb2M2STNI?=
 =?utf-8?B?d0hFMXN4U0V2UWdpQzVzNUZ3dHRzN3RKNDVPemtXOWU4RmVRZURjL3lSRE1K?=
 =?utf-8?B?OXhndTRRM0YyRk5kM0lzSjl2WGhvZWtxQnRXSXFscXU3enVIQjZlODJtcGF0?=
 =?utf-8?B?TWxacVVLVmIrQnU2KzBOR1BHby82Z2J1dHBPMzRGQTVqVEUwT2dBMVNiUEcz?=
 =?utf-8?B?MUZvdlhGZG9GakhldFphT2E4MjdmaWpVR2UxOFR0ZWM3b1Urb2ZsTzRjakdD?=
 =?utf-8?B?ZzErR2lIdzJGQktuS0lNRWFlWjZrelhQSUhJeitFbFhFUUYxU0I0WVc2Z2pC?=
 =?utf-8?B?VE51c2pBU0pncUMzeE1BZitSQ1h2a0R3b0hQVDMxQUhqeHZxOWh6ajVKUTYv?=
 =?utf-8?B?TVNyeVJwWnlYK2IwN1U4dU4rQjB2dVdPQnFuSThVdHlEZlhQblprbW5ZNVBt?=
 =?utf-8?B?WFZ6YU9KTU9kUkIySTRDVUtpbUpmYXBuK01PY2hvMjVZQ2pYdjlOMWloL0hr?=
 =?utf-8?B?NUdTa05TRlVPSTdENGRhdDlWT1RUVkJKd2gwaEJjWEM5cnNTNDZBTy82cFBu?=
 =?utf-8?B?VnlOMWtHTVZHY0pYTTZyY0RvaEM2NDMxTkRYM1p5MHVQcktZOW5XaTlIWERT?=
 =?utf-8?B?bUttRjhYV3NFTWFIaHJPRkxhUHpGSUxOSmlzb09IYnUycDlqaUlsd1ZVcmll?=
 =?utf-8?B?TWxDVUJTcVZSVU5FRkNIQ3hVWjFBcXZFMlhGK2Z6VGwyWk9BaVd6ZEU5QWZw?=
 =?utf-8?B?bEIrZnkxbkMycmRBaUhjSFg5RUNjMlFnNTBFNnh3ZUVuWmdxNkhGWmY2YkFM?=
 =?utf-8?B?WHNtRSt3VTJaZzRzdm5OSUZTSlZXUTdpa3VhckluQVhFbGR2TzN3U01QSk5i?=
 =?utf-8?B?Rys1TFNkUVozMTQySHpMT1BOd05LRjA2VitmN0plYURDNm4rZit3VTJHYTNr?=
 =?utf-8?B?OUUxTkRpc21ucFJjbnliYm5CVlUrY3NkaGkvMTBVZm1Ncm82alFJUDN6TWt0?=
 =?utf-8?B?WTdaZnlCNnVBaysvbXNDTFZKZTl4akFuTWNIWTlBN20rVTduVUV1WlpDZmZ3?=
 =?utf-8?B?eUtPTUFtbExzdEZURmRlQjhINW4yemN0MVZIY2dwVFMzQnl3VHBCRGZ3WENC?=
 =?utf-8?B?OGIxeW5iMmR0VWxaWkFrdEROYXBPRUcxN3FaZjV1d1NneWhUcngwNDVTR1dV?=
 =?utf-8?B?MmphcVhEN0VuV0c3eVUzZGRhS3pGNU1xVWdWWGc5UWk5cmdYakMxZEs3R0Nl?=
 =?utf-8?B?Mk15UmtRREpKNDBzdkVqSEFDa1F4RUxjd2NjS21JaXRINGxCbjdhMm85ZkJv?=
 =?utf-8?Q?9XoRpHohzYiZIvV+hGrTem9Th?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29dce805-a893-49a3-771a-08dbd38fe690
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 06:18:40.6122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eS+ORSIyo0YiP4sXRPSegMQZZAS+87GArzfosEJHNk8tUtjF8UuLRzLZMPbD1JPEC1osmUqwWb0j9Skpi7MkSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7989

On 20.10.2023 17:06, Henry Wang wrote:
>> On Oct 20, 2023, at 13:59, Jan Beulich <jbeulich@suse.com> wrote:
>> On 20.10.2023 03:23, Henry Wang wrote:
>>>> On Oct 20, 2023, at 00:14, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>> On Thu, 19 Oct 2023, Henry Wang wrote:
>>>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>>>> ---
>>>>> CHANGELOG.md | 2 +-
>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>>> index 47e98f036f..3c83878c9b 100644
>>>>> --- a/CHANGELOG.md
>>>>> +++ b/CHANGELOG.md
>>>>> @@ -4,7 +4,7 @@ Notable changes to Xen will be documented in this file.
>>>>>
>>>>> The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>>
>>>>> -## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>>>>> +## [4.18.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-10-30
>>>>
>>>> Should we use xenbits.xenproject.org instead? I think that's the
>>>> official name. In any case:
>>>
>>> Hmmm, good question, but after some deeper look somehow I am more confused now.
>>>
>>> So if I click the xen.git link in xenbits.xenproject.org <http://xenbits.xenproject.org/>, I will be directed to
>>> "http://xenbits.xen.org/gitweb/?p=xen.git;a=summary”, where the http and https git URL
>>> are both using "xenbits.xen.org”.
>>>
>>> However, "https://xenbits.xenproject.org/gitweb/?p=xen.git;a=summary” is also a valid
>>> link, but the https and http git URL are still both using “xenbits.xen.org”, also, all our previous
>>> releases seem to use "xenbits.xen.org".
>>>
>>> Could anyone in this community long enough provide a bit more details/clarifications on this?
>>
>> Well, "xenproject" appeared later as a name, with the intention of
>> becoming the "canonical" one. Still it was likely easiest at the time
>> to simply add respective redirects in the web server(s).
> 
> I take above comment as you also prefer the “xenbits.xenproject.org”? Could you please kindly
> confirm that?

Indeed I do.

Jan

