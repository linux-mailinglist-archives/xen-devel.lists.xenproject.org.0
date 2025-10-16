Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A6BBE1D1C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 08:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144133.1477596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Hra-0001RY-V0; Thu, 16 Oct 2025 06:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144133.1477596; Thu, 16 Oct 2025 06:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Hra-0001P5-RZ; Thu, 16 Oct 2025 06:53:26 +0000
Received: by outflank-mailman (input) for mailman id 1144133;
 Thu, 16 Oct 2025 06:53:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9HrZ-0001Oz-T7
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 06:53:25 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf2036a0-aa5c-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 08:53:23 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so305610f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 23:53:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47114461debsm8249145e9.18.2025.10.15.23.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 23:53:22 -0700 (PDT)
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
X-Inumbo-ID: cf2036a0-aa5c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760597603; x=1761202403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DSMWhaSTCzb2yFqAUov+0ri3gRlreIXK9W08UI27VYA=;
        b=apLbmV/bKMk9JALZ5a8X99fPhRPN5y+8EYvTnoAWPBuckgsHtjocr+4StN+fVXahNE
         unQF4x6CjKREU/wf0H8fjQiMjAqPzA7BiWbBCl0kv9/XoFXOwYiyy+4ryPuu2jmtnByO
         ccB/ouUIILu5xeJq4K02ACM9wUwg4fjeQ7HuyegBa9Jd1bS2jiRpBylYVB6ugmKnhhaC
         yovoK6cR4zvFPfDSfvLrmg+5V+JvEi65/RrXpMdHEhNqdzcOeauUpiXNIaNAeGmHnZIp
         MXoT3EYDdLmjM3XwYfEv6f9OoFxwBhQOfNQ7KxC0A3QirqGOdF1LHfoD7RUXzjBE0Xh1
         Rwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760597603; x=1761202403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSMWhaSTCzb2yFqAUov+0ri3gRlreIXK9W08UI27VYA=;
        b=UNEmjVJZ7Rg4kNzdS1kxB6ta2YnCe8V8O6437/LdbjA8gmFoJP90bUNsW92lltTVhb
         nswJ8p+IoQiyNLaPZmniozLbPK2Q3IwsIgBvn3hrugttd9Kj7AZ39oquqlrEtgyKvCh6
         g7p41jY/zTzmmxbz1UTM/0Ga+V6RvscViZzzjj/vkNMf+pYmPwOBSBftlRiwnXiKwtuS
         VG+lLHhg6FuzZ588scgTEPMfvgcVTQsl46/6WR64MadPvP5Cj7+JBkKqGUWgIMAK3Z6Z
         XUKl5+yHCIgt1QjD75GB8Ue93huTGhl1ZqST2zFxpTkqXreLvpofklycosCy7u9cbe1+
         2pOw==
X-Forwarded-Encrypted: i=1; AJvYcCXq3fxlPY7v9bV7X7uBuXLi7AHeZSJWbeCTdJK0AGs7SMheLXx6uGpEG89/GN20ZY7tCpDvD5Tr3vk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjA1j514TUkD15+7jUugEZMLi5IxLlHX3ZorW6cYNVPGB1ygcK
	Tu4sJKNGpbAZDqIujw94HO9GPPjkb4P1F4MvPlSKVVQY96K9daFbG3MJBRqIQi3Scw==
X-Gm-Gg: ASbGncuBn7hxLxf99LYg1QCAEzrWrzD1h5UVuu4bh43BGsuRbATuP5ac1WubmPGwF9z
	WYYwxIHvTuFjC/sM1k+EHOBsWQGjyTHGlZezRPfBD9IBjJvDmE0PB89MB8aXqAy3H4ShLaKG0Xh
	ztapVnKA3hA+CfEDy62BxBVol/wa/aObn86TelRXyPcF+JprpLLjsYybREKndFKIb71CrfnbILC
	aBmgGlgVk/qfkxTw+GOi1+mRLgCQ6ClIKOrjjqIzkZ27b004iir6m4TNJ41p5+rGDF6yZjMyLws
	HDHTdoQP7Av51ekqNGlgVA3Vrf343sI3UVFS8WMoYTzVsARgcXRdX6sACHVwNKX4GSxFVz5kz+P
	VGK0J6zfn2WCN0q3dtuP7e9n11dFiHVACXQ+UtUzYFJWJCdPlZafXzwWkDeFyVCWouk/bqJey8E
	k2Kxw78IW5MyXRAbzr4G0p/XtMEP9RILfNjFIS7vzAL0eS9g3rUU/LC5ToUaqI
X-Google-Smtp-Source: AGHT+IGXJi0NDphLg9nCTWotbPxjLBaTF3gR6H2vfRNSD+yQsx7D0BhMKX43JYw/ZidYZUI2z8SL8Q==
X-Received: by 2002:a05:6000:2504:b0:405:ed47:b285 with SMTP id ffacd0b85a97d-4266e8e6847mr22084272f8f.58.1760597603203;
        Wed, 15 Oct 2025 23:53:23 -0700 (PDT)
Message-ID: <61773baa-d577-4cf7-8d1a-819b79bd1c7d@suse.com>
Date: Thu, 16 Oct 2025 08:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v3 2/2] x86/io_apic: Use next_entry() in loops
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251015210454.95381-1-jason.andryuk@amd.com>
 <20251015210454.95381-3-jason.andryuk@amd.com>
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
In-Reply-To: <20251015210454.95381-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.10.2025 23:04, Jason Andryuk wrote:
> io_apic.c has a lot of ad-hoc for(;;) and while(1) loops for iterating
> over irq_pin_list entries.  Replace them with a standardized
> for loop using next_entry() to advance entry.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  xen/arch/x86/io_apic.c | 49 ++++++++++++------------------------------
>  1 file changed, 14 insertions(+), 35 deletions(-)
> 
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index c35d611ecf..73b48a9cb8 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -191,6 +191,14 @@ static void remove_pin_from_irq(unsigned int irq, int apic, int pin)
>      irq_2_pin_free_entry = entry - irq_2_pin;
>  }
>  
> +static struct irq_pin_list *next_entry(const struct irq_pin_list *entry)
> +{
> +    if ( !entry->next )
> +        return NULL;
> +
> +    return irq_2_pin + entry->next;
> +}

Preferably with the function put in its final place right in patch 1:
Acked-by: Jan Beulich <jbeulich@suse.com>

> @@ -482,7 +487,7 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
>  {
>      struct irq_pin_list *entry = irq_2_pin + irq;
>  
> -    for (;;) {
> +    for (; entry; entry = next_entry(entry)) {
>          unsigned int pin = entry->pin;
>          struct IO_APIC_route_entry rte;
>  
> @@ -492,9 +497,6 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
>          rte.raw &= ~(uint64_t)disable;
>          rte.raw |= enable;
>          __ioapic_write_entry(entry->apic, pin, false, rte);
> -        if (!entry->next)
> -            break;
> -        entry = irq_2_pin + entry->next;
>      }
>  }

I notice that within here there's also a "break" upon ->pin being -1.
Seeing that io_apic_level_ack_pending() has continue there, I think we
will want to be consistent. Which way isn't quite clear to me (yet).

> @@ -545,14 +547,11 @@ static void __eoi_IO_APIC_irq(struct irq_desc *desc)
>      struct irq_pin_list *entry = irq_2_pin + desc->irq;
>      unsigned int pin, vector = desc->arch.vector;
>  
> -    for (;;) {
> +    for (; entry; entry = next_entry(entry)) {
>          pin = entry->pin;
>          if (pin == -1)
>              break;

Same here.

> @@ -632,7 +631,7 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
>          if ( !iommu_intremap || !x2apic_enabled )
>              dest = SET_APIC_LOGICAL_ID(dest);
>          entry = irq_2_pin + irq;
> -        for (;;) {
> +        for (; entry; entry = next_entry(entry)) {
>              struct IO_APIC_route_entry rte;
>  
>              pin = entry->pin;
> @@ -643,10 +642,6 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
>              rte.dest.dest32 = dest;
>              rte.vector = desc->arch.vector;
>              __ioapic_write_entry(entry->apic, pin, false, rte);
> -
> -            if (!entry->next)
> -                break;
> -            entry = irq_2_pin + entry->next;
>          }
>      }

And here.

Jan

