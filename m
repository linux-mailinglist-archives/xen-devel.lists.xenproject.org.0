Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1393A9A259
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 08:35:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965850.1356256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7qAd-0007Cs-4x; Thu, 24 Apr 2025 06:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965850.1356256; Thu, 24 Apr 2025 06:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7qAd-00079j-1h; Thu, 24 Apr 2025 06:34:51 +0000
Received: by outflank-mailman (input) for mailman id 965850;
 Thu, 24 Apr 2025 06:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7qAb-00079Z-05
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 06:34:49 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3690d598-20d6-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 08:34:46 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so647906f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 23:34:46 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b408:9d23:e5d:de25:e110?
 (p200300cab734b4089d230e5dde25e110.dip0.t-ipconnect.de.
 [2003:ca:b734:b408:9d23:e5d:de25:e110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d532a9dsm995408f8f.61.2025.04.23.23.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 23:34:44 -0700 (PDT)
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
X-Inumbo-ID: 3690d598-20d6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745476485; x=1746081285; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zL+sciCXJIK0yGTIFxCeU0K61FCHzj7AzTTjNz1xr98=;
        b=MhucUiW1TkRtcJoFAmcz5S6ZIlbz4NmC48nkTD1lIRtD9bpEZwWLrf+iqMLhnbu7X2
         v9cx+rnq0XaXycO2xVjt15yoRJNdnyX7rTPi+VFXWLPM652GICjFp6iepDfKhQUa4TGR
         fdcBAhdFIdUeoESIdcRq/OIqkkU5ns8X4DkYojx1rfkw6dTa/s7sqr5AmSV3RHhzkZmk
         GET3bu9r7HYyoRRwCzIl2G6SAeI225ZJq5IGtqNJD2Yspmw2e6ZxiRUYmhAYfsABOISr
         oomOyae1fPQI/WPxzykNva7C0F4FszZeVDMR7YcLDy1+I68qbJlzoqVo5N0x77ENSEQg
         TbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745476485; x=1746081285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL+sciCXJIK0yGTIFxCeU0K61FCHzj7AzTTjNz1xr98=;
        b=UKTLBaJOVKHDtXvI8ZHO/UXZ7y1DCVlx+9R1EKfEAsvBNrWPMIVSIrAW1Gt50cp2c2
         mXFmftle+6ahmjJxhBI08HZk1kaweeWpS+4e3VTH6UDvgbj8YQ1L878uUwgnvXl8pqUa
         KuT4sLcLLYQy1TwTeUrRkvBuOrI6S8ZcLnf6sgFD/Lcg6P7LOBC7f8Y1oIUr4eyQ7mGW
         McIOPh0l6pgRb+aZWdX76+oT5gPfUltDfbZF9hk0P/gS/r834GCHsgOw9TRJf+Xi2hHz
         MKrSW/ouB96WqM9yYLfr1eIKye8ipGUjd+WN9yySqQIInGJmGn3QzaHtI9y1PYB0WF/f
         e2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXJk9AaF0IJRdEndafUY0lSCrpK2XgTqJmM+6sDSnG69HYWG+ofpIYoT6yz0uVHtFAERSXvdTozTw8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUDV+2IlbeVB9E4d4v4B9l3r+Tpqi9zJYY4vogK26Eg9OmbMJx
	QY9BTmepAMBiRIVwzcuFh8MdojmRGvffwi4Pkr/O8Z67aYclaNFZi36rykWbYg==
X-Gm-Gg: ASbGncu9EQFeC+o2AW0ftyaBgva+rlnTliGC98QlKiKcgK83ZVoVqU4GVXhnGjTvs+s
	cWuON8TqxEboE0VQmu8ifGGlI4xEubPTPuiewAIPOmYndUgMo0yLw9LYE25Wskel1BzE6fJGW3r
	44/TrwOE14lpWGPob144uVF8iuDiF57Fc8LQJX0EweNjyz/0c0l7djLQbgmuNfaU2lxQnAtgRKI
	V+GPmr2GovJ5GHs9B+hoFQMEZNe7sAW6LlNxjvGYhWxBLFRim0SxbndP/lfO1Tevpumw1SCtx4Q
	Id2rBqxND0EfC7XcgwM6gZspGi2KCLm3sxW2gTF5Cnhx5fUUX8ZqFtLk5xvypJ8WKURvIb4TWbG
	4awu+aSjjSG78M/ZgXpIqdDHcf2C/K+XB2+3RIBwypjTVMRtLgLF+K16Cf2zhDs5lpA7ruRg4
X-Google-Smtp-Source: AGHT+IH9E1o9LJ+cwSu+3F7DUFRfhr2+CxwRYdb8fS8cZImhSvBJsJrpIokuBBQvNbHY6XwgWrf5Bg==
X-Received: by 2002:a05:6000:18a8:b0:391:241d:a13e with SMTP id ffacd0b85a97d-3a06cfab52fmr727926f8f.48.1745476485300;
        Wed, 23 Apr 2025 23:34:45 -0700 (PDT)
Message-ID: <40a5c44c-4ef1-4852-b441-ea65e31b2345@suse.com>
Date: Thu, 24 Apr 2025 08:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UBSan bug in real mode fpu emulation
To: Fabian Specht <f.specht@tum.de>, xen-devel@lists.xenproject.org
Cc: manuel.andreas@tum.de
References: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
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
In-Reply-To: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2025 03:08, Fabian Specht wrote:
> we discovered a bug regarding undefined behaviour in the FPU emulation
> unit.
> 
> if ( !s->rex_prefix )
> {
> 	/* Convert 32-bit real/vm86 to 32-bit prot format. */
> 	unsigned int fip = fpstate.env.mode.real.fip_lo +
> 					   (fpstate.env.mode.real.fip_hi << 16);
> 	unsigned int fdp = fpstate.env.mode.real.fdp_lo +
> 					   (fpstate.env.mode.real.fdp_hi << 16);
> 	unsigned int fop = fpstate.env.mode.real.fop;
> 
> 	fpstate.env.mode.prot.fip = fip & 0xf;
> 	fpstate.env.mode.prot.fcs = fip >> 4;
> 	fpstate.env.mode.prot.fop = fop;
> 	fpstate.env.mode.prot.fdp = fdp & 0xf;
> 	fpstate.env.mode.prot.fds = fdp >> 4;
> }
> 
> It occurs at arch/x86/arch/x86/x86_emulate/blk.c:85 of the v4.20.0
> release during the bit shift and can be triggered using the attached xtf
> test. We are not aware of any security consequences.
> Simply shifting by 4 should do the trick in my opinion.

Since ...

> Similar code resides in the same file in lines 87, 125 and 127.

... all of these are shifts by 16, could you clarify what it is that you
want to shift by 4? Imo what we need to do here is add casts to unsigned
int, for the results thereof to be shifted (or use some extra arithmetic
to achieve the same effect, e.g. add in 0U). Or we could go and replace
the shifts by 16 with shifts by 12 (accounting for the later right shift
by 4, which would then need dropping).

Jan

