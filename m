Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A07987E43E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 08:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694505.1083306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm7hH-00061k-Tw; Mon, 18 Mar 2024 07:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694505.1083306; Mon, 18 Mar 2024 07:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm7hH-0005zz-R8; Mon, 18 Mar 2024 07:46:15 +0000
Received: by outflank-mailman (input) for mailman id 694505;
 Mon, 18 Mar 2024 07:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rm7hG-0005zY-KU
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 07:46:14 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9727276a-e4fb-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 08:46:12 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d41d1bedc9so67927511fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 00:46:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h12-20020a170906260c00b00a457a55b814sm4556217ejc.73.2024.03.18.00.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 00:46:11 -0700 (PDT)
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
X-Inumbo-ID: 9727276a-e4fb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710747971; x=1711352771; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6UQRtBhWJpPkCEMPCrBPLIFgvcaNsTRJRzsowCFQ7Xo=;
        b=J2Qvm9Hf4pk4i7JhCBOlYepUozsBT2IeA/MiBd3vBWuOE+76YnaeqUHXgKRKzuexLc
         3gkwpBaQ2OWDrgeNr4l/ikCVmNVC9XrohBQOqyn2w9eg3C4mWSwf8gvmkSrzjsOJFEDE
         CGzK+3cN7vl5yszP3Vt9lrnRiJF6qjLH90kC5RilDm0YWKfzo5uU3b1mDcSEmFqeSNS6
         EWSPcn/ttrrU1i6VntrmQfILVmXBQYIxyIqsby09XYFm0U6BbJU47G+vVbDDStWtmwuv
         0wfFDrR7gJ/wCcypQjepuAyC5liFgZszgrMhIPlbCkFFRytBYuuxLZ+qaHnJAlLcymZJ
         fj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710747971; x=1711352771;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UQRtBhWJpPkCEMPCrBPLIFgvcaNsTRJRzsowCFQ7Xo=;
        b=LEMF8o+i6y5QF0FDAQSfmZqKkYm30GnUmYfoBfSc1iImht+te0qRuNAaiSROPkWJky
         VZMwZhCsJS6VatTFyJyJIcQEdwd6xFbObE1BlNW3hnJn1hRcdZVd4AU0IJ50M0JtkyfA
         z5OXms3NY90AIMBdbclWgNqvMWggu/Z/kYLZ/JChZCuc1WgS8dhX8nr97ahpu5ns0O9D
         aJR6XsVMeU3FIq/etn064Vr1WvyYiToYZ+YZLeujpUKfKKtfElsgL2mpS7EzsZ/f0K/k
         OOKuxPafwAGvlUOT2A1WgWouxE7+/8J1hmTOtvfV0xepuR/iRHnpA1LUEu4LPtz/AB51
         WZPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGNqhBjmomp5W9D+qKcMoOd4PbKG/8saYJTK7j+hYj+kyxxqNZgPITMKJqdi+wc+UUrcu9VL0lJQVMj+SSTXbyh9rgArrAgDdu6mmNHQg=
X-Gm-Message-State: AOJu0Yx3Qqa2dbeiBultIWcN6YkKgkh2VCd4X/7p+MULB1xS1m9FxBzz
	Ltr6yTMV0FpYIRyFxkHJveeTJelnnaCUBqlQvICWm+2syOAb3ucQSw1WpobXLA==
X-Google-Smtp-Source: AGHT+IH1QsWXurGWiJgWIx8XoD6rxDs1TBeUMTMLENuR9dVZHY3Ew4EEz47MRWCZ8bIuoOFHH7KTQQ==
X-Received: by 2002:a19:2d5b:0:b0:513:a766:4672 with SMTP id t27-20020a192d5b000000b00513a7664672mr4263912lft.4.1710747971554;
        Mon, 18 Mar 2024 00:46:11 -0700 (PDT)
Message-ID: <5128255f-fe52-4425-b168-34946c0c901e@suse.com>
Date: Mon, 18 Mar 2024 08:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, federico.serafini@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 michal.orzel@amd.com
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com>
 <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
 <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org>
 <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop>
 <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com>
 <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
 <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com>
 <CA+zSX=bu-gRYUYOKMRp5kJ02ExdrtFEHTgXapwTVotm5cK2dfw@mail.gmail.com>
 <d05be83a-e7f1-4c2f-afda-42deee9be203@suse.com>
 <3f27abc3-9809-4637-a29c-8aeafcd29ade@xen.org>
 <7109ef7e-040c-4d11-ba4b-d898ed2530ff@suse.com>
 <CA+zSX=bGfc+dsZjg4xmW2fgsnFQLSAh1ChOY3jYU_AD5SJw_7w@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CA+zSX=bGfc+dsZjg4xmW2fgsnFQLSAh1ChOY3jYU_AD5SJw_7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.03.2024 15:45, George Dunlap wrote:
> On Fri, Mar 15, 2024 at 2:13 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.03.2024 14:55, Julien Grall wrote:
>>> On 15/03/2024 13:24, Jan Beulich wrote:
>>>> On 15.03.2024 13:17, George Dunlap wrote:
>>>>> On Fri, Mar 15, 2024 at 11:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> It sounds like Andy and Stefano feel like this is a situation where "a
>>>>>>> fixed width quantity is meant"; absent any further guidance from the
>>>>>>> CODING_STYLE about when fixed widths should or should not be used, I
>>>>>>> don't think this change would be a violation of CODING_STYLE.
> [snip]
>>>>> Other than "it's in CODING_STYLE", and "it's not really necessary
>>>>> because it's ensured in the assembly code", you haven't advanced a
>>>>> single reason why "uint32_t" is problematic.
>>>>
>>>> And it isn't, I never said it would be. But if we set rules for
>>>> ourselves, why would we take the first opportunity to not respect them?
>>>
>>> I am a bit confused. Reading through the thread you seem to agree that
>>> the written rules are respected here. So what rules are you talking about?
>>
>> What was proposed is use of a fixed width type where according to my
>> reading ./CODING_STYLE says it shouldn't be used.
> 
> This conversation is starting to get frustrating.

Same here.

>  That's simply not
> what it says, and I pointed that out just a few messages ago.
> 
> To reiterate:The text says fixed-width types are OK when a fixed-width
> quantity is "meant"; and that in this case, Stefano and Andy "mean" to
> use a fixed-width quantity.  The implied subtext of that sentence
> could be, "Don't use fixed width types unless there's a good reason to
> use a fixed width", and both Andy and Stefano think there's a good
> reason.  This argument you haven't really addressed at all, except
> with a specious "slippery slope" argument meant to nullify the
> exception; and now you attempt to simply ignore.
> 
> I venture to assert that for most people, the rules are a means to an
> end: That end being code which is correct, robust, fast, easy to
> write, maintain, debug, and review patches for.  What I agreed to,
> when I accepted this patch, was that *in general* we would avoid using
> fixed-width types; but that there were cases where doing so made
> sense.  Some of those were discussed in the thread above.
> 
> Andy and Stefano have already put forward reasons why they think a
> fixed-width type would be better here, which are related to "end
> goals": namely, more robust and easy to maintain code.  When I asked
> what "end goals" would be negatively impacted by using a fixed-width
> type, you explicitly said that there were none!  That the *only*
> reason you're continuing to argue is that we have a document somewhere
> that says we should -- a document which explicitly acknowledges that
> there will be exceptions!

The named reasons simply aren't convincing to me, at all. There's no
loss towards the "end goals" when "unsigned int" is used instead of
"uint32_t". Plus I recall Andrew putting under question use of
"unsigned int" for various hypercall parameter declarations, indicating
his belief that "unsigned long" ought to be used. That's, to me, quite
the opposite of using fixed-width types here, as there's no uniformly
correct fixed-width type to use in that case.

So to me, besides there not having been technical arguments towards
the need to use fixed width types here, there's actually added
confusion about what's actually wanted. Imo if we started using fixed-
width types for hypercall handler parameter declarations, (almost?) all
non-handle ones would likely want to be converted. Consistency, after
all, is part of the "easy to maintain code" goal. Plus without
consistency how would one determine when to use what kind of types.

Bottom line: My take is that here we're discussing a matter of taste
(preferring fixed width types) vs a matter of a supposedly agreed upon
rule (preferring to avoid them). Hence my "there not having been
technical arguments". I therefore view your accuse as simply unfair.

> The ideal response would have been to lay out a reasonably
> comprehensive set of criteria for when to use basic types, when to use
> fixed-width types, and how each criteria advanced the end goals of a
> better codebase.  A sufficient response would have been to lay out
> reasons why "better codebase", in this instance, tilts towards using a
> basic type rather than a fixed-width type.

The main use of fixed width types, to me, is in interface structure
definitions - between Xen and hardware / firmware, or in hypercall
structures. I'm afraid I have a hard time seeing good uses outside of
that. Even in inline assembly, types of variables used for inputs or
outputs don't strictly need to be fixed-width; I can somewhat accept
their use there for documentation purposes.

> Saying "That's what the rules say", without motivating it by
> explaining how it connects to a better codebase, is just not a helpful
> response; and making that argument after it's been pointed out that
> that is *not* what the rules say is even worse.

Well, as above, I view this as unfair as well. The rule's there. It
should be followed. If there really were downsides to following it,
the rule should be amended or dropped. If it was dropped, we'd end
up where we were before: People randomly using fixed width types even
in places we agree they're not suitable for use. And there being no
real handle in reviews to ask for them to change.

In this context, may I remind you that I'm doing a lot more reviews
than you. Having been accused of (and in various cases also guilty of)
bike shedding, it is quite helpful when one can back change requests
by references to (more or less) clearly spelled out rules. If too much
room for interpretation remains (and if there's disagreement about
interpretation), what's written down needs tightening imo. Hence why a
goal of mine has been to get ./CODING_STYLE into less ambiguous shape.
With rather little success, sadly.

Jan

