Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF3B26A4E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 17:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081881.1441840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZRi-0003UU-5j; Thu, 14 Aug 2025 15:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081881.1441840; Thu, 14 Aug 2025 15:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZRi-0003Sx-38; Thu, 14 Aug 2025 15:00:50 +0000
Received: by outflank-mailman (input) for mailman id 1081881;
 Thu, 14 Aug 2025 15:00:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umZRh-0003Sr-CI
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 15:00:49 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75a40bf7-791f-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 17:00:47 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-618690a80e8so3136869a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 08:00:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e820asm2595674966b.90.2025.08.14.08.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:00:46 -0700 (PDT)
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
X-Inumbo-ID: 75a40bf7-791f-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755183647; x=1755788447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnIa5viQ38Bw02h0y4IdKaAPBYlGi+dYGT6sE3zaIv8=;
        b=gteEKo49kO0D8I5aptj6lBJhkeKj22FxCTFhjIK0HW53A0/xSSg7wQmz+Xx+zh6UtO
         SJK9o6eGq/rZOc7hlJipTpj+EDiDade5WwoFd90b1BJIkEs3BixuFWykZoxYLRCCYvLY
         ZlfTi+ds07thAaIvXB2lZ0P983W/qdISANdzgufvwDcUx/+hr6abiynHSEjnfMktu9uL
         z7mlGixcElt2th0oLyiSVv4QaZgT22TqS7VPJNZt8wYuCvLJ9UD5L+ckKhVWqWVNT7YJ
         oIKsSsP7oCZqPA7iDI8epnEFV9Qo8Ub5bJPQfiQl7PfYFB8JaCPcWbzQ/XYuBP3axaSV
         5t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755183647; x=1755788447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnIa5viQ38Bw02h0y4IdKaAPBYlGi+dYGT6sE3zaIv8=;
        b=PDxnUo2Uy64Hj76Y7VxPJ5ClhqyWzqQL/Uq48EkpUA8iZTTaLQTIi+y0oMdUd7IveO
         1e/LWLdMbxZS2QgTVnPb+hK675RkaJaRDmlSpOTlNO4SIzpC/bg1nSTwTEEe4RftBiem
         Jm1DfkpXRovWZkNIu1UmNNxQyI5y4KPglb65SIr5m8aXOgIlJlXPiKCUAo39RcIAJr6d
         ncrUzabGtmrv+zECKBx0BfYQTDRcq4TwGrwgRt09tWq2h4c1QUF9R5KSN9QZk9DSqD/W
         /fKCF0D0VcvHv9VNABZaCxgeqtLM56bNPVLReGxmibPYDFxaJMgiXn1gFbfF4LNhnsLu
         5OCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv5yeMF8uump1Eq2Z4TUWEaspp+nZr4izF96scYlUZ9DfdEcxdNtZGZHlUmp6Yy/jSFmyzjnirfzE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTqSCc1LWrVoWH3BkK6WN2hQA2HoUnR+IZJvSN8MtSpf9fQDBl
	0CE+GZ/GVfi4MSH798AU9NYVa94KJ6gB/su6aJLCt9oGJgdEulN5BvLNYvmKNOxT8w==
X-Gm-Gg: ASbGnctNq/nu8FNnCD5QYpG3wYbOR9MRVE9LgJ6UJf/7fTYK11+hIfaGaIpXcV9Xv0c
	ifo1LLP4l8wWis9WPngjTZWpQI5D6jSn7+g4dPdcP3Fy6HSNpoP0Z6nBOk+iATtLop5iytnJuny
	duK1vAMsBoYLFw+Y7yx/zzwOXn5P1i9cU8EVe3ELENFS9otQoHBCvbFfbZoC6ymJL2ZTQW05fYD
	TnJtFpIqi1+0lSjHe6I+7ZmywuaD/TW5iJVXs652l8mNfPvwBbdsd3koe2GEkms47yiqANf4x1Z
	bXjm9wXLkTd8zZUK02FAkckDfyi8go6h74pCLzqHXEGTm64P7bf1ITiditz/nV9HUXlzswpvqW7
	olqk07sqF3wY2OjsAFCNb0WN9xWunpNgBqTvszYRiXeHmEYc0geKamQNN5GXEv6mcOZPf1KaNhB
	Oh8poliio=
X-Google-Smtp-Source: AGHT+IEZ6NYFToZkXanQZbhOyIW1ErZYLwSkJhoiKdMah29JuH/VjoZbzdKqSWO/rjUA6QY7/qtmYQ==
X-Received: by 2002:a17:907:160c:b0:afc:a3b2:d100 with SMTP id a640c23a62f3a-afcbe7c8410mr340164966b.7.1755183646751;
        Thu, 14 Aug 2025 08:00:46 -0700 (PDT)
Message-ID: <74a76087-e45e-4d7a-8df3-2711f77eea2a@suse.com>
Date: Thu, 14 Aug 2025 17:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/22] x86/traps: Set MSR_PL0_SSP in load_system_tables()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-19-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-19-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
> means that the value they load into MSR_PL0_SSP differs by 8.
> 
> s3_resume() in particular has logic which is otherwise invariant of FRED mode,
> and must not clobber a FRED MSR_PL0_SSP with an IDT one.
> 
> This also simplifies the AP path too.  Updating reinit_bsp_stack() is deferred
> until later.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I wonder why this was originally done in assembly in the first place, when
we aim at reducing tghe assembly code we have.

> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -65,17 +65,11 @@ ENTRY(__high_start)
>          or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %rdx
>  
>          /*
> -         * Write a new supervisor token.  Doesn't matter on boot, but for S3
> -         * resume this clears the busy bit.
> +         * Write a new Supervisor Token.  It doesn't matter the first time a
> +         * CPU boots, but for S3 resume or CPU hot re-add, this clears the
> +         * busy bit.
>           */
>          wrssq   %rdx, (%rdx)
> -
> -        /* Point MSR_PL0_SSP at the token. */
> -        mov     $MSR_PL0_SSP, %ecx
> -        mov     %edx, %eax
> -        shr     $32, %rdx
> -        wrmsr
> -
>          setssbsy

This is ending up a little odd: The comment says the write is to clear the
busy bit, when that's re-set immediately afterwards.

Jan

