Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A742B39422
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 08:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097577.1451849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWQh-0007Ej-FY; Thu, 28 Aug 2025 06:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097577.1451849; Thu, 28 Aug 2025 06:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWQh-0007CZ-Cn; Thu, 28 Aug 2025 06:48:15 +0000
Received: by outflank-mailman (input) for mailman id 1097577;
 Thu, 28 Aug 2025 06:48:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urWQf-0007CT-RP
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 06:48:13 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6e772cf-83da-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 08:48:11 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61cb9f6dbe7so1051225a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 23:48:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cd7bde8fbsm790892a12.11.2025.08.27.23.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 23:48:10 -0700 (PDT)
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
X-Inumbo-ID: f6e772cf-83da-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756363691; x=1756968491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NqV0FpfYO3xPhMgW2ANWtQrW9AWFZJH5js/QVMuzjzE=;
        b=MQdLNGPy2y7S7FAlvtwPyFrOX+CsEjbjqiCTA+70k5Wik5+F7JLh24iDToeSjkyN0+
         WeDOWP9ZAyX3oTm50JBfzPEy21CvXvKZEMojt66fswVmoqen8/Mtw4TaRO2TEiuBi6Tn
         WtH0VMyiaysB0dBruMbbiO7+Tndm+VICxPHg/V6weaptBbG19zl7eM+Yx5DIrEmm20eN
         ECPSrGqGaSw8ZFn60Dt7bpk/QoncRr1xrbiDXUIeSGDfnKDsNiZ46+WgGuXpqTi6Si88
         FJXfu9yZvqvJHgc0crC4M4jOa2CZoWfeGoiVxJ76KWNKrUELtIOv6AP58Z9D04wATou4
         WlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756363691; x=1756968491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqV0FpfYO3xPhMgW2ANWtQrW9AWFZJH5js/QVMuzjzE=;
        b=UDKjeQ9wcsdlwA/hoKgKp47rZM5XiPhDqIo3wCrgq6kM8+NsqOd9lHX613+UEp2pXX
         SFRNQc8Nmy1+mnzDR+aS0JoTHwOo5UMdBUaYIG0DLZh5tSSXhZerFfrL1FdWjk3wbYsg
         vaBlWG19K20VKadBNxM53FyckbRXmcTvM6V0Uw3TIfEo2QgakvKwhnMxBNJq9aqdvJwd
         RaUJ2W6WJLuQjuu67QtQ25nFpJmEClSByzl6iAO1DGKLL/zddilgVpTYO1QZIsQB9TLU
         V/f1T5jLKRH54Hxm6+Nwwe+8bJRmnUMEHK/rqNGJ3j6vy991p3oIRuubzAnR+o3kKXkn
         M4sQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1MYMCBuIS1X46fZvcIHAV/XGPSxub3rL5rRH3m8PYW0bGUKMVuBeb/qq0aEaDxZzG9U1SNX9Fo9k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywrq36NrIgMECLZOLLRPSeFCT/aFKmPcbNDxEFu4GOP3WmNtW5X
	CHJeOIXNnGpnteERv6j8RoHD7hL4YjFLqDNmqS6xRugEejA6m6miJyt0PUL97+9CXQ==
X-Gm-Gg: ASbGncvRKoK+AwU8sc0q5PiiLc9y1E4FSk7i6lEgudlrN+9aSr9mrUBJ57WjNknlnch
	3mL+zsThhyMczjoBc6H5gNAvoHKfrYJ9NY7J6jFQUjKOdINRSw1b9CdPxLNM4CYrVs0Ow0v7jx7
	TKx2oLEMJBJRJnMou1Ke3BGMYimIiN3KGPkfAElwzFsvl6O9Ca+EUWPj5uhp6sBL/5mpolD6M5H
	sJri55/gI1WCgK0qfuA1lF+0g0TMVuWECHdGPReLekd3U+kkDEZHpb7n6fsWUxmSQMV1poLx/EJ
	sN8rld5VWYuC39XPGBeSoWYRQbQ/KcgVAj7pyr+hCS1+aavqCcUcTPMCon+C1VlSVDv5XSs6aeB
	lgO7S2g2Hfdx+EIBy0FvcRT3XJLAkDFPXjIUlqhizZekzkdMtqIqBw6DPzIP24e8Z5oUJVnPugs
	3c7vb0NBs=
X-Google-Smtp-Source: AGHT+IFLnF3vHm8WX3RtezZeEG19q22EsHzVKseX4ysa+DeNpTl+i3lyyVHiXXJs6vYz5VpDdbS8Ig==
X-Received: by 2002:a05:6402:2792:b0:61c:bfa7:5d0 with SMTP id 4fb4d7f45d1cf-61cbfa706c9mr2786324a12.30.1756363691226;
        Wed, 27 Aug 2025 23:48:11 -0700 (PDT)
Message-ID: <a1f12ff6-d4b5-4ed9-b943-2b5ceae54472@suse.com>
Date: Thu, 28 Aug 2025 08:48:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader: Update to SMBIOS 2.6
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
 <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com>
 <74665857-3f0b-43e6-b31f-d498d9e7fdc3@vates.tech>
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
In-Reply-To: <74665857-3f0b-43e6-b31f-d498d9e7fdc3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2025 22:27, Teddy Astie wrote:
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -975,6 +975,10 @@ typedef struct dom0_vga_console_info {
>   #define xen_vga_console_info dom0_vga_console_info
>   #define xen_vga_console_info_t dom0_vga_console_info_t
> 
> +/*
> + * The guest handled provided by toolstack encoded as a UUID in
> + * big-endian order. Its string representation follows RFC 9562.
> + */
>   typedef uint8_t xen_domain_handle_t[16];

Imo at most "is intended to follow".

Jan

