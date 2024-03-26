Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4188BC2A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 09:19:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697959.1089237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp21l-0002UR-T2; Tue, 26 Mar 2024 08:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697959.1089237; Tue, 26 Mar 2024 08:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp21l-0002ST-P1; Tue, 26 Mar 2024 08:19:25 +0000
Received: by outflank-mailman (input) for mailman id 697959;
 Tue, 26 Mar 2024 08:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp21k-0002S2-6g
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 08:19:24 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cdc9ae4-eb49-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 09:19:22 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a474c4faf5eso257657266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 01:19:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k11-20020a1709067acb00b00a4a36e4c3fbsm1875634ejo.182.2024.03.26.01.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 01:19:21 -0700 (PDT)
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
X-Inumbo-ID: 8cdc9ae4-eb49-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711441162; x=1712045962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2Qcyp06X39D73dDP5Z5225X3XCbdlsp8tXnJrL2XrE=;
        b=QpfNM7fKp2OGkZnqpnBE2kuPzUv8jxRt7/GW2xVGHY++TNUCrdx5m1qGiYzdA91PXu
         RYcEmnvtTPZfp7cVXuTSZqaSRkBnHCPkeai/4ZPtq00Vtf+m7KL3Hsygyjf30FTZgKMG
         jTolz5qsDgzPwko2c4Zy4i8ylgTTfPRE9RF89Xco3qqtHb8E2Eex1MyHMVmyNTOexYN7
         lGHC0twoHIDmK8oEwQhgTe6sv8O/C2lopR/MZ0jctguhQjWVdvxArFmINKgLtkvT5WtE
         NkDIF31ZBb6hGkzLIurw7M2oMCrAZlR5PBsDC/b+DbDnoIaOiJ0TP0mOZ71PsIAKCe/U
         j9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711441162; x=1712045962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2Qcyp06X39D73dDP5Z5225X3XCbdlsp8tXnJrL2XrE=;
        b=bVs4DjCjfmMd/SPa/giyF8JhpGtpvwmDqPrZvVd38X2EldIlujBoNi22P1TNLe7XXJ
         l5cd82p6fpaEM9UraY5OJ5ppBEUc3cecUs1/HCHQlZnnrO28KzF9tIuesVa0QdDRHPnz
         VwasiKWIKvVT9fQY8jmlM3savK/4CT0BNOiM/9ZGhsM1dsLtXLJ6xdJDQtps+qTr8bIQ
         i4nyjjXAIRzxAzQeYqHZztPrkG8QIEirC6SHOQ4C+9AvBtXcMhNd4wEeHEHLz65YdHDE
         mDcrsK99NL/OXX4iIsGevTKHHkm0JULqOp0KNG5Wn7SbMxZFzDX7WYDEvL8ngLP1wKag
         cy8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnPrx77nwc/LcVfYoVb+1ov6bozsYsGEJATPV9t9A+I0TobagXv4TH377jAtFayOL2lxjvtPZA8E/f91yHH4F2XfHpNuihUvuvJEn5uNU=
X-Gm-Message-State: AOJu0YzeT4K4drIS45hmWku7BcZbnLc3DS1X78ab8pia/FBWjLUN9RSc
	5OFwLkb2r60Xyzj08cxZhZliVrGRsq5PN/UcW2ZaT8F/9t0JxzjgUWy5E/2tIA==
X-Google-Smtp-Source: AGHT+IG8FYEkCB4CeeUAasu5gPheLtH3tHiXV50mz/zDXRp69qXpI0ufSe3uqurmizL4JVleIeY4Mg==
X-Received: by 2002:a17:906:3e4a:b0:a46:5e1b:58a3 with SMTP id t10-20020a1709063e4a00b00a465e1b58a3mr5845209eji.35.1711441161916;
        Tue, 26 Mar 2024 01:19:21 -0700 (PDT)
Message-ID: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
Date: Tue, 26 Mar 2024 09:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/misc: fix xenwatchdogd invocation
Content-Language: en-US
To: =?UTF-8?Q?zithro_/_Cyril_R=C3=A9bert?= <slack@rabbit.lu>
Cc: Leigh Brown <leigh@solinno.co.uk>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <6f5b09d7bdc555227e7a5e55aa090171fba070f8.1711430145.git.slack@rabbit.lu>
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
In-Reply-To: <6f5b09d7bdc555227e7a5e55aa090171fba070f8.1711430145.git.slack@rabbit.lu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2024 06:15, zithro / Cyril Rébert wrote:
> --- a/tools/misc/xenwatchdogd.c
> +++ b/tools/misc/xenwatchdogd.c
> @@ -8,26 +8,34 @@
>  #include <stdlib.h>
>  #include <unistd.h>
>  #include <signal.h>
> +#include <string.h>
>  #include <stdio.h>
>  
> +#define _GNU_SOURCE

This wants defining first thing in a file (or even on the compiler command
line), to (properly) affect all headers.

> +#include <getopt.h>
> +#if !defined(__GNUC__) && !defined(__GNUG__)

Why __GNUG__ in a C file? And anyway, why is this construct needed? You
don't ...

> +#define __attribute__(arg) /* empty */

... use any attributes down from here.

You mention xentop as where you've taken them from. I view those as
questionable. If in fact you had used any other utility's source for
reference, you wouldn't have encountered such.

> +#endif
> +
>  xc_interface *h;
>  int id = 0;
>  
>  void daemonize(void)
>  {
>      switch (fork()) {
> -    case -1:
> -	err(1, "fork");
> -    case 0:
> -	break;
> -    default:
> -	exit(0);
> +        case -1:
> +            err(1, "fork");
> +        case 0:
> +            break;
> +        default:
> +            exit(0);
>      }

The case labels were properly indented, weren't they? And all other re-
indentation you do wants splitting from the functional change.

> @@ -52,39 +60,68 @@ void catch_usr1(int sig)
>  
>  int main(int argc, char **argv)
>  {
> +
>      int t, s;

What would this new blank line be good for?

>      int ret;
> +    

I'd even question this one.

> +    char *usage = "usage: %s <timeout> <sleep>";

static const char[]

> +    int opt, optind = 0;
> +
> +    struct option lopts[] = {

static const

> +        { "help",          no_argument,       NULL, 'h' },
> +    };
> +    const char *sopts = "h";
> +
> +    while ((opt = getopt_long(argc, argv, sopts, lopts, &optind)) != -1) {
> +        switch (opt) {
> +        case '?':
> +        case 'h':
> +            errx(1, usage, argv[0]);

This isn't an error and hence wants to produce an exit code of 0.

> +            break;
> +        default:
> +            errx(1, usage, argv[0]);
> +        }

Please be consistent with break statements: Either you omit them
uniformly when a noreturn function is call, or you put them there
in all cases.

> +    }
>  
>      if (argc < 2)
> -	errx(1, "usage: %s <timeout> <sleep>", argv[0]);
> +        errx(1, usage, argv[0]);
>  
>      daemonize();
>  
>      h = xc_interface_open(NULL, NULL, 0);
>      if (h == NULL)
> -	err(1, "xc_interface_open");
> +        err(1, "xc_interface_open");
> +
> +    t = strtoul(argv[1], &argv[1], 0);
> +    
> +    // argv1 NaN

NaN is a term normally used for floating point values only.

> +    if ( *argv[1] != '\0' )
> +        errx(1, "Error: timeout must be a number, got '%s'", argv[1]);

This still doesn't guarantee a numeric: An empty string as argument
would still yield a value of 0 if I'm not mistaken. As would a
string consisting of just blanks.

> -    t = strtoul(argv[1], NULL, 0);
>      if (t == ULONG_MAX)
> -	err(1, "strtoul");
> +        err(1, "strtoul");
>  
>      s = t / 2;
>      if (argc == 3) {
> -	s = strtoul(argv[2], NULL, 0);
> -	if (s == ULONG_MAX)
> -	    err(1, "strtoul");
> +        s = strtoul(argv[2], &argv[2], 0);
> +        // argv2 NaN
> +        if ( *argv[2] != '\0' ){
> +            errx(1, "Error: sleep must be a number, got '%s'", argv[2]);
> +        }

Like above you don't really need braces here. If, however, you add
them, the opening one wants to be separated by a blank from the
closing parenthesis. And following other style in this file, there
do not want to be blanks immediately inside the parentheses.

Jan

