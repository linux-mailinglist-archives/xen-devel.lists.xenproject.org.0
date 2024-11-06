Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D359BE571
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830725.1245795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8e7Q-0001hp-N4; Wed, 06 Nov 2024 11:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830725.1245795; Wed, 06 Nov 2024 11:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8e7Q-0001ef-Jm; Wed, 06 Nov 2024 11:22:36 +0000
Received: by outflank-mailman (input) for mailman id 830725;
 Wed, 06 Nov 2024 11:22:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8e7P-0001eZ-Q6
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:22:35 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a075abf-9c31-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 12:22:32 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d808ae924so3690717f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:22:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7b50sm19116422f8f.6.2024.11.06.03.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 03:22:31 -0800 (PST)
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
X-Inumbo-ID: 6a075abf-9c31-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzQiLCJoZWxvIjoibWFpbC13cjEteDQzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZhMDc1YWJmLTljMzEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODkyMTUyLjA4ODAxLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730892151; x=1731496951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=499VpUdxJcvds9v0jzsCqADRq/dDHmDNGNQLnL2XRLc=;
        b=gEu/c8na5V87WqFUaNqknZy9/fRdI0ODOAHvzGJXj+GnAJY3qA37/SXcRJrx2svkJe
         S2OR2w6pcngWwgFUvsbtsmmwmBVvnsrGaZ8tbqa+XzFu04wHpmbeeFqu3T7R2HdInBTi
         eBTp1PZ3lR3szgcX+iU8U+N27E1K4+/GaBqw2j67e3WlzTBFY/Dimn1lMrAvLcdpRWIc
         PrvpbDFpJ2wO1pXXIjrQ4ZiY6vLskX3cBrNQQa7tmQQhstuHx1upNfLNUpAoFbxAyHRG
         yRTdX8Q62PfkACO740prH+bRJgeUAe6o0fCBUoGKURkh8nvGzc98ArrtOdfZ/ewEiKJO
         qBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730892151; x=1731496951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=499VpUdxJcvds9v0jzsCqADRq/dDHmDNGNQLnL2XRLc=;
        b=P5qh45RAnFI53DPNe6tBhRWblBOSiFWCZiw42v0uyIm7FJmT+R9eKLBCmQqe6+57h5
         h5y0iPCgtcxACBAYGANkxcuE1s13NJyXV5KKJZseE6VGrypkiRcyKHshxsBk/UDjF7sB
         qlOSMaHAeoQ4Woyv3eSg+MfWdVY5SctepJy6zH6PZavfH3muW5dmNiASQW7p/hAXYZ95
         IvIMzRoCwGCU6CbuNa1yXq12cIkLjYjaBDMzNuh9ViO8smITx9OD4gnvMUYVwjaiDVmy
         CR6jalrPD/yBYgjpnxYP/EcTC37URbT8u0UwjcXLH9q1Ni0LVMs4uPcd9CzR/q2H64Zp
         B8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0DBBcWAqw7EOt57M6ULtwPNh8qXtSf9IV2XPxMz2toAexy9b+6dCyimcdAQwgfn9woIo54MT0Qlg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOL8hTzkUQ9+kc9p93tYkdNvZ+6RBtGjyUO+tVOknC7RHe0VwL
	x0SxVNaSf3NVVg5gCuKWh5BF+SA0USg421W1FrQx4jKQOsuBc5iVqzo21E8/Gg==
X-Google-Smtp-Source: AGHT+IHZPUd63HBMWCG6dftQ76kUx87ySeJH4RM+wvnMi8UfvuK08F2FLJzlffMx9i7LUt4KBP/qOA==
X-Received: by 2002:adf:f68b:0:b0:37d:50e1:b3e1 with SMTP id ffacd0b85a97d-3806113d082mr29102295f8f.16.1730892151362;
        Wed, 06 Nov 2024 03:22:31 -0800 (PST)
Message-ID: <be21f3cf-e7a8-469a-99a6-4098032a4df4@suse.com>
Date: Wed, 6 Nov 2024 12:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] x86/emul: define pseudo keyword fallthrough
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1730880832.git.federico.serafini@bugseng.com>
 <a0341b50ece1ba1b5b346b54db7d2abdc150cb95.1730880832.git.federico.serafini@bugseng.com>
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
In-Reply-To: <a0341b50ece1ba1b5b346b54db7d2abdc150cb95.1730880832.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2024 10:04, Federico Serafini wrote:
> The pseudo keyword fallthrough shall be used to make explicit the
> fallthrough intention at the end of a case statement (doing this
> through comments is deprecated).
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/x86_emulate/x86_emulate.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)

When you had asked my privately on Matrix, I specifically said: "Adding
the pseudo-keyword to x86-emulate.h (not x86_emulate.h) is probably best,
unless problems with that approach turn up." Even if identical re-
definitions are deemed fine, I for one consider such bad practice. Yet
by playing with this file (and outside of any relevant #ifdef) means
there will be such a re-definition when building Xen itself.

In fact the patch subject should also already clarify that the auxiliary
definition is only needed for the test and fuzzing harnesses.

> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -23,6 +23,16 @@
>  # error Unknown compilation width
>  #endif
>  
> +/*
> + * Pseudo keyword 'fallthrough' to make explicit the fallthrough intention at
> + * the end of a case statement.
> + */
> +#if (!defined(__clang__) && (__GNUC__ >= 7))

I realize xen/compiler.h has it like that, but may I ask that you omit
the meaningless outer pair of parentheses?

Jan

