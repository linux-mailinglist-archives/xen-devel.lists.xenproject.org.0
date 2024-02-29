Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C2A86CB61
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 15:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687175.1070198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhJJ-0003lt-2d; Thu, 29 Feb 2024 14:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687175.1070198; Thu, 29 Feb 2024 14:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhJI-0003jC-Vq; Thu, 29 Feb 2024 14:22:56 +0000
Received: by outflank-mailman (input) for mailman id 687175;
 Thu, 29 Feb 2024 14:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfhJH-0003j2-Lk
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 14:22:55 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 064393e0-d70e-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 15:22:53 +0100 (CET)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-42eb3821a2dso7723621cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 06:22:53 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05620a12e600b00787ec1797cbsm713892qkl.68.2024.02.29.06.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 06:22:51 -0800 (PST)
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
X-Inumbo-ID: 064393e0-d70e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709216572; x=1709821372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Iqk1NTdTbbbDKkIL8Peddq7htr0rfl6qGGtw8YL4cE=;
        b=CcoL7+FcG0vh2xo41ZUE1lvorYNrMT7bkKGj2ZEe+qzrhaXsQ6lNEM98RlZYD6GTvy
         piHB4hveu598AYF2Hs9HAtIrYjEwqrbyhilI5qaCbYmAkcDWS7+F2YmLoK4Ib4muivM3
         TlITCtR6U+uf6cwbOT0U7DKRCfW/C/AOYUveE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709216572; x=1709821372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Iqk1NTdTbbbDKkIL8Peddq7htr0rfl6qGGtw8YL4cE=;
        b=edfssi0mfkRRD64/K3mo0vftg8GMJ+cW3/KnlcJLrWTF4tLhCWKBhxzliesw9q/LrL
         qJu1Evgc6Mv5DvT017cDTqDWggXEl2C10VMneybTkU//b3tCYuwRZfDAKmouOjxGDA2h
         h03HGykcpBKR1kaPyC3gooRdLq9k/jhWvP/FK9Y6roC5dm0nx+rIEu0TEKhoF4+FMEyi
         Cf4msAf5UJEXdE1KHIIAcHG6P9tOC4b/f418Lc03j6d4pG15LSZODwgaHjawqEToxmI4
         Id2JIpTzAQYScvr1SRSNlKLJ6Nz745YwGhdnOpdJKvCk52h/G/2Eb0g8UZKCEFOviu9I
         IQPA==
X-Forwarded-Encrypted: i=1; AJvYcCU5TBNW/saChbG3EbO1dFZxBklxuwrwRWWpZxJ1tIr81c/Vh7Ooukjfaxdrx1y8M7aI+D5BsZ/XLkikwqIyCc5NHlMVHBEfISMx93wiOA8=
X-Gm-Message-State: AOJu0YxHl7yFVDpTNbKoNeNgVjyaXH5RhvaJVLo86TMK0ywlAbPwePmK
	EvVK6Dx53OieAKhFCzZa1cHq5F5VKVUP/TgACwNRsgJF6zLrNX30g6l59MdEFp8=
X-Google-Smtp-Source: AGHT+IENh6dkCAZ0dL6/MjaL7xIjoIYPlcRF/XTmZaXAUsA/uz392W8Qmr3XlRd87KdjslfOmhNRrw==
X-Received: by 2002:ac8:5c10:0:b0:42d:ff6f:d68a with SMTP id i16-20020ac85c10000000b0042dff6fd68amr2133872qti.24.1709216572341;
        Thu, 29 Feb 2024 06:22:52 -0800 (PST)
Message-ID: <c4013d29-8820-4c8d-80ec-1015edfa8820@citrix.com>
Date: Thu, 29 Feb 2024 14:22:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix x2APIC visibility for PV guests
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240229104304.2478614-1-andrew.cooper3@citrix.com>
 <707ff486-b448-4bc0-be7e-1c692b360734@suse.com>
 <623e9c0e-f05f-41e7-a800-0bba01cba7f4@citrix.com>
 <e811b3b0-a3d6-488d-b93c-e24c416477bf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e811b3b0-a3d6-488d-b93c-e24c416477bf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/02/2024 1:29 pm, Jan Beulich wrote:
> On 29.02.2024 14:23, Andrew Cooper wrote:
>> On 29/02/2024 12:47 pm, Jan Beulich wrote:
>>> On 29.02.2024 11:43, Andrew Cooper wrote:
>>>> Right now, the host x2APIC setting filters into the PV max and default
>>>> policies, yet PV guests cannot set MSR_APIC_BASE.EXTD or access any of the
>>>> x2APIC MSR range.  Therefore they absolutely shouldn't see the x2APIC bit.
>>>>
>>>> Linux has workarounds for the collateral damage caused by this leakage; it
>>>> unconditionally filters out the x2APIC CPUID bit, and EXTD when reading
>>>> MSR_APIC_BASE.
>>>>
>>>> Hide the x2APIC bit in the PV default policy, but for compatibility, tolerate
>>>> incoming VMs which already saw the bit.  This is logic from before the
>>>> default/max split in Xen 4.14 which wasn't correctly adjusted at the time.
>>> What about guest_cpuid()'s handling of leaf 0xb then? The %edx value
>>> will change once a guest is rebooted, aiui. The comment in
>>> recalculate_cpuid_policy() that you update refers to that.
>> That comment is going in the next patch irrespective.
>>
>> But yes - this will change leaf 0xb from being
>> host-conditionally-visible to always hidden.
> Imo this wants saying explicitly,

Yeah - already started that for v2.

>  including why that's okay to do,
> especially since ...
>
>> PV guests don't have any coherent idea of topology.  Linux (with the
>> topo fixes) now explicitly ignores everything it can see and just fakes
>> up a flat non-SMT topology in a single package.
> ... you validly use "now" here. Plus Linux isn't the only PV guest we
> need to care about.

As I said on the other thread, NetBSD works in the spirit in which PV
guests were intended and completely ignores x2APIC in XENPV builds.

>
> What's wrong (more wrong than the present putting of vCPU ID * 2 there)
> with retaining the population of that leaf (by dropping the x2apic
> dependency there)?

Without an MADT it's meaningless.   For PV dom0, it's actively wrong
because there is an MADT and it's in the wrong space.

libxc has never written anything coherent in here, because it's never
had any coherent idea about topology.  Alejandro is working on that, and
I believe one of the prep series has been posted.  There's a lot more to go.

Even today, we end up overlaying the host's APIC_ID space layout over
the blind vCPU_ID * 2, which makes the result still nonsense.

Various versions of Xen have tried playing with this, without
understanding properly what they're doing, and XenServer still has a
revert of a Xen 3.4 patch in the patch, as it broken migration of guests
at the time...


There is going to be a future (hopefully soon) where HVM guests get to
see something which conforms to the architectural specs, and is sane.

But doing the same for PV guests is more complicated, because of the
conflicting requirements between PV guests not really having an APIC,
but APIC being the x86 architectural expression of topology.


>>>> This wants backporting as far as people can tollerate, but it's really not
>>>> obvious which commit in 4.14 should be referenced in a Fixes: tag.
>>> Why 4.14? In 4.7.0 I see ...
>>>
>>>> @@ -830,11 +846,10 @@ void recalculate_cpuid_policy(struct domain *d)
>>>>      }
>>>>  
>>>>      /*
>>>> -     * Allow the toolstack to set HTT, X2APIC and CMP_LEGACY.  These bits
>>>> +     * Allow the toolstack to set HTT and CMP_LEGACY.  These bits
>>>>       * affect how to interpret topology information in other cpuid leaves.
>>>>       */
>>>>      __set_bit(X86_FEATURE_HTT, max_fs);
>>>> -    __set_bit(X86_FEATURE_X2APIC, max_fs);
>>>>      __set_bit(X86_FEATURE_CMP_LEGACY, max_fs);
>>>>  
>>>>      /*
>>> ... these adjustments, just still in calculate_pv_featureset(). I
>>> haven't gone further backwards to check if/when this exposure has
>>> really appeared. I wouldn't be surprised if it's been like that
>>> for all the time since we gained x2APIC support in the hypervisor.
>> 4.14 was when we got the proper default vs max split.  Before then, this
>> block of logic was an opencoded "max(ish) for tookstacks which know
>> about it" kind of thing.
> Except it was also affecting what guests get to see, afaict.

No - this hunk explicitly doesn't.

What this hunk says is "don't override the toolstack's choice based on
what the host can see".

Because even today, Xen is still blindly zeroing toolstack settings it
doesn't like, because my series fixing this is still sat on the mailing
list from years and years ago over and argument over whether a function
lives in libx86 or elsewhere...

~Andrew

