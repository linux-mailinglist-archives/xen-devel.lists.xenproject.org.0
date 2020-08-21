Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F305E24D6E1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 16:04:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k97dU-0002sY-9Z; Fri, 21 Aug 2020 14:03:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=82JZ=B7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k97dT-0002sT-5g
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 14:03:15 +0000
X-Inumbo-ID: 9391f03d-81f7-4014-969e-c9a546a2ba8e
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9391f03d-81f7-4014-969e-c9a546a2ba8e;
 Fri, 21 Aug 2020 14:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598018594;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=iPzVEsij/UXgy0eSwaTiFj8hym9nS7g2x1ik8PvZnEg=;
 b=Dri0I/ESwnoKduqIXUyxqs0gXacCeOapZnhyd9yauhWmZlPAoyV8RYHP
 XBguPl4esnW0xpWMw4c8WDMlZC3NltE/RAOSaGSJgkknlJ3ZeLYKvntb4
 LlTlL+6cuIZDYM0zyaSyni2zydJEDAvIt5lruPsd7a+aM25JyaAQSrMMa A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1ZApCi+qDtzyh6Sb6w/Tn1jdVrsj019rH02zxPzO6oEGgwkqAUn8qCFoP0/4dWGI/lVyUKb7Ua
 QlsEQQkEtht/0UG0FIDqFHRoY9Untpx5WUu2rgEDejqnxqvqvwlB/krfWIkiZZfiYBzWhg39MX
 sboc2unY0RE3+V8/pw2FOISF493Gkz2snOmWLBFU2JPQAT2DZc1MP1VoRHzgIbD+1b6BURs4hZ
 TZms6sqSyBJGKX3FqeHtvnUAus3TcPmVY6PZ8OO3P05EAl42O+JhU+yosvLlMigu7yPAmufQiZ
 tyM=
X-SBRS: 2.7
X-MesageID: 25043548
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,335,1592884800"; d="scan'208";a="25043548"
Subject: Re: [PATCH v2 3/8] x86/msr: explicitly handle AMD DE_CFG
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-4-roger.pau@citrix.com>
 <50eef25c-8054-89e7-3b83-a233a0faa6f8@citrix.com>
 <20200821115218.GA1587@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <587e06b2-17f7-918d-1aad-fe14bc90f4f5@citrix.com>
Date: Fri, 21 Aug 2020 15:03:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821115218.GA1587@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/08/2020 12:52, Roger Pau Monné wrote:
> On Thu, Aug 20, 2020 at 06:08:53PM +0100, Andrew Cooper wrote:
>> On 20/08/2020 16:08, Roger Pau Monne wrote:
>>
>>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>>> index ca4307e19f..a890cb9976 100644
>>> --- a/xen/arch/x86/msr.c
>>> +++ b/xen/arch/x86/msr.c
>>> @@ -274,6 +274,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>          *val = msrs->tsc_aux;
>>>          break;
>>>  
>>> +    case MSR_AMD64_DE_CFG:
>>> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
>>> +             !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
>>> +                                           X86_VENDOR_HYGON)) ||
>>> +             rdmsr_safe(MSR_AMD64_DE_CFG, *val) )
>>> +            goto gp_fault;
>>> +        break;
>> Ah.  What I intended was to read just bit 2 and nothing else.
>>
>> Leaking the full value is non-ideal from a migration point of view, and
>> in this case, you can avoid querying hardware entirely.
>>
>> Just return AMD64_DE_CFG_LFENCE_SERIALISE here.  The only case where it
>> won't be true is when the hypervisor running us (i.e. Xen) failed to set
>> it up, and the CPU boot path failed to adjust it, at which point the
>> whole system has much bigger problems.
> Right, the rest are just model specific workarounds AFAICT, so it's
> safe to not display them. A guest might attempt to set them, but we
> should simply drop the write, see below.

Most of the layout is model specific.  It's only by chance that the
LFENCE bits line up in all generations.

The bit used to work around Speculative Store Bypass in LS_CFG doesn't
line up across generations.

>>> +
>>>      case MSR_AMD64_DR0_ADDRESS_MASK:
>>>      case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
>>>          if ( !cp->extd.dbext )
>>> @@ -499,6 +507,12 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>>>              wrmsr_tsc_aux(val);
>>>          break;
>>>  
>>> +    case MSR_AMD64_DE_CFG:
>>> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
>>> +             !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>> +            goto gp_fault;
>>> +        break;
>> There should be no problem yielding #GP here (i.e. dropping this hunk).
>>
>> IIRC, it was the behaviour of certain hypervisors when Spectre hit, so
>> all guests ought to cope.  (And indeed, not try to redundantly set the
>> bit to start with).
> It seems like OpenBSD will try to do so unconditionally, see:
>
> https://www.illumos.org/issues/12998
>
> According to the report there returning #GP when trying to WRMSR
> DE_CFG will cause OpenBSD to panic, so I think we need to keep this
> behavior of silently dropping writes.

/sigh - there is always one.  Comment please, and lets leave it as
write-discard.

As for the vendor-ness, drop the checks to just cp->x86_vendor.  There
is no boot_cpu_data interaction how that you've taken the rdmsr() out.

~Andrew

