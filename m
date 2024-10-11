Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4D99A433
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 14:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817032.1231137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szF68-0004VH-NA; Fri, 11 Oct 2024 12:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817032.1231137; Fri, 11 Oct 2024 12:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szF68-0004Tm-JI; Fri, 11 Oct 2024 12:50:24 +0000
Received: by outflank-mailman (input) for mailman id 817032;
 Fri, 11 Oct 2024 12:50:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rzrJ=RH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1szF67-0004Tg-8D
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 12:50:23 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 608e6ab3-87cf-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 14:50:22 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a995ec65c35so197192666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 05:50:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80c00bfsm208864566b.128.2024.10.11.05.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 05:50:21 -0700 (PDT)
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
X-Inumbo-ID: 608e6ab3-87cf-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728651021; x=1729255821; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CJpbGtclRoQ9R594jZ72P9M9LhVzwa9iNk8sbJoA4To=;
        b=XMfQddRrAf+O1/Lmoyi/kOJ1xW6j6z9Y/2zNsZumTwgNAnCmuYsd5atszel4n8xIlJ
         P6RgXHe0Q64yNLrlKOTC20vyZKeCbmhc7CNlH0aArakOiAcJxO2u+qX/d2oT0o9g2qg8
         cBGDc8avjUOIs80BF97zsxpvtEb5PDRW4WbgMiV6BbO1R0FGjkZendCz9MqQv1mITYaj
         /MN8W3a34r2mQ+S7Vt4y6IFZT4G8mMG5TKPg4mXPw7K9loQKuScgjtg59Q58njMZPDB+
         BViliFZMZHzSLRmBWa5EQPufX9vAtNW8d1DBoYDeKtpE5Lw0/3Y6RdDm3yj8GxKAfDuB
         W1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728651021; x=1729255821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJpbGtclRoQ9R594jZ72P9M9LhVzwa9iNk8sbJoA4To=;
        b=Dbz0kk3gk/75y3z1wDYUAnP0dPGnl4MMUZ4Ruh59oK8IWdtZs1DdnPXP80XpzsqMfj
         uMqFkfOLaMoAm1/gEXoBxrGyr2VvhxONx+BN8r+GkTGVI555HKUVLkNe7lkg9pjqvws3
         TTwljJ9QeG6bdlxvL2sSiYKwaDdH7lcIUMNdQyvtWF4UtUSf65D+XEV1pY9U2VRUJgxQ
         RgHu8fTPkzN2zD5A2fcIbdMmV4RVsXQemM0iPN7h+Ogt1fSFhxILCx0E3qcZvGxZ1top
         1ucrmTzb2WPR2Jj5ooW//5QAw+kmoKbh4+ARukPDCcHN/0kL8hCRScxUAaa2RN2KJzrC
         7/fw==
X-Forwarded-Encrypted: i=1; AJvYcCU6M1tbTvLG6DVuofY1KbNuAE+3yczSD+it4+4oNN4z4cwlokMkN2MBOfyOV+V+umC35wGWVpkZkT4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBy1p83q7yEiP+mfeVL7qm3MIkHLJ1eHarCVrnKFNczAE65Bxe
	ys0828SR8BYx0kc4O4gyNK0CDlztkmgEisIMtCelqVWKCqWGIssM2SsWPEpRyw==
X-Google-Smtp-Source: AGHT+IHR4JWOUdrlxR5cX2stPfbBdiac/WjKehZ8ZM5PVOoVUvCGbi1LtZzN45msuo3ATtHB+FlNOw==
X-Received: by 2002:a17:907:1c1b:b0:a86:6a9a:d719 with SMTP id a640c23a62f3a-a99b89f50abmr245784166b.29.1728651021457;
        Fri, 11 Oct 2024 05:50:21 -0700 (PDT)
Message-ID: <14eb87b1-76be-4c02-a32b-2d349c6c0f57@suse.com>
Date: Fri, 11 Oct 2024 14:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] x86/boot: Reuse code to relocate trampoline
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241011085244.432368-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.10.2024 10:52, Frediano Ziglio wrote:
> --- /dev/null
> +++ b/xen/arch/x86/boot/reloc-trampoline.c
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/compiler.h>
> +#include <xen/stdint.h>
> +#include <asm/trampoline.h>
> +
> +extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
> +extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
> +
> +#if defined(__i386__)
> +void reloc_trampoline32(void)
> +#elif defined (__x86_64__)
> +void reloc_trampoline64(void)
> +#else
> +#error Unknow architecture

Nit: Unknown

Can likely be adjusted while committing.

Jan

