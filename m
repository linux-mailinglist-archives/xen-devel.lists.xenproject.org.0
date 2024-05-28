Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3431B8D1CB3
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 15:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731147.1136500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBwl4-0008It-00; Tue, 28 May 2024 13:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731147.1136500; Tue, 28 May 2024 13:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBwl3-0008Gk-Tj; Tue, 28 May 2024 13:20:53 +0000
Received: by outflank-mailman (input) for mailman id 731147;
 Tue, 28 May 2024 13:20:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bNtp=M7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sBwl2-0008Ge-A3
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 13:20:52 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 199163dc-1cf5-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 15:20:49 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6ab9e0a4135so29382586d6.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 06:20:49 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ad7a4da6f7sm23989776d6.98.2024.05.28.06.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 06:20:48 -0700 (PDT)
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
X-Inumbo-ID: 199163dc-1cf5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716902449; x=1717507249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jt55f7uGGjZV9XnmbRPk/ICKgW7KTxcKEzUfXVckBEM=;
        b=PRnmGu8gIuOyB1cRW7nmzWZXMxUGNysuhde43TYRN3z1xJ4hyffYPpiF8IJlTODS+J
         X5BCKZKGMUeFlEWiUIu4uz9DY/6G+yfIv7TjTXCZzLLnF6lFWtw/1QbJMuT54GxW+yyO
         gsIh/EvttmSS9AkE8+4g2Rp+s0vgN8Tmz1mYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716902449; x=1717507249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jt55f7uGGjZV9XnmbRPk/ICKgW7KTxcKEzUfXVckBEM=;
        b=UpHpqqcokkR0Gny+g6vH52dcG2TaBXVt1ws/1wJ7IupxvUYdKaF2jC+d+Dk9O0Z4wS
         QK/hP7MWsC1VNgkgHdS+Gjz9h/G6FYaBOk4GgOdlFRJuMJLuqQl8C/vTHd/bWDngodDA
         qXnvibjnRswBjVnd2WYYu+3f3an5RYTdRuxXbMe1mEmxIybhrBW1ixW8UIenw/rx1dY1
         O8CJP7DVLrRh88Fy4KrXCgoEX7cLLtitnmcbLLbdItcgGOt9fwtwdqt6YKZ+AIBipbjp
         WAeB2jL2EZFF5jU/7pKl9hbbJxKCCH59NW6/YnVblF7iftlN9rg5kbnLsmvRXm8C/+Iq
         /7sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUGaCDIPIXiajBWXxY9lXdJSJVDcIPAWnRJuwwe9R2KOoYLYpa0i+b1Lu/cnIJKkzDh7Rd7z7JIazuR6QiyZF1vI5AnjKighSns0m8wKQ=
X-Gm-Message-State: AOJu0YyzTdHoXwDqmjBI96gCPMtctCqSCvE/EqlDtcdUxOO8kSpd/IsF
	aZTiSYKIzq11tk2kr+tkWIerSWKeosIjFRRHQXfiYgblFsadabhLMAjblNTh1d8=
X-Google-Smtp-Source: AGHT+IFbfbwa3NsL2kJPdLZZc/15FNGV9gn6h8K/YYqupjGHVJ6O8fl33Ho3aumRepddoEWQRScXdA==
X-Received: by 2002:a05:6214:45a0:b0:6a8:dcc7:9088 with SMTP id 6a1803df08f44-6ab9d06e5c9mr256805756d6.26.1716902448813;
        Tue, 28 May 2024 06:20:48 -0700 (PDT)
Message-ID: <07f14337-a646-4041-be49-1f6e5ccab32e@citrix.com>
Date: Tue, 28 May 2024 14:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] xen/bitops: Implement generic_f?sl() in lib/
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-6-andrew.cooper3@citrix.com>
 <7305a8b9-5f43-47e4-987b-c5ca76bcc312@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7305a8b9-5f43-47e4-987b-c5ca76bcc312@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2024 9:44 am, Jan Beulich wrote:
> On 24.05.2024 22:03, Andrew Cooper wrote:
>> generic_f?s() being static inline is the cause of lots of the complexity
>> between the common and arch-specific bitops.h
>>
>> They appear to be static inline for constant-folding reasons (ARM uses them
>> for this), but there are better ways to achieve the same effect.
>>
>> It is presumptuous that an unrolled binary search is the right algorithm to
>> use on all microarchitectures.  Indeed, it's not for the eventual users, but
>> that can be addressed at a later point.
>>
>> It is also nonsense to implement the int form as the base primitive and
>> construct the long form from 2x int in 64-bit builds, when it's just one extra
>> step to operate at the native register width.
>>
>> Therefore, implement generic_f?sl() in lib/.  They're not actually needed in
>> x86/ARM/PPC by the end of the cleanup (i.e. the functions will be dropped by
>> the linker), and they're only expected be needed by RISC-V on hardware which
>> lacks the Zbb extension.
>>
>> Implement generic_fls() in terms of generic_flsl() for now, but this will be
>> cleaned up in due course.
>>
>> Provide basic runtime testing using __constructor inside the lib/ file.  This
>> is important, as it means testing runs if and only if generic_f?sl() are used
>> elsewhere in Xen.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with a suggestion and a question.
>
>> I suspect we want to swap CONFIG_DEBUG for CONFIG_BOOT_UNIT_TESTS in due
>> course.  These ought to be able to be used in a release build too.
> +1

Actually - I might as well do this now.  Start as we mean to go on.

>
>> --- /dev/null
>> +++ b/xen/lib/generic-ffsl.c
>> @@ -0,0 +1,65 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#include <xen/bitops.h>
>> +#include <xen/boot-check.h>
>> +#include <xen/init.h>
>> +
>> +unsigned int generic_ffsl(unsigned long x)
>> +{
>> +    unsigned int r = 1;
>> +
>> +    if ( !x )
>> +        return 0;
>> +
>> +#if BITS_PER_LONG > 32
> To be future-proof, perhaps ahead of this
>
> #if BITS_PER_LONG > 64
> # error "..."
> #endif
>
> or a functionally similar BUILD_BUG_ON()?

Good point.  I'll fold this in to both files.

>
>> --- /dev/null
>> +++ b/xen/lib/generic-flsl.c
>> @@ -0,0 +1,68 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#include <xen/bitops.h>
>> +#include <xen/boot-check.h>
>> +#include <xen/init.h>
>> +
>> +/* Mask of type UL with the upper x bits set. */
>> +#define UPPER_MASK(x) (~0UL << (BITS_PER_LONG - (x)))
>> +
>> +unsigned int generic_flsl(unsigned long x)
>> +{
>> +    unsigned int r = BITS_PER_LONG;
>> +
>> +    if ( !x )
>> +        return 0;
>> +
>> +#if BITS_PER_LONG > 32
>> +    if ( !(x & UPPER_MASK(32)) )
>> +    {
>> +        x <<= 32;
>> +        r -= 32;
>> +    }
>> +#endif
>> +    if ( !(x & UPPER_MASK(16)) )
>> +    {
>> +        x <<= 16;
>> +        r -= 16;
>> +    }
>> +    if ( !(x & UPPER_MASK(8)) )
>> +    {
>> +        x <<= 8;
>> +        r -= 8;
>> +    }
>> +    if ( !(x & UPPER_MASK(4)) )
>> +    {
>> +        x <<= 4;
>> +        r -= 4;
>> +    }
>> +    if ( !(x & UPPER_MASK(2)) )
>> +    {
>> +        x <<= 2;
>> +        r -= 2;
>> +    }
>> +    if ( !(x & UPPER_MASK(1)) )
>> +    {
>> +        x <<= 1;
>> +        r -= 1;
>> +    }
>> +
>> +    return r;
>> +}
> While, as you say, the expectation is for this code to not commonly come
> into actual use, I still find the algorithm a little inefficient in terms
> of the constants used, specifically considering how they would need
> instantiating in resulting assembly. It may be that Arm's fancy constant-
> move insns can actually efficiently synthesize them, but I think on most
> other architectures it would be more efficient (and presumably no less
> efficient on Arm) to shift the "remaining" value right, thus allowing for
> successively smaller (and hence easier to instantiate) constants to be
> used.

ARM can only synthesise UPPER_MASK(16) and narrower masks, I think.

That said, I'm not concerned about the (in)efficiency seeing as this
doesn't get included in x86/ARM/PPC builds by the end of the series.

It's RISC-V which matters, and I'm pretty sure this is the wrong
algorithm to be using.

Incidentally, this algorithm is terrible for superscalar pipelines,
because each branch is inherently unpredictable.

Both these files want rewriting based on an analysis of the H-capable
Zbb-incapable RISC-V cores which exist.

I expect that what we actually want is the De Bruijn form which is an
O(1) algorithm, given a decent hardware multiplier.  If not, there's a
loop form which I expect would still be better than this.

~Andrew

