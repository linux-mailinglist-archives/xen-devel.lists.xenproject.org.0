Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B779B3510
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826669.1241011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5RpA-0005Li-6G; Mon, 28 Oct 2024 15:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826669.1241011; Mon, 28 Oct 2024 15:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5RpA-0005JP-3C; Mon, 28 Oct 2024 15:38:32 +0000
Received: by outflank-mailman (input) for mailman id 826669;
 Mon, 28 Oct 2024 15:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5Rp8-00058k-VX
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:38:30 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae8254a4-9542-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 16:38:30 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so44966285e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:38:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b4a3cesm9749709f8f.63.2024.10.28.08.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 08:38:29 -0700 (PDT)
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
X-Inumbo-ID: ae8254a4-9542-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730129909; x=1730734709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P/q8/nqfOEa4w/latPmDav4iIL0Fvj3H0JTHhjs9TK8=;
        b=TpiOi0qYC0MaMmyOtqqa9RVR4h2LtweZGqhSaXU28si3YDR2j8Ci2rq6qHaro/s1FM
         ub97mpH70X1Ly5rrWdrfHzvLpODt77EGOmlCgl3FhueghCYtkubEbvSKAQOfrWE/WF9t
         3EVsfNUnpTHsoegB2ZP+gdmG1G1f7b20k3ZJkmsCXKWrDVESiQp/criRjjyuFxXpiLTx
         oYTBKr+aJEGzWFMbU+PW9JjYZwaijckgsmTJAZZAgGYRO57TBAo0mnXHf3IruRzaWnAU
         WBi2Z2tZhfU5w64YWr7u/gqiD2IFX9fBZ3MPWOc6YW7XNqLruBHMD5sfV8FoYZWA1ykm
         HjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730129909; x=1730734709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/q8/nqfOEa4w/latPmDav4iIL0Fvj3H0JTHhjs9TK8=;
        b=ADjRMdFZj0PEf8otM8TyGIjazaylRKnMQfDHAdvBF275vJQPn/ukRPAEA3tFKqAKPp
         uH0+aozi+eBN0WAOToB8YtzlTwlfSdE3XIdjP5urbTiXHdvrc8eYY3ZTiQdNhPMgLwhc
         eBKUgYGM5242EIchinewjzX2Yso3Q0VuJRDIm4x7rsk7SqKqSD1qzdglGAGnnUTHxCnd
         OXa3+QZWtCZ0PHpkbD6wM7tDAm3u2eajR73ZNJdDwAxIYMbIB71aYZ8rvNgsjWRRZp8O
         mDYKC/njwQ+Z7tv+upVaNKcVxail29KwsWj7ImCJclN/bYpeyMU9DOuEQG70vys8xFVr
         1HpA==
X-Forwarded-Encrypted: i=1; AJvYcCVpQAD6OmyZOJ08vU1j+y8EnI1rYsJvsrLXZCDvDlY9Be5GB2ewEz3Fbh+lR7P8K7CVA3ZJiNSCGiA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8m5ExN6oHi3LnzD4wzw0c/L++joFb1yHEnFQnX8i7FusDsaA6
	u2jBJ+iXqdcrQCS0wu87I58FicI0jr/iaQyWgv0QNwMO4hCONY5OV5SViWlElA==
X-Google-Smtp-Source: AGHT+IFz9WrQLX88jqBZ9nu1P+OSzeBgD6aL9EHPa1k6t9rL3rihyNOHqy0mHyhWc1i1QTWBiFrB0w==
X-Received: by 2002:a05:600c:4f51:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-4319ad2d6aamr78406885e9.29.1730129909508;
        Mon, 28 Oct 2024 08:38:29 -0700 (PDT)
Message-ID: <461902a0-66d7-4c1e-8a67-54d0c1be878d@suse.com>
Date: Mon, 28 Oct 2024 16:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] x86/ucode: Use bootstrap_unmap() in
 early_microcode_load()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-9-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241028091856.2151603-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 10:18, Andrew Cooper wrote:
> If bootstrap_map() has provided a mapping, we must free it when done.  Failing
> to do so may cause a spurious failure for unrelated logic later.
> 
> Inserting a bootstrap_unmap() here does not break the use of ucode_{blob,mod}
> any more than they already are.
> 
> Add a printk noting when we didn't find a microcode patch.  It's at debug
> level, because this is the expected case on AMD Client systems, and SDPs, but
> for people trying to figure out why microcode loading isn't work, it might be
> helpful.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Hmm, yes, I think this is correct now (but the mapping had to persist earlier
on, likely years ago). So
Acked-by: Jan Beulich <jbeulich@suse.com>
However, as a nit, ...

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -823,6 +823,7 @@ static int __init early_microcode_load(struct boot_info *bi)
>      size_t size;
>      struct microcode_patch *patch;
>      int idx = opt_mod_idx;
> +    int rc = 0;

... the initializer doesn't appear to be needed here; all paths ...

> @@ -878,15 +879,24 @@ static int __init early_microcode_load(struct boot_info *bi)
>      patch = ucode_ops.cpu_request_microcode(data, size, false);
>      if ( IS_ERR(patch) )
>      {
> -        printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
> -               PTR_ERR(patch));
> -        return PTR_ERR(patch);
> +        rc = PTR_ERR(patch);
> +        printk(XENLOG_WARNING "Microcode: Parse error %d\n", rc);
> +        goto unmap;
>      }
>  
>      if ( !patch )
> -        return -ENOENT;
> +    {
> +        printk(XENLOG_DEBUG "Microcode: No suitable patch found\n");
> +        rc = -ENOENT;
> +        goto unmap;
> +    }
> +
> +    rc = microcode_update_cpu(patch, 0);
>  
> -    return microcode_update_cpu(patch, 0);
> + unmap:
> +    bootstrap_unmap();
> +
> +    return rc;
>  }

... reliably set the variable. (I don't recall what our conclusion was as to
Misra possibly considering such unnecessary initializers dead code.)

Jan

