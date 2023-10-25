Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483387D6748
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 11:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622763.969878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvaRP-0008DG-Qd; Wed, 25 Oct 2023 09:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622763.969878; Wed, 25 Oct 2023 09:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvaRP-00089v-Mw; Wed, 25 Oct 2023 09:44:43 +0000
Received: by outflank-mailman (input) for mailman id 622763;
 Wed, 25 Oct 2023 09:44:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvaRN-00089p-PA
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 09:44:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d69a5cd-731b-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 11:44:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8436.eurprd04.prod.outlook.com (2603:10a6:20b:347::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.18; Wed, 25 Oct
 2023 09:44:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 09:44:36 +0000
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
X-Inumbo-ID: 1d69a5cd-731b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwOjBg3za6LEDPVkt5s4S1Ixnn9+obfK7hggsiO/jt681xMOAQPWwz332yd6Z7pNqAViiScHPxgJFiqXn5cP+IugkLxdOll9m5YauTpz+J6tttqbQf8Rg6pLqFLBPk0avooQEWNtLetonqvILzkDTc6hjVpuBJO95Xjc/fewoF6zUd2laCf7J+8gktkva75LXvLl2gBEeG5+LPeNfTSDFWuAC9PDl6MzJbmIwRKolAJvfmPwtOpCxeKKRDk7RUpRPB81Qle93GvEjHYDMwkzZ4iKRtJ8LcwWjAFc3tOWQmSi2nqFkelE/ZG1dUjm9rl9M5+82ZV7hFZPsTQ//IX7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1KptLY6s8G1aC7NRTKk/+NRb+SR2CZLBeSf8DIC+hc=;
 b=ihv6m3UyxsaTaMWbvWLmVy5eKnOqStXrWRkV+CKnENlYcnqrtr6UeQDpNlWSEmo37vuFRz7LuXgZo+wGG8cR3NEj91xd8BmGdS8dscSkLmP0k9Wse1F7aN8nBDLjjjOSC8eB2IzexoCZyNUo8UXeQQFOT+TXvQmm2aVFLxOuZ9U4wC6/KhtCUItEXL4xWMX4Wa0EBK0dVq4VsgPD2rLlpxvCAPL738+MJfbzlayQtK2t+O5UFEluVZnb8Bi+4BwunHT7BdF45nmqhnrnNaC+l49WrwgRrHarej4gUNlMuaYruFwy6wouxj+70fm2okO6ZW5Mb6f7CCKGT+32QE2ePg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1KptLY6s8G1aC7NRTKk/+NRb+SR2CZLBeSf8DIC+hc=;
 b=Tu+taRYfKOwLenQ/2ZNl7+f/vA3hJQZPt2mW3cSU4bQuzdF/TR8OwYCTOdldoDNc4VnNAb8QosfZl+335oxFpMr0b/58t513B3rQTz48HS+qyu5X5pMAGIQOJxO617EUiZS9NUYVPlJur9bDShoq6ktDufRmG2pQUjNmxTWVaoyXtpp0PfUMLByCtzMs+T1OpqHG2VQVb35UEJTc6jRiiogXXdSS7XPXSqwycbAnhWBdbYmTNLZvH3ITblbUmOfUWbKyR2nZ+DJLq3PBroaMi1LH5ZOJJ05UMW7awEWdiBHIbJAACGJHTibnHEDCrDkWS2HmQreyvouLqP91Pxn+YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25b10354-9361-d1b0-c6f1-f0bac67541b4@suse.com>
Date: Wed, 25 Oct 2023 11:44:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/vPIT: check/bound values loaded from state save
 record
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <f83213df-2433-ec51-814c-436ce5ea4967@suse.com>
 <ZTjbygYgCYTNtc-W@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTjbygYgCYTNtc-W@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7822f2-4dad-4ca4-3c50-08dbd53f0054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1mdO6bRLrEDicolbjRwB9EWSpcNTl9w7C6ulqyLw+6CL2d/sx2LU1/FYd7KPkeCP1DcH2dI+WhMQ3sz5u1oXprEkUbrxpNQNaCnTyuyxn9OHdsbix8MFxez+JRYdSH44Scd1tGyJrkiMOc8kTcfMLeq96OlHBzqqQx8ihOFGRyxUIECKpzEOWDVg1zWUrAsQ3UJi1OC+na+0ma8uO0VV+WaNyi1AoLOlWrG9fAuHeWFCFy97x6VAto5F0ici6JIB3gcUPN9tt8AOe59itzN/OO5PpK/6MkoJJlI9RnF1gAoRTzt9JaFXtvz8BqR5PIoMnaWll32k6xZB393RLkzDjmqsUyPi2nCWp13zshyLb16NyK3yi5+9JKp3diSNA90u8LCgnHy5B8FaSI9Nz4vFtyHCu1+qoy9WJIpW/jjSAsz+Ytp+kCWCIGxJMYW/35JtqRXCSpX93UNNEsMDkE3J95JMZ5qntJaRSkcHmXIQTFegZlAU2uPCwubW3lweeqU+SIDl8Mweta5H79kFgwUOXgURSFQylhdc2HgJPpzDahtB8TTvhfMnSN0fgSKCLdLh7JZnDhr1lHaOECAdaRGPHYwsiYVE+Q5+zfYKq2ZXXsfDZROxCH3FR6pu0h4dGXvU9jJDGUm2pbSReRNd37DUmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(83380400001)(2906002)(8676002)(4326008)(8936002)(6486002)(53546011)(31696002)(31686004)(41300700001)(5660300002)(86362001)(6512007)(6506007)(6916009)(316002)(66899024)(26005)(478600001)(2616005)(36756003)(38100700002)(66476007)(54906003)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE4rR2YxMjIrZTRCWXdOZUo1Y24xWnRRc05yN09LRXBjTUlIcU9JdkIrTmti?=
 =?utf-8?B?cE83ODA3c2NjNVBTdmlMK2dFb1hPVklvZUFwSk5BYnluNHgvZGg3WnhMY1Nv?=
 =?utf-8?B?MFJtMlFYSWJPeWtVUFB0MWlnUXVpZ2hNd3ovZFBkZXZCWXozelpRaEx5c2FC?=
 =?utf-8?B?L0tLcWx6OUE4eTVXRERkTkpWa0NLdlRVeEtIODJyL0kzM3NlNi9tTzVaUytJ?=
 =?utf-8?B?OWYxS2d1VGlMZlhvSHQzMTVIQlk5WGY0OUVFUG9MSXUzekg2Ykx2TVlKVXds?=
 =?utf-8?B?ZVIvM2VtNXdSYjc2L1ZCUkZGNUc1a0tUOEtVNFdsL2FqTjZoTGNFOSt5aGxU?=
 =?utf-8?B?TUNjdThyeWNhc1p5UFVaSTc1aUNVVUxyMmovNTl5U0dzOHE1MkxKUnVibmU5?=
 =?utf-8?B?UDIyUHM4S1VsQUpTNGcwc2NPY0JPK0Z6VEU1TkxmUGpYZWljYW9XTnlseGZR?=
 =?utf-8?B?NXY2d3gxem1UQlczM3lNTlhiN0xsanREZHVyRTNDcjU4d2JkWG1nc2w5SERz?=
 =?utf-8?B?QXBxM3M5UEFMeW5lUjBxeWxnc0ZjK2N0ZzBNK2RLVy9abXo2SGsyVXJyOEZS?=
 =?utf-8?B?NXE3SjdxaXBCWVF5NUZxb0hwWVM1bWRKN1ozeGRrai9YTXpBTi9HZkRNSmlT?=
 =?utf-8?B?eFNRQ3k4dDdWSHd4NlN1S3VIL2N4RHdvSzVhUFJnd0JNSlRBbjlwOVR3cC9n?=
 =?utf-8?B?M2pSV0RIUThabW9JVEsvWnhOeHozT0t5Z3NBYm85U2x4U25KckVVQ1A3WjRN?=
 =?utf-8?B?TDBHVEoyQjMvekVrT3hRWjMyUzlUZklQaUdQNDZ0Qmc4Q3RLU0xPd1RTTGFV?=
 =?utf-8?B?SVAxQXlGOHZRdkkwbnhTRGxBelNRelltb2NKSmJOOWZQSTJ2YStIZGZoaXBx?=
 =?utf-8?B?cDBTRmNlaWkrakRaemZwaUtVZ29JcjJYN3ZZYWIwS3JBSWFHaWluUVJqN0pP?=
 =?utf-8?B?TlhveHZ1M3U0UDkwN09ySThhTGZnZ3g5MmcyOVJoNStTbzBLSVJpUE5KemFo?=
 =?utf-8?B?L09YOVorclJKR056Q2tWZGVLVnQwUVdRNHErYWxOZWdTcEJBK3JkdDRRN1U4?=
 =?utf-8?B?UzM3WmtXUndWRUNvb3hOSEY3TUgwVkdrTHZ4aHFUTjArRjF6TlE1R0JBendp?=
 =?utf-8?B?SWZVa0JuekQxc3h1cHZmd0hVLzZUM1F3aHVNaGNqWlREazFNTC91aENVVkxz?=
 =?utf-8?B?aXJDUG5IQWxiQW52U2x6QUkyM3ljQ3VzeVNTZVdGY3hCeDg2cWErdGFzM2sy?=
 =?utf-8?B?VUh3R3ZTMUZCMlRIL0owQVl6UHZYeTBXbC84dy85ZmIyc1Bvc3B0SzdmQ0Fq?=
 =?utf-8?B?REpTejhpTlpTQ1N2NUF3K2liN1pkMFVtNEswSDAzRHNnRFlzeTFsWGxDZ2t0?=
 =?utf-8?B?elhNNnQ2NDBIZzJZTGNheGVvZTlTNEY1b1F6eUErQUwwUEk2eUpDNk9GaW1q?=
 =?utf-8?B?SHBSZi96anNmc2lvajJBUVZONTUvVVRrMkhVRjMraVpPSGFEL2tJK2ROL2Ew?=
 =?utf-8?B?QmxEdmtJZVZIU2h5K3UyQzkxN3VYM0Zyek9jRWpacG82RER1dkF4SUlFN2lW?=
 =?utf-8?B?OXVod3liSjdMcFlod2M5TVBRTGk2bHZFSHZWRmdQU0pvU2s1NXhhSjVvdXZP?=
 =?utf-8?B?L3pDZ1k1eS9BeFBaTDRzUkR0emdYV0pJS0I1Y25udEUyZkZRL1lEZmZjaW5a?=
 =?utf-8?B?TVNpWTlMdXg4MXhaV2l1bFdZMitaR0swTm9oRXBVRkpRYjdKVzE0VlNVVitx?=
 =?utf-8?B?cG05cGFQakFLa2psRG9jM2E1QUxJei9iZzFIT2FFODNNRnBGckJmOU5QL3lq?=
 =?utf-8?B?YTRmckUzL3AxaWhQQmVpdDdXYnBVakZkR3k5OW5wOWRCcVR2cDk2TlJPaWJG?=
 =?utf-8?B?bDhEMERwZlBqODZHTU9uUVBLN0FXY2psdnNDTE9hOXpOZnIzamcrbUtDeG5X?=
 =?utf-8?B?YnhSSkZyaEw4S3FPRTI1SHNUSis3NjFTT0o2WjU5LytXUk82ZWduYnBQdjkw?=
 =?utf-8?B?RUVaM045VzNjZnVqM0V1VnhKUzJRa2xjOStLVFpucVdtTUVVbHZycTdvb2xZ?=
 =?utf-8?B?VXhwd0tRNjM4Y1JhVTVlR1ZkcFE3S2ZCN0JrSUhwM1NLenM2MzBpMDcybUZX?=
 =?utf-8?Q?sUbVj95EEEhQSaniSbLhdzI14?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7822f2-4dad-4ca4-3c50-08dbd53f0054
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 09:44:36.9284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sE9vUy0eFmJwzSd4derFEXxrNo7BVlJVXwJePw0TWmhskjYFhtKV5+GK30mia/DCrFfIH+QZpvrnVEH1H0Nesg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8436

On 25.10.2023 11:11, Roger Pau Monné wrote:
> On Thu, May 11, 2023 at 01:50:05PM +0200, Jan Beulich wrote:
>> In particular pit_latch_status() and speaker_ioport_read() perform
>> calculations which assume in-bounds values. Several of the state save
>> record fields can hold wider ranges, though.
>>
>> Note that ->gate should only be possible to be zero for channel 2;
>> enforce that as well.
>>
>> Adjust pit_reset()'s writing of ->mode as well, to not unduly affect
>> the value pit_latch_status() may calculate. The chosen mode of 7 is
>> still one which cannot be established by writing the control word.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course an alternative would be to simply reject state save records
>> with out of bounds values.
> 
> I've been taking a look at how we load other records, and
> lapic_load_hidden() for example will return error when invalid values
> are found.
> 
> IMO that seems safer, I think there's a risk in the adjustments
> done below to also lead to not safe combinations of fields.
> 
> So we either reject the state and return an error, or we silently
> reject and leave the PIT in the reset state.
> 
> Unless there's a reason we need to handle such bogus state.

Well, I've tried to be conservative (similarly in the vPIC equivalent
change) as to affecting guests with potentially bogus incoming
migration streams. Such guests may have been migrated multiple times,
from pretty old Xen, and I don't consider it reasonable to check each
and every Xen version as to possibly permitting out-of-range values
to be reached and then saved when migrating the guest away. Imo if we
were to reject bad input, we'd need to have a way to override that.
Requiring people to "fix" the data in the migration stream seems to
me like demanding too much in such a situation.

What we could also consider is have the tool stack do the adjustment
(perhaps optionally, e.g. driven by a command line option), while
unconditionally refusing out of range input in the hypervisor. But
of course that's more involved, overall (and could still end in
perceived regressions, even if those are then easier to overcome).

>> @@ -426,6 +427,33 @@ static int cf_check pit_load(struct doma
>>      }
>>      
>>      /*
>> +     * Convert loaded values to be within valid range, for them to represent
>> +     * actually reachable state.  Uses of some of the values elsewhere assume
>> +     * this is the case.
>> +     */
>> +    for ( i = 0; i < ARRAY_SIZE(pit->hw.channels); ++i )
>> +    {
>> +        struct hvm_hw_pit_channel *ch = &pit->hw.channels[i];
>> +
>> +        /* pit_load_count() will convert 0 suitably back to 0x10000. */
>> +        ch->count &= 0xffff;
> 
> Might be helpful to have this in a define, as it's also used by
> pit_get_count().

Hmm, the two uses of 0xffff aren't exactly for the same purpose.
Here we're bounding the input range, whereas there we simply need to
deal with overflow that unavoidably can happen when the counter has
wrapped at least once. Really the comment is here to avoid putting
in place the more precise but also more involved

        if ( ch->count > 0x10000 )
            ch->count &= 0xffff;

If we used this, divergence from pit_get_count() would be yet larger.

Jan

