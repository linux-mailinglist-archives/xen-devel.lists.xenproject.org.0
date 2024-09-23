Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9AA97EC11
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 15:12:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802065.1212180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssirU-0001RD-Ag; Mon, 23 Sep 2024 13:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802065.1212180; Mon, 23 Sep 2024 13:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssirU-0001PN-7v; Mon, 23 Sep 2024 13:12:20 +0000
Received: by outflank-mailman (input) for mailman id 802065;
 Mon, 23 Sep 2024 13:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbeJ=QV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ssirS-0001PE-9K
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 13:12:18 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 750d45dc-79ad-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 15:12:17 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so700601166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 06:12:17 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b38e9sm1222822966b.118.2024.09.23.06.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 06:12:16 -0700 (PDT)
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
X-Inumbo-ID: 750d45dc-79ad-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727097137; x=1727701937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PdF95bl5nnN/4YuTJkyE5UloHd9hTczo0UgvtYEFjHo=;
        b=akKhC1sR56H6hRzQ3y9i/raqAx8zF98ZLB2bQnCzgNygSnTqLSfdLclYBB8xETpLdv
         3p6g0pI50neHBgJnBePzFdez8PKQT4flXpK/CVdgKGj+KHBvI9E5uePT06XzmkXsM9Fb
         TYyVMc93KxxKN9goNj57i4fgNl5a2bkDCS2xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097137; x=1727701937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdF95bl5nnN/4YuTJkyE5UloHd9hTczo0UgvtYEFjHo=;
        b=jjHjJYt+Us6v0cO2F7z/VlrX7NRQqvhObvmTzhUkhZS6YFGE3RwO514e0CB0I9IaUn
         bM7jtPWgGp7skE5vLtPJhazAr9YokOFYf6Yx8HbZ27YDV9HFvkmT1VuEnaM33wu/zC2F
         lLryH6ss/jStbX7C1roUFB8BMLWynETUwbqj8fAqzFf0TdNV+ZpG4WGPKr/Fi5wSuP3n
         g9TQTbWEwrbysM+MMlN0eV9P+mJQYzrCvNqDHZbC4Dm4+4NMZHGR3u4nnSHAbw/JIZCw
         YP7gzFTUk3i9aphacNpfAT3Rmx4FoqhOOH4HxsUKmVROP0ZSZEmXDqri5O1sV2JAB70b
         cmLg==
X-Gm-Message-State: AOJu0Yy0LJx+LzfDP5QS+ZB+apBDGgpZg/3iUrbMPwxjJx6SzBkGBEo4
	lI44usnySeY0sXF3ehpyxV0T5TnlryJfIzMzauz0amjBZhbDNI90Nt+v/9WTBVM=
X-Google-Smtp-Source: AGHT+IEtUKwEa1H8Zd6homCtm/BCoZAd5plBDzvnPDSEbMrsYmjoMC43VGqSt5tLxxbBr0rIzGlB7Q==
X-Received: by 2002:a17:907:f184:b0:a8a:913e:418b with SMTP id a640c23a62f3a-a90d4ffdea1mr1130262766b.20.1727097136560;
        Mon, 23 Sep 2024 06:12:16 -0700 (PDT)
Message-ID: <0df7487f-e5dd-4ecd-a8d9-e7278f37fb6e@citrix.com>
Date: Mon, 23 Sep 2024 14:12:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/alternatives: relax apply BUGs during runtime
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roge.rpau@citrix.com>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-5-roger.pau@citrix.com>
 <f9ff1d2e-0d4f-4b28-83dc-b7f26f3fe86c@citrix.com>
 <ZvFnzrVpf4sUesVP@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZvFnzrVpf4sUesVP@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/09/2024 2:06 pm, Roger Pau Monné wrote:
> On Mon, Sep 23, 2024 at 12:17:51PM +0100, Andrew Cooper wrote:
>> On 20/09/2024 10:36 am, Roger Pau Monne wrote:
>>> alternatives is used both at boot time, and when loading livepatch payloads.
>>> While for the former it makes sense to panic, it's not useful for the later, as
>>> for livepatches it's possible to fail to load the livepatch if alternatives
>>> cannot be resolved and continue operating normally.
>>>
>>> Relax the BUGs in _apply_alternatives() to instead return an error code if
>>> alternatives are applied after boot.
>>>
>>> Add a dummy livepatch test so the new logic can be assessed, with the change
>>> applied the loading now fails with:
>>>
>>> alt table ffff82d040602024 -> ffff82d040602032
>>> livepatch: xen_alternatives_fail applying alternatives failed: -22
>>>
>>> Signed-off-by: Roger Pau Monné <roge.rpau@citrix.com>
>>> ---
>>>  xen/arch/x86/alternative.c                 | 29 ++++++++++++++++------
>>>  xen/arch/x86/include/asm/alternative.h     |  3 ++-
>>>  xen/common/livepatch.c                     | 10 +++++++-
>>>  xen/test/livepatch/Makefile                |  5 ++++
>>>  xen/test/livepatch/xen_alternatives_fail.c | 29 ++++++++++++++++++++++
>>>  5 files changed, 66 insertions(+), 10 deletions(-)
>>>  create mode 100644 xen/test/livepatch/xen_alternatives_fail.c
>>>
>>> diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
>>> index 7824053c9d33..c0912cb12ea5 100644
>>> --- a/xen/arch/x86/alternative.c
>>> +++ b/xen/arch/x86/alternative.c
>>> @@ -174,10 +174,13 @@ extern void *const __initdata_cf_clobber_end[];
>>>   * The caller will set the "force" argument to true for the final
>>>   * invocation, such that no CALLs/JMPs to NULL pointers will be left
>>>   * around. See also the further comment below.
>>> + *
>>> + * Note the function cannot fail if system_state < SYS_STATE_active, it would
>>> + * panic instead.  The return value is only meaningful for runtime usage.
>>>   */
>>> -static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>> -                                                  struct alt_instr *end,
>>> -                                                  bool force)
>>> +static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>> +                                                 struct alt_instr *end,
>>> +                                                 bool force)
>>>  {
>>>      struct alt_instr *a, *base;
>>>  
>>> @@ -198,9 +201,17 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>>          uint8_t buf[MAX_PATCH_LEN];
>>>          unsigned int total_len = a->orig_len + a->pad_len;
>>>  
>>> -        BUG_ON(a->repl_len > total_len);
>>> -        BUG_ON(total_len > sizeof(buf));
>>> -        BUG_ON(a->cpuid >= NCAPINTS * 32);
>>> +#define BUG_ON_BOOT(cond)                                       \
>>> +    if ( system_state < SYS_STATE_active )                      \
>>> +        BUG_ON(cond);                                           \
>>> +    else if ( cond )                                            \
>>> +        return -EINVAL;
>>> +
>>> +        BUG_ON_BOOT(a->repl_len > total_len);
>>> +        BUG_ON_BOOT(total_len > sizeof(buf));
>>> +        BUG_ON_BOOT(a->cpuid >= NCAPINTS * 32);
>>> +
>>> +#undef BUG_ON_BOOT
>> The "error handling" before was horrible and this isn't really any better.
>>
>> This function should always return int, printing more helpful info than
>> that (a printk() says a thousand things better than a BUG()), and
>> nmi_apply_alternatives can panic() rather than leaving these BUG()s here.
> OK, will rework the logic here so it's the caller that panics (or not)
> as necessary, and _apply_alternatives() always prints some error
> message.

Yes.  With alternatives now behind sensible checks in the livepatch
case, any failure here is relevant and wants printing.

>
>> As a tangent, the __must_check doesn't seem to have been applied to
>> nmi_apply_alternatives(), but I'd suggest dropping the attribute; I
>> don't think it adds much.
> I didn't see the value in adding the attribute to
> nmi_apply_alternatives(), as in that context _apply_alternatives()
> would unconditionally panic instead of returning an error code.

Ah, it was only apply_alternatives() you made __must_check, not
_apply_alternatives(), which is why there isn't a compile error in
nmi_apply_alternatives().

Still, I don't think the __must_check is much use.

>
>>> diff --git a/xen/test/livepatch/xen_alternatives_fail.c b/xen/test/livepatch/xen_alternatives_fail.c
>>> new file mode 100644
>>> index 000000000000..01d289095a31
>>> --- /dev/null
>>> +++ b/xen/test/livepatch/xen_alternatives_fail.c
>>> @@ -0,0 +1,29 @@
>>> +/*
>>> + * Copyright (c) 2024 Cloud Software Group.
>>> + *
>>> + */
>>> +
>>> +#include "config.h"
>>> +#include <xen/lib.h>
>>> +#include <xen/livepatch_payload.h>
>>> +
>>> +#include <asm/alternative.h>
>>> +#include <asm/cpuid.h>
>>> +
>>> +void test_alternatives(void)
>>> +{
>>> +    alternative("", "", NCAPINTS * 32);
>>> +}
>>> +
>>> +/* Set a hook so the loading logic in Xen don't consider the payload empty. */
>>> +LIVEPATCH_LOAD_HOOK(test_alternatives);
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * tab-width: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>> The second half of the patch (new testcase) is all fine and good, but
>> should pass with patch 2 in place?  I'd suggest splitting it out.
> No, not really.  The Xen buildid for this patch will be correctly set
> to match the running one, but the alternatives feature CPUID is
> explicitly set to an out of range value (NCAPINTS * 32) to trigger the
> BUG_ON condition.

Ah yes.  Good point.

In which case it probably ought to stay in this patch.

> Further thinking about it, I think we should add a build time assert
> that the feature parameters in the alternative calls are smaller than
> NCAPINTS * 32.

A build check where?  It's quite hard to do in alternatives themselves.

~Andrew

