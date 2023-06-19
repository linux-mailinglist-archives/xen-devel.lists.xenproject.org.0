Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4E734C67
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 09:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550820.859993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB9KD-0007wH-1H; Mon, 19 Jun 2023 07:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550820.859993; Mon, 19 Jun 2023 07:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB9KC-0007tM-U4; Mon, 19 Jun 2023 07:29:20 +0000
Received: by outflank-mailman (input) for mailman id 550820;
 Mon, 19 Jun 2023 07:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qB9KB-0007tD-Hj
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 07:29:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdbf758a-0e72-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 09:29:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 07:29:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 07:29:10 +0000
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
X-Inumbo-ID: fdbf758a-0e72-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpgv2q1CFBp0b78fts96O2l5rJGWsm4v7yfXFNk2SI2Lw/bvWg8vJmqYBkDi2FUqxjwZMNSEJ7uHHwnZdJthOU8QlmqU8wLIQ/x1nd1vwAOXQbbDrgm8/HcVyN7/lEEmYr/se5+h7r/xDc5WM1d5cv2nDA+goNansjWtdiqr1uI2WElet8YkFuJZvx4eOlg4rZze30+86sSQfLKPW60S04+t29UMoCtYlzD0RJN4y0oS8agucI3uBCLtEqz0NAXPLAu/LM/AS9n/rJvrpCMReGPxTfTQTJQxQ6c2V7gvdKLEVWa/xtmR7ocebgPqE6X9dHYCoF7l1LyTzKBbMrdEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zko5WeBRYfYVW9OID78TqH9s3S21Xd+vTd8l1GGQfBE=;
 b=KDoj3s1nsbXPi/uEYeR3omCn2Sav2qNrAEYrc4SNEUwTB9n4VbNWXXKQYTlAEtrnlrCundw1svg83TLU7H7XYaOFplcVLdQyOUP11QCpWRWB11WooCbBp3UKLRL6Rc8Ynw+VbrXIs/HPxmTi5FB/bVAcAJzvRoyozzVwUIqTKetOXZTXksJp9SrwhmPasc+jZk9eztreDx/cQtx31UF4SkGtY/UpwvlHbNjh+u887t6SihR+JH6QgH4OF/uBfqVJ7qNHr/wyQtN2wAQzs1l9L4c78Fu1//W1yL59eRk3Yj026Ehh/HQ1pFh4PGJKL+xRSND4Y9HX6Ojh3oVmUotL5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zko5WeBRYfYVW9OID78TqH9s3S21Xd+vTd8l1GGQfBE=;
 b=EYi9hxf2bAxIRIQZmuWIyZBaL8I14s7T56h6hOqmwUCH1a+Zm08oyUnZOGCnxGNEq0oGT98ek+egtF80spN4Ul48DSQ28LWoOlsygbM2x4eKkXVOIPQjyXDdbAPAufim7CIMus8Z2swEo7CG3pl7WyzO+StMaV47XnH3A8dDQE78iD8kXEojqj5iQUfGzhPFGTv2jqJaCMc/vIFGqhblFdWPhpuAKVWqY5pChqvOJLkg5R21kdXMhOHTBYiSm2JWFuo2bJWvs+eiyHuu+ITsKWm15ICVvnTEm6T9hiiWRAWeS1WmU790QvD/TbzKlNQr0BXSehj/bbZ7XBwdJJ/Yfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99a95159-57de-ba8b-ea05-71e85dc01bd5@suse.com>
Date: Mon, 19 Jun 2023 09:29:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] x86/vPIT: account for "counter stopped" time
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <eaac83a2-8254-76b4-9bab-411e1e323851@suse.com>
 <7b69e322-bc37-a1bd-444d-b2cbe1d76b39@suse.com>
 <ZIxvSUurSPCHV9+1@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZIxvSUurSPCHV9+1@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: a6441abf-420d-4b66-ab8e-08db7096dfc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7x1Uc46DAczve5ioSt1ECocT5D078p5jEANTWvrcxfz36qm1zdUbMAVry7Z912hMyszjsBMjGebW/89bF0i7voEPDn7Dth1z4htKHB2UJdeeD9NqZNIdzA2y4UmxDV6L/Qx8lS9hZu1gM8FxPkna3NtnsWde5VCy3ToNtR4UycShcP2/zM7GE9jVO7CJXYWWwtN5Z/FNGcr0A9+5eb4goMeyyhMmuDfRssU5WPDKYR2L0EcN8MjML+LUeKBz/VX7d8pAoc4yBaNvH5E1I2GEzVdJkF5GRDDhIv5gXevf/xEwFeCAC3KFexl/7ymdZ8790qfQ5Sq2/PAoRzkTab9q7iit8D+rmEDUOTo40s6a7WIy/OOt8O4rPxzbgH2LViauYW9493yIrQFun2N5WWEcQCc6DaPr8ncJ1NsvAk+ohcS1eKL56PauyKXGrxIBKjJyo53j3XljcmB74uOne7YZAtMsxBUDh2xZZ08NfUV8rS3ouQXZdqqbfvvwCYcA0LIWYNMHYUuW6HbZWU59dgXLCoSdBnozZ5ZNjC55aeMNmuEk3KLywD66/oJDi70IXPRlq4IZV91EFqw/qSYqtdwXrJPqANWuK8o39bgx9OmUA8nJYVBC+2K6fKP4HI0x6de1aH1f2GmIpZP0QI1/dtTUwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199021)(4326008)(54906003)(478600001)(6506007)(53546011)(26005)(6512007)(6486002)(186003)(966005)(36756003)(2906002)(8676002)(8936002)(41300700001)(66946007)(6916009)(66556008)(66476007)(316002)(5660300002)(31696002)(83380400001)(38100700002)(86362001)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnJzdFNpbS9IL1JvQzhPdFlVMmhTRmJpc1ROQ1l5ckNVYi85R2FIUWd1VDhJ?=
 =?utf-8?B?MmIwTlNWZnFPckNKQVpFSXZTTno3SHZSVlIyNnBNVDZCdlZJMEtFeUhOUGN2?=
 =?utf-8?B?N0c0aVBvWW13TENHMXNrSGdLT3M5OGYwYWdpL0dPRkU2WGZ4M1JvWWEvWEFB?=
 =?utf-8?B?ODJidmZtVC83Z0ZkRWNvZEorL3JVR1B1YXhteStrQjN5bE9TNnYwNy85SmJ0?=
 =?utf-8?B?SFp4cE42bW9nRm9ISlhrM0FVait3OXBkaUJTYk0yYi9SL0E5a1JlM0JlVTFR?=
 =?utf-8?B?ZWk2eDMxMmEwUXhXQjJScTdUMGd1RVh3M3pHK1NvUjVBa3RUUytRdnVxU1VM?=
 =?utf-8?B?cE5lL09JVXJVR1BjSitzRUJnTmFaWVBIcHpxWnVMaGF6KzNORWlOaEJqQm56?=
 =?utf-8?B?MkFpaFpnYkk4RThpbG4zUitJMkFESnR0MkxIVndGMytVZEl2UDI4ckY1SUlI?=
 =?utf-8?B?bWUwUHB4UWJneFdwZzRtVmNFOVNVNFYyd05CZ1lTUTIzRTc5ZExvcThTU2hB?=
 =?utf-8?B?YW96WG4yV3NuTDMrMDVKVWFFOHA0VXJvTmlpVlZKRmkwN05TOXhHbEw3K0pn?=
 =?utf-8?B?clNMR3NjRlU1K0xmeWZJOUJIbkY5VVUzK1pxcUJzYzdGU1BsNjEraWoxbmNx?=
 =?utf-8?B?end0cmoyV3lRRlhLaTBNMDFSSWtoai9RWlBqRUZhMXlpZlZYdGhycndCM3pZ?=
 =?utf-8?B?elVnMWJIbW9lK0d0MHNwSTlyU3IvMEJmY2NlcWdTcHFoZWlJV1U5bGoveVdt?=
 =?utf-8?B?azRWOXozMUE3YnRIeFU2b0pHeUoxVXdzLzc4WlFEc29DRXBhekFsNTF4U2ZM?=
 =?utf-8?B?RW9VUU04NTh4M0JwcXJNYUk0WVBzb2pXMldwdk5UOTRsTFRUdm1BcXlndGgw?=
 =?utf-8?B?MDU3Z2RiV3Q5Z0pzVzhxS2dhVkdwdTB4WG5ucmVhR20rVVZuT3c4Zk1waWVt?=
 =?utf-8?B?ZW5PUTZYOWU1WUJCWmQwb3kxNVhMWUpEeStVSmIwRjg3WHhTbnZHbkM1MWRG?=
 =?utf-8?B?cEt0dmVvc1NkWFVCUnUwbDNyS3BLcnlINE1oT1VQb2V6RUlNdUpGZGNPZnpJ?=
 =?utf-8?B?LzFGa0pKa1VtWFVuZm8ySGkzQVdFVXIzWlR0bkFKQTkvOUIyRlZuU01KRUkw?=
 =?utf-8?B?VzhGaHBzSW9nYW1ldzZQdzRMeHNyVmptL3VaRGU2emNySGVjdlpKRG9BYnVQ?=
 =?utf-8?B?a0F1Qm9haUVjd1J3WW1JamltcncyTm5BTlpDNVhhMDV0SC8rUFBwUW9OaWFW?=
 =?utf-8?B?UXFYcnJmdVpNWU45STBPZUg4L0w4L0hoSEwwMlUraG1Td0NNc3phUnBGUlpo?=
 =?utf-8?B?LzRhdE5XNzBOTlRKbjJqaU5CRkNGOWF2ZmJMUWRUVGdOUW9kb0w1WktRSmxq?=
 =?utf-8?B?SmM0Z1VXSVUrT3QrRFZ2czNmMTU5WWN1cTVIV0hidmVvNHppUnJrV1dFdERK?=
 =?utf-8?B?ZWFNekZsWTBqWWxUdllXV2ZMZHFyOHJ0QWNQQjJnbWxoQVh0REhHeFRvelBa?=
 =?utf-8?B?YXZnMWpML21tbDBiUTFKN3RwSytaVmVuem5PT2FRc1V2dnFYUm56OWNSWmpZ?=
 =?utf-8?B?ZFM5TUg2YzBuL3g3Qit1L2lKQ1NiQlZwQkoyZ09YUHRrMnh4aXlyK3pUTUht?=
 =?utf-8?B?ODRqMHNXQVlzV2R2cDNaMm0wSjRNRitYZ0pabFVNc1hyNmpLMjlkOUNaVC9H?=
 =?utf-8?B?TFpHWDJNQ1Y4Q3hsNW1zODB5KzlBd3R2T1cxUmJUNEVweGtHRCsrUFBMQTRk?=
 =?utf-8?B?bHd1cDhjT29QVTgzSjB0YXNCeHo0SzBTNC9XaTNoRVJmM2U4SnlVV25iQ3U2?=
 =?utf-8?B?Q2RRQlNzTVNuMUNQK0d0enVsVlp2VHlVZGlqM1JNWTJxUmlvRXloMHJ5TzJH?=
 =?utf-8?B?T3hKTzkvb3cxL0YzT0czdytCWC80SjN6MTZqa05jRnpoV2R0MWdnUWgrYjFp?=
 =?utf-8?B?aE44Q0s2d3BUbFhsQ0RHQVdmeFhOd2MzV2tDcW94c095VjdiazVhTXdjMHdt?=
 =?utf-8?B?ZmcwZi9kQU9qNnF0V2thZnAzVHlmWC9MZThCUUZBZDFJd1N4RytOaHZvdUhm?=
 =?utf-8?B?cG81MjB1Tk1jY3ptVVorNzhjWXBkVGpOZ0RXVzVaN2FBQkRJZnBuWVZ1eU1Z?=
 =?utf-8?Q?ZLsqwyoBI9o1eYW+O1FIwXuMh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6441abf-420d-4b66-ab8e-08db7096dfc9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 07:29:10.6025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLoiDxOY/38tvOh6V6/X/lCXhz83A+IlymUPGj2CIhFOLPe/aZSBPRkBJ4Bt2GU3suCsPTkdp1AmMQWNKilCuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493

On 16.06.2023 16:18, Roger Pau Monné wrote:
> On Thu, Jun 15, 2023 at 04:56:22PM +0200, Jan Beulich wrote:
>> For an approach like that used in "x86: detect PIT aliasing on ports
>> other than 0x4[0-3]" [1] to work, channel 2 may not (appear to) continue
>> counting when "gate" is low. Record the time when "gate" goes low, and
>> adjust pit_get_{count,out}() accordingly. Additionally for most of the
>> modes a rising edge of "gate" doesn't mean just "resume counting", but
>> "initiate counting", i.e. specifically the reloading of the counter with
>> its init value.
>>
>> No special handling for state save/load: See the comment near the end of
>> pit_load().
>>
>> [1] https://lists.xen.org/archives/html/xen-devel/2023-05/msg00898.html
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Albeit I have one request below I would like you to considerate.
> 
>> ---
>> TBD: "gate" can only ever be low for chan2 (with "x86/vPIT: check/bound
>>      values loaded from state save record" [2] in place), so in
>>      principle we could get away without a new pair of arrays, but just
>>      two individual fields. At the expense of more special casing in
>>      code.
> 
> One bit I'm missing is how is the gate for timers 0 and 1 is accessed.
> Is such line simply not accessible?

On old 8086 systems I believe there were actual signals, ...

> My i8254 spec doesn't mention this, and the (kind of random) copy of
> the ICH7 Spec I'm looking at also doesn't mention enable bits for
> timers 0 and 1 being available.  I assume those are always enabled?

... but from all I could collect the gates are always enabled in even
just half-way modern systems.

>> --- a/xen/arch/x86/emul-i8254.c
>> +++ b/xen/arch/x86/emul-i8254.c
>> @@ -65,7 +65,10 @@ static int pit_get_count(PITState *pit,
>>  
>>      ASSERT(spin_is_locked(&pit->lock));
>>  
>> -    d = muldiv64(get_guest_time(v) - pit->count_load_time[channel],
>> +    d = pit->hw.channels[channel].gate || (c->mode & 3) == 1
>> +        ? get_guest_time(v)
>> +        : pit->count_stop_time[channel];
>> +    d = muldiv64(d - pit->count_load_time[channel] - pit->stopped_time[channel],
>>                   PIT_FREQ, SYSTEM_TIME_HZ);
>>  
>>      switch ( c->mode )
>>[...]
>> @@ -148,7 +155,10 @@ static int pit_get_out(PITState *pit, in
>>  
>>      ASSERT(spin_is_locked(&pit->lock));
>>  
>> -    d = muldiv64(get_guest_time(v) - pit->count_load_time[channel], 
>> +    d = pit->hw.channels[channel].gate || (s->mode & 3) == 1
>> +        ? get_guest_time(v)
>> +        : pit->count_stop_time[channel];
>> +    d = muldiv64(d - pit->count_load_time[channel] - pit->stopped_time[channel],
>>                   PIT_FREQ, SYSTEM_TIME_HZ);
> 
> The above logic is repeated here and in pit_get_count(), maybe could
> be abstracted into a common helper to keep both in sync? (get_counter())

I was pondering whether to do so, but decided not to because the earlier
code could already have benefited the same, just to a lesser extent. But
since you ask for it - sure, can do. Unless told otherwise I'll assume
your ack hold with that transformation. (While it'll end up inconsistent
with other code, I'm pretty determined to make the necessary "channel"
parameter of the helper "unsigned int". That's an aspect I was trying to
"escape" by not introducing a helper ...)

Jan

