Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B71A71594
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 12:20:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927606.1330328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOng-0005yX-BL; Wed, 26 Mar 2025 11:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927606.1330328; Wed, 26 Mar 2025 11:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOng-0005wD-8X; Wed, 26 Mar 2025 11:20:00 +0000
Received: by outflank-mailman (input) for mailman id 927606;
 Wed, 26 Mar 2025 11:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txOnf-0005w7-O4
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:19:59 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4078f27d-0a34-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 12:19:58 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so3633980f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 04:19:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd26cecsm179107205e9.17.2025.03.26.04.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 04:19:57 -0700 (PDT)
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
X-Inumbo-ID: 4078f27d-0a34-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742987998; x=1743592798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3zsSScDB5KcIpU7bmPVGyFiAOeLFa4DhW9QmQzbHM9s=;
        b=Msm6V6lozT630cSCoMOel1m1c/nsgM7qz1+k+bRU+gGCG2apMGlWS5KYsZZNRjvnz2
         4f4aBiPowC1ILksC77plJ6Zaz9Sm3ZWZEIhLeepyTg8/utmFxz0wKHgsxET7wz/DK6Nl
         ybRxYQrLn/zve1fkgkqY+KPlpjuhWnQUWyaoRZSx7jiZYHtJC+DHnCey15SOm9AjnYRg
         iZOzth87xPGQrTQJyNNfb6wXp2AM/xjS3Lf4cGWOeNs/s09eFSiq9lnsybaBQTGI+J2D
         caDc1Yb5belKsxLOo6qfPIOGWAQ5SPrdul4JhCJSZ7zIzsldD9M2/6jBqnwqs0jgx4DJ
         GB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742987998; x=1743592798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zsSScDB5KcIpU7bmPVGyFiAOeLFa4DhW9QmQzbHM9s=;
        b=fs55bcaDMD2PlXoLIhtRe/E4kFqNvO65p+sCWrqUpY2LBE+SaqarwlNxbyjT+o20/Y
         hWkUAgBAo+MX+ZoIbR6JM8Xd8rSIDrcVziq0kCZIaBazQi5aED0MZ48DphXNDhQcgzlz
         fmn0QaGhQ+HpAMigdH+JhVqT6Nd/yK0605h+2SIgJg53JPZDx1UQ/4uL1EqxguYbHRmV
         56A8KpwgUe0KD1ABQmW734BAxHAa21y0AvCLkdWngOr0bH5nr/GdOj5tBsnmkSXkEMe5
         968qiPSVKkUha/fbSHfwh9fGZ6I2Cmp7aXQgGL2BU7pArtzd78QJGNgVj0+WfWjXcHTx
         BDbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdFrjZ4WTqTS8+w9gA5TiAlLZKM5F1aG9xABqiUi1YBtZ1aWftGkIwlCYY3S4JKpZl+lNp3Q0+ouw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUwDPiGiccfaxEw8oP8sf7wwquhxZ7NI2gQ6I2SyFi5ngKGgl7
	ZQghh7HJR3KBrOaLmgsyNpf/J1vXv2jVIRKHNKcJEJ4XCDHNTczHbFiyXG+XgA==
X-Gm-Gg: ASbGncv26DOScDOAPVrkF+SeiRUh7QUN8pdlMgax+rqbzkZnxOpRbQycvkeY9AAPixK
	lSLr49v1xQW54B9A+4yp2FfqrqF/MH40xOsuibv0IEKXODHUbvBkDBqn+Myg+Ls/V8LszBmYcVk
	cWSbichz3HiaxRcah0S05pYFeIlXy0KvBIICMGvwkRvgmgMGb76BwKvhE4pKApRK9OwcBiMnD8Q
	8zt69OH6ESbMg2PzUse521pobrGWn9OiUa6tyUWxTwSc2+Cw2mW7j+pHnmmtXuX4shQ5dtks9P5
	bZ6h2GDqMml4o1ebpZ0J2b0FehiGZ2LN6IY8rWdH72Prgoy0iyKbyafKKPmiiTyJ4AnN73ht82x
	v0LLHPdo1wFIe1OWP3AuMK+CUePftEw==
X-Google-Smtp-Source: AGHT+IFZxr8oyl268Ad60Ted9h4ZNJoRS/6N9tMfX2wHaSJ1Q9kUT0NE0akvxo3gjsZpqEgvxrt+0g==
X-Received: by 2002:a05:6000:18ab:b0:391:1806:e23f with SMTP id ffacd0b85a97d-3997f911624mr16916730f8f.17.1742987997893;
        Wed, 26 Mar 2025 04:19:57 -0700 (PDT)
Message-ID: <261b12d9-7125-4cee-acd8-a8ab3287b05e@suse.com>
Date: Wed, 26 Mar 2025 12:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/emul: Emulate %cr8 accesses
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250325174109.267974-1-andrew.cooper3@citrix.com>
 <20250325174109.267974-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250325174109.267974-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.03.2025 18:41, Andrew Cooper wrote:
> Petr reports:
> 
>   (XEN) MMIO emulation failed (1): d12v1 64bit @ 0010:fffff8057ba7dfbf -> 45 0f 20 c2 ...
> 
> during introspection.
> 
> This is MOV %cr8, which is wired up for hvm_mov_{to,from}_cr(); the VMExit
> fastpaths, but not for the full emulation slowpaths.
> 
> Xen's handling of %cr8 turns out to be quite wrong.  At a minimum, we need
> storage for %cr8 separate to APIC_TPR, and to alter intercepts based on
> whether the vLAPIC is enabled or not.  But that's more work than there is time
> for in the short term, so make a stopgap fix.
> 
> Extend hvmemul_{read,write}_cr() with %cr8 cases.  Unlike hvm_mov_to_cr(),
> hardware hasn't filtered out invalid values (#GP checks are ahead of
> intercepts), so introduce X86_CR8_VALID_MASK.
> 
> Reported-by: Petr Beneš <w1benny@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2288,6 +2288,10 @@ static int cf_check hvmemul_read_cr(
>          val = curr->arch.hvm.guest_cr[reg];
>          break;
>  
> +    case 8:
> +        val = (vlapic_get_reg(vcpu_vlapic(curr), APIC_TASKPRI) & 0xf0) >> 4;

No new #define then to use MASK_EXTR() here and ...

> @@ -2333,6 +2337,17 @@ static int cf_check hvmemul_write_cr(
>          rc = hvm_set_cr4(val, true);
>          break;
>  
> +    case 8:
> +        if ( val & ~X86_CR8_VALID_MASK )
> +        {
> +            rc = X86EMUL_EXCEPTION;
> +            break;
> +        }
> +
> +        vlapic_set_reg(vcpu_vlapic(curr), APIC_TASKPRI, val << 4);

... MASK_INSR() here?

Jan

