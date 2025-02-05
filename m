Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D08A28718
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 10:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882045.1292216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfc7G-0008RO-0v; Wed, 05 Feb 2025 09:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882045.1292216; Wed, 05 Feb 2025 09:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfc7F-0008Pf-Tr; Wed, 05 Feb 2025 09:54:41 +0000
Received: by outflank-mailman (input) for mailman id 882045;
 Wed, 05 Feb 2025 09:54:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Kcl=U4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfc7E-0008PZ-JZ
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 09:54:40 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3703adfd-e3a7-11ef-a0e7-8be0dac302b0;
 Wed, 05 Feb 2025 10:54:39 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab74ecfdae4so221732366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 01:54:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47f1dcasm1073058966b.79.2025.02.05.01.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 01:54:38 -0800 (PST)
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
X-Inumbo-ID: 3703adfd-e3a7-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738749279; x=1739354079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=26+FUsbPIooMUfvZN5cQVmkmpv5qmC1JGNlRzoWOE7s=;
        b=Ss32KfA3xzKlaKYtAvyUofcKIrULR74sCiuclNK/DFrPB1dQyL8vLBUz/HJ6aIDxqd
         jUZ/g8HCzuld91kQ+p9sJKSfTkya90Djvk0/tDemYGscKMnUAJxnqTCVy8RrZl2xieWT
         bzABh2C/038QGj6G8OTqHR/UafObJpxSDMt/XDG2DdzdOgv3F0ymDjQhJWF5v2xyotjG
         pAiQLsbR97G1PjxvOQw9+j8bTPeIeRkdkWZgmeeqjqQxluJt6RTu2jMtCsvDpOb2CiQo
         9E6dudp/w4xoiFNkzboiyXQUCAFJAWZZ0ny6UTgNlY3/Zefxcw0BRUKQFBTdZ9sEPPlq
         9otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749279; x=1739354079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26+FUsbPIooMUfvZN5cQVmkmpv5qmC1JGNlRzoWOE7s=;
        b=RimFYhcFpvvhcyEzE4C5nzPlCS2t0G78Fo/BlwE9yXN4mp8Y0J8sU5YvRj5bjq5fp1
         fIMut2h46CdgtCmWmJtAsJQOgKKQpwNU6g1/Y8zZIfVdvrsTMrY9KC5z7nVGcszPT9G5
         6p9Cs3/QsqRoU1SNTo/XwPTKGnNtYtl7M8cmVL7W4YgsWj6pbPhwwCYfY2ipiIWdbRF7
         KeEI7mpf+DyMyvoCfJ1pYvU0eyhgoumJF5yaIqYVdY92xpIFmN0aIzreBbbOYcTFOULM
         jjr/vjTQWEoJpDPy+FkInAg2E5SFu2XTfXx6L1VkmQJQSxBrjeL5IHkcgYKe2rvkQt6Z
         Lkeg==
X-Forwarded-Encrypted: i=1; AJvYcCUYDnJJevrwpLfKla1mg4i4on1G0nX0zEx4U9idRkNGQaTwGxCp12SN0A3Joyg7Qd6Ial3MFO2NB0M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyj+e7qDmONgz2JBKmHUMVy5aZ5g9qKbCe+aZpxCGXXeozI9Fdc
	PNc3nAqj7kuDoM4ty1SEc3dD+jIRsv+i0ZdSvrC0puUAans/9ypR68SqyjfXUQ==
X-Gm-Gg: ASbGncsrMbq+one+ek4EKP3UuAdsbPjnEsjvzzdw2doD4n4JwG4RzDAc8Z08gboanSc
	QweMgwB78jhO7RrDU0wxeAqiAYlqEa9OS5/cfVZsBRvHEgKUm+tcAd8gJGBC3DPb7skXp01TqmF
	yPrvVyON6L0c63wBMW/+ebaS3vomQXwSPcid2wJT2apP9ebUmFiRC5KtseQAKip043Kj0vDUMfW
	2Qe1f/68bLwrebMr+cH1LYhsKRSpolLSQMLQ3z+Gz9JbhJ6zo/nqNHNFa4ouArmusrUyw8/4+zz
	d5ANQ4TXVAzu2uDngB6ivyf3QeA2rHu4LpQELbJW4BD6K/JLcS3gzmQlD/sTPe+9FOk5vUKaR2o
	O
X-Google-Smtp-Source: AGHT+IELVJBoh9ZdPEyiDWkaN+/h9BP6aE6Q9sAb3i9RWqC0vw+yNq5Yo+nUVwPqE+xIoZ2Gj1yDIA==
X-Received: by 2002:a17:906:f59c:b0:ab6:fee1:60e0 with SMTP id a640c23a62f3a-ab75e0cde78mr234595366b.0.1738749278760;
        Wed, 05 Feb 2025 01:54:38 -0800 (PST)
Message-ID: <0b094f98-401b-4af6-be41-6cfe1bd91560@suse.com>
Date: Wed, 5 Feb 2025 10:54:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20250205091056.17796-1-jgross@suse.com>
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
In-Reply-To: <20250205091056.17796-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2025 10:10, Juergen Gross wrote:
> xen_hypercall_hvm(), which is used when running as a Xen PVH guest at
> most only once during early boot, is clobbering %rbx. Depending on
> whether the caller relies on %rbx to be preserved across the call or
> not, this clobbering might result in an early crash of the system.
> 
> This can be avoided by not modifying %rbx in xen_hypercall_hvm().
> 
> Fixes: b4845bb63838 ("x86/xen: add central hypercall functions")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/xen/xen-head.S | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
> index 9252652afe59..4378b817ed32 100644
> --- a/arch/x86/xen/xen-head.S
> +++ b/arch/x86/xen/xen-head.S
> @@ -117,8 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
>  	pop %ebx
>  	pop %eax
>  #else
> -	lea xen_hypercall_amd(%rip), %rbx
> -	cmp %rax, %rbx

There's no memory access here, but ...

> +	cmp xen_hypercall_amd(%rip), %rax

... you now read from memory here. That can't be right. Afaict the original
use of LEA needs to stay, just with a different scratch register.

Jan

