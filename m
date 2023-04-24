Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B726ECFE5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 16:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525410.816588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwpE-0005Sh-3X; Mon, 24 Apr 2023 14:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525410.816588; Mon, 24 Apr 2023 14:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwpD-0005QU-WE; Mon, 24 Apr 2023 14:05:52 +0000
Received: by outflank-mailman (input) for mailman id 525410;
 Mon, 24 Apr 2023 14:05:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqwpB-0005QO-RU
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 14:05:49 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bc35272-e2a9-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 16:05:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7789.eurprd04.prod.outlook.com (2603:10a6:102:c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:05:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 14:05:44 +0000
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
X-Inumbo-ID: 1bc35272-e2a9-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1OAGF7HyFFvIXa6PE3mXjKFp50KLs3K9fMsnvp9LNpjlhTqZMXiepW2/YX437n3VdO72ZNRtkYSunk560xWBZJxsqwEal0y8XMNeGrcd+OXtEKu/u93BxSvTPqJxjJ5rR0/aRQJJBAjJMERSRKAIl7dz0pt0pffGePUXENTRotkaWgaSdq/g3B9moNVg/IANa1IT6dUtKyYTNHagGSnBGkPk6KnaQ9c9cHWt+bx/SKUtjhl3Z3VQqtHsuW/etkrMlGLaZJGWFjCDFnAj7y3DBg2zrNmMnr2is9PH2oIFBjWmaaNKKsEWsrvqRIOUOO6RqbV6sR0NUi0vcNG/5GrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpcbWidt73BpmMU/JDX2CpCaPV4QH4c9ciMRnj8u0aE=;
 b=DrVFrxrTtGu794PW/SfTJ0b2U2E6oJRFE9nbh78FFXJk6fi7yJOdyDpBR68q316+cdgrRTl7WZKabwHW7PKKNUwyXKuH9yKZ4drwMrz09AT8yzDRri0Huv2b3aXHxsJFtODyvlhcjkt7Fh/qg0hORpAmwP8Xbzc8AtgrQOWt8iJ6EL8tgk94GXFIzLqA2KJcHFppC4/RyisGLl/XLzlPnZPzxLze1IIYwx4rTXRnomgSjjkdreqj6c0gGZMM/8adUwk7aAU8n878YgI1MOB/h/tAV/Dvoe263g5XI10N3+3x+x+86cSQ240DY70x3A4GBh6XLHBYpqvocwD5KTE2Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpcbWidt73BpmMU/JDX2CpCaPV4QH4c9ciMRnj8u0aE=;
 b=OdL5bzxugni2jhd2FCDkszGtoxN2CTy/z89b+nuFiD6vAOJn9Hnj26bs9QLnQRjD562yKUMjiotYQgncbgzMSMEfwOrQZVyEDz6br9efllukPxjlw+9wYRhDwh67ckN5Yt3K6QxN+I6GY4Ke9VpEQ8bjGqqEGIaTcFJfGZtznxywKXFenSAJeLL+5KODqcXyFkMGJTwgzqNevWuyXsQMUm8vN0Wf/gClNBIHje9oJPtLSXH9Ju4Et3uuowgZs4sP0udl1AqvI3XBUnfktcaiWyn0B3rVGABWV3SXEmzpyNYLuGQLwWZ1ZFAHEMQobT6c3Mrq0/MOFLFg/IkBZ+repA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
Date: Mon, 24 Apr 2023 16:05:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6b212f-d8af-490e-e9ce-08db44ccff07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E3W1rYCKYvMszUGMa4/RGvYitiFY5m6xgk4VnJrW6Hckv6MshlMPOUpC/J26AD7w1ceMVdwX98qTNVqnPjUJcCilp2WxY448IJwYh/x5a0q6ld7Ncol5uQ9/VXdOS+M+6eHx1ZmnySd4lqf+YmAlChALg3EMI3ovQ4QcU70sF3KEeelt6LffSjhC6U/p/oqx9xWWmQp42uLtn+QcS5RPx9W4oRnyKSRaScrW+P9kGB90T1ImG7EaUqrXC1YBv7o6vA750ip3W9oZ2CClZuFZ8EPjiylUotOL2cqPpzdrHNZMmzlFvIfqD9IJN1qFxPAmcxLUUvjn+qageegZN/xPB76JXp/Uz/TWSsgvJd2Xcq3FdHnFpSjqxqCHZdJBJZJ+OctcaVQcWLLQI9EAQBye+DO/dZw+l+9n/usoRjscFLM+b3vvqGpyZ8o9sYCM3nIxYYhs3suDE21zgUwkkTu2x8vweFaZKIqk5tnB4di5fpiUrRLBdZVcJXhXAYlxE+rv4mtspLHseDbG/ZZh0bYeag2arKmsY9iDm4MA9i68sck9ks+WvpgQLelHV+m7bmTlZksPhW+OiZwNFdj27EoJlUQfIDer2syGw1OKs715kJLfKtFokl9uniBomRwi3BRZ5NvO7karwXAV8tQeMBxV0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(31696002)(54906003)(86362001)(36756003)(186003)(53546011)(6486002)(26005)(6506007)(6512007)(4326008)(6916009)(66476007)(66556008)(316002)(83380400001)(66946007)(2906002)(38100700002)(41300700001)(8676002)(8936002)(31686004)(5660300002)(7416002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anZMQTc2bndTU3JKbVEzdEszeitCSG5TdWtDc2JoNm9pQnNqMmV4M2ZwbVd1?=
 =?utf-8?B?MUdxQkxGeDNhZGdsY2lGV3U4RnI2VG1GUi9hMkM5V1JVaGU2SGxjWkEvWTRu?=
 =?utf-8?B?RnpGaUtHa0JDY0RIbnZaUXVmTnZRVzd6M1ZTNHR6cnVTUEFIRlNjWlFoLysv?=
 =?utf-8?B?MWxQbmxxMWZLOTBIYUw5MUhkMHAvdXk3UzN2WWppY0o3K0NSdWxvcGE1UE9H?=
 =?utf-8?B?amQ3V3BhYzg4eGhCampqTmdESyttZFdkdVlvVE85ekljVEdENkh6aUdqL1FP?=
 =?utf-8?B?TVBaeXF2bXA4MXhQTXVMeTdEWEFGQzdhK0RzTXJpSE45bURpbkh2N1prL3dm?=
 =?utf-8?B?d2FsU3ZnT3IwNjRYSTBkYjhhYlBNZjh2elVMQzF2OWNHNDBqNE1NVmU5MW9R?=
 =?utf-8?B?L1NNbjhVWFRFZkQ5R2dIL1hOS3BEMWRLSWpWOVpjRVM1Y05WQjNpdFhQcVNJ?=
 =?utf-8?B?K2hwQks3cU14NXJxNzNIclZJRUpPOEpLS1M1VTk5MmlWZmtqNXhMczVjUDFU?=
 =?utf-8?B?VTd0MmNhWjBZNnlRS3hiSlNuM2JCWTB4Y09KZ0tndlZLeWVXcHkybWhHeXdu?=
 =?utf-8?B?ZUFtS2VxWWFQRVl4ZkN5RU1FU0NnbHZXaFdqeGxPNFNqTE5PMitORXhnbG5H?=
 =?utf-8?B?Mk12T3VrT0FiMHZUeXdnb1ZFS0N0ZGZianlkN0RncW90NFd5UEFWWTMycWly?=
 =?utf-8?B?RjVUY1hubDhUeEE1WTlmNndPczlveHlVeVJLQjlqNVM2Zy9SQ0ZSbGJLdy90?=
 =?utf-8?B?cFhDdmZrc1ZsL3VwQTAySzVzaGkwMEVDcGZoMkJHaXNCYXlDZjdwcjJuUlEy?=
 =?utf-8?B?T1B2azQ5L2VsU3Zpcm5tK3dsUUY4Q3N1TDE5eXR2MWU3eHUyR25CWU1OZGlV?=
 =?utf-8?B?YkJrYzcxM1RGYW9saGUyaDVQVlYzVjFWdmpVakI2VHdsVGprMTdwQUYvcnhq?=
 =?utf-8?B?STN4OE1UMGY1eVdBRHU4ZWxUSUhmVE9OMnphM01hUHEwRWcvbEgvTmdJZ3k1?=
 =?utf-8?B?ZEd3Y0FnVVhGaExQQnltVzZCYlhjcytZZUszeTQ2MERweVRQSWNuRTRVeWhB?=
 =?utf-8?B?VDNrWXZIWExvZDVTNnFvZ2RNTk5ZREdFZENBYjEycCszVG9uUmZ3OTlCcWdy?=
 =?utf-8?B?YTIrTnpCMTduSnhwQzE4cDV1NUJ2OUZWQ1BPV0NyMWNrckFkbHRrbFdmMVhT?=
 =?utf-8?B?RkRUNXFzY3AzR3pKaHBiVUxDNXoyOGpoYnE2bFgwN2ZVUWxNR3Y0WVZHeGJn?=
 =?utf-8?B?TFRzYjVmbTYxNlhiNXBLeUJUQmluN1BESW9ERmZKWlB1WHFDbzVTc0gydWZY?=
 =?utf-8?B?VGJmaUhXQ1I4Tk1zUnkvN1lua1htV3p2emxTQjVoNDkzeFd6aEs0QzFuaFkv?=
 =?utf-8?B?SkJlT3pyRzFUS0tMTHVvNU9oa1hXb0UrbUloUFpDRnE4elhEeDlGcTFGUDkz?=
 =?utf-8?B?UlpuNW5VSTVZM205NWpyZ254U2puekkrcmxwUUJyU1dJeXNDVUtUOTl4RGxn?=
 =?utf-8?B?WHhkR1h6YWF6N3VWODAybmxINzJOdHJaenUrc21OeWpvTnZ0Smp1aVFHYnJr?=
 =?utf-8?B?M1ZTTDVzQUo5N080TWRuUnZHQkd3aGg4d0RxYXJUbkNjUUwvMDRjNGdyNjB0?=
 =?utf-8?B?ZHhhU0JVdmFUZ00yZnhZTmVOeUE2UFFmdVh6MklRcWd0a1FzTDF0bXp6Tm9Z?=
 =?utf-8?B?dm1vQkFsck9qT2kvb3EyRGlQc1habm8xYmtHWDhLamg1ZGtOZ3NDWDdCbWZU?=
 =?utf-8?B?ZGU2M21qQWJYb0tZOXpQNnVzY2hQc1ZoTlRBbXhTWWRFTTJVREJPZHl6aG1Z?=
 =?utf-8?B?aGR4b3FrR2JFSEFjZXVQaEowcHFteG9HbHFOWnoxZHRQbHo5L3lCMVNPdkts?=
 =?utf-8?B?Ly9UeUwvODVFWkp5NU13eXd6dTVDY0p3d1M5V2RueTJxOU5XS1hZcWw5QXJs?=
 =?utf-8?B?WkRMQm5ja3JXOVU5Rm1pY25XTTBrZFU3Y09iSkRQMGdxWFJhVEhBSWxQNlFD?=
 =?utf-8?B?bDRKa25DenJIaVJJcGhJajd4eWJxYkxGM3NjSkZpUEsxNGtCQ3NkSEVNRENz?=
 =?utf-8?B?T0FRRGE0bWFPZlFOWCtyblRDc0tqQitrdVFYNnBhVUxlVUp3Rk5jN1kyK0U0?=
 =?utf-8?Q?ym47nI2qG4etL2zSlrGNJwePv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6b212f-d8af-490e-e9ce-08db44ccff07
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 14:05:44.7433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gzc4YdqbQHUVf915FfJXy3l8KNcSSShRQm+EN8GEe4TEhriRZLsBG1NmBVtj+SGkxyeVhie/CuQLl0OMuaqZ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7789

On 24.04.2023 16:00, Luca Fancellu wrote:
>> On 24 Apr 2023, at 12:34, Jan Beulich <jbeulich@suse.com> wrote:
>> On 24.04.2023 08:02, Luca Fancellu wrote:
>>> @@ -30,9 +37,11 @@ int sve_context_init(struct vcpu *v);
>>> void sve_context_free(struct vcpu *v);
>>> void sve_save_state(struct vcpu *v);
>>> void sve_restore_state(struct vcpu *v);
>>> +bool sve_domctl_vl_param(int val, unsigned int *out);
>>>
>>> #else /* !CONFIG_ARM64_SVE */
>>>
>>> +#define opt_dom0_sve     (0)
>>> #define is_sve_domain(d) (0)
>>>
>>> static inline register_t compute_max_zcr(void)
>>> @@ -59,6 +68,11 @@ static inline void sve_context_free(struct vcpu *v) {}
>>> static inline void sve_save_state(struct vcpu *v) {}
>>> static inline void sve_restore_state(struct vcpu *v) {}
>>>
>>> +static inline bool sve_domctl_vl_param(int val, unsigned int *out)
>>> +{
>>> +    return false;
>>> +}
>>
>> Once again I don't see the need for this stub: opt_dom0_sve is #define-d
>> to plain zero when !ARM64_SVE, so the only call site merely requires a
>> visible declaration, and DCE will take care of eliminating the actual call.
> 
> I’ve tried to do that, I’ve put the declaration outside the ifdef so that it was always included
> and I removed the stub, but I got errors on compilation because of undefined function.
> For that reason  I left that change out.

Interesting. I don't see where the reference would be coming from.

>>> --- a/xen/common/kernel.c
>>> +++ b/xen/common/kernel.c
>>> @@ -314,6 +314,31 @@ int parse_boolean(const char *name, const char *s, const char *e)
>>>     return -1;
>>> }
>>>
>>> +int __init parse_signed_integer(const char *name, const char *s, const char *e,
>>> +                                long long *val)
>>> +{
>>> +    size_t slen, nlen;
>>> +    const char *str;
>>> +    long long pval;
>>> +
>>> +    slen = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
>>
>> As per this "e" may come in as NULL, meaning that ...
>>
>>> +    nlen = strlen(name);
>>> +
>>> +    /* Check that this is the name we're looking for and a value was provided */
>>> +    if ( (slen <= nlen) || strncmp(s, name, nlen) || (s[nlen] != '=') )
>>> +        return -1;
>>> +
>>> +    pval = simple_strtoll(&s[nlen + 1], &str, 0);
>>> +
>>> +    /* Number not recognised */
>>> +    if ( str != e )
>>> +        return -2;
>>
>> ... this is always going to lead to failure in that case. (I guess I could
>> have spotted this earlier, sorry.)
>>
>> As a nit, I'd also appreciate if style here (parenthesization in particular)
>> could match that of parse_boolean(), which doesn't put parentheses around
>> the operands of comparison operators (a few lines up from here). With the
>> other function in mind, I'm then not going to pick on the seemingly
>> redundant (with the subsequent strncmp()) "slen <= nlen", which has an
>> equivalent there as well.
> 
> You are right, do you think this will be ok:

It'll do, I guess.

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -324,11 +324,14 @@ int __init parse_signed_integer(const char *name, const char *s, const char *e,
>      slen = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
>      nlen = strlen(name);
>  
> +    if ( !e )
> +        e = s + slen;
> +
>      /* Check that this is the name we're looking for and a value was provided */
> -    if ( (slen <= nlen) || strncmp(s, name, nlen) || (s[nlen] != '=') )
> +    if ( slen <= nlen || strncmp(s, name, nlen) || s[nlen] != '=' )
>          return -1;
>  
> -    pval = simple_strtoll(&s[nlen + 1], &str, 0);
> +    pval = simple_strtoll(&s[nlen + 1], &str, 10);
>  
>      /* Number not recognised */
>      if ( str != e )
> 
> 
> Please note that I’ve also included your comment about the base, which I forgot to add, apologies for that.
> 
> slen <= nlen doesn’t seems redundant to me, I have that because I’m accessing s[nlen] and I would like
> the string s to be at least > nlen

Right, but doesn't strncmp() guarantee that already?

Jan

