Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3037A4A90
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 15:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604071.941269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiEAX-0003kG-CG; Mon, 18 Sep 2023 13:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604071.941269; Mon, 18 Sep 2023 13:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiEAX-0003hk-8X; Mon, 18 Sep 2023 13:20:05 +0000
Received: by outflank-mailman (input) for mailman id 604071;
 Mon, 18 Sep 2023 13:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiEAW-0003VP-Ac
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 13:20:04 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe02::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12b29c67-5626-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 15:20:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9365.eurprd04.prod.outlook.com (2603:10a6:102:2a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 13:19:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 13:19:58 +0000
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
X-Inumbo-ID: 12b29c67-5626-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYe9FDTJzgopxHbIAw+21oAOYvOxHKJv9TTQeHdxVlZKa/TiTIxCRybLajNa3P8SNImpa4JfuKKaWO9otgkb/Jsrgikw/G3yeES0BK2hsRGg+4VSTfeQeLP9YVCAReHnxSsrMcXI0qF5gJpN5/nk8z7Th5bhpvYgHUvVAZ4sb9Bxlq9tk9LVFxOEFGxxuggucGvSwpCktK4Q3lE3i9enRVYp2uoAvtMY7em2oOSmJQxDQBaI4jXB992L6FMYTOB8Q63zxRwdpuUV3rzIAEe5w94XqSKCE9+XMPliRkvUZLbpaxnNoYMS0VjkwsTr5jzK8aNtf+R1bh8or/+MTOUFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bR5ENB+1t/2VXceZHNPBSmGLFynoA9SKY4pikOrGa4=;
 b=ZgWwC1OfLjtGn0mxKzvS6K1kobr0O1WrYmgNAKsticMeWB6reuepxmUf0JiuAHnxq6xymw3SDAq0d3eaEJ1nKu1wS+cYcdtq9cUyVDit2NztKNMmWTmV5XG7nmgrgVxUdus5txE/sHszZN5EagM36x3AXS/0gYeuuFsbPiiARXVBMWAogDqlC0OlNYKUyT0gFz7Ec1nR5XmWw7s9WoIurXAREaHgR6VSBWFpgqPHyXUmDVOrUllx22ywCqOUzNGh24rW3Y/byiE4yiEpYUfIYi3kvluwnwXeOuddd2nbhc7c1JQ3aZ/lElGdhQKrw6BuKt1qn16bQ9Ngcbj3MWuoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bR5ENB+1t/2VXceZHNPBSmGLFynoA9SKY4pikOrGa4=;
 b=erVR5+fbd+iph1Yt3kXoh0byIZjEDGSKw6QtO18AcaLxXFlp/EkWcmeJrXTM7Blwi23YIcnZ5Sd9igo7ooevE9pd646emXfI5RyrxsA2pvZYgGD9sMA0SdfLZqf7JmdQorSlXDQjZgX9Yx/kfsMhpdCNxoEYB4yBz9aLzfGSYe/Q9j1QgD1lbKFHvzc6zknEC4rxSlK7y9qeXqBGdYvorWoq4gS+heQqNA6w5HQxS44y7tpPBzPllUig2LOw3nIc/iDEp+s7/h1Hfsmnv8CUuDbG7pmLDOOFgUgjbSaEylP4lIX4SN9qw4MaGAbTW7LDwmEeneWpi/D9veRSwVBITQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3f04552-28d3-8745-3def-b7c341f8b76b@suse.com>
Date: Mon, 18 Sep 2023 15:19:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 0/4] ppc: Enable full Xen build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1694717278.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1694717278.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9365:EE_
X-MS-Office365-Filtering-Correlation-Id: 949b9b03-0eee-4667-30bf-08dbb849f4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+MYoWjLXgj0duIgzG3c6o2PFEJctuYkeEeZedpgBGbHL4oavv+JpGreHk59g5jrgek8U3qYHkhs2jEhvB92qJRJl1IpJRte2byABopM9LQPVdl1gkf/zoCQokKxcZDjMnlxjLm0uFkYAwE2YXXH97DYm7Wx/BoGsiPI7oXefeIorjU6SdCssBCHBoseBx/CKNpBuJSyFwQnMbaB21f2wiW9XV3PpeYmR9/63l1qIV+bKmBrXK2pmOJ2naEKzoGrupw0d8e/a/K7rhu5OAVngFb7a16n9dVNQcCri8U82NeRf6MKGJ7ojHHQgUUmHg/HPUrFy6gzoC6uZ8FHG/VU8JRs2EoWS8Jj8XUTwoHvlJuvqcDMyTOaGAv5PcQfTw8QPuRAjAOXbPVsaTb1BznTAbB7I41BdGSIZ8ZBN/+0ybAePNMKRUPtibFPjh33qBksOHi3k2s/HQcE0uKGKP7TPBIks4DUl1X35uqNSSQYVRo2QTqpTxT1EuJ8FuJ6lPG/q1iuCOcHLaYRxEIRs+Dwwa9xaNQeFviaxm6Yp454gFMv5Of87IBYqdzY66f7bzCiLVoxAQluBaXDBLCIAAG2PYSKnKMFyLQCBwm6q2YJUPC14HfSF298V5Rfe+ufCgqk5WobrGzRVkp1UQLBBSQfMeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(136003)(366004)(346002)(186009)(1800799009)(451199024)(54906003)(66476007)(478600001)(66946007)(53546011)(2616005)(6916009)(6506007)(316002)(26005)(6486002)(66556008)(6512007)(8676002)(8936002)(41300700001)(7416002)(5660300002)(4326008)(4744005)(2906002)(38100700002)(86362001)(31696002)(83380400001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjE3Wm9LQ0hwbU91SURwd2JTOHhzakp0NkpjSUNmSlRHcWZvY3lWbUZaWmEy?=
 =?utf-8?B?WUlkQjV2Q0tFcUFtcDJLQW1EejdwZy9LM1hEYUxVTkV6T1RQb3QvSDM1eTRO?=
 =?utf-8?B?VFRQUnJPTVBVVE5UMk51WWRBMFFFUno5c1B0akN5cGJ3WUQyUWFObzY3ZjBS?=
 =?utf-8?B?UXduRmpXckJwQUxpMGtuTEcwZ2x3OXBtVnlRZEFDaytnZUd6dzFNTDR6UjdC?=
 =?utf-8?B?VEdVN1NQbCt0UmdQY21SZE1uK284V21KSG9MZlJmZTdFWCs4YVkrTjhIak1C?=
 =?utf-8?B?dWkrTkR6ZUZ1Z2FJSitqb2RjYlpDc3dsMEZBM01Kc1dSempIanh4cUNnK2sz?=
 =?utf-8?B?M09ZSnR6Ty81VEdSY1Y4dFZNdHZNVk9NN2g5S0tabTlxbk1ibnNnZlo4Um43?=
 =?utf-8?B?OC9HR0tITVhQTHMvdDZ6Y1ZzVU9mUk9XN2lIVDdZM29JemZ4cmhncm5QTytB?=
 =?utf-8?B?bTFIckp6cWdHcTVvVTlTOUMwT0s0dlhNbCtyRWxxSDk4ZEhQclZ4a1Bmb0JR?=
 =?utf-8?B?MTlDWWo5clZnL0U5WHRNVm90TDVpNGM2UDRNWDQ2MldxRVlLRlFpb0Rya0Np?=
 =?utf-8?B?amFFM2dDVElqaEdOSUFqbzhjM2R1U3JPZE5CTFF0ZElxUEVEdEk4K25ZaTVp?=
 =?utf-8?B?VWxpR0pvNUhFQWZHalRYbFoxN091SHVvVU9TMit5cUxOSmNyYVpyL0xrZm91?=
 =?utf-8?B?dWpFbVNiR0R6OGFCU0FtNWZiRGc3aWdydUFvM1F1aVkzcml6ajl5OHBUaDNR?=
 =?utf-8?B?VExIMTZJNEM0QWJLNVlhaFI5a25GNUt1dGxHc1RlaC8rQjd5YXFJeHNOQXJt?=
 =?utf-8?B?dFVJZ1JYdGp2cU9Fd1BwM1lkNDFSS3A3WUNScHFQTDVIUmIxdFp2RlYwMlhQ?=
 =?utf-8?B?Z2JjUFF2ZzBycWdPUkEzc1BwcWJlb3ZDSW1OSnJqS0UwQW83L0lwQWFBWE43?=
 =?utf-8?B?RnlDZ0NLZ2FRVHhIakgxV2hEd3dyaDRKRWU5enREcUFaUmRzTUpLNWlKMmRU?=
 =?utf-8?B?M05CNk8ySmNMdlJrcW5maG5iaUkrVC9SWnN4TkhKUlQ2a29rZFBwQUE0eWFt?=
 =?utf-8?B?ZEI5TWFmQ3hQdWlJSjNPNGFhYlpPdkdVaDRyRmpUWkZtRk1GclVKNnhMWjJi?=
 =?utf-8?B?LzJQNkFZVkt0emIwaERQNzNKOXZEYXZqRHNndTRTdzF6bUl4UzJXVExkVDJF?=
 =?utf-8?B?NVVlMi84cmNyQ0tvSEhHTHlYR2ExYnFnbDYwMXZDU25yVkp6alVSaHRoUXRU?=
 =?utf-8?B?Q0x0QUZzRlF5UFdyOUpmYmlsN3Q2cmRhaGVxZER6Q0hrd1pwOEpWRU4wRnpP?=
 =?utf-8?B?YXBwT09Obm9KRUU1WkFpQ2FVaDBFem9BZ1E3ZGl5U2ZkRXRxMWlDNnVCc1No?=
 =?utf-8?B?NlB1elN0NW9CNGI5RnlZd1NUaThJckovRThkOGdQQ0d2NUhQTXBmUjRHUzV5?=
 =?utf-8?B?YXoyRVVCL1NlOVpnbDY4ZTF1UzByZzB1SEF0VEFkcVgwWVhzSUV4VGNMQ2wv?=
 =?utf-8?B?R0RFU0Eyc3R5czhyZ2tBMk4vbUxHTk1GNGVIRGRxU0VPcjM3OGl4dVVxVlYr?=
 =?utf-8?B?SWNHMWwveUxPdUhQZjNmUWZpbzh1YWhLSW9XQ3dRQWZWdkxtSDF3Q2NUVjZx?=
 =?utf-8?B?ang3WlUwMmx3UUhTSWdjWThud3h5YnE1My9jSW5USkFRKy9EejZHYURwRStt?=
 =?utf-8?B?dmZNZTc4Z1ZCZkliQnBiMnM1azlZYmZGSjJicGlyZm5jNWFBN01rMFFYZERF?=
 =?utf-8?B?NkdEaFh2NklXNWxrYmJFdUQrVnM5c0doWDI3U21qQ3R5bjdBQnU2ZDk5Nllx?=
 =?utf-8?B?ZDNSSXNoT0V3MTU2TEJsN2Z0NXo1Rk1oOXZHb1FMMmkzU29ySGR3TGFlMWYz?=
 =?utf-8?B?d1FHbk00SDlwREw1bnBrazMzRkxZbWxFbFJCOEx0RGswN2pKVWRHY3BjZ1lH?=
 =?utf-8?B?Z3IzYzNGbnBaK0VySUhoeUNzR1ZDeUNDeDMzalI0L3Bsa2dKZXNzMDdQdy9X?=
 =?utf-8?B?MHRaajZDaE9ULzlqWE5wVm5IcVo1YWRJNU5lRUxMZHZVYkw4dy8zb1ZNY2lK?=
 =?utf-8?B?MmU2c3ZJYmRJZjFIaDZCTG9RRDMxb2MybVdZTE5yUVUxQ1c3RVpPUWNQOE1H?=
 =?utf-8?Q?O5rosxk6FnHEaDtkIt+1VBa2F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949b9b03-0eee-4667-30bf-08dbb849f4dc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 13:19:58.4809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVG0SL8k3Qah7/smS6kTgUl3vLm9thpFiHCIgeKcN8Q9sL0w3g45kbPfmbQPmYSK3Z708fE9qCV/WiL41wmmEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9365

On 14.09.2023 21:03, Shawn Anastasio wrote:
> Shawn Anastasio (4):
>   xen/ppc: Implement bitops.h
>   xen/ppc: Define minimal stub headers required for full build

Compilation fails after applying this.

>   xen/ppc: Add stub function and symbol definitions

Continuing nevertheless, linking fails after this.

>   xen/ppc: Enable full Xen build

Things build okay for me when the full series is applied. Generally we
wouldn't deliberately break the build between any two patches; doing so
may be okay here (except I guest CI's build-each-commit would be upset),
but I'll do so only upon explicit request (and with no-one else objecting).

Jan

