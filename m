Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E9987F6F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 09:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806083.1217398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su5On-0005r6-2y; Fri, 27 Sep 2024 07:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806083.1217398; Fri, 27 Sep 2024 07:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su5On-0005pb-0I; Fri, 27 Sep 2024 07:28:21 +0000
Received: by outflank-mailman (input) for mailman id 806083;
 Fri, 27 Sep 2024 07:28:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1su5Ol-0005pV-Id
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 07:28:19 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 102b72b8-7ca2-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 09:28:17 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso2223290e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 00:28:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2947a7asm93258166b.103.2024.09.27.00.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 00:28:16 -0700 (PDT)
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
X-Inumbo-ID: 102b72b8-7ca2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727422096; x=1728026896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hwJYOeYxGA0OuEWQ0NxuMMwMLgp2SfUmSQIu+HJxyuA=;
        b=MKMa7XflsdYa6oDWiuwKb30gXxaFrUe+rd4sOE8CP0kV28iMvM/92QMSmCsV47pamF
         xVfXQ0pdd+BB2foqiTrT0pASSjghlzvWkhnCPDMjx8dGugXtcnD08mUlnQw/9P6OUxBt
         vVt+4B5627IvdLHuDP+J5tO2cm51Fyd9pEVwNInxbSqonwraQaCiGC9GPmE4NeDcAfTr
         X5b9rUu/XI+mmAF63p4FWr9+9hYyv91uBuAAi09xZNh12r6buQf/cM7sGUc05h9TtNXK
         rayzttx7I/5ySMU//85+eXWDb2eEWkvI5fzY0wPonMw1UJ+8AoXK0SKA58JbYqE6dx0m
         Q5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727422096; x=1728026896;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwJYOeYxGA0OuEWQ0NxuMMwMLgp2SfUmSQIu+HJxyuA=;
        b=uKZUV0ld8W9F+a51Yna+5uTtHWkufCXXoakp7q1mMDJTp5TDgwGEM2MSDPojnc2ijc
         n2+vXtoW2TuGS8ExIXXeLfX9T3Wswtzvv1hQgo0iBLVyjs3EfTV9z0bBkrRf9M1vWKa/
         /Saevxv8Rs3aGqJlfg4hwegKM5xORiOFOcnCW3jWh/kXiOa/8n65d3fVayIfIQraBDFN
         7S/f4IWsgtf/olVJTd0VRehnzO/7QKb/3mM6OrBa/Y1+rhb47QzSIrbFeZldR+x7B8Re
         VNHoYDhafdMW8FxV9Cyz79cLSmEfvvoKlB+JdnmXIRrbjkqvza7ky/zDlhcDkN1Kkv3n
         +5hw==
X-Forwarded-Encrypted: i=1; AJvYcCVyw5a126pO32Yohzs/vrLwRhBBWrM+26JA17XJl4luZFhQhkQNigdptO5Ww9tdvclp6tIpmxAKbmY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPWqGEb7zZQZ0WNqNezT3L6CyYIDMF/icqMKBeXDzLmNDiKnoF
	Lm+ysJj9anD/r4iK1QUS9ifNcGCJ4frWBFj7fGsugLTsmfnxryK5o++7DQMMOA==
X-Google-Smtp-Source: AGHT+IE85zPRnNTQ7+z6zKZyRvexj6ZJgacyi8F8BXJ5fpei9ZaBn/NWdqRVJlmEn7/6Z336Z1v2Vw==
X-Received: by 2002:ac2:4c43:0:b0:52c:e10b:cb33 with SMTP id 2adb3069b0e04-5389fca3ae2mr1758892e87.50.1727422096425;
        Fri, 27 Sep 2024 00:28:16 -0700 (PDT)
Message-ID: <18b146cf-c49f-4133-ac21-b710bf59d113@suse.com>
Date: Fri, 27 Sep 2024 09:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] xen: define ACPI and DT device info sections
 macros
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
 <c5fd649a4ccd3a65a81dfab505fc99b2a679cda6.1727365854.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c5fd649a4ccd3a65a81dfab505fc99b2a679cda6.1727365854.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2024 18:54, Oleksii Kurochko wrote:
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -120,6 +120,14 @@
>  
>  /* List of constructs other than *_SECTIONS in alphabetical order. */
>  
> +#define ACPI_DEV_INFO(secname)  \
> +  . = ALIGN(POINTER_ALIGN);     \
> +  DECL_SECTION(secname) {       \
> +      _asdevice = .;            \
> +      *(secname)                \
> +      _aedevice = .;            \
> +  } :text
> +
>  #define BUGFRAMES                               \
>      __start_bug_frames_0 = .;                   \
>      *(.bug_frames.0)                            \
> @@ -137,6 +145,14 @@
>      *(.bug_frames.3)                            \
>      __stop_bug_frames_3 = .;
>  
> +#define DT_DEV_INFO(secname)    \
> +  . = ALIGN(POINTER_ALIGN);     \
> +  DECL_SECTION(secname) {       \
> +       _sdevice = .;           \
> +       *(secname)              \
> +       _edevice = .;           \
> +  } :text
> +
>  #ifdef CONFIG_HYPFS
>  #define HYPFS_PARAM              \
>         . = ALIGN(POINTER_ALIGN); \

Michal's comment made me notice that I overlooked the section names being
macro parameters. Why's that?

Jan

