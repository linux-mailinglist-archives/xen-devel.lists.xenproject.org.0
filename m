Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E429950E5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 16:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813146.1225960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syAmM-0004GR-Et; Tue, 08 Oct 2024 14:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813146.1225960; Tue, 08 Oct 2024 14:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syAmM-0004EQ-CD; Tue, 08 Oct 2024 14:01:34 +0000
Received: by outflank-mailman (input) for mailman id 813146;
 Tue, 08 Oct 2024 14:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syAmL-0004EI-7V
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 14:01:33 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2710117-857d-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 16:01:32 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c89e66012aso7475716a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 07:01:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5bb208sm512283166b.22.2024.10.08.07.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 07:01:29 -0700 (PDT)
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
X-Inumbo-ID: d2710117-857d-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728396091; x=1729000891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dUJqdgqjDh1k5YyMXrH9PCRFMIw93isETC+QzMtPZ9E=;
        b=FoFt6XZ9UZpNAOj3eLakSseHrFVcBAUGatOuXSVhmX2TvOIFYhx+zDl8zk06kyf6gj
         h6hPQzNKG+BpOg1GRcKV49bKYBl7IAbkhGqES8qffRXgfkwpe7XI1lF4IH/Li8Fo56cV
         PhUHGGEqB8Rp6P//cfrlM03ZBOdCLAaSJw+RW0QUg8h4SnlSF8IVTUlkmDDiShn2MS/t
         5QM5Q9vU5MIwlHcJrcRDQ9agYorjS2Ox28Qyqr+VInd4C+bL0lC1fZRg8Hv3wVpwh3t0
         wajeZL3gacwu99mDZZx4o57BL9lFXzHAegQVPT2iHasBMQVIZjYdB1iYK/KaOQ5YjFds
         JZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396091; x=1729000891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUJqdgqjDh1k5YyMXrH9PCRFMIw93isETC+QzMtPZ9E=;
        b=WUDqW7HWOLBc445b12tjisMggBuaO6BtkKd/bXpi4VPeWOd9VzKB4dsc3wR4SzmCi7
         KQZQ189UyAXlEDQ0WZv7vhZotp3uDnxlW/S+1dB8CuHHZyoMhOGIa1j5BTuqcXbv9jp/
         369A+1NDaKcbhBIWAZgXDJPNaGsoXzjQEQ3wsydZ27q+Rz6sRU2z/cr5DAj0CTod+6wN
         mlB6dbEvdlv24m1+xACtHTwA6/hkB9M+AIFHDsdIvBvQV1xuhzpy1V/Ty76NnH/A2IUO
         +SdKJ+pao+lfQzDJnStT773DRGEKHG8Rw5eQWuG+mIZw/B9ITOz85lxtx4q8de2tQnv7
         AG8A==
X-Forwarded-Encrypted: i=1; AJvYcCWqzbfB6dD6k/u91MJlWTxWvSbQrMzOq70QhLF5EuY3mGnAGjhncJAYTCsw1MGmgsPF80c9dNCQMtc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqP3Ipx1acAckYRITQi4YGYrRFprX2mjmt6nF05efonPLgbPA3
	m3qik7bgwvJKV4cYAF9P/A0kXcirTsOiJn/xqxJaKXljYdXBF3jlRKc+PnL8p14poTPE4zXb6NM
	=
X-Google-Smtp-Source: AGHT+IGv0vCFBsZD0TyXSRiC7QjQ5O9M7LZySYYvCR02j54A33TEn2mqx8QMBXHakdzvTAZhS57aAA==
X-Received: by 2002:a17:907:9726:b0:a8d:5472:b591 with SMTP id a640c23a62f3a-a991bce5c40mr1759592666b.5.1728396089786;
        Tue, 08 Oct 2024 07:01:29 -0700 (PDT)
Message-ID: <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com>
Date: Tue, 8 Oct 2024 16:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD
 is not behind any IOMMU
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Willi Junga
 <xenproject@ymy.be>, xen-devel@lists.xenproject.org
References: <20241008104706.74001-1-roger.pau@citrix.com>
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
In-Reply-To: <20241008104706.74001-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2024 12:47, Roger Pau Monne wrote:
> IVMD table contains restrictions about memory which must be mandatory assigned
> to devices (and which permissions it should use), or memory that should be
> never accessible to devices.
> 
> Some hardware however contains ranges in IVMD that reference devices outside of
> the IVHD tables (in other words, devices not behind any IOMMU).  Such mismatch
> will cause Xen to fail in register_range_for_device(), ultimately leading to
> the IOMMU being disabled, and Xen crashing as x2APIC support might be already
> enabled and relying on the IOMMU functionality.

I find it hard to believe that on x86 systems with IOMMUs some devices would
be left uncovered by any IOMMU. Is it possible that IVHD is flawed there? In
which case we might rightfully refuse to boot? (Can you share e.g. that
"iommu=debug" output that results from parsing the tables on that system?)

> Relax IVMD parsing: allow IVMD blocks to reference devices not assigned to any
> IOMMU.  It's impossible for Xen to fulfill the requirement in the IVMD block if
> the device is not behind any IOMMU, but it's no worse than booting without
> IOMMU support, and thus not parsing ACPI IVRS in the first place.
> 
> Reported-by: Willi Junga <xenproject@ymy.be>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/drivers/passthrough/amd/iommu_acpi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
> index 3f5508eba049..c416120326c9 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -248,8 +248,9 @@ static int __init register_range_for_device(
>      iommu = find_iommu_for_device(seg, bdf);
>      if ( !iommu )
>      {
> -        AMD_IOMMU_ERROR("IVMD: no IOMMU for Dev_Id %#x\n", bdf);
> -        return -ENODEV;
> +        AMD_IOMMU_WARN("IVMD: no IOMMU for device %pp - ignoring constrain\n",

I'm not a native speaker, but "constrain" to me can only be a verb (with
"constraint" being the noun). IOW as worded I'm afraid I can't make sense
of the message.

> +                       &PCI_SBDF(seg, bdf));
> +        return 0;
>      }
>      req = ivrs_mappings[bdf].dte_requestor_id;
>  

Down from here in parse_ivmd_device_iommu() is somewhat similar code.
Wouldn't that need adjusting similarly then? Or else shouldn't the
adjustment above be accompanied by a comment clarifying that the
behavior is just because of observations on certain hardware?

Jan

