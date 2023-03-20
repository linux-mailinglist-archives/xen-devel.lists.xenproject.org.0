Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D586C19F3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 16:40:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511983.791490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHc1-0000rJ-Oc; Mon, 20 Mar 2023 15:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511983.791490; Mon, 20 Mar 2023 15:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHc1-0000on-Is; Mon, 20 Mar 2023 15:39:53 +0000
Received: by outflank-mailman (input) for mailman id 511983;
 Mon, 20 Mar 2023 15:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peHc0-0000od-64
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 15:39:52 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe16::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 739ee765-c735-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 16:39:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8926.eurprd04.prod.outlook.com (2603:10a6:102:20d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 15:39:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 15:39:44 +0000
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
X-Inumbo-ID: 739ee765-c735-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbvZsAizaTIMn5F+/JKvT5yW5n5aMhoaL24RCwzBURxINMNyVN6mehKCMAN4ZV5CBbgYJoInZsoIPjiVvJ6rq2cpLNTYQ4vdeFRm3zY79t4Nk82CjZumWHughsD2aAkQ7Kn17eV1uhCBPEU2zekcpW+qPwMq/wy8MQaPTUjCckZ9t03QGXUgrzFg+7VfwtMyuHslzgp6YOzZnbWztqs0J9PFvaHWKGfDvI+z/LjQUWLH8cjcS7MSE1RoVvUXLUZxXUiy9OKSjQCU47gYPHN6X7Jue4R3x6O0gD6SyDt8lTK6hbKerWKF+ib7lcZWOXsSzvDv1u5I0oZOtg6Xx00JJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR9n7oQ6webP7Wzvmt7oADorvrNzqo0kEmiYBKy4PTw=;
 b=PVraYNrAqtUbXCxM160uRKMBwJpCaZiAXAg78Z6vwfH+VSQ8SmOgCz5VDAITqJNt+8rdDjttpR+kQVjdF6BRKH4Z9juof9dt8Gsrl8TamMLjEB7S7Khb3CVjEEJ0aucD7bEyVKID61XYCGWbucgHkHob5lNXpkbLhpHoH6bWn6Kxqgk+et794l4j3TcPR6VEuP7rK48ExTwsIgHvYqqBPxXa088Sz6r2QeImReK1zB7ndLgAyiqEbh3BzxNSILn8rCw4mCaQgbQDCAklTJ9/ubwH+KtcIJjA1nYvM3bM7qemOQYnC9b6B2iHb8y5KwnDMZe5EIhflHuzNvMFVLjctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR9n7oQ6webP7Wzvmt7oADorvrNzqo0kEmiYBKy4PTw=;
 b=FGU4vb5TDm1rvAh6UfL3MMVK/m3kcK25Cdg40yIks1yVu3XEPxMw7FJSeA8IOOaOmEJNX5FGztWLxm180RlYUDV282Pz61TErAbdA6nd6lQTVROpdYkplr2OsxlP9VSvVOY3N52ehsT4Mu+Kb0x27BYx4rmwIE9k1FUe8oImB7IXXHrCRvv/190uy0QcRaO7Y/ekAtnONVT8YFxemDLJtOCwbzO/8g7WaAGi4SMXsl7oBpp89m8aDA5u6oUxaN2p8HbE5luj8Y1HOWR/9rRFqhVusO27bBXPZ8jTcy1HZ6roK8zlhRD18nE1whz+npZ7SvJquGP9/MLCLYIftGBSJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b62c34e-5013-50ba-b218-925fe4eb6c0d@suse.com>
Date: Mon, 20 Mar 2023 16:39:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] x86/APIC: modify error_interrupt() to output using
 single printk()
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1679084101.git.ehem+xen@m5p.com>
 <4db49e192b6829e520cf497481a51deef227b23b.1679084101.git.ehem+xen@m5p.com>
 <f945860e-6a82-7070-3a1b-2e73a53040de@suse.com>
 <ZBhtzfhumm9AWqte@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBhtzfhumm9AWqte@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 8247be91-fa91-4e4f-86e6-08db295953ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i4vP8RdLWwnze08xK6ANvrOr945Gq8O0ZBlD09Cj4Z1J51CI+xuKiSGaD1gNJZsbj9Bb5GMP/rXbB0eDbr/lAm8NmVHxRNopwErV+Pp+tz8FjDBJW+0Xqz+VIWUcmF/0k8dqSBkzpaN/ppNwlHdZZYFXZQuvoAIXAQr1PNhLZLADbJiBq7AmZYirRxCdD91I/oT4qwnXbCGs79NgKaBmWwAuQMRkPNqN7JIxKeft8AlSvxdGCse9Yy4oZhsi8KZAJtoZYB1JgwkmDo/6t77KfYszGTyzqe4ozYJnEbLPdDuskr/6H2Eb3wp1dyvM7nh5nMvAVW3V9gL9U/3FCWTBPVTNdgXcdIKMZWOhfyTDBD/qvWuX2EdXqw92sSuQcsZlhqDZERIRHpoRu0j4uxIYRnPBeUCymlox5iI47RxjlDFRkaGdJ/r0/kfmF3uhRpN15DtrM3ZAitF0q78jEVaIYv7BMaKJqMukqzAGzFx6AuqSVAo7h8b9BPzjecHYzdxhZ9P/i8ivmG8ukqhFnePtRgdECCIfV7OQb6ZPyOHCqtzke3Ppu6a+jFXsULZdpKTQKqmmmyjA82uCWAQ4rEF9D1sMlO3+e2LUYvHIKl+nH8GKJPqanR5Ha7AuU1GfLVPOaVY2/h7LPHkSy9PDiBhhx3zmHajYOSTd5jxNUWFDe4K0I+NOCfpj1XwnjiUBDhtsiII5nI/AEC3ohifhBb0nGdI1LdJoz99BK2DdwkYZQbg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(376002)(39850400004)(136003)(396003)(451199018)(31696002)(86362001)(36756003)(4326008)(316002)(8676002)(83380400001)(478600001)(66946007)(186003)(54906003)(966005)(66476007)(66556008)(26005)(6512007)(53546011)(2616005)(6506007)(31686004)(6486002)(38100700002)(5660300002)(2906002)(8936002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE51eFVPVlZMai9tSENmamd3d0FtWWg4MUVpRTB0WjdsVk5mSnJKN003eHBW?=
 =?utf-8?B?VmJYRFNub1c1T2ZtR0FBTmJsQUthK0swbEcxb2x6L3dySHlQUGJ6SlFrc3Bj?=
 =?utf-8?B?bm1ZZWxTZUdGQXF2V3lyWTFkY3BsUkVRY3Z2YXI0NjNNTnU4QWNQTVdhUlpK?=
 =?utf-8?B?cVRPeDN3S3VHbjh1QldlakFZb0RZOXhITS9GOWVzQlVZdERUOXRLWjgybDN5?=
 =?utf-8?B?K1QwVGoySzNxRWJWSVErVDFoRGhtZG1XY2lUZnUxdzQybzg1bm9QaGlsaHBU?=
 =?utf-8?B?OVVRblVDTGY1NlVzSnY1d3BZT05JREhxNk4yN05Sb3g5YVRjbTJYZXJxTVZl?=
 =?utf-8?B?Njc5N2g5RFdXUU5zMWtldmZmWlpJR2JBdHhXWm5GRDJjNGY5MW9NOUdkVUox?=
 =?utf-8?B?MUdqYVNtV2xxVHc0UTYrUERVSjFBNEoxYUlzSDFidnRONmNBZW9qYzNjekNZ?=
 =?utf-8?B?ZzF5TEF6cVU5VVVVOFFXVTM2bTFZL2lEK2RJSktQZWZFMmVoakNJWFVzWmdz?=
 =?utf-8?B?T0dWU3dzUjE2K0hacW85VlRYNEFpWG9mSTJsNnJEYVlna1BhdmIvVDlUMVVV?=
 =?utf-8?B?Qm9Ic2lybFVmRGt3OWY1UTgvcHQvM3BONDdzOElsQ2ZxdWVKUkNVU3ZVaVZP?=
 =?utf-8?B?R2QyWExhS1VkbllJeWJySVBGcFovTFF6bFlWOTdSQVp3SGU3R0RadUhDU2p3?=
 =?utf-8?B?WmxnUmR1V2tHOXRPbGJoZWNVdC9KNjdEUmZxVHZXUE8xQVF0ZzBIUDJQZjA4?=
 =?utf-8?B?eFVUelVRaUMrYVlEKzlXeXdmbXNJZzlRT21tNWlKcVZETVJnZk5SZkUrbnNl?=
 =?utf-8?B?S1hSd0p6dWVtNGdaOWNhMUczb2hjdjFQMzI0c3FzMEtIODlyaHlmenhMdVRw?=
 =?utf-8?B?MDBScmtVV1JKMTd3ZzhpZjI1d01MbE0yWEpEek56SVNpdmxqUHJuVVNjL2dk?=
 =?utf-8?B?L1VodnBONUZxUklyNGFwTW4rS1o5Ym9HNnlhWUcvdlZsd2tWVDNyYU4zemNP?=
 =?utf-8?B?OVQ1emZuZ3h3ZjFBcEdLdHFxVDRoaS9Ga0RKVjcwR0Q4enhJV1BXY20xZ1hi?=
 =?utf-8?B?YldraGxHUjU2OGE3RHJpNnNGNmI4YitaUFh0Sk9XSk96d3pHRE5MaUhXVmc0?=
 =?utf-8?B?SE9zT1dCVDBKM1pTUjlKY3A3N2p5TFNwNndibG1OVkpaQWFMb04xd2RTeG5V?=
 =?utf-8?B?aUVteHJIY3FSRnUxK1NaY016eUhvOEZDVUdpQXUydE53Nmo3UndJVHBFUm9B?=
 =?utf-8?B?VmQ2N0NNR0ViWVZFajl4OUJndkNraVFlZ3FWU3AyMDNMSUNBbHlIQkVxR25B?=
 =?utf-8?B?blhJeDZmYktpQjhCQ3RGRjBkWEREeEN3amlXK1gwNUZMNnZYWWYwbUs1Rllp?=
 =?utf-8?B?cHNKbEhwbGdaY3VYYzlYRmVKYm5aa2lKVjZKZmRFTjR1UkZNa1JrK09OWnlW?=
 =?utf-8?B?TEp0RzZ1bzZSS2M4bHhydVdEY0RWeDJ4ZUcycktxc1ltVVFXdWpMZkZhOUI5?=
 =?utf-8?B?WUpsZU1sL25pbE4yWXBrWG04OE8xMEZKWEoxYXBBVTRYaEtHV2RWeXFtMkRX?=
 =?utf-8?B?Zksra1RFakc1ZlRMNitNR3dUTFY1SVArNzEranNHWk1hN1M4TDY2b2VBSk1z?=
 =?utf-8?B?R1RNaGFjUklETUlrMnNvTTdtdWoxZi9Zd2UrcHkvQlY0Uk1ZN2lZdHZacG5l?=
 =?utf-8?B?Ry8zdGo4cGZCOXBDYWtPcFphcGJONHJSZWNvL2VIb1BrZkRlQ3dwczgrSkVM?=
 =?utf-8?B?WVBmc1VjVnc3UmJPWjZQK2N1bDlKOE1Lbm1iU1ZmSlBseGJ1ejFZbDd3S3l0?=
 =?utf-8?B?dlJ5MHhPcVVQUTBLSWpQSVRYWUR1eHFpS25ibWtkc2xkb1A0VnBXTlpiMjcz?=
 =?utf-8?B?MnNJdDRmREFVa1J2WTcrSFAzQ05jWXN0SHE3YmloeVhOL3VxUjVkaURrWHlv?=
 =?utf-8?B?dXEwbEhUVmZ0QzNGdmR2RUUwOXRCMGF5ZFBON0RJUVZhVnhXOEwvNXVmQU9D?=
 =?utf-8?B?VmpjZWhpWEVjN0FpREpROXg3U0hCbDFtNzNsNGcvajM5Uy9KelpMdG9RZE9K?=
 =?utf-8?B?L3VLeE5qUUdhQmI1MzZja2RaZTdjMXF6T1FDMVlzMGxHdmMzY2Nzd242c2hy?=
 =?utf-8?Q?l6nzmIQVBbsALO4d9AV2Oo4bS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8247be91-fa91-4e4f-86e6-08db295953ed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 15:39:44.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbduSw85ajGag+LLdBFTyM6CwLml6uhGRMq3b3Xf2c44e/PAx/wVLyGZZJec9eBqd9UrA5la/xoszBnrlKx4ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8926

On 20.03.2023 15:29, Elliott Mitchell wrote:
> On Mon, Mar 20, 2023 at 09:56:54AM +0100, Jan Beulich wrote:
>> On 17.03.2023 20:53, Elliott Mitchell wrote:
>>> This takes care of the issue of APIC errors tending to occur on multiple
>>> cores at one.  In turn this tends to causes the error messages to be
>>
>> Nit: "at once"?
> 
> https://en.wiktionary.org/wiki/at_once
> 
> Adverb #2, synonym of "simultaneously".

And that's what you mean, I think? Not being a native speaker, I have no
idea what "at one" is meaning here.

>>> @@ -1419,12 +1420,12 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
>>>      v1 = apic_read(APIC_ESR);
>>>      ack_APIC_irq();
>>>  
>>> -    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)",
>>> -            smp_processor_id(), v , v1);
>>>      for ( i = 7; i >= 0; --i )
>>> -        if ( v1 & (1 << i) )
>>> -            printk("%s", esr_fields[i]);
>>> -    printk("\n");
>>> +        entries[i] = v1 & (1 << i) ? esr_fields[i] : "";
>>> +    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)"
>>> +            "%s%s%s%s%s%s%s%s" "\n",
>>> +            smp_processor_id(), v , v1, entries[0], entries[1], entries[2],
>>> +            entries[3], entries[4], entries[5], entries[6], entries[7]);
>>
>> Two style nits: Indentation wants fixing here (it was wrong in the original
>> code already), and the stray blank between v and the comma also wants
>> dropping at this occasion.
> 
> There are several minor issues here which may be best handled during
> commit as they're very small items about how precisely you want this to
> look.
> 
> First, I later realized I goofed the argument order.  In order to match
> the original implementation, it needs to be entries[7] ... entries[0]
> (could though be the low-order bits should be reported first).

I'm not really concerned of the order. A change of order wants
mentioning in the description though.

> Second, the order of the for loop no longer matters.  Using
> ARRAY_SIZE(esr_fields) and increment should now be more maintainable
> (this would also allow i to be unsigned).

Indeed. But that would better done in a separate patch then anyway.

> Third, I'm simply unsure how you would prefer to format the printk().

About any way matching style guidelines is okay. There are two more
things to mention though (sorry for not noticing earlier): We aim at
keeping the entire format string on one line, for grep-ability. And
there's no need (and in fact no reason) to split the sequence of %s
from the \n. To summarize:

    printk(XENLOG_DEBUG
           "APIC error on CPU%u: %02x(%02x)%s%s%s%s%s%s%s%s\n",

(unless of course it all fits on one line, which it looks like it
does).

Jan

