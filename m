Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318799B7CB4
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 15:21:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828738.1243741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6W2y-00057G-O7; Thu, 31 Oct 2024 14:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828738.1243741; Thu, 31 Oct 2024 14:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6W2y-00055J-Kf; Thu, 31 Oct 2024 14:21:12 +0000
Received: by outflank-mailman (input) for mailman id 828738;
 Thu, 31 Oct 2024 14:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6W2x-00055D-PD
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 14:21:11 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5efffbab-9793-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 15:21:08 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-431616c23b5so6278635e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 07:21:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e848csm58235845e9.3.2024.10.31.07.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 07:21:07 -0700 (PDT)
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
X-Inumbo-ID: 5efffbab-9793-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVlZmZmYmFiLTk3OTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzg0NDY4LjM1Njk3OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730384468; x=1730989268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ttPQVvr5GfpYlgGI1A2RmqfbqxMRHl7OX20gcgA8NdI=;
        b=Hl4lxCWh1EiMzNZVrFo1QaOc1UFDCs32ffytcl6p6IVYlGCSZ87QgVVBdojKoJyMeL
         Tz3K86gCyMGL6aZG0vftGQ6eHS5OPpsyddJ1kZPtn5KVITb3LGF1e9UvxKT7o6tLs9mr
         ceXhWfgO0Li1ofSekMERJuPX2b97JXgSs0nZxayyy/nuUDLC/pwV7chKPA5mBCrFF+8N
         rNf3RomOUOVIzMjOx9UKtHNVFMNoH0Xe+o3Vj7Y2+BXYqe6mKW6MQfpsV8geLEAlMtbe
         fnQ6Q97yy3zy2y9edyvkEeZcMFJQ2wUzBFQTDo6GGkdMZVq4LUkoGgJlMY15QZFiIVl+
         XVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730384468; x=1730989268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttPQVvr5GfpYlgGI1A2RmqfbqxMRHl7OX20gcgA8NdI=;
        b=HBRDC/6y6RthUU4ELrPVAk8Q15VeBuFztrNxIoYH2LCYFDP7s1alc8mwSz/xLvGaX6
         1XEt9HQV/cbh6orknUxW4VDO6kVNlc9reotB0buiEDjagCGkcJMtDsiybDC3KTF0/Pea
         3I4tn2jhMSFVChFAZyrBI3E0bzcPPmNJOaz4szBfn+Buaj5yfP//TVJ8oFJ3ELvh6MCu
         3B2cypLsFHDtBn6/Ce7dceJsJSNvprDcd7n+z4QeVdFgRO9Rcdh9A7bDdIk34YWBAZHx
         qGR22MQmC/wKuasCFbdnbnRFt8uAXRtvajdDEa097X7Zei1nDy21EiYAMjF+B2iq8wib
         XwnA==
X-Forwarded-Encrypted: i=1; AJvYcCWxFrvzgn5A3VlYsLKI3+J/lQr2/M9EKfK/UmATplzkKTJboE9iJR9wq2PWtIXPqdRhQ4smGCGqTWM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywzjhGAwjh4BrwEZRsX8l8GCLFtA4ISwDeafU8/38KbAqkl7SK
	4UWeNct67BFgf01W3Dq0jtmzzES8xKwdYQh1JFGRk0A1QhwlNWavsn3vKhjs2g==
X-Google-Smtp-Source: AGHT+IGLi/I4hZuVp+hTtmQDK4XGjnWTsmD0Q//CE6nVFxlDeU3TCwz7VIZAmm9H8XPPkKIL6ao9Yw==
X-Received: by 2002:a05:600c:4301:b0:431:4e25:fe31 with SMTP id 5b1f17b1804b1-4328308555cmr1676005e9.12.1730384467753;
        Thu, 31 Oct 2024 07:21:07 -0700 (PDT)
Message-ID: <9d556053-1d97-429b-8153-c9f53b31b13c@suse.com>
Date: Thu, 31 Oct 2024 15:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: Use constants for x86 modes
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
References: <0ffcb0031eaa095b5864735d2f9edbe1d374e009.1730380434.git.teddy.astie@vates.tech>
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
In-Reply-To: <0ffcb0031eaa095b5864735d2f9edbe1d374e009.1730380434.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2024 14:27, Teddy Astie wrote:
> In many places of x86 HVM code, constants integer are used to indicate in what mode is
> running the CPU (real, v86, 16-bits, 32-bits, 64-bits). However, these constants are
> are written directly as integer which hides the actual meaning of these modes.
> 
> This patch introduces X86_MODE_* macros and replace those occurences with it.
> 
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>
> ---
> I am not sure of other places that uses these integer constants.

At the very least svm_guest_x86_mode() also wants changing.

> @@ -2952,11 +2952,11 @@ static const char *guest_x86_mode_to_str(int mode)
>  {
>      switch ( mode )
>      {
> -    case 0:  return "Real";
> -    case 1:  return "v86";
> -    case 2:  return "16bit";
> -    case 4:  return "32bit";
> -    case 8:  return "64bit";
> +    case X86_MODE_REAL:  return "Real";
> +    case X86_MODE_V86:  return "v86";
> +    case X86_MODE_16BIT:  return "16bit";
> +    case X86_MODE_32BIT:  return "32bit";
> +    case X86_MODE_64BIT:  return "64bit";

Please don't break columnar alignment here. As hinted at in the other reply
already, personally I'd prefer VM86 anyway.

Jan

