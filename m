Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3CD871729
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 08:42:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688615.1073014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhPRV-0006j2-1A; Tue, 05 Mar 2024 07:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688615.1073014; Tue, 05 Mar 2024 07:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhPRU-0006hV-UT; Tue, 05 Mar 2024 07:42:28 +0000
Received: by outflank-mailman (input) for mailman id 688615;
 Tue, 05 Mar 2024 07:42:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhPRT-0006hP-Km
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 07:42:27 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9539508-dac3-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 08:42:26 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so895426266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 23:42:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 an19-20020a17090656d300b00a4536b32ae0sm2255250ejc.30.2024.03.04.23.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 23:42:25 -0800 (PST)
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
X-Inumbo-ID: e9539508-dac3-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709624546; x=1710229346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84R8AbOmfPnYlMLkc9ZNhLmmH6gcT0zgebxRsg5WjfQ=;
        b=SrLk7TwJhz+fki3YlGSVhzwg/01kJkWDU2SpZPzSR0WmmNHXgbleoN44DKhJ2lVU1G
         tnE2gcK/3eWTxBYxbbdZMef6sHJJOhFH58nsLmxaE/MWXAPCUumbLv6NSOR70syisSWR
         eQJBnsZkIfA7OiJJP10dYd5Sdg3OoUX9Z0QH4it0QJEhIehGDeovya02qmqS/vLBVeuK
         Ct99aIZaNDhSC1096Kx6PEL3lNBnPt+0QWXt2FJAFbDkCPLwo6Wz0+HjNIsq7mQm32HF
         P8jpJa9U+lL33xHJ/myACaS10DTz6pd5Re8be/xqnqMrpBkdNPsFzBf3upefmvsA+pB6
         3XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709624546; x=1710229346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84R8AbOmfPnYlMLkc9ZNhLmmH6gcT0zgebxRsg5WjfQ=;
        b=IrDECCTa+H3Zemn40eRdSZk6kINumoxVgUUOtNGEHwZ23RCnlaf2vYMVa4aw81llvs
         6BtEEjJkTgmqJbZUoWFwJR0nlUvwF2/xEjYwI+cnYXS37RkpUOUD1Nzxf4EgrvxmYZjM
         8hOL1QVlBRKsg+SFO/+kxpLitXRGqMYlGI6H/UMhG2SHMDIUx7pmp3KNpoCiKu10z/8o
         zkkTR2EOJt38+E1XRbH/0CgtiMqNkZxvrZ52naikpz7sAsVXwU1SMrwTyWiVfDM7iABc
         efZf3NJ78tai1uNfXGulXsQoh/kqBO01zM/JAVsKr53iaCa77h/2GQdvJXcf78noYfAU
         TU8w==
X-Forwarded-Encrypted: i=1; AJvYcCWRm5Le9Q75Mrx9sOaBj0U74+nn0MDnVvvZqN+dfqqkwXRSXwKffPSujo4W7vrofQgqYPp991YVb25itdnBE2rsMpMnVR7NEgdb9Hz1t6M=
X-Gm-Message-State: AOJu0Yxj0v/YNtRh91JujpyXOy9bzZYHiUrHxAcwZRstjYBV1biwnlcG
	uKWJcWH2DyROr4MZ+nXf/CPkI+TqbYBbZirJIhZuEkAQ/3krOuYpKs5GSlV5sQ==
X-Google-Smtp-Source: AGHT+IHklhmfFAaRjcsTHjyiZJriZU6JO3b03Q1Z9qAnBfXM6pafrtOwcSllgg3XAym2ERnUlk0Xfw==
X-Received: by 2002:a17:906:b254:b0:a45:ad52:d501 with SMTP id ce20-20020a170906b25400b00a45ad52d501mr95476ejb.12.1709624546010;
        Mon, 04 Mar 2024 23:42:26 -0800 (PST)
Message-ID: <f70aff01-610e-4b38-949f-f753d854b50b@suse.com>
Date: Tue, 5 Mar 2024 08:42:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/23] xen/riscv: introduces acrquire, release and full
 barriers
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <85eb894608120a05eb616cea721d24e02212a5cc.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <85eb894608120a05eb616cea721d24e02212a5cc.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:38, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/fence.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ASM_RISCV_FENCE_H
> +#define _ASM_RISCV_FENCE_H
> +
> +#define RISCV_ACQUIRE_BARRIER   "\tfence r , rw\n"
> +#define RISCV_RELEASE_BARRIER   "\tfence rw, w\n"
> +#define RISCV_FULL_BARRIER      "\tfence rw, rw\n"

... I'm not really happy with the \t and \n that are put here. My take
on this is that it is the responsibility of the use site to supply such
as and when necessary.

Jan

