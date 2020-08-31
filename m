Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80699257C3E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 17:25:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kClgB-0005Di-Gu; Mon, 31 Aug 2020 15:25:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kClgA-0005Dd-Q2
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 15:25:06 +0000
X-Inumbo-ID: 9de8e090-e41a-4be0-b0d6-1c24aefbfeaa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9de8e090-e41a-4be0-b0d6-1c24aefbfeaa;
 Mon, 31 Aug 2020 15:25:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E104B5AF;
 Mon, 31 Aug 2020 15:25:05 +0000 (UTC)
Subject: Re: [PATCH v2 5/8] x86/pv: allow reading FEATURE_CONTROL MSR
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-6-roger.pau@citrix.com>
 <3e260ee3-674b-82d2-d983-f17d3d91c230@suse.com>
 <20200831151204.GF753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f068e4bd-a73d-2507-b7de-27df566206ab@suse.com>
Date: Mon, 31 Aug 2020 17:25:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200831151204.GF753@Air-de-Roger>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.08.2020 17:12, Roger Pau Monné wrote:
> On Thu, Aug 27, 2020 at 05:53:16PM +0200, Jan Beulich wrote:
>> On 20.08.2020 17:08, Roger Pau Monne wrote:
>>> @@ -181,6 +182,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>          /* Not offered to guests. */
>>>          goto gp_fault;
>>>  
>>> +    case MSR_IA32_FEATURE_CONTROL:
>>> +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
>>> +            goto gp_fault;
>>
>> Can we really do it this way round, rather than raising #GP when
>> we know the MSR isn't there (AMD / Hygon)? I realized code e.g.
>> ...
>>
>>> +        *val = IA32_FEATURE_CONTROL_LOCK;
>>> +        if ( vmce_has_lmce(v) )
>>> +            *val |= IA32_FEATURE_CONTROL_LMCE_ON;
>>> +        if ( nestedhvm_enabled(d) )
>>> +            *val |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
>>> +        break;
>>> +
>>> +
>>>      case MSR_IA32_PLATFORM_ID:
>>>          if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
>>>               !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
>>
>> ... in context right here does it the same way, but I still
>> wonder whether we wouldn't better switch existing instances, too.
> 
> Hm, no idea really. Right now it seems better to check for != Intel
> rather than AMD | Hygon | Centaur | Shanghai, as that's a MSR specific
> to Intel.
> 
> Do those MSRs exist in Centaur / Shanghai?

I can't tell for sure, but I suppose they do, as they're (in a way)
cloning Intel's implementation. My thinking here is that by not
exposing an MSR when we should we potentially cause guests to crash.
Whereas by exposing an MSR that ought not be there fallout would
result only if the vendor actually has something else at that index.
And I'd hope vendors apply some care to avoid doing so.

Jan

