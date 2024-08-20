Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23D95835B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 11:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780251.1189881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgLbE-0001GB-8G; Tue, 20 Aug 2024 09:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780251.1189881; Tue, 20 Aug 2024 09:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgLbE-0001ER-4d; Tue, 20 Aug 2024 09:56:24 +0000
Received: by outflank-mailman (input) for mailman id 780251;
 Tue, 20 Aug 2024 09:56:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgLbC-0001AF-OK
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 09:56:22 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7391e67d-5eda-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 11:56:20 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso4346805e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 02:56:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c66e2sm739681766b.3.2024.08.20.02.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 02:56:19 -0700 (PDT)
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
X-Inumbo-ID: 7391e67d-5eda-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724147780; x=1724752580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O22wnNYOCBxaZUWUifSw34IZJjKrxoUhdzvzmYoIV68=;
        b=PalY9WhcQAx4h56lDLb14/V3v57gOtxKMtKlN+YsrXZcjYo5kfU4ZEk5PZrVJMBoFp
         t6Gdkf/4cFXMVjw7Q8zb34jvsfR0WsJnfhrn341JnabFPkVaHYXRjwRJVq1YZ3/BeSwU
         nDhs7MNky9M2lp+Mna7szNweYG/msnbJnGFvAj8UkMLM3j3kLAabuTADskdxrt5MJ5R7
         wW74b49pAwVR2I9ILNNbxUawsJdpqDjuMHNzrURbBtnAdp3zqA0KSAB9DteE9HaGENlu
         kqHpBoFXo9Xs92qFncOFJhc4kxmPpCZGU4pvEhpmoBRyr3ep4sYe5PQ5/onzQT6DB1vR
         9T5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724147780; x=1724752580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O22wnNYOCBxaZUWUifSw34IZJjKrxoUhdzvzmYoIV68=;
        b=oujgKaQVt0npvmIEZ7Oimsyu9T1eN9VPpbma9rby1a9h+0t3Yh316MYBPWEhc7ra+l
         ah8jQFSGIB1YFpLzCFVM+FIj4dl/Lq0voZT3dw9JUWB4No1p08YfiQCpeIyjsFZ3p3Sq
         WXu3d/T7Iqma2KtJjm1D7QJFx5TD/bw+aBN20P56OCNynjAxI0+8AH1nzbV9/KB+kWnJ
         xvSOteYX156gLJ4E8P5MiiU+60HZhw/uXhAKGJxQjQQRgMOOtCURcaVw/u//5vWPk2WT
         P963ffYcj2DvyxhynvfvXtiI52Hj+zKelAxzs2C3ci5+tciha3bt47E9sZZLtaj5r5qQ
         7tSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp3lGAUCH04sbrZ5XMmekFMsV7boVRpKho6EV9E8HkaJ2TptZK1C/2YD1MxccKY8sgy9dkVbUBDOk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyrx0opL2b4OCamtZv5SUdBo6JCZU/dAVDIFJGQlRuMT2Ve4H0K
	sgT1nGW00OI/PM8zKGDdnzfvGxmQWsczGtrPiYzlAPhSyikS+ivSGoVvB4mEuA==
X-Google-Smtp-Source: AGHT+IFrsPT4hsY3MVuzsaum359JeocN124iERr4tvRuSUdtykAH993mPaa7xKBT+WQaa6tnUfu4FA==
X-Received: by 2002:a05:6512:3085:b0:533:809:a970 with SMTP id 2adb3069b0e04-5331c6a20e1mr8788954e87.14.1724147779985;
        Tue, 20 Aug 2024 02:56:19 -0700 (PDT)
Message-ID: <607602c3-5199-4326-8676-d28a8b42b4b5@suse.com>
Date: Tue, 20 Aug 2024 11:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen: allow mapping ACPI data using a different
 physical address
To: Juergen Gross <jgross@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-acpi@vger.kernel.org
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-7-jgross@suse.com>
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
In-Reply-To: <20240820082012.31316-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2024 10:20, Juergen Gross wrote:
> @@ -838,6 +839,31 @@ void __init xen_do_remap_nonram(void)
>  	pr_info("Remapped %u non-RAM page(s)\n", remapped);
>  }
>  
> +/*
> + * Xen variant of acpi_os_ioremap() taking potentially remapped non-RAM
> + * regions into acount.
> + * Any attempt to map an area crossing a remap boundary will produce a
> + * WARN() splat.
> + */
> +static void __iomem *xen_acpi_os_ioremap(acpi_physical_address phys,
> +					 acpi_size size)
> +{
> +	unsigned int i;
> +	struct nonram_remap *remap = xen_nonram_remap;

const (also in one of the functions in patch 5)?

> +	for (i = 0; i < nr_nonram_remap; i++) {
> +		if (phys + size > remap->maddr &&
> +		    phys < remap->maddr + remap->size) {
> +			WARN_ON(phys < remap->maddr ||
> +				phys + size > remap->maddr + remap->size);
> +			phys = remap->paddr + phys - remap->maddr;
> +			break;
> +		}
> +	}
> +
> +	return x86_acpi_os_ioremap(phys, size);
> +}

At least this, perhaps also what patch 5 adds, likely wants to be limited
to the XEN_DOM0 case? Or else I wonder whether ...

> @@ -850,6 +876,10 @@ void __init xen_add_remap_nonram(phys_addr_t maddr, phys_addr_t paddr,
>  		BUG();
>  	}
>  
> +	/* Switch to the Xen acpi_os_ioremap() variant. */
> +	if (nr_nonram_remap == 0)
> +		acpi_os_ioremap = xen_acpi_os_ioremap;

... this would actually build when XEN_DOM0=n.

I'm actually surprised there's no Dom0-only code section in this file,
where the new code could then simply be inserted.

Jan

