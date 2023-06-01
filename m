Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE25719F9E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542527.846486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jA4-0004NW-7E; Thu, 01 Jun 2023 14:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542527.846486; Thu, 01 Jun 2023 14:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jA4-0004Kw-2r; Thu, 01 Jun 2023 14:20:20 +0000
Received: by outflank-mailman (input) for mailman id 542527;
 Thu, 01 Jun 2023 14:20:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4jA2-0004Kq-PD
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:20:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e7c4813-0087-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 16:20:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9651.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 14:20:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 14:20:15 +0000
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
X-Inumbo-ID: 6e7c4813-0087-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ih8APQJfG5uF2D2dIfYGERrzTfFdESHXY84HyLFCNa3J/gW3LoVYop7KfOphot41M9EN1S0jBeHlzQVXtGmKKysqOza3oJkucXXY67/GXAzdLUw3K4KNs6ixeX8e+8S+0uJD0+6AihGwvJKbnkNezqgohiuHsV2GlUkMLeg6a7aQ1MDK23jVGpvpWM4/uDe8FfvZrUnpemRKQU54gGiYy0KJgegeXMWNCkBON3qwIYA6T5r15MIqSpQbKdUjiohLcmLxARnTyfpXA66owgf4e3NinV8a438gFxlYHKTitJUwXmHI+j3MH4R/M5fbN9K+1BjzRfYy5eXl01OTEj006g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vl3lVP972xpfP1QGMljk3yfCfhHBHoJcVBg7B0MeAPM=;
 b=arqUvxtbrTCbBcc3Ymz0Fx4YVLIBzZh3e4rSzdlgvCCU6OfK7WPjhkcqOB/Gr9j60gPm2bSyITkTVqxLNkZRnJAqIxurbFDJLzx4VVZ7XbPN/5+eRzlI3ycsYKjc4sjIxp+eIxEoyTIlShjKharSGvrn6b/2p7zjoRLRZFW1ZpaI5aa6QaoutZTILc3cwWw6G6MQXLxjWnuxHROUs3/Mx5inTmMV6esYPe9ar0d2dtobebCAD6VQz89645uf2ocI3sDM5KgnBmbUDiwc358D43vyEbGfGBFf0nmpU4C8IQ0AWxbyxA22ZDi5MAXK32dMjGjA119ryh6TqsJPR9cU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl3lVP972xpfP1QGMljk3yfCfhHBHoJcVBg7B0MeAPM=;
 b=1erxI7+I5PdTsh1Znoen0OmfgiO5hcxvCSfqFPGUFk+tzCXqowSvPW/nmlo61QH5IZ1RYH4Chc3VcFdVbHdw7OqgmfPzxSRnPDOFGY27sddi6WIuq3x5gb6CGzXtnSxdntlyVrzzN/jrGwv8vV01aHi3Z4jYtUiYu2esMBxd4zaimzVPBgJBlVh3qXdBPdISEEHIyLRfDh0UCCvdqeFROcO3VkZWrxnnyZwu/U9pXeeAs3Gtep6at9FiyNkGB68Px2iwiHkty9EkF/IA1/AmL+UrdXztaq8xHcewYBN4LXmVcNXgZ+cjyQnnZRpYnu4k74yTNaHx33urkZ4ZiCLiQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfc403ac-875e-b1a7-16e9-b2b443e57278@suse.com>
Date: Thu, 1 Jun 2023 16:20:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] x86/vPIT: account for "counter stopped" time
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
 <355c5379-ea9e-582c-0131-816204eb3ace@suse.com>
 <ZHiFliv3GV1aQnY4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHiFliv3GV1aQnY4@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a35b40-7f46-4e09-5bf2-08db62ab51a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MLHMLsAdHT730gABz7n+8ZyF/70XoML4vOHS6LSHjC8UWvgJ1LSzE7BAKN0LRuRp3VN57/Rn72oRMommJY4p/Dg+8dZo9pJyPLsZK/zFISpG4zRSAyaZbZdZ/0w8yHK/9ozWwgoVQt6ebLd4zQN2e8VHU79Jjv8Dm8OycpuhwGNenb2VBqE4Qf7sh57tzvC9UfPoIIQRIap/uO2RFg4+r5aaTiuHSEXsKjgbTPQr4Ktq54Y3gnGsfGo2mzCijKeOE+fc0Fx56UAh0wATBz0but/v+152LtZ/0z+LjnGxPYKnYFYuq4R+w0cDuvGhRqfmXnPalB9PEMLEpdYgH7DlpbusyHa4Hrmmxjp8pbguT2ZyD0DxyTWEcXIa2i+VFYVkzT0nPT3ummhNq9wgRXSPphgoc1jWoiUBD1c7O/ZVc18lq9A1I6JKrDUZFUTNWnH2tgnKDgvmR8+YMngmswRNREtTyxzOCTlNn3HCIFDRidt4gGxThosqsy9BE9qZJ4+pYWjC4Ieim0dYWgBE/DcqRMPh8ZHXxBsI9+s5drc9cEQg1VLxwP7u5Zc9LkEpV7swQHPvxnry8LmX9ees8RLxeHf4CrJlipEAmoVuGwN/ZXXtBtKux3/9exzmVnabut+pmjR7IA/y4JBT9S85ziWlQoVOY/cbDuxU9Qjf3barJY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199021)(6486002)(41300700001)(2616005)(38100700002)(31696002)(86362001)(53546011)(83380400001)(6506007)(186003)(6512007)(2906002)(26005)(15650500001)(8936002)(5660300002)(36756003)(66946007)(66556008)(66476007)(4326008)(316002)(8676002)(54906003)(6916009)(478600001)(66899021)(31686004)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFEwN21xUWRiWjVVTzI0NTdRU1RtS3pRSXhycDBOTXdrR3YyTmIvTXRCL05y?=
 =?utf-8?B?b0NlMGFzYy9ya3VDa0tJTWJjSTg0M3krVklBaUYyOHdZT1N6QWRXVW9UR25r?=
 =?utf-8?B?V1F1cHd0SjNsTm1ESGQvV3VpZ3VTRmtMVFhrLzhPTFpld2huSzIyTUZqN3Nh?=
 =?utf-8?B?YldBZW80SURuUENsVmszbEFYRHpYQmtpeTZqSnY2YU9YQjd4VUcxMVJPZ0Y5?=
 =?utf-8?B?VXkvOVh1UGw5RGE5b0RVNWlwZHZtVmp3SU1GOHB5UU5vTkVEWEc2c1g1MzlN?=
 =?utf-8?B?c3BpUk15TDZkLzVVQmZyL3VtMXZwRE5rQUsrUFJxcENnamZuT21VdnpUQ1Qy?=
 =?utf-8?B?RGRRQnlLV3NmVDhZSnpmaDFoMmdwaE9xRG5IVE5RUnQyR0hnbHNGTERtUGNt?=
 =?utf-8?B?Z3JCL2FIeWhNR091SlJ2MDRnb2lWenZHckExcUtTR3QwcmNzaU9jVGZEOHBa?=
 =?utf-8?B?RG82dWVzamEzQzhDNXRBcXpZdXBydTdpMCtjV2xuNHRqYWdsYnJWeGlzaFYz?=
 =?utf-8?B?am1GdENFRk5VQ0wzUmVlZ05raFRBVERXbHlOK3BwYU5CaURETHQ0T2RFejZX?=
 =?utf-8?B?VDI5UVJqUnlSdWFlMDZtYXlHU2NpLzFIbmwyU2tIWjI3THY3QUZmeXUxOE5v?=
 =?utf-8?B?UnNNSmo0NWJaZEQ0UGVtWWY2L2NkTjgyRnhjWEFZMVN0NWJsQ1JlbkVNSXZ5?=
 =?utf-8?B?WldoR01jSzZBZU5Gb2ZtT3NGOU5Edjlsb0NvT0NWV1h5cXVRbFRoY0tBWlFn?=
 =?utf-8?B?WjBLKy9kT1JUUUgvWmNYZ0dlbjhDK1BDZW5nQ00wNmRBMGZhUmJTOUhPVzhm?=
 =?utf-8?B?V3dVcG05b2dITmdpS05PTExkeFZrVDhmRlloNWFDNFB2blN2V2pxRnhrenJT?=
 =?utf-8?B?NDBXZzlDOElLNmhXVHJLOVluRDJ1REpIRWtrWWJ4bW0vV2lXVHV2TmdjQ21v?=
 =?utf-8?B?cUpOd3FVTzVUSXIwYWt4c2h1T3h0aXNqaHBKdEU1RVFDTTl4MDhnblhYbVdO?=
 =?utf-8?B?RmZjSTBIam5hWmRyS2tKWUJjcDZpR3ZpVERIQkUzZm00Z24zMXFMZ0xMQk9r?=
 =?utf-8?B?QXdvc0hIakRHR1VzdzdMSWNnNThhSUxFUkFITUpsM2V1QmpaNFZkQVBSVTRG?=
 =?utf-8?B?V1VwcW4rZiszY0NHanVxOEN6ZDQwSzY0YzdWdmZMeCtHQ0JZQmNkY1h6RFNI?=
 =?utf-8?B?eTFGekRFTC8yYU9NcS9nWFYxSDlpdmkxaW04eGdvR1Zja2tjcTBFb2hOMEdN?=
 =?utf-8?B?R0U5K29NeFQ2TUNSakZGdHFqc3p4RFhGL0IxblZ6UHhuVDlBNG83dU82RWpi?=
 =?utf-8?B?eFJEeGZFdnQ3aW9oTkE0ZUFjbzREbjY3TWJEOEhncGVBWDRJUE9Nb3Z6bnRp?=
 =?utf-8?B?V2JIOUtHcytmNmZsNTRwNGg2TUtib1djN3l3RldvQjBqS2UrcEZGTjNiNTVr?=
 =?utf-8?B?QTZML01vcjVhU1RJandZbitMeko2a3dZTWN2WWQ3TXBhMlNtZWRUNnlrSEx3?=
 =?utf-8?B?WkpqcjNRYTA2WVJMVWJ6T1NONHU3ZGQzNzdmNmdkSzBZdE56dDZYeGtKMjZD?=
 =?utf-8?B?THkwbW9PNTIza0lsVU0zNktNQ0VBenNmZTE0VzlvQjVpczM5anZXMWsvWEtL?=
 =?utf-8?B?YnQ5UkIvNUc1cWE3ZFZnTC9BbmxDaGJNeXg0aFdHOE1WQ1IvTDdKcXh2Mkpj?=
 =?utf-8?B?ZHhhclBVN0E5ZzRqZkhwUzhTdXZxb0FSOVJGN3hNYUtEY2lGdnAzcG91ZFBG?=
 =?utf-8?B?anpXSGhZQ1VUM0F6b2xkZUUyek1wa3JWRzlZVWNvUzRLa0cwRURGOHhraHdB?=
 =?utf-8?B?TFJKRndjQlRXUTE5dStXcXZ5L0E4TUJOc2gyem94Z3VVcC9xS2YwYTR2ZnNy?=
 =?utf-8?B?QVBtenpSTlByOXo5bG81cXlTZWQwaHo3TDQ3SUhNaGZUUjh5NUlxemRvN0o1?=
 =?utf-8?B?ZStRV0hQbVdqaGYycTNRNnB0Z2VZbm1uUDhLeGRhc29GK1RZMVBvWU1ybTNk?=
 =?utf-8?B?djdkOElsWUJnTzF2TXh1dWhZSmltVzB6L1JBaXRaM1h1WU1TY1ZQemtFSFNq?=
 =?utf-8?B?VnV2bWtkeVU3Y3lSMU9acUk3VlM3cjJnbStJVXJCTkVEb1dhUS91UkZWYWZG?=
 =?utf-8?Q?CoOFKC5rVBZQvSgciCa95+p0Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a35b40-7f46-4e09-5bf2-08db62ab51a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 14:20:15.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6rkF1IDolNh0rvpdPGwAsVuSkbJd4i9SGb5Srp88jzufuaAf2D6E4YYzh3hW0/CWCJx4OzYtZNw/d0GCHm8/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9651

On 01.06.2023 13:48, Roger Pau Monné wrote:
> On Tue, May 30, 2023 at 05:30:40PM +0200, Jan Beulich wrote:
>> TBD: "gate" can only ever be low for chan2 (with "x86/vPIT: check/bound
>>      values loaded from state save record" [2] in place), so in
>>      principle we could get away without a new pair of arrays, but just
>>      two individual fields. At the expense of more special casing in
>>      code.
> 
> Hm, I guess we could rename to pit_set_gate_ch2 and remove the ch
> parameter.  That would be OK for me.

Well, simplifying the function is the less ugly part, so I'd be okay
doing that. But doing _just_ that feels wrong: Why would we make the
function less general when we still maintain all the data also for
the other channels, just that we don't update it. My concern was
really towards the further special casing of channel 2 that would be
required if I didn't introduce two new arrays, but just two new
fields.

>> TBD: Should we deal with other aspects of "gate low" in pit_get_out()
>>      here as well, right away? I was hoping to get away without ...
>>      (Note how the two functions also disagree in their placement of the
>>      "default" labels, even if that's largely benign when taking into
>>      account that modes 6 and 7 are transformed to 2 and 3 respectively
>>      by pit_load(). A difference would occur only before the guest first
>>      sets the mode, as pit_reset() sets it to 7.)
> 
> I'm in general afraid of doing changes here (apart from bugfixes)
> because we don't really have a good way to test them AFAIK,

Right, hence why I'm asking.

> maybe you
> do have some XTF or similar tests to exercise those paths?

I did consider making something, but I can't go the route of "try it
directly and then compare with emulation results". Yet without that
I'm not sure such a test (and the time spent putting it together) are
worth it, the more that without being able to compare I might also
end up testing some wrong behavior, simply because of not properly
understanding the somewhat scarce documentation that's available.
(I already had to resort to 30 years old hardcopy documentation to
at least stand a chance of getting things right.)

>> Other observations:
>> - Loading of new counts occurs too early in some of the modes (2/3: at
>>   end of current sequence or when gate goes high; 1/5: only when gate
>>   goes high).

Because of this ...

>> @@ -109,6 +112,7 @@ static void pit_load_count(PITState *pit
>>          pit->count_load_time[channel] = 0;
>>      else
>>          pit->count_load_time[channel] = get_guest_time(v);
>> +    pit->stopped_time[channel] = 0;
> 
> Don't you need to also set count_stop_time == count_load_time in case
> the counter is disabled? (s->gate == 0).

... I think you're right, and I should do so unconditionally. In
principle I think this would need to be mode dependent.

>> @@ -181,22 +188,39 @@ static void pit_set_gate(PITState *pit,
>>  
>>      ASSERT(spin_is_locked(&pit->lock));
>>  
>> -    switch ( s->mode )
>> -    {
>> -    default:
>> -    case 0:
>> -    case 4:
>> -        /* XXX: just disable/enable counting */
>> -        break;
>> -    case 1:
>> -    case 5:
>> -    case 2:
>> -    case 3:
>> -        /* Restart counting on rising edge. */
>> -        if ( s->gate < val )
>> -            pit->count_load_time[channel] = get_guest_time(v);
>> -        break;
>> -    }
>> +    if ( s->gate > val )
>> +        switch ( s->mode )
>> +        {
>> +        case 0:
>> +        case 2:
>> +        case 3:
>> +        case 4:
>> +            /* Disable counting. */
>> +            if ( !channel )
>> +                destroy_periodic_time(&pit->pt0);
>> +            pit->count_stop_time[channel] = get_guest_time(v);
>> +            break;
>> +        }
>> +
>> +    if ( s->gate < val )
> 
> Shouldn't this be an else if?

They could, but they don't need to be. I ended up thinking that with the
blank line between both if()s things read slightly better. If you're
pretty convinced that's unhelpful, I'd be willing to adjust.

Jan

