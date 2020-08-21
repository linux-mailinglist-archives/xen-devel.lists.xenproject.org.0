Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24D024CE34
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 08:48:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k90pr-0004QV-Vt; Fri, 21 Aug 2020 06:47:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kxmg=B7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k90pq-0004QQ-Lj
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 06:47:34 +0000
X-Inumbo-ID: d7295766-fe93-4e97-8fb5-ab65bf52c994
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7295766-fe93-4e97-8fb5-ab65bf52c994;
 Fri, 21 Aug 2020 06:47:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55F39ADC1;
 Fri, 21 Aug 2020 06:47:59 +0000 (UTC)
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
 <8b0e088c-baa9-93db-02f8-369acb008b69@suse.com>
 <CAMmSBy-dfc4PsYvmK+-=gTVqZbCsNUM=T_DVUC+aFU=riDrkpg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e26e305-18f7-5ebc-1c8c-0e46f12d8f11@suse.com>
Date: Fri, 21 Aug 2020 08:47:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-dfc4PsYvmK+-=gTVqZbCsNUM=T_DVUC+aFU=riDrkpg@mail.gmail.com>
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

On 20.08.2020 21:31, Roman Shaposhnik wrote:
> On Thu, Aug 20, 2020 at 1:34 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 20.08.2020 00:50, Roman Shaposhnik wrote:
>>> (XEN) Unknown cachability for MFNs 0xff900-0xfffff
>>
>> The fault address falling in this range suggests you can use a less
>> heavy workaround: "efi=attr=uc". (Quite possibly "efi=no-rs" or yet
>> some other workaround may still be needed for your subsequent reboot
>> hang.)
> 
> I just tried and efi=attr=uc and it is, indeed, a workaround. I can get to
> Dom0 booting far enough (and then I hit the other issue).
> 
> However, since efi=attr=uc has always struck me as a bit of a hammer
> still I tried the good ol':
>      https://lists.archive.carbon60.com/xen/devel/408709
> 
> And then Xen crashed in an interesting way (see below). Now, this
> is with CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP -- so not sure
> if it is related.

Why "interesting way" - it's the same as before, you're
hitting the range reported by "Unknown cachability for MFNs
0xff900-0xfffff"

>> As far as making cases like this work by default, I'm afraid it'll
>> need to be proposed to replace me as the maintainer of EFI code in
>> Xen. I will remain on the position that it is not acceptable to
>> apply workarounds for firmware issues by default unless they're
>> entirely benign to spec-conforming systems. DMI data based enabling
>> of workarounds, for example, is acceptable in the common case, as
>> long as the matching pattern isn't unreasonably wide.
> 
> Well, default is overloaded. What I would like to see (and consider it
> a void of a small downstream/distro) is a community-agreed and
> maintained way of working around these issues. Yes, I'd love to see
> it working by default -- but if we can at least agree on an officially
> supported knob that is less of a hammer than efi=attr=uc -- that'd
> be a good first step.
> 
> Makes sense?

Sure, just that I don't see what less heavyweight alternatives
to "efi=attr=uc" there are (short of supplying an option to
provide per-range memory attributes, which would end up ugly
to use). For the specific case here, "efi=attr=wp" could be
made work, but might not be correct for all of the range (it's
a EfiMemoryMappedIO range, after all); in the majority of cases
of lacking attribute information that I've seen, UC was indeed
what was needed.

Jan

