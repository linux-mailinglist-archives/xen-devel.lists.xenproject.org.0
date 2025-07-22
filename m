Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B6DB0D4D2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 10:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052186.1420766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue8ZL-00019Z-EZ; Tue, 22 Jul 2025 08:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052186.1420766; Tue, 22 Jul 2025 08:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue8ZL-00017h-AV; Tue, 22 Jul 2025 08:41:51 +0000
Received: by outflank-mailman (input) for mailman id 1052186;
 Tue, 22 Jul 2025 08:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ue8ZK-00017a-9T
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 08:41:50 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4752824-66d7-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 10:41:48 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso3852865f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 01:41:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d5820sm7164004b3a.52.2025.07.22.01.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 01:41:47 -0700 (PDT)
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
X-Inumbo-ID: b4752824-66d7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753173707; x=1753778507; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5qoGlNHBTp8UGr4xoKzldWKTMeeWOO5Eai+f9TC7m2w=;
        b=bSTqs+0Atlv1QfU2G+73aSySz+uAlW9tzwGpH8jHGccsh0GrfcGcI0mcm2+HH7iCFa
         oFFelbi8NxH5s2y5MequoU+l4d4JS7OOchDSvOdHssMHdfGKYwwE62dg0G+QuF4uMTLe
         oWIzUXYhXSmJ00hwmSKT7R3GK5I9XKd3JiUsm7kv1vvS+fx/wrFKTMuvHrev7xiyYCzA
         9bW+B8gXa+2GFX9GGu+XwN4TQMGsDwrCxBrwx8vglTV+vN04amf6gx1FrytNqfaNHoTn
         wJiwWPMXG6ZXQ7qet0MwJOL/y8Hi2+6XV6/BFVh4o4p//2fW0FBjttM7GvK1PzgR33M6
         Df6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753173707; x=1753778507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qoGlNHBTp8UGr4xoKzldWKTMeeWOO5Eai+f9TC7m2w=;
        b=hJGxFu3taob4pOkSDS1M3+k2uI4+MnqK6HKFw5nanGTqgcMHVDIXUqq7pllJy8BGM/
         wxQPQSWJi4uAcqHN+pdk/AydDScLwPdkMLnNiLPFAOGic0SDKrN2EOMXRZlksO6ayVxN
         cewXZk+IAse8A5NFNMEj58zmyZkfzD6WWGx7CPcswC3Yw7j1HrzhLodZwRRoiPF9pm4z
         ANu8aDY7P4cRq0O9MY3six9KtGYPyvXHljkPbkGjeLdi+us4Im/pKNxJ0IaUa7DC5Jgd
         fD0WN4crAUdHJZyl2IScFimrIHTQ3A4XLoy1ovWRi9Jj4yXacplMB9aNRWgY28kHi0R0
         dqDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVojXaGYtwdXtNCSQcE9v+XZcvZpOy98YmlN6/BHwfLFEjc57ebDRpyGCjvDtIqQbfi+Ck9rzoVTN8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5BD2pfNdWFQ8pUo/QMb7jJcAg1LKdtKgRaSFwJ3O3DFEumC5h
	S+e68h52QhqS/fvDEriwF1lrOX1vjeuAQwzoC5RVU6myBiiU859jqyN8t1e016uQtw==
X-Gm-Gg: ASbGncuQqeD41Cjou11Os9zSrnSf33nZL5FWlxVNSHmzw3bEx9DDdqQOpwaF5t7m/9+
	lTuzj1EFLI//C4SaSYIgBaynQ+D5HDZPyzCn7zhpefVYOZAcSJ1GCUMnI88cfH2QUqAhmdG9ytI
	MTJUli7aX70NmnBHDnSfiIrKLbC6H69D66E0zu4LKD1P1Yr1hD71kZw48VkWdmpS84RCjdC3SGx
	HH2j1wLNuyMBAUf9M65QpxDxhq7J0AwJe6K8sYyBW9XtoXhSh+uxLmfCOR+r3P8fDZwpEIBjaIq
	uPEo6cT9Hlt0q+5rbFxm9umifiBExtJ+fVR1//8f4qyCSJqWlW8dD1An7BiOXC1oBhbZdNsxHC0
	BzAqWbNR1+tOYXKC9lDA8ElLYygNyYj8f0XRUSthenqf3kpj3DtBf+t5/Gm+wLHVpHUxpcdXk0H
	u6FOCf6lU=
X-Google-Smtp-Source: AGHT+IFTZO4TVVL7jHoPi4iqZCuI1bE1QF6ZYqDVhZIcWkVWwqU6gIzQZf9ZkV08XkFQcsM76mr3FQ==
X-Received: by 2002:a05:6000:43c6:10b0:3a4:f744:e01b with SMTP id ffacd0b85a97d-3b60e50fde7mr13645149f8f.39.1753173707458;
        Tue, 22 Jul 2025 01:41:47 -0700 (PDT)
Message-ID: <ee2517e3-94ad-4d92-abb0-23cb69825928@suse.com>
Date: Tue, 22 Jul 2025 10:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drivers: Make ioapic_sbdf and hpet_sbdf contain
 pci_sbdf_t
To: Andrii Sultanov <sultanovandriy@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1752736989.git.andriy.sultanov@vates.tech>
 <94d8b7537021337a6b54d8950294702f5bbd2590.1752736989.git.andriy.sultanov@vates.tech>
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
In-Reply-To: <94d8b7537021337a6b54d8950294702f5bbd2590.1752736989.git.andriy.sultanov@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 09:31, Andrii Sultanov wrote:
> Following a similar change to amd_iommu struct, make two more structs
> take pci_sbdf_t directly instead of seg and bdf separately. This lets us
> drop several conversions from the latter to the former and simplifies
> several comparisons and assignments.
> 
> Bloat-o-meter reports:
> add/remove: 0/0 grow/shrink: 1/10 up/down: 256/-320 (-64)
> Function                                     old     new   delta
> _einittext                                 22092   22348    +256
> parse_ivrs_hpet                              248     245      -3
> amd_iommu_detect_one_acpi                    876     868      -8
> iov_supports_xt                              275     264     -11
> amd_iommu_read_ioapic_from_ire               344     332     -12
> amd_setup_hpet_msi                           237     224     -13
> amd_iommu_ioapic_update_ire                  575     555     -20
> reserve_unity_map_for_device                 453     424     -29
> _hvm_dpci_msi_eoi                            160     128     -32
> amd_iommu_get_supported_ivhd_type             86      30     -56
> parse_ivrs_table                            3966    3830    -136
> 
> Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>

Here the unspecific subject prefix is actually a problem: It remains unclear
what component(s) is (are) being altered.

> @@ -746,8 +744,9 @@ static u16 __init parse_ivhd_device_special(
>      const struct acpi_ivrs_device8c *special, u16 seg,
>      u16 header_length, u16 block_length, struct amd_iommu *iommu)
>  {
> -    u16 dev_length, bdf;
> +    u16 dev_length;

Nit: Preferably switch to uint16_t while touching such a line.

With the adjustments (which can be done while committing, I guess):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -780,8 +779,7 @@ static u16 __init parse_ivhd_device_special(
>           */
>          for ( idx = 0; idx < nr_ioapic_sbdf; idx++ )
>          {
> -            if ( ioapic_sbdf[idx].bdf == bdf &&
> -                 ioapic_sbdf[idx].seg == seg &&
> +            if ( ioapic_sbdf[idx].sbdf.sbdf == sbdf.sbdf &&

Just to mention - there are of course a lot of "sbdf" on lines like this now.
We may want to reconsider naming of the two global variables (not here, but
in general).

Jan

