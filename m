Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1127C960851
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 13:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783842.1193128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuCZ-0004si-Sx; Tue, 27 Aug 2024 11:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783842.1193128; Tue, 27 Aug 2024 11:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuCZ-0004qN-QG; Tue, 27 Aug 2024 11:17:31 +0000
Received: by outflank-mailman (input) for mailman id 783842;
 Tue, 27 Aug 2024 11:17:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1siuCX-0004pf-Vj
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 11:17:30 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f184382f-6465-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 13:17:27 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bed83488b3so6234485a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 04:17:27 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb481ba6sm880610a12.83.2024.08.27.04.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 04:17:26 -0700 (PDT)
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
X-Inumbo-ID: f184382f-6465-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724757447; x=1725362247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jMisr3fOnVnm/3N7Ng/Fi9GXs4hmC337wybxWwBblUw=;
        b=RF5lwR+tiw16LhRd34UBFb1PIdzjsz3iMipuE+0+FpO2D6z0wwEqFjqa7/E9F+biQb
         MoKiUzJ5cp6bddtxil5NBa9TNSKqpraLOIm3XkYb5/Qud/mTJAyTg2P8V8IvqUy4ySPJ
         5i8JSwr/5ZGkz4ekrunqxAhM0TvPm554xXJqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724757447; x=1725362247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMisr3fOnVnm/3N7Ng/Fi9GXs4hmC337wybxWwBblUw=;
        b=TG4Uc6MGeHtcUNUCMttW3YywP/9tWZclhJXGiYeJDPUG5ucmYTfG4FaaC2JN+4MR8m
         3a5F6NsngROiVeYNqukUdZohxrW+stb7HESeV3UfeFGJD4yNgv0LcsXfXp/uUPrcCW5K
         tVKXa3ybrRRS7TJjO+rs0vEJ/d8+Ig3odfRWpHUTd5lixzCFDidbL6MRb7/Ur6ifVciQ
         ST0G4yncecs+cztBWFYZhB/SQqhEl9PGJpTQ0kd2R6GC6DS+hvCruGQYHR8ZR2rfe0J5
         8SW5Z2YODSkgmDG08+o5ASREa7nXoT22xz4lqKIQgV34s7yNVNpFr7k3K0ujhyjhI8p3
         UmIA==
X-Forwarded-Encrypted: i=1; AJvYcCUPzXdPx7vOESCZlxGVEMi+Q6ucZ/NI33SmgiVS3gtTHGxMFzwjereRMR/ek1kG4XBm21xc5uihh74=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvwXUSEtLfhw7txjCIATbQVU12pjQdxWDTGsr7AhOEq4IMN804
	x5N5f/1pJbVfm0Pj8LEzCnqxlMnMXaDhS4Nmilq9963InavkVPO48Y9h00JNfFs=
X-Google-Smtp-Source: AGHT+IGyt3tvH2mSQIS8K9YpfhnaW8r/AJ4chfbezk4knKoVrA4a5lMWs6lafit167cBfImjn8s+SQ==
X-Received: by 2002:a05:6402:518d:b0:5c0:99ff:7c85 with SMTP id 4fb4d7f45d1cf-5c099ff84b0mr7374631a12.18.1724757446909;
        Tue, 27 Aug 2024 04:17:26 -0700 (PDT)
Message-ID: <3300b035-46d7-41d3-9908-1a0093c433e8@citrix.com>
Date: Tue, 27 Aug 2024 12:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] x86/bitops: Use the POPCNT instruction when available
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-10-andrew.cooper3@citrix.com>
 <03febf18-516b-4677-a0a5-102036c91a29@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <03febf18-516b-4677-a0a5-102036c91a29@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/08/2024 2:07 pm, Jan Beulich wrote:
> On 23.08.2024 01:06, Andrew Cooper wrote:
>> A few RFC points.
>>
>>  * I throught we had an x86 general lib-y but I can't find one, hence why it's
>>    still in xen/lib/ for now.
> We indeed have nothing like that yet. The file name should then imo not be
> arch-* though, but x86-*. Or you could put it in xen/lib/x86/.

I was worried about xen/lib/x86/ and interfering with userspace.

> It could even
> be obj-y rather than lib-y, unless you expect we'll be able to get rid of
> all uses, which seems unlikely at least due to bitmap_weight(). Otoh with
> my ABI-level series the call site in arch_hweightl() could then be made go
> away for v2 and above, at which point it living in lib-y will be preferable.

Yes, I was specifically trying to account for this.

I'm expecting the mandatory-popcnt work to end up looking something like:

diff --git a/xen/arch/x86/include/asm/bitops.h
b/xen/arch/x86/include/asm/bitops.h
index 0db698ed3f4c..027eda60c094 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -480,6 +480,9 @@ static always_inline unsigned int
arch_hweightl(unsigned long x)
 {
     unsigned int r;
 
+    if ( IS_ENABLED(CONFIG_REQUIRE_POPCNT /* or whatever */) )
+        return __builtin_popcountl(x);
+
     /*
      * arch_generic_hweightl() is written in ASM in order to preserve all
      * registers, as the compiler can't see the call.


which in turn DCE's the alternative_io() and drops the reference to
arch_generic_hweightl().

>
>>  * When we up the minimum toolchain to GCC 7 / Clang 5, we can use a
>>    __attribute__((no_caller_saved_registers)) and can forgo writing this in asm.
>>
>>    GCC seems to need extra help, and wants -mgeneral-regs-only too.  It has a
>>    habit of complaining about incompatible instructions even when it's not
>>    emitting them.
> What is this part about? What incompatible instructions, in particular?

This was weird.  https://godbolt.org/z/4z1qzWbfE is an example.

>
>> @@ -475,4 +476,24 @@ static always_inline unsigned int arch_flsl(unsigned long x)
>>  }
>>  #define arch_flsl arch_flsl
>>  
>> +static always_inline unsigned int arch_hweightl(unsigned long x)
>> +{
>> +    unsigned int r;
>> +
>> +    /*
>> +     * arch_generic_hweightl() is written in ASM in order to preserve all
>> +     * registers, as the compiler can't see the call.
>> +     *
>> +     * This limits the POPCNT instruction to using the same ABI as a function
>> +     * call (input in %rdi, output in %eax) but that's fine.
>> +     */
>> +    alternative_io("call arch_generic_hweightl",
>> +                   "popcnt %[val], %q[res]", X86_FEATURE_POPCNT,
>> +                   ASM_OUTPUT2([res] "=a" (r) ASM_CALL_CONSTRAINT),
>> +                   [val] "D" (x));
> If you made [val] an output ("+D") you could avoid preserving the register
> in the function. And I'd expect the register wouldn't be re-used often
> afterwards, so its clobbering likely won't harm code quality very much.

"+D" means it's modified by the asm, which forces preservation of the
register, if it's still needed afterwards.

Plain "D" means not modified by the asm, which means it can be reused if
necessary.

>
>> --- /dev/null
>> +++ b/xen/lib/arch-generic-hweightl.S
>> @@ -0,0 +1,46 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +        .file __FILE__
>> +
>> +#include <xen/linkage.h>
>> +
>> +/*
>> + * An implementation of generic_hweightl() used on hardware without the POPCNT
>> + * instruction.
>> + *
>> + * This function is called from within an ALTERNATIVE in arch_hweightl().
>> + * i.e. behind the back of the compiler.  Therefore all registers are callee
>> + * preserved.
>> + *
>> + * The ASM is what GCC-12 emits for generic_hweightl() in a release build of
>> + * Xen, with spilling of %rdi/%rdx to preserve the callers registers.
>> + */
>> +FUNC(arch_generic_hweightl)
>> +        push   %rdi
>> +        push   %rdx
>> +
>> +        movabs $0x5555555555555555, %rdx
>> +        mov    %rdi, %rax
>> +        shr    $1, %rax
>> +        and    %rdx, %rax
>> +        sub    %rax, %rdi
>> +        movabs $0x3333333333333333, %rax
>> +        mov    %rdi, %rdx
>> +        shr    $0x2, %rdi
> Could I talk you into omitting the 0x here and ...
>
>> +        and    %rax, %rdx
>> +        and    %rax, %rdi
>> +        add    %rdi, %rdx
>> +        mov    %rdx, %rax
>> +        shr    $0x4, %rax
> ... here, and maybe use ...
>
>> +        add    %rdx, %rax
>> +        movabs $0xf0f0f0f0f0f0f0f, %rdx
>> +        and    %rdx, %rax
>> +        movabs $0x101010101010101, %rdx
>> +        imul   %rdx, %rax
>> +        shr    $0x38, %rax
> ... 56 here (or even BITS_PER_LONG-8)?

Ok.

~Andrew

