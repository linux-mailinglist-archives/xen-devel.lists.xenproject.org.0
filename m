Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2723984054
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802441.1212664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0oV-0006ZA-IA; Tue, 24 Sep 2024 08:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802441.1212664; Tue, 24 Sep 2024 08:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0oV-0006WE-Eo; Tue, 24 Sep 2024 08:22:27 +0000
Received: by outflank-mailman (input) for mailman id 802441;
 Tue, 24 Sep 2024 08:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st0oT-0006W8-Bp
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:22:25 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1feda1a6-7a4e-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 10:22:23 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f75e5f3debso47389821fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 01:22:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4d7a28sm491163a12.85.2024.09.24.01.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 01:22:22 -0700 (PDT)
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
X-Inumbo-ID: 1feda1a6-7a4e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727166143; x=1727770943; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iBOrs/12Qbt4sycxaQLq+j8lBJAurs9ea675jHQWW6c=;
        b=OMtliNsK6TGhvll+KiL8vp1lHqnUrV8RMqZqCSJjl9sP1FuQYAwbkxATEHdVjuLU8v
         K2kEwR4uh7DXlpEdO2xvA6TqNxwKjBaiaTC/CZ9SU1yWMF8hcXzznDtsFA/uHekw6RLL
         LHWRcwKjDFT8gdggvPqt6U+gb6x1sSrs4yHF8T08KPydF99dVpe/WxVocyvphzbQy3ho
         nHHjIHwrtvPLDX1J/4LYye6//QPq8VqHdas47iupPrXt2J5wvfPnh19d1NP5VtVSbTEA
         zWtWb6sUaA3S+Jb+XLgJ3EJRsqqUfwhXDGfzDjOnbnfKrdKWLYpv1rdZ2HXEI/3VgEbK
         HsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727166143; x=1727770943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBOrs/12Qbt4sycxaQLq+j8lBJAurs9ea675jHQWW6c=;
        b=hKmq7rpSTe++cBcixEeV+O6eQ1G3aW+fuqd9NIoe84+TpN4Wj+ZR+XFwSq/WGoV9lV
         QWM1eAydmS2iIlZZlmmMMeynVsb+XRJpAkGkMCEc1u+d8A4d1/Nf3Q714wwWBbTBsRZM
         PCDrhgBCm8nIZ3lnoMvo5YpfnuJlzvq6t2YMkn9/3v4Wr+ojh6wsYrasMfd4wik5KhiS
         7DLSRYCHOLIvYA78BgQHSKtx9I4qoLLDQ14S0LAX9G/5X3+VrS561BoDpjr8Fic0ITTp
         Xg13VABVZPLqzZLsQuxAbGG0YmsJblLqWLXxrGOFsCyGYqw8Njufsq/Wn3N6qJpBOzgi
         A6EA==
X-Forwarded-Encrypted: i=1; AJvYcCVrnYjKU7vkUv65euKkDtZ3pTO6A7lCiR7bLWF1KSOcDr13iWYFz9J/QB6Ovu/AEt8Z/cKRP0/4KG0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/t1S3Bg7rVlM+CsGAeFznmI9J2qIR81VwTMsk5y2vomt8VGD1
	pDrSqbpSP51VD7nQGVe4Sh5nFQknFBqaXTYCdtEHYmQ66fup/AhtM7Na0jd9jQ==
X-Google-Smtp-Source: AGHT+IGUNzhPbR306QkddNFfC+kCy2cROTIUQgDswzZEm9VJT7Hdug3liJp/eBdc9MPGzXqWRxnMEA==
X-Received: by 2002:a05:651c:1548:b0:2f7:52de:9a35 with SMTP id 38308e7fff4ca-2f7cb342edcmr55279351fa.42.1727166142791;
        Tue, 24 Sep 2024 01:22:22 -0700 (PDT)
Message-ID: <5926cad8-2013-4ac2-9b23-14540b010a32@suse.com>
Date: Tue, 24 Sep 2024 10:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/efi: Use generic PE/COFF structures
To: Milan Djokic <milandjokic1995@gmail.com>
Cc: frediano.ziglio@cloud.com, Nikola Jelic <nikola.jelic@rt-rk.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Milan Djokic <milan.djokic@rt-rk.com>,
 xen-devel@lists.xenproject.org
References: <367c5d95fb89e7dd3b4260f136d194a4cd0b854a.1724765763.git.milandjokic1995@gmail.com>
 <5dfa21dd5f8e968bf38fda5690964e0f1d957ccc.1727113391.git.milandjokic1995@gmail.com>
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
In-Reply-To: <5dfa21dd5f8e968bf38fda5690964e0f1d957ccc.1727113391.git.milandjokic1995@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2024 19:50, Milan Djokic wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -88,6 +88,8 @@ extra-y += xen.lds
>  hostprogs-y += boot/mkelf32
>  hostprogs-y += efi/mkreloc
>  
> +$(obj)/efi/mkreloc:HOSTCFLAGS += -I$(srctree)/include

Nit: Blank please after colon, just like it is e.g. ...

>  # Allows usercopy.c to include itself
>  $(obj)/usercopy.o: CFLAGS-y += -iquote .

... here. Could surely be taken care of while committing.

Jan

