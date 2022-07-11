Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C774D56D7E0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 10:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364934.594913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAokZ-0002a1-Vk; Mon, 11 Jul 2022 08:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364934.594913; Mon, 11 Jul 2022 08:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAokZ-0002VM-OC; Mon, 11 Jul 2022 08:26:39 +0000
Received: by outflank-mailman (input) for mailman id 364934;
 Mon, 11 Jul 2022 08:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAokX-0002VG-VO
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 08:26:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60047.outbound.protection.outlook.com [40.107.6.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d4263d0-00f3-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 10:26:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8983.eurprd04.prod.outlook.com (2603:10a6:10:2e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 08:26:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 08:26:31 +0000
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
X-Inumbo-ID: 2d4263d0-00f3-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFXppaNp0EzHbPHm5OpKx8GaFyfenLM9+2/e2rDJyNXTn5zeEBBJmhcDOco7FTXGVMJ+IQBqASObqa2DZ49iz1QrC3l7z9LxDRxXEK+crV4i0K4tNf0M7/odzSdm2A5geXPbFs8g5MIOwbiAVL7lXlaRwhkEmMM5cLF7gyOQg0vvC/JapxHKI1hGEE14/RIJX0qOb1aAt5qsSCrrDTPzKSL15OA9Kzr1D+XvvfrAP547Y/njLMSvYP3+h/ldrG1K6NTQvmtQSeRqCVH45blnktbusunxKXaHt0z1BfCXZ/J7KKRvSrmcnjQLVLRUxo9dPCnN34XU7IlPw4hBvI9q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSd7oNfivnMJE+omTLKeRVu6AOBoJecHJZhcH44Ew5U=;
 b=aRX8ooFhnaRUjY/46ZadA6NffEnWwMsAysajBnutHfrvJbd70k/FnDu2Fj++q7GCFhCzoVpZvnKmVogk+gBkK8USw+HwXMnBb1APgu+lfYu8mXyPGtd43Pj5EThmZdu+43ol9DEuhijF43e5ROKGRGYiJbsJykBRiKfTFBr3nJcxmdlP45dLAGeMFXwzbWGP9wQ8yZdsOI+XvUzRQhhBAahcoS/4BtRhCskJDIgkFrkIZmibFaRrLTM88nCnjwn7qu7f/6dbkJ/vx2SJw+Gt9+VZiXjBdKo4cRBHsp+LC/aJbHo2St2ZxypGK85bsoe9CiOIvUCjkK8HNNamgkW3KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSd7oNfivnMJE+omTLKeRVu6AOBoJecHJZhcH44Ew5U=;
 b=iP5w9cDcycEKa+28L8bMczGxUJ77T67uV0RgGTxKVSlPW4+5pY17e6WMeAqe5uWT4ihaJWiYtd5JZAsU91b/Z55ZrgwyW3tqT2CzNCzoDQY69euxw+ESVKIfQ7b4f5L+x0+J95Dmp0j7S2/UP+tzIUza945T0bVSAAU8CyPKm0VGYwWmoWIXYF/kCjmDZuk/4cf77vA2fU3vxiHJTsz0K/+ogRQs6MwNWSAzEB/GTk/FKVC7t7/cKkJOyTN07y0M80nlRWHrzm6UeEMDUEQ4TwD+gnfiXU2VA0xyYWC+eCUYP23Bb6AJ5cctPp7OV4enq8AfOkaRUERu0DB3AzHdbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64e06bd5-7919-7235-600f-b9b0e59ef66f@suse.com>
Date: Mon, 11 Jul 2022 10:26:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RESEND v10 2/2] x86/xen: Allow per-domain usage of
 hardware virtualized APIC
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, "Gross, Jurgen" <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220629135534.19923-1-jane.malalane@citrix.com>
 <20220629135534.19923-3-jane.malalane@citrix.com>
 <BN9PR11MB5276AC94021EA92C539D5F078CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <a878aadf-5bc9-184b-d3f8-4e43ffc64262@suse.com>
 <6b01e02b-ba44-5f8d-f766-ac889c28d662@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6b01e02b-ba44-5f8d-f766-ac889c28d662@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0112.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc650e15-e888-4e41-f6e4-08da63170ee0
X-MS-TrafficTypeDiagnostic: DU2PR04MB8983:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gT/DcenU/zoXA5T12KaF+wT/Nw6SmddciwvQ6iA2AhjJ16F6d7TG1sY+XQMQaVax/M6DRipBtzzNAjBz3wKoS4ezMnf7IaexyJ/sw/IDMSHY27jYfgvWvd/BeZTbXz10C8Lc7sw58anBF+k49a9IQSNP46w3TnYvvjaDaM3ElpF/82lXFo7e2S4hfHjCwb5a93b5p4nd/APU2qNnVQiS1eKcY4absBfWkhMHz+7HYVQQaxEZRvCzvNH3hk6/tyyc+AH3RpqYj93sBIe1cx7GW+nzvp/aiR8FjB0QcVV3j6prest/FTZmh85cIR9yWRVkpCFro5GIxK41zFTdFtc0zUU72CyX9Eq+WMMXn5J2IKlwA6Um+f3MwPs5InO3UfHdMU6/sd+toqlUAMcfeP85si68jMS5SOUHFu3hKAdQIlG5zDfVcMck2E58Snoh+vbWnOrl3Vl6/nWtzPIf5butYIRcc65r7U/falrX5bnx5BRGyQF/x13s+StJ0Xn/gk5kmnRK3w45OUqDMdIlRjOpqnZP+r2nSZvelX95gP7Q/cu7LtXtpufPoMT8K/ZSP3kADC9S7mzoQCcjs4OHivA/sPIYFaoDbOAsul/II3t8a9Rq3OO/CD1IgvgF781lzu6d0c9I+7MMBaQgKPbbrVlG/K9ZELCINiMl0YNjNn/hucYWkCfgrW0uk/teTW8KGgNqVS8o1i0KzvZnoeWcGK+03fTv6CQtzcOMnzATW0MVrkzpskiBF7SwneF0QvjOACqCUAP+Zb3gFf9RC/Llvgp036KmFZJ2BTqwl7nBPCyyOFuI8MR/O0ANYghyeRajQAjZLYInALLSw5BIQaxqUaxTsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(396003)(376002)(136003)(366004)(8936002)(478600001)(186003)(5660300002)(7416002)(6486002)(53546011)(2616005)(26005)(83380400001)(41300700001)(86362001)(2906002)(38100700002)(6506007)(31696002)(66946007)(31686004)(66556008)(316002)(66476007)(6916009)(36756003)(54906003)(8676002)(6512007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHcyY2haQWNpVzFNVTRoT1dTN2kzd1J0SUtGcnRQdXF1aTR1QmFGVWxWaG9D?=
 =?utf-8?B?QXBxemZKK1c2WWJ4enVxUUwzYzYzUmtwbDlWSkJnT0l2cVZLdzdBZGtlVXdl?=
 =?utf-8?B?aGFLUmEyeVlvOWwrQVQ0NTJZcTg5aGpudjlJYktVWkVqUFFxS3lkSjd6R3VK?=
 =?utf-8?B?YWp5WjU4SG11bnJwZ2NUbVVBNUx6QlBWL2w0bDNSMHNOM3UyallYd0tMait3?=
 =?utf-8?B?eE5TQmNsVEpKMmkvZGN1SEVxcGxtU0p1dkp2a2Jzc3h5KzdxSVAvdkZhYlRl?=
 =?utf-8?B?d0tSaUJDbG0vWnNPT2F4OE9tbDNuWGxkanV0MEErVi9pWHlpc2xrVEZkZnd6?=
 =?utf-8?B?OC8xRnF4aVIwQUJjWGpYL2lnQ2d4S21zZ1VKSU9BRisyOU9SeDB6UTZ5ZGhk?=
 =?utf-8?B?UVFDTzJMNTVGZVJ3TXJyRlFYckcyTUt5NlJTRVBtQmtVM3hhS3JiSkhDWmxh?=
 =?utf-8?B?dDZaekU4d2VLU2JtWlp3Q2E2emdtV3haQWVDY1E0YnlESm1rMm14aW9RSGcy?=
 =?utf-8?B?NXovRk1LT2J1b0Z5VElzL2dLRVU5TFJSTEZzazlEaldLYlFPekdaQUNHUmU0?=
 =?utf-8?B?bkdhUHhURU5vMGY5dGRZb1BYZ2NITFlqOEJJb2tOU3gzMU8rbDlFWXZjQXdM?=
 =?utf-8?B?WXNHdFlabWNFc093aUVxWjdCamJ5V2VRTERWSnJoQjYrWkFsNkV6Uk9xcG5K?=
 =?utf-8?B?WFFIaTJKYmJ2UFkxN0lTN3o0Z29Eb2F6N21xbjNhMDhiZVVFanZNbUpGYUxT?=
 =?utf-8?B?aFh6S1BrUHFPczZNQmlvemRDUmdzaFNBZmdibmFlVHpXN2wxd2RoMThHTW4v?=
 =?utf-8?B?d0dXblh2Nk1tUXd2U2psa2ozUGlJVmxjNW5EaUlQVzkzb1NobEZvMGcwa0lQ?=
 =?utf-8?B?QzVLdHZmcWlDUThOYTl1QXJSRU5BWUtkcDlia0pPMm5tRytuSnFCaDlyc3E4?=
 =?utf-8?B?OTNoT1F2aWtMNUxpV3l4Wmp4bFdQQ0JDSXJZZHVoaWZhS291bTBiZG82M0l2?=
 =?utf-8?B?MVhDZEQzbVpzT2kzNW91QjcvSjV3ZU15Z0psb0RkYWd5Z0FxTjJLYmcvRmcr?=
 =?utf-8?B?UGhiMlhzZXFQU0l1UE4wTWIxTHQya1RBSTJRbG53RW9ZTmpXMjB0T2VTWDNn?=
 =?utf-8?B?enZTTFpaRCs4alFFT29yVUNuWHVOVmlMRU1WaHl6Vi8yN0NBREJrRUxMNUor?=
 =?utf-8?B?MnRvTWttblowU2lSUzVqNi9kSGZWNkliWVcwQ2xNUm03U1BEcVMraWtxcCtl?=
 =?utf-8?B?UFMvOUEvbUR2NHpjQVlGMUR0V3JyeDRYMWs5NXUvcGZvMm5rSXFLRm5ZSnAr?=
 =?utf-8?B?THBuUjVFUTM2SHlvMFJFejMxRU9Bek04UHArdU80UmpmVm4rSFNmcjJJdXhy?=
 =?utf-8?B?RURQa0xKT0hYUW9zNkxhQjhBUDlsQzFhYjBIWmhabWZRd1dqRUJhNFhZbE1C?=
 =?utf-8?B?cE55T0xJY2U5Tm96TnpMSkRlNXJ6eE8rZU15RGxoVjRuZmtBYnpTSFJuOHRP?=
 =?utf-8?B?QldaSE1sTDUrSHFPODdRVDJOanNSb3A3aDJWMFcxWFFBWUJUa1l5UjNSOHVt?=
 =?utf-8?B?aFhaUjNCRTBON1pnR3RFek9yZ1d3RXB3OE9jbU1OSUFVMjBBdXRLc210YTdk?=
 =?utf-8?B?bHZXc2ZSRDNCazBkYVB1Z291Y2hHK085MTBOdStSSWtwdVJ2cG54ak9hNVo4?=
 =?utf-8?B?Yy9zeHZpeXZRZjRhcmpHcnZMZDlpc0F2RGErdXcyb2hRdmpZc0ZVMG12WVF5?=
 =?utf-8?B?Y01JSDY0bkRiRzZkR3VkNGl4dUZLWEtOd1NGT0E5YXJRaGg3cStBRUlmYkhS?=
 =?utf-8?B?NkZDNTJybWtyTnl5OEttcVlkWnB1em5mMWZ2VTU1L29IaXVTVktMUUwrenFh?=
 =?utf-8?B?akpoQ3JTdFM3TDBBdC95RE5lKzQzL0d3TGRLd01GTUN0eG1Nb1VMbk13L1Rm?=
 =?utf-8?B?d1Z1eTUzTWNoWmJXek1qMUoraVcvdGN1UXhtTnREbTc2QTVXOUk1ZTlnanAr?=
 =?utf-8?B?RVJsbEtEZlRnUDlSVkpvbTZKRERNOFlJQzJGTHdkV3UrVFAxNzNmQmx4NEgy?=
 =?utf-8?B?Umc3a25ybnpCeHpjL2tGUlFmeXo4TzdKL2diQS80TE9aREFQT0JhV0w5N0M5?=
 =?utf-8?Q?uNfgd1Ew22Sf60qkM1KYe77Pf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc650e15-e888-4e41-f6e4-08da63170ee0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:26:31.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLekwKc4bt6iDJa1NTsNOsSGzvMT3KLabM8hh6O6Eg3QTY8UUoFyZ8RMBI5Fw6vi5oRT2uBuD0O4O45YxL0FbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8983

On 11.07.2022 10:00, Jane Malalane wrote:
> On 30/06/2022 07:03, Jan Beulich wrote:
>> On 30.06.2022 05:25, Tian, Kevin wrote:
>>>> From: Jane Malalane <jane.malalane@citrix.com>
>>>> Sent: Wednesday, June 29, 2022 9:56 PM
>>>>
>>>> Introduce a new per-domain creation x86 specific flag to
>>>> select whether hardware assisted virtualization should be used for
>>>> x{2}APIC.
>>>>
>>>> A per-domain option is added to xl in order to select the usage of
>>>> x{2}APIC hardware assisted virtualization, as well as a global
>>>> configuration option.
>>>>
>>>> Having all APIC interaction exit to Xen for emulation is slow and can
>>>> induce much overhead. Hardware can speed up x{2}APIC by decoding the
>>>> APIC access and providing a VM exit with a more specific exit reason
>>>> than a regular EPT fault or by altogether avoiding a VM exit.
>>>
>>> Above is obvious and could be removed.
>>>
>>> I think the key is just the next paragraph for why we
>>> want this per-domain control.
>>
>> Indeed, but the paragraph above sets the context. It might be possible
>> to shorten it, but ...
>>
>>> Apart from that:
>>>
>>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>>>
>>>>
>>>> On the other hand, being able to disable x{2}APIC hardware assisted
>>>> virtualization can be useful for testing and debugging purposes.
>>
>> ... I think it is desirable for this sentence to start with "Otoh" or
>> alike.
>>
>> JanHello Jan,
> 
> In the previous email, I was referring to this discussion about the 
> commit message. I haven't sent out a v11 because there was no change 
> other than this one suggested. What I said earlier was that I thought 
> the "Having all APIC interaction exit to Xen for emulation is slow..." 
> paragraph provided context for what I say after but I am happy to remove it.

I'd be fine for it to be kept as you had it, but you really should have
sent out both patches. There are rare cases where sending out individual
updates within a series is reasonable (e.g. to avoid spamming the list
with a large amount of unchanged patches), but I think here you want to
make things easy for committers and not have them hunt down the earlier
version.

Jan

