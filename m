Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7A7A16E8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 09:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602901.939715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh2vF-0007Y3-DH; Fri, 15 Sep 2023 07:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602901.939715; Fri, 15 Sep 2023 07:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh2vF-0007V5-A1; Fri, 15 Sep 2023 07:07:25 +0000
Received: by outflank-mailman (input) for mailman id 602901;
 Fri, 15 Sep 2023 07:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qh2vD-0007Uy-Tf
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 07:07:23 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 843aba24-5396-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 09:07:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7340.eurprd04.prod.outlook.com (2603:10a6:102:93::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 07:07:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 07:07:19 +0000
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
X-Inumbo-ID: 843aba24-5396-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeZ2UgQGcjqCxMY0TqEqcXS2pI2AfrJizhAUbkevm1/DiE3ZQQuaUL+cgnr5GeLZnHNecNrEr3L1XdButuc/uyqdeeqdZlB5vJtSz5xU1J8Zu7QAPQcT2Qur9wiodSlbFkcLGkWXSwJIXmWL8miY2avZsrkjh34c/y5TNGKHIlWKHBM1RsYyxqdChfQny6Df2p8glBvxCiOPgNdmB6ezE8Gz1C60uuQvFhwKfFMckcSJ1F8kjCDWU7eGy0pvF9lDGNn3y1kwIjWUpx5Ag1NtCZd+fxKO0+qZORRwhjNJnXKM4+o94aW/8IMUeJ9AQdlDh1QL/QYL9vTqgP+ChhJj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCi03gudrkGHwDP8lQYr8K7CFZnefNRpM/sD5bs65/8=;
 b=jbQ6v4KyS+gZP1DlAv2huKA7Osd39oFMe5egr3qs39yetgFKO1rYNwNRiso8Qt15ypf+h83Me4Co0tfAM9j6cR52hHvhzyG0WTopb+yuqsYMFKKlr0fCMsAxguJUmylgluMkey81MgpmL78/zSgRkRCOH7uaPLACr5SkW2DCVOIpFGfGdcozGt2TchRdspz+zWvsVXJFUUKQWLyP323soodv97eP8GkqhReW7UEAF+dgNvq19EE/MKGoVRLdTRPkjZ1WJ9h15Km4DEkZyHyJktuXm9ol9fDeXuwgrvVVCA/7xIvhgICjE/AO2DPKLz5q9JIS53QRSC2ChtDhmPp8mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCi03gudrkGHwDP8lQYr8K7CFZnefNRpM/sD5bs65/8=;
 b=yDgYLimH/se/qyzj7Eor+e+jDvjZI8Euq2nKQwu7kh5Jdd58g4EhzPX6EIotOyiVoGDxWGefxpb6Vf11zF3pvH420s+Q5ac8LAfLSyLVwC0DolU//i1WF9A7MIAfVAy288DcdVgV8xdjwtWlFWGnMbMb3+Hc5KKJqn8Y/3aSOM85nom7eMlSrOVi/mj0QXUuLy+1LyJmYUGM5zWqldYAIV59uk77NUP/Nw07dBJc0CDq7gwGzLibNxMQzjwf6ERnyDbRUHJ7dNVDzw/Nq6CEMMqiXID3A75YWPm525eTFsytBwv5RTVA8sLMEf0RACNeJEWzTMOGNpJLkCIb294PAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63f0afcd-1baa-ae78-cc01-5f2e2d606201@suse.com>
Date: Fri, 15 Sep 2023 09:07:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/8] x86/spec-ctrl: Extend all SPEC_CTRL_{ENTER,EXIT}_*
 comments
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-5-andrew.cooper3@citrix.com>
 <e12f46d9-25eb-d564-4cb7-0e476e741725@suse.com>
 <35177e10-3306-69fc-4ece-bba453cbdb0c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35177e10-3306-69fc-4ece-bba453cbdb0c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d13c7c0-25bf-4a83-f6c1-08dbb5ba665f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hSpFBM1MdNQTcQlDGFG3MJ4ydgI4tybEE17aDn0kKQbV1Bq9tXfowfpDos7TM1HuCfVWFnsaxvgqQFbKiEE/Eoy33ioxzGmarjaYeZpi0Wshoa/5hJchz5L4/L8HQ/pMqIvVsgrynyB9vbga86wskHDGKUZcR0xDhmBUWQZEf5XpBkxLZ9vw3IiZTmk3r021n0TChG3J5y/sCp6goI1lo90uMxhapBTmCw2F/QQT14kyM7EYPoUJX1r9Xvapy1/Lmn9SLUKnRj7a8jmgtzjHErgrtLIWoKoZT9p6OyJH/lQQ9joZg5EABOdr0WISsWJpkB4orA1TiDk9GBl8047/Q23P3tiCzbjrxDsLDXPPpO2Xcj/yXefLF02a3goAwVrwyJjRL4DkaYLWs15gJ7TClbVWfXcNxHM8rJlQMuIKNCvH80fwC12amlMGdPsXIMKQIR7zDL7i87NbbcR3/XjrfzztdRmIjvjnP6D0LSRhxGsdGoPXtmJlI/kHbt9TymXvdumqTywHdIZFoKjFGRI5oj6dO4TUsS9gEtmUX50GbOtWYUo/R3jICT/NeQ8Ycv0Z5i1dqpEMfYObKC6J7BnuWtN/bUcrlJjschx7+AayvnIbDoyABDqUs5M/ww0PYOgogCwwPmmlYTdsagouGiDz8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(376002)(366004)(346002)(186009)(1800799009)(451199024)(5660300002)(26005)(8936002)(8676002)(4326008)(2616005)(2906002)(86362001)(31696002)(38100700002)(36756003)(6486002)(6506007)(54906003)(66946007)(66556008)(66476007)(53546011)(478600001)(31686004)(41300700001)(6512007)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlpBL2RweldVdG5OcHF6b1BiVW9yYjJuUDBTem9WL2dKSGNEdHBmeG42NWtz?=
 =?utf-8?B?d1hMcmVJOEVnOWs1VTd4YUltSkRLUmRTZnAxbHRVeXBqNGVpVW11Y0oydC96?=
 =?utf-8?B?ZENGMW0zMUFQSENqNUNNTDY1Mko0Q2sxMjZYa24xVm5KSTZqYkNKaVRTUEdB?=
 =?utf-8?B?eDd3WG91RVEzQ0RzMnNQdmV1YjRGdjlHNVc2aEk4RU1kUTduMk4rRlBlY3pK?=
 =?utf-8?B?TGMvQk1aQ0xDUFI1Wkw3bmVaQUY5VmR0bENCaXRHVzNGNk9OVHJGc3FxcXJi?=
 =?utf-8?B?UGQzdVpYRFlQdHEyTldOQStnZ1dGdzVuOVQzRDBrMmFsQnBzUVdhYmtQcE5z?=
 =?utf-8?B?VFM0NkFLK2FoY2lJU3BMZEMwdFBBMXdOWnhrZFl0TzUzZDIzZjhvamdNK0pF?=
 =?utf-8?B?Sk9PSnN6THhmcjN1Z2lkRkh3VFdNRzVDZzQrNGdvVVh4S0tpTmNJU2J3dFZk?=
 =?utf-8?B?bzBRNFZwRmh3YlI3OVp1a3pyaDMySDUrYlNHYmUvMWJOYXdYUENvc3I1VSsw?=
 =?utf-8?B?VmNiNmtMaDFESzJjUlFMMjBPRDQ3SXRCZGkwMC9Ea21SdktZRGs4SHpmR2M2?=
 =?utf-8?B?ckV2WEtKU2hQY1lOZ2RndkgxN1VFcW1uL3EwZVpxVTJkMTZVRnMvSDUxdWJr?=
 =?utf-8?B?dStoeHpDVGhVSnZkcy9WL0ZOTHhIaWpSRkJzNkNCV0puU2JFYzVOWHUya2xE?=
 =?utf-8?B?bEF0NnhrTG9PZGx1emVzeWtjd244R3owcnpoVnZUNEh6NERjajc3L3VBd0s3?=
 =?utf-8?B?ZXdROVlDZEgxcUYvT3BHajJ5VmpreGd1dnNYTkVRQmlZREVseDJjQUpoZzcr?=
 =?utf-8?B?MzRteEVhejNFQW5pdzVCYmg3YS9mbDdiQ0hEOU9NbUFuZ1Vrelh3bi9XWGRQ?=
 =?utf-8?B?QmdnWkwrR09oc2ErNEFuRStsKzkxVERJVGJIdDhvTCswVkl0Q2ZsRllPR2hm?=
 =?utf-8?B?S3I3aUdRZm5pcVJ4SjVFb29TVHd6bHpMUHVENVFwRHd1ejNWQWNxQk5abm1H?=
 =?utf-8?B?QVBsbklsck5xOE4wOWdhNmZxL2dNNTNQb25JSEcyR3lCRDg2amd1ekRMcmpJ?=
 =?utf-8?B?YzB6YjlNdzFYVE9XUzlDNGlISFZka0F3RmQ1eDRpRTVsOHFBVklVMWY5Vlor?=
 =?utf-8?B?S2ZxYlM4dWx4UTJFQUR0WXBzR1pSNjJQZi8zZlk3dHQvOGw3T0RHdGxaVDRD?=
 =?utf-8?B?SkNjRlFvaDF2c2Y4bWgvSjd4OU94RGNLTnZIdCsxaTdLQWlqQTN4MXRSLytr?=
 =?utf-8?B?UzJHR1puMjk0RFNyV29GZmlxZVdKSnhGRzdSb2NCOUJkbVZTRTFORUFJWTZq?=
 =?utf-8?B?ck85cmpVSG1hencvM3JrQU9Wd3BqQUp1MHJrNjg5V0l1SHB4R2lsN2J0WnVS?=
 =?utf-8?B?SS8xM3Q4Vllpd0M2cm5PZEJUYlJBdUI1dzVEV1R1RTZFU1dEV3FEbi9COThB?=
 =?utf-8?B?S2lucEJhaWRZeUtiRG9BaGpsS0l1cWQ0eDZrVjJvdk5JWkFTMktiYVk5aytL?=
 =?utf-8?B?NGlXWklpd0hWVGhDS2dOeGoyTEpxMkFmbVFmcjVVd1B5ZHR3dzkrUVNicWp1?=
 =?utf-8?B?Qnh1RzRGbHFBL0lsWHZNWXFFUkxPenZTYTBacXE3OCtvVkl6SjFDQnJZMWNK?=
 =?utf-8?B?ZVdReTYvc1czRkJGcERsemxUd2VBMDJLVmVyQzd1UlpXVFp6cjZjeWJrdktR?=
 =?utf-8?B?NENVVGJobGppNDBRUmU2eDhyLzlhMzZaeXlLbDdQNHFZdnoyWVpBL2tSMGZI?=
 =?utf-8?B?M1NPd3ptSUlxSjRjNitOQU9mYTdXNVFWUFl2Vyt4YzVzUXdYdGdLOVE3cW50?=
 =?utf-8?B?TStNbGdLOFpHbVpYOVpIZlVUcUpad2YzdTdYNG9HQXJmNmQralEzYjNYODNW?=
 =?utf-8?B?MmtOUENtK0lBWTF4MytRL01zM0tyQVczWmhFN2ZNRlNzY1dZdzRzS3hlUngv?=
 =?utf-8?B?bWZwb3o4Y0Z0NlZ0QVJKVGZablBrMk51RXUzMUFld3ZYYVl1aXpPU0cwSmFL?=
 =?utf-8?B?bThGeFRDZXJTR1JLcXhWRzVXL20vRW1PTS94SDBEcW03ZW9qOHpqWlhoenZn?=
 =?utf-8?B?VEFxY1hHNVViU2p5eGRWa1ljZWZjdEJKN3NidTlXdm9TTFpXWjYxRXhCcHoz?=
 =?utf-8?Q?60ZCjyjGhtbFBf8bB6p1QxOpS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d13c7c0-25bf-4a83-f6c1-08dbb5ba665f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 07:07:19.1220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqBPaqekaI9XNXrIA1PxTNMYWfVVpa7pb7UK/EiWK+GAz+eEtQxYCgTeY/OP2y0UUfpMO7/Hb8ORPE0OJN1RAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7340

On 14.09.2023 21:23, Andrew Cooper wrote:
> On 14/09/2023 8:58 am, Jan Beulich wrote:
>> On 13.09.2023 22:27, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>> @@ -218,7 +218,10 @@
>>>      wrmsr
>>>  .endm
>>>  
>>> -/* Use after an entry from PV context (syscall/sysenter/int80/int82/etc). */
>>> +/*
>>> + * Used after a synchronous entry from PV context.  SYSCALL, SYSENTER, INT,
>>> + * etc.  Will always interrupt a guest speculation context.
>>> + */
>>>  .macro SPEC_CTRL_ENTRY_FROM_PV
>>>  /*
>>>   * Requires %rsp=regs/cpuinfo, %rdx=0
>> For the entry point comments - not being a native speaker -, the use of
>> "{will,may} interrupt" reads odd. You're describing the macros here,
>> not the the events that led to their invocation. Therefore it would seem
>> to me that "{will,may} have interrupted" would be more appropriate.
> 
> The salient information is what the speculation state looks like when
> we're running the asm in these macros.
> 
> Sync and Async perhaps aren't the best terms.  For PV context at least,
> it boils down to:
> 
> 1) CPL>0 => you were in fully-good guest speculation context
> 2) CPL=0 => you were in fully-good Xen speculation context
> 3) IST && CPL=0 => Here be dragons.
> 
> HVM is more of a challenge.  VT-x behaves like an IST path, while SVM
> does allow us to atomically switch to good Xen state.
> 
> Really, this needs to be a separate doc, with diagrams...
> 
>>> @@ -319,7 +334,14 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>>      UNLIKELY_END(\@_serialise)
>>>  .endm
>>>  
>>> -/* Use when exiting to Xen in IST context. */
>>> +/*
>>> + * Use when exiting from any entry context, back to Xen context.  This
>>> + * includes returning to other SPEC_CTRL_{ENTRY,EXIT}_* regions with
>>> + * unsanitised state.
>>> + *
>>> + * Because we might have interrupted Xen beyond SPEC_CTRL_EXIT_TO_$GUEST, we
>>> + * must treat this as if it were an EXIT_TO_$GUEST case too.
>>> + */
>>>  .macro SPEC_CTRL_EXIT_TO_XEN
>>>  /*
>>>   * Requires %rbx=stack_end
>> Is it really "must"? At least in theory there are ways to recognize that
>> exit is back to Xen context outside of interrupted entry/exit regions
>> (simply by evaluating how far below stack top %rsp is).
> 
> Yes, it is must - it's about how Xen behaves right now, not about some
> theoretical future with different tracking mechanism.

Well, deleting "must" does exactly that: Describe what we currently do,
without imposing that it necessarily has to be that way. That's at least
to me, as an - as said - non-native speaker.

> Checking the stack is very fragile and we've had bugs doing this in the
> past.  It would break completely if we were to take things such as the
> recursive-NMI fix (not that we're liable to at this point with FRED on
> the horizon.)
> 
> A perhaps less fragile option would be to have .text.entry.spec_suspect
> section and check %rip being in that.
> 
> But neither of these are good options.  It's adding complexity (latency)
> to a fastpath to avoid a small hit in a rare case, so is a concrete
> anti-optimisation.

I fully accept all of this, and I wasn't meaning to suggest we do what
might be possible. I merely dislike stronger than necessary statements,
as such are liable to cause confusion down the road.

That said, I certainly won't refuse to eventually ack this patch just
because of this one word.

Jan

