Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92D8995161
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 16:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813168.1225990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syB63-0005bC-IC; Tue, 08 Oct 2024 14:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813168.1225990; Tue, 08 Oct 2024 14:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syB63-0005Zh-Ey; Tue, 08 Oct 2024 14:21:55 +0000
Received: by outflank-mailman (input) for mailman id 813168;
 Tue, 08 Oct 2024 14:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syB62-0005Zb-51
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 14:21:54 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9b03cdc-8580-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 16:21:52 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53991d05416so7001455e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 07:21:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9957d955f8sm252397866b.74.2024.10.08.07.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 07:21:49 -0700 (PDT)
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
X-Inumbo-ID: a9b03cdc-8580-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728397312; x=1729002112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GX1+YiPqsPAKXIcHCwuClTVq626JPPcid4X0DNWH5p4=;
        b=WXzMttNdcdCz1SzoG0VdtBEV82N+GEbx1qi8g3kdzINu8plbOEiKbGZmAxMqSov+Lg
         I6/zJwoSO768ghVp1+LgiW3Hc9keWMn/mtz1sR4a38VcmekBfVs3nhoJ4pNhjpXh4d9W
         YtyC2adc0/tTqdlLHPAlkkQsnzRoeGQHIhWJEnHdnel+grALEJk65lIoCZGjh+dSLncE
         /4rKQjEjvYd8qwGk3JRzUm9SKnbpb+KVBIMPrw4ZMMZ4o+44WWawz2qad5IisPRdlKyB
         SVOgxmvt6tXD1vSwhDbtJ2a/xhi1LUaKXzbQNMxMeNxnx4WorGgNghhCyhQVdCYkzjF5
         s3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397312; x=1729002112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX1+YiPqsPAKXIcHCwuClTVq626JPPcid4X0DNWH5p4=;
        b=ZGvd+g3Wi30tghTb5kyj9+H37Sx7EaBpwBRpo0T4SP1dmhGVbyR/S7C/hvf//m97+i
         t0l6hivtPHCiJjTA5wjm12Z9xirtQRhlJ5MHIh2kj+4heVEWPJGVtUZmLNmp7YslVTMm
         MP9T7h2Rj/uaIiXPYpnqF4MPxVOojrUiuese8KWj/lzhIT+AyWkjAEOf34M4a/DwyE4B
         ULonJDMWODyDNg3+87MRyQsAq4ujTtHV5CvIY4jSNBYsRGUZpt0lp+MiEtIJm+oPyY4j
         4rCXsGxw/dibH5akXSf453ngGpDpq3ww9he1LWwNBnisIvnnd65IF4Av33XiR0iqlkMy
         j6ow==
X-Gm-Message-State: AOJu0Ywn33V4ST95Wh6rn5hIlT1vm8sir9r0Uk+c/RUKjuQvJKKl13YO
	dcfiyX0rEJr/FnsDWTVfHzwuGdJiKNIO0U+0hHuuwY7YGfmWTsBTynjErZ7ZTVOb7Sa2cCfDNlI
	=
X-Google-Smtp-Source: AGHT+IGtrTNqhmXarAqNZQ9v7WNoAAutIJXFQQgkUlcm0JRoEv0kiPLOqAIFxKZaSvI6i9OY70gjmw==
X-Received: by 2002:a05:6512:3195:b0:539:901c:e2e with SMTP id 2adb3069b0e04-539ab9e874cmr10170093e87.58.1728397310313;
        Tue, 08 Oct 2024 07:21:50 -0700 (PDT)
Message-ID: <d03203bf-8fbe-4e50-bcb4-3c12eeaa6588@suse.com>
Date: Tue, 8 Oct 2024 16:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/19] xen: Update header guards - ACPI
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
 <20241004081713.749031-4-frediano.ziglio@cloud.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20241004081713.749031-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2024 10:16, Frediano Ziglio wrote:
> Updated headers related to ACPI.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/drivers/acpi/apei/apei-internal.h     | 4 ++--
>  xen/include/acpi/acconfig.h               | 6 +++---
>  xen/include/acpi/acexcep.h                | 6 +++---
>  xen/include/acpi/acglobal.h               | 6 +++---
>  xen/include/acpi/achware.h                | 6 +++---
>  xen/include/acpi/aclocal.h                | 6 +++---
>  xen/include/acpi/acmacros.h               | 4 ++--
>  xen/include/acpi/acnames.h                | 6 +++---
>  xen/include/acpi/acoutput.h               | 6 +++---
>  xen/include/acpi/acpi.h                   | 6 +++---
>  xen/include/acpi/acpiosxf.h               | 6 +++---
>  xen/include/acpi/acpixf.h                 | 6 +++---
>  xen/include/acpi/actables.h               | 6 +++---
>  xen/include/acpi/actbl.h                  | 6 +++---
>  xen/include/acpi/actbl1.h                 | 6 +++---
>  xen/include/acpi/actbl2.h                 | 6 +++---
>  xen/include/acpi/actbl3.h                 | 6 +++---
>  xen/include/acpi/actypes.h                | 6 +++---
>  xen/include/acpi/acutils.h                | 6 +++---
>  xen/include/acpi/apei.h                   | 4 ++--
>  xen/include/acpi/cpufreq/cpufreq.h        | 6 +++---
>  xen/include/acpi/cpufreq/processor_perf.h | 6 +++---
>  xen/include/acpi/pdc_intel.h              | 6 +++---
>  xen/include/acpi/platform/acenv.h         | 6 +++---
>  xen/include/acpi/platform/acgcc.h         | 6 +++---
>  xen/include/acpi/platform/aclinux.h       | 6 +++---
>  26 files changed, 75 insertions(+), 75 deletions(-)

Most of the files actually were originally imported from ACPI CA (through
Linux as an intermediary). I'm uncertain whether we should fiddle with
such files for purposes like this one. Stefano - thoughts?

Jan

