Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0B722004
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 09:48:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543512.848561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q64ws-0001kz-GG; Mon, 05 Jun 2023 07:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543512.848561; Mon, 05 Jun 2023 07:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q64ws-0001hy-DM; Mon, 05 Jun 2023 07:48:18 +0000
Received: by outflank-mailman (input) for mailman id 543512;
 Mon, 05 Jun 2023 07:48:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q64wr-0001hs-8v
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 07:48:17 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe16::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5459ef91-0375-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 09:48:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8391.eurprd04.prod.outlook.com (2603:10a6:102:1c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 07:48:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 07:48:12 +0000
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
X-Inumbo-ID: 5459ef91-0375-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4wJtaPpFrZO+vKSZpRv19ZpCQO7NbM5NPD3qZvqBQrwW+upHPBrnPUsMBB+kdc2Zi/XOftQTsQKDwk+5gNlmzdyo6ueWAqiuCRhBw+5KMGcLp9NSyyWGcaRNsekEXg098veWsVvs24avg+U4l0lD23AoNziqPuE+1X8wk5TkDzZAq3xO2DRUVBPET8Jp5u8NXT/MEcD2DpF0SHjc4iQyB3RjYpC+tgvln3aC61yILpKMCmONJwBVldbKH6wktPpmSSH7uS7dJ/vWo86NLqo4/UTqsH3V1q0WAaiegBAw2InkPi/+f7D7rFdiUBMUxtvT5iz6k4FheL0qi0mNFHQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiwLSeZKpgf1V+D68QSnxNZGADunS2xVRcTwifBp2x0=;
 b=giyza+FpqlPM87k9VjN/8ywj1OoZf2kiUQZB/sbiy6XKjm3z7Ly69poS/K9ryPBqTWypU9z01vIxuFxrjigwlxMKqnHXkfha1QYEA/APlsppULRes1e/rze2xZqG66MQOM7FxuchWzoIv6Vd3TVOTAtXsNPepCkyY8t19HQ9TgOeGw8IDf+ynYyVbWiyvs/5Rub6q/MX/1IB6r1xZFFF2QsxMtDNAxMGyOFxcGb+z9aL8Owm3t8ZWKhtTwJz5UpktMXcKGv72eawE2VANuPVyfFq5gDaZi7HPFFW6KC0ZGhYtjgnQ6HsTswLfAMBcaFbE5QKgiXn+mgJS4rLD7hi4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiwLSeZKpgf1V+D68QSnxNZGADunS2xVRcTwifBp2x0=;
 b=oFGQkZmtfJHC6LK9KtX/WqkGUmdWEPd1PH01edaLKYxvRYbZtbXHk9wiTm6QJV3mjzwItrfgJqyOrAQNuhlgMyjk+8hYP35dFh88nP11r6tbTAa10YmCJmB0hpydB2UiBIpmmwuDIHzLTcUDjN2Z9bs3++MJp7JHYH8lLCYhn5P0nBZ/+k3nO9zbFxg2orhQgW2OcKGfvyyO7Cl+DRH/B6HBl8okjPRKAB0U2vqJv/i+EF2JxaDowGP6I2LyZ0m4GkIOiysuvlZSknNB4a0o4XjCBA+LgzAJSRmQ0LcdaaRnL/3TOcUS2Qv3qdkyN3+otvMBsDzzGoYHfwUiI836wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9783e91e-9d13-6b20-d985-0beb535c7fba@suse.com>
Date: Mon, 5 Jun 2023 09:48:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/3] x86/spec-ctrl: Fix up the RSBA/RRSBA bits as
 appropriate
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-3-andrew.cooper3@citrix.com>
 <36b016e2-b378-f97c-42da-86a330471bf0@suse.com>
 <b7f848ed-5336-b3f4-3011-da10bc335d5b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b7f848ed-5336-b3f4-3011-da10bc335d5b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2a773e-588c-4567-1268-08db659936c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gppyMk6sASPYwxNp1XQnOplNme7WfMGOINl/J+U52XeDUAqVh3J1n00PKxvHqZ+H3WZMyOd3hu2AWqFbi5MWvvIZXFID535G+giii1Jjq6ztvDeM9gNoV2KM0PZ3ALbPynyFPJJzt67yt1nOdG0F0vbIcQx2AKplv0EyiSr/++rZ4FB970ZRILmixXIypYfEvqRxaWOIXgkLxYCDYj9d7KwPB6H/UVh//4HOmaGKU6zjvQTck7xmfz76zusWQNmT8sU1cm4ngC6BIcBs4sfkwIxlpCp7iJxTY0EA8buEMWfh7h2WTbhNimUNkS2uWt38TRdzAcur+C6+HCN6wnW8dpP7N7ASWW47CgNBbV/q0rdkMZwN+DSJQaLR2nMwLMXGHU4oWH9suPSmMii0PY7KWnV/sy1LlLbFyMmfroZXwHSibNi8sU2xS7VCEgh5kXehUMc86lJHFuzYn1E8nyNquiLG0xodTIpdisNbq08yq0xw2/EaF1Zfm39OROaWSR/ua8vzWjyQZTnEir+tNnAjyZPXP8R5uK+PNb7D0unFJpHP0L3QEYv/WCneF1GL1njw5Bq1O26H3X8iV+ObSQQY54kSJ3W3DCLBg66l9isFpczrAgRyK7PAwdr+9var2cnpw+NinZ6zduK9LNrlWx4BCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(83380400001)(54906003)(4326008)(6916009)(38100700002)(66556008)(66946007)(66476007)(6486002)(478600001)(186003)(2906002)(36756003)(2616005)(8936002)(8676002)(41300700001)(316002)(5660300002)(31696002)(86362001)(31686004)(66899021)(53546011)(26005)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmlkRlZwcE5LWml2aUdtYkw0aDVXMEtrYmVhSlpETC96d3p2aEU3Wk9vWFJQ?=
 =?utf-8?B?ZzVUUHA5dmFwVmpHS1dnSmZIbzlLWW8vanFQOE8xZjNDZkNKeXJTQ25RSUxx?=
 =?utf-8?B?YTY3TXU3UWdDWG84Q1loc3RkaFl3dkVDSTNWQlRkUGRpVnBQSjVIWmRDeGpC?=
 =?utf-8?B?cERSdytVdkJCWHdVUXp6ZkRHTXl5a1JIUXdPY3grcVVDYXdSWTBQcnViSmhK?=
 =?utf-8?B?cURXVUZRK2laNkxCamhlQmpsdFUzaUFnRllrcVM2RlQyYksremdEZkwyQWp4?=
 =?utf-8?B?ZldRSzlwMmNjbUkvcXNsZEdzcUdTRExnTiszMDJWS1JhSnpLVk10L1hzNVdZ?=
 =?utf-8?B?NnJ3OGRIakd0a3g0SjA5bHNhVytGNnBpVjUra1Fsd2lGaFpPK2N5L0VoMVpx?=
 =?utf-8?B?V1FhRlhqUVJla0pXVENQWnhYVTlPQ014NFlOYWEzNGFVL2JpUFhpbndZTW81?=
 =?utf-8?B?NnY4dzJCejBaODNUd3lObzVzZXdLN2ZkNHNOUUJoUnJhNjh1M2FIZ0lhczdk?=
 =?utf-8?B?Zm9KcVVFUlAyeE5ETVNKUmQ1VkhzbFBtYjcxVkFIdlVGclRmMDVLUDNHaWF2?=
 =?utf-8?B?STBoYmdLRDlGUnFpdE80TVRWMFFRUkxyT055cVVwTS9OcllHNkl2czl4ZlB5?=
 =?utf-8?B?RitWR3c3aDgyMmt6QWFzZ2V5QkhvbUhxZDRIc2ZyWFEzVFRwOHpzZ0dybGdX?=
 =?utf-8?B?c1ZtblNHWHdlQ2JrTzVHdmVpeVJnKzZQZVRaNFNla0oxakJKYVY5QUlZK3ZF?=
 =?utf-8?B?TWFCUGZ0ZXFmWUZnTXdXNVlUUWVBT210Ti9tK21oSi9CYzExNG1rRDhlNUVV?=
 =?utf-8?B?SUNqQnlxaElueDdCL29pY1N4Mzdxd2p1RFh5aEg3emoyTlg4b2wyc01obnNk?=
 =?utf-8?B?cjI5VVJkOHV6UjVqd3JLdHQwQzJXUGJkMmhMZ2d3YjRCRWZKcnhpTzl4Q2Rr?=
 =?utf-8?B?eU92MzVUYmFhUXdPVkxPRXV3NFlhQXRLNGFsMURFSkt4V2l6SzJjdEhqZG5v?=
 =?utf-8?B?ZzkvQTNQTHQ4NEJkM3dDR0FadjhCTWxVOXNHRGoxMWpGZjVkZmlXNXEvUWNL?=
 =?utf-8?B?Y2NWVHpHTE9DS2NhdlpCR2VnMVdvRTVxR053bVZLVmZNeFB0UWpQREt4SmZQ?=
 =?utf-8?B?N2JkY2xzaWpsOXNWeDNEV1FWd3JCQ3N0S29kbmw5dS8zdlhUR2dUN0F2TEVZ?=
 =?utf-8?B?M244R1Q5Mk1xdUNSMHVJYU5YMTljNVJ6UGl3bkNMN005eDRhZkV1aU1acURj?=
 =?utf-8?B?Yy92K3g3aUhNaGhBd2dydWExMnNqRlB3T2EveGJZb2pGT3dOQmNnbzhxREsv?=
 =?utf-8?B?YjNGS2RPb1grZHpid2tORk1VZk1hV0REWlRWUE9aWTlNbktxbVpWMUh2U29a?=
 =?utf-8?B?bHY5UURtTWIvZjdodkFaS0V1cFd5ajUyZHRnZDBjWGlHZExtOXptZEZmTXo1?=
 =?utf-8?B?bGdhZkVYMnJOZ1RJVUE0WU1wMlVOVlU1TzVsZStlU1dVd0tCRmdyTGsvTm0y?=
 =?utf-8?B?NzVqOWdlUXFPTEI0ZkVmS205cUtWb0dBcHU2dXRCdDdpakwrYW9GdXpQdThH?=
 =?utf-8?B?dmU4QkFwVjVPaWR3SWUyT2JaRTFUUzgyZWU1eENsL1lyRVpvVXNldVFuWUh2?=
 =?utf-8?B?NC9wWXhBN3JLNzZPa2UwMXg0VS90QThNUmUrVmlqUVpCZUtjdXZET2VnQjRY?=
 =?utf-8?B?bjh0ZHdTWnp4bWtVN1ZycnlhR0hLMER3citZeXhiZFNBcUsxK3BuNFdjZi9X?=
 =?utf-8?B?TWhTcVVlOThDRXRVNGVyelIxLzdCUi83U2l1TzYvUkF6ZGNlQTNGUCtuUU56?=
 =?utf-8?B?WlZ6OUVRWmJiZDRQMXRlYXRUZzhSQ2g0UHpvNlNzNXZYS0htZHB2eVEvYkxo?=
 =?utf-8?B?YisxSnk0RTZ5MzBORkw5T1RvcmJNd09kUldRek8zaEh4Mi8yUzBSK3c1RDQz?=
 =?utf-8?B?alFsd1doSGt1Q205dGlYaDA1bG5PV0RPQ05NYkU2TEVWeUJ3aEhQUkdsRGdv?=
 =?utf-8?B?aEpCQ2RGeTFSbmpwWTYybm5iYVNqcE0vTlplVWlWeTloc3M1NytXK1AzQ01t?=
 =?utf-8?B?QlplNnBBakQrSGptV2V5c0szMVNqeVVrTy9UdGMrSXRYdldGOWFwU1UyRDM3?=
 =?utf-8?Q?sB0PtNQGfUV28OWJQiLSB1AoY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2a773e-588c-4567-1268-08db659936c5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 07:48:12.7707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLS0N8ojplfW/JXwlzoriZkeOYSXKkWwmWzxXImTyBrpikf86b3m151tDDm85zuGyD6j6iFBHdYQcc+hMhsjhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8391

On 02.06.2023 15:57, Andrew Cooper wrote:
> On 02/06/2023 10:56 am, Jan Beulich wrote:
>> On 01.06.2023 16:48, Andrew Cooper wrote:
>>> @@ -593,15 +596,85 @@ static bool __init retpoline_calculations(void)
>>>          return false;
>>>  
>>>      /*
>>> -     * RSBA may be set by a hypervisor to indicate that we may move to a
>>> -     * processor which isn't retpoline-safe.
>>> +     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
>>> +     * agreed upon meaning at the time of writing (May 2023) is thus:
>>> +     *
>>> +     * - RSBA (RSB Alternative) means that an RSB may fall back to an
>>> +     *   alternative predictor on underflow.  Skylake uarch and later all have
>>> +     *   this property.  Broadwell too, when running microcode versions prior
>>> +     *   to Jan 2018.
>>> +     *
>>> +     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
>>> +     *   tagging of predictions with the mode in which they were learned.  So
>>> +     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
>>> +     *
>>> +     * - CPUs are not expected to enumerate both RSBA and RRSBA.
>>> +     *
>>> +     * Some parts (Broadwell) are not expected to ever enumerate this
>>> +     * behaviour directly.  Other parts have differing enumeration with
>>> +     * microcode version.  Fix up Xen's idea, so we can advertise them safely
>>> +     * to guests, and so toolstacks can level a VM safety for migration.
>>> +     *
>>> +     * The following states exist:
>>> +     *
>>> +     * |   | RSBA | EIBRS | RRSBA | Notes              | Action        |
>>> +     * |---+------+-------+-------+--------------------+---------------|
>>> +     * | 1 |    0 |     0 |     0 | OK (older parts)   | Maybe +RSBA   |
>>> +     * | 2 |    0 |     0 |     1 | Broken             | +RSBA, -RRSBA |
>>> +     * | 3 |    0 |     1 |     0 | OK (pre-Aug ucode) | +RRSBA        |
>>> +     * | 4 |    0 |     1 |     1 | OK                 |               |
>>> +     * | 5 |    1 |     0 |     0 | OK                 |               |
>>> +     * | 6 |    1 |     0 |     1 | Broken             | -RRSBA        |
>>> +     * | 7 |    1 |     1 |     0 | Broken             | -RSBA, +RRSBA |
>>> +     * | 8 |    1 |     1 |     1 | Broken             | -RSBA         |
>>>       *
>>> +     * However, we doesn't need perfect adherence to the spec.  Identify the
>>> +     * broken cases (so we stand a chance of spotting violated assumptions),
>>> +     * and fix up Rows 1 and 3 so Xen can use RSBA || RRSBA to identify
>>> +     * "alternative predictors potentially in use".
>> Considering that it's rows 2, 6, 7, and 8 which are broken, I find this
>> comment a little misleading. To me it doesn't become clear whether them
>> subsequently being left alone (and merely a log message issued) is
>> intentional.
> 
> It is intentional.
> 
> I don't know if these combinations exist in practice anywhere or not. 
> Intel think they oughtn't to, and it's quite possible that the printk()
> is unreachable, but given the complexity and shifting meanings over time
> here, I think it would be unwise to simply assume this to be true.

I agree.

> But at the same time, if it is an unreachable code, it would be equally
> unwise to have a load of fixup code which we can't test.  I've still got
> the fixup code in a separate patch incase we need to put it back in.

Iirc the fixup code you had wasn't really "a load of code". Thing though
is: If such a combination did exist, according to our history we'd be at
least on the edge of needing to issue an XSA along with adding the
missing fixup code. From all I can tell that risk would be lower if we
had that fixup code: It might well be correct.

Nevertheless, if you decide to leave out any fixup, may I ask that you
say so very explicitly in the comment?

>>> +     */
>>> +    if ( cpu_has_eibrs ? cpu_has_rsba  /* Rows 7, 8 */
>>> +                       : cpu_has_rrsba /* Rows 2, 6 */ )
>>> +        printk(XENLOG_ERR
>>> +               "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RSBA %u, EIBRS %u, RRSBA %u\n",
>>> +               boot_cpu_data.x86, boot_cpu_data.x86_model,
>>> +               boot_cpu_data.x86_mask, ucode_rev,
>>> +               cpu_has_rsba, cpu_has_eibrs, cpu_has_rrsba);
>>> +
>>> +    /*
>>>       * Processors offering Enhanced IBRS are not guarenteed to be
>>>       * repoline-safe.
>>>       */
>>> -    if ( cpu_has_rsba || cpu_has_eibrs )
>>> +    if ( cpu_has_eibrs )
>>> +    {
>>> +        /*
>>> +         * Prior to the August 2023 microcode, many eIBRS-capable parts did
>>> +         * not enumerate RRSBA.
>>> +         */
>>> +        if ( !cpu_has_rrsba )
>>> +            setup_force_cpu_cap(X86_FEATURE_RRSBA);
>>> +
>>> +        return false;
>>> +    }
>> No clearing of RSBA in this case? I fear we may end up with misbehavior if
>> our own records aren't kept consistent with our assumptions. (This then
>> extends to the "just a log message" above as well.)
> 
> Well quite, which is why I've gone to lengths to state what our
> assumptions are.
> 
> Right now, there is nothing in Xen itself where RSBA vs RRSBA matters. 
> Until this patch, we don't even have cpu_has_rrsba, and remember that
> Xen was not vulnerable to CVE-2022-29901 (Intel Retbleed) because we
> chose to use the microcode IBRS implementation on early Skylake, rather
> than hope that Retpoline was safe enough and go with the faster option.
> 
> 
> In v1, having RSBA and RRSBA (working as I thought they were supposed to
> work) *did* matter for the default cpu-policy derivation to work nicely.
> 
> But that was invalidated by the clarification to say that RSBA and RRSBA
> should never be seen together, which in turn completely changed the
> derivation logic.
> 
> In v2, it doesn't matter if Xen ends up seeing both RSBA and RRSBA.  It
> explicitly can cope (by treating them the same WRT Retpoline), and the
> derivation logic now calculates both completely from scratch (and based
> on RSBA || RRSBA).

Like above, may I ask that you say so explicitly in the / a comment right
here?

>> Also the inner conditional continues to strike me as odd; could you add
>> half a sentence to the comment (or description) as to meaning to leave
>> is_forced_cpu_cap() function correctly (which in turn raises the question
>> whether - down the road - this is actually going to matter)?
> 
> Look at the single user of is_forced_cpu_cap().
> 
> I am not micro-optimising a single branch out of the init section on the
> blind hope that the contradictory behaviour it creates won't matter in
> the future.  Every forced cap is an abnormal case, and it's almost
> certainly my future time which will be spent unravelling the
> contradictory behaviour when it comes back to bite.

My request isn't about optimization at all, but about an apparent pattern
of unnecessary redundancy (which only as a side effect leads to the
elimination of a branch and hence some tiny bit of optimization). But if
you're sure this is going to be obvious to everyone but me, I'm not going
to insist.

>>> +    /*
>>> +     * RSBA is explicitly enumerated in some cases, but may also be set by a
>>> +     * hypervisor to indicate that we may move to a processor which isn't
>>> +     * retpoline-safe.
>>> +     */
>>> +    if ( cpu_has_rsba )
>>>          return false;
>>>  
>>> +    /*
>>> +     * At this point, we've filtered all the legal RSBA || RRSBA cases (or the
>>> +     * known non-ideal cases).  If ARCH_CAPS is visible, trust the absence of
>>> +     * RSBA || RRSBA.  There's no known microcode which advertises ARCH_CAPS
>>> +     * without RSBA or EIBRS, and if we're virtualised we can't rely the model
>>> +     * check anyway.
>>> +     */
>> I think "no known" wants further qualification: When IBRSB was first
>> introduced, EIBRS and RSBA weren't even known about. I also didn't
>> think all hardware (i.e. sufficiently old one) did get newer ucode
>> when these started to be known. Possibly you mean "... which wrongly
>> advertises ..."?
> 
> ARCH_CAPS equally didn't exit originally.  ARCH_CAPS, RSBA and EIBRS all
> appeared together - see how they're bits 0 and 1 in the MSR.  RRSBA on
> the other hand is bit 19, which gives you some idea of how recent it is.

Hmm, yes, I see.

Jan

