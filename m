Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEE56FB0AE
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531540.827287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw0Qj-0001Z3-Sv; Mon, 08 May 2023 12:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531540.827287; Mon, 08 May 2023 12:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw0Qj-0001W8-Pl; Mon, 08 May 2023 12:57:29 +0000
Received: by outflank-mailman (input) for mailman id 531540;
 Mon, 08 May 2023 12:57:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pw0Qi-0001W0-16
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:57:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0f2bc2f-ed9f-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 14:57:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8674.eurprd04.prod.outlook.com (2603:10a6:20b:429::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 12:57:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 12:57:23 +0000
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
X-Inumbo-ID: e0f2bc2f-ed9f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoHMv6woAZ5h7Z6SDA9NvQP/DYc1BEofPVeZgcdZHlvQTCRCYTQS+j4H8TXufbkJdZl8Oebmfjh4w5jTV+AMO+uR3lWl8qD49P1j8GPOfl1hXgGO1E44q/S+9vCmlriDaNXXkhYMwBR9LxlQObqng2++toPoi72+p6h7B0nihdw2ZpQ7EqF9NAxUpWy1adVc5iN4w4f8jL97xBoG+BnE1bLhc0dkX3PMUzGURoCT3HdwAOy4EkhO3ohxtGJKW8vTMTCB5bGTjpEYsftrxu3AuPsngrNn0dlyAMeeUrGGQgD/n4vlwlwMpySqJuDShGDQsWhPuJ/1Hp/gQTMe+h7IBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZd97VnJuH85htric0UZmxZ08snwYPDQyqs2n1VbUkU=;
 b=PYs2CFXbojMmjlHo3W2lQACey/mjp27KcUpbufkv90Lu3brNnWbL8gJ9aiJd14tDsLYnqnbUmqMEQv6ZzQTHBpTQvAPsbWkKylvIN4r+H3c+8c4tULsaxlBkfJz2YXr3kauCX9aOw0ti40qh7Pd0wsLROM4jvtEJz5Su7jJfmlYMuJdCdqVkfJN0/WPa2W/IRZBKPNDBYU3JmZBi6ubniUS4oY0YmdpkMBP58abz3M1hz+KPwZVXaXq34m/HfyLIeg8MMa2LDxDT81wcDOp3kpb1wzTzr5I/zh89pcg2kMpjgdxzSmtTYACo4psoB557bCZUkiazCBIcnYCW3osibQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZd97VnJuH85htric0UZmxZ08snwYPDQyqs2n1VbUkU=;
 b=5TsnUWAb2BTfL9BlFENtWRf2qPZNZkkhC0AmkTk5+oRlcB6jaflcRfP8P7hwKMRj23/kz7X+aNX6NM6+MIABCa/Bze6Dxm/vthS/zBoT6PX6nH0XXfClbecz+rE12eLvy5xq9PMwnLfuZWtLN4S/C4HHJ7okt+jWzerjlLIqn5b+KBq5esT7CQv0tUyf2WKaVpqp9pOreliQRlt04/l6j1VodE5OZ46Pyfl3GLhSvThqR0s50gd3cPcYKrixnPH/D8OPk6C3KBVduDvjDun42NaydFB2r+5dRawLhP9Tb0Qt+soPIPw+uuJHHB+UZE+5GNVJo/0p+fdf80Vru/MdYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a261b10b-25e4-3374-d6c4-05b307619d81@suse.com>
Date: Mon, 8 May 2023 14:57:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] build: improve macro references
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8674:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ebec046-321a-464a-cc9e-08db4fc3c414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0/hwL6mqy69Eqp4vzxXT8WdzFnMRlFKGs+jJQUwjpSYWQu85jZUbGOw1GrMp9VfKEJbGBSnSM0OumwE2vbJwgKRNlP7QaVncUvtYEpr9tNzrof4RJaJN47/ekMb5KNde6LtMz0cqB0q8FowWhmc7qVSF8xq45pAxjXvHpCZICkwF+NXL/sJCuJ7FQYOeDYCECNpzBmv3D8KJUJR39W54o9kP7pK/Yi9QsxBs/ifeMZcBNTaxyh8ja1LE2ViTGU0RlTe0X1JUC7exjHm+BNuP1SpN1sg9Eyr6lHXyuCuIAg+t6VUzIUM125GrDF04vhUV8CAaIU/AuQ/rDyDdOXgfh2QyvQKrYbwMDlF1ZCn0p3zbuVOQ34L8LyAv6QTm+PgOxzTTmUBEdY4jgi5XxuslQgj6p+kx3QoQMHEdYPvNsTnH+ryL5mmL1dkMNWOOT5SOPkw4mS1e6iuxEqQvvb2sLYuxdUP2Hw9YpbZQi9KQPuopbNFlNut+zXgpdU/VGoOf7WpDebX1YI1dKFwxC7/CHfzwOhdE5x/c67ibIZpegHcF9hzg6htGim3AzpUoIWWhHxV8lTRemEfqgzHIbczP2Qp7Ayqp9p4NGIveh5aLPLbbT6mncTb8mfo5IHRHccvWIFnZGsHfOjyEOvj9vyTWuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(31686004)(54906003)(2906002)(8936002)(8676002)(316002)(478600001)(6916009)(4326008)(66476007)(5660300002)(66556008)(41300700001)(7416002)(66946007)(6486002)(6512007)(26005)(6506007)(186003)(36756003)(2616005)(558084003)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUgyVXFOWnlkVHplb1huVE5vREpPdnhqY2wvcGtLMm9tQVhTdEFYTFpWa1Js?=
 =?utf-8?B?bkkzSVArQ085Mko3MjFSMDJBVHZWY1FwOXFZZVJlOGlmeFpoNzRXRzdJYzd3?=
 =?utf-8?B?cVlESW9BNFo0andNemZPVHI0eXVZcmNtb08zK01HMERoeEd3ZEdOallpbWpJ?=
 =?utf-8?B?dVNMbzdURy9lQlM5RFd5L2x5RlJZRUNUT3hReTVVcFlPUVVHT1krYytmY1Fa?=
 =?utf-8?B?UWZkZkxRZzVva2x1c0FTQ1oreW5ybEV3Y25ucnloZlZZcUtjb3BZZ1VFZmV4?=
 =?utf-8?B?Z1N5aVZwZldoaE5kV2UzZVdwQ3o2eTlzKzIxZFdzVTFyM3hORFM4cVlEemhO?=
 =?utf-8?B?d2krbVdZbzh4NVlJeXJxUzk2T1RleTFEZTQ2eEI2Q1JNYnBaVW1HM2srVWJZ?=
 =?utf-8?B?MzZwa3lWWWlad1FSN1NFWGp5VW1jUmdHSlRzdm9NV0F4aHUralhmNGZMdHNx?=
 =?utf-8?B?N3RiZlpDTVQ3dGRsU0dpZ3hWMWo5d3NtQ1NoUThnd3JGUTVPZmpIRzlhT3Ez?=
 =?utf-8?B?TnlXalBWWGVMZkFXTExOYU1wYmltUFpmYi9CMFRxN1cyaDZtVG1nZXdFY09S?=
 =?utf-8?B?c2dTckNkTk1CekhXOXBFMzB1ZmUrakFwNUNKb3NtVWpDdlpKd1E2WTc2UjZr?=
 =?utf-8?B?eHNvamd5L2N5aW5hWHd4bWJSUGJ3WEVBQjlqdHdaeHBrYmpsLzB3NHMrbXFZ?=
 =?utf-8?B?Q05oaDZhYzczcXc1bnc3ZjBWc1Y3YUJybjNRbHRuZ085Q2pjR2tMUXdocFZr?=
 =?utf-8?B?SjFEWGw2VWdKRmgxSEl4TEdaQW9XZWlpYWNWSTdQbUxzdHQzWDRNeWwra1VF?=
 =?utf-8?B?Um5uQW1IK3N5akVjWnYxZU5IRmNGS2ZnUUI4UkhXYWFXQVIvcmhXVFgxc2di?=
 =?utf-8?B?RkNNUENBY0ZiL2JDYy95bnltcm04ME4xSTR4WjlhOHJZbEtsTTAzbkZSdGtX?=
 =?utf-8?B?VGduSUtTcFdFV2RGQXhWYnMyb0ZFWXlkenlmVEhlTkVkaHlxcXc4ZGJnbXVx?=
 =?utf-8?B?UkZzcDhReXVlMXZ6Ry9Mc0RodW9WVnhOcFBNN1g2alJJTmVhUDdNU3liZnJ0?=
 =?utf-8?B?SGV0bXRmc1lwc0pMb2dPZFdhakxrR2crRUEwRDFVWVM1dXNOSFlPeUlicDA0?=
 =?utf-8?B?bmNwVFdBdzdZbUMzK0F4L3RGbUN0bW8zUVRWQmJZVkRPbVlleVZkdWJpYzlB?=
 =?utf-8?B?Y2lTWWkwdWErV1ZZWTh3UVYzclltWnR1VUNVZU1MQ2ZSWUR3YWRqdW9QZG1C?=
 =?utf-8?B?ZUJwd0VBRGZCNEZRV3BKYTlqQitmcVlTZWRtU3YvWGJWYUFyVU04SWZJT1c4?=
 =?utf-8?B?RGlFZkVpZEtaSFJTa0tSN01Pa0pMbHBJcElkUHdYZTR6SWNQakkyODRZb1Fl?=
 =?utf-8?B?bWpHckRmNVA1eFZZMndlcjF4K3JYOEYzUWlKQ2s4NENyNjVTaExJREZyL05R?=
 =?utf-8?B?cklZUzNtZVc3d0dhNTQ3Smg3OHloWlNCc3V3L2prRXhwNlVGenFVUjJLTmdX?=
 =?utf-8?B?SnQrT2ZWU3Q0MVppbnZKTDBNc1dTOWFsZ0lIQjg4RW94Z1psMHdkRFI5cUtz?=
 =?utf-8?B?WFV0SjRocVp4Y3Z4bElmNmhHaklmNnJ6QXhjYU1QTERIbm1nU1VxRUI0bXZU?=
 =?utf-8?B?OGloeFhFNmdJeFBLUHZxTFBZKzFwTmx4QkU4dXRDQkk0eXNROXZ4d2pvT1dK?=
 =?utf-8?B?RlZ6dVJ2Z1hqT2g0ZndER2IyRHJSVmZ6eEd3NmhwOGdKdUljc0VXeDJvQm1B?=
 =?utf-8?B?ZEY4T1JNNitvcldiT1cyeGo1TVk4Z1YvRWlZZjNmem5CQ0RsUjBNemZrYXZv?=
 =?utf-8?B?WitSTUNtZU52NDc1ckhpalBRMWxML3ExQ3RYRVBCZ1FyL1pnUGZpUUpFR1NC?=
 =?utf-8?B?SnB0U3ZFZW9PQlB3c3g5c0lRK01hemo2blZRWEozeWpGN2F3NVdhSDZ4TDBt?=
 =?utf-8?B?cjBzV1JMSXowODQ1c0pXVDNwaFM4dTdWZitiYXJsNEVieXlRcCtZK3d0NzdV?=
 =?utf-8?B?SC9oVW9JUnJGTGh4M2pjOFJjWkRqL2lTQzlYNTZIejB5TlJqR2RXTndVc1Zj?=
 =?utf-8?B?RjlJbEpMZ0dqZUlrUXJNdEYvUkJDRTE5dHc5eVRFcEhvOTJpVlFYTU9USStP?=
 =?utf-8?Q?1rrWuVzHJshELcADOTFDjBjnM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebec046-321a-464a-cc9e-08db4fc3c414
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:57:23.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvejrorUrFcg2ywYVIHIlIDz9VfJWT78JklpUOYjdhHeXvchdGXOSSge86AqR7kGnT4Kec7EjqApsSC7rl43jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8674

Re-posting patch 1 merely because of the still missing RISC-V ack,
while the new patch 2 contextually depends on it.

1: shorten macro references
2: use $(dot-target)

Jan

