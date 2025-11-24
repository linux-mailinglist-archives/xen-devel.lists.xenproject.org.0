Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115CBC81421
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171410.1496419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYEW-00072N-Dt; Mon, 24 Nov 2025 15:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171410.1496419; Mon, 24 Nov 2025 15:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYEW-0006zm-BF; Mon, 24 Nov 2025 15:12:04 +0000
Received: by outflank-mailman (input) for mailman id 1171410;
 Mon, 24 Nov 2025 15:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNY66-0001E9-Dw
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:03:22 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7bc0296-c946-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 16:03:21 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso47845405e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 07:03:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477c0d85360sm195276875e9.15.2025.11.24.07.03.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 07:03:20 -0800 (PST)
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
X-Inumbo-ID: b7bc0296-c946-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996601; x=1764601401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rA6mYNSombVoXss+wGmsdkfBchAgYqWjr/HJ98EE+BY=;
        b=O0vC94mXBm1WRLU6adqh+x35DaQtbwu1OVaWJDtSebl41npNbDdGM8/bpB1gYOUPka
         1rcCowWsrzP/9Msz+jG5mYp6vViM9lZ/oibYwKJ44RzXjyfN0hVIjWermYfiyMGpjoqx
         bgwbjSOswvoQpVdOCqmKBk3vzv9Q0ygdHrRXzRn3TSe8Sv3IllNkyqSOOoHyOSDpJIn+
         HKuKlX72pUpG5edfBiOM4Y+TRrsXvxMdS0xz1cdOUfbN8SIy1abT5kpcU7MT/Nhvt8Wa
         2ZVypPiUorIBstItIEFhyQHDsqtUQCAkPSArSyXl4UV7wgCyNDOF197ZN41K6nXfNtQY
         3Hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996601; x=1764601401;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rA6mYNSombVoXss+wGmsdkfBchAgYqWjr/HJ98EE+BY=;
        b=sW2q1dQDV5nmDdkU/g1O98wr5Q5mOO3BEyuoi2U/O+9MAbqo1Sko6oQkx6/6YWrZkR
         8JhQfvNBeWCdoS8qC3NQIaqHdvc7l5akP9SxCw3YZ7Sqhiu4HzUrnq4U795JFsY9CXtw
         m4EyzwptjjekkvIOsroDlbuW6DtLwsGyl3Q+LSbLmt4HRBK9YjuCWuwZ1WrJ2VpIf0yr
         1OojmRBsbt6K1EvFj6ie2u6QFowx41rhpSrw1pfiAZDmEZFagcLYVy+15mY9R0UFL0ne
         M8VWNHgEuuXuNzwryasPR0/nEEN9cSmdKPUSBSlEF2NoBofTZZYDZ5yRtXey3vvROxOi
         0lGQ==
X-Gm-Message-State: AOJu0Yzzh/2p3797bF/Q4ZBEHUaJcbMoXLtqEoa3S1U6IU3beAKzpKHa
	CbRnwbNjSePambZvANL9FTIhD4sWtr2BXI8ffsTe5IaglaSkqrrSvNTmfTLNqdyxgjDT7XhuWbk
	t32A=
X-Gm-Gg: ASbGncvSzfEN86nwfMpnZWKyoHjqxk6hNp8Lz7JkJ/mcnXVUGwYvNpcCBOvYzxy2eAK
	L99PnWF6HIdkFDINGv+b0HNB/zFufgRYVdBOcOokxgvTe9/nsM2Z4aoDfscGGQKzHjWUes8rv8J
	lzNw4T2UvPN+wGDqt4uMTLALOhl+MSgXdUTSm79AdogmQB3+M/RKwAMkjXrNOX7YsFaxmUhaHvG
	7WAo9kb/rJMBDPKKwrLBSc51hI8aUy0HOBDqAAXgj3YtBPlowNNho0TwESRxG2hI/an4ylmSWk/
	vX0bzrgL6svRxyrsHzU4Y+JS/tk2LN6mFAaW2PMzcc3YOq9YpeUBId4MidbR/PZ6AJPlv2ef2nY
	+4TMS3+j/HQm6jHkIlhjVFjKaROBzVPwWh/Kt/JdsVhe71TMc+W/OsRrwAxqO/Ab8VbCzQe/cVZ
	pQj/uqpVYiedrJOFlpKjZs0b7LJJqdJkA8fdTFqcRmdXzJwnYu/Bc4WCV8zfNvae79/R0HMUU5H
	v4=
X-Google-Smtp-Source: AGHT+IFQ+wFi+i3YaXrf9vVNYxlVzZMLpoT9qpVetW5lFTvm4Q0CPL73KA4RYdcjT+dzMdToc6Zf6g==
X-Received: by 2002:a05:600c:1f85:b0:477:7b30:a6fe with SMTP id 5b1f17b1804b1-477c1116013mr107652755e9.18.1763996601056;
        Mon, 24 Nov 2025 07:03:21 -0800 (PST)
Message-ID: <17e717fa-16c6-4cf1-89aa-6173baf25ce8@suse.com>
Date: Mon, 24 Nov 2025 16:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] x86emul: misc additions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
Content-Language: en-US
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
In-Reply-To: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I screwed up in two ways here: As the cover letter, this is 00/10, and ...

On 24.11.2025 15:56, Jan Beulich wrote:
> 01: x86emul: support LKGS
> 02: x86emul+VMX: support {RD,WR}MSRLIST
> 03: x86emul: support USER_MSR instructions
> 04: x86/cpu-policy: re-arrange no-VMX logic
> 05: VMX: support USER_MSR
> 06: VMX: support MSR-IMM
> 07: x86emul: support MSR_IMM instructions

... the order of 06 and 07 are the wrong way round here.

Jan

> 08: x86emul: support non-SIMD MOVRS
> 09: x86: use / "support" UDB
> 10: x86emul: support AVX512-BMM
> 
> Jan


