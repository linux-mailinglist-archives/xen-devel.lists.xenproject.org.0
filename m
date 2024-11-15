Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5FD9CDB92
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 10:29:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836984.1252895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBsdX-0000A5-0U; Fri, 15 Nov 2024 09:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836984.1252895; Fri, 15 Nov 2024 09:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBsdW-00007O-TU; Fri, 15 Nov 2024 09:29:06 +0000
Received: by outflank-mailman (input) for mailman id 836984;
 Fri, 15 Nov 2024 09:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBsdW-00007I-16
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 09:29:06 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cb72585-a334-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 10:29:01 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2fb3c3d5513so4484731fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 01:29:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe73sm51167105e9.20.2024.11.15.01.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 01:29:00 -0800 (PST)
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
X-Inumbo-ID: 0cb72585-a334-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmMiLCJoZWxvIjoibWFpbC1sajEteDIyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBjYjcyNTg1LWEzMzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjYyOTQxLjk4NzY1Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731662941; x=1732267741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E2P/v+CW82ZcWnIWYl2vBcowgYERNBV4qqG3WGqznls=;
        b=bse+alANxsrx/XSMNuOkUCNxVeZMhGVMEOLzuGJdDR8VA9Iw7MxiWG4bR2IFceAHap
         e9CoCvCj+1m0hloKR6m5eeNekBzJnv0tkn/5S6gElhuUc7lDguwB987hbsgdV6obDvgV
         gZ3UwIlivdCWyHrfJLunwLBgD4K+yp0flkPqd2JIhdhh/N2sWDEWuesfWSriiT+NKydJ
         EEdgoW4yUNRV3aFO9DLVdIHdGfOfAt3+aDT7Lrr4P0EXpe6HfqYjz4jXAeP+bxNaIXnq
         KHAOq/WXJG2uYiiCoEOqkCSiS3XcOfdfI3Q658EZC0RzhNFyTrW49i68f3HrnvUzZYcw
         8U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731662941; x=1732267741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2P/v+CW82ZcWnIWYl2vBcowgYERNBV4qqG3WGqznls=;
        b=i27XbOhdWzREuVyIqJq44BWZp8QdsdgEsZLrj7sb+eaidPmxwaWOPIjOVMhmaQRMvm
         ddsK4TXSlxHP4aKhGSWL6TM57UWBazpunrYhBC1c+LdEoHTX+HXEsuuSPExNnSl8nzQd
         0fOtuwdZpJaNzNszPa/3wiwDeyrKXGp3f4n3NH9hFqjh6dklQkSW1Uba7ZYWmLhpiVBY
         uTUJ0/KBNWqaAZ811CLD5ATT1m+AauBy5Ts9Y+JsOk7fdfQVn/6rGT4LRVlp30MIjY9r
         CvEVEl6H71I+YEWcAgO2Un1Ekktlf8teVLQialh/7uR5LlyTvKCAkFMT4q/dBg6+dcng
         YN2g==
X-Forwarded-Encrypted: i=1; AJvYcCXUmN0bCqTPfwtycvvgFRyZvav8qXUCFVBRW0FfCA3RKpq0tkFDLhrKgH/Z7AfE21OSKCBpIPIrjDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyde59lSEIcyulkABcCF0MshWn3Qy/Q+Xj1TK/NNfUZ7RXmWuX5
	i/yhAr0nPx95m87XxN8NyUm0k3pALvtjW438E3lmgrf/KdYCcu2cAV4Q6GeSfw==
X-Google-Smtp-Source: AGHT+IEGCfICzKU8wNKKja2UR2GPF6mGVbclcIcpR6/FWo3uod7PMeHzUeV0tpjLvdZhksgTJMEfDg==
X-Received: by 2002:a2e:bd84:0:b0:2ff:5e46:aafe with SMTP id 38308e7fff4ca-2ff60744d57mr10828101fa.39.1731662941344;
        Fri, 15 Nov 2024 01:29:01 -0800 (PST)
Message-ID: <990887c0-d76f-4f8a-a6a6-c3dca49dcb91@suse.com>
Date: Fri, 15 Nov 2024 10:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix comment about setting up the real mode
 stack
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241114182219.1983073-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241114182219.1983073-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2024 19:22, Andrew Cooper wrote:
> It may have taken a while, but it occurs to me that the mentioned commit fixed
> a second problem too.
> 
> On entering trampoline_boot_cpu_entry(), %esp points at the trampoline stack,
> but in a 32bit flat segment.  It happens to be page aligned.
> 
> When dropping into 16bit mode, the stack segment operates on %sp, preserving
> the upper bits.  Prior to 1ed76797439e, the top nibble of %sp would depend on
> where the trampoline was placed in low memory, and only had a 1/16 chance of
> being 0 and therefore operating on the intended stack.
> 
> There was a 15/16 chance of using a different page in the trampoline as if it
> were the stack.  Therefore, zeroing %esp was correct, but for more reasons
> than realised at the time.

I'm afraid I don't follow this analysis. Said commit replaced clearing of %sp
by clearing of %esp. That made no difference for anything using the 16-bit
register. I don't see how the top nibble of %sp could have been non-zero
prior to that change.

> Update the comment to explain why zeroing %esp is correct in all cases.  Move
> it marginally earlier to when a 16bit stack segment is first loaded.

The movement is fine, and the comment is fine by itself, too. It doesn't
cover the significance of using 32-bit operand size, though (which may or may
not be relevant, to a fair degree depending on the above).

Jan

> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -176,6 +176,12 @@ trampoline_boot_cpu_entry:
>          mov     %eax,%gs
>          mov     %eax,%ss
>  
> +        /*
> +         * The stack is at trampoline_phys + 64k, which for a 16bit stack
> +         * segment wants %sp starting at 0.
> +         */
> +        xor     %esp, %esp
> +
>          /* Switch to pseudo-rm CS, enter real mode, and flush insn queue. */
>          mov     %cr0,%eax
>          dec     %eax
> @@ -190,8 +196,6 @@ trampoline_boot_cpu_entry:
>          mov     %ax,%es
>          mov     %ax,%ss
>  
> -        /* Initialise stack pointer and IDT, and enable irqs. */
> -        xor     %esp,%esp
>          lidt    bootsym(rm_idt)
>          sti
>  


