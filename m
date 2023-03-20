Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6DB6C0C38
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 09:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511756.790970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peAsU-0001rd-ME; Mon, 20 Mar 2023 08:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511756.790970; Mon, 20 Mar 2023 08:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peAsU-0001pv-JI; Mon, 20 Mar 2023 08:28:26 +0000
Received: by outflank-mailman (input) for mailman id 511756;
 Mon, 20 Mar 2023 08:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peAsT-0001pp-Dr
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 08:28:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d2992d8-c6f9-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 09:28:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8804.eurprd04.prod.outlook.com (2603:10a6:20b:42f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:28:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:28:16 +0000
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
X-Inumbo-ID: 2d2992d8-c6f9-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ell8f6XvNKCeC5cSWElrWkZePKbPRnql9fZbKwrnKRM6pctwT/UWvjWZPbV4eCAihUVir/KLFnQ4xyhGp8K6veP8b0pzJ1sjUXLBF8x/cSxss79c0+2639FRq63X9r5iOJ/2C8T4tAc1Pe2e+UarfLBV8RlQ/2ueC9JsCX0agWlVhSzKKjkcFJRfHTKuB5uRq0PdQlwppHgTnLFo3TZfbcL5meICuM2C5b9kx4aqd/w4A55YSkP1h7AVl+Ib/BNtcaNKICb8PTXgcPr1nuzkNkfrTFM1URwnWwP+ij8gM1DsB688aq2ftGbK1ub/uAZK8kCAms6zi+GORAJI3zymtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3krFKUF7EmSxiLRn955kU41PB/CuJ919vaCLLIEw+N4=;
 b=XRH9DiotpZ4MmkSfYWW0PU9LLgC7ddVCCAXH5kAOq8UtPZkQtXzncXNuxqv1I2ps4E1TPIygyDPhJnWCkiQo64iVgM/rib4LOalooZYK7XhsVYLzawKeerwa0/2UG9aat5P8jSi/PPnpaRLMLlcBC/6XHdy9Ea1Es28iS4rlR7e7GOU+1rEQuy6NEfobD1H5mAKBjc3KlO8j2Fc6zAm6tH1da02S4GoP0KeI/3vZTc+hexCAs+6sN2YU6TvaJ5NXLSLM90mOSrQ8rzF6z5ZXAWopfpzlDVXNA+aUS/bOxovtKClPcl5L6AQeIhW8x/956pQwfUcPOWe62G0TGORiUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3krFKUF7EmSxiLRn955kU41PB/CuJ919vaCLLIEw+N4=;
 b=QB4wIiEPD6FlMybc/GjnEjWbMvicObRBc2tvGPEKM1w+SjRDelHAl6BZMuYsnZVjULU+jXky/9QctvieVmhjRK+l1kPBr9XIbe6T1ztD+vWKH1I7qWlYA4Ko2rc7UGOlqthf0C5DRxPIq8YVqvvuNJsFZvLT4nOJLFmgagODUMiaJp3xMXnkNj1LJYjReYuhhyfI6sXalTx+spkNBTyJWGnZs/Aq6WPDhVshG94hKuBTmdhpkB4r6XspdeuLO4T2Z2E8NU0GcsCGe4gYIM+4+qj/LzY160O/VqurxBAxaxAqZo5E94j+J0B7b1xCrhwnWj1mKULNSyB8IHBLooyTWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>
Date: Mon, 20 Mar 2023 09:28:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] x2apic broken with current AMD hardware
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
 <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
In-Reply-To: <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f01673b-ec41-4b8c-d831-08db291d0d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e2KUEskno6WWhuMJMW/E/bOHEodk/uDXptSV/XKVTdGSR/9rF6kC8rD19bw1Z93e+x0pzerGSZjTHUnl62gF2H69yI2qjCJLl4dwHU6e04zBXK5TYQIFDFBaYn1auxjv+uLa3IjCoB0PlyJf3teKfsug1BuBRe2TTzqOto3qyNeiqt0gspZvxGLddkeEg70fubZqiY9LfEmoNkOETibR2LJ4FOs3SZzRh2JLrlGgPClhoHV87L6p990qTS7zwkpZSjEi2lYnzD4hAkPK/HUZHj+f7YhuEKv7zyme2kPaEt47ru96K4na1K+G3OYXA57jZp/o+fPhd3BJ8cNdODecHru58EB0yBKzHfVDkhkoCkQuJ4NWqddVL9xsPOZGZX/XFtgphI4hHb89oq6DmHbFyOgiXMyotdu48/QkA9kx+Q9aKEE6MK0xZCgKYSIoWshShbc12rKJl6ZbR/nLwHWeKdyYoIiqVOI/pbqVTXRWBheodlUascovbzgOm2lv9xTeafS5d+Wg76JhynxaeVnGypZGJAXB7Jn62i9B8eE4nKYKMCAxD0rQRKnGwYRbdz3E1daUBxoZrKbXr+8dFSnjMgC/tKIjbqUbFne8caWKB6ElXBLs267VI/VitNWjJ6Ch+u0jSGVDtY7TDw+hMyttkXYARps6iMmhE8Hr+oyeRV6XNyjFDQyYpvi9EEbYA9hGEFzM/s5DVHu6XA8CgeY8em/WAUrKSS2xP/lBtnw3dzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199018)(2616005)(6512007)(6506007)(26005)(6666004)(31686004)(6486002)(316002)(8676002)(53546011)(66946007)(4326008)(66476007)(66556008)(186003)(83380400001)(478600001)(5660300002)(84970400001)(41300700001)(8936002)(2906002)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck9ZMnE1Q0h5V2Y4UjFlbURTRGdaL1grT21xY2NGODJUekEwckVDVmNZKzU5?=
 =?utf-8?B?SFBGSTd5dWZqei9mVEVKaEZkdkF2RUZyTGF2MTJ0bjRjWTA5WlZhM0c3SFFv?=
 =?utf-8?B?cmJkUE9rMmVkWWhXT3pJYVNEWnRQbEMzdFBpU25HNkRWTVBsTHFKTGJqc2E1?=
 =?utf-8?B?ZEpxaDE0RTJaaWp3bGpha0p4RUZ6eUZvbnlGejhMMVhFOWZkVm44RGY0RndN?=
 =?utf-8?B?Q3lwcXYyS3pjWEtzTXlOTFZIQkJuWjlwYVRYcWhtYlNOdDdMbWZ0VnRUL004?=
 =?utf-8?B?WUQvQ2FpUjk5K29rL3Uyc3d6WTdnT0xsclV4Z2J0Ym1yOUg2S2lVREJmREJv?=
 =?utf-8?B?bXpMQjl0Zk9NWmxJMjd0M0tpaTJhZUxWNGtOeWV3UTR5eGNhN0w3ZmROa2Vp?=
 =?utf-8?B?Q3FSUkNIQkttQXpUZlJLSFlIYkgvb0RSVEtpbkdGTHdtSUxvUzlTeVVzUTVn?=
 =?utf-8?B?cHBKK3BRb1p3TlZYWkQyd1NpbWZrTzRId1E3dnJzVG9rcGV6Vk90aEw1RXRj?=
 =?utf-8?B?SXloWDZ6NGFTemF0VlY5VnpTWDVSdFV4amdwMk9ha2x2SEVtUHNPZHV0M2pG?=
 =?utf-8?B?Uis3SzhEUDN2UzRzQmlKN1RYYmNsa2hUVmpxbVJkQzVPWnozOHQ1dnZrS0kw?=
 =?utf-8?B?dGtKdTNjMUQ4TzhZaThrK04yNDBaekxCd2wwY2FObkl4YTY5VmRJTTdKSFR3?=
 =?utf-8?B?Ull5UDh3eW83NnI0ZHdHSmd1Y2dpK1gvejJXdWlPejdtWWdXeTNGT3lKTUFI?=
 =?utf-8?B?YzZiendtMGJiYktuYnp1eXRBYi9SNVlkTUtmR1p2U25WR1pTNEVQVGxHM01G?=
 =?utf-8?B?YTZoYkxNUVAzcnNmUVZqSUtVRFNnRUsvcDJ2aWpuUnBMbnZ5NHdLclJqNWZ2?=
 =?utf-8?B?TW9SZ3BWbmtsOUo5cTFMdVZJQkFkcUVpNzd3Mjd2NzIzWWpmWkJqcHlDNlhF?=
 =?utf-8?B?bkxnMEZ2SVdqZUl2VVFkczJVQi9MOU4zaVVUR1E2OS85WVlJeTJ1eWVrY3M2?=
 =?utf-8?B?R2M0bi9LdURCdm4zNHhGMTdxcG5VRE1saURmay9aS2dSTXRaZkVNRjIxNHBF?=
 =?utf-8?B?U3Qwb2xNSyt0MlZDbzYvQy9nUFlIWjVsdzIxZURyS3QwTTl3cEpnNk8wRVBE?=
 =?utf-8?B?Wlg0QTFSTTJodHQ2RkF1cjFWMjNud1d2WVVzQUVIR29UU1dsRWV6Mnl6cjZy?=
 =?utf-8?B?Y21uRnRpUHNLN0syTGhkOUxTV1dnSml0a0VMakdZZVgzSEJyek11TTlubzF5?=
 =?utf-8?B?ZjV5V0tOUnViOVJVZ1VUMEVpN0V5MjZPOHdiQjlZejBuZkp5RElCOVdZVFdP?=
 =?utf-8?B?dC9HY1VNNUpZQnB5VjNlUmN0cW8xYnlEOTVJRHNzRkRTSlZ3S3paQkc1dDU4?=
 =?utf-8?B?U1IrLzd6Q1NEYTRjVHFRWEQvSHFFOGY2cnRYS2d3UVZWRVR4WXFmaXB1TGUy?=
 =?utf-8?B?dkJJcmNwbmMyU0NiUnJFQzdBOU5Vb0VyMlRtVlJFbndaNjlMTzkyajdyTGR4?=
 =?utf-8?B?K2pFbDE3eUplb0lzK1czZ0J4ZkR0Q0E4bndPSUpYeXNxT1NqR1dudDZCMnBT?=
 =?utf-8?B?ZFRMRGZwS1VySWdONWNDMGx4TmZrd1VROFk5MEdaSzRsRVN4cWlvdGh4LzBs?=
 =?utf-8?B?bkF2L200Q2dlRGg1OFJhSjNKWUE3WFhNNXdKQXBRNlV2bHg1Mm1OTXlCc09U?=
 =?utf-8?B?T0I3aWRNamtxY2dpajhwc1JpWjNjQU42bDRFdnFIeUg5dnRzZHVndG1BbWVX?=
 =?utf-8?B?S3l4VUFjL0JnQ0J1ZWppWFI5ZEU5azFjNjNuYlBRVmY4ZFVBcHR1bFNGRUJC?=
 =?utf-8?B?R2l0eVY0MXllcHZGN052OWhxZ3A5bHRJbGM2dDZTcElrQnpsTkx4TkFIVGJk?=
 =?utf-8?B?d3dYczFDb25Ib1NzZjJnbmF0M2VJaURwUzV4N0w4d0VKaVRMTFRlT2tRZjRW?=
 =?utf-8?B?V1YzZHFQM3lmQjBhbWZTcXpyVzYvMGk3NWtSbkxSUHRpQ2UwMWxLaXNOOHo5?=
 =?utf-8?B?bnRoOXdmTG9pSXhHaXY4aXJpZHZKRnJXMWd1WWpjQkZ3UWV4QlIzQnE4RkxE?=
 =?utf-8?B?RHJaU2EvWW1uUHZ0NDZpTEhUTDlNTDRVQUlTWkN1ZU1qb2FCRU9XdTBJcHdu?=
 =?utf-8?Q?NL/7RRdOTUvT/bPIMBfr8M+WU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f01673b-ec41-4b8c-d831-08db291d0d91
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:28:16.3228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSUmnCMs2MFecZ+9S++P1vGAy1CDWFixuY2+g9p978WBMZ0KLTTUTmrDC1DmZbWrScRKHgv5K0l5gv6jWBPrTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8804

On 20.03.2023 09:14, Jan Beulich wrote:
> On 17.03.2023 18:26, Elliott Mitchell wrote:
>> On Fri, Mar 17, 2023 at 09:22:09AM +0100, Jan Beulich wrote:
>>> On 16.03.2023 23:03, Elliott Mitchell wrote:
>>>> On Mon, Mar 13, 2023 at 08:01:02AM +0100, Jan Beulich wrote:
>>>>> On 11.03.2023 01:09, Elliott Mitchell wrote:
>>>>>> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
>>>>>>>
>>>>>>> In any event you will want to collect a serial log at maximum verbosity.
>>>>>>> It would also be of interest to know whether turning off the IOMMU avoids
>>>>>>> the issue as well (on the assumption that your system has less than 255
>>>>>>> CPUs).
>>>>>>
>>>>>> I think I might have figured out the situation in a different fashion.
>>>>>>
>>>>>> I was taking a look at the BIOS manual for this motherboard and noticed
>>>>>> a mention of a "Local APIC Mode" setting.  Four values are listed
>>>>>> "Compatibility", "xAPIC", "x2APIC", and "Auto".
>>>>>>
>>>>>> That is the sort of setting I likely left at "Auto" and that may well
>>>>>> result in x2 functionality being disabled.  Perhaps the x2APIC
>>>>>> functionality on AMD is detecting whether the hardware is present, and
>>>>>> failing to test whether it has been enabled?  (could be useful to output
>>>>>> a message suggesting enabling the hardware feature)
>>>>>
>>>>> Can we please move to a little more technical terms here? What is "present"
>>>>> and "enabled" in your view? I don't suppose you mean the CPUID bit (which
>>>>> we check) and the x2APIC-mode-enable one (which we drive as needed). It's
>>>>> also left unclear what the four modes of BIOS operation evaluate to. Even
>>>>> if we knew that, overriding e.g. "Compatibility" (which likely means some
>>>>> form of "disabled" / "hidden") isn't normally an appropriate thing to do.
>>>>> In "Auto" mode Xen likely should work - the only way I could interpret the
>>>>> the other modes are "xAPIC" meaning no x2APIC ACPI tables entries (and
>>>>> presumably the CPUID bit also masked), "x2APIC" meaning x2APIC mode pre-
>>>>> enabled by firmware, and "Auto" leaving it to the OS to select. Yet that's
>>>>> speculation on my part ...
>>>>
>>>> I provided the information I had discovered.  There is a setting for this
>>>> motherboard (likely present on some similar motherboards) which /may/
>>>> effect the issue.  I doubt I've tried "compatibility", but none of the
>>>> values I've tried have gotten the system to boot without "x2apic=false"
>>>> on Xen's command-line.
>>>>
>>>> When setting to "x2APIC" just after "(XEN) AMD-Vi: IOMMU Extended Features:"
>>>> I see the line "(XEN) - x2APIC".  Later is the line
>>>> "(XEN) x2APIC mode is already enabled by BIOS."  I'll guess "Auto"
>>>> leaves the x2APIC turned off since neither line is present.
>>>
>>> When "(XEN) - x2APIC" is absent the IOMMU can't be switched into x2APIC
>>> mode. Are you sure that's the case when using "Auto"?
>>
>> grep -eAPIC\ driver -e-\ x2APIC:
>>
>> "Auto":
>> (XEN) Using APIC driver default
>> (XEN) Overriding APIC driver with bigsmp
>> (XEN) Switched to APIC driver x2apic_cluster
>>
>> "x2APIC":
>> (XEN) Using APIC driver x2apic_cluster
>> (XEN) - x2APIC
>>
>> Yes, I'm sure.
> 
> Okay, this then means we're running in a mode we don't mean to run
> in: When the IOMMU claims to not support x2APIC mode (which is odd in
> the first place when at the same time the CPU reports x2APIC mode as
> supported), amd_iommu_prepare() is intended to switch interrupt
> remapping mode to "restricted" (which in turn would force x2APIC mode
> to "physical", not "clustered"). I notice though that there are a
> number of error paths in the function which bypass this setting. Could
> you add a couple of printk()s to understand which path is taken (each
> time; the function can be called more than once)?

I think I've spotted at least one issue. Could you give the patch below
a try please? (Patch is fine for master and 4.17 but would need context
adjustment for 4.16.)

Jan

AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode

An earlier change with the same title (commit 1ba66a870eba) altered only
the path where x2apic_phys was already set to false (perhaps from the
command line). The same of course needs applying when the variable
wasn't modified yet from its initial value.

Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/xen/arch/x86/genapic/x2apic.c
+++ unstable/xen/arch/x86/genapic/x2apic.c
@@ -236,11 +236,11 @@ const struct genapic *__init apic_x2apic
     if ( x2apic_phys < 0 )
     {
         /*
-         * Force physical mode if there's no interrupt remapping support: The
-         * ID in clustered mode requires a 32 bit destination field due to
+         * Force physical mode if there's no (full) interrupt remapping support:
+         * The ID in clustered mode requires a 32 bit destination field due to
          * the usage of the high 16 bits to hold the cluster ID.
          */
-        x2apic_phys = !iommu_intremap ||
+        x2apic_phys = iommu_intremap != iommu_intremap_full ||
                       (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
                       (IS_ENABLED(CONFIG_X2APIC_PHYSICAL) &&
                        !(acpi_gbl_FADT.flags & ACPI_FADT_APIC_CLUSTER));



