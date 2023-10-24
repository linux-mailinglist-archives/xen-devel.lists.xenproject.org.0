Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136127D4E40
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 12:51:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621831.968681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvF0G-0002wR-Bl; Tue, 24 Oct 2023 10:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621831.968681; Tue, 24 Oct 2023 10:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvF0G-0002sk-91; Tue, 24 Oct 2023 10:51:16 +0000
Received: by outflank-mailman (input) for mailman id 621831;
 Tue, 24 Oct 2023 10:51:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvF0E-0002se-LG
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 10:51:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f0d2118-725b-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 12:51:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Tue, 24 Oct
 2023 10:51:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 10:51:10 +0000
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
X-Inumbo-ID: 3f0d2118-725b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtEov3nFtdRyBGaTeJdVm4JljhWwBSi90IxFPiV/+aWu6OobTc31cb73/i4nE6Nk1MRRizVH1Se0E7BJJsRiV5V3nySz33PblXUEOUH3u4btbPLasN2XL6HBDMbSkiXkzjRwTJwY8IVsCJnwLS9tzHubNo8VJr9hsc5VFy4eHWEWXpmf43z9KNjRlPKB85jOFG6MDvNQL49oEEkEuqsxyKKNiGZQfbOdduvNFUJ9sE5L2wA2oN5+PYZ364/SslHXi4XhchJEOeThl+lEFsl8qzmxG9VV3vvRyZTOWohyc/ziX7A6J4fStvZ6+Xm7K1sPZlNvYPoVG4cAWHdgqfVVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLor1xL0FOwsa7R/3yRFaJPcGfFx8Dd0voJKlrJtI+U=;
 b=RL4ujQnM1CUOx1w+1KFPFtML6j/8NX5dOrv369HZ2S/AEv/eDiqgsySL7gVNASyS60E5FWXYL+0f2eGQ3V/Nwf4A4oWkqzSSJCZn/FrOrQ3nfsG3ZQtEIT1Vd7QskZ+9IWOK8mDA98fBgVjwFHCaQJz+AuYJIFreiMzEobO2CPJhcEDfNMx7Vq1EbY60GY71oNFrAPlQh2BEpF7NzPL9y5OzBRuNA4uwXuIlCdgp5QDWZ9GogCqTd22RxeovJgxhL+lpajsAKFw7ojUSJmHkg8oZAhdHB0yj13DU3qQDsVfcG/3AuPgVD/ysPX1USp1FArqypVKsi/1Oo2c3npQQuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLor1xL0FOwsa7R/3yRFaJPcGfFx8Dd0voJKlrJtI+U=;
 b=1qZBtyMFAQpdxFm0EVJ7naBTGczHuGYH55ijf5Xc7FQOl5I1xpqBxHGax2K99twcEjZYwcjrkaAsNmgtq7eAQ+zZyhcolaKABd4S4qUkwCtTZIkwr7NwM6wEOVnmTXSBGy33f65l6YQJs5XBo2eOTSvcJr8wtLEOo3fhuUiv8o7/NjgyB3TdrASx0i381NEH5XUB619cg6fmcx5DCzT7uKNbBslVdZO/+16pU1MWn00A459dqB+Q0T1xxb3xRLMO4n0j7kI0iGecZrf8DlJGOA8OPNXJfAXty+CRyaPrDW5rq7/30UpvMd2tV5I8ccL+IWx6UdiCrBAkvXjvRcNvoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c5a5b6f-5c67-e46c-765c-81999ac1e11b@suse.com>
Date: Tue, 24 Oct 2023 12:51:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/i8259: do not assume interrupts always target CPU0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231023124635.44266-1-roger.pau@citrix.com>
 <a525cc49-69e7-c509-61d4-a2456b3fdbcc@suse.com> <ZTeY6JNbNfTVCpib@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTeY6JNbNfTVCpib@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: e49d22ed-4602-4997-c08f-08dbd47f2234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oOtq2wqeNLkxakMscb4voPehMfBki4+CphZpkP8nlnonqcZm/JDWBCGBniQuTwquznWnT4kCcdgm7Fakgseu7ShdTZF2NBq1+UPc2XOQFTg4acp033SOpiaJlWkhp28l01xtngm7dCHfENJhdxdHR0+48q33+UIbGBBfOrhcUvwYKS4s+Pvg4e2UoKNxBqG5NG5Jxu3OWmQuia7eSn5CIMrJfwS3Nb2vF8uAI5xRr7zUw6zfuSOBB4criOjTD3LD1JWh/bcsX5b+7duP+TeixxEiMzlxW3EEg+yStiqPduL2nk0iAkhQOWxdCxIRSvCI6yeD9i+j9U6HmFSveFqnP8x9DbjSnBeBT/UwRfGkcJBjMSwpKCW5ajEZCblsqPy3hIWkRogjamIIWVgb/mHSnUW2c0M8+4l+0CNg5/kGq0WfxPtxca4HXHVIjPkc3JEdAvvyJ3nmFV5TtAFeRs0aufIlvT6fxLFTuJaDoG+f7Oz3IKk0sC2E2GuORRxdJ72SfWDsarCGc2mjuVeuWBn2lJCSYuxQEoRhFoygg77CNxmp7SiLafYz4XJ+nHFpReEx5zrNK87gDOUmRSRZ25Qq0zozNLikglmRUksTEy9kQ0J46S2URl96kHH9Xwrnsrka90sTa2Wlze0t3Gs2QQBd/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8936002)(4326008)(8676002)(41300700001)(2906002)(5660300002)(66899024)(53546011)(6512007)(6506007)(36756003)(83380400001)(2616005)(38100700002)(86362001)(66946007)(26005)(31696002)(66556008)(31686004)(6486002)(66476007)(6916009)(478600001)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlBJeFoxdnBqdW1KSjJCY1c4Y1BXelk0S0lFenY3blJKaVk0S1RxZ2hBdVVq?=
 =?utf-8?B?UDVNV1FVOUU5RTMvWjFxS1NQbmVSYXVkbVhwaFI4cFVMa09HS2RQUk5tKzBI?=
 =?utf-8?B?UnJtYTZMTzFwcFpVTGlwSUNIU1dPRjZBYVorS1FxSWpGa3c3Nml0WVZka0xr?=
 =?utf-8?B?N3JCWFAzU2t5L0wzR0dGbUNEWllBZDc5NlgvV2tQMFhDclMzdW1RQnd4aFFX?=
 =?utf-8?B?TklCQmJHWHIzWkVRNDJ4R2F3Y1dIekd5VWFhajc1Mi9uaG1Wc2RPLzRyVDE0?=
 =?utf-8?B?cEI2SnFJeU5XTXVrRncrVlBwM0ROMDlxYjNVNXpXYU9HVENabG8yMkd3bDl5?=
 =?utf-8?B?WEtydWw3b1IwZUFFWWM1dytWUzRtQ1pHcXhKU3hVVklUYW5NN0QzMGk2Y0o3?=
 =?utf-8?B?RmoyMlZoOU5HZ2dIUmdweGNiYlgwTjVJVjFlNUF0a0ZtNW80cDJwemxGdUtK?=
 =?utf-8?B?NDlKT0EzVjF5R3p0dEFkdGZnNGgwck1wc2dEQnhSYTlubUV6REh3WUVpY2Zm?=
 =?utf-8?B?cWdITS8rNHZ6WjAweis3U21oaEVPaktnZWo0WWNIOWh5UitkdDN6Sm5ISzY1?=
 =?utf-8?B?TXQzMkxoNzBaZzR3M3BjU0N5aDJkOTVTU1lhS2NBRUwva1hSdWl1REx3eVBP?=
 =?utf-8?B?VS9pcU9pb2dHQWZmT3V5MmFsRHRORjBxOWV6bk0xSUdpSEV1cDJxR1BqbGdJ?=
 =?utf-8?B?S20rMnplenpPT3BlajMvMHBKaU1kbUFoaVM0VmRKRExuUzJuejR3MnR4MmdQ?=
 =?utf-8?B?WDc2ZGdxb205WHBDci9VTE00WkpLeVc4d0RKcGZwOW1iM08rVHliZFNXUml6?=
 =?utf-8?B?MWVYRWJValhUU2hVb0Z5UnByd2JNT2N6ZFRLNW1nV3EyTXNQVjBCYURkWnVO?=
 =?utf-8?B?TGkyckdLTDVJMVdQaGRacEM5eXcyRVhNMVl2RUlrUlJvdFRjeGVQYWZBRGpQ?=
 =?utf-8?B?L0tKVkFSTFVXRzhMUXRjSlhwOVNjOVFwajBqa09vVlJ1eFNTWTBtSTZhYW5R?=
 =?utf-8?B?blJyRnc1WktsMmdBMHU4ZkQ4Si9kc3ZZSytVT3o4ZktCRXBmaHRhU2IwTmhw?=
 =?utf-8?B?WDhGRW54MExRYzNlQUZWSzBjLzV3Q1VYTUZjRnA4SVBBOEFXY3hWN0xJaE9M?=
 =?utf-8?B?SFFySWZmbjNZbklRZ3R3ZUg2M1FiN0t5ZXB1aksxS1M4UCtkaCt2UjRwZzN6?=
 =?utf-8?B?d292d0NSdXFPVkUxTXAxYXkrbzNVM0wrSTJhMTN2Y1JpUmVnQ2RoY21CdjNB?=
 =?utf-8?B?MXJWckN2TjUrQTJRbndpcTBXejVoaFF5dk05enMyQXd6VHFSSVVBSzkxQUhP?=
 =?utf-8?B?ejJ5V2FDckxjbHliQi9JajAwUDNXYjRUV3MyT2xxdnNFOWtCVEkxYlBaTzZJ?=
 =?utf-8?B?cExERS9wOVJuQWdqSUgvQlhEdWFNdndOcHY2TEpvTUR1bWg0Z2ZFeW4rWUdp?=
 =?utf-8?B?OGxLSzNBdFYzVFdxenN5VjU3Z3FYMmFrUXdONGo0bkJpNmxaSzJlNlZGbWti?=
 =?utf-8?B?VGQyRjVsNURaR0xWaUpxOXpCQkpLOGczd21yNU5rSzNnZnkvZTlKNHZhSm5B?=
 =?utf-8?B?NTQrWmJBaFBlVkNLVmxqaStyQVpOVzA0ZWNkd01yR0xFZ2ZHREtmNk4xSFow?=
 =?utf-8?B?UnBaZGF6aHFZbGpXZGd6UWNHSEgzbHc1cXp5Z2xUeXk1WU9hWmlrczdSS1Ra?=
 =?utf-8?B?RnVib1RsOHFjd0pMbnRiTG1PTUorZCtLU2tuV0wybWJFUU9wOWUyRWJhVTB0?=
 =?utf-8?B?QXNCTmVZSzkvem5Bam55TUlOakZaVE5pejJOU2hFaFM3Nk1vU3V2SjMyMDZw?=
 =?utf-8?B?eVFyc3dOYzgwUk1oNGRXeXFQcCtXVEhHVCtXcUNOaW5IYmlFWDc5N09BUFUz?=
 =?utf-8?B?dVREQlIyTVpuT0pqbFBUbWJIM1FYZ0paaldqWWpZNnNGc0VIWjJ2TGtRenJN?=
 =?utf-8?B?dlJiY2tmZ09LVGZldDhGalVNWHFCNUI0d0htUVVxY0orc3V6Q1VjMUluYTRa?=
 =?utf-8?B?VDZyZHh1bEhLS2RHRzNUMVRNZDRuRnBTQ1F1VDV2Nld2SmZPV1dBVldpcmlv?=
 =?utf-8?B?VGJVTEgvaE5xZ01sd012WjRVeTdyUmt0ek4yREZNMDEwRGFCYVFPeUREdTJr?=
 =?utf-8?Q?Z31HrkAxtS496mBpzp2+TPMRO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e49d22ed-4602-4997-c08f-08dbd47f2234
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 10:51:10.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BlkwtGpeqyFMHSLJ1mApNImWoUbaOLwXc3wH52ZnLEfJhn1GFJGlPPnN0xDkECNjokvSfb6/+/JDFftCL/uZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8469

On 24.10.2023 12:14, Roger Pau Monné wrote:
> On Tue, Oct 24, 2023 at 11:33:21AM +0200, Jan Beulich wrote:
>> On 23.10.2023 14:46, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/i8259.c
>>> +++ b/xen/arch/x86/i8259.c
>>> @@ -37,6 +37,15 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq);
>>>  
>>>  bool bogus_8259A_irq(unsigned int irq)
>>>  {
>>> +    if ( smp_processor_id() &&
>>> +         !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>> +        /*
>>> +         * For AMD/Hygon do spurious PIC interrupt detection on all CPUs, as it
>>> +         * has been observed that during unknown circumstances spurious PIC
>>> +         * interrupts have been delivered to CPUs different than the BSP.
>>> +         */
>>> +        return false;
>>> +
>>>      return !_mask_and_ack_8259A_irq(irq);
>>>  }
>>
>> I don't think this function should be changed; imo the adjustment belongs
>> at the call site.
> 
> It makes the call site much more complex to follow, in fact I was
> considering pulling the PIC vector range checks into
> bogus_8259A_irq().  Would that convince you into placing the check here
> rather than in the caller context?

Passing a vector and moving the range check into the function is something
that may make sense. But I'm afraid the same does not apply to the
smp_processor_id() check, unless the function was also renamed to
bogus_8259A_vector(). Which in turn doesn't make much sense, to me at
least, as the logic would better be in terms of IRQs (which is what the
chip deals with primarily), not vectors (which the chip deals with solely
during the INTA cycle with the CPU).

Jan

