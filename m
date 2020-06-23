Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4D8204C37
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 10:21:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jneBA-0000LN-SX; Tue, 23 Jun 2020 08:21:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O2Jt=AE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jneB9-0000LE-St
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 08:21:15 +0000
X-Inumbo-ID: 8139d6c0-b52a-11ea-bf26-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8139d6c0-b52a-11ea-bf26-12813bfff9fa;
 Tue, 23 Jun 2020 08:21:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 326CCADCA;
 Tue, 23 Jun 2020 08:21:14 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/msr: Disallow access to Processor Trace MSRs
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200619115823.22243-1-andrew.cooper3@citrix.com>
 <32440578-e346-85cc-abad-1aa5694f0ab2@suse.com>
 <855c1668-3f91-c084-70d5-76f3e171f074@citrix.com>
 <f2152e32-ab27-12d2-f82c-7108c0c9867b@suse.com>
 <d0b118e7-5c46-bebe-b8ec-c8ae06283529@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e20b9fb-7722-eac2-be73-81b40eb7c5ac@suse.com>
Date: Tue, 23 Jun 2020 10:21:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d0b118e7-5c46-bebe-b8ec-c8ae06283529@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 19:16, Andrew Cooper wrote:
> On 19/06/2020 14:39, Jan Beulich wrote:
>> On 19.06.2020 15:28, Andrew Cooper wrote:
>>> On 19/06/2020 13:48, Jan Beulich wrote:
>>>> On 19.06.2020 13:58, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/msr.c
>>>>> +++ b/xen/arch/x86/msr.c
>>>>> @@ -168,6 +168,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>>>      case MSR_TSX_FORCE_ABORT:
>>>>>      case MSR_TSX_CTRL:
>>>>>      case MSR_MCU_OPT_CTRL:
>>>>> +    case MSR_RTIT_OUTPUT_BASE:
>>>>> +    case MSR_RTIT_OUTPUT_MASK:
>>>>> +    case MSR_RTIT_CTL:
>>>>> +    case MSR_RTIT_STATUS:
>>>>> +    case MSR_RTIT_CR3_MATCH:
>>>>> +    case MSR_RTIT_ADDR_A(0) ... MSR_RTIT_ADDR_B(3):
>>>> The respective CPUID field is 3 bits wide, so wouldn't it be better
>>>> to cover the full possible range (0...6 afaict)?
>>> Last time I tried, you objected to me covering MSR ranges which weren't
>>> defined.
>> Wasn't that for a range where some number had been re-used from
>> earlier models (with entirely different purpose)?
> 
> I don't recall, but the answer isn't relevant to whether the MSRs at
> those indices ought to be available to guests.
> 
>>> If you want to extend the range like that, it ought to be
>>> MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7) to cover the entire area
>>> which seems to be exclusively for PT.
>> I'd be okay with that, just that I'm not sure about (7): While
>> SDM Vol 2 oddly enough doesn't seem to list anything for leaf 7
>> subleaf 1 (or I'm sufficiently blind today), Vol 4 clearly says
>> for n=0...3 "If CPUID.(EAX=07H,ECX=1):EAX[2:0] > <n>", and the
>> field obviously can't be > 7.
> 
> 7 gives the top of the bank of MSRs.  It isn't related to CPUID data.

Well, okay - let's go that route then?

Jan

