Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB2DBDCB0B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 08:20:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143131.1476913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8urk-00067u-U4; Wed, 15 Oct 2025 06:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143131.1476913; Wed, 15 Oct 2025 06:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8urk-00064C-Qm; Wed, 15 Oct 2025 06:20:04 +0000
Received: by outflank-mailman (input) for mailman id 1143131;
 Wed, 15 Oct 2025 06:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oFce=4Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8urj-0005ky-Iy
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 06:20:03 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb9f8af5-a98e-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 08:20:02 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so11777695e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 23:20:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5d015esm27929329f8f.33.2025.10.14.23.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 23:20:01 -0700 (PDT)
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
X-Inumbo-ID: fb9f8af5-a98e-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760509201; x=1761114001; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EWpfYIfQiO4iEKPhFjFn7elMDmnN1GcrNstL/ykWifo=;
        b=JPloFKpgVc2jvxPsw2elQ2yUkWLQ2oyri+jK75/BbKpyCIqhuCAsTnvtJEhuqWVYDF
         f8Euo5whcBPOgyXuIwZJ8jDLY8PcVLnhUKm9ffSLG4hkZ6DGr0sxUqINpLVNGLIYTE9g
         Vac1qivHfDEDg/rzvHWLexkkqu9glJnoIKOcF7O0utIUTnGUHUt5OnQ4UN6F2ootJghD
         +pty7Ob+Ejaz3HdhuyxBqdQ9Es7b3jkPcfAyUhSQBoikxekoNYArt1X1z2h+R0r1UoHX
         7FJmTH3I5YL0Sl2PEvDw7vV/fDLsIJCvuOkmZYWdYSmw0+G463AP/gGm2I4GIaTzv611
         0Zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760509201; x=1761114001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWpfYIfQiO4iEKPhFjFn7elMDmnN1GcrNstL/ykWifo=;
        b=QyWWHfb07OzwkBKaBcQ099Ipgba6lbHz/RH4KCK8FrqNH2IqL+4B3/CkpZJiwy/vC9
         vkdkPTgC63gsV28a24sdp/tSbGvyQunnOm7wNoqdI/ndB55TkSDacs6sX1bw7FNWTp+N
         oiPnaeYDKEUbgxBA+QD8g8TmP+UqwhVphd8q1AfmckzgXzFAUTAmutpwLQbCa/ei+S6H
         jtwLx66SesmahP3f/W6ETacGsXCS5zHzgL5MrBiZu0cfjcvmxaAPQ4Q5I2lVEivWm14h
         BpIX7GymTOENCA0CDbf8r/o5gA1nFXWgUHretW26s9k0B9iHAhbsoLxiahDx/LpxgLS9
         4xsg==
X-Forwarded-Encrypted: i=1; AJvYcCV/rnFv0ixyZAh8HSSfAvPiTDmN/3Rvcp006R/a+ByYyiSY1PXy/QZSv12HA05iEAbTjRYwD3ZfiVQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxRbltCEVtJwNqyyx/wZ1gbC2M8X241axP/eVDFosMHvf7rVzA
	qN3wo8Mje3TDWNAXqUvbEweyD02SeX68DE/AFg7EhrXuJcGrM/rvW8/Gt7uMX/wcUA==
X-Gm-Gg: ASbGnctfXm7MhIm14jvrtAIfz7hEt7Nj0AukKefP8tO/x32k6k61Jsau9Y0PkPTQheS
	ECQX/KzPj783JmmpAUWrLAo1rILuv23ai+3nJNyIQsG5w8Bx7SQwG2VtWZRffpKDa46npmAHK++
	/f8/Kzk+FcQlBeiUFQNohCGuajP/xkMC2Zf+ErQgvUdHazeIIu/OZRivMQ7k2+ET/lYtITCOEUc
	W86sVKAx6l4Y2NLr8eAQrG9NxMLd+WPePw22k4ffOVM+gONz62+Mmm39ADJiZRbI0Tkr1N6Ulpi
	MH0FyG/31xnQndPxeCIGHQwp6sctFtz0FTm4AYAJvBP7kmZvpdfnG6dmo3UB13Z8IunhaNJ6izw
	3hSfMFWZvXFjxWIlbYBYVjUTpfkRMFZ3BvsWkRoupLA4PU4VdtoIkZeJR8jql9A0gGxE0GHrVLg
	MVLuBIbqYKQNJ2fXn9ewBPngabtX41EzDftVML
X-Google-Smtp-Source: AGHT+IEwffKWWQdtm1s2DX3N3fG9OvquoMUatTvh7F/DEHE3VOpG/zEraYvJVRoli3bWkHOunFkaPg==
X-Received: by 2002:a05:600c:19c6:b0:46e:3d17:b614 with SMTP id 5b1f17b1804b1-46fa9a9440emr211237275e9.6.1760509201493;
        Tue, 14 Oct 2025 23:20:01 -0700 (PDT)
Message-ID: <ceedeefa-c506-41ca-9dfc-76937979caa9@suse.com>
Date: Wed, 15 Oct 2025 08:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.10.2025 18:16, Dmytro Prokopchuk1 wrote:
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -217,6 +217,20 @@ void __init xen_build_init(void)
>  #endif /* CONFIG_X86 */
>  }
>  #endif /* BUILD_ID */
> +
> +#if defined(__i386__) || defined(__x86_64__) || defined(__arm__) || defined(__aarch64__)

Why __i386__? Also (nit): Line too long.

And why this restriction without any comment here or ...

> +static void __init __maybe_unused build_assertions(void)
> +{
> +    /*
> +     * To confirm conversion compatibility between unsigned long, (void *)
> +     * and function pointers for X86 and ARM architectures only.

... explanation here? More generally - how would people know to update
the condition if another port was to be certified?

Finally, with the v3 addition here, is Nicola's R-b really still applicable?

Jan

> +     */
> +
> +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
> +    BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
> +}
> +#endif
> +
>  /*
>   * Local variables:
>   * mode: C


