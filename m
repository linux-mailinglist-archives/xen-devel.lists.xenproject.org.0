Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA68A2312C0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 21:33:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0VLq-0007a0-PP; Tue, 28 Jul 2020 19:33:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qgq5=BH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0VLp-0007Zv-Lz
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 19:33:25 +0000
X-Inumbo-ID: 33d952c0-d109-11ea-8bca-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33d952c0-d109-11ea-8bca-bc764e2007e4;
 Tue, 28 Jul 2020 19:33:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22661AD5B;
 Tue, 28 Jul 2020 19:33:35 +0000 (UTC)
Subject: Re: [PATCH 2/4] x86: reduce CET-SS related #ifdef-ary
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <58615a18-7f81-c000-d499-1a49f4752879@suse.com>
 <5abaf9e1-c7ba-a58c-d735-47430013eb65@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3eb260b-e9e8-1178-828e-73eb119a01ba@suse.com>
Date: Tue, 28 Jul 2020 21:33:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5abaf9e1-c7ba-a58c-d735-47430013eb65@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 16:29, Andrew Cooper wrote:
> On 15/07/2020 11:48, Jan Beulich wrote:
>> Now that I've done this I'm not longer sure which direction is better to
>> follow: On one hand this introduces dead code (even if just NOPs) into
>> CET-SS-disabled builds. Otoh this is a step towards breaking the tool
>> chain version dependency of the feature.
> 
> The toolchain dependency can't be broken, because of incssp and wrss in C.
> 
> There is 0 value and added complexity to trying to partially support
> legacy toolchains.

Complexity: Yes. Zero value - surely not. I'm having a hard time seeing
why you may think so. Would you mind explaining yourself?

>  Furthermore, this adds a pile of nops into builds
> which have specifically opted out of CONFIG_XEN_SHSTK, which isn't ideal
> for embedded usecases.
> 
> As a consequence, I think its better to keep things consistent with how
> they are now.
> 
> One thing I already considered was to make cpu_has_xen_shstk return
> false for !CONFIG_XEN_SHSTK, which subsumes at least one hunk in this
> change.

One is better than nothing, but still pretty little.

>> --- a/xen/arch/x86/x86_64/compat/entry.S
>> +++ b/xen/arch/x86/x86_64/compat/entry.S
>> @@ -198,9 +198,7 @@ ENTRY(cr4_pv32_restore)
>>   
>>   /* See lstar_enter for entry register state. */
>>   ENTRY(cstar_enter)
>> -#ifdef CONFIG_XEN_SHSTK
>>           ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
>> -#endif
> 
> I can't currently think of any option better than leaving these ifdef's
> in place, other than perhaps
> 
> #ifdef CONFIG_XEN_SHSTK
> # define MAYBE_SETSSBSY ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
> #else
> # define MAYBE_SETSSBSY
> #endif
> 
> and I don't like it much.

Neither do I. Then we'd also switch STAC/CLAC to MAYBE_STAC / MAYBE_CLAC.

> The think is that everything present there is semantically relevant
> information, and dropping it makes the code worse rather than better.

Everything? I don't see why the #ifdef-s are semantically relevant
(the needed infor is already conveyed by the ALTERNATIVE and its
arguments). I consider them primarily harming readability, and thus I
think we should strive to eliminate them if we can. Hence this patch
...

Jan

