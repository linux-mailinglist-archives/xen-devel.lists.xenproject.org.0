Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91319A7FC4F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 12:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941748.1341152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u26LW-0005KA-Jc; Tue, 08 Apr 2025 10:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941748.1341152; Tue, 08 Apr 2025 10:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u26LW-0005Ih-GZ; Tue, 08 Apr 2025 10:38:22 +0000
Received: by outflank-mailman (input) for mailman id 941748;
 Tue, 08 Apr 2025 10:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u26LU-0005Ib-RG
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 10:38:20 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9579f813-1465-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 12:38:18 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so3814807f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 03:38:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec366a88csm153944205e9.37.2025.04.08.03.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 03:38:17 -0700 (PDT)
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
X-Inumbo-ID: 9579f813-1465-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744108697; x=1744713497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QOGifN2tndL32LM4nhwItph+Hiq9R/seqpxXl8WVC5c=;
        b=g/IiSiEHKpw4dE4LHI/F4MiKE07FJnoHNYi63QP5VA8Tp74XAL8dO7cqANZ7PoRfDe
         8kEPa6yNTFsVNrEwEboHvbAjpGpshStnBQRUqG7HsjNI+pwI4HGG0HYAqSu9JKQK0oKa
         LE7GOFuVEO/p5AFBWhiCKP2jtsubeUipZTguQBQZvMO5kZxxlfxZe22VTiRhiY0ig7w3
         6ClcemfXvVzMECMIGWUk+H6ObN0AMeRxpngqb0JGgBI4zMV/WTp2mVoBDYfM4Ksd8mFp
         itfDuERbiIqiQVbQuzzasX8lx0cg144F/mHnHgvIlmHYR5kC2aoTwXZHKYOQmm96+Qfz
         fRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108697; x=1744713497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOGifN2tndL32LM4nhwItph+Hiq9R/seqpxXl8WVC5c=;
        b=MKwnXIVk58x0Hal/ha0gB2cI1X/gqUMW9g5u19OZr0BMSjfpgOLF16aig1/XmE70ye
         GWwb5Fe3HXd4pnxsv3E7xHZX2+fbT3TE4YICJG2aS1LR3kTU+3YDU6Jim/EtZ+4sxiKk
         HqSWuebKO0pT/EAXWygkIUKmDoCZ97QCjLGn9nn/rK4Kzj2RkZVM4om2uyte4Wc+g/rB
         pLqoBl1nd4jv6UeC0GQRVomzEBG/j50khvADDsXxAry/ybGE7wx11tmotWOVDFLj/Cq+
         SkYZPPAFveOEMJvlaTZv76cte01NELlWdVJJIeNV22agZYDzOOJFiWRyb1fmeXsXSoup
         aBTg==
X-Forwarded-Encrypted: i=1; AJvYcCVWkt0AxKb01e828hFdxPrujqJUc3/GDs9GJCINIR7+mYFxsTuQgEPZG64kgUwBFJCXLfYYO2ucFgs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkbLaHFl7VTeASICoFLqMvidjX60As5iME5jT4cj5bawhUylSe
	Nf6vOiNmHG3k56Sixix3SXjZB821240GQCA/MtUtTjk+ZLym0ujFa7D/vqNxJw==
X-Gm-Gg: ASbGnctQFjT6tfDuYXI1ylYz1K8koQy9XMAwSUyP+EQtoG2mbmBDBhF+9ONReta5ZJi
	+DlKKh/u8Jgz2QGsza83WgSPptHC0Gbk4Btni5Oqpcxs/ZdWzjpsUHtWTUYo48fsTTzM2bUAQ9Z
	t4iGNQd1zc0S/ilCyVfayYQrsWMg9i/sFFvDud8M4XLQwcWWb9f9ZQkJ5ih4p8/i1mjqpgIfuIY
	PFEZ0ZkUSpfOBz72o0P0WvXSNIegFHlOr07G9PtE5Zjbm7UePzSXI5nAYoh0JKpilklXzn3Na8W
	yN5fnP2kdmTAMNcs8Nd2IFRSOYenIjjQL2kIQ/9POhsR3K8W9ljk0JqeOcZar+wVCJmjFaUNCv1
	B/vW+s64WPuaVARoREfGUVcczkdjsdw==
X-Google-Smtp-Source: AGHT+IFMf70AmrZeLVqTZi1h4vApcbbDcFyY1dde2gQca55QZMuz2kTS8AV1N+9a31RVBV1B/RLQdg==
X-Received: by 2002:a05:6000:40ce:b0:391:2db0:2961 with SMTP id ffacd0b85a97d-39d0de6291cmr12484355f8f.38.1744108697634;
        Tue, 08 Apr 2025 03:38:17 -0700 (PDT)
Message-ID: <54d1d04a-e2b5-449e-97d9-8888e5b0f5eb@suse.com>
Date: Tue, 8 Apr 2025 12:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/1] tools/libxl: search PATH for QEMU if
 `QEMU_XEN_PATH` is not absolute
To: Hongbo <hehongbo@mail.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20241223031753.13709-1-hehongbo@mail.com>
 <20250330160304.20899-1-hehongbo@mail.com>
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
In-Reply-To: <20250330160304.20899-1-hehongbo@mail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.03.2025 18:03, Hongbo wrote:
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -331,9 +331,43 @@ const char *libxl__domain_device_model(libxl__gc *gc,
>          case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
>              dm = libxl__abs_path(gc, "qemu-dm", libxl__private_bindir_path());
>              break;
> -        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
> -            dm = qemu_xen_path(gc);
> +        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN: {
> +            const char *configured_dm = qemu_xen_path(gc);

What about this returning a filename with a path, just not an absolute one? $PATH
shouldn't be searched in such a case, should it?

> +            if (configured_dm[0] == '/')
> +            {
> +                dm = configured_dm;
> +            }

Why is this and ...

> +            else
> +            {
> +                const char *path_env = getenv("PATH");
> +                if (!path_env)
> +                {
> +                    dm = configured_dm;
> +                }

... this needed, when at the bottom dm is defaulted to dm_configured anyway?
You could set dm to dm_configured uniformly up front. Furthermore there's
then no real need for dm_configured then.

> +                else
> +                {
> +                    char *path_dup = libxl__strdup(gc, path_env);
> +                    char *saveptr;
> +
> +                    char *path = strtok_r(path_dup, ":", &saveptr);

Main reason I'm replying here is this one though, where CI found gcc to
object:

libxl_dm.c: In function 'libxl__domain_device_model':
libxl_dm.c:356:31: error: 'saveptr' may be used uninitialized in this function [-Werror=maybe-uninitialized]
                         char *candidate = libxl__abs_path(gc, configured_dm, path);
                               ^
cc1: all warnings being treated as errors

The compiler can't know that path_dup is guaranteed non-NULL. Hence, if it
can see (part of) the implementation of strtok_r(), it would observe that
it's possible that the continuation-invocation path is taken, where
saveptr necessarily is consumed.

Taking together all the issues I think I'll revert this, for you to make
another attempt. It may have been a mistake to commit such a change anyway;
I might better have left that to Anthony.

Jan

