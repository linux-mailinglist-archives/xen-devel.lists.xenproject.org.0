Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35323C1EDD1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 08:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153376.1483736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENUq-0000Gc-S4; Thu, 30 Oct 2025 07:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153376.1483736; Thu, 30 Oct 2025 07:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENUq-0000DL-OR; Thu, 30 Oct 2025 07:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1153376;
 Thu, 30 Oct 2025 07:54:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vENUo-0000DF-To
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 07:54:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9fbddb6-b565-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 08:54:56 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so5717635e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 00:54:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477285df825sm25866495e9.0.2025.10.30.00.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 00:54:55 -0700 (PDT)
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
X-Inumbo-ID: b9fbddb6-b565-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761810896; x=1762415696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U6dbwM0ehPAK1CLLb4RtNNAEuU7LgHpMY/NGBCGoy3s=;
        b=XhV7ocBjYde/RzNAMV9UC7yC53KNkHIzPXo1QZcL9LQTMVTRHf/QYyai6NK+DJ7Hlk
         BJorCtN6LNXiKP5XweNrhh4PNOntwv7l6OVyXfvXMN2LF2VqSP2yNDfQDsyDiDFlgQXr
         ZrHQQTY9e20AjokNFdQeqaqs9zHaEf7F5udokFwL9m8HQY46ddNoxJjbcPpjlInNWmI8
         Ic/yIWC0oWzJpqbwhmtsL8Q6U24n1RTxXw+sChjXdJQNf8WqjmEa/l/8vpro4WsdrnYw
         DR4uczsWnuB630oQ8m9xv2pXOmKYNKaWU4Bl4IWGB/3b8W5qAaj3JQEe2o69T4kGOBJS
         PXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761810896; x=1762415696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6dbwM0ehPAK1CLLb4RtNNAEuU7LgHpMY/NGBCGoy3s=;
        b=Q3SqTrV4L3Xy0F1WQQYw12xQ2IfDiDVAVG7qln1mK3NbIS+mPtBf74eZg/lGzSKQg2
         VxfyeenNsi6i7svXvtDg5Os5jO4uzbY9I/5PdN7zM92apYIYKeY+K8PZBZvAuPMMLA4r
         Bi0je2oXtPl6+57WQuS8KQeba62UrkOVMP8tcqnwpyBm01yR6LBcX8AIZ94TkdJYXPRT
         m9a64T4Z8vAESR1A6ZPbzieGMpbYq+zs6VC5Ojsax0/ESrOVkaXwbQ6MDmTj+6HJN5ik
         az/NuR7Pgwo/rEZK9MSKNM4HHO0HDiHDX+Q7PVYGoWPEU+mRT6o4AfIwFLoWSzEToW1Q
         jeQw==
X-Forwarded-Encrypted: i=1; AJvYcCXauDjkp7aiWnSqCJtaS3bT6Kz5FXpQt69uj4ZzkcwPngOMJk2+E7x13kbtqoUZSconx+B3NfGw5WU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeSe9ltSU7mXtnMWpJfF+zdWzeCGv+iAXyTyYgjzk6/ykaxMRM
	G1TAjYtTGfdvVB5JxcZYcJwsqiyZAOTwMFAcxLDivgdweSvraxkCT+MBaeQeeigsTQ==
X-Gm-Gg: ASbGncs2C8mGsRB5/mzdJkBjerV2mjDxbSGPbPa9YMCuFIWjWu9ykFp/ILHmNJ7JL8O
	Kt3mEny7gbvvAus2SS0Euk3DOgQNEcka0K1fKn7Jhhkd43goPSOrwC7kDzemJc0aDums5N30Awz
	F34oLV9LR+8KOjL6VF/mplHZ5vUbJLFzr7zuOgPdoq1yq2DaXATluTbCc0UwvDxh047pbdTKbJR
	BY9IQ9dBUlw2+bCczItBUU1uqJs3jUdCgZapfHCrf4hEr4Mg6mHkzU4APXIb7mV+h5jHcjO72o5
	uR7A2E8OxUBqQPYKu8VKl9C3GW0FS08NvBt+SE95coPa3qBaMY7P8wS+dfCoSCyVnlRHNVPMn1/
	Xdy/uShUMnoYo96pOXg1d9EHXdwpb9NwbVGi1zXdw/wKwar3RnUHaHWxiWiwywiuJVzEaWhTw/r
	YeCMyh27e0MgDZSkr9Em36oEgcWBjbNVHheUiwauFgHnHeDy6wwjS6m6JIcJEVHxvDSPr2JiQ=
X-Google-Smtp-Source: AGHT+IEmdKtSOh1G7yW8xLwAdjGX9nx9kzz1sFjK3IasU3yOyR6TGieq4JIMX7rClbcHzmHv66fhTQ==
X-Received: by 2002:a05:600c:5494:b0:471:b5d:2db9 with SMTP id 5b1f17b1804b1-4771e1cac45mr48837415e9.21.1761810895983;
        Thu, 30 Oct 2025 00:54:55 -0700 (PDT)
Message-ID: <fa9a7720-5a90-41bd-8ebb-5fc5d4065d38@suse.com>
Date: Thu, 30 Oct 2025 08:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
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
In-Reply-To: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2025 19:26, Teddy Astie wrote:
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1116,6 +1116,20 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
>      if ( !has_vlapic(v->domain) )
>          return X86EMUL_EXCEPTION;
>  
> +    if ( has_force_x2apic(v->domain) )
> +    {
> +        /*
> +        * We implement the same semantics as MSR_IA32_XAPIC_DISABLE_STATUS:
> +        * LEGACY_XAPIC_DISABLED which rejects any attempt at clearing
> +        * IA32_APIC_BASE.EXTD, thus forcing the LAPIC in x2APIC mode.
> +        */

The MSR aspect should be implemented by using the MSR. Beyond that imo our treatment
shouldn't be different from that when firmware pre-enables x2APIC: While not
advisable, aiui OSes could still switch back to xAPIC mode. At which point the guest
config level control may also want calling "pre-enable", not "force".

Jan

