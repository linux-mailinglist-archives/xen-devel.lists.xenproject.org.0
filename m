Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1F89BB88
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 11:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701858.1096410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlCy-0007hy-5V; Mon, 08 Apr 2024 09:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701858.1096410; Mon, 08 Apr 2024 09:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlCy-0007fy-2g; Mon, 08 Apr 2024 09:22:32 +0000
Received: by outflank-mailman (input) for mailman id 701858;
 Mon, 08 Apr 2024 09:22:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtlCx-0007fs-5V
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 09:22:31 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 858ebff3-f589-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 11:22:29 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41691fb4c8fso111295e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 02:22:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b004162d0676cdsm12587551wmb.29.2024.04.08.02.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 02:22:28 -0700 (PDT)
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
X-Inumbo-ID: 858ebff3-f589-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712568149; x=1713172949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cl2hU7SsqDZLKTpXtUK4NE0AfiL7NMbQ/rvUxbPY8nM=;
        b=T/kjZaGEeeU+D3VWgx32tjs8Avea5RlmfqHQHSCu7xk8BkI9+5l9tk9uZ4XDOCODqZ
         Q6VAgJBs0GjNpl0xPRMLd5RYxCTDz8vPjr+0XdzmkvN6ZLNVFxbWfY41NGNR0bsJXGjU
         NSTIpV+jcHlAWnhOtGyYJZ/yXUlfBIPTyCrLR2pom2SwFcujVzPrse7gnTLm86/yzsjU
         oj3oewCbJZIn/qMMBi3bD7NbIJLbjVlHJexBgRPLAnly1vo2L/KJLAkbobtNTKOZAox7
         51WktoFYfyH8dJRzZ7NOyxwDZCiI/uV5JpDfPNP/QNMJsr4qiY2JtgECwCsl9omh5we8
         PVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712568149; x=1713172949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cl2hU7SsqDZLKTpXtUK4NE0AfiL7NMbQ/rvUxbPY8nM=;
        b=L0xK/JRUEibZmwqPbmrKepwlAteJzQDAGv4Bs+WtTZlrlFqMqC5POIrqr+wgOV0S7u
         bsCr5KdVPiii1yyALFb0i/TlVzO162Ykt/IW/wW0vB3E8D2rm+9Ud6CeJ1c31h2hFPEi
         zRjhM4mIwNii1BzwwNfCN6Zjrb+8P1vJb7lfp7hvtbmLW6B4VKHqx4EgaOt0O3rgibJ8
         chcrhmyxhWx7MTSWCewpQF0Eh3fjPCEM0xlQvG2beyOtEx32uLdmkx9b5dcorCXoglZo
         h6arRsZNz9SLHBonrnGTogOgp5CiVZSrMCok1AbNsPvv9bTZ4yw9mPPg5HsnTo8grafu
         rVlg==
X-Forwarded-Encrypted: i=1; AJvYcCWuufIpAgCVPKSOReAi8DnNDTVm5mifUkGJnNHisqhXv82FB+odA/mWw7RPFN6JGsqPkNQzOkyN8ycEivvVvlZFg6QKx78+/HGTglXgRLk=
X-Gm-Message-State: AOJu0YzEqm2a6y3J7SDCbO9/HQepNTa+fYXvg26AVKKXoRBImnqNjKda
	5Hq0re+aMn7h5z/m3gF3t6k+kKLTnj5Jk+2MdhebRxnHrq+BMRQGwHoOhFexLA==
X-Google-Smtp-Source: AGHT+IG/ztrnuvjFzIIf4zcWtlseHUp0yJjR5RjoIKEnJDdHol/9yeJ9jQ6EMDEsVQsgew7WmKs9AQ==
X-Received: by 2002:a05:600c:4f07:b0:416:6d1d:100 with SMTP id l7-20020a05600c4f0700b004166d1d0100mr1464904wmq.33.1712568149032;
        Mon, 08 Apr 2024 02:22:29 -0700 (PDT)
Message-ID: <1ac2619b-443c-4786-ae64-b677b7fa2a9f@suse.com>
Date: Mon, 8 Apr 2024 11:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86: Add usage() to print out usage message
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
 <20240405121128.260493-4-fouad.hilly@cloud.com>
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
In-Reply-To: <20240405121128.260493-4-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 14:11, Fouad Hilly wrote:
> Refactor xen-ucode tool by adding usage() to handle usage\help messages

Would be nice if you could also say why you want this.

> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -17,6 +17,14 @@ static xc_interface *xch;
>  static const char intel_id[] = "GenuineIntel";
>  static const char   amd_id[] = "AuthenticAMD";
>  
> +static void usage(const char *name)
> +{
> +    printf("%s: Xen microcode updating tool\n"
> +            "Usage: %s [<microcode file> | show-cpu-info]\n"
> +            "\n"
> +            , name, name);
> +}

Besides formatting issues you also add an extra \n to the format string,
you convert the previously hard-coded xen-ucode: (which may be okay, but
wants clarifying on why it is done), ...

> @@ -88,9 +96,7 @@ int main(int argc, char *argv[])
>  
>      if ( argc < 2 )
>      {
> -        fprintf(stderr,
> -                "xen-ucode: Xen microcode updating tool\n"
> -                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
> +        usage(argv[0]);
>          show_curr_cpu(stderr);
>          exit(2);
>      }

... and you no longer print to stderr. This being an error path, the
message ought to continue to go there; only a possible -h / --help option
would want it to go to stdout.

Jan

