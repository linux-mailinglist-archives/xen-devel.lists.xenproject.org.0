Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824B77DBA27
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 13:51:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625079.973973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxRjK-0004hW-9u; Mon, 30 Oct 2023 12:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625079.973973; Mon, 30 Oct 2023 12:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxRjK-0004fr-73; Mon, 30 Oct 2023 12:50:54 +0000
Received: by outflank-mailman (input) for mailman id 625079;
 Mon, 30 Oct 2023 12:50:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxRjI-0004fl-El
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 12:50:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3e94edd-7722-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 13:50:50 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8339.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.18; Mon, 30 Oct
 2023 12:50:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 12:50:47 +0000
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
X-Inumbo-ID: f3e94edd-7722-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsK228iAh6aGckWT5+J5l8QJrN1yoqCeWbvz0F5z/E7l8d6bLH1TVsjNyA5UA7deMGRbAKu4vxTaNDg0ZiBAD7aap3r6E4GcJUANJoVsaimk8JMChdF8esc32G3/CdDpbri3oHnVY3B90Dw54hLyHLIXyB2sIX/Dzn4ulfHNsaKrq4gxxlQnWY9qUBaTaa92mZKVWrQTREvNo5UX5X07QdosFNS1m/vXyO8A/Ra+FVdzBFkG4865jGYFhmLfpN8mw+cJidbmxfX7NMln5uDV0OEWzgaRtgN6N0ZJ+A+Xg9oR58ZZvL3sjVwOrvv/p9hBzbkVbIRkgMYSuALQWl6pFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAHGO6KVerxMhewd1ogEz8HFz1lkwF2+2TWetT93Xvw=;
 b=Yx/TmSOtEmO6L4BBYnxYoAc4QHZolANfLgmuqaGKEcK8CwZkcSmlFgtjJBxn779ocZcv2fQdVLooF/CoGUf8c6JJUH8y2ihlydR0cWw9uKBFVMk8dsM943xCuC0kxU1Ao/YHyHG+dfAWG2b7lhGOYNYrkXaRLbnt98gudu8thWvC53FgRSH3lMYmZLEhjE0vuwttleuIj5tXHVQLyU118PEiqtLvcjS0X6h+PGLx+KI0hEH6/JC49RjLxxg34wpOpgGPhB2mi8xPy/Ydp6MX3w51eoIOS7n5ONUwsp+4+y1URZLvnySQNEIRPdT3AlJycg6THizX2ztNkq8SrH/OAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAHGO6KVerxMhewd1ogEz8HFz1lkwF2+2TWetT93Xvw=;
 b=EjWt3ZffkqTn1nnB+ATQoYb8bA9t/m7Uq9m08Ubyxm3ysrtvmDnKlsM1o7hwtyHiCdy3fBLh0fuMUpk+f6Z/sF1YMEisTO03zlbHRB7F0H+iUfzCnQos8AL4sS2JchSIa5gZBQy2CChDNo0kLYgH8fsSeBfHkkkXBbbFM1eTyMyTCmEtG2TIJUN1XNK6LwQnebz7WSsNIIwNZPOIPu/J30qa0AD+l8vHc/UfB+Ib3UcIoN/97Ui2J6mmzsih/YntIf/rxCsflOhZR7DRhB3eWasDz+CI/bnMsrk7Zrd7utLqtwJbr4fSOnaCEMscN7Re1J59lJ69kelDL7DvKtJmLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc66ff4d-8440-85d0-ac65-940c48d51ff9@suse.com>
Date: Mon, 30 Oct 2023 13:50:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/7] x86: detect PIT aliasing on ports other than 0x4[0-3]
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <042f76dd-d189-c40a-baec-68ded32aa797@suse.com> <ZTo-tpk64ew4rk1o@macbook>
 <6c3a4243-fef4-129c-8f58-7bc009f886b6@suse.com> <ZTpwTrLU4d90lWYm@macbook>
 <bbc0d98b-8908-3fdb-ebb9-6cff5caf940c@suse.com> <ZTqCLbFJkAyKCPuc@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTqCLbFJkAyKCPuc@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0340.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d3ce84-4f9b-455b-c15b-08dbd946d64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lr+brNkv+HBsQ5zgGDl04IT1tGWcXTGDZwK9aW3sbHcRa4DBVA0Fhg4MmHYc7kgdXB3s6kN2/oCO+qKUePq8dZmtdfzbBybkGKKn/4po0iLHjPCZRBmv1BYrTwYNq1ybCWDKOQx5lHKkRObfDD8/J4DFw/vlWU19Dyrb78Sqzm3XkFtIbRozRpYajROcANS0DNuQwJG42zu6KPijqpYd6rjMXb/eWFHltFI480KryUAEnUfAN5TK/0mCeacRGZSoZfcOhQOijZoobJCLFWHpoG5y4xlyAawMiY1JlXQjx7d0VkVy4m+vmKcNaAptnwYC3NQRELz9Tl4NgTqshbYgFpH/zne6KlLvH4qO3bVK08CbtoneeLjtLJ6hvfB+bAS2k2x8uu2t5ssmCmUUHY9xWGNE0WI6WCxXZKSF8TDG/d8CVc5DE8o/yFQcBkwagiTiKl+4oGL18av0fu9uUmR538scDsQ6UYNan7acqlpITPCvDScBaRwd95ItaI0/LgipeuunAV/j77AJclmd1RVL11ZfYBjl+x7BkFBP1LrxXcl4sduUNZnrePLSF0nkN8Cj59PNIHdsNwRgaIUWHSsRZkMgCbViMAh12lWiOVrGwrMrgfhjrszBdI8ntY37k7MCW0sqb5cBsxd4x1sqwSYB1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(5660300002)(41300700001)(2906002)(54906003)(66556008)(66946007)(66476007)(6486002)(8676002)(8936002)(4326008)(478600001)(316002)(6916009)(66899024)(38100700002)(83380400001)(86362001)(53546011)(31696002)(36756003)(31686004)(6506007)(6512007)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0ZJN1VFTXM4SG1LTGRTTngrN1J6UVZLOUdESlpiQkdQT3lrQ1ZETG14NitX?=
 =?utf-8?B?L21SdWpLazhYRFhIb0NCaElCZXVGVXdEN3lwdXdyMy96V0hMbndZWWc1Rmly?=
 =?utf-8?B?b1dpbXFCU2NoRjg3QjY5ZlQ5ZUVVVE1xRXZtNkh1OGovSHBqV0NaUzNOL1Ns?=
 =?utf-8?B?SFUrN2UxdVNLdE5XRnFJaG5acDlGMXZuOVo0ZWJIN1o2NnkzUytacUlIRVhH?=
 =?utf-8?B?Z21MRnNHRkowK1dicjV3WURldzF1eGxVMVBRMkFybWhLR0FWdDFHQk5OQTJW?=
 =?utf-8?B?aldxNXc1UWlqclhvcXFEWmwxNWQ0Q2docVdwZ01yWDlZM2NmSG1DZk0wVDVP?=
 =?utf-8?B?QXVtNzBBdzlhWW12VEV3VlVXZXptczJtS1R0a1J0UXVzczg2L3lyY0tYMjI0?=
 =?utf-8?B?dUVGMTh4VzJ3VVNocnpqTVU2RVVpNk15bGF3MlN0cWJsVHp2dGI2YWZUY1Q2?=
 =?utf-8?B?Tm83aHk4OTFlMVVOM0NxMzhZYTFacW8zMEtzVFFOcmhEOTh3aVRBNExzdis4?=
 =?utf-8?B?Z2R1bDE1ZHZVYlY5K2c0c1lzaU9IQ2sycTgwMzI1QUxiVHlndEgxQ3V1YXAr?=
 =?utf-8?B?bkw5SVFNMHdRUCtHQ1c3eUlNd3JhaDI4ODhYUXkvRGZnTlNxZm1wWlI3YitJ?=
 =?utf-8?B?VllZamdTdEIzNk50WUE1Wmk1c25QUnRMWnIwd3hDTDB1aExjMWhlUm9JcG4z?=
 =?utf-8?B?S1pndFk0WjIvczBnVWszRlRrRTJOZDhDTnQvaDk2ekN5bm9qcFhBVEtORXNS?=
 =?utf-8?B?b3NYZHVhdWZhVHVPZnFOcG9ibW53Y1FMQlduSUEya3p5NjZQNzgydGxRb1Zh?=
 =?utf-8?B?TVBucHVlMmpLWHZ4TDhZbU1nc2JEaUhwRXdra2ZORkNjbDR1Sjh6NlhoRm9H?=
 =?utf-8?B?aHNiUzNyZnRYL1hQcXhCR2lJdzdDVXpOdGRyOWRQUjhqTXJjaXY2N2lWS21V?=
 =?utf-8?B?dklxRW1VSkRFT08yeVpkZTFDWHdBd1loYmV3a2kzcTN5WGhxRzZIeUZ3ZVNG?=
 =?utf-8?B?USttMi9kZGUvNW16OVp2aEVqQkF2K3czWmNoNXhVWmVxV2F4NDJwUC8zaGY3?=
 =?utf-8?B?dUN0UDFXblVXQjBuZDdDRFZlNUdsa1ZYWmhRZDdDbTdLMDFvSnRhZk00VXU3?=
 =?utf-8?B?dGIvVTF3cVI2aHZmejRoOHd3TEt1bGVuby9TUWFCUERoYWFlK05pTUhrOXFi?=
 =?utf-8?B?SWRHdW9oYnovZTdCUHlBbHNqbVRXV1M0Rzg1b1l2dGlFUi80eGFKamIzZUl3?=
 =?utf-8?B?b3J4dG82QkFwMG9PQkZhd3Zkd3pEcmVEK2VGbE9ZcHB5Z2JqSm5EZEhIQllq?=
 =?utf-8?B?bWJFNjl5NnFpK2twRWtXUDNkcVRhWkRNNkdhTFplVmUvRnhUZmEwWUpDb0Fz?=
 =?utf-8?B?S1NIUVk3dTJYVEJ0Z1hQS2xBL0xuMUtRVE53M3BScXBISTJCYVNmOW4rYk9I?=
 =?utf-8?B?aFY3M1FURTFrUGYyZ3VuWWZaMzQ0ZkxnZHdIV3R6Um5lSjRBd0duOHl2Qzlh?=
 =?utf-8?B?bmRqdkxKckM3MmloUzI0cyt6dTlKVzdTN0JTL1RzUW0xMVBxSGhpRTJsRkh0?=
 =?utf-8?B?Mk9qdDJ3cFp1eWVwdnJIZmRNVGl3TllHZkpTcDlVRXFsMGUvN1lPc1VCTld3?=
 =?utf-8?B?WlRMbTVGK0l3dzhxb1Q2MDdNR29YSmNLMWsveDdDL2drZVcvMkNzTStoSWQr?=
 =?utf-8?B?ZWNnSXAvdFBRWmdWRW1la2hEOEpVZ3h3RDQxRGZDRHN1UmdYU2JscWlkbWx5?=
 =?utf-8?B?VGI5RmtlSUFDb2pyWUZpbFBlM2wvU0RadXpkYVRpR1A1cVR5Qi9zTVU2d3VD?=
 =?utf-8?B?QThydkkrQXo1c1R0UVVXdnVDOTNxNkpubUFUellybjhTbEJEdHVUMDVuQUty?=
 =?utf-8?B?YjhHYzBYUVpWeWlmTGlaekc2WnZ0Sm5XejFJa0pqSkRuUThRdVU1VExCck8v?=
 =?utf-8?B?NTBhekduTHRwLy9RN0xtTVRUUGIwTXJFa2QzTk12WCtpNWFmM1YrRDhlUjNT?=
 =?utf-8?B?KzNydzBFNnhDTWpRUHlIbGdhdktYcEhiNW9HblVEVmNOSG14M1FXVjI1RXB4?=
 =?utf-8?B?U2tTVlVqU3NoZDdOdFJIbDhqUmFoRGp1WjJOTFZYemo4OGtkckJZcDZLeGND?=
 =?utf-8?Q?vX7LKGnibQ1iKamdKXv3QloRS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d3ce84-4f9b-455b-c15b-08dbd946d64a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 12:50:47.0480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5WjGI1eVuJVqfVOr0QaYGCnTS4w7SlIe5LPabBbSx87trxPqFzm3XptfQlHh/D2SBy4XW4yhVerXxN58eMRNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

On 26.10.2023 17:13, Roger Pau Monné wrote:
> On Thu, Oct 26, 2023 at 05:10:41PM +0200, Jan Beulich wrote:
>> On 26.10.2023 15:57, Roger Pau Monné wrote:
>>> On Thu, Oct 26, 2023 at 02:31:27PM +0200, Jan Beulich wrote:
>>>> On 26.10.2023 12:25, Roger Pau Monné wrote:
>>>>> On Thu, May 11, 2023 at 02:07:12PM +0200, Jan Beulich wrote:
>>>>>> ... in order to also deny Dom0 access through the alias ports. Without
>>>>>> this it is only giving the impression of denying access to PIT. Unlike
>>>>>> for CMOS/RTC, do detection pretty early, to avoid disturbing normal
>>>>>> operation later on (even if typically we won't use much of the PIT).
>>>>>>
>>>>>> Like for CMOS/RTC a fundamental assumption of the probing is that reads
>>>>>> from the probed alias port won't have side effects (beyond such that PIT
>>>>>> reads have anyway) in case it does not alias the PIT's.
>>>>>>
>>>>>> At to the port 0x61 accesses: Unlike other accesses we do, this masks
>>>>>> off the top four bits (in addition to the bottom two ones), following
>>>>>> Intel chipset documentation saying that these (read-only) bits should
>>>>>> only be written with zero.
>>>>>
>>>>> As said in previous patches, I think this is likely too much risk for
>>>>> little benefit.  I understand the desire to uniformly deny access to
>>>>> any ports that allow interaction with devices in use by Xen (or not
>>>>> allowed to be used by dom0), but there's certainly a risk in
>>>>> configuring such devices in the way that we do by finding a register
>>>>> that can be read and written to.
>>>>>
>>>>> I think if anything this alias detection should have a command line
>>>>> option in order to disable it.
>>>>
>>>> Well, we could have command line options (for each of the RTC/CMOS,
>>>> PIC, and PIT probing allowing the alias masks to be specified (so we
>>>> don't need to probe). A value of 1 would uniformly mean "no probing,
>>>> no aliases" (as all three decode the low bit, so aliasing can happen
>>>> there). We could further make the default of these variables (yes/no,
>>>> no actual mask values of course) controllable by a Kconfig setting.
>>>
>>> If you want to make this more fine grained, or even allow the user to
>>> provide custom masks that's all fine, but there's already
>>> dom0_ioports_disable that allows disabling a list of IO port ranges.
>>>
>>> What I would require is a way to avoid all the probing, so that we
>>> could return to the previous behavior.
>>>
>>>>>> --- a/xen/arch/x86/time.c
>>>>>> +++ b/xen/arch/x86/time.c
>>>>>> @@ -425,6 +425,69 @@ static struct platform_timesource __init
>>>>>>      .resume = resume_pit,
>>>>>>  };
>>>>>>  
>>>>>> +unsigned int __initdata pit_alias_mask;
>>>>>> +
>>>>>> +static void __init probe_pit_alias(void)
>>>>>> +{
>>>>>> +    unsigned int mask = 0x1c;
>>>>>> +    uint8_t val = 0;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
>>>>>> +     * count is loaded independent of counting being / becoming enabled.  Thus
>>>>>> +     * we have a 16-bit value fully under our control, to write and then check
>>>>>> +     * whether we can also read it back unaltered.
>>>>>> +     */
>>>>>> +
>>>>>> +    /* Turn off speaker output and disable channel 2 counting. */
>>>>>> +    outb(inb(0x61) & 0x0c, 0x61);
>>>>>> +
>>>>>> +    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */
>>>>>> +
>>>>>> +    do {
>>>>>> +        uint8_t val2;
>>>>>> +        unsigned int offs;
>>>>>> +
>>>>>> +        outb(val, PIT_CH2);
>>>>>> +        outb(val ^ 0xff, PIT_CH2);
>>>>>> +
>>>>>> +        /* Wait for the Null Count bit to clear. */
>>>>>> +        do {
>>>>>> +            /* Latch status. */
>>>>>> +            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);
>>>>>> +
>>>>>> +            /* Try to make sure we're actually having a PIT here. */
>>>>>> +            val2 = inb(PIT_CH2);
>>>>>> +            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )
>>>>>> +                return;
>>>>>> +        } while ( val2 & (1 << 6) );
>>>>>
>>>>> We should have some kind of timeout here, just in case...
>>>>
>>>> Hmm, I indeed did consider the need for a timeout here. With what
>>>> we've done up to here we already assume a functioning PIT, verifying
>>>> simply as we go. The issue with truly using some form of timeout is
>>>> the determination of how long to wait at most.
>>>
>>> I would likely make it based on iterations, could you get some figures
>>> on how many iterations it takes for the bit to be clear?
>>>
>>> I would think something like 1000 should be enough, but really have no
>>> idea.
>>
>> Except that how long a given number of iterations takes is unknown. 1000
>> may be enough today or on the systems we test, but may not be tomorrow
>> or on other peoples' systems. Hence why I'm hesitant ...
> 
> Hm, but getting stuck in a loop here can't be good either.

I certainly understand that. The command line option I've just added in
a prereq patch would allow bypassing the probing, but of course I agree
that we want to avoid hanging here nevertheless (if we can).

>  Let's do
> it time wise if you prefer, 1s should be more than enough I would
> think.

Yet time-wise is also problematic ahead of us having calibrated clocks.
And using the PIT itself (which runs at a known frequency) doesn't look
to be a good idea when we mean to deal with the case of a broken PIT,
or none at all.

Jan

