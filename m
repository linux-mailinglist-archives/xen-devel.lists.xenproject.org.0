Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D3A642CC8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 17:28:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454126.711747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2EJc-0001tE-KG; Mon, 05 Dec 2022 16:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454126.711747; Mon, 05 Dec 2022 16:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2EJc-0001qV-HB; Mon, 05 Dec 2022 16:27:36 +0000
Received: by outflank-mailman (input) for mailman id 454126;
 Mon, 05 Dec 2022 16:27:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Zgi=4D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2EJa-0001qP-Vc
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 16:27:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3192d93-74b9-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 17:26:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 16:26:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 16:26:55 +0000
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
X-Inumbo-ID: a3192d93-74b9-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQWApSRbRoWmwo3pLmnUUjr6iU+VWt7K6n/YBOCqDmQiK4m/IuS8oo1XNq59sBq/SBhLTF2aoKf7hhnfVLSxyaUMFTuTbgB4aX0CvryGq1v7axsiaG0xnrFN4p5wxFGumwxMK/qgSmv0Ag7skyt7TacF0K30o+oU4fmNcEDTaIEpHT03vIfw5UcaKNFtbV0GM9aYauVH3SvXGMRQQbuyEreFVKTAIITjyC7kmDi4SSEjQJFHdAMeBUbQBtJqwhDorIYCEWq/AVOm68pTMibZDd5xvLjEzxVflJ4DHJac6LOqGzrAM1u1WjcnBl67ejqfwrn9JUtfxQL7zcjHSKqVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24LELqyfJD0C6+zlgxp9fTxUORASAYHd7ipAN6jmsqI=;
 b=mdP2AGSyIy+FFK4+F4nC15rJMjMb1pmlMImFLzBD6U0BPpVkpZaldsFcNYmCCAKt8vnlszEz4ZhRU4aDeJhMGZEN5rad5UV7/umS2FGyzsH8zKT5tpll+IKeCR9AaC8GL+X4HVsU8QZzi7ACpjzknciJmr2Z8YmE4DyeIJxPp0UbO3pm6066mxY+EPxCRnHQOJjXSxONJfw87ItrKrxZW76do3cegYuDEsa19FZGhFhDOzJaNzdOu9bTZsU3aQKiiSQUUR7l0bB7vv+H/CgNaG38V7iYNGGzsrJhruMIs09TyX6LlCwJ04/Oe/tNQN5PCFrCJuk2lKzyn9hhDcZAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24LELqyfJD0C6+zlgxp9fTxUORASAYHd7ipAN6jmsqI=;
 b=GhTpT6ovZbKM5je6VRUqmHRHH6kz8Tw1+VLjIFzPom9ffxnTBuOYGxl4SFFS5C3QgnGNQJjL7PG8UBHQz2GgOyb3fJBDeCUK2d4D//zdDBYjID0oaVqYXz04y3dDO8dnVyM/3kt2OnZ5jgQz3nEWNvvPGnc9CRsIXupA9VWZ4CAaoZ2mcYgtYKRYTSmdCVvG0Z+zVxgeRZLOFzOH3k69pEkdfRN9EicUCGGufDKJ7SnBkk4PxOy6dwACwaU9XMGC5Esvl/5vMavoTVDb1dq5bUsXe0rXlWpk9uvGTpSwKv3TXf6kNHVNpkulo0GaYiBkDAj2hksgVHX1+ldJqyWIuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85a41edf-b7af-3c96-5d84-61c3c958327f@suse.com>
Date: Mon, 5 Dec 2022 17:26:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 5/5] multiboot2: parse vga= option when setting GOP mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221123154525.63068-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b42af9-c6b2-4f98-0f02-08dad6dd85f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PpZ6l+cVvwudLsDD+0ivnkllJZi3XaOjv37Pl6ZxoTdzEXVZmgle4hKbenxzmkrw8XzI4kpslzJGa7EHVJ9ffe4LHShckRATlG+YidMuqGAOujKYY7M1X67RstISd4IMLJoLI9NKz7crYdDoUXipnIKTPDw/J3p7yEiIT5AUzNkpiWY18vATgNxvzhf7gu/ASRuUsTphASZ4t/GYK8DRgGKgxE9ytvvndeLN4WQfzabM5uzxWUdS0kcbTsvG7pRfh1vECr+Qh6FlWLLrNvalDy4y9s9rsExeFOJMQBSuXGGGohaMqt9neU4nfpcrqX9Bx7t84b5/niGfILh4+ICdGtjODP0ZNughcTSRuM6F+xD8RU4PZuhdoALqk21T4mG6dDicUnzuO0EPIfT7iZDf9oA3hfh6j7shVtb5UiHl0QbSQu51hhfyyu+AcaUgAxoRGrUiVhgtYTk0fa12O+HzI2MpmlB9+9BylqalVml032oXWPPEi+jWUzjbF0JvBiq/biuqBa5PxcEhxxHvRe+Fy6+XK33CamDAopCf864+zqEmX3o3Uyk5in7vdS5OsE+012UU43nJsJIuUBdQ/fPQr26QeRO16y46x9o1+LBubscgYCjcU3cvOVpKuqZLLomEHf01Ftg6Ziwq8wzegW2M3yW16D5F+fFmEC8IMRZGmLkVS7wOWYq6BofNYYxzGVO1ZYYOfra22PFNHV7vm0hkkeR0xDbyqQwWSaKQ/Wb9aBc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199015)(36756003)(38100700002)(31696002)(86362001)(41300700001)(2906002)(8936002)(4326008)(5660300002)(4744005)(83380400001)(66556008)(478600001)(6486002)(66946007)(66476007)(316002)(54906003)(6916009)(2616005)(31686004)(8676002)(186003)(6512007)(53546011)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SC9DeXdwN1h3Mlo0cXoxd0w2UUxSYW1pbVhwR3hKdnNwNG5uUE5EanhuSEVz?=
 =?utf-8?B?aHBSNElyVmxscjR2V3pvbGV4dE81ZXFjZmtMTzc5UUtSRmFKbW16OUtodnMy?=
 =?utf-8?B?ajdER0ZiL0loUGlMcFYwclBDWndDeUF2SGYxZzdIazVUTzlhbGZvTTJJZi9p?=
 =?utf-8?B?OXI1NHZmMEcwcEdVdmlxMnMzdlczTWpqM3hteTJVNVZJU0grT1YwR1JmWGNr?=
 =?utf-8?B?Rzl1WEJ1NWZZVDdVMUEwWEpTWXZsODR3MUNlMkhtU0NDMnhsNlNVU0ZkeE0w?=
 =?utf-8?B?K0c5TmZvUVhGcmxobkIxUlh3VHFpaCswYWQ1aWxod2xleWhNNDNJQlBrOGdH?=
 =?utf-8?B?VUR3dVB1ZTFsRmxVMFArcmRXWk1lcXhtTVg1NkNxa1o4RmVFQXZ4MHdyRXhz?=
 =?utf-8?B?cWVkREVVZFRIZ0tKWVZsNEdVWjI1Yit0UHhqWE9sWXNtQ3kzUDVNYVU5b0RY?=
 =?utf-8?B?Q0xVbWdIMStpbzF5RmY1TmJRTG9jWTg5ejJsNGp1RzFSUFU1NE5ZM3BwL0Mw?=
 =?utf-8?B?U00wbSszWVpVMlhvcWs3K2JYclViOGljNWV5YnpkaDFUTUtIOFhtWmNaUGpW?=
 =?utf-8?B?MEpXQkcyT0RSUWJvbUhCbnplMHBxa0F3bGZUQ2ZZOStBUXJ0aTFNSC9XN2dt?=
 =?utf-8?B?dFg5SmVaNnhOZ29ueXI2N013dHNZdFBPWmZWTmlFNnoxeWlxNW5pU2lQOVV2?=
 =?utf-8?B?dUd5U3VNWVNmczkvYVErbGh4TEJxcmNpa0kzRXVUby91UTl0VFJGYUtDOHFW?=
 =?utf-8?B?c0JtRW1ndk5jNGlldG16M3licGMyL2N1djUzYWpRbTVUZUNDVU5qZHl4MjZY?=
 =?utf-8?B?eXcvUjVGSTV1K01wdHNjSVFqTEJsTkRRcmFtSjZtN3Voc0pHSzB3bDl2TldK?=
 =?utf-8?B?T0F0K29nSXgwQlFOK2JMMEFib09ITlFpYm5RTkpPMWpXUURVaGQ5SkVvYjM4?=
 =?utf-8?B?MHRBZENZSVc2UG4zcmUrdTBKK0FxWmlZWm16Y1oyK1QxUlZWMzFnU2w4czh2?=
 =?utf-8?B?YnUzNUpTeTZKaTQxb002YmsvL0RINFNndEplOHVXMEFvNTF4TjF0TGV3WVAv?=
 =?utf-8?B?VVpzQW5uSzVwdVBnWVhGS3pINExTaW42YmJ1MWYvZWNvMTR6QkpQck9IYzlI?=
 =?utf-8?B?WkJSem1DNGNJTmMxbkZmVnBFalYyaVF0RFRJRHFFU2lRcVg0YmZzUjdnMVRB?=
 =?utf-8?B?Snp0STgwU1pobEo5SFRlNG14MWJSVGF4dDc3Vk8vQURTYjRpTEVJYWJISS9p?=
 =?utf-8?B?LzM5Vi9zSWhhOVNWei9DRkcrWVBFNE1CRU8wbW53d2ZvNTQ3S2VEZnl4TUFR?=
 =?utf-8?B?UEhmUllYSTFudEtZNEx6ZEdNM0RVdzB3ZWY5ZVZHNzYwTzZ0MHVpQ0hRQUFs?=
 =?utf-8?B?aTBIYlk3QnROUUdGdzBBUjFlY2ZYZHg4akIrQVlZSlNSd3A0VFkxL2NUREtR?=
 =?utf-8?B?enFOOGxyclBSa055aUJzYmFobllhd0cwV2VCZFhHQVpGNkhLZXVkODFiVlI2?=
 =?utf-8?B?MnZUQjJHTmhRejRrZW8ybU16dFpCdWlOQUluem5GZWdxUktMUjAxK3RyYkVS?=
 =?utf-8?B?Z1RZTElua3doUzZ3Ry91Y2VHajloMUdKd2xCQUg3U2l6VElycHlYR3NheGZE?=
 =?utf-8?B?RFNyTWtwWi9NNnNlY2dVT1NGOVNSakdWSzVXOHJudm51U3JsWWZyUG5ERnV4?=
 =?utf-8?B?Qi9yc3JNOTJsVm1mTkIvNlJ3QXAvb1RuTjNleGZMeVgyMzVRRkFMbEU0U0hr?=
 =?utf-8?B?cjFScXpXcWJBdXJCMFo3Tnd4WDdZNmZxNjYrRlJXdnA5QkxhZjZhc2FHRTRV?=
 =?utf-8?B?OUg0UnRCTTFxSFhkRmFVMS9LQWNFNklHcHJTcldjZGNCRENjd2lvVW1zYzVa?=
 =?utf-8?B?ZWtKaVZBMU5CbFNBSmRkMHcrOEQ5R1RjRVpYS2xtR3BSM1F0RFA5L3FEd0ho?=
 =?utf-8?B?VlpGcFlWTGtYSW4rQkRsVmxxc2dFWVZsempqRjZOYnlpL0x0blpIN21TUVZB?=
 =?utf-8?B?cjBlaFZEQjU1TjlhR3FOcnRLV1lIMURockRSM096ZEdHcDdPUjBKU3E5b3di?=
 =?utf-8?B?a3BJbTNoM01kTmdSeG5lRHgwQkFYWFNDYlVuSFVaUHlDMFlScXBSL1FZTVcx?=
 =?utf-8?Q?8AotA0cMvPv2RjzNxv1EPBhcA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b42af9-c6b2-4f98-0f02-08dad6dd85f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 16:26:55.1571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qd7OTfsDB5UcuCCK0p1WsZAniOBg90e4UzApVue3ailwW3j+uYsY0SvSkzBsbpK7CM3FPd6eKObFsiApSEJ0nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7874

On 23.11.2022 16:45, Roger Pau Monne wrote:
> Currently the vga command line gfx- option is ignored when booted
> using multboot2 and EFI, as the setting of the GOP mode is done way
> before the command line is processed.
> 
> Add support for parsing the vga gfx- selection if present in order to
> set the selected GOP mode.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit personally I think this should be folded into the previous patch.

Jan

