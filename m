Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C142FAD02B6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 15:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008536.1387812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNWhj-0007xv-CY; Fri, 06 Jun 2025 13:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008536.1387812; Fri, 06 Jun 2025 13:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNWhj-0007wU-9N; Fri, 06 Jun 2025 13:01:51 +0000
Received: by outflank-mailman (input) for mailman id 1008536;
 Fri, 06 Jun 2025 13:01:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xc=YV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uNWhi-0007wL-L8
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 13:01:50 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68ac2bc3-42d6-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 15:01:49 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so27116375e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 06:01:49 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244e0e3sm1854027f8f.68.2025.06.06.06.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 06:01:48 -0700 (PDT)
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
X-Inumbo-ID: 68ac2bc3-42d6-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749214909; x=1749819709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iXkBU6+oOy/U/qvVLCoKemScuo3O3lcWcaPZjmBt/Gs=;
        b=unnkFhKP0z73k6c8sQFzb0BqtyBFb0WHUgMjbvFWxbNLJnaEUWWNcsEQ1C4rg9dMz3
         mnEFD7epHEyuYXAuQAEVw/VXVgYR19UpXHEXrFMbm+y4S4zKs1n7xTtoP8njr3caA9a5
         efYIZj9DvoO7oa4o3i0bR9Yy1w55tJsrDBZuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749214909; x=1749819709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXkBU6+oOy/U/qvVLCoKemScuo3O3lcWcaPZjmBt/Gs=;
        b=f9hdMZZLogQ6BMZ8V31R6CMIAPGPgiKUsYVptbXJCiAcBy1Q9Z5O3R2GOldEo1+Tj4
         rPyC7ryMQhGXi1VNUez6wJxUwrAClescNcEuXclywD/y0Tydt0dbySuS97zRqns6S1IE
         NyTBsP6F5BUwzWwOE4sDmSWyA8PX5vR754mEX5GJaFKfPJsu0tixE8ilJT2UDs3Gj6Gy
         /etIy1JN05B2TZJJvMHrMGGdkCAeTDf+4Kp+nQgIRz1AVtsne0swrSUQb0mJcubpmPSw
         6WbeGQGhUf286G2tBYVjLMLMk4taJozVUv34vMUA02psqYRgrkqYYdV+OzDrlqdv/MHj
         0yKA==
X-Forwarded-Encrypted: i=1; AJvYcCXjSCaeD+WgMvWVo0kQbatP/Zenz4gOKUuiqN+lOWq3ulT4yqe8sXRZwaQuoBFUXaZ2mgifLmNA+fY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/7yjd9r8TBcSyTv+WK3fNpC4Gnmd/GhNJb5T1xs+73fx+UG8E
	V+Ft+LPIFWRKGsByighfFotXJ26TVEkD2rfifWuBcJlID5mZ0M7iXDegakVzq6rT8Ws=
X-Gm-Gg: ASbGnct2XajDLZMpCmaWiDoFlcNlXocLYG2KAXJmUKjlhEBIxlmO7NvS9tSskaOFjkP
	U3fo+OTdEyY53u9qEyVHR3pRDI0i7MYSHTr0eC6oZTejagfrsw8EUAMf2e55HW0LD0cgPyCzZo6
	V2c6riQqjWSeaDfz1M6YPcufAalLEQuT7UUjbkJKDePQC+DURJIIa7nB+CS0g/jHmVNTjjiVn/A
	2sh7snnxjDbwsJdVlULq2SnXXKUU8HhVEBxG0I62phMGDB3fV8hPDW/pKMpvrudlyzy0sl1t9QO
	eCxo9onshihu6OOfZdsHXrfkTw/ONzDJG90jt2/FSoCRr/sCmXjgMxlzeaVBqiGe
X-Google-Smtp-Source: AGHT+IFptYsBBmSNadLGBzowwbqtxhjTcnz7MrLKvM4FxNNKpD0SRr446xN2DLxjPkuppyJWOgayXg==
X-Received: by 2002:a05:6000:1ac6:b0:3a5:2f23:377d with SMTP id ffacd0b85a97d-3a531cb1037mr2759637f8f.50.1749214908847;
        Fri, 06 Jun 2025 06:01:48 -0700 (PDT)
Message-ID: <307835ed-178d-4561-9529-5be4433d503c@citrix.com>
Date: Fri, 6 Jun 2025 14:01:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: remove memcmp calls non-compliant with Rule 21.16.
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
References: <20250604233537.2892206-1-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250604233537.2892206-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/06/2025 12:35 am, Stefano Stabellini wrote:
> From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>
> MISRA C Rule 21.16 states the following: "The pointer arguments to
> the Standard Library function `memcmp' shall point to either a pointer
> type, an essentially signed type, an essentially unsigned type, an
> essentially Boolean type or an essentially enum type".
>
> Comparing string literals with char arrays is more appropriately
> done via strncmp.
>
> No functional change.
>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> ---
>  xen/arch/x86/dmi_scan.c | 20 ++++++++++----------
>  xen/arch/x86/mpparse.c  | 10 +++++-----
>  2 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
> index eb65bc86bb..b6edd7a965 100644
> --- a/xen/arch/x86/dmi_scan.c
> +++ b/xen/arch/x86/dmi_scan.c
> @@ -233,7 +233,7 @@ void __init dmi_efi_get_table(const void *smbios, const void *smbios3)
>  	const struct smbios_eps *eps = smbios;
>  	const struct smbios3_eps *eps3 = smbios3;
>  
> -	if (eps3 && memcmp(eps3->anchor, "_SM3_", 5) == 0 &&
> +	if (eps3 && strncmp(eps3->anchor, "_SM3_", 5) == 0 &&
>  	    eps3->length >= sizeof(*eps3) &&
>  	    dmi_checksum(eps3, eps3->length)) {
>  		efi_smbios3_address = eps3->address;

This is a good example where MISRAs dictats make the code worse rather
than better.

The anchor is a magic number, and memcmp() is the correct check.  It
really is "is this byte pattern identical?"

It's just that the byte pattern is chosen to be coherent and logic in
ASCII, so the use of a "string" is also correct.

Previously 4cd66fb56dc697 was done, but that was on the belief that
those where the only two examples.

What variety of compilers has this been tried on?  Both Clang and GCC
have warnings about str*() functions on arrays and overflows, and
switching to mem*() was the solution.

~Andrew

