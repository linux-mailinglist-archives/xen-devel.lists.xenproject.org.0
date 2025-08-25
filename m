Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE569B33E61
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 13:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093066.1448640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqVjs-0008O9-Ph; Mon, 25 Aug 2025 11:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093066.1448640; Mon, 25 Aug 2025 11:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqVjs-0008Mg-LJ; Mon, 25 Aug 2025 11:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1093066;
 Mon, 25 Aug 2025 11:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqVjq-0008MV-Kr
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 11:51:50 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1858529-81a9-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 13:51:48 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso573591666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 04:51:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fc3d82sm536588766b.44.2025.08.25.04.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 04:51:47 -0700 (PDT)
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
X-Inumbo-ID: e1858529-81a9-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756122708; x=1756727508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+YuS4sZR+LkuqbQ09E+pM2MczegEfkoyBFYzqbDabWc=;
        b=NcN44rXgDrJowuEnvPir9VjM902Huw2THDSjhJSynBCRypHQoYxnWICPV+Fj7aNI05
         WAG4V1r+6pw8EMQ7uKc+qhBDe4rP17AOkwAakfi69zYk8yYuoI/VzrDM3yLlrLRjRQVc
         RJDC6fK6P1eRwt5ht1pp0WOz3SGau3KQh/mIXbbY8Wrd7GWMgU1s8MzWrKKgvuSEo0q/
         0sy6KTeW5pJtPbxwOCSdSZ6AJNjYBl/AnLmTpx2yXeeYhoV4vPO+B6uIsKVg+58Rqgsg
         xvL9t29tYzTgqvihZnG1fd9bzE9+9UNudGBITj3Rp1mCMDsKLv4RVWV8pbnBlnFJD82H
         f0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756122708; x=1756727508;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YuS4sZR+LkuqbQ09E+pM2MczegEfkoyBFYzqbDabWc=;
        b=I0ssvD5S1M9RLmH2cOcOxM7q26M+8evs4fYk/yhzYPypgwRj9c9ksdwXLxx1Y9CQBZ
         QNFv/K7LqzwNwa6d5mYSuK4qE6N29h9ChN9bcE3FwBDHyBkVYs6wiDPEeYvKpC5e8DA2
         Om7ZVBmz/DgZa1+ra4Hicq9lJC+lJa91a14C7AD4nmADZj6um/rgFEsj1HVOoXT2vYB8
         mHduiGK2iwWF0JjvKtDYtcyon3PgtryU1BYKhhJaTWzFiKSHKo4aQe0tZltEIO92u8Wi
         9z45kZESd80Pv1XAAYkjFRklqjnBQkoxyXbU2N3jHZjuIAKsIE6zVJ47WOeFmJMWSPTb
         R0+g==
X-Forwarded-Encrypted: i=1; AJvYcCUd2MzkB0aPc1XnPza603+P/8I+6CnmxFJOOJFhI9RZgUg0Xhe6PVr/PVcKsuc6bFNaK/tayXpg+mg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2pX/12VVGaLwD7DwAHu3FnDfdgmHc41tM4ppGK2v5SL1axX5H
	k2MdMNYYl9LRYhHLBT5V/LEsR3aW6cuCWiIhgB02TXG6Bvl/eidioQ5tjFEwLD9pfA==
X-Gm-Gg: ASbGncvxZO60tnEwm967jPW0YWdOoQRPtlYxZzDizGo++Q2IKsPvvQ7rDbeft/sSFsw
	uiYFn6OTZszXHfk81d4yA08OYcNgItYUr/Tq0x205+1tT+BMfnxF5OEf7ZM9TGSOdEGiEDkkhAn
	q5ckoebAd+u662zFdbhznRHu9GlvIyL0ddQ4h93v0B4ay7kTMRohvH1oY87xoEI7L+8/FajKyy1
	agT++Us2MJW+ydd+KPpXSSfeNYerQQpa7dP4/dUs4zrTRm6rLwzmIWtLKkEoy6h2vZaaQ1PlTJ0
	GoY2mSUwqfU+t0TJwmeSLFJYBhGqg/vJyAfs9mN/7r6RMyLwrwxqdZTK+yuKRgmrXZkm4voi5iX
	zbiomAj6f6BZdfa0zAo7tt/C7+/34SXwseYY2mMuCgX18jP88ZVFhTT0IWIBDsKuK+xB32X5aa1
	bVTcCb89w=
X-Google-Smtp-Source: AGHT+IE3+RJSna3i/RSMSpmaTbkEiFw6wvmByFoBLXZmHivWc8X+iUH5X0yvLs9HvIfQOy+7APPXCw==
X-Received: by 2002:a17:907:7b88:b0:afa:17ef:be35 with SMTP id a640c23a62f3a-afe28ec568dmr1291717866b.4.1756122707598;
        Mon, 25 Aug 2025 04:51:47 -0700 (PDT)
Message-ID: <f543ef05-e3e0-453b-bbaa-74fbfd9488e0@suse.com>
Date: Mon, 25 Aug 2025 13:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/vpci: only check BAR validity once
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: stewart.hildebrand@amd.com, Jiqian.Chen@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250814160358.95543-1-roger.pau@citrix.com>
 <20250814160358.95543-6-roger.pau@citrix.com>
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
In-Reply-To: <20250814160358.95543-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2025 18:03, Roger Pau Monne wrote:
> Avoid multiple calls to pci_check_bar() for the same memory decoding
> related operation, as each call can possibly print a warning message avoid
> a BAR being in an invalid position.

s/avoid/about/ ?

> @@ -217,13 +179,13 @@ bool vpci_process_pending(struct vcpu *v)
>           * rangeset_consume_ranges() itself doesn't generate any errors.
>           */
>          rangeset_purge(bar->mem);
> +
> + next:
> +        if ( bar->valid )
> +            bar->enabled = v->vpci.cmd & PCI_COMMAND_MEMORY;

Isn't it at least latently risky to possibly leave ->enabled set to true
when ->valid is false?

> @@ -243,10 +205,8 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>          struct vpci_bar *bar = &header->bars[i];
>          struct map_data data = { .d = d, .map = true, .bar = bar };
>  
> -        if ( rangeset_is_empty(bar->mem) )
> -            continue;
> -
> -        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
> +        while ( bar->mem &&
> +                (rc = rangeset_consume_ranges(bar->mem, map_range,
>                                                &data)) == -ERESTART )
>          {
>              /*
> @@ -258,9 +218,10 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>              process_pending_softirqs();
>              write_lock(&d->pci_lock);
>          }
> +
> +        if ( bar->valid )
> +            bar->enabled = true;
>      }
> -    if ( !rc )
> -        modify_decoding(pdev, cmd, false);
>  
>      return rc;
>  }
> @@ -326,6 +287,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>           */
>          rangeset_purge(bar->mem);
>  
> +        /* Reset whether the BAR is valid, will be checked below. */
> +        bar->valid = false;

Just that I can't spot any check further down. It's only ...

> @@ -341,6 +305,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }
>  
> +        bar->valid = true;

... this setting to true.

> @@ -539,6 +505,7 @@ static void cf_check cmd_write(
>      if ( (cmd & PCI_COMMAND_MEMORY) && vpci_make_msix_hole(pdev) )
>          return;
>  #endif
> +
>      /*
>       * FIXME: for domUs we don't want the guest toggling the memory decoding
>       * bit.  It should be set in vpci_init_header() and guest attempts to

This change was probably meant to go into an earlier patch?

Jan

