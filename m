Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404E27D82AE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 14:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623778.971943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzWQ-0000zD-U4; Thu, 26 Oct 2023 12:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623778.971943; Thu, 26 Oct 2023 12:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzWQ-0000xD-Pd; Thu, 26 Oct 2023 12:31:34 +0000
Received: by outflank-mailman (input) for mailman id 623778;
 Thu, 26 Oct 2023 12:31:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvzWP-0000x7-F4
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 12:31:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97a83567-73fb-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 14:31:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8780.eurprd04.prod.outlook.com (2603:10a6:20b:40b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.8; Thu, 26 Oct
 2023 12:31:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 12:31:29 +0000
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
X-Inumbo-ID: 97a83567-73fb-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QV7nPTkiVAvXhLeOpF2qfjtYVfhpBmL8zfXMTN0ppQIDKAaPik/EtpX2NO32mbRniVi+pOQJoxjpiGpCxbP9PBB/OwGquAsP0C8aTukt9sF1rDOsFcEF6R18yZdLyvVowp1oeV16Io1jJjy74hyzlM3boJLrtQlXOmHZZ24s52v9lOchafg8UDC4AHe7l+IJQLj103aVrNGOFIqv6kZ9mki0Bh3DQmSSvZvRid2RKVfmCJtjTkBWvK2p7F/QtMNhoguWKML1BwSI9LTljgvFpBQvLsefdgA99IDjXIGiZtrWtIkPTHRHx/8pcN6VYLRL5LPGDRAH6XvOV9rO5kP1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zabVPSejkjfAOU8Yh1vVHyOiP06HRnn24iZ0GcIw8XI=;
 b=XQAJ+G6VyMWCiVQ+kwPmKq/gc0g88qhDJKF2XzkZ+KUz45TUMAK5n1y6/gB3nemCfHOqAu41x894Uf+yvZkjYiWMRQfvImmKm/AV+ZnO7qcDIzlPK6segg7FCbn35/OsP23Y8XQXGZT72WvOMGZC5nbu0ApTxDMLYmNQjnCrxV4eIULukhx9TS+rjGe7U/tLAcxOeb7tqpmjj8RRFWMROmMHZbdJfij2PGVnkxRzYn4tHiiufDlq21gfYj7NY420SJstBmeMkleJrbddJEkYdJA4aiWeqI8+UtFAV+xHysGjYrU1wjtvSOPoncUve0LQqHq5/o5r1FhWv3SQLxKSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zabVPSejkjfAOU8Yh1vVHyOiP06HRnn24iZ0GcIw8XI=;
 b=cH/hbxLKvfy68v3yV0REyRUlPDy3rlDkDcrRc8dWN06ag3bxY6ANMuZDQ6lDjX2b9n+mlsDR7LD55LpWb1Z23S+ZsKSp8/JwmEDADyy2HxMoc6bh0mpl8IhukV8fHRApIjILP96N/ClyzDIB1/FvwBYx0epqDbhpFuiENQVf9KQ6scP8Rzg+VeRXWBYqFmdStbwRWfX1wrJ5/zzPt3Xf0Cld63ccVYyMwFXX0PrFv+eiHlN/1E4JQJj9vo8zLh9HTX/vexffzMCeXIqHWwfXvBK56MoNr9YT9s+KVxvHEF6gkWXUxsIoLzy98Axj6wyAddBZZQrwOSnP8f+XKJkzjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c3a4243-fef4-129c-8f58-7bc009f886b6@suse.com>
Date: Thu, 26 Oct 2023 14:31:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/7] x86: detect PIT aliasing on ports other than 0x4[0-3]
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <042f76dd-d189-c40a-baec-68ded32aa797@suse.com> <ZTo-tpk64ew4rk1o@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTo-tpk64ew4rk1o@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: e95c906a-a767-4f19-1ac0-08dbd61f7aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iT0fU4nrWxsaaahsS6Nw5OQbO/wHoiwCM+eAQ1DsZ77uwCN4sH+D6HmyWZMpgRmCUd9jU4v3gjss9IpijIZmKhqKeHF7mDy/FPJW+04MkGpysyemuPnLRRuXFzSQisimjgUsOV+KRjK58NlqUK0Zz6wZD+0uHpUUfZxLleZbElirwKOWaeKvUSYwaSJ4f1gYHt/wMh5C/62fZjYPPug4izEfrPBrUYTtIgGII+7sls2xHhMTSREoeRxSy3pR5Vogt50veToJOWMVLt8mxJ7gxd7vkK0TpDS5lIfN0i09t51XGa4J075cuLcSwkIlvkRlIT+upZoEa4sj3Ohw9zhlXDu4UXnfvg963ROsWd6CQyq8sq7ZJCtd1vvz8iixsDx2heS+OoMghzCZfwUGmxmaePPE4mqgH230c+prpc2BUFT/b1/ekI6M+5CJLvNz26+8MeyT0jOawbj0tpABwzMD7R5axlpe2Au5NSQ9JTkbilXsDobYFafQspRo8Py01GrEjZZnmKh+FimKOlD1FS7D9zuPIo7931XGCg2p/Kq0CXgxSsegD4BSBZ9Uv/RFVSN7e5HWmZikSfZm44OLZ+I3MPXgV2G18U4LiteU1upzvmzdRfEBDPT0iQdOneTXYK+8vYU6qDga3jPwp3GiaquvpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(38100700002)(2616005)(6506007)(53546011)(6512007)(36756003)(26005)(83380400001)(2906002)(41300700001)(31696002)(5660300002)(54906003)(66556008)(66476007)(6916009)(86362001)(31686004)(316002)(66946007)(478600001)(6486002)(4326008)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2NnZzgzdGVvSDk2VVlqbjllemgvMHFCY0p0KzhqdWx1TE9tWGdQMXdhd3Vw?=
 =?utf-8?B?aGtITkFlRDhhUUk5czJaMmhrb2UvRHFuam8rY2IvR21sMHloZ1ovSzFtanZh?=
 =?utf-8?B?NnBNTDlkN1pWekpvUkFpaGFRazFPQ0E5YkNLZUl6Mkk5bXVBUXNNd3Z5UWF3?=
 =?utf-8?B?bXZ4WmdkenZNQ0VPaXlwL1haL1RwVWFZczF6NmJIRjFvVk5XTWVWQmxRQk5o?=
 =?utf-8?B?NnBTYXlwNGdxRGFVNGhTQ1RwUU1oeC9NNEQ3aHQvNEVaa09VTi9STGRmSlBT?=
 =?utf-8?B?bGxFcHhNZkxsdFBubzVQOGRtbkY1U2FtanM0N2hodU5qU2NmK1ZuVW5lUlN0?=
 =?utf-8?B?d0RRV0hwdld4elp5NG5lMU1XdUpxNnorblFGZzN5YWF6eGs2NGs2eW9qMEtP?=
 =?utf-8?B?WFFpMnB2bThEczZicE1zZEdTd3ZqVlV1di85V3NRN0ZiRnVkbXJ5ZzRBWXNK?=
 =?utf-8?B?alM2bXJmZjN6WjlnL2ZMZW1xSVR5VW5tS24vQUdVRzZNUW1LSGUvUGttamJY?=
 =?utf-8?B?azVxZ1I2ZDRRL0lQTmw4QUpuWlRnZ2FOWFVmZEwycGpqZE9GTFdhMGxLdXBz?=
 =?utf-8?B?YlBsV0VhRFhJcUdxNG91UzBuaFh5V0RtUklaNE5EUnZNMTRmVmFXb2wyOGZo?=
 =?utf-8?B?MUt4ZmREWHhzT09xRzd4eERjRHpJVTNSWWtUSElZWTZZQnoyT3FTWFVxaXVC?=
 =?utf-8?B?ZEFOcHJ0b2RWR1NYTDVxVjlnODdjOGloRFhyVExoYVkxSUZrbEZHVXNzMWJl?=
 =?utf-8?B?ekoxNVZUWVdpbktubTR5U293anoxelNGUG9MSERLVlF1ZFR6bUJTNmcrNG90?=
 =?utf-8?B?NDBOOWxFazF2OFcrVUJCUlE0cWVoTXpRUnpEeDU1WUZSOVA4MEJxcWx2Z0hM?=
 =?utf-8?B?aUlqRnczR3BoNkhNenZjZ3BicFBRQW94eTBuY3JWZFBXeVFtMUNqZFhyY3hJ?=
 =?utf-8?B?QzgxR29BYUdRSkRSM2lUaHowNmJXZUNPVkdBT0NXNUlwTTBUUlprZVJnOWwr?=
 =?utf-8?B?UFZvOXd6OFN4czJEbmNWbTAvVjBqb3ZuU2Q5Qk94RkViUm95QVYveVhhSm5D?=
 =?utf-8?B?N1diUWIxQ3l5MlkyNDd5R1k5S1ZKUW5vUWpEWFhmQXhtMFB4aTIycHVOTFMz?=
 =?utf-8?B?K0FVUnJGeUhVcGxjbHdwQlJQVld1NXJKYzNQWUJRRldoeEQySzd3SFpyWjFz?=
 =?utf-8?B?RzFxQW5qTzNINDZHMkQ4eVBXdStHSWxQcVBEcVpISGcwRnBxQ2d6OEk4dFkr?=
 =?utf-8?B?eWRiWHhlMHNrVUZNck5HYUM5cWZqUnNIYzVDbHZGZUFOTzRaYW1JZEgvV0p5?=
 =?utf-8?B?bG5IdkwxUHZnaEFHNVQyTWlZY2JLMFlrSlFZb1pOZzBMY3dEYmhwSUdpNkEy?=
 =?utf-8?B?YWxFUW16bVdnTVpFSUVMRzY5aWM5NitkaGRrL3hDMDA5aThXekdwYW04NWFV?=
 =?utf-8?B?dUtlb2FQcVYweHIwc29rWTltaW1CRG5pNFA0WkNuRmRMVmJXQU1aUjhTSElh?=
 =?utf-8?B?QVNiQUl6ZDY1V01ua1JLVmlFbFFzdExOdU9OTnJiRTUrR3BiTVlMWjRFbm9J?=
 =?utf-8?B?dmovZWNXRkRMU1E1eUZodTFtT0U5c1dWeWFRa2xjS3M4ZGFkcXI5QmZDN2Fu?=
 =?utf-8?B?UXE2MnBOREg5MG10YWVFNWFlOTEyYTJLWjgrVVltWEg2bjN0cjVtN3RKVWlB?=
 =?utf-8?B?V0FrZVUrQWtkZy9mWTAxQlRxYTZiT0NVSUpPcUVHM1hBVHpCNE1ucjdhczBE?=
 =?utf-8?B?Q2kxWktUVEltNUJLQlBzMTZOQnNJcTIvdUJUMFZPSDlPMStzdi93Ny90RFky?=
 =?utf-8?B?UlhVMENmMjRrcWJsWHB3d2RtMU9IbHErcVBPUm4ycnFiZnJYNlhzOFBUTExS?=
 =?utf-8?B?WHZFYWZiRTEzNEdhY0VqTStvUjFVVGkxSUM0TlNKLzJVSlF2bGNMUkZKQTNI?=
 =?utf-8?B?cHoyMWxIK0UvcWhsbW54VGcyVDZKeU45RlNnQlZnNWZTakxZQlVHOWQ2WDQw?=
 =?utf-8?B?QmJOeE50a2JsWUxRZUdGR1VSSkY1MzBLdlJWSXYzMm82SWlZZmwxczdRNUhv?=
 =?utf-8?B?ZFRuVE51Tm5EZmwxQitFWTFhVzFZenRySEoweWxHUlIwV2NxNkJQWWNUYy93?=
 =?utf-8?Q?ZXw5brrLVxAd5OsrmkIWW1e03?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95c906a-a767-4f19-1ac0-08dbd61f7aaf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 12:31:29.4945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTUeffXBsfVwcKv2KBO4FfHMo2zd4xt6PstVN1aD8CBjQZZsrn5OVOiD714qsPyDSVxIFnJU7QbExU66Zbtdhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8780

On 26.10.2023 12:25, Roger Pau Monné wrote:
> On Thu, May 11, 2023 at 02:07:12PM +0200, Jan Beulich wrote:
>> ... in order to also deny Dom0 access through the alias ports. Without
>> this it is only giving the impression of denying access to PIT. Unlike
>> for CMOS/RTC, do detection pretty early, to avoid disturbing normal
>> operation later on (even if typically we won't use much of the PIT).
>>
>> Like for CMOS/RTC a fundamental assumption of the probing is that reads
>> from the probed alias port won't have side effects (beyond such that PIT
>> reads have anyway) in case it does not alias the PIT's.
>>
>> At to the port 0x61 accesses: Unlike other accesses we do, this masks
>> off the top four bits (in addition to the bottom two ones), following
>> Intel chipset documentation saying that these (read-only) bits should
>> only be written with zero.
> 
> As said in previous patches, I think this is likely too much risk for
> little benefit.  I understand the desire to uniformly deny access to
> any ports that allow interaction with devices in use by Xen (or not
> allowed to be used by dom0), but there's certainly a risk in
> configuring such devices in the way that we do by finding a register
> that can be read and written to.
> 
> I think if anything this alias detection should have a command line
> option in order to disable it.

Well, we could have command line options (for each of the RTC/CMOS,
PIC, and PIT probing allowing the alias masks to be specified (so we
don't need to probe). A value of 1 would uniformly mean "no probing,
no aliases" (as all three decode the low bit, so aliasing can happen
there). We could further make the default of these variables (yes/no,
no actual mask values of course) controllable by a Kconfig setting.

> Do you also have figures if the greatly increased amount of accesses
> add a noticeable boot time regression?

I didn't measure anything, but nothing's really noticeable, no. And
the number of accesses in all three of CMOS/RTC, PIC, and PIT is of
roughly the same order, I think (and the RTC/CMOS one has been in
for a while).

> We are usually cautious is not performing more accesses than strictly
> required.

Sadly "strictly required" is an uncertain quantity here. The more
checking we do, the less likely that we'd identify a false positive
case of aliasing.

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -425,6 +425,69 @@ static struct platform_timesource __init
>>      .resume = resume_pit,
>>  };
>>  
>> +unsigned int __initdata pit_alias_mask;
>> +
>> +static void __init probe_pit_alias(void)
>> +{
>> +    unsigned int mask = 0x1c;
>> +    uint8_t val = 0;
>> +
>> +    /*
>> +     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
>> +     * count is loaded independent of counting being / becoming enabled.  Thus
>> +     * we have a 16-bit value fully under our control, to write and then check
>> +     * whether we can also read it back unaltered.
>> +     */
>> +
>> +    /* Turn off speaker output and disable channel 2 counting. */
>> +    outb(inb(0x61) & 0x0c, 0x61);
>> +
>> +    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */
>> +
>> +    do {
>> +        uint8_t val2;
>> +        unsigned int offs;
>> +
>> +        outb(val, PIT_CH2);
>> +        outb(val ^ 0xff, PIT_CH2);
>> +
>> +        /* Wait for the Null Count bit to clear. */
>> +        do {
>> +            /* Latch status. */
>> +            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);
>> +
>> +            /* Try to make sure we're actually having a PIT here. */
>> +            val2 = inb(PIT_CH2);
>> +            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )
>> +                return;
>> +        } while ( val2 & (1 << 6) );
> 
> We should have some kind of timeout here, just in case...

Hmm, I indeed did consider the need for a timeout here. With what
we've done up to here we already assume a functioning PIT, verifying
simply as we go. The issue with truly using some form of timeout is
the determination of how long to wait at most.

>> +
>> +        /*
>> +         * Try to further make sure we're actually having a PIT here.
>> +         *
>> +         * NB: Deliberately |, not ||, as we always want both reads.
>> +         */
>> +        val2 = inb(PIT_CH2);
>> +        if ( (val2 ^ val) | (inb(PIT_CH2) ^ val ^ 0xff) )
>> +            return;
>> +
>> +        for ( offs = mask & -mask; offs <= mask; offs <<= 1 )
>> +        {
>> +            if ( !(mask & offs) )
>> +                continue;
>> +            val2 = inb(PIT_CH2 + offs);
>> +            if ( (val2 ^ val) | (inb(PIT_CH2 + offs) ^ val ^ 0xff) )
>> +                mask &= ~offs;
>> +        }
>> +    } while ( mask && (val += 0x0b) );  /* Arbitrary uneven number. */
>> +
>> +    if ( mask )
>> +    {
>> +        dprintk(XENLOG_INFO, "PIT aliasing mask: %02x\n", mask);
>> +        pit_alias_mask = mask;
>> +    }
> 
> Is it fine to leave counting disabled for channel 2?
> 
> Shouldn't we restore the previous gate value?

See init_pit(), which also doesn't restore anything. The system is under
our control, and we have no other use for channel 2. (I really had
restore logic here initially, but then dropped it for said reason.)

Jan

