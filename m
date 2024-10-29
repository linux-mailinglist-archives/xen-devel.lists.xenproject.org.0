Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9F79B4FA3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 17:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827714.1242401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pJc-0002Pn-ND; Tue, 29 Oct 2024 16:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827714.1242401; Tue, 29 Oct 2024 16:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pJc-0002Md-Jt; Tue, 29 Oct 2024 16:43:32 +0000
Received: by outflank-mailman (input) for mailman id 827714;
 Tue, 29 Oct 2024 16:43:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5pJb-0002MX-8w
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 16:43:31 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec1b70a3-9614-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 17:43:27 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso56691685e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 09:43:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b58b7e8sm183662855e9.48.2024.10.29.09.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 09:43:25 -0700 (PDT)
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
X-Inumbo-ID: ec1b70a3-9614-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVjMWI3MGEzLTk2MTQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjIwMjA3LjkzMTQzNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730220207; x=1730825007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IqQ+25OY9/TyrBwUND+/pcOzRDIFIWosYuE0ZUb2v+M=;
        b=bCfLNDEVQPeS/9gV80AZVjIr9si4QijV/rbVWCm17O/1cYwpDQMGcYlE+ZNFLL87h0
         nGYWRSptAOhAqkbr+fT0Ied6svZmOWqS9XxtoPn/rFLcs/G1c4RtIviLko1AUw0qWE/9
         cG6zVgj7Cqjil5urasJQU3lKbf9XKFA02fzFxxOFmtyoFZ4/xbjyn0wU8szI641AfC0T
         tCGvkqW3iEJlVXtPY969nA7gqJycKQo2CuCaH5Eo0X3Dda94kTKEKl0ViHOL9jkkIwZq
         U2Xy/SiHNxEWgHYV3f4kW5yefKY4oCSOwo2HakOHZ114BdT19rx5tz6u2uICllqScF56
         wRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730220207; x=1730825007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqQ+25OY9/TyrBwUND+/pcOzRDIFIWosYuE0ZUb2v+M=;
        b=UoGOSZmxEpeOkNg84F8ZyXVYd9Ir8cpiX8mwE4tKVqOCbT+6S363KbLam3UdWSkEdL
         RoNxQIB0GQUOvKUCvD1wOYp6WA2Zi8VCdHhfvIZBVONQjYf1ffmo7hDmCyZnSKaMmX6p
         3qMnLC2Ed8W6VwEk1RQ+iO8NHGGzPjk2bceE650Pb8tBYVG0/yQKh0s6buGXM+q4CP2a
         npAlWF/TfTLtxxrS3kGu4mMe5I/dBhMhEap2+XVeiplb8v6Yb2/ihnbLpMCfJVX6xowa
         yQfqfVCQfACGXLw16skw6Nrt5f7C1NZAgHh42m9XhBcBSiiLTzo2NupSoWRmkwtxDlJR
         0CNw==
X-Forwarded-Encrypted: i=1; AJvYcCWcDqOoNuYC+8CPJ4Nu0QeV2sHvOF9C+CxxctSUciGHpqXBS1YpWbv+/2s5xXjSMvmZEXmHREVNT2Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLEODHIeMOnRI1N2i41FV1OuYh5t7m7GHQXKxWin2PZgs1fFC3
	MR8GD2oYk3fgdti/QM120CfFz6n35BhGZJMicnGqB4gs8VUykEO6yDDlw0AwgQ==
X-Google-Smtp-Source: AGHT+IFpLuV1MFCEVcsZLxPDyHqeSxgcq5PDJrvQ20ZwQEjeqq+PHcO72Q5x5INC5eapkCgNcaRmnw==
X-Received: by 2002:a05:600c:310f:b0:431:57e5:b251 with SMTP id 5b1f17b1804b1-4319ad07035mr100312935e9.28.1730220205687;
        Tue, 29 Oct 2024 09:43:25 -0700 (PDT)
Message-ID: <53034f16-682e-4081-ab7e-81338c700f85@suse.com>
Date: Tue, 29 Oct 2024 17:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Willi Junga
 <xenproject@ymy.be>, David Woodhouse <dwmw@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20241029110351.40531-1-roger.pau@citrix.com>
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
In-Reply-To: <20241029110351.40531-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2024 12:03, Roger Pau Monne wrote:
> When using AMD-Vi interrupt remapping the vector field in the IO-APIC RTE is
> repurposed to contain part of the offset into the remapping table.  Previous to
> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
> table would match the vector.  Such logic was mandatory for end of interrupt to
> work, since the vector field (even when not containing a vector) is used by the
> IO-APIC to find for which pin the EOI must be performed.
> 
> Introduce a table to store the EOI handlers when using interrupt remapping, so
> that the IO-APIC driver can translate pins into EOI handlers without having to
> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
> unconditionally when interrupt remapping is enabled, even if strictly it would
> only be required for AMD-Vi.

In here I think you mean "handle" when you use "handler"? Plus with what you said
earlier about vector vs EOI handle, and with the code using "vector" all over the
place, their (non-)relationship could also do with clarifying (perhaps better in
a code comment in __io_apic_eoi()).

> @@ -273,6 +293,13 @@ void __ioapic_write_entry(
>      {
>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        /*
> +         * Called in clear_IO_APIC_pin() before io_apic_pin_eoi is allocated.
> +         * Entry will be updated once the array is allocated and there's a
> +         * write against the pin.
> +         */
> +        if ( io_apic_pin_eoi )
> +            io_apic_pin_eoi[apic][pin] = e.vector;

The comment here looks a little misleading to me. clear_IO_APIC_pin() calls
here to, in particular, set the mask bit. With the mask bit the vector isn't
meaningful anyway (and indeed clear_IO_APIC_pin() sets it to zero, at which
point recording IRQ_VECTOR_UNASSIGNED might be better than the bogus vector
0x00).

> @@ -298,9 +325,17 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
>      /* Prefer the use of the EOI register if available */
>      if ( ioapic_has_eoi_reg(apic) )
>      {
> +        if ( io_apic_pin_eoi )
> +            vector = io_apic_pin_eoi[apic][pin];
> +
>          /* If vector is unknown, read it from the IO-APIC */
>          if ( vector == IRQ_VECTOR_UNASSIGNED )
> +        {
>              vector = __ioapic_read_entry(apic, pin, true).vector;

Related to my comment higher up regarding vector vs EOI handle: Here we're
doing a raw read, i.e. we don't really fetch the vector but the EOI handle
in the AMD case. Why is it that this isn't sufficient for directed EOI to
work (perhaps with the conditional adjusted)?

Then again - are we ever taking this path? Certainly not when coming from
clear_IO_APIC_pin(), hence ...

> +            if ( io_apic_pin_eoi )

... I'm unconvinced this conditional is needed.

> +                /* Update cached value so further EOI don't need to fetch it. */
> +                io_apic_pin_eoi[apic][pin] = vector;
> +        }
>  
>          *(IO_APIC_BASE(apic)+16) = vector;
>      }
> @@ -1022,8 +1057,27 @@ static void __init setup_IO_APIC_irqs(void)
>  
>      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
>  
> +    if ( iommu_intremap )
> +    {
> +        io_apic_pin_eoi = xmalloc_array(typeof(*io_apic_pin_eoi), nr_ioapics);

Nit: Strictly speaking this and ...

> +        BUG_ON(!io_apic_pin_eoi);
> +    }
> +
>      for (apic = 0; apic < nr_ioapics; apic++) {
> -        for (pin = 0; pin < nr_ioapic_entries[apic]; pin++) {
> +        const unsigned int nr_entries = nr_ioapic_entries[apic];
> +
> +        if ( iommu_intremap )
> +        {
> +            io_apic_pin_eoi[apic] = xmalloc_array(typeof(**io_apic_pin_eoi),
> +                                                  nr_entries);

... and this should be xvmalloc_array() in new code.

Also this 2nd conditional may better use io_apic_pin_eoi, such that the two
conditionals don't need keeping in sync. Note also how Andrew previously
pointed out that both conditionals aren't Misra-compliant right now.

Jan

