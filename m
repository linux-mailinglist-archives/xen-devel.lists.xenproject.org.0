Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07F87D85A8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 17:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623873.972143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw20Y-0003CR-Q9; Thu, 26 Oct 2023 15:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623873.972143; Thu, 26 Oct 2023 15:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw20Y-0003AV-Mr; Thu, 26 Oct 2023 15:10:50 +0000
Received: by outflank-mailman (input) for mailman id 623873;
 Thu, 26 Oct 2023 15:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qw20X-0003AO-2c
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 15:10:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d720a668-7411-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 17:10:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8692.eurprd04.prod.outlook.com (2603:10a6:20b:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Thu, 26 Oct
 2023 15:10:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 15:10:43 +0000
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
X-Inumbo-ID: d720a668-7411-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7JyWVOffa3s+s5QndVK20AGBaUenP8FTZVpD59eMAa9zXYYgJylYlth+i0uXjHhT1xNHabyM94XWJ9tRUo0/duPilY4/9qZCiVZBFJsbWMbzCWR5hZo7UCgklBHMQkVAGA51MBr2/23ipJIgA8bNNMMiKUHh/zxpHPhhUEsbccqTflqhKsTYrJkMF3OYQBDScbWU/hbYEoE1ohXg2PIjkn2ZoDuDTNmEK1N2fH8goQ/XfVv+RGei6RTJdTFh6Kq1rgMM+WfkK8RuJXhP04QQr8xpoeWoMp8c1qSLJ0Dw4m0vEaDNGHd++aUa65TrhNpZIW2ewlw3xCnipo1Bc3jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhEwzYdhqx3l3YlETBtTsdpgE9dCqdAsOZZ2yeChrww=;
 b=Ls6w9qd24oLXzeFgLz+U3od/nBL0s5k/Z0FihKm7Gi6Q4l1uCCkTvmhx5CfCDxfmeJPwWtUZRsqtulEZ0UFSgqz9G9404kiAGjCOn4KzbYY5XjNcD1NrCY35jUlGrjsHf+bo70pjKY6vN82gm+v8U39kkvrr0Kmo+55D4ThbYbr5lpktVgyfD/qlEB/Dv7LSlBCt1bXJ6aMdmvIupybBqeehHAZCaKdb6MbhpBC3bGdu8lN8Jz60d0UxBO4ybADw/uxh1obsgFe5ftfx+ieJe+z4DnY1/QkagkuvKbLmVZXOEeGE0Uf4jIEqioPrLk8TUjoIbwiY7qs2tng4pNzrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhEwzYdhqx3l3YlETBtTsdpgE9dCqdAsOZZ2yeChrww=;
 b=Xy+cR/f8kvQtzPdnbxx9WXn9sRn8E0zm74VXL/J5NYULXiPBsf8JjMmwZ9hAkgmJxyq7adb6Kh1zz9POUyYSEEhI68n7JWtf6y3qezi8qnDZfnrt9L7QBfgjRDR4bqqOOUtpaM4BqB90csBSz+QUtqMNKzI9UQBxXYdLzOgxqMQ8yFPWMtHlnpAFvxbXL7Xax1V/Tn71Du0Eaw6ZbkaEr5b6PBeImBA93mec/wNDiljYrr1H0+AA0WOmV9mXDq5mQLsWmt9hti9P/ihyLzFTa3Wsj5xddEOJ5H/m6+1KYbudKve+uiGI0lqvLPtz5Io3Af6+M3D62muzI5BRtB6fsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bbc0d98b-8908-3fdb-ebb9-6cff5caf940c@suse.com>
Date: Thu, 26 Oct 2023 17:10:41 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTpwTrLU4d90lWYm@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: 4156ccf4-8ef1-4610-204d-08dbd635b979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XBvUFTYPZO7vakuNZWhCEn0EXByNbmPmn+G7mmvRUSrp+/gQDyFpRkfqU1s4Egklrcxpt8646/3OVk3nDzxIxEibkcUK9p9JmSPxRgk24auVbqFc0m67ICLBFTRU0JjZ4gX7uNw8tCXths4DG8yJdzL1X8YeWRcgQmc2dIVqJSACVsaafOHCTwdBKMpoBIp/vPZ/IxeNiTKdFed+hetcQfWlIWXaCsJ6aHTA+wlf9eLYPtalnuUWy0PzdIN9MrKZVqdFpvThSrI6n6ri4f9OnOPt28mueiLG6OSKHmanprVa0fmeAgR26V5tE4ZDcPM4lEy+ImYWkYGo9BfoxwrIP6cSDInwTjYihTPhmztm7SMFbo3aMAwT70gY0COHsO8gd9drB0Q76SWfwmPlu0Fst3yXePbEklJqHJQYxuoBa4HkFnSZeNCJkgl0S1sxP0UO4pIu+NAzFhUIQh79aC+8oOZ0CUCGPEARE8O6kbzQHweuqldUO7whqXyj0hdgTrakSubG69hJSRzEMEUXNnDNvLDE8WZJTPoP6X+2HA0tWUuuZA7NxeJe3IpcGkuJMcIdFIGxaDgUMNxt9oJd7FCdDdM/1vCdEX9SsFpKAg+Yf7HtOGw+VSXLt/Zt0XEf91LaGOC+LDKTI7aC5zn4lhLV4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(83380400001)(2906002)(4326008)(8936002)(8676002)(6486002)(53546011)(31696002)(31686004)(5660300002)(41300700001)(86362001)(6512007)(6506007)(6916009)(316002)(478600001)(26005)(2616005)(38100700002)(36756003)(66476007)(66946007)(54906003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWZTbEhaaG9sOFB5L0VydTFXaFRtRzZsUld4NXFodkRldzcxaTQzMVVLbUVW?=
 =?utf-8?B?RWhZZ09CTW9saHZjeUJ4QU1aalphOWpLSENqS0xzNGVmV2ZSOGdFdW1yd1ZR?=
 =?utf-8?B?RkJYSjNLR2dQZ1pVNmp4NjNEcVNnQ0tBOFpJRUdJNndGVUE2YzJTUW93NkYz?=
 =?utf-8?B?SHBJZGFhTEZtSjZvRGNEQmNVc0x0UmFYVUxzRXhsV3h4b050dFRRdUJoWVlG?=
 =?utf-8?B?cXp1R1d1dVpDUTRmRDVOb0t1YWppd3lSUVVFajN4V3JsYjZQY1F4OVNUTFBT?=
 =?utf-8?B?SXNJeEo5U29qSFZhZkluOHdCWGJGTGsxOUQ3Nm5wRERscyt6TUlIeSthN0Nq?=
 =?utf-8?B?eTNmbzhRS0NMZmFuWXhjbk9KM3Q5RWRpTkJSdm9lT2VPbElVUnZLYVZFbUh1?=
 =?utf-8?B?VXJ6RHZzZ05hTElYSnoyQWlUR20xTW5sRkhXV0w0V25nbitzWlgxcWc4V1U1?=
 =?utf-8?B?RllSMzBWZ0JCaXRXUkJlWWNicEtYeXJGcHZBN1llZC9VY0tJM2NBTjEvU25E?=
 =?utf-8?B?ZW1qRWNMQVhWMDMwYUhEL1JpQ1RYZ1o2U1pWazJUV1VySWNaL0N1RXFwaE04?=
 =?utf-8?B?TTFtWjAzelFqVXdZVHRKSHlQU2ZSeG1iQTVYVXhOZGduampVS0daYlBlZHpy?=
 =?utf-8?B?dytja2t0by91dnA3MHloenlTQmg5Mk1NL1dUSWxGK09mUzZCK09rd1VHRGFB?=
 =?utf-8?B?dDVZb0tGZjRQME9CN3NYMlJyamhUWS9GTHRmdEJEOHoyOGRqUHhId0xsbDZp?=
 =?utf-8?B?RXBJYkt1aGRxWDkxTmFodFJpTm9URGovNm1jU1ZtNjA5T2RkS0p0cENOVGx1?=
 =?utf-8?B?QXArSTJlWWhsSWpFMXBhN21sNUJMSnRLOUgzT0FOeVd4ckhEbS9KWUNvQnlw?=
 =?utf-8?B?c1lIQkRLUjg4ZWk0b0c0djFkTmtsckVjRzJ0U0tQMmtIQnFqMVZUaC90UHda?=
 =?utf-8?B?eE92Rks2ZlQxNlpXcFc3NC80bWRvd0F0emJnTk4rKzlXNDRjcDFGeklPSlg1?=
 =?utf-8?B?MGpWRGNMeE1wMDY1NG83bkx1cVh1OFM4VWFYVzRTQlZkZ3Q2TFVxd1pnUVZK?=
 =?utf-8?B?OWhNaXh4a1RVL0hLUTNBK3VuT1g3cmZYOHcrVzJ3eDVXY2dqMlBaL3c1OWgw?=
 =?utf-8?B?TmNZOFRUTU5iaHE2UlJiQWpZYkZtWS9ycU9DR0hUem5CN2R6cG91TGIwUVQ1?=
 =?utf-8?B?MWV2TUVBOTRzY2Rmdlo5VHBidWJpQUlobXI3NUQvMFJYNzlYNjY2UnRnSXpX?=
 =?utf-8?B?eXNKQjN6QzQyREMwMkFqVEdCYk1Jb003eExrZ3QyQ1FHY3RQY092Rlg1K01q?=
 =?utf-8?B?UlRTV2R6NSsvNHRQUFlwSnFnUG9ESWx4R3NZN2FHTndMMm9HakV0K1o0ZE1B?=
 =?utf-8?B?c1ZyUVZhOUdoUGRYSHBjSTE2Qm5OWHdLcitiUWluYkMzTmR0eHBQdWV3S1Fp?=
 =?utf-8?B?MkJtUS9aOFlITVVaQkpYYzVyOVUrcEpiVHNyNmZTRVpnU09Vbm1yNzRRMVNI?=
 =?utf-8?B?aENpY256NFZEcmdkUXNVUjVkR0hNaURldU9udzlsb3VhRjMvNVdYZzB6cys2?=
 =?utf-8?B?ZGl1TjB1OXgyUm83UDl3Yk1PemJsMjFuT3BTTGo2bFp0RzVWdmdKSEVzelIx?=
 =?utf-8?B?V214N3IwLzd6dW1uZXh1RnR3SG9xMkpUNGlIMVlBUDkzajVkc1F3VjJOMHcv?=
 =?utf-8?B?MTZVbzlpSVFBU3RFSnI4VytyUzJSUVpySHB0ZnppYndBcy9nK1lVTXhyMVhX?=
 =?utf-8?B?VFdySms4ODlta2lxaGxHTTFEUUJvK29pcmdIM2dReWRjZVdiaG4yQVFFZ0tL?=
 =?utf-8?B?K0J2WWRuZ1hpZkhjY21uQmxpYW9xTDhQZHhBVE5idGtESld5NDRWK3RnYzlK?=
 =?utf-8?B?UFBQRnlOS1dCSzRyVmpma0lHOGlqVURhK3BLU2taYzlQbGhUZTRWeUhkRlh5?=
 =?utf-8?B?M2xoSWhDcWZqNkFRN1lCM2g1V0RiWHpjNTB6ekgvN1RUQVZWaXcrQjVRN1lj?=
 =?utf-8?B?eFkvOU5tbFVubUo4TktFK1c5WnBiaWlSN3YrWlBjekh4cWd3KzZIRmZvcVUw?=
 =?utf-8?B?ODJpdmhKb1FxTTljWDZLNnhJUEJWMithQ0VMWTFCZW52M2pTS2Y0b1oya1Vk?=
 =?utf-8?Q?byTJRGeYG9vFy2+5yel27qMGo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4156ccf4-8ef1-4610-204d-08dbd635b979
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 15:10:43.7566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/FIaYnUXbaO736/Iat7BmgM065TUMVryRwVF+hUcy74VXRnhs8JwHcknwDsPcZX8cx6pjT6ZdzO63B2wsRFYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8692

On 26.10.2023 15:57, Roger Pau Monné wrote:
> On Thu, Oct 26, 2023 at 02:31:27PM +0200, Jan Beulich wrote:
>> On 26.10.2023 12:25, Roger Pau Monné wrote:
>>> On Thu, May 11, 2023 at 02:07:12PM +0200, Jan Beulich wrote:
>>>> ... in order to also deny Dom0 access through the alias ports. Without
>>>> this it is only giving the impression of denying access to PIT. Unlike
>>>> for CMOS/RTC, do detection pretty early, to avoid disturbing normal
>>>> operation later on (even if typically we won't use much of the PIT).
>>>>
>>>> Like for CMOS/RTC a fundamental assumption of the probing is that reads
>>>> from the probed alias port won't have side effects (beyond such that PIT
>>>> reads have anyway) in case it does not alias the PIT's.
>>>>
>>>> At to the port 0x61 accesses: Unlike other accesses we do, this masks
>>>> off the top four bits (in addition to the bottom two ones), following
>>>> Intel chipset documentation saying that these (read-only) bits should
>>>> only be written with zero.
>>>
>>> As said in previous patches, I think this is likely too much risk for
>>> little benefit.  I understand the desire to uniformly deny access to
>>> any ports that allow interaction with devices in use by Xen (or not
>>> allowed to be used by dom0), but there's certainly a risk in
>>> configuring such devices in the way that we do by finding a register
>>> that can be read and written to.
>>>
>>> I think if anything this alias detection should have a command line
>>> option in order to disable it.
>>
>> Well, we could have command line options (for each of the RTC/CMOS,
>> PIC, and PIT probing allowing the alias masks to be specified (so we
>> don't need to probe). A value of 1 would uniformly mean "no probing,
>> no aliases" (as all three decode the low bit, so aliasing can happen
>> there). We could further make the default of these variables (yes/no,
>> no actual mask values of course) controllable by a Kconfig setting.
> 
> If you want to make this more fine grained, or even allow the user to
> provide custom masks that's all fine, but there's already
> dom0_ioports_disable that allows disabling a list of IO port ranges.
> 
> What I would require is a way to avoid all the probing, so that we
> could return to the previous behavior.
> 
>>>> --- a/xen/arch/x86/time.c
>>>> +++ b/xen/arch/x86/time.c
>>>> @@ -425,6 +425,69 @@ static struct platform_timesource __init
>>>>      .resume = resume_pit,
>>>>  };
>>>>  
>>>> +unsigned int __initdata pit_alias_mask;
>>>> +
>>>> +static void __init probe_pit_alias(void)
>>>> +{
>>>> +    unsigned int mask = 0x1c;
>>>> +    uint8_t val = 0;
>>>> +
>>>> +    /*
>>>> +     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
>>>> +     * count is loaded independent of counting being / becoming enabled.  Thus
>>>> +     * we have a 16-bit value fully under our control, to write and then check
>>>> +     * whether we can also read it back unaltered.
>>>> +     */
>>>> +
>>>> +    /* Turn off speaker output and disable channel 2 counting. */
>>>> +    outb(inb(0x61) & 0x0c, 0x61);
>>>> +
>>>> +    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */
>>>> +
>>>> +    do {
>>>> +        uint8_t val2;
>>>> +        unsigned int offs;
>>>> +
>>>> +        outb(val, PIT_CH2);
>>>> +        outb(val ^ 0xff, PIT_CH2);
>>>> +
>>>> +        /* Wait for the Null Count bit to clear. */
>>>> +        do {
>>>> +            /* Latch status. */
>>>> +            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);
>>>> +
>>>> +            /* Try to make sure we're actually having a PIT here. */
>>>> +            val2 = inb(PIT_CH2);
>>>> +            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )
>>>> +                return;
>>>> +        } while ( val2 & (1 << 6) );
>>>
>>> We should have some kind of timeout here, just in case...
>>
>> Hmm, I indeed did consider the need for a timeout here. With what
>> we've done up to here we already assume a functioning PIT, verifying
>> simply as we go. The issue with truly using some form of timeout is
>> the determination of how long to wait at most.
> 
> I would likely make it based on iterations, could you get some figures
> on how many iterations it takes for the bit to be clear?
> 
> I would think something like 1000 should be enough, but really have no
> idea.

Except that how long a given number of iterations takes is unknown. 1000
may be enough today or on the systems we test, but may not be tomorrow
or on other peoples' systems. Hence why I'm hesitant ...

Jan

