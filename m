Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB2A17004
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 17:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875000.1285331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZuVS-00084G-II; Mon, 20 Jan 2025 16:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875000.1285331; Mon, 20 Jan 2025 16:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZuVS-00082P-En; Mon, 20 Jan 2025 16:20:06 +0000
Received: by outflank-mailman (input) for mailman id 875000;
 Mon, 20 Jan 2025 16:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tZuVQ-0007UB-Oh
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 16:20:04 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65b636df-d74a-11ef-99a4-01e77a169b0f;
 Mon, 20 Jan 2025 17:20:00 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38a8b35e168so3230353f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 08:20:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3275995sm10976994f8f.74.2025.01.20.08.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 08:19:59 -0800 (PST)
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
X-Inumbo-ID: 65b636df-d74a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737390000; x=1737994800; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MVeHsKo51et0p2xO0kVBUEFVFau8Z9G3ZPS/uI+xbf4=;
        b=LKkB7Z4iTnfOAWl+Zof+YRnqD7cHHP2R3LRhpMW9P5jUySMMTIohqMsPk+0DuXVSWI
         xBk7fWH/AMXX3ea/10y1vzaEfuUIUUj+QRS8blj0LSLzTNU18o62EYSDIxb6bd5WzlAA
         9E0OmJJtg7cAHVKrw5XK12Tbc53FInpqah9CAlP7d0/oqaRyKCQY25Ut1Xf/dnfeWbuc
         FCKkSzq0SXquAe3fE3reP6+f45O+DQLahes5NrDp0Ts1wJ83nMWln8uyEio60SEZsfDF
         ZTV5fuB0aTFfJ0gfZSL9RKxaqNmqMWh88lKnhAAnBtjX6wt1RzZZ/kvbmIH8a7pISKd3
         FV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737390000; x=1737994800;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVeHsKo51et0p2xO0kVBUEFVFau8Z9G3ZPS/uI+xbf4=;
        b=mL0M3QlXM1/H0YSJWgP0Xx/bbUrPyG54HbNMoF7RNW4D3u3RFP2S8OaC/r3iPmcf8w
         Uqr2vb7RV1NgdYKrRU5lI78px0Yxg7zGtOw40ZGTjP/1x5jRJBsmy1SfgsToBaBgg6hc
         c3JM1ntD7LvWTdv0I4H6UK07GI2ekjSX0vxcDuDfip6qHHEV7EYYigVMojb1dsGyjVzR
         vWKyWGgbgHDbu+YTW71QtgB+TOTMhlEvQhdfVUswunhcZQ9UEboxscK2ixY7r+w4Fve4
         DsfYYS6+M4zBjIHA6vTOsLhxPpyROAs28Wp/XvI/Y9S1Cw0VSUId/TKvuMuGiXCiaPXg
         C2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVTVq8bD8vJLagfpvsTQpTU/+nF06g6GASKA+7yJ+0cXx5lPyzn2orIhNGEPmY8VwxfET0ml8I9RNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHpGLtcLtZHUiqoREMT57ocXLL0muH4mpycNkRcMtDeZGk9iuh
	zI2f4x+e4+gllrEOl/WcLvrEPt+Df7ns26etF/xi7NTVyqB/o3+yrOs4urxHIg==
X-Gm-Gg: ASbGncseGjsbQhAlFHIsVmdPb3RL/0+FOIJyE7+jonoJ1NfTsnuBY5feB/lkrJl8DNm
	hpFq644QXj+12q8gSw7mDQ51LzxkzziBGfTvrxJZedUMBWE131B/XfQnUkIyr3MsQB4ZWmCLqGh
	8FxwflxZQeu2ukOYcTtIbDYrMJauZPevXs1ru634LjIkY7VRxVvWN3opA1JEEyeGRyXZMbt8m0s
	59NI1cljivRAZiLowh4FOowWSjKTtzvkhAqRKis3NtH8KONIo+u5HhgYdp9aTD5AmEZJ6YHRWRr
	pmhYwmPOp5mOo4ogflnX9HHe2GMR/2PpWJZpQ/+wMvkIIBtgl2Er/9s=
X-Google-Smtp-Source: AGHT+IEf8xex0q9+g2tukb4jwd6unXLdA5S1EzhyQHd0ONN6mmPWvORDv5h6d7nR+kWPrbBElCjGtw==
X-Received: by 2002:a5d:6da1:0:b0:38b:ee01:a5b with SMTP id ffacd0b85a97d-38bf5ae2a66mr10886574f8f.15.1737390000044;
        Mon, 20 Jan 2025 08:20:00 -0800 (PST)
Message-ID: <52aa648a-0442-4d99-a423-32cb1de72d1c@suse.com>
Date: Mon, 20 Jan 2025 17:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 10/10] x86/hvm: Enable XSAVES LBR save/restore
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
 <20250102084413.102-11-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20250102084413.102-11-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 09:45, Tu Dinh wrote:
> Add a new save code type CPU_XSAVES_CODE containing a compressed XSAVES
> image.
> 
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>

I'm afraid this way too little of a description here. First unanswered
question would be why it is that we need a new save code in the first
place. Second question then would be what the interaction is when both
old and new save records are present. After all aiui ...

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1238,6 +1238,36 @@ static int cf_check hvm_save_cpu_xsave_states(
>      return 0;
>  }
>  
> +#define HVM_CPU_XSAVES_SIZE(xcr0) (offsetof(struct hvm_hw_cpu_xsave, \
> +                                            save_area) + \
> +                                   xstate_compressed_size(xcr0))
> +
> +static int cf_check hvm_save_cpu_xsaves_states(
> +    struct vcpu *v, hvm_domain_context_t *h)
> +{
> +    struct hvm_hw_cpu_xsave *ctxt;
> +    unsigned int size;
> +    int err;
> +
> +    if ( !xsave_enabled(v) )
> +        return 0;   /* do nothing */
> +
> +    size = HVM_CPU_XSAVES_SIZE(v->arch.xcr0_accum);
> +    err = _hvm_init_entry(h, CPU_XSAVES_CODE, v->vcpu_id, size);
> +    if ( err )
> +        return err;
> +
> +    ctxt = (struct hvm_hw_cpu_xsave *)&h->data[h->cur];
> +    h->cur += size;
> +    ctxt->xfeature_mask = xfeature_mask;
> +    ctxt->xcr0 = v->arch.xcr0;
> +    ctxt->xcr0_accum = v->arch.xcr0_accum;
> +
> +    memcpy(&ctxt->save_area, v->arch.xsave_area, size);
> +
> +    return 0;
> +}

... you save all states under this new code, not just the XSS-controlled
ones. Plus you're going through all of this even if there are no XSS-
controlled components, i.e. in particular also when there's no XSAVES
support in hardware. This way you then end up saving twice the exact
same data, just differently arranged.

> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -946,8 +946,7 @@ int validate_xstate(const struct domain *d, uint64_t xcr0, uint64_t xcr0_accum,
>           !valid_xcr0(xcr0_accum) )
>          return -EINVAL;
>  
> -    if ( (xcr0_accum & ~xfeature_mask) ||
> -         hdr->xcomp_bv )
> +    if ( xcr0_accum & ~xfeature_mask )
>          return -EOPNOTSUPP;
>  
>      for ( i = 0; i < ARRAY_SIZE(hdr->reserved); ++i )

Can you really merely delete the check? Don't you need to validate
non-zero ->xcomp_bv then instead?

Jan

