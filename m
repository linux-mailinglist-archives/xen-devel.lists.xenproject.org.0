Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C67C86CEED
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687286.1070531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjE4-0000FD-3w; Thu, 29 Feb 2024 16:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687286.1070531; Thu, 29 Feb 2024 16:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjE4-0000DR-0e; Thu, 29 Feb 2024 16:25:40 +0000
Received: by outflank-mailman (input) for mailman id 687286;
 Thu, 29 Feb 2024 16:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfjE2-0000DL-Ue
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:25:38 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c323a2e-d71f-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:25:38 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso161669666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:25:38 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i2-20020a1709064ec200b00a3eb1b1896bsm829356ejv.58.2024.02.29.08.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:25:36 -0800 (PST)
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
X-Inumbo-ID: 2c323a2e-d71f-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709223937; x=1709828737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9UXKK7taF2IuAOWtnYqFL0txKPc2o4FeSg+6PljMdfc=;
        b=AzTPy7xrQX9ek+f+NczjXbFfA9oJ28GO5dtBAZV9FlNTxbgoFq+Nd1+t4BEbNun258
         fDFI82/5RgPeoLiBj3GBx0Eg9kilPGrIAAG9XFHHQ4N8moam/ApL09KRsWP8qcwu0YQe
         d6Qu38iMKjRlboV2QYpgxgawH0bkbh4p4y1Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709223937; x=1709828737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UXKK7taF2IuAOWtnYqFL0txKPc2o4FeSg+6PljMdfc=;
        b=N1GWQmlwZ+gmQTNlADsNlF4O/w+RwSSpdnVSCiq4xlMd7HLp4URfylz6WawLY9BK0w
         BiWKcMHeG7PyV0kBmZW80cNF/QFU95L6Igvb/wBcLPkfUBAUaGp9meF1Syx93pvIUgmQ
         OlUNko53uLtCjOWQqLgtrS+L7LGY0pJ9QKVXsCeU4qppyHcQ3QM+Y26DG8eIO9EBBNGP
         M1CHHzJrEuyb9s2W5lfCa0R1W6gbB0ldfT5wccYJsIQZmJOd9OkperF/TlM///mhwlgU
         tc6mi5PG82eV1JP//6+u5K1I4zgwoEfh4hTS2mMSoHth0OThg1Sg7O3ccOpiiUji4Z+P
         fpug==
X-Forwarded-Encrypted: i=1; AJvYcCWJi0kcZrjwe4hT9d/ee+OVx4VZC1JJTXiUuJTsT/MfjrhoTMx4jWVObJixww6wLgsdKTK0N6dTHudzts14AXX1ro/WA9KCFOpDgm/sFJ8=
X-Gm-Message-State: AOJu0YzUFzDos7OV+KSg1M8OpVJnL6YmnxtLRDE2szlbz/v6MGbELapx
	DRU4GxQMFq+mQEXSRPPtnrgsaTIaLka6gpCP34HtJV39eoY/rYv8MsNtnOeZ0yU=
X-Google-Smtp-Source: AGHT+IF1ZV9e+kn+sjn7bLId5b2WUuV9Mi+QdWmGTjSKUtT1pDREd3ZQkOBKSvy9TaPrlv4JOI8RKw==
X-Received: by 2002:a17:906:4152:b0:a3e:e0b7:90d0 with SMTP id l18-20020a170906415200b00a3ee0b790d0mr1913406ejk.41.1709223937563;
        Thu, 29 Feb 2024 08:25:37 -0800 (PST)
Message-ID: <c4332e38-9977-4ad0-9a07-eadac7045802@citrix.com>
Date: Thu, 29 Feb 2024 16:25:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/23] xen/asm-generic: introduce generic fls() and
 flsl() functions
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <df7ab5055ef08fa595f913072302770a3f6a5c33.1708962629.git.oleksii.kurochko@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <df7ab5055ef08fa595f913072302770a3f6a5c33.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2024 5:38 pm, Oleksii Kurochko wrote:
> These functions can be useful for architectures that don't
> have corresponding arch-specific instructions.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  Changes in V5:
>    - new patch
> ---
>  xen/include/asm-generic/bitops/fls.h  | 18 ++++++++++++++++++
>  xen/include/asm-generic/bitops/flsl.h | 10 ++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 xen/include/asm-generic/bitops/fls.h
>  create mode 100644 xen/include/asm-generic/bitops/flsl.h
>
> diff --git a/xen/include/asm-generic/bitops/fls.h b/xen/include/asm-generic/bitops/fls.h
> new file mode 100644
> index 0000000000..369a4c790c
> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/fls.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_FLS_H_
> +#define _ASM_GENERIC_BITOPS_FLS_H_
> +
> +/**
> + * fls - find last (most-significant) bit set
> + * @x: the word to search
> + *
> + * This is defined the same way as ffs.
> + * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
> + */
> +
> +static inline int fls(unsigned int x)
> +{
> +    return generic_fls(x);
> +}
> +
> +#endif /* _ASM_GENERIC_BITOPS_FLS_H_ */
> diff --git a/xen/include/asm-generic/bitops/flsl.h b/xen/include/asm-generic/bitops/flsl.h
> new file mode 100644
> index 0000000000..d0a2e9c729
> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/flsl.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_FLSL_H_
> +#define _ASM_GENERIC_BITOPS_FLSL_H_
> +
> +static inline int flsl(unsigned long x)
> +{
> +    return generic_flsl(x);
> +}
> +
> +#endif /* _ASM_GENERIC_BITOPS_FLSL_H_ */

Please don't do this.  It's compounding existing problems we have with
bitops, and there's a way to simplify things instead.

If you can wait a couple of days, I'll see about finishing and posting
my prototype demonstrating a simplification across all architectures,
and a reduction of code overall.

~Andrew

