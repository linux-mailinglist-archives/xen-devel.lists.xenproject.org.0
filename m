Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4265EA456E2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 08:44:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896218.1304899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnC5t-0008V9-Tf; Wed, 26 Feb 2025 07:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896218.1304899; Wed, 26 Feb 2025 07:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnC5t-0008Sl-PL; Wed, 26 Feb 2025 07:44:37 +0000
Received: by outflank-mailman (input) for mailman id 896218;
 Wed, 26 Feb 2025 07:44:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnC5s-0008Sf-I9
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 07:44:36 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 861e7412-f415-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 08:44:35 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-390dd35c78dso57118f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 23:44:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8e7233sm4632019f8f.66.2025.02.25.23.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 23:44:34 -0800 (PST)
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
X-Inumbo-ID: 861e7412-f415-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740555875; x=1741160675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iywt1B97ELsmIQ7mbOCQ/Plsu3oOZ4hZrXd14dijMn0=;
        b=avI3Gp4+qpVUNMa6JNYN0QDfbISjp6z7Ebmrp2a2xpz3yODuuaQETUEMyTyGUPo+4a
         CyWrCTywz6b2680DRzUi3IJLPpQxaHz/VWCadx0GPBzVeCOkr6XQ3B22glfO/VaHg+bp
         w3EbSO4aeUvFcmorONkc+hJATx7PnYWmce46gN4UwmH+ERQYOcUq4A6VWtlT0YvrOHLF
         v9+iTKqmmB6TLclGIMRBmneD7wPI5keHUKYpWTf0OyhD0u1uklpplvZEoqh+75mNn/BL
         FBRrJQ/qn6jhnexFzTfuNTbj6KreIWrAFe5iDwbWfOwHj1DYmUy/NxNYwrvdqUjziivz
         eWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740555875; x=1741160675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iywt1B97ELsmIQ7mbOCQ/Plsu3oOZ4hZrXd14dijMn0=;
        b=msnb38HT/EIRPmHATYiOhvF7MMIpIWnXIe2Cmx6qNIwcv6FTSjqcxz9l7vxJhPgPSi
         IuGAcz+3pyuD4OafYDE66FZ30/wUrgjAYwt7vCMQFi42rQdq8+jBslw4xLS0dXEKzVow
         vkHmWR7vAcK+MFbPOct5B9eEsv8MFEzOZl/QTU0ZNWqExcXCEBZfrRjItivHaOWlhR8T
         I0Ow+qzQpPdkqLsr/HOVvZ6C2XXMbewygi1ggbvB7wNcZslsvC8VOELi/VQTRjbXvTAu
         wxpl2qrnTnWY2omKKS3iC97NwqUs02w242grT1YkpNizvAl2h0fBpZ3DY21bp1FgGJhi
         BhAg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ+ZR9cSDOZ72128RAs9/39bPCXiFqhZODRu6pqeFd44lGO1cEHsrnHfUq1cVhgvT2009SGMi/q4Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFc+h+4HJaUsrx1PVp0a3mR7JNU5eAOqq3Tm1WxCxpQacv5/zG
	kRmfUtBq17Qb68aaqM10j0Ggxtmv5pOBV9xhvuwRMn1u6/uJ/KwwHRqBa2Jxmg==
X-Gm-Gg: ASbGncvJl5DxBUg3aPY2y4dC/vf+DpL5683rDnqT/+k4RpCjh30gbdOl2gSL43LK38L
	eXu7Fpfkav/s2KxEht5w0qOCbTvumG68uTET/ylIokyrB7KzxIHljrDC39uXj1p5Bc6qwkE2eHC
	napjK6csOS3suzlVY3m87JKn9myTa7F3nXtlg52+69nuj9ZvPsI3jP/+6Clz0s4ADt3Owvm9kpE
	9kcU52Dxh/EkgR/93g+XaeXLRNoEbOobwr/6d/7NLg/VZR37ax7Y9g5GH5SbIxqYtUoJhzrb0HP
	5ciF+wn8th+6eVYHPMKn/7p6bEcs4KdBNOxhnUMKvDAhjhWIvL7JVM7ogj93b+cqKD+M/x3+kXv
	lRhso+h3CGG8=
X-Google-Smtp-Source: AGHT+IHNwUu3G+NkNGEyeVdkd/t+uiWDfq/m/vHmeVluJ8D2OypeXRwRHGsGpDNw5TuFHOPsc6dG/Q==
X-Received: by 2002:a05:6000:144d:b0:38f:4f17:ee29 with SMTP id ffacd0b85a97d-38f6f3dca7amr14935631f8f.17.1740555874947;
        Tue, 25 Feb 2025 23:44:34 -0800 (PST)
Message-ID: <68a14ea8-b6f0-448e-8713-e9696c024c43@suse.com>
Date: Wed, 26 Feb 2025 08:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/elf: Improve code generation in elf_core_save_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225224559.1226079-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250225224559.1226079-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 23:45, Andrew Cooper wrote:
> A CALL with 0 displacement is handled specially, and is why this logic
> functions even with CET Shadow Stacks active.  Nevertheless a rip-relative LEA
> is the more normal way of doing this in 64bit code.
> 
> The retrieval of flags modifies the stack pointer so needs to state a
> dependency on the stack pointer.  Despite it's name, ASM_CALL_CONSTRAINT is
> the way to do this.
> 
> read_sreg() forces the answer through a register, causing code generation of
> the form:
> 
>     mov    %gs, %eax
>     mov    %eax, %eax
>     mov    %rax, 0x140(%rsi)
> 
> Encode the reads directly with a memory operand.  This results in a 16bit
> store instead of an 64bit store, but the backing memory is zeroed.

Raises the question whether we shouldn't change read_sreg(). At least the
emulator uses of it would also benefit from storing straight to memory. And
the remaining uses ought to be optimizable by the compiler, except that I
don't expect we'd be able to express the zero-extending nature when the
destination is a register. Or wait, maybe I can make up something (whether
that's going to be liked is a separate question).

Jan

