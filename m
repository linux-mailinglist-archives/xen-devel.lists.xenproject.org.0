Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D43592E39
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387292.623471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYJD-00078q-4A; Mon, 15 Aug 2022 11:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387292.623471; Mon, 15 Aug 2022 11:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYJD-00075f-1Q; Mon, 15 Aug 2022 11:31:03 +0000
Received: by outflank-mailman (input) for mailman id 387292;
 Mon, 15 Aug 2022 11:31:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNYJB-00075W-Fh
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:31:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc9883f0-1c8d-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 13:31:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB2948.eurprd04.prod.outlook.com (2603:10a6:206:e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 11:30:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 11:30:58 +0000
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
X-Inumbo-ID: bc9883f0-1c8d-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5Ku+8x0eghGVeu326Mgb2Himj+FTrjYdPSZCNFZH3yV3U0EHmAYpmaUI2Lu6MZkj0n+u1ophcXsixl8+HKqASvNjLAVEGkyMrZneBx7hMf2vGhEImTcpSZVnK51i2ibOObaq5PYWpcZIxwKGSYNHQHTvaLHd/loZpUp7WGdH/jbheh8r389BUpuOvC8eHP1uIFMD2bVj65yI2EWi542ZHxBpcVMrLHxfK2tYxswM/C2QCsxMjQU8rGNUCJyDSykjhLwln9YzLQ/eDVAEYlo7v2EZM9dxlHS3Hu6wOuKNkq6nExqOvSbpohrfv+9eNS3F+EjnDoKQpMgCgbHrrwPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkZpYtvGhDYifaJmYnLxCD1EfpZZLgtSnFO3J9ZJ5/s=;
 b=dTGvGheYpbiGELFmrJlF2MzYJfQE+J4PpaWqR+NqIrs+3LL8BevDO82jCX9akgamFk3A0G4b53UQ5Cbmf/et7SLjvPNgJM4OGkOYawXoRS5bKYAhb8qmpniOT3j2ooPn2iI5v6I72kg8nHVZg/KFcUfRbdDyoKNMkTRFl78tjNt9TgDSy/v28hQ1QT649BapbNoxzeLux310H9z0drkibLanefqD/T6iGnxVY9KpVbHx9O6jfENvUxbalDM2dUghRayxAdRX7wZSymPHRfrJbR+ZM4hdcQxzJ23JeFWpHvq3qGIcKj1XBN4aqi2E3iw0aPySEe7PLpuMApzoE1DQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkZpYtvGhDYifaJmYnLxCD1EfpZZLgtSnFO3J9ZJ5/s=;
 b=LwAam+rnQxny2Pslm/ANlqTAdr4Cf/qiUKAZhtDZTJb+UrIjjkBNSOvch3qjLEYcLi9U7LSTE2j4wApTRgnpy+9WyCTcYbyKVgaO6LyeMTcDoUzYJG+i/OTNuYcEBGnBUokPXWcGEn/JPnT0fjtW04GYuy+agQQneA70qe2QghQOYZTZqIQ1bruCi6PhVJSgeUY2hO7EK9d1OlkfgALM4YlOc6XMV/rm8sy2sMPSFtZdB0+T0/2A2ycxgUe6Sp0kcV8vyvJTEN6bkIig5hD49GjrpQJLZhrHZ47sKiMWhTIS6YBgUhvY18n/vmKDADstP2ZOVKYtlBa4J+r3IE5u1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2155eb83-e421-1f55-75ca-d9e828b609de@suse.com>
Date: Mon, 15 Aug 2022 13:30:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <4c3976aa-dad4-2707-2852-9b26593692d0@citrix.com>
 <pDQL7BhwlO49buWymLE-VFEZJim7qNeMmAeThZgHF9qzcbNbQ6ZoSXktgD14I_HYpsdxqfCugrNoJ227u5DLCWEEXk_h9c7bf4iKdgoQbQ8=@protonmail.com>
 <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com>
 <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com>
 <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ac7bafa-2773-4fc4-f258-08da7eb19f9d
X-MS-TrafficTypeDiagnostic: AM5PR04MB2948:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GBa/F+7E/6PZ+6TThMxXoDvL7Oy1dfhE9NwnlPn1VXfkFSnjWcDxpgNXHZs4Hg3zJxNuhvF5QCjQ2ggY3+U/0xVmQF/gpIcHL7P7anQDhyfpg4olCtPSOtN9Klxk3y0pAjw4hlruditTth1PhChCTY4GZHCBsjSFeNB/5zo4/UILJe7wVxTCBWGqs94GcJfsZUuBsDMCv22CfiMcAR2IOUmvPccBIxZarcgur4a/IgAfHgTOFGRPOyj8BAlvbviZDBzEzHT6/QijdRCWTePAF3xgsg+C+em1UfgPdZZ5qnB+6QprcjIbnlw6xA7RWQQ4tEz9gsoj41i93aF5TfQq2wl+CnQ+Kbn0Ph7fBbZzgnTrtuSucLGbkJomO9alUCXlHsB/CvIvvCIjen3pflHqqoiWEATsNYeExvxMoyhZlc4irflNz9kv2rZax8HcBAdBm6bbuU7/bmRndcpAg4V3/767pL1v/Q9K10ZAQqIQJxPFtSTW40MqQzk8HVz5yO1zaOzh7DYDraGLEE10DVnHrLgWwb2eWaDwl0m4mFyjFSM8FUb9rCQI24vwj781LLN+k9EVYvr1eQtpyXd7DadR0Ylfv+boo8wBFdn3onhPeUtohV0+y5mxUTPOvezMdeFgo0+eFd+zDbMwDrMS/I8EPE8niar4TDX7srHcxmKLqVxzdf5lvtU/NkA9DC7HNaA592XU4wHC8i9AbFMREsmKSmzu6wkCa1exfBIRlWKQrcJXtqQxgHoJu1IRMPtNYzU+x06mbfPF1W51DaWhaESkqCoav6sA0sfyxbX33ZT2AhpP/qOM7x95lV5kZOHFFAjfZN3fYOQftCBW5ToTbR1sCe1jxdIHPsV9slUREXUEOZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(136003)(376002)(346002)(66476007)(54906003)(31686004)(8676002)(66556008)(4326008)(8936002)(38100700002)(6916009)(86362001)(66946007)(36756003)(31696002)(53546011)(83380400001)(6512007)(6666004)(6486002)(26005)(41300700001)(478600001)(2906002)(6506007)(5660300002)(316002)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2VVc0RTc0hNRldRV1VpZ0VEak5Md3lQUlUyVktKZDQyS1I4YlYzK0l0cmdM?=
 =?utf-8?B?SCtZYkJyR3NFL1NkdWpVblRFQU9kbE1vSFdtdkZHTy9tRVRaWjhhTmV3Vmd5?=
 =?utf-8?B?ZkpoTmlLMVl0amw3MDFEVjA1UUdvTTBtdlNZdkMxNlVhenpvbll2REU0dDVC?=
 =?utf-8?B?MGYyVjJZS1NoSDBFa042SjhFMU1FVG1nSnYvSXpSclNiVmlYSHJnUS9ZYVlE?=
 =?utf-8?B?eDJhc1RkQ081V1FOQmZ3S1B2KzF4aWdTTzdIY1NyV0lXSXorblhJcThtNlBv?=
 =?utf-8?B?U1B6dDVUY1BJN1AzNjZodGt6WFNraXN1THB1RWhiZFQxVWtDZWs0bTZuSzhF?=
 =?utf-8?B?NFRIakhrWVNhMkFPMjBGdENydHZsQ2poeVk1OGFSNEkyTUJzZkZoZThBaHJW?=
 =?utf-8?B?bkk3QjlwU0ZiWkR5Y0R5MzhUN3Z6dDRTSVdld1AxbjhCYWhmRk5PSEZrbGVQ?=
 =?utf-8?B?UW16ejEzV25jUkdmVERXanZkTEJuM0RkTnViNy9NTzJBdGZZZlJJaXhZRUp6?=
 =?utf-8?B?TjNiNjF0NGxDakpUeEt0cytLMDBFYUNJbzhYalpPK2pmMDdJVDI3SmJxMnMv?=
 =?utf-8?B?UWhzM1J1bDdKWlowbXdHeDhzR2FrNFJjRDBweHdVRHZRREtkTWREN2hRYTM1?=
 =?utf-8?B?czNZM2pvYkc3SEZQVHNwVkhSOFh0cndzc0c0dEZiMHA3T1IreWZ5WDE2Y3hJ?=
 =?utf-8?B?RFNYeTQ0MW1FcmVYZnFZSlRkQjFYaXRCV2dzN0NMVU5qRU5PUDVMN0Jtc1pi?=
 =?utf-8?B?aUFYZ1k4Q3RjemJoODZyK3RhaHQvalJ5b1R1UHJNWElyVk1nR1BjSlcwd2gx?=
 =?utf-8?B?bUNoRnVQd2xvNXgrRDA1WXJwU2F2Z2tBeVpyL0tEekVlaEdtV2ptZlJlSDVz?=
 =?utf-8?B?RGFmekxDazBMbi9JTDBTenlmYk9kTlc0QTYycHdVSWdxbUsvbnY4ei93M2J5?=
 =?utf-8?B?bkV2SHEwelBYVWFQUzBLRTc4d05FZ2NwWlVnWGlIZTZVZnMweHFjWUxLUXN1?=
 =?utf-8?B?ZHY1a1BkL1FFV0o3MDhCeVhDeEtrcTZnSUJKMzNpWkR5MmVLOVlUTk1UT21r?=
 =?utf-8?B?L0RDYUtSayszc2NqcExWR3JSS0FSOHVqSWtFQ3o5eHc3bnNjMkZrZUs3QTJl?=
 =?utf-8?B?a1FsbkxnVXZDSVFJSi9TRjBNS2d3b0FVbHVCRnhwN2RYY0pwUE8yZzdub2JE?=
 =?utf-8?B?QkVuMlV4eDEra0xLNTRSdyt2ZWNNTTZsTWduOTdRMW1MWkdKbTA3RWJhTEJS?=
 =?utf-8?B?WHlERnp2TWdWTGt4a0ZYLytKZFRCT2FYSjEwVlRzaWxKMS9XM0JzcG12aC9z?=
 =?utf-8?B?UVA4SUFwMUVMS1RnRFdqSUdBTzlCQTVBeDlzR1hWeDRxZEI3STRxUHZjdEdu?=
 =?utf-8?B?TmFySXptTmRjZm9GL0wxZXRQZW14VVlOZEorOVBWeW9DTWVwbjIwZXdDMVM2?=
 =?utf-8?B?clFQamY5bExIRkRzS2xaUHJBSXUxTEt1WFMraVJUZ1RkM1VRdzVweFQ4NXZl?=
 =?utf-8?B?SGJUTnNudFFvYWcvbDJySHZjdnEzOVQrNDRpWENuSm1JRzdvbjZTVEJYeFJo?=
 =?utf-8?B?clNsdDloYWNpUWh3SzNqN2ZHbmM0anB5TENzVkdWZGFuRW8yN0hJdWY2VlZF?=
 =?utf-8?B?R3J2ZVA1V1dUdGZzNkY0UUgybnlnem1nS3hmV1J4L01JYnBZVWVya1BOYkpM?=
 =?utf-8?B?Tjd3dUFBeHRNZGNlSkdlVmRNNDBVUG05SWRBeGxyZ3l6QjJtbGgxRk93bjd3?=
 =?utf-8?B?Q2xpemN0aGJpb0lZYUlSeHFhc2JkQzhLZ1JleTZhQi9sblhyYXhsM09lTmJo?=
 =?utf-8?B?OHArWlJKTE1VcUxGVTVqb2ZXaHRtK1NlK1NCZjQwQld6YkFJMVE2VlkrZmFQ?=
 =?utf-8?B?YjBkOHZHSXltenpwcXBZRFhCYXJGTStXd3BJV1dJbEc0U3gwT1NyaDV1dWJW?=
 =?utf-8?B?ZkttYldpczNNRGduWTl1eVZNcGY0cVo4QUNYbkRlSG92d0xOTlNiRVVxNVo4?=
 =?utf-8?B?TmZ1KzFTOXpoeEJXUmpxbEZ5WVp1OWtNL0tKZStqd0lWTXJxZjlkdTZGNnc4?=
 =?utf-8?B?R0JzakplNEI3emlYT3NubzFnOTlaWGhSZzlmRFNzWk05SWFJTUFSbHp4d1Zn?=
 =?utf-8?Q?H5cpYZ33ZcNgOKTxm3E6KxXWO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac7bafa-2773-4fc4-f258-08da7eb19f9d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 11:30:57.9836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGtmelzxdKB44DOtlwx3vfcc5rjSj6+Ihs1piu9OyZTQ1dot+21Tr40L849uAXqlSnJA4jizQNBT8YILYroQ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2948

On 15.08.2022 13:07, Dylanger Daly wrote:
> It would appear this issue isn't specific to the Lenovo Yoga Slim 7 ProX, someone else in the Qubes community is having the same issue (https://github.com/QubesOS/qubes-issues/issues/7620#issuecomment-1209114810)
> 
> Can anyone shed some light on what possibly might be making a Xen 4.14 Hypervisor crash after attempting to start a domU?

Well, to shed light on what's going on we need logged output, which I
understand isn't easy with laptops. Simply trying to guess what's
going wrong isn't very likely to lead us anywhere.

> Dom0 start's just fine, it 'feels' like a memory violation or DMA/IOMMU issue, because the VM does successfully start, however 1 or 2 seconds after it successfully boot the mouse (in dom0) locks up for 2-3 seconds and the entire device resets.

In the Qubes report there's talk of a 5s delay, which makes me assume
Xen crashes (or Dom0 reports itself crashed to Xen), which - unless
overridden - would result in a 5s delay (after logging state) until a
reboot would be attempted. This aspect could be verified by passing
"noreboot" on the Xen command line, in which case the device shouldn't
try to reboot itself at all. But all we'd learn from this is that
there's _some_ form of a crash (but not e.g. a triple fault), still
without knowing any details.

Jan

> I can't seem to get any logs at all, xen's console, dom0 dmesg and domU's dmesg all appear to be fine in the lead up to the crash. I assume no one has had a chance to use Xen on Ryzen 6000 (Rembrandt) yet due to the fact it's hard to get your hands on with the chip shortage etc.
> 
> I'm hoping it's something that can be fixed with a cmdline flag, it's very frustrating having this shiny new laptop sitting on my desk :P
> 
> Cheers all


