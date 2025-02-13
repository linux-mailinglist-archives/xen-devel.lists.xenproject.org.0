Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1ADA338C7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 08:26:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887136.1296681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiTbj-0001NZ-4Q; Thu, 13 Feb 2025 07:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887136.1296681; Thu, 13 Feb 2025 07:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiTbj-0001L5-0v; Thu, 13 Feb 2025 07:25:59 +0000
Received: by outflank-mailman (input) for mailman id 887136;
 Thu, 13 Feb 2025 07:25:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiTbh-0001Ku-C0
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 07:25:57 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be24ac25-e9db-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 08:25:47 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab7cb1154abso77593866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 23:25:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53258215sm72944166b.53.2025.02.12.23.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 23:25:46 -0800 (PST)
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
X-Inumbo-ID: be24ac25-e9db-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739431546; x=1740036346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s0oOULasIBlVVJd3pdARmSql3HfuUjAhusOiWfyafKs=;
        b=Ldbs+5cXbaN8sc3pEw6WUW/lGrgmu+hGzxYIi9fePloBZJAz5ek+3BwgeEvW2O1ni2
         /4hWL+upnkR7IHWNaSq/JRbdskRrPqMjv2JzVHzS1p963vU38tQcioSmNDoy1jws9kqf
         R8cSymY881UMTGUhEI75dv+/mVabCptmWmRkKduhyrm2RSlQj1GbaxS5qVttQCxkmN6F
         iklR4RsnnQdUFbDVs7XgmdYw1qHYX7GAwlHiqCid5BOhsyge/Gsz/wiMgoxIq+BGwssq
         vJ5ODtDgdL4h0LyQ+tUPObExGqkd9Q3CNCaYJ/AIHip0WNj/LsCOLpi/Wg/Fk7VWT4Rm
         x96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739431546; x=1740036346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0oOULasIBlVVJd3pdARmSql3HfuUjAhusOiWfyafKs=;
        b=niazcaU9reNrfAvvBXaLo5ZHw3rQdMKQKuJRvx2yzX+RQaDNPnHNQkOKypABdta6w4
         gR/YTdCGEdl+VoLrXV2yPchYJNW1RmWTKLXjEncf49oC/w4dZzz/OMhKRUXJRAbilzWW
         n4OeC5914VMudIy3nE25YDgYshIAkJ1ybWD4Q+DuDh/3sfV8+HAYnexQEDmeVwh+ZH3i
         llTzHaKJu5MNUtK9wSuaVHkYQ7vKWOoZdGhGRlz/1DzCL0s2pKE1Sswwl9V81FlzhAwD
         k5Vj9QJGfStszYdanswp6pgS/ELVP4lHfjF7nmwn0uOeKQXjGyn8t8yY7cc1UQZZ1uQn
         aE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJZUDXhohztRCHTrWnfE1K0Y6U6fLrfMVqMaIRsG9vWGoYeMMIwSfJQE1WgWO9ptbCialTKqeTWSo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8vvTL7SraHlb3+mKx/0DxMTm93C/M2rPqPyedNut3n8UjDHGl
	H1lqkkA6eEKxOkWNhYfs3HzDYDOik7oCNULjP99tE5bjtvz9uEk3EUECh7nyvA==
X-Gm-Gg: ASbGncvxtQT8ouzutNnmJSHdApd+e+mbHg6IgdjxGQCanTzkbpH9sB/p6/ufoCLAPId
	WWcw9IrbKW5BoYfeBkY7kePovbq/uOjgPo//nhfnY8S02v9NjLRs6qX4xBxpaOadnwQHk3LjZKe
	/asH19Owt5QV2eIjun4/Z0j+sVBhl0blXD8sEu4VgsMHmrDfZdKDOD50qvgrqpIBOgtIa65AcxF
	WXnGeyNBr65g5WaSv+aCda/SugSUAHy6vBXyryW9O6xotxOoAhklEV5NKiMGkz6XcIcJcPSrFjm
	b6TKthmdbsozEFQfxgCG9sV7zLFpuJRn0SJEpMv0/9E47zylTGx680+zqmD3YXFbo+pJeATC6cf
	m
X-Google-Smtp-Source: AGHT+IGt2Xo0NrSYd9Al4gUUYatrjA2wTq/SRwsznG5VTo6iof10oJhDEPkCrNKqhNAMRpGuFYBa9A==
X-Received: by 2002:a05:6402:40c9:b0:5de:a6a8:5ec6 with SMTP id 4fb4d7f45d1cf-5dec9d393f8mr4982607a12.10.1739431546469;
        Wed, 12 Feb 2025 23:25:46 -0800 (PST)
Message-ID: <ed268817-8120-4d83-9a6b-0c9bfa9fe728@suse.com>
Date: Thu, 13 Feb 2025 08:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: add keyhandler to print Xen version
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250212235754.3686278-1-dmukhin@ford.com>
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
In-Reply-To: <20250212235754.3686278-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2025 00:58, dmkhn@proton.me wrote:
> Add Xen version printout via keyhandler mechanism.
> 
> That is useful for debugging systems that have been left intact for a long
> time.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

First, +1 to what Andrew said.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -974,6 +974,28 @@ void guest_printk(const struct domain *d, const char *fmt, ...)
>      va_end(args);
>  }
>  
> +static void xen_print_version(void)
> +{
> +    const char *str = NULL;
> +    unsigned int str_len;
> +
> +    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
> +           xen_major_version(), xen_minor_version(), xen_extra_version(),
> +           xen_compile_by(), xen_compile_domain(), xen_compiler(),
> +           xen_build_info(), xen_compile_date());
> +
> +    printk("Latest ChangeSet: %s\n", xen_changeset());
> +
> +    if ( !xen_build_id((const void **)&str, &str_len) )

Why the cast? What wrong with "str" being const void *? The only thing
is that it's then not really a good name for the variable, but that it
isn't anyway. It's not really a string you get back.

> @@ -1024,15 +1046,12 @@ void __init console_init_preirq(void)
>      nrspin_lock(&console_lock);
>      __putstr(xen_banner());
>      nrspin_unlock(&console_lock);
> -    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
> -           xen_major_version(), xen_minor_version(), xen_extra_version(),
> -           xen_compile_by(), xen_compile_domain(), xen_compiler(),
> -           xen_build_info(), xen_compile_date());
> -    printk("Latest ChangeSet: %s\n", xen_changeset());
>  
>      /* Locate and print the buildid, if applicable. */
>      xen_build_init();
>  
> +    xen_print_version();

It may seem minor, but I'm not happy about the reordering. What's logged
would better really be directly after the banner. Any present or future
output from xen_build_init() should come afterwards. Simply add
xen_print_buildid() along with xen_print_version()? And then have it in
version.c, where you can use build_id_{p,len} directly, eliminating the
point above regarding casts and naming.

Jan

