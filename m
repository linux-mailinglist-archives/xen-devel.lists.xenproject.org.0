Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0103AB58DF
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 17:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983049.1369407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uErix-0002ld-0X; Tue, 13 May 2025 15:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983049.1369407; Tue, 13 May 2025 15:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEriw-0002j4-Tt; Tue, 13 May 2025 15:39:18 +0000
Received: by outflank-mailman (input) for mailman id 983049;
 Tue, 13 May 2025 15:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEriw-0002iY-0i
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 15:39:18 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d7d7081-3010-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 17:39:16 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad1f6aa2f84so1211658266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 08:39:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fe8772f75bsm2995443a12.74.2025.05.13.08.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 08:39:04 -0700 (PDT)
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
X-Inumbo-ID: 6d7d7081-3010-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747150756; x=1747755556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kzrbVqjmBV9ls/UyKHlCvrKeI1WB3fiHrZ04Xlb8BJ8=;
        b=KDlHZgx3YquK0xvdsaM4mvz6Olp8CGEMpsqJThI1uiiWMFhIPf0zFX37HNA3g9c3vO
         cwy6j6dEQnKmiLJAEtjYvjAw44s+TNYAg3v4Yz4tXMEL7Dhc8E8q6/BA3J6p+3/EVrmu
         ycVnfb/3uxuj4HSclVJPHaw6+TWOuHB/Y/e/c8hlk/cMqqJ3SEPMg+5BD+ZOBJ6K+kVg
         4RLT13ErZOKsouY6ZGsYAYT01XMEygHcg6tfHO0EaI2XAjGozG+lULCR26nAUK8HlFkI
         Pv9VGHweZ7EKY05H2jGx7KfCxGE/2b/uoRO01ZSw+iidUjg2/+t9YLJG1pYYpktmSef3
         ybfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747150756; x=1747755556;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzrbVqjmBV9ls/UyKHlCvrKeI1WB3fiHrZ04Xlb8BJ8=;
        b=Z5CuthnRt55RvInYLywZN6c4YbawvYv5xQN1M+vQHBj0LtCFSqfyp3AX5IG3NX+GS1
         TNhlI3btyj0xqhVF4Et2n/vj1bC0nsa1A2Ny0E+i972rEA5xpmPZz+aqrrx+YgWyhvl+
         aYqeZF7MHUsrS82o9f7pQ1Ez8HUWGlamJ+XULcHAdxYmqSdDBwxybPPw4SPx4VuoMDg0
         4QNKwNUmX+tocrT0UwuI6dvheI5iHb3qeS5WxqSVbEYize2nwvZ5ly9A73M289TaL2DH
         pub9auy+mm78QoIxh67Wgdn7ZPgQccjqXkE1TslSCyfP40X8FP9MC3SEY+TFt2NLs1Bi
         nZ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUbdh1vmE2IvOvhyJXfy7p6WcxLw0CkwTQZW8NVL45s355ZXFaYIK4Akd7D1aaqlNEGo2WMyux1iLQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJREnm0h5bHIM4VzcMHoVQUDbYBg2vbp2OdYT+M+G3NdadA4OW
	mDckvpCj6rPNJONYMnQpA9f6agUEz5vs4odUSShHNTrMhno7VO7vH/alhkiQKWHconbNfuYdMr4
	=
X-Gm-Gg: ASbGncujnOZGcKRKQNHC+mobXfSXKW6O3JK2/HmoIn/EOlMfoEuK2abLyIUwEYXgyzK
	Ccd1wYtY2xTmoK0qXh7IuwBa0/+hRhZsDgibsY26wcAf+o2NPXpzOKwpuXdluO/wX86co/2gBgT
	+4twT4RVbDC3MVybHg2y41xQ+ZEjBPmiv/43GCS6ULDwPRYT3oReIzC52bJNyoGYA7A4lfqIYcl
	R9LljdPQq/ijgnWYhJqh79Mu3s2NPNWNdXcID8Q5fThKIv1/T6R2ttFm1nXVw4IR08Mv99D5bu6
	Dgiq6q7IZhXDEtgmbgo6l4JCJhyAk8lEFb0efXU5JA0smBe6pYaTUvXny+bAaIm0PemHgxDNXb3
	S1fqXYRBjyQ5qj6scHWm+BCFyEua0HhF1LJCD
X-Google-Smtp-Source: AGHT+IGmVG1mPSrbv/cCefUCrRXB9RkY23N3EG7LDkdtJYph9TlG2DPTFx5h0J+Fa4OX16INxOlJlA==
X-Received: by 2002:a05:6402:34c5:b0:5fc:ae51:ba0 with SMTP id 4fb4d7f45d1cf-5feebe2d581mr3563195a12.14.1747150745124;
        Tue, 13 May 2025 08:39:05 -0700 (PDT)
Message-ID: <46dfb68b-7e94-40a8-9900-883ac899346e@suse.com>
Date: Tue, 13 May 2025 17:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] rangeset: introduce rangeset_subtract
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
 <20250508132040.532898-5-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250508132040.532898-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.05.2025 15:20, Stewart Hildebrand wrote:
> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -397,6 +397,18 @@ int rangeset_merge(struct rangeset *r1, struct rangeset *r2)
>      return rangeset_report_ranges(r2, 0, ~0UL, merge, r1);
>  }
>  
> +static int cf_check subtract(unsigned long s, unsigned long e, void *data)
> +{
> +    struct rangeset *r = data;
> +
> +    return rangeset_remove_range(r, s, e);
> +}
> +
> +int rangeset_subtract(struct rangeset *r1, struct rangeset *r2)
> +{
> +    return rangeset_report_ranges(r2, 0, ~0UL, subtract, r1);
> +}

I understand this was committed already, but I don't understand why: This
introduces a Misra rule 2.1 violation aiui. The rule isn't tagged as clean
yet, but it was accepted and hence I thought we would strive towards not
introducing new violations. What's the deal?

Jan

