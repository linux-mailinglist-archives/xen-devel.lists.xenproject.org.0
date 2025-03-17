Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC99A64F43
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916815.1321842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9kM-0003tB-6T; Mon, 17 Mar 2025 12:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916815.1321842; Mon, 17 Mar 2025 12:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9kM-0003qm-36; Mon, 17 Mar 2025 12:39:10 +0000
Received: by outflank-mailman (input) for mailman id 916815;
 Mon, 17 Mar 2025 12:39:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tu9kL-0003qe-F7
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:39:09 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d158b4ea-032c-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 13:39:07 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so17680545e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:39:07 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe609a2sm103275555e9.30.2025.03.17.05.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 05:39:06 -0700 (PDT)
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
X-Inumbo-ID: d158b4ea-032c-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742215147; x=1742819947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yy7UblOdya72+AXgCbiP0q8d0JXaeV2NapHM3MGFX9w=;
        b=CTeC1+xBCyLF1vBE8xX/lRoI1mbY4GMyQHq9yGstsR0SD2FOkJ6oOkim3sWsisjCuq
         uewgKpUoY8CVOY7RwMoaD9UMs3Ig6pWk3QDABFY6OfFqdrOlRSSKNchrjRJVWfzXkk/Y
         iA12/1dfecc2sAnLvM/5/6WAvjUW+G1qfiQjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742215147; x=1742819947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy7UblOdya72+AXgCbiP0q8d0JXaeV2NapHM3MGFX9w=;
        b=KULaRPSvtciUW5BNszX4P7dpe4kWbuqq6Ukl+enhKNtH0d+kTx2vPiw0YxmlnI1Bbo
         cIMEdAvgY2bCf3IKLhcnLEG166hRfPw14IDoqxBm4ozD4GrlHthETerriT9Ghl9zQBQJ
         I14RXOH694sS4ZejkR+FdJXBrrVuQj8uds5a4DE1qKBmH1eXhw8yxDB6O59yKCHDubdW
         DtBfKxYhyVQ1UEl7YIGjlLTCx2YAPsTrguok0gWt51O8Y7BkQ/0h47PKyvZsN6QmzQGB
         4n86DgBXKCgg5Fl3eTXhk0U+5US4OD+/UEala6em0IixMWKpxNIvLZcEE/FZA79jX6Ue
         mR5g==
X-Gm-Message-State: AOJu0YwRpgp+s5TyqEhencrBWOQgZJTTPWV1OihOrEaGG4XdDzQzhBvZ
	lCKnoi7wNZXw3RoZBDL0Xvj7CFMCLDiRChjqmhKTYDLDqrnnb89TXLfJFvjEF2s=
X-Gm-Gg: ASbGncsyX8zk4+WgvGgYgsDMGlu/8bGvsB9m+zNux63CUFeZsHWJlW7nIeVuqbHJsYw
	f94W2O8KzxjWIl5INGezPuhI+lufNl2wylIVRiWIFHTUNPj/WjKuebI/6uk+FWr0f+CZKlQIQ6r
	QyCb9zfs7GWrgPfExCg7/Utq1K2Slec8HJoNRZJe41a1J6N9L3zfBzFzMi0QfHXkGQkDo9ErgxP
	JK4x1l05/oPVB9KcaltliRO4MDoygZO7IMdPBWN1H1+IOrFuG4SWL0WCZWKMOevNrJshKV5Nfma
	0xbqd8r7E98VjOktfYionasUVvdA9UVFXYHXBdgwEVkQEsRnKQVyJ7YSQTw90dyocNWlKHhr622
	kPVnLRiNNGV9KCmH/71w=
X-Google-Smtp-Source: AGHT+IHb4DIKOWc0AHVgVob44c3YuFwSurOgVMR6UbUt/jVq1y2btERl+8o3KRryS7hZjUjd4+c3lg==
X-Received: by 2002:a05:600c:418a:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-43d23b968damr63426255e9.1.1742215146879;
        Mon, 17 Mar 2025 05:39:06 -0700 (PDT)
Message-ID: <aefc3dd1-1509-4021-9a43-a09ed57ba5b4@citrix.com>
Date: Mon, 17 Mar 2025 12:39:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix zap_low_mappings() to map less of the
 trampoline
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250106112652.579310-1-andrew.cooper3@citrix.com>
 <2f12f38e-9629-40fd-b532-6b6f82ecfe1f@suse.com>
 <4bff530c-9f96-4b59-b6cb-86349c576690@citrix.com>
 <0565db90-5734-4795-8988-efd3e72cc770@suse.com>
 <Z9FaeksA0d9Ms15m@macbook.local>
 <82348f8b-7e5e-43ab-8eab-975d84cdda46@citrix.com>
 <555dcea6-1359-43c3-93fd-338744099387@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <555dcea6-1359-43c3-93fd-338744099387@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 7:56 am, Jan Beulich wrote:
> On 14.03.2025 20:00, Andrew Cooper wrote:
>> On 12/03/2025 9:57 am, Roger Pau Monné wrote:
>>> On Wed, Mar 12, 2025 at 09:31:37AM +0100, Jan Beulich wrote:
>>>> On 11.03.2025 21:47, Andrew Cooper wrote:
>>>>> On 06/01/2025 11:54 am, Jan Beulich wrote:
>>>>>> On 06.01.2025 12:26, Andrew Cooper wrote:
>>>>>>> Regular data access into the trampoline is via the directmap.
>>>>>>>
>>>>>>> As now discussed quite extensively in asm/trampoline.h, the trampoline is
>>>>>>> arranged so that only the AP and S3 paths need an identity mapping, and that
>>>>>>> they fit within a single page.
>>>>>>>
>>>>>>> Right now, PFN_UP(trampoline_end - trampoline_start) is 2, causing more than
>>>>>>> expected of the trampoline to be mapped.  Cut it down just the single page it
>>>>>>> ought to be.
>>>>>>>
>>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>> Thanks.  However,
>>>>>
>>>>>> on the basis that this improves things. However, ...
>>>>>>
>>>>>>> --- a/xen/arch/x86/x86_64/mm.c
>>>>>>> +++ b/xen/arch/x86/x86_64/mm.c
>>>>>>> @@ -718,14 +718,16 @@ void __init zap_low_mappings(void)
>>>>>>>  {
>>>>>>>      BUG_ON(num_online_cpus() != 1);
>>>>>>>  
>>>>>>> -    /* Remove aliased mapping of first 1:1 PML4 entry. */
>>>>>>> +    /* Stop using l?_bootmap[] mappings. */
>>>>>>>      l4e_write(&idle_pg_table[0], l4e_empty());
>>>>>>>      flush_local(FLUSH_TLB_GLOBAL);
>>>>>>>  
>>>>>>> -    /* Replace with mapping of the boot trampoline only. */
>>>>>>> +    /*
>>>>>>> +     * Insert an identity mapping of the AP/S3 part of the trampoline, which
>>>>>>> +     * is arranged to fit in a single page.
>>>>>>> +     */
>>>>>>>      map_pages_to_xen(trampoline_phys, maddr_to_mfn(trampoline_phys),
>>>>>>> -                     PFN_UP(trampoline_end - trampoline_start),
>>>>>>> -                     __PAGE_HYPERVISOR_RX);
>>>>>>> +                     1, __PAGE_HYPERVISOR_RX);
>>>>>> ... literal numbers like this - however well they are commented - are
>>>>>> potentially problematic to locate in case something changes significantly.
>>>>>> The 1 here really would want connecting with the .equ establishing
>>>>>> wakeup_stack.
>>>>> how do you propose doing this?
>>>>>
>>>>> PFN_UP(wakeup_stack - trampoline_start) doesn't have the same obvious
>>>>> connection, and it would involve partly undoing 7d73c6f196a5 which hid
>>>>> the symbol recently.
>>>>>
>>>>> While 1 isn't ideal, it is next to a comment explaining what's going on,
>>>>> and it's not going to go stale in a silent way...  (It's also not liable
>>>>> to go stale either.)
>>>> If in
>>>>
>>>>         .equ    wakeup_stack, trampoline_start + PAGE_SIZE
>>>>
>>>> PAGE_SIZE was replaced by a new (in asm/trampoline.h) TRAMPOLINE_PERM_SIZE,
>>>> you could use PFN_UP(TRAMPOLINE_PERM_SIZE) here to establish a connection.
>>>>
>>>> I have to admit I also don't really see why things going stale here would
>>>> (a) be unlikely and (b) be guaranteed to not go silently.
>> The size can't go to 0 or everything will break, and if it goes larger
>> than 1 (which it almost certainly never will), then APs and/or S3 will
>> break, and we've got both of these in CI.
>>
>> Furthermore, the actual thing which matters is:
>>
>>> /* Map the permanent trampoline page into l1_bootmap[]. */
>>> mov     sym_esi(trampoline_phys), %ecx
>>> lea     __PAGE_HYPERVISOR_RX(%ecx), %edx /* %edx = PTE to write  */
>>> shr     $PAGE_SHIFT, %ecx                /* %ecx = Slot to write */
>>> mov     %edx, sym_offs(l1_bootmap)(%esi, %ecx, 8)
>> which hardcodes 1 page, because there's almost certainly no chance this
>> will ever change.
>>
>>>>  We just don't
>>>> know what we may need to add to the trampoline, sooner or later.
>>> Maybe we could introduce trampoline_{ap?,runtime?}_{start,end} that
>>> covers this more narrow section of the trampoline code?
>> We already have one of those, and a linker assertion that it stays below
>> 1k, so wakeup_stack is at least 3k.
>>
>> The complexity is that the wakeup_stack overlays some init-only logic in
>> the placed trampoline.  It's not something that exists concretely in the
>> Xen image.
> Well - you've got an ack; while I'd prefer if connections were properly
> made, I agree it's unlikely the size will grow enough for it to matter. So
> I think you should feel free to put this in as is.

Thankyou.

~Andrew

