Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024C09152F7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 17:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746821.1154030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLm2l-0001xK-Pg; Mon, 24 Jun 2024 15:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746821.1154030; Mon, 24 Jun 2024 15:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLm2l-0001vp-MV; Mon, 24 Jun 2024 15:55:47 +0000
Received: by outflank-mailman (input) for mailman id 746821;
 Mon, 24 Jun 2024 15:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLm2k-0001vj-9x
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 15:55:46 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36d5bc4d-3242-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 17:55:44 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ec6635aa43so6029721fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 08:55:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6134sm64442865ad.143.2024.06.24.08.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 08:55:43 -0700 (PDT)
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
X-Inumbo-ID: 36d5bc4d-3242-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719244543; x=1719849343; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xy0R9HMMThtrpJAP2JQ4mwYsE+bQSH0PW5wG/ilTG/k=;
        b=RYjSYU56k4rYev2YRWIy4miLwMS/ZM8Twu0co+Rr1zwfS9Af8noR334Vg65qq54ELi
         ydu0aLsnOp502qJYHuhxbnlnX4OM958RkA169S7alsZELXmQf24WMEIXxhWopnw3VdGO
         Nsaauwc1DAhlGM+zI5MCR3IRTSDM4YZd17eNlaJSci5qnBukIuZAHpL01nSprh+fwtcP
         qrnkHijIbFrs9iRXGVndytx55mMX+O80WWvJQIlwfHBWQ2robH3i8XaBUpEhUxHL6gW0
         UFjcw+HhMsxYOURl8i4EERmb5LRnkoUcUgdcR3pl/NnefwIKE5pu9rjVfwLBo8pAXIts
         ubyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719244543; x=1719849343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xy0R9HMMThtrpJAP2JQ4mwYsE+bQSH0PW5wG/ilTG/k=;
        b=HvV3wrmzgF7jfZ8LIFK5SsptIrZZjR1h7FNA1mGaivXlFOcJCtMr80ugoUwrRJx+AO
         aQT4DOIY7u498HR1c7/YdhE7y2CJAgsRpbvqgYR8Jbyjh0i2miJSVa+BVWzm+/dmCbeu
         31zFtikLJVMNG8FVmTBpUpJWM3/HsvyWgMmyuUtfRyn5OMPylYR4SCsH2FQVwgdsenTz
         LFs+c6d3jLhY0pJkoy12me2RD/BNKe2C2fQG9jdwgeKFDtq7QU8rFWUWOiL44xR8PozE
         nC+xgSM4mCMSAshT0lWfUO9BGUE6eAINIm6W7KNbp+vVa5a9KjoX0YVk5UrMUSz8AttY
         BaZg==
X-Forwarded-Encrypted: i=1; AJvYcCWeotbvfWksAwUxUZPf6kJwLMS4dRrKyA0e81sY+1YINhijhRnYtwqV4MVjR/5uunSxhwm4p2sA/Ry/KgsUveWHqAyjLO7TtD02uit41pA=
X-Gm-Message-State: AOJu0YxyyC6mk5hmaJgF5wG9MOKnniL/kICISMQgpLGEO0oTC16OvfN7
	34Z0auiEfOCC+fEhH8GduvMg82fXc9mVjLJCLb7yYZY/fI3tY3LoQwTPUNEjUA==
X-Google-Smtp-Source: AGHT+IHH0xNdhs/VsoD0F9On73Wa3NZNtFLUx49qZ8n9YYqpxcfCpfLjBdHHK6k7hQEtLa8WMA+lrA==
X-Received: by 2002:a2e:8693:0:b0:2ec:4eca:7479 with SMTP id 38308e7fff4ca-2ec579846admr35636921fa.30.1719244543560;
        Mon, 24 Jun 2024 08:55:43 -0700 (PDT)
Message-ID: <45c69745-b060-4697-9f6e-b3d2a8860946@suse.com>
Date: Mon, 24 Jun 2024 17:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20240621191434.5046-1-tamas@tklengyel.com>
Content-Language: en-US
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
In-Reply-To: <20240621191434.5046-1-tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 21:14, Tamas K Lengyel wrote:
> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
>  	$(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
>  
> +libfuzzer-harness: $(OBJS) cpuid.o
> +	$(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=fuzzer $^ -o $@

What is LIB_FUZZING_ENGINE? I don't think we have any use of that in the
tree anywhere.

I'm further surprised you get away here without wrappers.o.

Finally, despite its base name the lack of an extension suggest to me
this isn't actually a library. Can you help me bring both aspects together?

> @@ -67,7 +70,7 @@ distclean: clean
>  
>  .PHONY: clean
>  clean:
> -	rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcno *.gcov
> +	rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcno *.gcov libfuzzer-harness

I'm inclined to suggest it's time to split this line (e.g. keeping all the
wildcard patterns together and moving the rest to a new rm invocation).

> --- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> +++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> @@ -906,14 +906,12 @@ int LLVMFuzzerTestOneInput(const uint8_t *data_p, size_t size)
>  
>      if ( size <= DATA_OFFSET )
>      {
> -        printf("Input too small\n");
> -        return 1;
> +        return -1;
>      }
>  
>      if ( size > FUZZ_CORPUS_SIZE )
>      {
> -        printf("Input too large\n");
> -        return 1;
> +        return -1;
>      }
>  
>      memcpy(&input, data_p, size);

This part of the change clearly needs explaining in the description.
It's not even clear to me in how far this is related to the purpose
of the patch here (iow it may want to be a separate change, depending
on why the change is needed).

Jan

