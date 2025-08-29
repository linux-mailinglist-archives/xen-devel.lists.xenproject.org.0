Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67093B3B41E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100674.1454009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtMf-0007g6-3q; Fri, 29 Aug 2025 07:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100674.1454009; Fri, 29 Aug 2025 07:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtMf-0007ds-10; Fri, 29 Aug 2025 07:17:37 +0000
Received: by outflank-mailman (input) for mailman id 1100674;
 Fri, 29 Aug 2025 07:17:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urtMe-0007dm-Bw
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:17:36 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3baa945d-84a8-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 09:17:34 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afeceee8bb1so256722566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 00:17:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefca08a0csm140043266b.24.2025.08.29.00.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 00:17:33 -0700 (PDT)
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
X-Inumbo-ID: 3baa945d-84a8-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756451853; x=1757056653; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hcwh8bkNvMm57CdhMcOwoSTHfbQlf7cSN6Di+Yhe4Xs=;
        b=XcWzowpwj/fTs6Rk+oE8TgcXMpFW9bnvFmKhPigRkfQtzQv0Bc7ioB4TFc4Z8YWWjS
         WkdkTE961rW865t8G31bCP1rselhSUXw4MxUyaP22OA/tiGtW4f4VLEr7Bepd9bO73xj
         iMpvv8ingUFpL/ifonWNdf5dA4wgwZoyU6x9bXC/KMVaDbLfqxwrxxJFlRjzrqeXLC9U
         mzD8PnM6DYn4wMK9dYLdVFsgHp98gRg/U6Ts+hVw9GB1aAqiIe2WBjN6jzhcquYfTw+L
         HW2jKT+BILedBpj8bXrJpgAQuKiLoEfcqwaPRtWx38+mkCDKQAbrJg9x21y4KGUcsdUd
         yL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756451853; x=1757056653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hcwh8bkNvMm57CdhMcOwoSTHfbQlf7cSN6Di+Yhe4Xs=;
        b=VIFzF7MP8Mhlj0m6lPsG8OVEHrhUCHkX+8cvK8RT4hAWGEuOF9pBbxwmlm4yhCtBtc
         FvnsusMjpMM8hhoIIBKKniVRDXiwkc3zZVNt5Q6goii1oJgzvJQTpUYAsc4qrALJH4B2
         JmAB0F7X6xVsJAUpBZsPU8a1FmEjaZOlBKZXt4mimeXIRkXFj8XmnktOcBM49xQUiiTD
         7/ZgcafBhwChPrMBXGu7WsY7nRFVlLfdgn0jLltVxyW0fK/f0GKXNnYwQjBB0maOMDuT
         nMDyTmJajSOsNHAjrScUvd2dPX6nOOKG5/+rA31ELndPEOmFWEj4dkf5TqApWe3BJbNI
         7R3w==
X-Gm-Message-State: AOJu0YynHfFRfUcy6ShGphpamcp0O8F6MP45UsKCaFha6/iJShk2S7y/
	DbbfIyJEcc0lsozmg2UxUVVQNw9R2EqdLqrSwx/SqDkiEISQZ79EkqItjHxWMbhj0g==
X-Gm-Gg: ASbGnctxNi/uuWIh1WH03mpfA7bcYSj682wR2GVqBLSRd/VE35cPeOGurroYOTY0WUD
	dqRMCuVtmeSukKfEl21Ax8vqop+oJ2cE9CsxxpakejLzd4/awcSLhZljtzYTDfYbxHO+NGN/Yce
	5EuSP0se73MqkNZ7E9dXq1Aji+ppoHUDvSTUZYtI6tzkHWU1wctumA+5Gl8OJTvgn2CTJ/8m5NQ
	JsfwL57NTI4/GgqdhcdA55928a8b9kW5X1Bt8GKMx4iMIutaUuVdxpQr+AIZckcG31bpOrpxw6Y
	8rIpKBtMQvqslha72s+WNDjy34o3BHlNMSBDLSiNx42C2XNovHSJAOgAUL3JWEqLNORnDXtNfem
	4+n9+Ya2/adI5yZjF2EtWy56fnroCsjEhIwZmggygYfsEH0EpXtu9nbgXtlyA7nKZoXSHzFc+W/
	t+uliQlQXLjelQKT+dwA==
X-Google-Smtp-Source: AGHT+IHtsnPi6MpcsE7teywDBwiGu0LQduwroOBeZlm6THBY3piPcvGiiYwDdUVPAap4qhdaZjKIZA==
X-Received: by 2002:a17:907:268b:b0:af9:c31b:c558 with SMTP id a640c23a62f3a-afe29537f96mr2256584766b.35.1756451853324;
        Fri, 29 Aug 2025 00:17:33 -0700 (PDT)
Message-ID: <e8e3b2c7-39ac-4c3a-a7ff-e2b579f44d2c@suse.com>
Date: Fri, 29 Aug 2025 09:17:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250708135701.119601-1-frediano.ziglio@cloud.com>
 <aLEnVSCil2JtDiFY@mail-itl>
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
In-Reply-To: <aLEnVSCil2JtDiFY@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2025 06:06, Marek Marczykowski-Górecki wrote:
> On Tue, Jul 08, 2025 at 02:56:58PM +0100, Frediano Ziglio wrote:
>> EFI code path split options from EFI LoadOptions fields in 2
>> pieces, first EFI options, second Xen options.
>> "get_argv" function is called first to get the number of arguments
>> in the LoadOptions, second, after allocating enough space, to
>> fill some "argc"/"argv" variable. However the first parsing could
>> be different from second as second is able to detect "--" argument
>> separator. So it was possible that "argc" was bigger that the "argv"
>> array leading to potential buffer overflows, in particular
>> a string like "-- a b c" would lead to buffer overflow in "argv"
>> resulting in crashes.
> 
> I wouldn't call it "buffer overflow" - the argv array is big enough
> here. But if there is "--" in cmdline, it has fewer than argc elements
> initialized. If there is at least one efi option (IOW, "--" is not the
> first one), the sentinel NULL inserted by get_argv() will prevent
> reading past the initialized part. But if "--" is the first one, the
> NULL is inserted into argv[0], which is skipped by the loop in
> efi_start(). Which makes the loop go beyond initialized part of argv
> (crash happens even before it goes beyond end of argv allocation).
> 
> So, maybe change it to: bigger than the initialized portion of "argv"
> array, leading to potential uninitialized pointer dereference, ...?
> 
>> Using EFI shell is possible to pass any kind of string in
>> LoadOptions.
>>
>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> 
> Technically, the issue was covered for few months by another issue and
> got re-exposed by 926e680aadde ("EFI: suppress bogus loader warning").
> While it fixed one issue, it also made it possible to put sentinel NULL
> into argv[0] again. But the original EFI code had this issue too, so
> IMO the Fixes tag is correct.
> 
> While there is convention to put file name as the first option, I don't
> see anything in the UEFI spec requiring it. So, Xen should not crash
> when it's missing.

Yet if the equivalent of argv[0] is missing from the command line, how
do we even know whether the first token on the command line is an
option (or the -- separator)?

Jan

