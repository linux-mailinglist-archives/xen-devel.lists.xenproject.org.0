Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20DF8421AB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 11:43:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673294.1047635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUlZp-0003Fp-Tv; Tue, 30 Jan 2024 10:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673294.1047635; Tue, 30 Jan 2024 10:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUlZp-0003DH-Qu; Tue, 30 Jan 2024 10:42:49 +0000
Received: by outflank-mailman (input) for mailman id 673294;
 Tue, 30 Jan 2024 10:42:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUlZo-0003DB-Bm
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 10:42:48 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e7b4cba-bf5c-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 11:42:47 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cf595d5b4aso28959461fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 02:42:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ck13-20020a056e02370d00b003627a7f95a7sm2812134ilb.0.2024.01.30.02.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 02:42:46 -0800 (PST)
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
X-Inumbo-ID: 4e7b4cba-bf5c-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706611366; x=1707216166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AwmBzMlzlzKXennwaXJ1mCJhDvUMB1pK8OT3erYgdB4=;
        b=bufze6a0kFH8GPeZsiL5wJXZ8oY6y+CPA6sZzd3v64XmnhvxebLiwhZe8BycrGIR+1
         oPsfhpD8h/P2B9ZxYETh6mItXQJFL5B+oINCBY+VmUZ5BYR/rKntC5RL2Xp7wiJA8M3j
         +dOZ4qEWZihvf1hl1jSgdFgUVsxUfXDoh4yIZiKCQAJy/TAX0KSlezWZ6waFd1QeDF+T
         eWOvcV623DKg0JGWc+pRRpxryZ2ZodAF2+4cPuA9QTc0MbgsmSDy1mInMpD0B2+AeH+l
         M9bmEfWp8cLYJ8abMP0CHsgUz9vdnXIXdaOTJ8+4Spme/IecVl7NgscyGsi4QkQmCQcc
         UOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706611366; x=1707216166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwmBzMlzlzKXennwaXJ1mCJhDvUMB1pK8OT3erYgdB4=;
        b=HF8tdCXtCw7XCLQRvWM63hXBucROe/K/vbjY7NuESfjPBmSP0/HFESU4iGs+5OY6C7
         AEW2p+o15eWyEuzZsg75v+6BKAODLNheOrXkpIlTv1XaPrW29MZr+d/uqsuvAO3Lb3vt
         Q/ohKvg+70MQdUFSevmrObSnHcxuRW4q/KQYHQhBiWh3nrFPDrdxCe22SdopXMlJDrxR
         RyI4Mt+ilKpPxsazVW71lZ9NaEZqiMin5+vKBgO0vyw4aLfeMqy5CoFVdNT8kIugLXCA
         5T5tjyooMF1GBhb9vIP7a1JpVlJtQGnb1LmhUHYkB8+MzWFdcdAH+z6ujAWG9oc3yFpQ
         B3lg==
X-Gm-Message-State: AOJu0Yx9NfRKM5UvFXoAT/Zh/LlvGkipFYFTlqU6pc93IqaPOrS8dFEW
	2GkHUxEZMnAHEwJVGVZ0Duq+2xQDs3lkh1A5Pb/dcG22cEWU8gBYLqw0aDlkSQ==
X-Google-Smtp-Source: AGHT+IFMhZswrmycdBaGGTBuOX/6RZnWklj9ylngnyDC3z1f5O4TAlTxD5lLEhmmuiF+mFZ/GhFFMQ==
X-Received: by 2002:a2e:8802:0:b0:2d0:417a:4a7b with SMTP id x2-20020a2e8802000000b002d0417a4a7bmr4444811ljh.21.1706611366549;
        Tue, 30 Jan 2024 02:42:46 -0800 (PST)
Message-ID: <7f514c59-dbf1-44ea-a589-dbc43f0b4ee4@suse.com>
Date: Tue, 30 Jan 2024 11:42:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] XTF: tests SPEC_CTRL added bits
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130102719.51150-1-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20240130102719.51150-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 11:27, Roger Pau Monne wrote:
> Dummy set/clear tests for additional spec_ctrl bits.
> ---
>  docs/all-tests.dox  |   2 +
>  tests/test/Makefile |   9 ++++
>  tests/test/main.c   | 100 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 111 insertions(+)
>  create mode 100644 tests/test/Makefile
>  create mode 100644 tests/test/main.c

I'm puzzled: Why "test"? That doesn't describe in any way what this test
is about.

> --- /dev/null
> +++ b/tests/test/Makefile
> @@ -0,0 +1,9 @@
> +include $(ROOT)/build/common.mk
> +
> +NAME      := test
> +CATEGORY  := utility
> +TEST-ENVS := hvm32 pv64

Any reason for this limitation?

> --- /dev/null
> +++ b/tests/test/main.c
> @@ -0,0 +1,100 @@
> +/**
> + * @file tests/test/main.c
> + * @ref test-test
> + *
> + * @page test-test test
> + *
> + * @todo Docs for test-test
> + *
> + * @see tests/test/main.c
> + */
> +#include <xtf.h>
> +
> +#define MSR_SPEC_CTRL                       0x00000048
> +#define  SPEC_CTRL_IPRED_DIS_U              (_AC(1, ULL) <<  3)
> +#define  SPEC_CTRL_IPRED_DIS_S              (_AC(1, ULL) <<  4)
> +#define  SPEC_CTRL_RRSBA_DIS_U              (_AC(1, ULL) <<  5)
> +#define  SPEC_CTRL_RRSBA_DIS_S              (_AC(1, ULL) <<  6)
> +#define  SPEC_CTRL_DDP_DIS_U                (_AC(1, ULL) <<  8)
> +#define  SPEC_CTRL_BHI_DIS_S                (_AC(1, ULL) << 10)
> +
> +const char test_title[] = "SPEC_CTRL";
> +
> +static void update_spec_ctrl(uint64_t mask, bool set)
> +{
> +    uint64_t spec_ctrl = rdmsr(MSR_SPEC_CTRL);
> +
> +    if ( set )
> +        spec_ctrl |= mask;
> +    else
> +        spec_ctrl &= ~mask;
> +
> +    wrmsr(MSR_SPEC_CTRL, spec_ctrl);
> +}
> +
> +static void assert_spec_ctrl(uint64_t mask, bool set)
> +{
> +    uint64_t spec_ctrl = rdmsr(MSR_SPEC_CTRL);
> +
> +    if ( (spec_ctrl & mask) != (set ? mask : 0) )
> +    {
> +        xtf_failure("SPEC_CTRL expected: %#" PRIx64 " got: %#" PRIx64 "\n",
> +                    set ? (spec_ctrl | mask) : (spec_ctrl & ~mask),
> +                    spec_ctrl);
> +        xtf_exit();
> +    }
> +}
> +
> +static void test_loop(uint64_t mask)
> +{
> +    update_spec_ctrl(mask, true);
> +    assert_spec_ctrl(mask, true);
> +    /* Ensure context switch to Xen. */
> +    hypercall_yield();

I'm afraid yielding doesn't guarantee context switching in Xen, if the
system (or even just the one CPU) is otherwise idle. Hence at the very
least please don't say "ensure" in the comment. But perhaps more
reliable to e.g. use "poll" with a timeout. While I didn't post that
addition, I've used such for testing my vCPU-area-registration work:

        struct sched_poll poll = { .timeout = s + SECONDS(1) };
        rc = hypercall_sched_op(SCHEDOP_poll, &poll);
        if ( rc )
            xtf_error("Could not poll (%d)\n", rc);

(there also to ensure enough time passes for the time area to be
updated).

I actually found this to have another neat side effect: The guest then
can't go away so quickly that "xl console" doesn't manage to attach to
the guest (which otherwise I observe to work only about every other
time).

Jan

