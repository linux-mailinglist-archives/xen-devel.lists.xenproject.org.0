Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D55808A3A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649915.1015027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFDo-00059u-Vq; Thu, 07 Dec 2023 14:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649915.1015027; Thu, 07 Dec 2023 14:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFDo-00055y-TE; Thu, 07 Dec 2023 14:19:24 +0000
Received: by outflank-mailman (input) for mailman id 649915;
 Thu, 07 Dec 2023 14:19:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBFDn-00054q-HO
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:19:23 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d4c28a6-950b-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 15:19:21 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c2c65e6aaso4432555e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 06:19:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b0040b40468c98sm2088870wmq.10.2023.12.07.06.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 06:19:20 -0800 (PST)
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
X-Inumbo-ID: 9d4c28a6-950b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701958760; x=1702563560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=doRANLjcoXrCYPUIloK+IhgW8Mz4CcE4MucErzH0S2I=;
        b=F6jsI4CNr3FHA7+FKndvPFrmVWo69Sf/ndrO9DMgRYRMVzrStG9MUAaU9TQwf9FFwq
         HxJFiLh/P2m5/0/G0WTMQ4d3v2kDXjXj3M2VPCY/kC17zi83nfnlkTB4bYIWQVq2WFlE
         SCUzxcLcgqsOjb2axkF2eMAmsM07kagM8XXHKiixwmpeisBGMCKm8GUalgY6lExbGB2J
         xoelbcQaOkmaVh0P+OjTstH5fwg/ppSTtCz1HTI6sLYe9Vp+GnnPYOuwNxlm7G3Oqpl5
         6sTawXl25miY3sL2WiPVmMkWPkQAVJow6nQif+tzAH4DRm8bSQ5pdiLDazJaLi0wYAvX
         Si9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701958760; x=1702563560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=doRANLjcoXrCYPUIloK+IhgW8Mz4CcE4MucErzH0S2I=;
        b=hOWXJlNqRlxnxJjb9XQQEFG3xwLl1mzzuIII6Ww7zQTcRCTO6gpsG2oYAstsKE1Vf3
         HD18FqdRzc9JF40Hn1fGWXC6DCYZHzJQ9fo9ZFj88N2DoV8lvtJ6HyQEkJz+6cAEI7aN
         dr9cjR2rVYjMySzRENk2TUB1CC+xoBaPjErM8a+Z8l3vGHYsVeKpd/bSvIuMD73d1qte
         0TaeuIPY/nbzfROI5JAd6B+WzxECntAC7vronBASDddQ8fFUjHsUQ6WS7vhs3b+jOvIx
         GqodyJuvbmNBgMtp0Y5DaUiZp+m6HNEMeKaY/R7O91qs7ocq84l7tUt6U4+tQBIe2voQ
         NVKg==
X-Gm-Message-State: AOJu0YwF4l+K0KJVQiZkNvWLdhUyXgrXRE9YOpxaya9MNIg5yuVKvCN4
	nmT4ciM9z+Miorh/0pdD04fS
X-Google-Smtp-Source: AGHT+IG/GShB10XE+G6O4bNk7CeTgbJbxqikjJ92zlEKWWNgA7wztSvMJcQBvITTy5kOX8LG9WTiqg==
X-Received: by 2002:a05:600c:1c01:b0:40c:1c02:6b40 with SMTP id j1-20020a05600c1c0100b0040c1c026b40mr1352361wms.37.1701958760655;
        Thu, 07 Dec 2023 06:19:20 -0800 (PST)
Message-ID: <3959501d-9696-4791-bf04-d394af255bd2@suse.com>
Date: Thu, 7 Dec 2023 15:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/39] xen/riscv: introduce asm/cpufeature.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <b8fcdd22462ffa71a058e63dbf874dfc858264df.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b8fcdd22462ffa71a058e63dbf874dfc858264df.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Would have been nice ...

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -0,0 +1,22 @@
> +#ifndef __ASM_RISCV_CPUFEATURE_H
> +#define __ASM_RISCV_CPUFEATURE_H
> +
> +#ifndef __ASSEMBLY__
> +
> +static inline int cpu_nr_siblings(unsigned int cpu)

... for this to have return type unsigned int, but I see you're staying in
line with oddities elsewhere. Just one more place to touch down the road.

Jan

