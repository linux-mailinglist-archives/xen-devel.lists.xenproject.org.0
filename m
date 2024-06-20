Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5123890FD39
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 09:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744178.1151175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKBm9-0003kE-63; Thu, 20 Jun 2024 07:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744178.1151175; Thu, 20 Jun 2024 07:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKBm9-0003gp-3A; Thu, 20 Jun 2024 07:00:05 +0000
Received: by outflank-mailman (input) for mailman id 744178;
 Thu, 20 Jun 2024 07:00:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKBm7-0003Mg-EZ
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 07:00:03 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b68fa577-2ed2-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 09:00:01 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52bc035a7ccso532680e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 00:00:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7063348ab67sm2306960b3a.66.2024.06.19.23.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 00:00:00 -0700 (PDT)
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
X-Inumbo-ID: b68fa577-2ed2-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718866801; x=1719471601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oc9cQ/GcKk5FRUciRDd9D/g4Z2yaCdrLK01VtJraBPc=;
        b=S1XcTQLY/+zP/nH2VEZbizbFKhhFfVZF+mn5UaHqZSY3AWI/PnOJYTdl4AxnWwhJMZ
         lmur1Iq2Cms0KOqLsSCNR1gp0OE+sF3dq2p7WSfiJpvZINpFyNy+yNqWHNCtcnzH4guW
         P24Xudax0dmxXXu50KqRzqaLiU09yi+cRht5BnDlT2/HNHywB77BX8ajCL6llPQQYBRK
         7VzUcMeNBQp6CjzhEeqQ+u1DtiR+UBmPbfkMyUOP1N9U6nmjp3Hx3QTnhU08AGB8eS17
         sEuQSWNVpJEIKltkHuTJaZfCoZDd2Kif7T2TjxNsQLKepttgHiBa3nB902xBd1A4iYDt
         4UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718866801; x=1719471601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oc9cQ/GcKk5FRUciRDd9D/g4Z2yaCdrLK01VtJraBPc=;
        b=Pb6w5NhO4MLNq6H7sCRCOZasK0xTv2LjZjICsSOj1hDbdyTktCa3y1RqIFuP8nm3Vw
         pRzrc0u3xGI8/c/KAXPhWjJSV5o9Mbpi+fuhl0Py4mRrK5H+aMCYg4s21i74Oxfo3aio
         mt6vA6VLfdM7y/Ppro4lSm4iOaTDPaHatbUOlipmusmPzMQtgbt1dt9hNMuZlZac5RqI
         Uv5ksUrVzqLhCjbB5qLGNNcVR7EnbIbb95H88zLCO6aCLCpSH2SOxyUbUDciCWWoGrme
         FfhUSB1mcfU4L8OiB+cWjbWEKkwzvUJ0Fr436X+OYeFg4toocVGJx0RdFoEatrMRj3cu
         DxyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi6NgebfhvjBW1eXZsGm8s6ICeq6yBnkwXyWliZ+lTnZlCVlxJKPEeEGhJLP645GoouIovJR2wyzpn2eScl2rFxYpREWgQ0Paj/oCDA00=
X-Gm-Message-State: AOJu0YyxOqQ3z3yAU6V1u/M/5esJrnK7HW1H954Xd9oAzoFqaaSeBoj2
	bLLmucvbQn4yYcZsdnT7pAV6sZ+dPjAIF6k71CItoJMD3O/TJLndGhnZvZJdKQ==
X-Google-Smtp-Source: AGHT+IE0hulWbwf4yVkfW/zSomLOcUZ46NcYQkXOAHHYJhgkCz7K4wVG9rHkNO6iXzsvKoaDs24PWw==
X-Received: by 2002:a2e:914b:0:b0:2ec:174b:75bf with SMTP id 38308e7fff4ca-2ec3ce9f6c0mr28788051fa.4.1718866800778;
        Thu, 20 Jun 2024 00:00:00 -0700 (PDT)
Message-ID: <ac007fbe-3324-4b7a-a7b9-0ff32c3131bc@suse.com>
Date: Thu, 20 Jun 2024 08:59:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/guest_access: Fix accessors for 32bit builds of Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240619163100.2556555-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240619163100.2556555-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.06.2024 18:31, Andrew Cooper wrote:
> Gitlab CI reports an ARM32 randconfig failure as follows:
> 
>   In file included from common/livepatch.c:9:
>   common/livepatch.c: In function ‘livepatch_list’:
>   ./include/xen/guest_access.h:130:25: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>     130 |     __raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
>         |                         ^
>   common/livepatch.c:1283:18: note: in expansion of macro ‘__copy_to_guest_offset’
>    1283 |             if ( __copy_to_guest_offset(list->name, name_offset,
>         |                  ^~~~~~~~~~~~~~~~~~~~~~
>   ./include/xen/guest_access.h:130:25: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>     130 |     __raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
>         |                         ^
>   common/livepatch.c:1287:17: note: in expansion of macro ‘__copy_to_guest_offset’
>    1287 |                 __copy_to_guest_offset(list->metadata, metadata_offset,
>         |                 ^~~~~~~~~~~~~~~~~~~~~~
> 
> This isn't specific to ARM32; it's LIVEPATCH on any 32bit build of Xen.
> 
> Both name_offset and metadata_offset are uint64_t, meaning that the
> expression:
> 
>   (d_ + (off) * sizeof(*(hnd).p)
> 
> gets promoted to uint64_t, and is too wide to cast back to a pointer in 32bit
> builds.  The expression needs casting through (unsigned long) before it can be
> cast to (void *).

I disagree. Instead I'd like to raise the question why these two local variables
are uint64_t in the first place. They accumulate buffer size, and hence ought to
have been size_t from the beginning. I'll make an alternative patch (first making
sure I test livepatch building not only for x86 and arm64).

> @@ -65,7 +65,7 @@
>      /* Check that the handle is not for a const type */ \
>      void *__maybe_unused _t = (hnd).p;                  \
>      (void)((hnd).p == _s);                              \
> -    raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
> +    raw_copy_to_guest(_p(d_ + (off) * sizeof(*_s)),     \

It's also from an abstract perspective that I disagree with using _p() like this.
We'd rather keep this as straightforward as possible, to keep down the risk of
hiding bugs by excess casting.

Jan

