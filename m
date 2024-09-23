Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDBA97EA91
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801963.1212050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssh4o-0003FK-HF; Mon, 23 Sep 2024 11:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801963.1212050; Mon, 23 Sep 2024 11:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssh4o-0003CY-DY; Mon, 23 Sep 2024 11:17:58 +0000
Received: by outflank-mailman (input) for mailman id 801963;
 Mon, 23 Sep 2024 11:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbeJ=QV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ssh4m-0003CP-JB
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:17:56 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a6f8f31-799d-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 13:17:54 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53567b4c3f4so4416449e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:17:54 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061096aa2sm1209688666b.35.2024.09.23.04.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 04:17:53 -0700 (PDT)
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
X-Inumbo-ID: 7a6f8f31-799d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727090274; x=1727695074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7n4d7hHoPxnlW0tjFg55iKLL0xyp1Wf4icNqhIVu508=;
        b=stJ2HUTwlsXni2j9FSaW3qJASgRA9tTNDWjpI7NgcGy3aSAc2Ti3LF1uW79lUrugW2
         9K6QNxOQ2U7rq9Lv7uJppwEf7/g3FIHT3eA8UTNZYYi7p33QHphNS//VzH7IdC+dJ1lt
         c7xPYoH3Sr8mMDXjjtGQXRBHfMqq0PqDnbu0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727090274; x=1727695074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n4d7hHoPxnlW0tjFg55iKLL0xyp1Wf4icNqhIVu508=;
        b=dU93Wkdgl/T/7ct6gj57g5tZoA3JKaH027RFDfQVwTSRaPIjOjB+OC4SDVN5nK8DD2
         WECX+ESKu8wkGMzUjW4k0OufaPYF5B6EmM9ughSx7bHtPyZKfjT5HMvJyVva87lg5sVo
         GZdX3KH1wS4U23953L8j81xFofgASwFpRVzrZ6rjf3QRfMx7EJ9hSJ9LPrm7rX/B0zj/
         xTOC8Zf7rU7eDuaSoqNgginQOFYsi6s+5oritaIlPDUUbzYjPcgbJcK5BLfJVuCflQFe
         1BwhJsP8Mm6wGXA8/yGShenRCcoAsqeQhWieBAofS3435mIvYW5F45vsgBCsYEoijKxe
         RrUw==
X-Forwarded-Encrypted: i=1; AJvYcCX+RBMz2m8b4ajVdQuTHLFjSZcXgS7OkCCWnR2OYUUnup5WV8SmuUYNGf3iAJ0oh9gUCwstEf78nU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxGuLp2PgfVHsCTxAdxx9BPRx1du37gPHdrjz+XrEX4+liq0Xb
	UIudpb2CJvq+FS1zrnLN8cmakUK0XKLcv3UiedvdtlGMciQT6aQZFYQV2hTXaX8=
X-Google-Smtp-Source: AGHT+IEcL3FZzcZW//HkvhrwOlPaidcxVkBzd5xAmIKoOdPaFppZ+5ydreldNX+4B82kVxECt/ScbA==
X-Received: by 2002:a05:6512:32c8:b0:536:54db:ddd0 with SMTP id 2adb3069b0e04-536ac179fdamr5740031e87.0.1727090273749;
        Mon, 23 Sep 2024 04:17:53 -0700 (PDT)
Message-ID: <f9ff1d2e-0d4f-4b28-83dc-b7f26f3fe86c@citrix.com>
Date: Mon, 23 Sep 2024 12:17:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/alternatives: relax apply BUGs during runtime
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roge.rpau@citrix.com>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-5-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240920093656.48879-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/09/2024 10:36 am, Roger Pau Monne wrote:
> alternatives is used both at boot time, and when loading livepatch payloads.
> While for the former it makes sense to panic, it's not useful for the later, as
> for livepatches it's possible to fail to load the livepatch if alternatives
> cannot be resolved and continue operating normally.
>
> Relax the BUGs in _apply_alternatives() to instead return an error code if
> alternatives are applied after boot.
>
> Add a dummy livepatch test so the new logic can be assessed, with the change
> applied the loading now fails with:
>
> alt table ffff82d040602024 -> ffff82d040602032
> livepatch: xen_alternatives_fail applying alternatives failed: -22
>
> Signed-off-by: Roger Pau Monné <roge.rpau@citrix.com>
> ---
>  xen/arch/x86/alternative.c                 | 29 ++++++++++++++++------
>  xen/arch/x86/include/asm/alternative.h     |  3 ++-
>  xen/common/livepatch.c                     | 10 +++++++-
>  xen/test/livepatch/Makefile                |  5 ++++
>  xen/test/livepatch/xen_alternatives_fail.c | 29 ++++++++++++++++++++++
>  5 files changed, 66 insertions(+), 10 deletions(-)
>  create mode 100644 xen/test/livepatch/xen_alternatives_fail.c
>
> diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
> index 7824053c9d33..c0912cb12ea5 100644
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -174,10 +174,13 @@ extern void *const __initdata_cf_clobber_end[];
>   * The caller will set the "force" argument to true for the final
>   * invocation, such that no CALLs/JMPs to NULL pointers will be left
>   * around. See also the further comment below.
> + *
> + * Note the function cannot fail if system_state < SYS_STATE_active, it would
> + * panic instead.  The return value is only meaningful for runtime usage.
>   */
> -static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
> -                                                  struct alt_instr *end,
> -                                                  bool force)
> +static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
> +                                                 struct alt_instr *end,
> +                                                 bool force)
>  {
>      struct alt_instr *a, *base;
>  
> @@ -198,9 +201,17 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>          uint8_t buf[MAX_PATCH_LEN];
>          unsigned int total_len = a->orig_len + a->pad_len;
>  
> -        BUG_ON(a->repl_len > total_len);
> -        BUG_ON(total_len > sizeof(buf));
> -        BUG_ON(a->cpuid >= NCAPINTS * 32);
> +#define BUG_ON_BOOT(cond)                                       \
> +    if ( system_state < SYS_STATE_active )                      \
> +        BUG_ON(cond);                                           \
> +    else if ( cond )                                            \
> +        return -EINVAL;
> +
> +        BUG_ON_BOOT(a->repl_len > total_len);
> +        BUG_ON_BOOT(total_len > sizeof(buf));
> +        BUG_ON_BOOT(a->cpuid >= NCAPINTS * 32);
> +
> +#undef BUG_ON_BOOT

The "error handling" before was horrible and this isn't really any better.

This function should always return int, printing more helpful info than
that (a printk() says a thousand things better than a BUG()), and
nmi_apply_alternatives can panic() rather than leaving these BUG()s here.

As a tangent, the __must_check doesn't seem to have been applied to
nmi_apply_alternatives(), but I'd suggest dropping the attribute; I
don't think it adds much.

> diff --git a/xen/test/livepatch/xen_alternatives_fail.c b/xen/test/livepatch/xen_alternatives_fail.c
> new file mode 100644
> index 000000000000..01d289095a31
> --- /dev/null
> +++ b/xen/test/livepatch/xen_alternatives_fail.c
> @@ -0,0 +1,29 @@
> +/*
> + * Copyright (c) 2024 Cloud Software Group.
> + *
> + */
> +
> +#include "config.h"
> +#include <xen/lib.h>
> +#include <xen/livepatch_payload.h>
> +
> +#include <asm/alternative.h>
> +#include <asm/cpuid.h>
> +
> +void test_alternatives(void)
> +{
> +    alternative("", "", NCAPINTS * 32);
> +}
> +
> +/* Set a hook so the loading logic in Xen don't consider the payload empty. */
> +LIVEPATCH_LOAD_HOOK(test_alternatives);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

The second half of the patch (new testcase) is all fine and good, but
should pass with patch 2 in place?  I'd suggest splitting it out.

~Andrew

