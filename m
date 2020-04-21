Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0248F1B1E9A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 08:10:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQm6Q-00084l-Dw; Tue, 21 Apr 2020 06:09:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQm6O-00084g-GB
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 06:09:48 +0000
X-Inumbo-ID: b34537ec-8396-11ea-9100-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b34537ec-8396-11ea-9100-12813bfff9fa;
 Tue, 21 Apr 2020 06:09:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 357C6AAC7;
 Tue, 21 Apr 2020 06:09:45 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/pv: Compile out compat_gdt in !CONFIG_PV builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-4-andrew.cooper3@citrix.com>
 <3c8eee8d-c2ce-d262-4056-a5d2c9f843cb@suse.com>
 <acffe7f9-3265-e999-34ce-30891535897b@citrix.com>
 <cb6fcbd0-1b0a-d105-30ce-e0a6215f4904@suse.com>
 <e5a208df-94f0-56e7-e801-06fb0933f02e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c4a05ba-825f-f9c7-5ef2-0d97f1a59870@suse.com>
Date: Tue, 21 Apr 2020 08:09:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e5a208df-94f0-56e7-e801-06fb0933f02e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 19:08, Andrew Cooper wrote:
> On 20/04/2020 16:47, Jan Beulich wrote:
>> On 20.04.2020 16:39, Andrew Cooper wrote:
>>> On 20/04/2020 15:12, Jan Beulich wrote:
>>>> On 17.04.2020 17:50, Andrew Cooper wrote:
>>>>> There is no need for the Compat GDT if there are no 32bit PV guests.  This
>>>>> saves 4k per online CPU
>>>>>
>>>>> Bloat-o-meter reports the following savings in Xen itself:
>>>>>
>>>>>   add/remove: 0/3 grow/shrink: 1/4 up/down: 7/-4612 (-4605)
>>>>>   Function                                     old     new   delta
>>>>>   cpu_smpboot_free                            1249    1256      +7
>>>>>   per_cpu__compat_gdt_l1e                        8       -      -8
>>>>>   per_cpu__compat_gdt                            8       -      -8
>>>>>   init_idt_traps                               442     420     -22
>>>>>   load_system_tables                           414     364     -50
>>>>>   trap_init                                    444     280    -164
>>>>>   cpu_smpboot_callback                        1255     991    -264
>>>>>   boot_compat_gdt                             4096       -   -4096
>>>>>   Total: Before=3062726, After=3058121, chg -0.15%
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> ---
>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>> CC: Wei Liu <wl@xen.org>
>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>>
>>>>> The increase in cpu_smpboot_free() appears to be a consequence of a totally
>>>>> different layout of basic blocks.
>>>>> ---
>>>>>  xen/arch/x86/cpu/common.c |  5 +++--
>>>>>  xen/arch/x86/desc.c       |  2 ++
>>>>>  xen/arch/x86/smpboot.c    |  5 ++++-
>>>>>  xen/arch/x86/traps.c      | 10 +++++++---
>>>>>  4 files changed, 16 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>>>>> index 1b33f1ed71..7b093cb421 100644
>>>>> --- a/xen/arch/x86/cpu/common.c
>>>>> +++ b/xen/arch/x86/cpu/common.c
>>>>> @@ -752,8 +752,9 @@ void load_system_tables(void)
>>>>>  
>>>>>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>>>>>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
>>>>> -	_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
>>>>> -			 sizeof(*tss) - 1, SYS_DESC_tss_busy);
>>>>> +	if ( IS_ENABLED(CONFIG_PV32) )
>>>>> +		_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
>>>>> +				 sizeof(*tss) - 1, SYS_DESC_tss_busy);
>>>> Wouldn't this better be "if ( opt_pv32 )"? Also elsewhere then.
>>> Doing it like this specifically ensures that there is never a case where
>>> things are half configured.
>> But this way you set up something in the GDT that's never going
>> to be used when "pv=no-32". Why leave a TSS accessible that we
>> don't need?
> 
> Defence in depth.
> 
> Having it only partially set up is more likely to fail in a security
> relevant way, than having it fully set up.

Well, I'm not convinced, but anyway
Acked-by: Jan Beulich <jbeulich@suse.com>

> This particular example is poor.  There is no need to have the TSS in
> either GDT after the `ltr` instruction at boot for 64bit, because we
> don't task switch, but ISTR you requesting that this stayed as-was for
> consistency.  (For 32bit Xen, it was strictly necessary for the #DF task
> switch to work.)

Well, I'm simply of the opinion that what the TR holds should point
to something valid in the currently active GDT. (As an alternative
we could decide to zap TSS descriptors from _both_ GDTs once we're
past the LTR. This wouldn't even conflict with resume from S3, as
we re-write the TSS descriptors immediately ahead of the LTR.)

> However, the other logic, particularly the cached l1e pointing at the
> percpu compat_gdt is more liable to go wrong in interesting ways.

Possibly, yes.

Jan

