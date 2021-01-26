Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19BA3039AC
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74789.134448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L7H-0002OY-40; Tue, 26 Jan 2021 09:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74789.134448; Tue, 26 Jan 2021 09:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L7H-0002O9-0g; Tue, 26 Jan 2021 09:58:31 +0000
Received: by outflank-mailman (input) for mailman id 74789;
 Tue, 26 Jan 2021 09:58:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PjTf=G5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4L7F-0002O2-0o
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:58:29 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da359369-bbff-4ea0-893f-9b58ed252f4a;
 Tue, 26 Jan 2021 09:58:27 +0000 (UTC)
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
X-Inumbo-ID: da359369-bbff-4ea0-893f-9b58ed252f4a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611655107;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7STOWLQhgEHX2ZTlnXH87i/6Bw9ofZpoM5GzC5rxq1A=;
  b=DqcAoxg5gAllqKSMFltn509jPhV0pGoVWtC7XJw90q2PjQKTXXg9DDmy
   Y2R/q/nq/oMFy0BQ21mptAcEIzDtq31faCi8ShdqYGXIr37NE2rNyugUH
   gRZa5aXW6FZxUgt/k+hPmDgtgasX8AZIFjpPXXpUDPL9BA0D9UogG1kOx
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ty/NQCujsb1W1E+IbkQf9oVIraqt29M2Y8IOuklOPi3Z+MCVanar3c8lgY3sYGB6BkoM7DbUue
 9E3twG7jRmXIzlWuKzophmqCK7genh11FTG+KtFMWoRqaJkXO3c1/yG+FcqNQpMkMWi2P/8lmP
 kiE9xcaybLsCpReHYfPTSih/iBLZegvTmtFeVzGy6koVWINPLpmeOmFR9jC3pxE2R5qQkAYfC1
 jB1BFjbkxzVEFXbH1xZQOoPqYj/1I1vOIFbkb8exf7/vrnKTgmjRMVqBjrbmxWu4/5P0rfv97x
 Olg=
X-SBRS: 5.2
X-MesageID: 35899760
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35899760"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naSCju+ZG/nVC/K6TdiW3NB68k5STkLQ0vFMNxMkScqKeEApW25HkADQKq6iv87BBPOcxxSDeVCL2dXX+aPha6KiDdWfM0i4sxI+swGZnc5fV4lWzeI2Emo+rqEgiEI1S229K7c4uN1EyM09YTX9GzbiGMMwOgNO0IIX1K/PIhR4S7Ls5nWVIM3DvC9IVFHfZ3TvsCSFx9v2RD13zxu/z9FRHoaAzrNx5clIPKvAIgGijDvqkCpsLy2S709PZWTHTTXLGIwkRPohlHA7hzE0bJ09RKwJh2liR0q9quTNluhC/i7jVSoAWK43BCJvFiE426OdjQMMfZVCyEEobN0rAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh8LGUXY13zYdTuLIS2AhzP14yzJyDlF0eMc9LzLslU=;
 b=iJj6kB3m6LGOV4dArIb8VVXya9Ee+ZIZ0k8cG5IJoIKbnsvGuyV8+NmKioICrwbxCZZF2Kr1ICoehqvhXFzTIqaKyJB+5U/znJa3k4M7zB0N5RrP3IfGwLsJDAqMRJj8fZlL1fTKxTsg/KvLKZrIr9FWXja39eqT/azQWOFx95sEmvPNGM5KGTWmGoSqbqGMGiivIAaCQ6YPEBrEaOjNxhexLMt7OU27Van4h1ABLm21kCR/85rDdIDzNz+QSol5nzz6q0LoiwH2AqjD4ODH8H0MHaWs+roC3lJigZqwe9MXTYyyiBXl3W3phal52sirTqPvTpZHWJJAndQGQsN6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh8LGUXY13zYdTuLIS2AhzP14yzJyDlF0eMc9LzLslU=;
 b=jqf7yQPM0nMvy8+/QuVQ6+jCplqL1unDT96JMrCxz9djTa9uKdQJFzwFptqCMI0TVEgK2Ng+B+PRaYMitgLCkhoywlMFyRpR5KYPyGbalsW4WWH4taHYt+AHUE3wQOHQV0eIeKOHIoMhV/CQfMsnIj8kjP4tDGoSXk3Sd7UpWY0=
Subject: Re: [PATCH v7 04/10] xen/memory: Add a vmtrace_buf resource type
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-5-andrew.cooper3@citrix.com>
 <7702d1d6-86c9-af43-c9a9-f5ec082bad2d@suse.com>
 <226c4857-b0f7-f7f8-f353-e7331cce6e46@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d062a1cb-1a6c-8a9a-1ea0-c3eff941e870@citrix.com>
Date: Tue, 26 Jan 2021 09:58:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <226c4857-b0f7-f7f8-f353-e7331cce6e46@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::19) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8667b2b1-0775-4038-5e01-08d8c1e0ea89
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5696:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5696B794C18423073A50BF88BABC9@SJ0PR03MB5696.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Su8/PnR9DBaqLSIu8IYFMhwv5fUElwU1Z3u8d/Ud3OyDpdP9Ve0PPR9W/x+sKzU9Se4Q0o/wVdFOuPaXx6xcrRy0mRSo9R7o3kc7Xij/GZjR0DlkP4fRr/+Mz/SyRfXehT7v6b+RBM/7spy30mjV8PmIN15tU8ky1X03GeulwV3gYevAGNiJFv0tV6GQfk3ahH8imUIIpYBBP0O5LWw1P+5xD9S2BUo+v6rpl7WO4a9xzbFXKBJmbpIi/oUPIzd3LMjpK+RABDozRtTogFMzU7sKQ87mEsdbh1zRzp7ZWgGkFhcqRemuw/Ctd6XTr4urS3EtKHhY+9zKwLWg6lZiXAvg0dqG6fYwxXyAUssu43oLofp3P83l11Asag1zJfzGfPpnulMsB8DsjyerZCQjp64j48KwxIJLFU94HQH0IP79p5aAqxv7x/yQd/T0RXPpbp7ifzdiRIHoYAiZ+8fGy0b4vVWAorZbgX1+ZyPu4Ic=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(31686004)(5660300002)(956004)(6916009)(6666004)(2616005)(8676002)(31696002)(186003)(6486002)(16526019)(8936002)(66476007)(54906003)(26005)(4326008)(36756003)(478600001)(53546011)(86362001)(2906002)(16576012)(66556008)(66946007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RmFxMm4wRzU3ZGloVGdPb3JzbWhNTU9sZDFDdVN1K1d4M1FRRjdlVnVabjVq?=
 =?utf-8?B?M09URXB5bGdLNlZwM0wrbDhrcG8yQWxrRkZsYkhFV1dwQXZYeDlVN3VtZ0dz?=
 =?utf-8?B?Q0VOdkk5cWJ4YkZXbWVYZktERkRBZForbExlZTRUVHlvN2hVRFRhYlF4dUxm?=
 =?utf-8?B?d2FEZWFRUDVtaHRwSjRYQ2pRcUlMRW51V3plUmlrVTJlOXFnVUhkQ3RDQTkr?=
 =?utf-8?B?TVd3ZW9RVUpMbFVXOTNUT1M1TTh2aVJIRmFLTW9WYTE3Ylh2MmkyeUkzem40?=
 =?utf-8?B?ZmZaL0Zqdm5DYVozUHV0bS9FY0JWYmpDR2lMWU9SRHMvbnlSUUZlN0RKa0o1?=
 =?utf-8?B?SnVMeGs5TmRwSTlyeDhqK2pwL0UwMmhpZ0xoNldQdUpJK3llWk8xQ2tkTWFu?=
 =?utf-8?B?bXFZWWpIaFRtV2RHVjQ3TWM5ZmxLYkQ1bkhYOEFhZWhBejlJZTFZWW03VGpO?=
 =?utf-8?B?WFJkcFNuc2J0cVRDVitKb1NPdWpINnRzV3VtclpMUThTWU8zdEszSTJYVHB3?=
 =?utf-8?B?a0xrQXl2UHNUbHdycW9Uc25WM2w5WlBNWHladmc2T0Vzbk1lcnJCMW51bzZh?=
 =?utf-8?B?Y20wV0NCNlcrcGlhSENKSDdQQ2VBS0RWd0VLSi9wM2k5TzhjOVZ4eForL3l4?=
 =?utf-8?B?R1NmUkpMaE9xclNCSGdORi9McEswMzZLMEpwNlkvcE1HRWVFUVp5RUZ5OThn?=
 =?utf-8?B?U3ZWajEvN3lpY0ZIOUFBTDZVMnVSVlV2b20yaHRIcHlKbEdZdDMzN0p4SGkw?=
 =?utf-8?B?ZWpTWEMwdkxtNWdtbzE4bzN2emM2Kzk3Wm9KQmtGSmFvZG1OcW5hLzFKanBG?=
 =?utf-8?B?YW44cWsvbnRRMmJvaVFkaldKMDc5bmhiMnlDa09GUERZVGtlZ0lxTHh1ZVZ5?=
 =?utf-8?B?TmQ5emU1ZWUwOGVZRFgrWjZBWi91amNPZFhNcnMzMFJxTld6czJZVHhrVmFr?=
 =?utf-8?B?TTRuOXE4YSswT0gydjEySjFPZ3VKa0V3bW5xOG5ZRjhQeXM0Qlp5MFB2bUhU?=
 =?utf-8?B?N0pyUFphNnE5WHdpTERSZEhNUzIyL0RtNFEwWi9MN21USzdvRElzbVR1UXUw?=
 =?utf-8?B?bTExNXJRYWl1SXlrU3c3cWZvMkp6ZVNVYk14YjB0SHU1N2dPL3R5MU9tYlVG?=
 =?utf-8?B?L3R5YlBpUnpOcmlNU0g1aldtUDNxV3VoRExqb1EvNXNyRVN2SkwrbWJEaERo?=
 =?utf-8?B?aS9WZFJOeGpTNTJ1Y25aVzY5WVdoT1FUSG5uSVRxQmM4MC9jbUVQOUlvb2o3?=
 =?utf-8?B?Wm9hVG1nS2gvR25XaklNaXZDWEREOWFtWDYyQWsvc0t1MEJ4UkswRWRFVGs2?=
 =?utf-8?B?M0plNVVRZmdmcnRkQW92MG9ZVTZRakpTdlVzbzduWGZmeExzQytOaGhweFcz?=
 =?utf-8?B?dytXTFRZK0ExcjBoWEZhSy9lUWxDUE9oTDRvUUpHU1B5eVV3Y05XTkVWSTUx?=
 =?utf-8?B?NkFsajh4NDVtMHliSFF6ZWFibWpzT3JIQU1FeFlRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8667b2b1-0775-4038-5e01-08d8c1e0ea89
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 09:58:22.7049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLommMuKhw8woGE/6t5Y8X4lISHQ8d93u+/z/Lv2Mc+tdZL+8mbUrg+kAdqfyI0eLfEmQkVjaWAMo2bA73qZgRDochLiCJPifie9Yt3WYTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5696
X-OriginatorOrg: citrix.com

On 26/01/2021 07:37, Jan Beulich wrote:
> On 25.01.2021 17:31, Jan Beulich wrote:
>> On 21.01.2021 22:27, Andrew Cooper wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1068,11 +1068,35 @@ static unsigned int resource_max_frames(const struct domain *d,
>>>      case XENMEM_resource_grant_table:
>>>          return gnttab_resource_max_frames(d, id);
>>>  
>>> +    case XENMEM_resource_vmtrace_buf:
>>> +        return d->vmtrace_frames;
>>> +
>>>      default:
>>>          return arch_resource_max_frames(d, type, id);
>>>      }
>>>  }
>>>  
>>> +static int acquire_vmtrace_buf(
>>> +    struct domain *d, unsigned int id, unsigned long frame,
>>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>>> +{
>>> +    const struct vcpu *v = domain_vcpu(d, id);
>>> +    unsigned int i;
>>> +    mfn_t mfn;
>>> +
>>> +    if ( !v || !v->vmtrace.buf ||
>>> +         nr_frames > d->vmtrace_frames ||
>>> +         (frame + nr_frames) > d->vmtrace_frames )
>>> +        return -EINVAL;
>>
>> I think that for this to guard against overflow, the first nr_frames
>> needs to be replaced by frame (as having the wider type), or else a
>> very large value of frame coming in will not yield the intended
>> -EINVAL.
> Actually, besides this then wanting to be >= instead of >, this
> wouldn't take care of the 32-bit case (or more generally the
> sizeof(long) == sizeof(int) one). So I think you want
>
>     if ( !v || !v->vmtrace.buf ||
>          (frame + nr_frames) < frame ||
>          (frame + nr_frames) > d->vmtrace_frames )
>         return -EINVAL;
>
>> If you agree, with this changed,
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> This holds.

I slipped this buggy version in to prove a point.

You're now 3 or 4 attempts into "simplifying" my original version, and
have on at least 2 attempts made your R-b conditional on a buggy version.

This form is clearly too complicated to reason about correctly, and it
is definitely more complicated than I am happy taking.


I am either going to go with my original version, which is trivially and
obviously correct, or I'm considering reducing frame to 32 bits at the
top level to fix this width nonsense throughout Xen.

~Andrew

