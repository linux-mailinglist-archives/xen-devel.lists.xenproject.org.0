Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F2D97377A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 14:35:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795494.1204874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so05I-0001B7-KU; Tue, 10 Sep 2024 12:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795494.1204874; Tue, 10 Sep 2024 12:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so05I-00019f-H7; Tue, 10 Sep 2024 12:35:04 +0000
Received: by outflank-mailman (input) for mailman id 795494;
 Tue, 10 Sep 2024 12:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so05H-00019Z-Vu
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 12:35:03 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17ca9d47-6f71-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 14:34:59 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso12447976a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 05:34:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c61263sm478368866b.128.2024.09.10.05.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:34:58 -0700 (PDT)
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
X-Inumbo-ID: 17ca9d47-6f71-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725971699; x=1726576499; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LSsewx7UU6gQEwik2bNEi5/xY6888BEnxTjH/v5O+cc=;
        b=ZNrTsroEekBI2DhRsumf6XnrYl1ov02w6dEL+lxx+7Hop6jJXtZv2sDpSYK94+FpNQ
         sHCAB68hpgJn1GgM7+kss/KtdrBdoxlkGuENLFJu/QUmjI15dzLk6fcjruNKGsqUypf+
         BruusiJcAREX4XCmC7cDqM48Pzd4IH+V3bjy1zQzWO538liUHbNtCcx/8wlbFr/nkwvf
         V1B/9+EuUigVIJ/K1nafKXkoovmvc6F56qL3y+O2FvReKWofV/31l9N6hZB613z2du5G
         A8EjTYTyUbB3GeQyBCIh73G+MpCwyblbHzsc14og/D6F8qHRO48iqipOkYjKmVpRhKxS
         tOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971699; x=1726576499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSsewx7UU6gQEwik2bNEi5/xY6888BEnxTjH/v5O+cc=;
        b=uCU9LaKSidBb76140lz4XGEXhXqIb3/AMh0wnk15QvrvAE7rRg23btarTG4ucyPSFh
         DJBnuIdFEfBEYZ6uTChQ14sqGgDvpDpdHMTMY3JAsa94lqfrt7dbtMvtTnTf1elow/ll
         Kl18nlDEIKjAkgFXV49QJNfSStG5rgvM9LkTi8cTR6wWZXv4LCx1P+phDpPtUA6G2NYD
         HDh1x/YslIxYD0N9Hh8BwRcPW3IN45wAQ9u3AVlWom471nf4Lhkpr1wlPwvIBKbs2GjV
         NM5D/4BnAepH1C/dWBFCawvcLPi5fZYQ16b2yoGQs9oR966gOioxXGBcLwZ+s1Gx8rZe
         NLUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXZEbPEAO9PgF6/BZ3pA54vBnwSJb7JhsFSsNjsG8q850Bu3IZaQQj5M5pRUMNdZham2KxEqzADAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRl2pAvWOHfIg1bS8exYsiBWheNqxYTzEtIlZieGd941FMvA6D
	v6AhHLiNyAvUINLXISTujrLBDd2BAf2+tdmsNGE3AGErJ9hPdLbHDxCio0a/zw==
X-Google-Smtp-Source: AGHT+IHELrHmlAkPKV+ybsGZZAWa6S6u/zQgSyh6j6a/3oTZxhoBs4+pUZuEmgEWmeYEHs9VSlDY4A==
X-Received: by 2002:a17:907:972a:b0:a72:7a71:7f4f with SMTP id a640c23a62f3a-a8ffb1b644emr55038566b.7.1725971698680;
        Tue, 10 Sep 2024 05:34:58 -0700 (PDT)
Message-ID: <6bed58f8-016f-4390-be4c-128eebff6545@suse.com>
Date: Tue, 10 Sep 2024 14:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen: allow mapping ACPI data using a different
 physical address
To: Juergen Gross <jgross@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-acpi@vger.kernel.org
References: <20240910103932.7634-1-jgross@suse.com>
 <20240910103932.7634-7-jgross@suse.com>
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
In-Reply-To: <20240910103932.7634-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:39, Juergen Gross wrote:
> When running as a Xen PV dom0 the system needs to map ACPI data of the
> host using host physical addresses, while those addresses can conflict
> with the guest physical addresses of the loaded linux kernel. The same
> problem might apply in case a PV guest is configured to use the host
> memory map.
> 
> This conflict can be solved by mapping the ACPI data to a different
> guest physical address, but mapping the data via acpi_os_ioremap()
> must still be possible using the host physical address, as this
> address might be generated by AML when referencing some of the ACPI
> data.
> 
> When configured to support running as a Xen PV domain, have an
> implementation of acpi_os_ioremap() being aware of the possibility to
> need above mentioned translation of a host physical address to the
> guest physical address.
> 
> This modification requires to fix some #include of asm/acpi.h in x86
> code to use linux/acpi.h instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a request to comment a tiny bit more:

> @@ -836,6 +837,33 @@ void __init xen_do_remap_nonram(void)
>  	pr_info("Remapped %u non-RAM page(s)\n", remapped);
>  }
>  
> +#ifdef CONFIG_ACPI
> +/*
> + * Xen variant of acpi_os_ioremap() taking potentially remapped non-RAM
> + * regions into acount.

(Nit: account)

> + * Any attempt to map an area crossing a remap boundary will produce a
> + * WARN() splat.
> + */
> +static void __iomem *xen_acpi_os_ioremap(acpi_physical_address phys,
> +					 acpi_size size)
> +{
> +	unsigned int i;
> +	const struct nonram_remap *remap = xen_nonram_remap;
> +
> +	for (i = 0; i < nr_nonram_remap; i++) {
> +		if (phys + size > remap->maddr &&
> +		    phys < remap->maddr + remap->size) {
> +			WARN_ON(phys < remap->maddr ||
> +				phys + size > remap->maddr + remap->size);
> +			phys = remap->paddr + phys - remap->maddr;

This might be slightly easier / more logical to read as

			phys += remap->paddr - remap->maddr;

Also because of "phys" not consistently expressing a physical address
(when you need convert it, the incoming value is a machine address) a
comment may help here. In fact at the first glance (and despite having
seen the code before) I thought the translation was done the wrong way
round, simply because of the name of the variable.

Jan

