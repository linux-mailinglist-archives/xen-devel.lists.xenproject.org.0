Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B43A2E9C2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:41:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884632.1294375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thREE-0002zC-Jc; Mon, 10 Feb 2025 10:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884632.1294375; Mon, 10 Feb 2025 10:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thREE-0002wV-Gk; Mon, 10 Feb 2025 10:41:26 +0000
Received: by outflank-mailman (input) for mailman id 884632;
 Mon, 10 Feb 2025 10:41:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thRED-0002wP-2r
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:41:25 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 919af34d-e79b-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:41:22 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso680501766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:41:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab79298641asm629364766b.90.2025.02.10.02.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:41:21 -0800 (PST)
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
X-Inumbo-ID: 919af34d-e79b-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739184081; x=1739788881; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PCmp6+ZHs5ncSJkpP6WPx/bPa3xM7UhTbVfW38PHWeM=;
        b=DS7lOENb1pTJ6Dckyf3KrTE/i5qyzVTtAKa+3hQ6ttnDbMh+1Oy9B+kBeXL25ymCnN
         uCvvHkvXvWJLuvtGSXPsF1Ur+vQ6lIDQN8lgilXM21t6rlGOssHkTL/Y/zusOBtQEjte
         XLBaTdBCTWQk7bbPMqJdgF7DHmLV9OXKuma6Xo+Z7FXVNQFSjfgcGCVG0hA9FqI4h37J
         OWNzDXCdliUUZ+IbJgKx0HqiWdcs1olCbASSLhkdr0m4IAI+l/ERI3lOvgBIv5HX6c/D
         AcVsyOanuZq/ZiU96t3ezu03B9VY2XzrMbtvb07tF/Ms1BJRd94Xp8mb4k7QOM05RrS4
         pPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184081; x=1739788881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCmp6+ZHs5ncSJkpP6WPx/bPa3xM7UhTbVfW38PHWeM=;
        b=TtxBxK/1VX03sg9ww1GK5NuKmJiDvGHK/gpbYpX1o6bnjtQZAy21BhvVpqo/zc04bI
         N94JSIFSHGF69OGRRrnCvXMa9KUJhm2lkBkraPww7DEkhK+KIm3JWyScvtKGb4h40k5/
         gGnmkJdoz8OKYYY+oU0TEsMTRQ4Del8agVlHQHDdVbu1sG/DC2GEuZLBO2fY1Ch+WDoG
         LNN+rKBT+wmSNF0ZwJp3F9zE5e7yWDgqIWiE+JBhtEMaty9fYnKdYdPsbZdZTpo7jroY
         ZdMtw2UrsP+VIJQm/LXvc1j6hh9ly7AjQ2F7XFthxPbLGgsIEpBOuaOj1OctzGLhBDq3
         Qlow==
X-Forwarded-Encrypted: i=1; AJvYcCXfLTIsYvqrYJlqNeL1C01aJpDvxfP0Wz1v2bRSaWDiDJrKRxDFqZM+seesKhefoG9dS/zife+kyC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC2JjMbn8HGjVSgHLYxbAFmo49bEGF5EcJmksPmnxkjJ5cy3wL
	YdzNBvUfEblz4wBHHQYMpYwWSauBpZePyrNf7q32VmRL7n17k50BUsOIKuKS/w==
X-Gm-Gg: ASbGncuqRIFtENhKpnvDCBFNutBJ/dI9JF/Vpl/irEdYfgJtMwBnfKwMRr5hW/lVQ5p
	5i3kui+L5qD5NbTlpZgam+Z4oTf2hZADciS+PkpWlxXx7xJ47OZkTuqT6XkM+HkwbARNbCSa+Ey
	ktusLLXPP0Cr/7WZhoc/OxP4wMPvLHoKhqD3GCUTHk15n775sh7HqYlZWB8nOhBFU5bZXJaYt/h
	W25qhgAV77XA5cven/bIKpKeSPNmKV1sbtdgQAnU+hNdZB3bCyqmwvXbzoBknIFESed5t0y92bD
	hEai98EUb6RKSBtDpY1SQFP6UUciuCk+yON65GzDkeLOpTrv9ghcxq+hU1qtmfPLSU0TsuQ0Y8A
	B
X-Google-Smtp-Source: AGHT+IFwo3Zws6B8gaBSnGTNcdT73A/NGjWhhP28sALl4yqXPmKq3CRAf3tFDRNPVN+DAa8hxpf7qA==
X-Received: by 2002:a17:906:5494:b0:ab7:8e0d:3d3c with SMTP id a640c23a62f3a-ab78e0d3e98mr1086058666b.42.1739184081524;
        Mon, 10 Feb 2025 02:41:21 -0800 (PST)
Message-ID: <5b36425c-cadd-4fd2-8495-c1853d024646@suse.com>
Date: Mon, 10 Feb 2025 11:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86/pci: disable MSI(-X) on all devices at
 shutdown
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <20250206150615.52052-5-roger.pau@citrix.com>
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
In-Reply-To: <20250206150615.52052-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 16:06, Roger Pau Monne wrote:
> --- a/xen/arch/x86/crash.c
> +++ b/xen/arch/x86/crash.c
> @@ -177,6 +177,7 @@ static void nmi_shootdown_cpus(void)
>  
>          disable_IO_APIC();
>          hpet_disable();
> +        pci_disable_msi_all();
>      }

Apart from my concern below regarding use of the function in this context,
for both uses I wonder in how far the order of the three calls above may
matter. I can't really give a precise reason, but to me it feels like the
PCI device processing may better be done first.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1803,6 +1803,39 @@ int iommu_do_pci_domctl(
>      return ret;
>  }
>  
> +struct segment_iter {
> +    int (*handler)(struct pci_dev *pdev, void *arg);
> +    void *arg;
> +    int rc;
> +};
> +
> +static int cf_check iterate_all(struct pci_seg *pseg, void *arg)
> +{
> +    struct segment_iter *iter = arg;
> +    struct pci_dev *pdev;
> +
> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> +    {
> +        int rc = iter->handler(pdev, iter->arg);
> +
> +        if ( !iter->rc )
> +            iter->rc = rc;
> +    }
> +
> +    return 0;
> +}
> +
> +int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
> +                        void *arg)
> +{
> +    struct segment_iter iter = {
> +        .handler = handler,
> +        .arg = arg,
> +    };
> +
> +    return pci_segments_iterate(iterate_all, &iter) ?: iter.rc;
> +}

My earlier concern remains as far as e.g. list traversal goes, especially
when we're called from nmi_shootdown_cpus() context. The lists themselves
may be screwed, after all. Whereas disable_IO_APIC() and hpet_disable()
don't involve any list traversal, and even if they did those lists would
be stable post-boot.

We may want to talk about the up- and down-sides of this on the x86 call
later in the day.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -226,6 +226,10 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
>  struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
>  void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
>  
> +/* Iterate without locking or preemption over all PCI devices known by Xen. */
> +int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
> +                        void *arg);

Oh, I see you added the comment here that I did ask for. As it's pretty
important for people to notice, may I ask that it be replicated in (or
ahead of) the function definition? And then there perhaps also mentioning
that one needs to be aware of the function being expected to run with IRQs
off (to make clear that it's not a simple matter of adding preemption
checks, for example).

Jan

