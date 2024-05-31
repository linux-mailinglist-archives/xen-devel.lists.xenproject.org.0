Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CAC8D6C91
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 00:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733888.1140164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDAwj-0000Sz-5S; Fri, 31 May 2024 22:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733888.1140164; Fri, 31 May 2024 22:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDAwj-0000Qa-2M; Fri, 31 May 2024 22:42:01 +0000
Received: by outflank-mailman (input) for mailman id 733888;
 Fri, 31 May 2024 22:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tcd8=NC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sDAwh-0000QU-0C
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 22:41:59 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbfa2b07-1f9e-11ef-90a1-e314d9c70b13;
 Sat, 01 Jun 2024 00:41:57 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-62a0849f5a8so24754727b3.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 15:41:57 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794f3184388sm91021085a.125.2024.05.31.15.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 15:41:54 -0700 (PDT)
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
X-Inumbo-ID: fbfa2b07-1f9e-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717195316; x=1717800116; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nsT8LH63XtmTzmQcx0YFZfAbK7mznoH1MaRFA0+o4OU=;
        b=nMMUcGhB1Uoz9qRSFK1LTeFk0V6B/HOTd0d4MXktIjjuYmt/ruLeUfYVcY+bhNtiew
         BoiNEebgZToEXGe3oReTgQTt9AMWCGXGOhLlTyXYpeAjylXW1qIGX3eegykmKcpPeAFW
         MH2VKHFIZFWbl8zdZ9Jw8DPIJ7dpIz+SlPB2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717195316; x=1717800116;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsT8LH63XtmTzmQcx0YFZfAbK7mznoH1MaRFA0+o4OU=;
        b=eSrdLhTItDTaxTaJxUIYO4//wQh3TqWVU0PRFal77esZW7gsUBpFL60vow97K7Rxx9
         Ri3SbkRJ871pNynQiAJfO141pI4n3KBw2In1E87Ul/buFJqlAFrhawJXRi+e5ucdGcAG
         JPN3pFlu8Hi0tgHr1Y4kOF/72jnoeyIk/f2nhm8o2sgBxWeclfuBkcTDdtJKh2kae833
         IzcW0S/OL0ln56b+vfYz+iqZXzo56YwAEO3Wm2kFdP0n9nj2P5ed+Y/iEKYM+TJeE/r8
         bDU7nqwkfXG16ccFpCcRbOecSSk2AQ49zU/o6lm/NsI19n65i/YiAbq9+cJ3dM0W60Nx
         Kk5g==
X-Forwarded-Encrypted: i=1; AJvYcCUq4vDxVRdqWzrhqhEolbkGV2WZmx0u/oo3OxFrnq2PIqZBab8S7MWUEmj2hCN2ywpjcqui+dScSSmTkpl5h3Tf8ar+QQEgq4oylOuk/Xk=
X-Gm-Message-State: AOJu0YxAr5GY8SnQw7ivE4Q2fF9P+nYeb293+5Z8xQZ8Sx733/WL+g4R
	045SZaQCSeiGxlDZAZa7DLuAwccV10B32qf/mWnAwd1JNddAf7w7NKa4HBvME+4=
X-Google-Smtp-Source: AGHT+IGplGr+YkdzvmcNPa32xsVdbr+IKqOMzTxGKfcHYWlerHx1lyK30RLd5pdN9JA/+HmVQ9QhGA==
X-Received: by 2002:a81:c907:0:b0:620:255a:a5c5 with SMTP id 00721157ae682-62c79852ef9mr32532317b3.32.1717195315461;
        Fri, 31 May 2024 15:41:55 -0700 (PDT)
Message-ID: <275fbd2a-9460-4836-8dd1-30f36cf137ae@citrix.com>
Date: Fri, 31 May 2024 23:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] xen/bitops: Cleanup ahead of rearrangements
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
 <20240524200338.1232391-3-andrew.cooper3@citrix.com>
 <c70f769b-57b9-4f71-9c31-8052b773d28a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c70f769b-57b9-4f71-9c31-8052b773d28a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2024 9:24 am, Jan Beulich wrote:
> On 24.05.2024 22:03, Andrew Cooper wrote:
>>  * Rename __attribute_pure__ to just __pure before it gains users.
>>  * Introduce __constructor which is going to be used in lib/, and is
>>    unconditionally cf_check.
>>  * Identify the areas of xen/bitops.h which are a mess.
>>  * Introduce xen/boot-check.h as helpers for compile and boot time testing.
>>    This provides a statement of the ABI, and a confirmation that arch-specific
>>    implementations behave as expected.
>>
>> Sadly Clang 7 and older isn't happy with the compile time checks.  Skip them,
>> and just rely on the runtime checks.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Further remarks, though:
>
>> ---
>>  xen/include/xen/bitops.h     | 13 ++++++--
>>  xen/include/xen/boot-check.h | 60 ++++++++++++++++++++++++++++++++++++
>>  xen/include/xen/compiler.h   |  3 +-
>>  3 files changed, 72 insertions(+), 4 deletions(-)
>>  create mode 100644 xen/include/xen/boot-check.h
> The bulk of the changes isn't about bitops; it's just that you're intending
> to first use it for testing there. The subject prefix therefore is somewhat
> misleading.

I'll change to "Cleanup and infrastructure ahead ..." but the bitops
aspect is still reasonably important.
>> --- /dev/null
>> +++ b/xen/include/xen/boot-check.h
>> @@ -0,0 +1,60 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +/*
>> + * Helpers for boot-time checks of basic logic, including confirming that
>> + * examples which should be calculated by the compiler are.
>> + */
>> +#ifndef XEN_BOOT_CHECK_H
>> +#define XEN_BOOT_CHECK_H

Given that CONFIG_SELF_TESTS was subsequently approved, I've renamed
this file to match.

>> +
>> +#include <xen/lib.h>
>> +
>> +/* Hide a value from the optimiser. */
>> +#define HIDE(x)                                                         \
>> +    ({ typeof(x) _x = (x); asm volatile ( "" : "+r" (_x) ); _x; })
> In principle this is a macro that could be of use elsewhere. That's also
> reflected in its entirely generic name. It therefore feels mis-placed in
> this header.

I'd forgotten that we several variations of this already.  compiler.h
has both OPTIMIZER_HIDE_VAR() and RELOC_HIDE().

>  Otoh though the use of "+r" is more restricting than truly
> necessary: While I'm not sure if "+g" would work, i.e. if that wouldn't
> cause issues with literals,

OPTIMIZER_HIDE_VAR() is indeed buggy using "+g", and RELOC_HIDE() even
explains how "g" tickles a bug in a compiler we probably don't care
about any more.

[Slightly out of order] the use of OPTIMIZER_HIDE_VAR() in gsi_vioapic()
is bogus AFAICT, and is actively creating the problem the commit message
says it was trying to avoid.

>  pretty surely "+rm" ought to work, removing
> the strict requirement for the compiler to put a certain value in a
> register.

"+rm" would be ideal in theory, we can't use it in practice because
Clang will (still!) interpret it as "+m" and force a spill.

While that's not necessarily a problem for the SELF_TESTS, it really is
a problem in array_index_mask_nospec(), which is latently buggy even now.

If the compiler really uses the flexibility offered by
OPTIMIZER_HIDE_VAR() to spill the value, array_index_mask_nospec() has
entirely failed at its purpose.

> Assuming you may have reservations against "+g" / "+rm" (and hence the
> construct wants keeping here), maybe rename to e.g. BOOT_CHECK_HIDE()?
> Alternatively, if generalized, moving to xen/macros.h would seem
> appropriate to me.

I've moved it to macros.h (because we should consolidate around it), but
kept as "+r" for both Clang and array_index_mask_nospec() reasons.

I don't expect HIDE() is ever actually going to be used in a case where
letting the value stay in memory is a useful thing overall.  But if you
still feel strongly about it, we can debate further when consolidating
the other users.

~Andrew

