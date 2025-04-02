Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF4A78B8C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935477.1336876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzulh-00063E-PA; Wed, 02 Apr 2025 09:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935477.1336876; Wed, 02 Apr 2025 09:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzulh-00061u-MY; Wed, 02 Apr 2025 09:52:21 +0000
Received: by outflank-mailman (input) for mailman id 935477;
 Wed, 02 Apr 2025 09:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzulg-0005z2-Fx
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:52:20 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a8ede22-0fa8-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 11:52:19 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so3895917f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:52:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6588dbsm16210364f8f.2.2025.04.02.02.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:52:18 -0700 (PDT)
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
X-Inumbo-ID: 2a8ede22-0fa8-11f0-9ea8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743587538; x=1744192338; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VUNK9W8wV2mujo6N+5rPbjZDFz3Oe4t/5642xMeyKpw=;
        b=eMNYAp+j/mREwJU1XdI+IlElywVElh9h0oD7jb8lWjMrevLgII2cxSfpX8YkqcdNrL
         aXhS4ulQgGNjaUGl5tAQkfJGlmfHTaLrP2nJVpcL2yydn/yrN29Yrb9XmHFEfCe0sztM
         JD1jTgrKYjg1wYYJUcBwBuYjAJLojyWMy2/AS2uHi0PJ5yUggNHG0pHGqo+ncrrlSvx9
         +74NvbvbjVG7L4Hzv8ZuVmwTqfg3KK5P9QyeR4TdKx7ELw/ij82hSuS44C08w4fbAjn7
         DnGMtAswSOMKQcq4LgrVBAQEYDcpoCchgeHPM0OIhTnNWM+kLogbiYDTombpgtTouiDV
         3fuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743587538; x=1744192338;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUNK9W8wV2mujo6N+5rPbjZDFz3Oe4t/5642xMeyKpw=;
        b=cAwZES0X0pUJ0PClcXS7+v2KR87cHFsEqwTxmhA+NG7/e84x5p7s03sxwHdzCzAuGn
         bbFnr4XXMnQD3AkBPUMpavixJzBYFB1zI9djXznZrYmUU3h7vRt/a0d6UWnP6bEm03xd
         cyrQA8phQqCvlazcDwQtx/yD/Kjm4JWKgGx0oYLNl0oUCGnTF34azxRXOaQa8cdyM3Ba
         1707sESebGPza4W1NpQigWJrKCpHV3ESnowCpmTWyMSQ+7wxSHDMV9qGQbulVSVhU0Oc
         CBlVsBDxbu9jRx+CISInc2XghWBplxSDLpgwigds5JJvJXmQPXf9t6KvX6nSuKr9ZAFZ
         C9lw==
X-Forwarded-Encrypted: i=1; AJvYcCUt3K6m8tGf0zt/5Y4L/nT/EMPbkb3y+6UWaWwpRfwTmtzLYQqOz0NIQGhz2X2dIhGa6vVfQOT2HMI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzjipf2+aTy+x4Yz7zpg+35FZp2NXXB3NaYMFvikL5jN43U+khI
	Hq4A2zjQ0MRszcYsoGpWK4UhhR8yw9F/owlNPxiShW1KRPMmzS1ezWtWkbmVnA==
X-Gm-Gg: ASbGncu1DwwwhLfFZVu5l2KzdVGg+A5gHOlllqIhHEwMSFg1bEc+UeG6Nn5L0nqafiM
	fRx4HrHn5Wovkj+oiw6vN9k5Aa68odL2KrP/HTqABNVQyrv4mVldZkNFbkMDtpbsvSng83QZQYi
	Ymq2zMUHzspYgwMjg8uktPp95lglzztY1JdvaEDE7Zs7WesgyYwJUI1DMiQ4nOj73lO6IMq56UW
	agaRgKeas+VKd0q4UyjQZrfjTf6/a5TR4V8eO7zH8N4LllTXWYqJQ6/Fw+bNStDW/q+89eSMKgY
	ROxIwGtzifoQcGlNHJGj/PZ0Mi96F9FYimTjpDdArAO4ut7JAkJA2ACo6v64dNGm3JcZ8kHdOU3
	Xupduum6E/C3aOcIn5Yw8oD2lY4C1tA==
X-Google-Smtp-Source: AGHT+IFL5lGpxKIdfiYMutyujXBFRRd+hRBXLkx07R4s2xxTlXEguS65ZeyVZ+R6ojvo2E09jjvYLw==
X-Received: by 2002:a05:6000:1842:b0:391:253b:405d with SMTP id ffacd0b85a97d-39c12115d7amr11756941f8f.41.1743587538638;
        Wed, 02 Apr 2025 02:52:18 -0700 (PDT)
Message-ID: <0fe8cbc5-cb34-4446-881c-f7ef20d36ce5@suse.com>
Date: Wed, 2 Apr 2025 11:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] x86/vmx: remove *_OPCODE
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250401222105.79309-1-dmukhin@ford.com>
 <20250401222105.79309-5-dmukhin@ford.com>
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
In-Reply-To: <20250401222105.79309-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2025 00:21, dmkhn@proton.me wrote:
> @@ -497,9 +479,7 @@ static inline void vpid_sync_all(void)
>  
>  static inline void __vmxoff(void)
>  {
> -    asm volatile (
> -        VMXOFF_OPCODE
> -        : : : "memory" );
> +    asm volatile ("vmxoff" : : : "memory");

Nit (style): Blanks immediately inside parentheses please. Ideally ...

> @@ -507,15 +487,17 @@ static inline int __vmxon(u64 addr)
>      int rc;
>  
>      asm volatile ( 
> -        "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
> -        "   setna %b0 ; neg %0\n" /* CF==1 or ZF==1 --> rc = -1 */
> +        "1: vmxon (%[addr])\n"
> +        "   setna %b[rc]\n"
> +        "   neg %[rc]\n"          /* CF==1 or ZF==1 --> rc = -1 */
>          "2:\n"
>          ".section .fixup,\"ax\"\n"
> -        "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc = -2 */
> +        "3: mov $-2, %[rc]\n"
> +        "   jmp 2b\n"             /* #UD   or #GP   --> rc = -2 */
>          ".previous\n"
>          _ASM_EXTABLE(1b, 3b)
> -        : "=q" (rc)
> -        : "0" (0), "a" (&addr)
> +        : [rc] "=q" (rc)
> +        : "0" (0), [addr] "r" (&addr)
>          : "memory");

... you'd also take the opportunity to add the missing one here. Then
again Andrew eliminates this altogether anyway.

Jan

