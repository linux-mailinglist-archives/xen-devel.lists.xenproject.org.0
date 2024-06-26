Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8976917D2E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 12:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748689.1156489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPVR-0002fx-DK; Wed, 26 Jun 2024 10:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748689.1156489; Wed, 26 Jun 2024 10:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPVR-0002eT-9k; Wed, 26 Jun 2024 10:04:01 +0000
Received: by outflank-mailman (input) for mailman id 748689;
 Wed, 26 Jun 2024 10:03:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMPVP-0002eN-Cs
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 10:03:59 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66c76302-33a3-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 12:03:57 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so101917571fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 03:03:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3d5a87sm95929905ad.203.2024.06.26.03.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 03:03:55 -0700 (PDT)
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
X-Inumbo-ID: 66c76302-33a3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719396236; x=1720001036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ETfSu0w1XQtkfIerrXgTr9QH2vryxpdAr+oK48A+6mg=;
        b=ZWwdP4P/BFh10XfwiPQA1Spy5UVM1u7ju/JpPwcrGXt3jIPkdV24la0Wq8+8b/xgLr
         xkNVTI7PGwk2vu5jBoZfqx85XaT6UB/JelNGEsXjkBMVb+I/VMVfZLVB6525Nt7b49PU
         WyCOkyKDOzWscMEo/rvgLqHWieo3JfYrScYuzHErYOMEu9CgnDjjguQzOOKBLWDBXsj7
         XP2oFoTfWgic6tv4/Wdfre3NPTVgXEJyhZUs1MJymOCrSSoJs4ehmzo8XRFhmHZuf9KC
         x/5tTHkolJJJEHYfX7XvnH+1iyBOxUNnjw0sE+XK2L6aM4TEUw8q0nqLFXToEoHlC7h7
         du5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396236; x=1720001036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETfSu0w1XQtkfIerrXgTr9QH2vryxpdAr+oK48A+6mg=;
        b=VZGbdH4VxsTFcHKTt2fFWaMN5PXa1HxBt7wj6aXDZ8A+ST8JK7JDh9IZZ0LQ4QyL/+
         rwXgSjVoRcavUdmuWWRt5N4I64AgQ+JmTCVGI7QQhIUXbrcLCR30NDO2ltiepznk1w2O
         OI3IBIeprvk0wzMab+7byLtJVPWf2BlXjxNMEdz76Os2XMDe93MVrMRF26p+khnw8BMx
         poRUPnMSB+UmJ1nR8bSvqe7s0Qve3CRvZSuz3Qtv2Bor8L+Rw9llBI7sjr3Gx79bxLGb
         zWHz0uJ33qfSm/WiJSaYripYSWvBRAPWNl3iKH542cQZFQYFE1Mi2QnOxWPaRrXNjJI4
         MuDg==
X-Forwarded-Encrypted: i=1; AJvYcCUKdcWtbMIMukBeiqZhONtNo/esd2u1SkZcB32ioNIwOjpKy5b1yWYXnZlq+OJqYwUJ1phuClfMif87SOAU/C/X3kawoMzv3365sG9Mjm4=
X-Gm-Message-State: AOJu0YzTP2HnXY+NXcAKfqThOfXrHJ9f0X1u38Q55IBYWIypGQcb3s/G
	PkoyebMWwv7d8YBymBOsEBASs1po3XTkUDHrgMQ9Jqs2WTDQEkPMZOleghzjBA==
X-Google-Smtp-Source: AGHT+IHzdSQr7S4nzuXGVCRjbs0S+UBeSr9hgbsKBmDePsbXshzjrVXjOPwnJy32Cv2lPwKor9P8TA==
X-Received: by 2002:a05:651c:22f:b0:2ec:1708:4db5 with SMTP id 38308e7fff4ca-2ec5b339debmr61572191fa.51.1719396236206;
        Wed, 26 Jun 2024 03:03:56 -0700 (PDT)
Message-ID: <b04bd8d8-f218-4c95-8014-3fbf9d3a0c91@suse.com>
Date: Wed, 26 Jun 2024 12:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen/bitops: Rename for_each_set_bit() to
 bitmap_for_each()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240625190719.788643-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 21:07, Andrew Cooper wrote:
> The current implementation wants to take an in-memory bitmap.  However, all
> ARM callers and all-but-1 x86 callers spill a scalar to the stack in order to
> use the "generic arbitrary bitmap" helpers under the hood.
> 
> This functions, but it's far from ideal.
> 
> Rename the construct and move it into bitmap.h, because having an iterator for
> an arbitrary bitmap is a useful thing.
> 
> This will allow us to re-implement for_each_set_bit() to be more appropriate
> for scalar values.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one cosmetic request: While doing the rename, would you mind sorting
style? Not necessarily uniformly across the entire patch, but at individual
sites presently using "impossible" formatting. IOW ...

> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -111,7 +111,7 @@ static unsigned int gic_find_unused_lr(struct vcpu *v,
>      {
>          unsigned int used_lr;
>  
> -        for_each_set_bit(used_lr, lr_mask, nr_lrs)
> +        bitmap_for_each(used_lr, lr_mask, nr_lrs)

... while this one's fine (treating bitmap_for_each as ordinary identifier)
and while xstate.c is also fine (treating it as pseudo-keyword), ...

> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -429,7 +429,7 @@ void vgic_set_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank)
>      /* LPIs will never be set pending via this function */
>      ASSERT(!is_lpi(32 * rank + 31));
>  
> -    for_each_set_bit( i, &mask, 32 )
> +    bitmap_for_each( i, &mask, 32 )
>      {

... this isn't possible formatting according to our style: Either there are
no blanks immediately inside the parentheses, or there also is one ahead of
the opening one.

Thanks, Jan

