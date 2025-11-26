Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5BC89D8D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 13:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172596.1497686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOEss-0000md-N1; Wed, 26 Nov 2025 12:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172596.1497686; Wed, 26 Nov 2025 12:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOEss-0000jW-K8; Wed, 26 Nov 2025 12:44:34 +0000
Received: by outflank-mailman (input) for mailman id 1172596;
 Wed, 26 Nov 2025 12:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOEsq-0000jA-Hb
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 12:44:32 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a58b0136-cac5-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 13:44:28 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b32a3e78bso5497734f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 04:44:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adc6f7bsm45277215e9.2.2025.11.26.04.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 04:44:27 -0800 (PST)
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
X-Inumbo-ID: a58b0136-cac5-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764161068; x=1764765868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gR2Vc5UJrZRQM5ZjO/yIvlEsB7HkIIm0h3aI+0d9D/Y=;
        b=CXiyAuALffRnkjJSZWkKwaYUhYAZyoTayzbzvQA/6lwIVTT1hkIaB0tJt2jXWv3z1H
         hS3DWUJQwsA4DzQ6pQN4yKcYWAOjmltF5I+YrkT5iqgywbqmCpJJaHSzM2miSPf+Uifa
         HMODb2TUA6Hfy3a+P7/N/4xbOAllA8TJe+w98Emz2fKl/Db31LTNhuKloavTbBH5DhMU
         3BnuMb9vQ5kOsK6DV01SbalqUulE0oLOE9mrGWRCENr1+x4jfpmhMV0ivkV7PsJ+C6bG
         PKhpe7N2tpltWBkk6Ropq2Wd14YKvros3eACISe28ZMhzgZ14+8RarroiqlRTXORqo/Z
         a5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764161068; x=1764765868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gR2Vc5UJrZRQM5ZjO/yIvlEsB7HkIIm0h3aI+0d9D/Y=;
        b=CBFhXFRCIrgcboTjnpEZXeZcmpvMpFQRZVeol7td6sbAlQuUEj3qd5gPWIkWyy3NRN
         v2yd6O+eWq6mT2InpgqcmBTLXHRiD1hZfBBZqHGh2jTd0w63VkERO1MqfotaQZNqnPg2
         zYLtUG4C5gxrElB9MgYeduXQv1fyZFNJH3nrCQcGNx/XcCijB/ZoMJyIyuh9tSU8+Agk
         TUHt3lcQZlyFGy2qYkHcFYT1H0TDORB1Vw1ICb6RW3yDDpiSMWWC3MWmGRXGuoPqIm3x
         nnJCTCpaeACNBSAKNREHdVVIH0VYJySzQRVPx+Coc34tw92XQFk1hquc8Xqi3u4ePskR
         r27w==
X-Forwarded-Encrypted: i=1; AJvYcCVmjx1dyuaWLBSMUCDe44TgNZWv2nF4mTD6mx7k4ELMdyQ5qx3rrEC511gT4bXmjypYrOj5D7h0a+E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZPlOuQX+5d8dLYME3rXPt12RtW9iGI0+AvD4n+AfHO0t0UCjB
	mn1SNpl4gnziJjCK9pteaX517K+Ku/cNLE7rlHrNk652AkOrzYWf4WL83eYX35MPnQ==
X-Gm-Gg: ASbGncuGDFyFBhW3DLNALSCEXQSKomRl4lthGqMM4cmy3RiHtJ51HUWS+cDoj6dSDws
	Vt7ueeRrP8kJpYBozeyNuy9eglgMPxBU37PY1zvLOKFRhYue1lftaZHrHK7dzd7BZ3Eo7sFGl8I
	koNxyutBYVlhkkrmQ1Hc/Pzv4aZwfWoQYikjy58/gYdTLeA/m1lb00r8aNP4delngj+OXJ4GkjA
	YGLRU2P8F0B3/S/vIF7qxAsZl1ZsloYfz5uWx+3b6LArcmpcu6Jma1+031uw6P473lfPU1R4Kas
	X7OMq2b/BaT9jVyY45CNmr8OWpRCKOq+y/FnVLhPC53a4JRcLy5eDG0EfGUOzkFt5CQnkTfXKmj
	Hy9dTEO+7fiDsoBkfGbfk4MaFXIFfF8KPqn8OFPDA1/Zu5mzDStFegGg8p/Vg8/6hrDeHYH92yR
	TewtTSlJfFbpX03EqA6Nir7fnDGE/+6ZTzQs9QVmBtbDOns3jLdMxRirJkkShbvEIJz9fbgmmVc
	vA=
X-Google-Smtp-Source: AGHT+IFb1ll+z4xOk+3hDZLJZj0IyYfHVCOX/X+KrsJBeC9HC5L5zIm6kOB5GVkjzN4KFYzRRUetYg==
X-Received: by 2002:a05:600c:5494:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-477c0184c3amr191272205e9.10.1764161067836;
        Wed, 26 Nov 2025 04:44:27 -0800 (PST)
Message-ID: <4f3c5cf3-cdba-4162-a9b1-4afe683c864f@suse.com>
Date: Wed, 26 Nov 2025 13:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/viridian: fix calling of
 viridian_time_domain_{freeze,thaw}()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126112942.49031-1-roger.pau@citrix.com>
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
In-Reply-To: <20251126112942.49031-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 12:29, Roger Pau Monne wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1547,8 +1547,7 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
>  static void _domain_pause(struct domain *d, bool sync)
>  {
>      struct vcpu *v;
> -
> -    atomic_inc(&d->pause_count);
> +    bool was_paused = atomic_inc_return(&d->pause_count) - 1;
>  
>      if ( sync )
>          for_each_vcpu ( d, v )

Isn't this racy? Another CPU doing the INC above just afterwards (yielding
was_paused as false there) might still ...

> @@ -1557,7 +1556,8 @@ static void _domain_pause(struct domain *d, bool sync)
>          for_each_vcpu ( d, v )
>              vcpu_sleep_nosync(v);
>  
> -    arch_domain_pause(d);
> +    if ( !was_paused )
> +        arch_domain_pause(d);

... make it here faster, and then the call would occur to late. Whether that's
acceptable is a matter of what exactly the arch hook does.

Furthermore, is what the arch hook does for x86 actually correct when "sync"
is false? The vCPU-s might then still be running while the Viridian time is
already frozen.

Jan

