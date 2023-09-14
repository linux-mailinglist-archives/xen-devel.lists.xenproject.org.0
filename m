Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D187A0403
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 14:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602237.938674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qglaH-0001ys-B1; Thu, 14 Sep 2023 12:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602237.938674; Thu, 14 Sep 2023 12:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qglaH-0001wl-83; Thu, 14 Sep 2023 12:36:37 +0000
Received: by outflank-mailman (input) for mailman id 602237;
 Thu, 14 Sep 2023 12:36:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qglaF-0001wf-OY
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 12:36:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55f60aa5-52fb-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 14:36:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 12:36:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 12:36:31 +0000
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
X-Inumbo-ID: 55f60aa5-52fb-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myhDirO+XWtcHklXTIVD4s58q+rSpgWssvmbkqwQsoYdRpZr2saURe8/T714OHRYO+aazZng11I0WaYR+Jj3ZPZyCF4nDp2F0GO07reqeHAhwfffmu/14iR0DAbzssY4FFHCZUN3CBl1WKDckxHHuxtcJGwVYzoGPQ687ENayDPPGc6y2y3QwXIzzvAKOrSjqMP7BbgVsEmz7C8QQDuCxpp7OZmsMxCZQXwN5NiJ6q1AjX/JYmETrg8Wd0WhhNvk4aNu4fgJoifZsjKbmI7kgcPH++LMIJJl/DuwmTC96rA2jcdgfSQpYx2Kqd9ap9VrtmJpFaSdBGRo1khGXyQeYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oU1ps1hPglP7vpfqvDsdIJKDwDtcpHZIcV642C/FdE0=;
 b=d/SHBzS/1DBRQenrZWlw4O2ALkEzqs1cqemFkVc/4bFXNp0/q0kokgX1URocD5iBQQTpeauASEumuQ/hhyU6yGPuSIljWTkIYN4FvMoBmAcgIxkIPtFOwwiUsbliVnJJzNRP9lbiBKNN9CSG8N4KEznnPN4vzS9jWh/MKIRj/QAU8gKgGRVYbCViCEyO0nJvHD4xluNZYO/BB7b5EA7YOaWpaGJZZpoY6Ae2k/7hmTLpfgLbO3KUAwPZ8y4Yl6i+ENcy70PsRtw9c6AufoG14SvC3jPayFWDFTVi5QJp4O5i8vXecFGg40rIKAoqv6nGwBg+KJq8mWVdOS3NmB83lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU1ps1hPglP7vpfqvDsdIJKDwDtcpHZIcV642C/FdE0=;
 b=Hs842sHK5trNHVMBTYawmptdFjMwrggriKZshmnRcgw+pWVaq6UQeXhnNDk7iq7cRN8mSxspaXmSyKca1mvqgl+dCaZfbalmAZqyLt/m/CzMzlqukgw2NEmQhCRfo/prWBZ//ICx8jg/JgBMNtdBKyNLqgrhGyUsvC9IqZyMJqEPcx/rgmZGrpxSvEGJ0DnMVh92k/Yy13HgC5u1GnHfRy3usSMEiuEbOj04KpRmxP2Km3yTdxajud4vsAjpXw9N0LWDsyQvNAexgH1hVJbnqQV7Cj0uHi7dQOfgMIJ3r5b3p16Vp3X+li3FCdnJAccgJ0S66oMPIPm5xqq30lIDow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20e50507-5c8b-5e44-12e9-dfe8fa136350@suse.com>
Date: Thu, 14 Sep 2023 14:36:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] timer: fix NR_CPUS=1 build with gcc13
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a17ba988-2850-fced-d225-97e1d11f6576@suse.com>
 <CA+zSX=aCwR5gxk3jyPDoWRvoFAAjORWigtrbaO9ow5EvmT_tZg@mail.gmail.com>
 <ea6686a2-dfe3-4a6f-5d3c-a729f95520d1@suse.com>
 <CA+zSX=a1oyPOJLvwBq+YXGnumi7HAqk_XoL=Wat9iHnz7fTe6g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=a1oyPOJLvwBq+YXGnumi7HAqk_XoL=Wat9iHnz7fTe6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd90285-aca5-41e8-724b-08dbb51f3904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1kNZjhSse0ufa6IcpfC1B9Hg53Y1R/8b11DcK3kH80Yz3jMc2kFaWKwKN/+8XACJXVXWTwzAHiFSi4LsTGJi4qi4eEhJT/bB8pFJRLhKyyJpD74UCStoR0spQ3EmQ4Rp3I8v7+B7vUm8WuzCekezx1dK8frSavfK5C5FMBAjgZXcIFnTpMLWOEskL0j5nWIIZUpDcVr+eHh3F6armVLZhjCc3AtUunP+BpDB+MCNg+oMZBOdNqRQQEOGqaLnzkoAkjitFUIHrUw31dqJkmza2ckH+k4id03GCG+P+lskLp2qhsit3148AsHjx6hyA86dg2knwCDPiKtZa4QjR/WS7/mSazQnUSMmwkyI6Obej6m/q+jIn9BBzDCwVYSOZRDvmNZ/0/84+cQvwhUoeb+Jt0lq0bi/Th4HmGOYfBTzGevRG+0KWt0eKL4MeayfOFWf+ZWxABMzodN18nLSd1rsHhOHS1SBeZdRRy//Q31+zVmiZJ2WuYqkcugfFDfK6qW1O4YVuwiI9c3lZl6n9//tfc9jIPV3V4N/XtyZUC0xYI3J0grU9Lw8pfAxUBIu7vaDqRZmWqaP6p45JqtzeETaa+rx79FFZq5jqHcPVQfkXh+ETePPvSJ92sIU3qer5Gd+76e2YmGDcJwHnB1tGJnCuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(31686004)(2906002)(36756003)(86362001)(38100700002)(31696002)(8936002)(53546011)(4326008)(8676002)(41300700001)(2616005)(26005)(6506007)(6512007)(6486002)(6666004)(66946007)(54906003)(66476007)(478600001)(66556008)(5660300002)(83380400001)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eldjYzB0UEM0bHlXcGRVd1VxeU9BejVlMW1uMEVVeGJraGd6MTNEV2UyazFR?=
 =?utf-8?B?eFp0cFhucjhmcmMyYS82SzJFUWdBejluUVlMRlZVK293MXVkdTZSeHVUOWFy?=
 =?utf-8?B?NTJpRkM0V2trY2VYZlNnTGQxWFF3N3dWcDFyWncyYjVSakpQUHh2aUlGV3R4?=
 =?utf-8?B?ZHFUL0xNdFllc1BXdWNNT2YvZGhPRndWRy9mWEN2ZGxiazJLcVhFcWZRclZ0?=
 =?utf-8?B?MjU4cWszNkd3YWRKSE53YlVKK0E1cHhFbzk4ZGVqa2pKMkpJZ2tlOUdKZkdM?=
 =?utf-8?B?VG90R0xkQVkxanRDZGZXSWVSakRqKzBrR3k0VUpSUldJazNMS2RZQ29NVTE1?=
 =?utf-8?B?endGS01GWkhCaFFBZGRPMUNmUXFhdVVZTDNiZS9QNjJnM1BCYVhEYzRLbG1S?=
 =?utf-8?B?WXQvU3VWVTNaN25SVEI5R3BTbkY4Y2RJYmxxd3g5ZWNIY1B6c1puVXloeGNK?=
 =?utf-8?B?WnpzZnlQQmpaaVJqLzN5ODkyL2NGQkhmT3RqNjNtYkg0OXc2ZVdUQmpaT2sx?=
 =?utf-8?B?ZHhlR2J0MGJlVE4yeW1oYjVVK0xFWGZiQzh5VUdZVW5VbXg0ZForZG5PNHkx?=
 =?utf-8?B?Nk1tM0s2aWpTaWowQXFyODFvWHplclpyb05kUDIyT3dKb3JsQy9lMjZLbFVh?=
 =?utf-8?B?WDNEdW83WWF6TUQvNlRYeERObVZtVlBoQWJsOUpoUlJyMmc5TFAycE8vTUFk?=
 =?utf-8?B?T1krcDlPT1dEYlZUR3g0clg3RnFCb0NwYUpsKzBoY1VyVFhLRlhVdjRETW1Y?=
 =?utf-8?B?YzFVK3AxeTR3Szc1N0JQeTAyVS9PRlk0RXV5Qjl2VVZhZ0ZyQXFNTTZ0S0JL?=
 =?utf-8?B?QjV3YWE0Q0lOdDVjK3F3cGEyU0FRcU1HRnBtUTJXMkoxMzk3a2ZYZnpXZ00w?=
 =?utf-8?B?eTdSTkxadkR1WGJyL014Ni9hUWlCSHNMbWcrL28zanl1Njk3MHo5SDdYQjd4?=
 =?utf-8?B?Ym5sd0lJN05ielZjdkRMYzlvQ1Radnd3SlM3MkdLYTF6Zkw4OWN2UzdmaVgr?=
 =?utf-8?B?OTBDU1o0enhKbkVEMTV1MlhqOVZpSTlRTUV6QTVOTVJ3Rms4bVlYTk1GcllX?=
 =?utf-8?B?djdjbDlDczE2dUlDSGxsK0VnTkc2Qll4K3p3Yk52Vm8xTkFheHV4dUJzZUx6?=
 =?utf-8?B?NlFnZ1pIc0VvemJkL2lsemxuY1BhTDI0ZjlvTHQ5a3hQRWthTlhNbWYzQ0N1?=
 =?utf-8?B?ZFJObkhoVUk5R2dzdDAxblRoMk8ya05SYVJGNEVQa016R1BDU0dyM2lWbVdm?=
 =?utf-8?B?QURFa3F1L3VmYjFvV2tkWVdWaU9qeGhlVjh6Y1UwQTVLSjcvanpZOU1NSzFX?=
 =?utf-8?B?a2RQV3NLSTU5S0IvRXhJRHUvY0Rkcm1IaklkRXRjQ1V3VjFwSGRLQVQxOWFt?=
 =?utf-8?B?MW80SzJMSDV0UEwyaGlBaGNYbjlSTzlJYTcrTFE5dnE5ckdNOE42U2k0R1Vn?=
 =?utf-8?B?MkJLZFp3QjlFNnhPOTNDRktBQzhJbXFmUlUwM1NHdzlaTCszUnJuWnk3WjVx?=
 =?utf-8?B?ckpRQ0RENXJWY1h1ZE9yWXNKeDVqSUVSRzlmMlpjZUhLMUd3WCt6THNWa01U?=
 =?utf-8?B?VndPMjhMM1c4aTdXb1dCR1dIandESzJyVTNEYkdPSmpTOHVyaVVWejdLWE1P?=
 =?utf-8?B?R293by9uTUs1b0htT0NpRGc5aGRIM25kRFpvaTJKZ2NERjRBeXNBb2pDYWpO?=
 =?utf-8?B?UmNLbUdPUndyTS9oeExZTjRmekkrTnkvMDRGb0FBTHdPWE1QZEg4Ym5qOUpY?=
 =?utf-8?B?ZkZZSzB0SitZdmRGUmVKY1E4cEQvVjd2a1RPRldIaC9NRW9tWCtOejVCK3Q4?=
 =?utf-8?B?UDFjdjFCZE9rak1qMWFOZFBOQjNvOTRMaXpkSzZLNjFBRlpKOGEyVDBIL3kx?=
 =?utf-8?B?Tm5DZG5kbXVTMXNFL2RmSlptZG9SbFgvNjVObmxOWXlVa2ZUYzRaWXNNdm45?=
 =?utf-8?B?aDdQdk0zais4Q1NDUk1GSFQvMWJNVFlGdVNzR1BPazIvenhKRklNdEZaZTln?=
 =?utf-8?B?dTBjZjdoQnJnSUZDNWUvWmFMa25SOXBaUVJ1bEF4OUJubjN2dkNTSE13N0NS?=
 =?utf-8?B?cElwY3AzcHoyWGhsUmwzdU9rRk80eDhROFVWWFAvendYWEZyT0ZyTlRad0JM?=
 =?utf-8?Q?+5ShD0za6AakloR2JbM5FA8Bi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd90285-aca5-41e8-724b-08dbb51f3904
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 12:36:31.0713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXdY4yOhVhx3XRDDhRohxhIjbMTlJIJM1s8UtXstnPVDv79teNchlh+k5aWispPMePgrji/Cs+1tQ5t/470pIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

On 13.09.2023 12:25, George Dunlap wrote:
> On Wed, Sep 13, 2023 at 11:05 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 13.09.2023 11:44, George Dunlap wrote:
>>> On Wed, Sep 13, 2023 at 8:32 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> Gcc13 apparently infers from "if ( old_cpu < new_cpu )" that "new_cpu"
>>>> is >= 1, and then (on x86) complains about "per_cpu(timers, new_cpu)"
>>>> exceeding __per_cpu_offset[]'s bounds (being an array of 1 in such a
>>>> configuration). Make the code conditional upon there being at least 2
>>>> CPUs configured (otherwise there simply is nothing to migrate [to]).
>>>
>>> Hmm, without digging into it, migrate_timer() doesn't seem like very
>>> robust code: It doesn't check to make sure that new_cpu is valid, nor
>>> does it give the option of returning an error if anything fails.
>>
>> Question is - what do you expect the callers to do upon getting back
>> failure?
> 
> [snip]
> 
>>>  Would it make more sense to add `||
>>> (new_cpu > CONFIG_NR_CPUS)` to the early-return  conditional at the
>>> top of the first `for (; ; )` loop?
>>
>> But that would mean not doing what was requested without any indication
>> to the caller. An out-of-range CPU passed in is generally very likely
>> to result in a crash, I think.
> 
> If it's only off by a little bit, there's a good chance it might just
> corrupt some other data, causing a crash further down the line, where
> it's not obvious what went wrong.

In general I would agree. but __per_cpu_offset[] is quite special in
the values it holds. The data immediately following it would therefore
also need to have unusual values within relatively narrow a range for
a crash to not occur right away.

>  Generally speaking, passing an
> error up the stack, explicitly crashing, or explicitly doing nothing
> with a warning to the console are all better options.

I guess I'll go that route then, since ...

>>> I guess if we don't expect it ever to be called, it might be better to
>>> get rid of the code entirely; but maybe in that case we should add
>>> something like the following?
>>>
>>> ```
>>> #else
>>>     WARN_ONCE("migrate_timer: Request to move to %u on a single-core
>>> system!", new_cpu);
>>>     ASSERT_UNREACHABLE();
>>> #endif
>>> ```
>>
>> With the old_cpu == new_cpu case explicitly permitted (and that being
>> the only legal case when NR_CPUS=1, which arguably is an aspect which
>> makes gcc's diagnostic questionable), perhaps only
>>
>> #else
>>     old_cpu = ...;
>>     if ( old_cpu != TIMER_CPU_status_killed )
>>         WARN_ON(new_cpu != old_cpu);
>> #endif
>>
>> (I'm afraid we have no WARN_ON_ONCE() yet, nor WARN_ONCE())?
> 
> I think I was looking for `printk_once`.
> 
> If there's no reasonable way to fail more gracefully (or no real point
> in making the effort to do so), what if we add the following to the
> top of the function?  Does that make gcc13 happy?
> 
> ```
> if ( new_cpu >= CONFIG_NR_CPUS )
> {
>     printk_once(/* whatever */);
>     ASSERT_UNREACHABLE();
>     return;
> }
> ```

... this actually makes things worse (then the compiler complains about
old_cpu uses as array index), ...

> Or, if we feel like being passed an invalid cpu means the state is so
> bad it would be better to just crash and have done with it:
> 
> ```
>   BUG_ON(new_cpu >= CONFIG_NR_CPUS);
> ```

... and this, while it helps when then also done for old_cpu, seems too
hefty to me.

Just to mention it, 'asm volatile ( "" : "+g" (new_cpu) );' placed at
the right location also helps. That's effectively RELOC_HIDE(), which
we use to work around a gcc11 issue in the same area - see gcc11_wrap().

Jan

