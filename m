Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4970B68D
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 09:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537776.837279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1013-0004E7-A0; Mon, 22 May 2023 07:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537776.837279; Mon, 22 May 2023 07:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1013-0004BS-78; Mon, 22 May 2023 07:31:37 +0000
Received: by outflank-mailman (input) for mailman id 537776;
 Mon, 22 May 2023 07:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1010-0004BM-TL
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 07:31:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad01cd28-f872-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 09:31:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8085.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 07:31:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 07:31:04 +0000
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
X-Inumbo-ID: ad01cd28-f872-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBL/OCVNaasVgUDZ4CDfbQIgtKSUjwsID9c8aR3lGvTGA9UQudm+7KwiH1i3ihFKWvaJN+gOpUMTrokCR1fYoV6gIbJzidpmzR24Pmpkr4KrDUJBaMp3yZTcrwrLHGlDDn+TIDZof5ej9/m8xUjwIGtRDqkMxY1WP3qyXVUC/NKEZUlnlFPN/jC/zGm+iXOuC32mOcqMnh1nHBvnQzDZtIem6IBqartGJWuYDzSd5s2lFn1/TSoeQILmcqTQJv9JDK2hfduS70uro9jWWlqhtMoTKc6JCseDbTJ6ypnAbzu0q63TtmwQ37r1AvLaR1/vGA/0uRxxHxx5xcS4BSg+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWbikd4CO1Y3ADVhZAqLtLz58LsSBYYwyMmvo++9TKY=;
 b=h/ctD+3Ij2L6hWBQLFZI6Td88Ne+TwT3RIdkEobE5avrzI/rYwEAJ2iXSliPXAzIJMulMKmnw10+CaWjFSUHV7pY3r9iLnG3QGVyJ8cU6ove0KlL9mD1jtDiJEcka6d8HOFMKEE6rYLXEowT09TXr28lgF8Yc6RmELfpbwyCqce/gxelc4ZkoGCpdcYJKWZiHZ8Brm/6PjBAH36kg8c1Z/ND38R3+fuIgHCLcfJsBzhePaJTnqwdoXERLnzEIH8+vBsi8UOBtrwsmOgn9S6rEcRpxv6N3kEibGo/nifHM6sQSiOg7YWkIsABQrfJR05H884gbx6NLhk5TONeCZmm+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWbikd4CO1Y3ADVhZAqLtLz58LsSBYYwyMmvo++9TKY=;
 b=4yu9szc1x4f2ev8H3W1HVjIAs2ugrJyWd+cNFt/knC+7VKHJ4heVC7vyM+nCH15heygiG1h43cChSfUZvJa1xp3VLet73vAimdUqiF/+UTrwJfvWJGZKHjnkYvOkUDxE9JeR8R9/IWmyIu92N9yBeJ0rsdaT6UdwM2ijwcta4J05doTV6XX8rsWF2gtNxGBzw0qVZmnnPcafSN4ac2m/xQCsIYq/NzLNuPpVhDWj86edrD5MCWQcsGHqAwnWf2+mr9Cv0aZv/+sqPFPrH/tLge2Xxf12pzKt9iQQNJSTTSYiCmeNMeOzslyPrQIGRR97hlYfLJatnP7HAvFhDELAiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bc8f75b-e46f-48fc-3083-aac30995ec29@suse.com>
Date: Mon, 22 May 2023 09:31:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
 <a545a6c9-db48-9d91-c23b-59ea97def769@suse.com>
 <25421dbc-5889-a33c-37dd-d82476d56ce4@citrix.com>
 <1bef2b0e-04e8-2ca0-cf03-f61cdae484a9@suse.com>
 <b1c56e56-90cc-0f37-4c8a-df1217339e59@citrix.com>
 <22a6bd70-887e-da72-ccff-16b3627463c3@suse.com>
 <54b35fa0-160e-3035-6c22-65a791ed2f84@citrix.com>
 <a53a77e3-6dcd-2668-0f3c-282de93d8b04@suse.com>
 <897bac23-b17d-ec4b-613b-d4d1b4c77d58@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <897bac23-b17d-ec4b-613b-d4d1b4c77d58@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: e798160b-93a0-46ad-36b2-08db5a96801b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2jZqNbmv624XKyHAt/sW4zZI4N/wLPhaMjlOfGvPCvRx1tPhyn5IR5FlWJ2lZANc9MWwFV+VfJBio1SQEvYBt34ZofwvkoBnp1SBfQbtusRiNV210WmSd/QAiCrxvYKPYhYk7lVG8fBeIlIhUEjNsfvqWIrQ9p4Rmk+sfENTiYa7u3V9LizGytZk87kAU60DuvCyxMWJ9eYSVbavwPBmlmvVVFea5dXVbRk12512SM6yWHOg9fbN5Ls4vf2jdR1wOoJjI9h8M5Xp3GTPMs012aktBKUNePQc193Q9WMi2XUIC94HJYS86DBH6l23ePQDS4O2AB7xfzbBG193R9A/4ppW8+xhQE4PURVvvGTtrGNY/0ZEbS7SVb0RUM2dHPLUzNkGEwBpWwEITYwyUkjc/g9H6qWmka6YG6iAO57Ft7fXgQtEtZ7ZYvbtwXOtdRXF1/WC/GXZe8gf066/IYVtCvBRgBwptv2BCds/dJX0jZrdbY+X0dUdFK4Yz3/MkE5H1u99E/TOr9cBQ1CTJxeX7TLpRbfswwqA7DNfTllBl/ffXJ7eDxpB6bU4x/0+kE+4SMGuRsUlGR0x6BbdHnF5jrR0gnkyfHauAGfzVf6fRijQtkRKwH2Z40EzmoFbRwG3nfyj/QjOk859/D8GX7OqyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(31686004)(2906002)(66899021)(5660300002)(83380400001)(8676002)(8936002)(41300700001)(66946007)(4326008)(66556008)(66476007)(6916009)(54906003)(316002)(36756003)(6486002)(478600001)(2616005)(6512007)(6506007)(26005)(31696002)(86362001)(186003)(53546011)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MktheEQrOWgzVG5wQm01WTA2TDI3dVQvZkVldkxuZHhuQWR1K1dVa3RZMGpZ?=
 =?utf-8?B?SmFQTWlXYW8xUlpGMm1kelNMR0QyRWtQQVpTcW9USU9CcnZLaFN0a2VvNFdS?=
 =?utf-8?B?V0JwMjc5cjRUSjVsOVZRS21adlV0TE9xZWdBQlRuV3VKajZJSHRsMXdvS3Bl?=
 =?utf-8?B?U0JuT2JkTXRMa3FtejJ1TVJpZ044U2hzWGIrVWVJWFM3VU5jWUxPYXE5SVlT?=
 =?utf-8?B?Y09EOGZaeHkyWXZvUlNnc2dZYmQ4VDZWZ3hiKzYzeWliNTc0cm5DdWdHRWpm?=
 =?utf-8?B?Y1MrTDh6ZnBQVU42YWc5Nm5WNG85NDl6bHJiUTVLRTh1cEl4TkcvZkQzUUhx?=
 =?utf-8?B?R0lhTkJadjdnLy9CSDdEb0ZuQlc0TkJSZUdEcElSLzVvTjFvWFhxcHBLdDEr?=
 =?utf-8?B?dzRoVUxOWXR6OUJ4QlhvYjZ5am4raFo1azc4L0kyR1d2UndVYjdLK25LRnVV?=
 =?utf-8?B?Z3dZZ0lrQkV2MUFnNTZMVDRieGhRZ0JxYTdVMWIrbXp1VFlEUjZJdVV6Qmk4?=
 =?utf-8?B?K1JjTCtvdzVMb0ZzRko3V2Y0WEZjTWxoUFB2dW5SaGpzR2NwWmp2Si9neW9z?=
 =?utf-8?B?RFJwQTNGZlkycUhWOG5nb1pKUmF6VzJVQld4c2x0UFV5dmZoU0g5bnNvdmsy?=
 =?utf-8?B?MjVvamxpWUZKZE5neTNOdENnUHBGVVk4c1A4SnJRcllWblkxME5uQnovcW9y?=
 =?utf-8?B?M0lBcEs2VU5wUnVteVZ0ai9pMzNUMERMTzAxSGN4TFZ5VlRsUXJCcW56SDUx?=
 =?utf-8?B?Z3p3WEpkdi9QZWFZWk00YlRSdjB0bjlnbWZncjJRRTdrVDZrMStiYlQzbUM4?=
 =?utf-8?B?V2s5T0R4eHlVTUNsS2hLMzVmcmJ1Wng4b3hOY2VJMENyTzN1S3NRak9zc29s?=
 =?utf-8?B?S1JPaXNPRnZkY3dpUVJVRjNNdFRCcDFCbkg4VGhhRzNpWlp2Y1NWc3czc013?=
 =?utf-8?B?K2hWK1JCUXk0RE9VVXdMZ1ozZ2sra3NoTkQ4WHRxWGJpdXQxR0R4NEZ0L0J1?=
 =?utf-8?B?SGJBNFJINWk0TmhFbXdhSzY4MmhVbzVGTGRjREFaZzVqdldySlI5bll3MURB?=
 =?utf-8?B?Y0tFQVBVYitiQnRtRlVhcm5IbXowQTJpTEFnT0FoMTVZOU5aRXNLN1lsdzlp?=
 =?utf-8?B?NzFHSmw1R0daT1h2VEZHek9aeER2dk1HL0VRYjc4bmxWSEpSL3lVc1ZJNWR3?=
 =?utf-8?B?MUM1aTlTQ2owOENiTkd3TmVXaW16bUUvZjdiWmN1VzViUHh4ZGNCdUR0M3gx?=
 =?utf-8?B?RWl0ZTNEb0FNTEEyY3ZVKzZsTUZ0aEcxeENrQm9PRDR2NmprZzVhcC9RbjNU?=
 =?utf-8?B?dmFVM2ExZTJaQUxjMU5NL2dyaENyQjhwQkZnVmk2K2JSVXU1MjRaZlloUmVi?=
 =?utf-8?B?QzBLb0hvZ0J0VzlDZXFMcktTRlQ4ZFdQdnVVd1NsVEtEbi95dVBkdlNobHU3?=
 =?utf-8?B?bFRVQkNpSmFyVCs0UEcrc3FnTUxpQ09BOFVGb2FYL3lXZm5jcGJwTEY4Mytt?=
 =?utf-8?B?QVV5UUdjTC9FU0dZWGhXd3RaeGdQTThnbGxjNEF5MnZOQklEeWlRYmZHU3h2?=
 =?utf-8?B?L3F6ZUlzRG5mTDlBV1lDTXJGd05LVjlyQ0ZjN29lOGk2cTk3UGNzTDJqS2Jw?=
 =?utf-8?B?QUxTTnFNRTZhREQ4Zk5yQkh0ODVnTmh2b1dydllYeWF6dUFRUlZSNm5BWXVN?=
 =?utf-8?B?ZVY2b3hzR2tXS1ZSeXZlTmdpWFVYS3NNZnBlUHd0d0ZoVFQyTjkxSE54azl0?=
 =?utf-8?B?ZmU4TW9ZWG5VMWNGR1hMdW5odnJtbHpSS28yd1BnWS81NmNlYVNzREFkQzZO?=
 =?utf-8?B?c2pvT2d1amd1Mmx4Mm5HendhSlZsYTZjOFBnTHJReWpSVjRpUlJ5ODVyT1dv?=
 =?utf-8?B?R25sbU8wOXlqdEIwbkMyaE1LSllGdGlBN2Y0cmVTUXAyUkNFc01VUExhZm5E?=
 =?utf-8?B?Y0libDFidkNSQlU1RTFSN0puclFyVjByT25ZWDFTaWZQMXZZcElpWXM4amhp?=
 =?utf-8?B?bVd1NEs4UUVOS09MSHVKcFRRQWNSRGtUMzRSR1lFRmE5V0NxbXJSMkVydjVr?=
 =?utf-8?B?eitEVHo3YWFFakUwS0NFOFpCeVpGSnp3S1F0d1d6cElsdlV5SU10UUp3SVVB?=
 =?utf-8?Q?HzWYPtg85lKdSZznOwp2Dh2z5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e798160b-93a0-46ad-36b2-08db5a96801b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 07:31:04.5781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUxjm6chJa5HeOZCjIrMJRnIeXxN6Uo/5QF67Hwa+SN0woAAr1Sucd7C10zL6N5E8Eb70SEZzm08OS3dOEoliw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8085

On 19.05.2023 17:52, Andrew Cooper wrote:
> On 17/05/2023 10:20 am, Jan Beulich wrote:
>> On 16.05.2023 21:31, Andrew Cooper wrote:
>>> On 16/05/2023 3:53 pm, Jan Beulich wrote:
>>>> I guess that's no
>>>> different from other max-only features with dependents, but I wonder
>>>> whether that's good behavior.
>>> It's not really something you get a choice over.
>>>
>>> Default is always less than max, so however you choose to express these
>>> concepts, when you're opting-in you're always having to put information
>>> back in which was previously stripped out.
>> But my point is towards the amount of data you need to specify manually.
>> I would find it quite helpful if default-on sub-features became available
>> automatically once the top-level feature was turned on. I guess so far
>> we don't have many such cases, but here you add a whole bunch.
> 
> I'm not suggesting specifying it manually.  That would be a dumb UX move.
> 
> But you absolutely cannot have "user turns on EIBRS" meaning "turn on
> ARCH_CAPS too", because a) that requires creating the reverse feature
> map which is massively larger than the forward feature map, and b) it
> creates a vulnerability in the guest, and c) it's ambiguous - e.g. what
> does turning on a sub-mode of AVX-512 mean for sibling sub-modes?

Feels like a misunderstanding at this point, because what you're describing
above is not what I was referring to. Instead I was specifically referring
to "cpuid=...,arch-caps" not having any effect beyond the turning on of the
MSR itself (with all-zero content). This is even worse with libxl not even
having a way right now to express something like "arch-caps=..." to enable
some of the sub-features for guests.

To explicitly answer the AVX512 part of your reply: Turning on a sub-mode
alone could be useful as well (with the effect of also turning on the
main feature, and with or without [policy question] also turning on other
default-on subfeatures of AVX512). But again - that direction of possible
"implications" isn't what my earlier reply was about. As you say, reverse
maps would then also be needed, whereas for what I'm suggesting only the
deep-deps we already have are necessary: We'd grab the main feature's
dependencies and AND that with the default mask before ORing into the
domain's policy.

> Whichever algorithm you want, you still need *something* to know that
> ARCH_CAPS is special and how to arrange the defaults given a non-default
> overarching setting.

Afaict right now that would be achieved by the same 'a', 'A', '!a", and
"!A" annotations, suitably placed on every of the sub-features.

Jan

> When the toolstack infrastructure grows the ability to say no to the
> user, it will be able to identify explicit user settings which cannot be
> fulfilled.  (And with a bit more complicated logic, why.)
> 
>>>> Wouldn't it make more sense for the
>>>> individual bits' exposure qualifiers to become meaningful one to
>>>> qualifying feature is enabled? I.e. here this would then mean that
>>>> some ARCH_CAPS bits may become available, while others may require
>>>> explicit turning on (assuming they weren't all 'A').
>>> I'm afraid I don't follow.  You could make some bits of MSR_ARCH_CAPS
>>> itself 'a' vs 'A', and that would have the expected effect (for any VM
>>> where arch_caps was visible).
>> Visible by default, you mean. Whereas I'm considering the case where
>> the CPUID bit is default-off, and turning it on for a guest doesn't at
>> the same time turn on all the 'A' bits in ARCH_CAPS (which hardware
>> offers, or which we synthesize).
>>
>> Something similar could be seen / utilized for AMX, where in my
>> pending series I set all the bits to 'a', requiring every individual
>> bit to be turned on along with turning on AMX-TILE. Yet it would be
>> more user friendly if only the top-level bit needed enabling manually,
>> with available sub-features then becoming available "automatically".
> 
> I think I've covered all of this in the reply above?
> 
> ~Andrew


