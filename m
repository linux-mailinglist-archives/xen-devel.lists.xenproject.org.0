Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8FC24D07D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 10:24:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k92Km-0005cI-Fl; Fri, 21 Aug 2020 08:23:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kxmg=B7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k92Kk-0005cB-9o
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 08:23:34 +0000
X-Inumbo-ID: f69dfab6-2142-4df7-92a3-8559ed9e25de
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f69dfab6-2142-4df7-92a3-8559ed9e25de;
 Fri, 21 Aug 2020 08:23:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A805AF3B;
 Fri, 21 Aug 2020 08:23:59 +0000 (UTC)
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
 <8b0e088c-baa9-93db-02f8-369acb008b69@suse.com>
 <CAMmSBy-dfc4PsYvmK+-=gTVqZbCsNUM=T_DVUC+aFU=riDrkpg@mail.gmail.com>
 <7e26e305-18f7-5ebc-1c8c-0e46f12d8f11@suse.com>
 <CAMmSBy8gJgZWGvgsiVd3Uo7egpyBY3_iw+cgMrcDehVPzRZ6ew@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b82d6d15-b006-52f6-c638-d95b72c08975@suse.com>
Date: Fri, 21 Aug 2020 10:23:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8gJgZWGvgsiVd3Uo7egpyBY3_iw+cgMrcDehVPzRZ6ew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 21.08.2020 09:38, Roman Shaposhnik wrote:
> On Thu, Aug 20, 2020 at 11:47 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 20.08.2020 21:31, Roman Shaposhnik wrote:
>>> Well, default is overloaded. What I would like to see (and consider it
>>> a void of a small downstream/distro) is a community-agreed and
>>> maintained way of working around these issues. Yes, I'd love to see
>>> it working by default -- but if we can at least agree on an officially
>>> supported knob that is less of a hammer than efi=attr=uc -- that'd
>>> be a good first step.
>>>
>>> Makes sense?
>>
>> Sure, just that I don't see what less heavyweight alternatives
>> to "efi=attr=uc" there are (short of supplying an option to
>> provide per-range memory attributes, which would end up ugly
>> to use). For the specific case here, "efi=attr=wp" could be
>> made work, but might not be correct for all of the range (it's
>> a EfiMemoryMappedIO range, after all); in the majority of cases
>> of lacking attribute information that I've seen, UC was indeed
>> what was needed.
> 
> I think we're talking slightly past each other here -- you seem to be
> more after trying to figure out how to make this box look like a dozen
> killobucks worth a server, I'm after trying to figure out what callsites
> in Xen tickle that region.

What I'm trying is to understand what exactly is wrong in the firmware,
as that'll likely allow determining a minimal workaround. Figuring out
the call sites is certainly also an approach, but the stack trace
provided isn't enough for doing so, I'm afraid. Even the raw hex stack
dump contains only two pointers into Xen's .text, and to figure what
they represent one would need the xen.efi that was used. Possibly even
a deeper stack dump might be needed.

> I appreciate and respect your position, but please hear mine as well:
> yes we're clearly into the "workaround" territory here, but clearly
> Linux is fully capable of these workaround and I would like to understand
> how expensive it will be to teach Xen those tricks as well.

My prime example here is their blanket avoiding of the time related
runtime services, despite the EFI spec saying the exact opposite.
"efi=no-rs" is just a wider scope workaround of this same kind. The
reasoning I see behind this is that if the time related runtime
services are problematic, how likely is it that others are fine to
use? And how would an admin know without first having run into some
crash? If there are fair reasons to have finer grained disabling of
runtime services - why not? But it'll still take a command line
option to do so, unless (as was proposed) a build-time option of
enabling all (common?) workarounds by default gets made use of.

> Now, whether you'd accept these tricks upstream or not is an entirely
> orthogonal question.

Well, I'd say "separate", not "orthogonal", because the nature of
such workarounds qualifies (to me) what is or is not acceptable as
default behavior.

Jan

