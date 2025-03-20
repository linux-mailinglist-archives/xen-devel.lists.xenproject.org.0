Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A86A6A069
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 08:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921319.1325178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAIW-0006nS-NR; Thu, 20 Mar 2025 07:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921319.1325178; Thu, 20 Mar 2025 07:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAIW-0006km-KS; Thu, 20 Mar 2025 07:26:36 +0000
Received: by outflank-mailman (input) for mailman id 921319;
 Thu, 20 Mar 2025 07:26:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvAIV-0006kg-H4
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 07:26:35 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6b7b58c-055c-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 08:26:34 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so320424f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 00:26:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb3189absm23356247f8f.71.2025.03.20.00.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 00:26:33 -0700 (PDT)
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
X-Inumbo-ID: a6b7b58c-055c-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742455593; x=1743060393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rFyncwLsU/PXyOXNTd29HTHI4vPOpumEb9z0xL5Olhk=;
        b=E1tO+m73BRjoUI811z8zbsjH5Yit+5ERY1cEfbDGfK1EkJvx+LEOEzF7F4KuVAd4aG
         x9Y42SPMTzmtAEWSmEIPxrl3oEhGU2UbGQMcm56pCREuuxnnxTKlGo8FE/Ly/tfHW0QA
         d+eGi4qh0VyRD4nElSiaUe7lpujgVueqyDzXfcxzzuNLs0JBeUMHjGC84DnROgtOlr2a
         nr+6uSgbG9VGcEoQQRI8lAPfmP7RORezTK1w+2TQDurohk2RyTVsO4oeanbD/rp4yfeK
         zlvF4g8RC5nrbywhNHd4YwabYkjMrzvUBjikRkB82lsGZUho9XocG7VCHCixu5vcMRtV
         e+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742455593; x=1743060393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFyncwLsU/PXyOXNTd29HTHI4vPOpumEb9z0xL5Olhk=;
        b=rInwtG/q3H3Ht8iepuXPjZ7FREHTIL+VOVqQJ4Xb9W6YzkfGwANc+9tVFUXYQkPiNh
         Wf9uRZwTtTS8VrIHx5Jg7SbV8/6wrQxnia9tUDiwp1QRAkx4WZXnl/lLWtHdqS2bh7R7
         kaJ3Cry3DGmOHyvlraBjHDLHMj+BQNe7gwGKGp6LH133W74WOWD1jqDciO7T91trLNgJ
         QTgBttYvuYa9AuK80k3Y1ZtkS0PxkRvrLJlRMIwiFHBCf8C/03pqc4abHZtZsMmulUtz
         hBvqQ4nlGwuNsC0EUX6Nz1ewJkNisUQ4DsdR1yoaz2t6x+FpqtFeuscS0gMhW1FWXZDL
         J3qg==
X-Forwarded-Encrypted: i=1; AJvYcCWBY0PpfvIQZC2IN5drMRmAxwE4+Kz3hnaiDQwo+reL1FLHtvHZN88n7g5pPsgj5ghriHuosjDXP7g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWjZjix61pgTV2JIpBUu8D6Bpwaz7V0Osbp3xzCjy0TQ0zwPTd
	dfBzt12ZBYOPjgKcHqXxwASY6TzD2Pny4AzWqXD/IxkZxUtx26fZ1fF4KYvifA==
X-Gm-Gg: ASbGncvptE9J8G/nsUAjk2MqQbHaS66jydWjdlIfPFfpkjzVGGw8CqhHaIeyvRe8B+V
	0Jdc/HpIYvml5W/hmZJfogXC4qyeq8H/aMIo/Z8Oa1jC28MrQSWuIUbFrkSvX0sv5rg5ayKVdIp
	YwLU6stjC6TV3ck2eDcDHqZQtS0DhvfjoYuZTVUvZipAGrM6tGpEfVJozSLacrEuoI3T5oZ1bUi
	8NduJ9c4hYhLkyktZjuLVnmPbyi4APyAeiW5SeQkcrYCNjrOrlFvna59WE9PygYfPAQZh/3eF04
	QaQl6AA+GFVDeSUf2uzt2ZN4n1rYZ2wBmVxbmpGIlzwi/VEsXYzVlsGOtNjCFho3gLh2yQwEmGv
	tkPkDLuYgvI2+JssPVyqQjyIHoRGQO8/y9k4A72EL
X-Google-Smtp-Source: AGHT+IHmZQ+y0CF9gBu0yd+Vu3WP89gjW0iRwRmVB6wnBdwoJSWTpi3f1NG3fAAiQgMroduck/0O5g==
X-Received: by 2002:a05:6000:2a7:b0:390:e535:8758 with SMTP id ffacd0b85a97d-399795a4f96mr1789250f8f.9.1742455593536;
        Thu, 20 Mar 2025 00:26:33 -0700 (PDT)
Message-ID: <8297406e-b281-4783-9238-d6326db3fa15@suse.com>
Date: Thu, 20 Mar 2025 08:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: simplify bitmap_to_xenctl_bitmap for little endian
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, michal.orzel@amd.com, julien@xen.org,
 roger.pau@citrix.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2503182002160.2000798@ubuntu-linux-20-04-desktop>
 <ad1bd470-1efa-4019-89ac-386bb05dd44d@suse.com>
 <alpine.DEB.2.22.394.2503191754480.2325679@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503191754480.2325679@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2025 01:57, Stefano Stabellini wrote:
> On Wed, 19 Mar 2025, Jan Beulich wrote:
>> What about xenctl_bitmap_to_bitmap()?
>  
> Let me see first if I managed to handle bitmap_to_xenctl_bitmap well.

Well, the code looks correct to me, but the description now has gone
stale. I also wonder whether with that extra restriction the optimization
is then actually worth it. Just one further nit:

> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -384,21 +384,33 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
>      uint8_t zero = 0;
>      int err = 0;
>      unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
> -    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
> -
> -    if ( !bytemap )
> -        return -ENOMEM;
> +    bool alloc = (bitmap[nbits/8] & ((1U << (nbits % 8)) - 1)) ||

Blanks missing around / here.

Jan

