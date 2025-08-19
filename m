Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A870B2C572
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 15:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086615.1444814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoMLR-0005Ny-IB; Tue, 19 Aug 2025 13:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086615.1444814; Tue, 19 Aug 2025 13:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoMLR-0005LY-Em; Tue, 19 Aug 2025 13:25:45 +0000
Received: by outflank-mailman (input) for mailman id 1086615;
 Tue, 19 Aug 2025 13:25:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoMLP-0005LS-Il
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 13:25:43 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01295666-7d00-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 15:25:42 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61a2a5b06cdso4695115a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 06:25:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce71e1asm1022209666b.27.2025.08.19.06.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:25:41 -0700 (PDT)
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
X-Inumbo-ID: 01295666-7d00-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755609942; x=1756214742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QG2PAxqFiSIzAAFN+iliKunpx1bwRMMvuHedKf70fZs=;
        b=JYrMlS1jTzUIFWbsQVhZbkDyo6Ck+GUjDHNb7W9mQVs0DzzutU6UanXwHu9v3YS9nG
         Q21I1VFZ9GH3yCv2KSjRAjINxPxsxMK35vbPcDqOyeuRD5tM3X88YjirRSudzQf8I/go
         WdHssliJI6SE1j7EDrhoEonJyWjQUon64x+d8dSmcnx11aB0IOIuPu5y4snn4fG+kfiU
         njPUzEGSLHY5a9ZcEoP7RIMJW1YHS0SI8RUTmxqE1LguOLykOyVTQ5MWUvjlEkdPjzDx
         wsv5OCIwBu9qsKjLZ/tvKH5oCptAm+NkygQC+8Hv47AkPaSIbVZz2WLCo/Zm/rmVoeFG
         rVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609942; x=1756214742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG2PAxqFiSIzAAFN+iliKunpx1bwRMMvuHedKf70fZs=;
        b=sF8TgjWU4mOIGgblSSzg+0MzByHk/Ryypqe/6JB6eI3LteI4OCABK6650xt0sMcFNP
         Vaf+aKJ/a+PcS4tXzBf4DRj2IsFkXuig3MLyMYCkl2nINtr/Lc5rFZeOobFzs9O/p5fZ
         LRbPVGL0dnu4emD/pdvtEHoo4w2ng9J9w3R8zQvyy3NbV7FCvkLQNcS9jXpWezNgH4AW
         SvT6peAy+il6cU7vuBGRUufQ4pcn9A6ljNNo1b7ivOIFrakRQzXwmMV3nPAgW0pXMRzI
         OUKrdw/9bun8FIVn46H0w0qtPllg+Zb6Sk5CmzazyFjiOOadRgDZoMZ4VW4s+o0i7oty
         E5EQ==
X-Forwarded-Encrypted: i=1; AJvYcCX26DneSVrNQzwbjL8A2IcbVP/S+jPr7tbM2krtN3H3w/0G4r/rXPamCJ+Knni70ebgeVSSPscDp0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2i1JyETkRF7dFGkCZdahjzk2luKCG5icbb7QKmU5zBJOCmfA0
	vhw8AbDPFIar4WtCxRqkoYf+x92Ls2Wdhs/TVTOw+76fqzICWnWydy/LTP5w3xmLVw==
X-Gm-Gg: ASbGncvm/TPSYuQ66PZwdVgF7p/LwhUvDPiXvgwYAg7X+VBakXzB6W5apidb1qkFDDK
	gn4lL1vo3tDe/tmRDwfsezTsymvuguXGSuCY48R08NwHYj+zSNh2NWQYYcSPGc/AzrUEzSyA+UZ
	aVMqM4xPJhdDPT48FwosmwDo4bPfB7K61w7/rlmkc+rM56Ky9iFauFpWsNpbhUu1OFS+tewPDTs
	Qw8FH1tDsaAA8ryGbwcURwPFFD89fSrYOpATDByHKy7qo8BZLnndFgrlpooRB7gVKxNrHqhxwcT
	m9SGa9m7QpCqIk/RJlYjvmJUD8z/8sEHqGujUd+qXRmBfuIpufbrMAD0L1EbjeP7ka3o7wEaceD
	ZzaHJrr7iClEbVkTrbF7/CT6DAQCS0OOuW2hoFkn+eUqOdM8MCBLP1nUMAqC+2XbnuWdG10g21K
	wDMehp/DiMJ975Z+Mr/Q==
X-Google-Smtp-Source: AGHT+IHOEoEl+wOoO6pR7gEfeYXWQI3PcnC+jIodNYKlmUSp/7oKx12sOz+KL9RYY+AB9n1vY8W7GQ==
X-Received: by 2002:a17:907:3d8c:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-afddd0cfeadmr257341466b.37.1755609941627;
        Tue, 19 Aug 2025 06:25:41 -0700 (PDT)
Message-ID: <37c61f78-b723-4611-b9d5-f915f72f36e8@suse.com>
Date: Tue, 19 Aug 2025 15:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation for PrintErrMesg() function
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5944d87aae330246b7dab6eebd04d5d71a7d7e8f.1755608417.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <5944d87aae330246b7dab6eebd04d5d71a7d7e8f.1755608417.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.08.2025 15:12, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code."
> 
> The function 'PrintErrMesg()' is implemented to never return control to
> its caller. At the end of its execution, it calls 'blexit()', which, in
> turn, invokes '__builtin_unreachable()'. This makes the 'return false;'
> statement in 'read_file()' function unreachable.

I'm disappointed. In earlier review comments I pointed out that there are
two. Yet you say "the", without further disambiguation.

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -41,6 +41,10 @@ not executable, and therefore it is safe for them to be unreachable."
>  -call_properties+={"name(__builtin_unreachable)&&stmt(begin(any_exp(macro(name(ASSERT_UNREACHABLE)))))", {"noreturn(false)"}}
>  -doc_end
>  
> +-doc_begin="Unreachability caused by the call to the 'PrintErrMesg()' function is deliberate, as it terminates execution, ensuring no control flow continues past this point."
> +-config=MC3A2.R2.1,reports+={deliberate, "any_area(^.*PrintErrMesg.*$ && any_loc(file(^xen/common/efi/boot\\.c$)))"}
> +-doc_end

I don't understand the description here, nor ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -97,6 +97,13 @@ Deviations related to MISRA C:2012 Rules:
>         Xen expects developers to ensure code remains safe and reliable in builds,
>         even when debug-only assertions like `ASSERT_UNREACHABLE() are removed.
>  
> +   * - R2.1
> +     - Function `PrintErrMesg()` terminates execution (at the end it calls
> +       `blexit()`, which, in turn, invokes `__builtin_unreachable()`), ensuring
> +       no code beyond this point is ever reached. This guarantees that execution
> +       won't incorrectly proceed or introduce unwanted behavior.
> +     - Tagged as `deliberate` for ECLAIR.

.. the text here. PrintErrMesg() is noreturn. Why would anything need saying about
it? Isn't the problem here solely with the tail of read_file(), while other uses
of PrintErrMesg() are okay?

Jan

