Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1831F560549
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 18:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357948.586846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6aAH-0001mG-Gn; Wed, 29 Jun 2022 16:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357948.586846; Wed, 29 Jun 2022 16:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6aAH-0001kD-Cc; Wed, 29 Jun 2022 16:03:41 +0000
Received: by outflank-mailman (input) for mailman id 357948;
 Wed, 29 Jun 2022 16:03:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NFaf=XE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6aAF-0001k7-Q1
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 16:03:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 092408fa-f7c5-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 18:03:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7950.eurprd04.prod.outlook.com (2603:10a6:102:c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 16:03:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 16:03:36 +0000
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
X-Inumbo-ID: 092408fa-f7c5-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apZCgQuSeNYul390UfHJOxIyFMYuSlRgMhpZCBLelB5tpSHd+qTaz326BWZBbNmQV8IoDJF3vZIeXa0g7UxGbKsCanpGVwHVjVJkjIgnguxSTmfD6dipndlK0etu9CgZv75IgBEDfOPAtDcOAa6zVlUcV+7DwkZCitsXxVNwVL7qkQO+wgzUZ8CfeoRle8V4WVbqlv0w9WME9BI0AWAT+/1UFNrmYbpwYDF5WwvN6pX64fjHJCE6agTckwkR2MMkM/WkPNMKxvFSbVFZsrdrej47Ik2KzPpuAQvbwAsIzwXLT7kWVdOyTB1SwMrNSbKYc3BPHiv8uBOFHMAoUqZ/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4IMaJrfXu0opUtaqtqlrlFOx+Xz3+lkJ6UvFcjDn7o=;
 b=ai/iVJHLlzeUG4a5RK6vVNpJ/bgr6bzwHjVLh6VXUB3bCdXPOj+XwdpkhT2picMcuCUnTCWCkzb3t/scM8yi8ot9scT+mzA9EmlsU6QfCRhy5DI/d/23ZX0mfJR8+Jk4OoeSgLqkpUIh54EtjZnPrbKzsixpnuF+cPZit6JMaKI2Sk3LjXGFDYMIRuJmFmYuCEbyvT069mYWSISPzOHfpzMmo+87pgL0fGTfMXy26E42zjNtltOspBUMiwjzYKtm8b+/+xaEgaZtsm+PWgR2X32DsrDid/P1GII9XGl8hLyKyECG/M1qEGH7c3DeJDdmbKoddL+0ysdtm90zmuuhug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4IMaJrfXu0opUtaqtqlrlFOx+Xz3+lkJ6UvFcjDn7o=;
 b=x7eQTv1zPz8COL1iauJfv4fopbDCNEXXkGHQZWSHkALMpnkEWrbCEi98cVEV4H8XK0uXBx/yKKU6mf6yDGsa4/dHM8++jre3WuDR8y6dZQVPIeZ9FhAbCDRUHiOVx9M1vb4dADV3L88jPTwLAMq8vCTxjAdFSUMKO4BbNboyXIjelKjiHSFLSUGs452uYT8cUQliwObsx7qCVpHO5z3a022cl9YmaRsgospp+TqTbNFIAldGui+hLV382UkFUegJI5XaxiQ1iPQVnmx0zIStKPI6naU2YedTBgFTvyeBKRTQWcnlnOwYtEaUEvNiS7y2J+mtu+e+1V6sozfq21YPwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4740e9b-3586-04c3-454a-5d60bae2cc55@suse.com>
Date: Wed, 29 Jun 2022 18:03:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] console/serial: bump buffer from 16K to 32K
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220623090852.29622-1-roger.pau@citrix.com>
 <20220623090852.29622-3-roger.pau@citrix.com>
 <e45d8dcf-fd0a-6875-a887-5c0dafcc4543@suse.com>
 <YrxuVPMb990xYKi9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YrxuVPMb990xYKi9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::46) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7590ddaa-ff88-4c44-0c0d-08da59e8ec91
X-MS-TrafficTypeDiagnostic: PA4PR04MB7950:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WiY8vSUPwMi4ms8IrNXRCjHR3IDuoPoZWCcbHdKkgkEBEH5bTpkTq3u9r8MCW2gI5t5P+xYhyIZzgzDYYrVRCSl5jy0JB4pkIa9jTXjL+mmljlZ5e9FoRgBhPyabZ8wk49FCoWb4UtyoabG/16StGclXUbNu3NaXTiEeNHSiP6C0UMnaJD5RrUu09AwtoBgbVaVAI52tcPLQB/6JIZp3bIc+t0vkw+y423XDYLahsZc/F6Hp2nGuRiT1wYLXmCgLgoP4fpp3UVpMKpg/UGcBsCM1S3l+TFlJFXfCFQ+nkblT1Ck2hIF31K5K6WOa6xqMAugplCTT3qS9+QTIikNRaOXUW1XS6GPucZHa53Y8FVwCF4R0Kcz8LRSklcnWquqE0GcUBVe5HT1k05qQ4SBSGqu/a7xHT3rDrPbWpNYIJ+kIfXNeXld0ozJ/+SW388Iek/59lGB2a1yoO7zeV9AyMrejaTESn98NIMNWMXo+q/AGjPgisAe57FqhA94jP91kCeiMBNNjVEphMR6ArGkjp9AIMvjDVCgrfteLhc96eiwpB9K5ONmTcsQV60n9frxaotgZgD3o29NZWJo6SELaYleSS4KLHUS5aC14XOrmcx59S4OrmLhJefmzNQYKdTk1agD6FiWUkVerJ/LfdBRegzEpMjy8y7DSAnf5NC8u5gZfBA5TrxJQxApZ3ZYOW4ZDjIV6rnqjsjdQ5cwjwo70qODWnaFDoDuc7kNZDLFpHb25EakPK3gGdEvWh0EYiyIr8ItRJJAv3WOfVDhwSxrSH61ef6/gzWlzRGSrTavguWD98TPEZBiPZnS6DmPF49BM2915gJdF97p88HI9agxJ2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(39860400002)(346002)(376002)(396003)(6486002)(36756003)(8936002)(478600001)(2906002)(31686004)(83380400001)(26005)(5660300002)(66556008)(316002)(2616005)(41300700001)(4326008)(31696002)(86362001)(6506007)(53546011)(8676002)(6512007)(54906003)(186003)(66946007)(66476007)(38100700002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU4yU2pOeVdQY3hPWCtLemlZMW9Ec0c1SnlwekRTblNqOW1TcWtuNmd6R2pq?=
 =?utf-8?B?enhnRmgyVDloQWx1L2R1MHBlU3RkU2REU0hOekw3ZCtOMUpEWEN6Nk05VGVE?=
 =?utf-8?B?SmQ5amFuT1JNL0ExbGpNbVlsNTV0Yi9palFROHVmSURURWVXSmxjN05KWTla?=
 =?utf-8?B?WEFaTnJ6YnNIS1Y0UHRrR09WY3RicE1jcVp3Q0U4ZXVTZ1pZRmVCaTA3M29Y?=
 =?utf-8?B?ejliNHhWTGVuZTlGaTNzVWxOd0YxZWpTeURtQVV5V0w1cElHTzEvNFlwWnB1?=
 =?utf-8?B?QkxKNDEwdjBsTUY0V05qRE40NlNocllBaTkxQXlmV0pqc3ZvbkVmVFZzS203?=
 =?utf-8?B?UURhZm55bW9KbGtaRURkZzhWQ3VuWXJIcVdGckZCTHFneTg0aU9Ba0xRWjBt?=
 =?utf-8?B?cHF4bGFkVmxuVFFBZnpEeC96dEFuOExFTGlQSC9Vd0d0RmhKMU4ydHFMalZi?=
 =?utf-8?B?dEtGWEkxMGJneG5RdCtSbkEzU2tNeERkNXd0NXZJMjVpSTdrOWgzMm9GS3k2?=
 =?utf-8?B?aTY0aThwSTZyQVJxaUpteXFEbmpMaVFJTmw2c2tqbWhhallJKzI3V2Y2elFU?=
 =?utf-8?B?YndRZENJcHBDcVlLajkyNkw5U0JIOEljWHZ2U3lLNllWQVFRdlVYaENZUk1t?=
 =?utf-8?B?OWcyM3FsRFhwU29jcVVtaVYvYTQ4WlFSU2ZQOCtjRHJQWVVCS083RDFEYkFy?=
 =?utf-8?B?N1VnMXA0aFFQZGV2c3o2d0pFNkh4d2JHeTRjc2RyV2lRQ2NwZXRJVlhWaEd5?=
 =?utf-8?B?bFNjV0RyMjY1TGluWUZmK2ZRRXpTc1g5WFJid2lYZzhTeWo4bHpwWWt1Tm1v?=
 =?utf-8?B?dy85RkxiQnUwcks0L1hJS21weHVVQ3BXZ2VTMDhiTVpmNm1vYzFZVUM0VHRP?=
 =?utf-8?B?ZGJ2QnlXY2VTZXNWVk1IYk9kK2d3SEZHMnpVWmg2RHBxeW8wSHkwMW5aTGVY?=
 =?utf-8?B?Y0xFdzBLNGt5bnlaMkdYMURGKzlWcXE1L2tFREt4QlRzRjMxeTI4anBBbzk4?=
 =?utf-8?B?TTZsWW9jVWJVWkdyZ0pPNTB2TGhxbTVFUjVRVk1Sb3ptUWlZLy9PamZrRWp1?=
 =?utf-8?B?UDUzamlCNVU2WHJFK2FMQ091aDEwblBKQlVsT2xpTGpBKytDZ3VPanovNDdN?=
 =?utf-8?B?NWVSbXErMkhUR2hTSWtDUG13Z1cwMHhXZlVlQ2lmNGJqVmpmZ3ptTEdZNUlv?=
 =?utf-8?B?d1FvbDJZNEFNcE1kVUN0Qkt6VHZXSDVxbkdoeVZGOTNRbkhJR3NLdnB6UFZs?=
 =?utf-8?B?elhCbkpQRFdMUlY4aUFrTTJCS01IZWZycWlOcllseG5kZzNMTzZvdWdMYnJw?=
 =?utf-8?B?eFpiN3RxL2NxanA1Q2IrTC9iZ2VUSFNqSjV0RG43R2s4c0xIZXEzcllEVXll?=
 =?utf-8?B?UGdYdGE1U3k2YTJWUWxJbzl2MXI5WnMyMGx1cHVuaUpoM2d5V3dPazhUTzVm?=
 =?utf-8?B?ZWNkc3ZSUDk3M201UGQrUlorT2hYRGlOV2U1eDF5eXpuVEVvL1RDU29TaW1i?=
 =?utf-8?B?d3ZLNlY1cEJIeVZKb0grZytySmNRSFh1WTIyVVJHcTRGUFBUd0lNdElnT1kx?=
 =?utf-8?B?dlNtVS9iWE5OeGtQZXloTDR2R3BGUXdnZkxTRVRZaVUrRXQ4N0VoWGZSdkNO?=
 =?utf-8?B?K1p0K0VmWTNCTFh6Z2swUzRXWXIxMFhNRUxlUDJiR3NqWFByOW13ZmNML25F?=
 =?utf-8?B?Z1BMSFdsR25SN0JuRGcxU29UUTF6NEFoZnkxVXN5ZUprRnJQam43UFpjdmhX?=
 =?utf-8?B?WkpnN0RzNmRmQWtscTRhcFQ0U1R1T3VvTkxmM1BDc2hUQTh0a3Q2VWo5YVcy?=
 =?utf-8?B?dWREZlJsOTJESHVabFVOT2hkQWoxLzgrR1l1OUxiTlg5TjBZQmFWQmVJOTZ0?=
 =?utf-8?B?MENkUVRXd2ZnckY1eTZpZ21la0dBWVBSU1djYlhmdUdYK3UvVkFSdFF5S2VM?=
 =?utf-8?B?Nnp6M2pKTk8rekhidndmeEdnTUxqSHIvZWhiSkoyeVpybDJ6blNncmlydmt3?=
 =?utf-8?B?czdic09ybHBhR0JEdXRlR0s0MTdvSERNU3lIRTlsRUZXU0xLT1ZVRWpiK2Za?=
 =?utf-8?B?bmx0NUt4NndXRmhhY1ViNGZaUzhRVUsza3RndUZQQVNnNjNQQ3BGYitZYjJI?=
 =?utf-8?Q?sWuMWGYxgDQhJ0qQlp2xdjVpK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7590ddaa-ff88-4c44-0c0d-08da59e8ec91
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 16:03:36.4122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQiyj+kSagXT+QaJcJbsU39nk8Md/gaDDLvBFHjnQYlsxSrAOXBftQY3t+H0sejcqociluIrAuJqVAzqKv/DgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7950

On 29.06.2022 17:23, Roger Pau Monné wrote:
> On Thu, Jun 23, 2022 at 03:32:30PM +0200, Jan Beulich wrote:
>> On 23.06.2022 11:08, Roger Pau Monne wrote:
>>> Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
>>> being filled halfway during dom0 boot, and thus a non-trivial chunk of
>>> Linux boot messages are dropped.
>>>
>>> Increasing the buffer to 32K does fix the issue and Linux boot
>>> messages are no longer dropped.  There's no justification either on
>>> why 16K was chosen, and hence bumping to 32K in order to cope with
>>> current systems generating output faster does seem appropriate to have
>>> a better user experience with the provided defaults.
>>
>> Just to record what was part of an earlier discussion: I'm not going
>> to nak such a change, but I think the justification is insufficient:
>> On this same basis someone else could come a few days later and bump
>> to 64k, then 128k, etc.
> 
> Indeed, and that would be fine IMO.  We should aim to provide defaults
> that work fine for most situations, and here I don't see what drawback
> it has to increase the default buffer size from 16kiB to 32kiB, and
> I would be fine with increasing to 128kiB if that's required for some
> use case, albeit I have a hard time seeing how we could fill that
> buffer.
> 
> If I can ask, what kind of justification you would see fit for
> granting an increase to the default buffer size?

Making plausible that for a majority of contemporary systems the buffer
is not large enough would be one aspect. But then there's imo always
going to be an issue: What if non-Linux Dom0 would be far more chatty?
What if Linux, down the road, was made less verbose (by default)? What
if people expect large enough a buffer to also suffice when Linux runs
in e.g. ignore_loglevel mode? We simply can't fit all use cases and at
the same time also not go overboard with the default size. That's why
there's a way to control this via command line option.

Jan

