Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41342C92567
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 15:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174904.1499845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOzVc-0006aA-I6; Fri, 28 Nov 2025 14:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174904.1499845; Fri, 28 Nov 2025 14:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOzVc-0006XF-Eu; Fri, 28 Nov 2025 14:31:40 +0000
Received: by outflank-mailman (input) for mailman id 1174904;
 Fri, 28 Nov 2025 14:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOzVb-0006V0-3Y
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 14:31:39 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f20bc4ce-cc66-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 15:31:37 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42b32900c8bso1282868f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 06:31:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a3e4sm10456538f8f.25.2025.11.28.06.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 06:31:36 -0800 (PST)
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
X-Inumbo-ID: f20bc4ce-cc66-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764340296; x=1764945096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mg0zxhwwpizeyW++7UeAZoLx8VEqCY4z92DFr+0rrWE=;
        b=QVyFQrSkc4SWTx4s4SX3b+NeFNMmL63NckIfnw7XcL83SGOiSc2yjt5bmwkQ9xIN8n
         6VRM0OPIWH9nZWPcg1HyqfbAUzyocBfrnFkdNUH1oPQv9ENiB9fn7Okodge9FcXx6i2l
         kjxQD8miXOw4VDbf5rhoVnjT3Qar6HVwAUs+JNJsGRi8V+mRnVxFxbUGnhPXiuKdyio+
         Ll7H5GI1MrzJgmQYy7/sB8lHOUlOs1Er9phz+oU08LxHZ9HwkIJYU3Kki/a6jNPkt89c
         nvGNgkL68OjV8Ka5iz45aqOULFrce+dlyNq8QcskxdAZHA202GiUcVWEmnKo5AAF/H8A
         YgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764340296; x=1764945096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mg0zxhwwpizeyW++7UeAZoLx8VEqCY4z92DFr+0rrWE=;
        b=n4rnkXq/UBHc4IFb0K5l61kGo1VbwSq8TI8aDAaRWPtoumz5sWXhlEH/0mztd2gMS4
         lxxxvmtSv/lOa+drkoXVTfJuF648yJyadxNzOvyKsfxyXpAtWv7l7xoc8X2F+lyW368v
         rEfaH4k1JUZ78kiV09J8qgaJ5jYWZjioEO7Vu6f2/o6mbNxjiXY4sEFedinKx4yrDsJk
         5vlt5rCSOpH7C1W4NBd3GRGvjqnN2vyJuBe6qshtBe9dHG/wKbBfz3KkRMllX6y0Yb9N
         NojMb1cX430wdV0h78GfMrji1GPy1cZKxF34Fd1R4Xqdf8391KZEH6X6zHNGiKInr8yI
         nZbA==
X-Forwarded-Encrypted: i=1; AJvYcCX6lrg8o2rwx8tQRYULll/iSK2A7Ygaw5jFMHZA5NN3sqovLQF1KwoLIcJJD/4clDTzEGzVb6E+oTc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJVpfD7IjkCw/r+6TN3UGCeRPFa73CchLDQsp0vUYROHTCGT8w
	BW9BMBNCuLC6+CMBVJ6r+00uu/jdDBagLSQxvLyupGwoT6yKfll1yLVkhjBrF1J/dg==
X-Gm-Gg: ASbGncuWa4TseVGeUWvyXIjOKW4k+orSr7KEy96K6thurdedp4ZAqRvJs/7xWrtLT1Q
	H2dmmRexNvhbW7g220/PvGdmooadnu8hDofKNdUpYRYE5bNUoIvmLUObRD6Cma0/zyRBN8QbdiL
	YbbmKMoiQnEnP2DpzZeubTjNItkVl1T68QNCX3918ovwn/u6TqAVHYdhba0B5uEge9FEdZ0XK1Z
	t7gO8fPkbDCivjISBO1V7x7zo0q/nzr/R1Zp/dzFzU/qOASlZZz7CbZoJAG/gYsxWUkeoUyuJDh
	K96N+sUqzZ2/6xbTOilX9Q6LIu4ehlCGIkhea9dlwqcRszJSEmsswhImC1hWy0xXlOkBoZf3hOh
	XCrsWFQG1h+/ijA5p7qUQ5xf9bk8Mo03RrR3GkNuRbiJVzJ3uqIwDBD6pDV/wwGv6KzjlPtfAm+
	2BfaI7zHdkm+OWRY5n3uqeg+8zvU5zcgP86PNn0mjEKRZCnts8V/YRNq8r2UblWbRN+Mq5Zv/N/
	D/xQMo8552+9g==
X-Google-Smtp-Source: AGHT+IGE3EO5syUI5YKO9YGMeJSlLp08w5pOqn9G3olav+s2jKm9tDMknenkN9s0XJOorNPT/nIJ9A==
X-Received: by 2002:a5d:5f96:0:b0:42b:30d4:e3f0 with SMTP id ffacd0b85a97d-42cc1cf0fa3mr31753369f8f.22.1764340296336;
        Fri, 28 Nov 2025 06:31:36 -0800 (PST)
Message-ID: <96c71c8b-21de-42d9-afc9-280e651a29dc@suse.com>
Date: Fri, 28 Nov 2025 15:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH] x86: have .note.Xen segment contents before other
 .note.* ones
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20251128133807.9206-1-jgross@suse.com>
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
In-Reply-To: <20251128133807.9206-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2025 14:38, Juergen Gross wrote:
> Today the linker script of Mini-OS specifies to merge all .note*
> sections into a single section .note:
> 
>  .note : {
>           *(.note)
>           *(.note.*)
>   }
> 
> It seems as if ld will use the attributes of the first .note* segment
> found during the linking process for the final .note segment.
> 
> Somewhere between binutils 2.43 and 2.45 something changed resulting in
> .note.GNU-stack being the first .note* segment found. Unfortunately
> this segment has unusual attributes: it has PROGBITS instead of NOTE as
> type, resulting in the Xen ELF parsing to no longer look into it for
> finding the Xen ELF-notes. This in turn will result in failure while
> trying to parse the binary, which will let domain creation fail.
> 
> In order to avoid this issue, enhance the linker script to merge
> .note.Xen before other .note.* segments, resulting in the final .note
> segment to still have the NOTE type.
> 
> Fixes: 6d1cc81d049f ("x86: switch to use elfnote")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder though ...

> --- a/arch/x86/minios-x86.lds.S
> +++ b/arch/x86/minios-x86.lds.S
> @@ -33,6 +33,7 @@ SECTIONS
>  
>          .note : {
>                  *(.note)
> +                *(.note.Xen)
>                  *(.note.*)
>          }

... what use .note here is. Can't it be dropped in exchange?

Jan

