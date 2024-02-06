Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BDA84B371
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 12:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676818.1053111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJca-0005om-OZ; Tue, 06 Feb 2024 11:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676818.1053111; Tue, 06 Feb 2024 11:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJca-0005lt-Lw; Tue, 06 Feb 2024 11:28:12 +0000
Received: by outflank-mailman (input) for mailman id 676818;
 Tue, 06 Feb 2024 11:28:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXJcZ-0005ln-RM
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 11:28:11 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdf0dd83-c4e2-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 12:28:09 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33b4ac95664so15439f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 03:28:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o28-20020adfa11c000000b0033b3ceda5dbsm1886233wro.44.2024.02.06.03.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 03:28:08 -0800 (PST)
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
X-Inumbo-ID: cdf0dd83-c4e2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707218889; x=1707823689; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IgFVud1VtQo/0riAc4PR+zOQ4U+BxG/Cyu9S5J2Memg=;
        b=AXjgD8woZ4FTUQ0o9L+SuRLgQvB+3/4LElHYISIUi4dTxPNx15J2q9pho9ONOGLXKH
         89F4kR/3eQ4e4/2JN8245dU6GwJCAxx04r5c7ggOyXQNaHA6K0QztYbBQVxIUzWcPmtm
         v3nVdbjCcOvWPUgvsDx/J6Wgtaj9ytO+x6ZB0kXd7QIJ1lA6CzHg5tRFP53dcKdbN8+c
         kFu9Daz4v8itb998Y0OzlMJxChbgqjxGjos8RHkX4Ypikgi2YcinLsQTTaSZJt4mkamY
         upzHu533u8c+QyCwigwAg06ZiRwXR6X30SlU2QvnRxqIIGpPm503SMn6VCVclxstfTTZ
         KqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707218889; x=1707823689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IgFVud1VtQo/0riAc4PR+zOQ4U+BxG/Cyu9S5J2Memg=;
        b=aUX4QLxNU1aFohlL7VwvXSuEyCUpk86DLJhrFRHKk/bl25GSSDN5bfqMRwGceGzGcI
         4TPvdzdVm9scE1jNb+QsO9aki6FYR+EEa3ju/TuJrmDsZZtB5dYYzU3YlGQbNUxJr7Ya
         87+wQJC1gR19/+62U1S75c2tNHR8C79lEG0hQJQLN5mLOItxOydWKVpkExLkt62gOtvH
         LRFSfy3B+PET2lqneh8B+tzs7ounBeQ+DmwSwLzbDeFid4qmm8/RMdL5Oxs3TRSSRvjC
         OuDIHK6pa00/WDdUmp6Aloc+wVv5RIN8PogSzytXHES4eiCRR8ANfMypHMCIflEIXVTk
         rW4g==
X-Gm-Message-State: AOJu0YyPGtMRjkPp04FMtJq84nVtO7z5p5qkobSaM1m3IjdpPbkLD9bL
	9amKgA72XmiHNKTxqBKZlKQNXVOQroGx54M8stucWIKV9ZtXAz2mwGKRj5UxNg==
X-Google-Smtp-Source: AGHT+IHNxLlaJEcrnfnaO9vXdYmsdm1sp5O2cxxriPLcKsijA3O1PFqHMr9wYozRIFJN9VXd8RXd5A==
X-Received: by 2002:a5d:4565:0:b0:33b:1786:f911 with SMTP id a5-20020a5d4565000000b0033b1786f911mr921685wrc.54.1707218888732;
        Tue, 06 Feb 2024 03:28:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWi10q8FyXP+VaIxn+OMzRAs1Ee8IpwpMidNQ7P5cLDzL5QR/W3uxr8n5DR7JDQeaJhH3DSmbGOHEjxTUMeLrmuV7LGsGov+Q2jSJp3HzY=
Message-ID: <90f8e183-5e78-49e8-ae2f-9898c1d7686b@suse.com>
Date: Tue, 6 Feb 2024 12:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] iommu/vt-d: switch to common RMRR checker
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240201170159.66330-1-roger.pau@citrix.com>
 <20240201170159.66330-4-roger.pau@citrix.com>
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
In-Reply-To: <20240201170159.66330-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.2024 18:01, Roger Pau Monne wrote:
> Use the newly introduced generic unity map checker.
> 
> Also drop the message recommending the usage of iommu_inclusive_mapping: the
> ranges would end up being mapped anyway even if some of the checks above
> failed, regardless of whether iommu_inclusive_mapping is set.

I'm afraid I don't understand this: When not in an appropriate E820
region, you now even fail IOMMU initialization. Shouldn't such
failure only occur when inclusive mappings weren't requested? At
which point referring to that option is still relevant?

Further to this failing - in patch 2 shouldn't the respective log
messages then be XENLOG_ERR, matching the earlier use of
AMD_IOMMU_ERROR()?

> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -642,17 +642,9 @@ acpi_parse_one_rmrr(struct acpi_dmar_header *header)
>             return -EEXIST;
>         }
>  
> -    /* This check is here simply to detect when RMRR values are
> -     * not properly represented in the system memory map and
> -     * inform the user
> -     */
> -    if ( !e820_all_mapped(base_addr, end_addr + 1, E820_RESERVED) &&
> -         !e820_all_mapped(base_addr, end_addr + 1, E820_NVS) &&
> -         !e820_all_mapped(base_addr, end_addr + 1, E820_ACPI) )
> -        printk(XENLOG_WARNING VTDPREFIX
> -               " RMRR [%"PRIx64",%"PRIx64"] not in reserved memory;"
> -               " need \"iommu_inclusive_mapping=1\"?\n",
> -                base_addr, end_addr);
> +    if ( !iommu_unity_region_ok(maddr_to_mfn(base_addr),
> +                                maddr_to_mfn(end_addr + PAGE_SIZE)) )
> +        return -EIO;

Hmm, noticing only here, but applicable also to the earlier patch: The
"RMRR" (and there "IVMD") is lost, which removes some relevant context
information from the log messages. Can you add a const char* parameter
to the new helper, please?

Jan

