Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7E28D387D
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 15:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731939.1137719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJnx-0008HR-10; Wed, 29 May 2024 13:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731939.1137719; Wed, 29 May 2024 13:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJnw-0008F3-UU; Wed, 29 May 2024 13:57:24 +0000
Received: by outflank-mailman (input) for mailman id 731939;
 Wed, 29 May 2024 13:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCJnv-0008Es-B2
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 13:57:23 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e372253-1dc3-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 15:57:21 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59a609dd3fso177196566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 06:57:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6519c92796sm55866066b.104.2024.05.29.06.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 06:57:20 -0700 (PDT)
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
X-Inumbo-ID: 5e372253-1dc3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716991040; x=1717595840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xmEslsxWpEHWD6AFlN1vPdTyzF2JumoRvAwOUyq0Ru4=;
        b=GvqAKcmM6Cu9ieRVdvHJRleqQMWdQxamUT0TXDa6N/AFOFKLTCT1DjgwEDreb04Nkt
         BTLgUWBwgZ5ijWjo0Xt0kht5lyHYYVv4IlDtWzzYqUAxIGZUzylH3+jXNdqZ2RL8SIO9
         QhczC2dSmMmtARMt3C5PwBI1QLMdZh3qmoHKuQJfuhz32Yei7U8cLorOSgjK5P21yudY
         Q056GeRecal/xEEfTLsQH1XEks/sLZaL5FZRxDAKnyyp3XC3z4cSIqv+0r7Qx+WjylWD
         ZaEq/EPWMgk9NEqQkmIaPVFQR2HjW1+l29E8NCVnHW6yjuaGDSm/bJ6MHzvxtMN5mQQM
         rYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716991040; x=1717595840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmEslsxWpEHWD6AFlN1vPdTyzF2JumoRvAwOUyq0Ru4=;
        b=PSSYQa+qcN3fpnR2svgODvWrqwbx6tdfQs/5+9IdwKTcl16d0mI4cMslkfOxtHk03q
         SbRkUP2v9cBqS5jbIg6j40vKo8A0rlVHVqpe7FtHKzEzBu5oao7zoJev3ebkHlj0q2gk
         j2KzEPOgFAvcVSNSKdAlp6c9jMXcIUVRoC9bQ9UfTiaPEyGuYogFzI1LmNLxfmE5/yVP
         cvd80NxHqMEe1p3IvPY9sYcvQv0y0gTWFNRKbajUQjD1ksFiUgOBeyNCV6eiCIliN4Us
         T28jMiwybNFnnRhkMivKTkWIZwpHEyB0tIH9gMtMC5CSfDy32F9dDiKttT8TC+Bngo4Z
         etVg==
X-Forwarded-Encrypted: i=1; AJvYcCWU1PA9N4LHXyst5qFFURfqIx6sZbDFk4N9zH0n4qUKpKZe6AJR7BZZECJZStuRJZlUbHd1+4yDZtJq0MHlTFVm8GoU/KScpuUfxxKonxg=
X-Gm-Message-State: AOJu0YzQiSeN2/hkmYFiTavXMBGEUuW92Mz3veqJKfuGCHEeaIXjWW0f
	1iNo5KXngnxTpIOjwMvmljWC1W+82z6Z+zeUyXwo5jp3ASZ05DxYFE94BIS6Cg==
X-Google-Smtp-Source: AGHT+IFYlPgOKjtH0HyCJcDYtpUkGShmrz98Xy/y0bgiE2xXv0mO1PttIwdXO0xebnyGPvxAyf1x3w==
X-Received: by 2002:a17:906:af0e:b0:a59:beb4:62b8 with SMTP id a640c23a62f3a-a642d5a388bmr189558266b.21.1716991040376;
        Wed, 29 May 2024 06:57:20 -0700 (PDT)
Message-ID: <24201381-2a43-427e-a3e5-1de316d212b8@suse.com>
Date: Wed, 29 May 2024 15:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 4/9] x86/irq: describe how the interrupt CPU
 movement works
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-5-roger.pau@citrix.com>
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
In-Reply-To: <20240529090132.59434-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2024 11:01, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -28,6 +28,32 @@ typedef struct {
>  
>  struct irq_desc;
>  
> +/*
> + * Xen logic for moving interrupts around CPUs allows manipulating interrupts
> + * that target remote CPUs.  The logic to move an interrupt from CPU(s) is as
> + * follows:
> + *
> + * 1. cpu_mask and vector is copied to old_cpu_mask and old_vector.
> + * 2. New cpu_mask and vector are set, vector is setup at the new destination.
> + * 3. move_in_progress is set.
> + * 4. Interrupt source is updated to target new CPU and vector.
> + * 5. Interrupts arriving at old_cpu_mask are processed normally.
> + * 6. When an interrupt is delivered at the new destination (cpu_mask) as part
> + *    of acking the interrupt move_in_progress is cleared and move_cleanup_count

Nit: A comma after "interrupt" may help reading.

> + *    is set to the weight of online CPUs in old_cpu_mask.
> + *    IRQ_MOVE_CLEANUP_VECTOR is sent to all CPUs in old_cpu_mask.

These last two steps aren't precise enough, compared to what the code does.
old_cpu_mask is first reduced to online CPUs therein. If the result is non-
empty, what you describe is done. If, however, the result is empty, the
vector is released right away (this code may be there just in case, but I
think it shouldn't be omitted here).

> + * 7. When receiving IRQ_MOVE_CLEANUP_VECTOR CPUs in old_cpu_mask clean the
> + *    vector entry and decrease the count in move_cleanup_count.  The CPU that
> + *    sets move_cleanup_count to 0 releases the vector.
> + *
> + * Note that when interrupt movement (either move_in_progress or
> + * move_cleanup_count set) is in progress it's not possible to move the
> + * interrupt to yet a different CPU.
> + *
> + * By keeping the vector in the old CPU(s) configured until the interrupt is
> + * acked on the new destination Xen allows draining any pending interrupts at
> + * the old destinations.
> + */
>  struct arch_irq_desc {
>          s16 vector;                  /* vector itself is only 8 bits, */
>          s16 old_vector;              /* but we use -1 for unassigned  */

I take it that it is not a goal to (also) describe under what conditions
an IRQ move may actually be initiated (IRQ_MOVE_PENDING)? I ask not the
least because the 2nd from last paragraph lightly touches that area.

Jan

