Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A344BCAD8A6
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 16:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180830.1503944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScxP-0008Nz-Nb; Mon, 08 Dec 2025 15:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180830.1503944; Mon, 08 Dec 2025 15:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScxP-0008Lo-Kr; Mon, 08 Dec 2025 15:15:23 +0000
Received: by outflank-mailman (input) for mailman id 1180830;
 Mon, 08 Dec 2025 15:15:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vScxO-0008Li-4u
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 15:15:22 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5948ee9-d448-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 16:15:19 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so42808015e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 07:15:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479308cd87csm263041325e9.0.2025.12.08.07.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 07:15:16 -0800 (PST)
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
X-Inumbo-ID: b5948ee9-d448-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765206919; x=1765811719; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=33jigMewdRtBcQZeZHJNcyU8HJff9PGm416rZH/o8JI=;
        b=bG6MdZ0yQN+GF5C4eZR/9tayeOoHX7ypMc/C2Aoccfdt/9YggwqAjxUWThXHgYZmC5
         mW1OkDEmI5qhI4vneZ6Smg9mQBW8zG7P4wxeR+Nzbt2TOLsaiI0ejwuv/gUAxGKTXuzZ
         p80kwt1SBf5uUC6NMYSTFZc1F7HCi4ZY2bwaoFURpS7EEsEwJWbWt4mD1nEO23kCqqPZ
         oxTeUpzqLIl+M5/Wyc/EAc3tLhep0DnbREAqFrsLruCAlpn5P1/TDZ15VvYzcKlMqxnB
         m67kqYV6p1lwCA8LxIRfvz4vWitHiNqKSSGudebkbcJ+L9pbbrmoWkcLpqzSZsIBwctV
         vxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765206919; x=1765811719;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33jigMewdRtBcQZeZHJNcyU8HJff9PGm416rZH/o8JI=;
        b=Poz0AHk3yeaD55IdLU/L0bboUGpliPFycMXqZru5TJ7IvL2YtDuLLW5xPertMfdgKO
         dLJ/FGB8h5hx7wI9zgNeU9KxUOr4KzdKHzawe8Sz+juof+uYr3eKTUt3JD0YwYcwqx6I
         OzuHhjZgCGwOzI0yE3FSLylSUIf3c+6/n2cbaZIgbGY8AeXRpDoD4kGSIVR+5+GwTiKI
         1YDYI7QcJDJzEUqB9yflsSTxEKY60nfgr490lMr5Fuqe25vNlwPRxq1L/fZBqrFnH7g3
         MvEi9n/cg8UGZHZ2N+DN4qpyNuG6mZDMk3yvbVctjcwgUx+UmrtDT5jtLJk2laSvgsOq
         oDUg==
X-Forwarded-Encrypted: i=1; AJvYcCV0S+4letZ5jT+q+MriEZzrUQ0k7Wt+q4OyjQM2u/OoN11iAIZ2+5tOAEtcUp8lIHLducTxziMkwc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRTfs4fM/ujRSPmqGh17dWLu2A2NxM+NequYDbzOjAqcikwpKX
	GzyXY3NvaXBFqlpYH+IzmNDp0Qp6kBqZ5LM1nAZs03vSgP2lSdWoqdgpsg7K7Nz64g==
X-Gm-Gg: ASbGnctSIOq94cg75qCd/Vy14Ae1+G1pCmAkLqug0/kmX8t9rp2TqA4CGuk75cvGf6U
	grV/2X20xM9dSSYi2DDfrewmpnO7ve45O1xp+G8VvcKapKfFEOrxsnqgMIL/ZQb276S2pxzZJD1
	cZ3TJLMSoyt8XgMGg3vsEB7RGl7u3+O/Lj60Xv45EsHKMZt8mbv+k499w8ipsLfAPajnNAbfGAJ
	tbFvS+T5cp/7ZA/n/CpVKNPlEfkJ5LnIHuYwQ43svLOoz/REb4QAKpNEwoNe19jr2FpCRgejMGd
	1qzvbKqPwnhENLlFqoK2eV2mQkDQc01OueoBfZKueL7KQ8sHsq0ToAoXfME7P7YRnWYsr3jAfO1
	/cxmWBEJMKyzdXiPOUNWX/fetIWkK4wBZvhXBvW8m4Jc6kP8xDEL/f3do597IAXxouWBkG6JtAU
	WtOmcWbQtgtXlBp88jk/K+/WTbv32EgmAZYGs5rXQVkYeoUHYc05qrm6fImog4YB/K90YRjCSOi
	Hs=
X-Google-Smtp-Source: AGHT+IGnbrvO1gdgVELhw0Db7yiVvlMBWyj5KdVfXzIlqCnwoQCaJY2cMNoiAYod2Vx/Wy/hdYbiWA==
X-Received: by 2002:a05:600c:524a:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-47939dfb06cmr74621985e9.8.1765206919504;
        Mon, 08 Dec 2025 07:15:19 -0800 (PST)
Message-ID: <275721bc-07c2-4f69-93c2-e6d3022fee4f@suse.com>
Date: Mon, 8 Dec 2025 16:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <d17dcac47752681eed6703360389dd542433ab3e.1764582112.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d17dcac47752681eed6703360389dd542433ab3e.1764582112.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.12.2025 11:24, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/vsbi/vsbi-base-extension.c
> @@ -0,0 +1,52 @@
> +
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +
> +#include <asm/processor.h>
> +#include <asm/sbi.h>
> +#include <asm/vsbi.h>
> +
> +extern unsigned long __ro_after_init sbi_spec_version;
> +extern long __ro_after_init sbi_fw_id;
> +extern long __ro_after_init sbi_fw_version;
> +
> +static int vsbi_base_ecall_handler(struct vcpu *vcpu, unsigned long eid,
> +                                   unsigned long fid,
> +                                   struct cpu_user_regs *regs)
> +{
> +    int ret = 0;
> +    struct sbiret sbi_ret;
> +
> +    switch ( fid ) {
> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
> +        regs->a1 = sbi_spec_version;

Wouldn't this need to be the minimum of what firmware supports and what Xen
supports / knows about? (Assuming backward compatibility among the spec
versions of course.)

> +        break;
> +    case SBI_EXT_BASE_GET_IMP_ID:
> +        regs->a1 = sbi_fw_id;
> +        break;
> +    case SBI_EXT_BASE_GET_IMP_VERSION:
> +        regs->a1 = sbi_fw_version;

Same concern here, but see also below.

> +        break;
> +    case SBI_EXT_BASE_GET_MVENDORID:
> +    case SBI_EXT_BASE_GET_MARCHID:
> +    case SBI_EXT_BASE_GET_MIMPID:
> +        sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);

This may be okay to do for the hardware domain, but hardly for DomU-s.

Same concern for SBI_EXT_BASE_GET_IMP_ID.

> +        ret = sbi_ret.error;
> +        regs->a1 = sbi_ret.value;
> +        break;
> +    case SBI_EXT_BASE_PROBE_EXT:
> +        regs->a1 = vsbi_find_extension(regs->a0) ? 1 : 0;

At least for hwdom doesn't this also need combining virtual and
underlying physical lookup, if for some extensions you may pass the
requests down to the physical one (as done above)?

> +        break;
> +    default:
> +        panic("%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
> +              __func__, fid, eid);

Again - inappropriate for anything controlled by guests.

Jan

