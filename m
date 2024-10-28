Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D799B2EF8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 12:34:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826403.1240638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5O0K-0000bb-6c; Mon, 28 Oct 2024 11:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826403.1240638; Mon, 28 Oct 2024 11:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5O0K-0000Zf-3f; Mon, 28 Oct 2024 11:33:48 +0000
Received: by outflank-mailman (input) for mailman id 826403;
 Mon, 28 Oct 2024 11:33:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5O0I-0000ZZ-Iy
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 11:33:46 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d1743da-9520-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 12:33:44 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a99e3b3a411so841969366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 04:33:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a083efcsm366182266b.204.2024.10.28.04.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 04:33:43 -0700 (PDT)
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
X-Inumbo-ID: 7d1743da-9520-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730115224; x=1730720024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2ltb/ntOICsWD6y5Dariq4HdHLR8v0gj+jkTg6p/59U=;
        b=de4bfMExltYB3biJtOi/ob40gb7eCgnQ4WEQLpY3gaYcn+6+2DX0FtXoZPQevPOa7P
         vkQQ//vl29d/tWUWmNWq8BHq2r4uPWhecxiVzugzGG+/kigf2mdXNHzIynfXeUwDB9v1
         PW96/WCJC1++8Qr005BGTCR/FobTQUnmLawN8K+mq6YLgGFJCa6qCpEQpLu1BxmizHg4
         MzdPb4bm1nXg5L3qbTTlRsrO1CL9nt++g+mCesVHWNyUroM9+/SgYtUytcNI7Y9Yl2OK
         il7Vn4OoWD6gCaylRRmelc28D2YrzIF3Z4XDqzU9mMxRQ4RDU2loRn558m9UqYUXoMU1
         1FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730115224; x=1730720024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ltb/ntOICsWD6y5Dariq4HdHLR8v0gj+jkTg6p/59U=;
        b=CTh0cwdxlGS4Ax7LYSgBJfT2FVL4QPl8xtW4n2YX7jSMfZAEpZQjCUbC1t48L717mp
         NJkJtA07j9qshpsMlzNpb77mNRYcOtyiBmBwa+1Tkcg7L4Hy/hud+clRt0XYbm40I1xM
         5ZzDD160AJWfIl8UR1dPAqqidKrh8cFtvboZ+wjbPuPsIKIUamUEdplkucjmfhP9HzqJ
         PzfjiXOx2Q6XUYnQyY4NPbv23yIy1jbVQpnrqQh2s0o44BAEsLpize9rjQMh8+9V/Q0Q
         R9amO/+5Yke4hTMgk1tEej8GiEIYTMNtytR5egm5kUtZ5m4g6Ab/xu0+bCijdornN1JK
         QkhA==
X-Forwarded-Encrypted: i=1; AJvYcCVtX+WCx9pUa2RK9k93KSfu/wdFiHq7AL8MPiMdQSkFrX7jH+38E6iX/L3+agwETlURO6zFPWd+EXI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwQ9J1cMTaqRnTRryo0CpqV59q3wovVD3AlrLy0H8opRYNsyjQ
	fCQ5kaVTq57AGtrGWwGMF3Y7R0Uij9FgotHOlkJ9PSVynyAEG9Du6yGiCKsE2g==
X-Google-Smtp-Source: AGHT+IFaULAJG5JUVBvkp6B7FcNF7Zmc3G1bAFlvSoY3Q1ZPwGhosXv3WzsMWWryb531LcHZKsObAw==
X-Received: by 2002:a17:907:3187:b0:a9a:f19:8c2a with SMTP id a640c23a62f3a-a9ad197af28mr1389288666b.6.1730115223758;
        Mon, 28 Oct 2024 04:33:43 -0700 (PDT)
Message-ID: <abadac24-0392-4051-b6a2-08967272f1a1@suse.com>
Date: Mon, 28 Oct 2024 12:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Willi Junga
 <xenproject@ymy.be>, David Woodhouse <dwmw@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20241024154844.8652-1-roger.pau@citrix.com>
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
In-Reply-To: <20241024154844.8652-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.10.2024 17:48, Roger Pau Monne wrote:
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -71,6 +71,24 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
>  
>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
>  
> +/*
> + * Store the EOI handle when using interrupt remapping.
> + *
> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
> + * format repurposes the vector field to store the offset into the Interrupt
> + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
> + * longer matches the contents of the RTE vector field.  Add a translation
> + * table so that directed EOI uses the value in the RTE vector field when
> + * interrupt remapping is enabled.
> + *
> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
> + * when using the remapped format, but use the translation table uniformly in
> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
> + *
> + * The matrix is accessed as [#io-apic][#pin].
> + */
> +static uint8_t **io_apic_pin_eoi;

Wasn't the conclusion from the v1 discussion that this needs to be a signed
type wider than 8 bits?

> @@ -298,6 +323,9 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
>      /* Prefer the use of the EOI register if available */
>      if ( ioapic_has_eoi_reg(apic) )
>      {
> +        if ( io_apic_pin_eoi )
> +            vector = io_apic_pin_eoi[apic][pin];
> +
>          /* If vector is unknown, read it from the IO-APIC */
>          if ( vector == IRQ_VECTOR_UNASSIGNED )
>              vector = __ioapic_read_entry(apic, pin, true).vector;

In addition to what Andrew said here, for this comparison the make sense
...

> @@ -1022,7 +1050,20 @@ static void __init setup_IO_APIC_irqs(void)
>  
>      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
>  
> +    if ( iommu_intremap )
> +    {
> +        io_apic_pin_eoi = xzalloc_array(typeof(*io_apic_pin_eoi), nr_ioapics);
> +        BUG_ON(!io_apic_pin_eoi);
> +    }
> +
>      for (apic = 0; apic < nr_ioapics; apic++) {
> +        if ( iommu_intremap )
> +        {
> +            io_apic_pin_eoi[apic] = xzalloc_array(typeof(**io_apic_pin_eoi),
> +                                                  nr_ioapic_entries[apic]);
> +            BUG_ON(!io_apic_pin_eoi[apic]);
> +        }

... doesn't the array also need -1 (== IRQ_VECTOR_UNASSIGNED) filling,
rather than zero-filling?

Jan

