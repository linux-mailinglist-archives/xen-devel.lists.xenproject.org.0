Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056E8A89B9B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 13:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953651.1348110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eDo-0006Lm-6m; Tue, 15 Apr 2025 11:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953651.1348110; Tue, 15 Apr 2025 11:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eDo-0006JG-3k; Tue, 15 Apr 2025 11:12:56 +0000
Received: by outflank-mailman (input) for mailman id 953651;
 Tue, 15 Apr 2025 11:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4eDm-0006J3-Rh
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 11:12:54 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93860b41-19ea-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 13:12:53 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so25784835e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 04:12:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f204c500bsm214506275e9.0.2025.04.15.04.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 04:12:52 -0700 (PDT)
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
X-Inumbo-ID: 93860b41-19ea-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744715573; x=1745320373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jDdI8MdXwll1K4LJK1H0y7rVkGm3Yd4SWMdwH75ZV1g=;
        b=C9Kci9EB8SF6lhJsXeJ/GommEJdu6f9Y8ue/AxeO7MUOLW0vJFFy/+MDT+rnJQ6EKk
         4ENMlB0HWHuPn8jZpqn7UFSBb601bFivYMCv5RVFGaHE3LKtKQC0odQPRAzX2ZjhMcgb
         kq+Vbi6b8cToPbbyfJAhRSog2vK2bRzzlh5nbcePwkTCOGY5kQqJxuzOuBrd/y02g7p9
         4CHgzk8JKDdUjwk1pE2LRMs8jMhT6Q/a3ISqLLiviOd2vC5tt7Sm0JfbI938wqtQegfq
         OIeIwoWS4hhZH9kRh8gI5k4iVdRbvYUiFefPtPg2IrtOYTBD5MLAFq0XgSdE9ez+dO8q
         bZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715573; x=1745320373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDdI8MdXwll1K4LJK1H0y7rVkGm3Yd4SWMdwH75ZV1g=;
        b=wpq+DUXdLajlSohI7HhBG3ttl+xuIX3MdO1neRdbvQMTpqbWF+PMDujLCq+91HYD++
         Cxm7EnTnpEd1GP5g0CRZjAFUlDqo5nF9I6idGhFvxCeVk8sHT5Djs+i1pi0zQI151dDa
         V/W5AvQzwe4JAMc0Qy51zcI23oWwXD8vscaszu/4BGiOefS3SmRXHITqbOOUgcS3zme5
         dqrc9X8cx03CAKkHNmWc4V/7vvERIaLEtBsOs/qCwIVXB0fRJ0pd9GolgPQR1VJ3MQEP
         vhwpxyDq4zhTs1ITNFR2P9V3gyEvhdRvgWNZSHGrWURQfJ/QqxhQ9H2giPCbiY12JAAe
         NtrA==
X-Forwarded-Encrypted: i=1; AJvYcCWtRBdpGNC/+nqDU0jIH8xDBeOmSr0iOfEF0C/+zeDYeDSkSkk1aA3elNwc4WPzhDC1NDOp0zMfCcA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOgJejMF+Fgg1GjW5njMu6+v0hpyRNO5RHJVQQVmfcd7Lnptmj
	cBWkfWPA1crhc/kmhEqKhIZ5z4zFTfNU9mCaMS09xPE+f47vZTISkO1tgulQvg==
X-Gm-Gg: ASbGncu1O2OtybT7Jjl+FeOz3bYjwMXPqVPQ8ZhCH3qjBxd1BF95LrTlBbRkmnCjSBw
	wtdFeRl32KsVkPnt6trfedBpCgkiV/PQ0WiGapYiqGxQ/qswGW33qJattmGyw9hGAEthpyCNcj/
	hCH31oETyX/zz8OAU4VHJCahmFNcWIY/0//YZVzIHL+XXDDK4tMXvcO1c1g1gMPlteOvuKE8K8T
	THNThAD/txP92brYW6AqU9HVRtMJyKInw7bL0eHMDnOWKUnEdn3G6b2HJvp8yJQIYrSWOGh/sfi
	EnIdj8i6j2vPJO40GALz60TovSB2pEkpBoXggYt3Hjdi0WO4R89g/4LNYOg7kWCF7txcaGrPGdu
	M7MNvuNJsOhsOBLqUXNNxlu6T0A==
X-Google-Smtp-Source: AGHT+IEyNTMio2FiflKOuRaRu0N3PgiccXYuUcw+9K538QVDKI5zFZDeITfMBPcvG69HSMfRQNVr9A==
X-Received: by 2002:a05:600c:500e:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-43f3a93ca20mr168528415e9.10.1744715573161;
        Tue, 15 Apr 2025 04:12:53 -0700 (PDT)
Message-ID: <8f2f9dab-a7db-42a5-a359-ef45a64cd065@suse.com>
Date: Tue, 15 Apr 2025 13:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drivers: Make ioapic_sbdf and hpet_sbdf contain
 pci_sbdf_t
To: Andrii Sultanov <sultanovandriy@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1744657012.git.andriy.sultanov@vates.tech>
 <af7536c3234bc7a9d048b4cb1d45f084b4343bdb.1744657012.git.andriy.sultanov@vates.tech>
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
In-Reply-To: <af7536c3234bc7a9d048b4cb1d45f084b4343bdb.1744657012.git.andriy.sultanov@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 21:19, Andrii Sultanov wrote:
> @@ -748,6 +746,7 @@ static u16 __init parse_ivhd_device_special(
>  {
>      u16 dev_length, bdf;
>      unsigned int apic, idx;
> +    pci_sbdf_t sbdf;

Why does bdf need keeping around here?

> @@ -335,20 +336,18 @@ void cf_check amd_iommu_ioapic_update_ire(
>      new_rte.raw = rte;
>  
>      /* get device id of ioapic devices */
> -    bdf = ioapic_sbdf[idx].bdf;
> -    seg = ioapic_sbdf[idx].seg;
> -    iommu = find_iommu_for_device(PCI_SBDF(seg, bdf));
> +    sbdf = ioapic_sbdf[idx].sbdf;
> +    iommu = find_iommu_for_device(sbdf);
>      if ( !iommu )
>      {
> -        AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
> -                       seg, bdf);
> +        AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %pp\n", &sbdf);

Hmm, this one's somewhat questionable: An IO-APIC isn't a PCI device, so
making its "coordinates" look like one can be confusing.

> @@ -369,7 +368,8 @@ unsigned int cf_check amd_iommu_read_ioapic_from_ire(
>      unsigned int offset;
>      unsigned int val = __io_apic_read(apic, reg);
>      unsigned int pin = (reg - 0x10) / 2;
> -    uint16_t seg, bdf, req_id;
> +    pci_sbdf_t sbdf;
> +    uint16_t req_id;
>      const struct amd_iommu *iommu;
>      union irte_ptr entry;
>  
> @@ -381,12 +381,11 @@ unsigned int cf_check amd_iommu_read_ioapic_from_ire(
>      if ( offset >= INTREMAP_MAX_ENTRIES )
>          return val;
>  
> -    seg = ioapic_sbdf[idx].seg;
> -    bdf = ioapic_sbdf[idx].bdf;
> -    iommu = find_iommu_for_device(PCI_SBDF(seg, bdf));
> +    sbdf = ioapic_sbdf[idx].sbdf;
> +    iommu = find_iommu_for_device(sbdf);
>      if ( !iommu )
>          return val;
> -    req_id = get_intremap_requestor_id(seg, bdf);
> +    req_id = get_intremap_requestor_id(sbdf.seg, sbdf.bdf);
>      entry = get_intremap_entry(iommu, req_id, offset);
>  
>      if ( !(reg & 1) )

Is a local variable here warranted in the first place?

Jan

