Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E2A209A5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 12:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878449.1288634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjjA-0004iq-Dp; Tue, 28 Jan 2025 11:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878449.1288634; Tue, 28 Jan 2025 11:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjjA-0004gg-B7; Tue, 28 Jan 2025 11:25:56 +0000
Received: by outflank-mailman (input) for mailman id 878449;
 Tue, 28 Jan 2025 11:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcjj8-0004ga-My
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 11:25:54 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a297bd40-dd6a-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 12:25:53 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso893716566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 03:25:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e64dc9sm748993966b.45.2025.01.28.03.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 03:25:52 -0800 (PST)
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
X-Inumbo-ID: a297bd40-dd6a-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738063553; x=1738668353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y7alizwx7J2QvoqSYm3uLLAgdmTBOrfqVVpc9TAAhGc=;
        b=J1JqM8zFD1Ls+Xx/nFEsjQSOsh39NZVNAQzZQ4wuEA+iuovm85r0fa3NRYvgnJsNud
         MixgOapEN9A/hKZWIjeK0lGwc6oDJH5pYpzquanFW2YeOjtd0Tg0B40MhcXUTY1FDtqP
         oGoDDlhVX86I4tzN3EOevQd+32ritwpOA2+/OFEx9G3GX8d+CKl/T0cuaWKbOPvny7IT
         VELxpgGKvMFh41UJR5Xvd13rjHhv6VZyQGTiCMoNjA9h03W3fs3KJIUjQn1XfZl3XiKW
         i2+bX+NDqJxP/ZzUzn45vJcv72R2gxHitCQVxppNoMyUNsw5bsFdgZZIUPYsUUn4Reqe
         55uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063553; x=1738668353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7alizwx7J2QvoqSYm3uLLAgdmTBOrfqVVpc9TAAhGc=;
        b=kA4xbb7Zxfh54VGptyUl+BZ7GD39UuftcdKegzwvqnG8bJhF44K/oenQRWpL73oh18
         OSrQAnhq+AOVZwNRNp+2p9Cidj7aNSCJQ/udPwe0KV0dC71tUB+qmKy8p4XIhvH7HsQ9
         66NHTIWmONdQ8xyICJ38BxiJIDo0Mjej63Qowfn7MNBkRhXpoWzW+Sk/lMaQCReAlKi9
         wm3N8OjGNqlSWRlpQ7+S3jYjWS4M9YG9gmnL9gdFXKrhs+awKCVWYhX/6PUuCqRMrJBB
         Dg43Dgm1jM3urPivjGWlEXRYphQyjlxYY72A/oHhwU9/ZbNnb4v/DWn2tA31rrHI8b3w
         sgYg==
X-Forwarded-Encrypted: i=1; AJvYcCUqakzeS4JoqVZ65zfWSQZYRaRsbqdJ0ag6J5qn1afRYCkqPe5fk+07F3jvOMn9/t7FFUTH0ZuEHC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9Ol02cOoSPCXGGO2BAqTOkBEIrDjyzKO5LHtPg0SXcN0RyxBQ
	X0HGjvEZ6l+1Cv/1M6M64l6HZOGr9t0DkPFLGy813gzauX2NrtwZMNUJH9IjtQ==
X-Gm-Gg: ASbGncuqhZphXVI0MzJ5D1dseYpc8VIyyCIsn9AKsg9iJfT0RwFnxtcXKWb1oR49R9v
	LRq5cOlhDcrvmUqlEND/3rHk4Mwn+OJ+qxDlsTQtva1MaCJgNVm1AX5qYy63bd5SoeBCTzJefym
	3O1t3QyCyhYm/afJwjW2w9GAYN+sdWjCRLwaMilaXf8tFyz3Lg71sloq8iCZdIVaFc4+uOh6x3d
	E3oAIFpYu8yaLc3q9dJi3wBOm/V9zVD9S4zkNEulSRLJCIqQ9CdjOO+D49vynq/BH0sw0nsLhsQ
	GB4zY2s+uzQi7f60huYClzrVT0FgvPzrgkY5YbGf/W2+YlpnNMaWracLIqbWluwzKTzXWhK4hci
	p
X-Google-Smtp-Source: AGHT+IFfXgKhqmR147q665K0a9w0YOd8HjsmQQoybBCfk+lNeyfv5fEX/MEPgFHAzmIQW8KclvJbaA==
X-Received: by 2002:a17:907:7b9d:b0:ab3:2fbc:64d5 with SMTP id a640c23a62f3a-ab38b17b9bamr4193429366b.31.1738063553227;
        Tue, 28 Jan 2025 03:25:53 -0800 (PST)
Message-ID: <5036bb98-4acf-4cc2-80c0-6031742ae14a@suse.com>
Date: Tue, 28 Jan 2025 12:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/24] xen/domain: introduce hardware emulation flags
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-6-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-6-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> --- /dev/null
> +++ b/xen/include/public/virtdev.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN__PUBLIC_VIRTDEV_H
> +#define XEN__PUBLIC_VIRTDEV_H
> +
> +/*
> + * Domain hardware emulation flags.
> + */
> +enum {
> +    VIRTDEV_LAPIC      = 1U << 0,
> +    VIRTDEV_HPET       = 1U << 1,
> +    VIRTDEV_PM         = 1U << 2,
> +    VIRTDEV_RTC        = 1U << 3,
> +    VIRTDEV_IOAPIC     = 1U << 4,
> +    VIRTDEV_PIC        = 1U << 5,
> +    VIRTDEV_VGA        = 1U << 6,
> +    VIRTDEV_IOMMU      = 1U << 7,
> +    VIRTDEV_PIT        = 1U << 8,
> +    VIRTDEV_PIRQ       = 1U << 9,
> +    VIRTDEV_PCI        = 1U << 10,
> +};

Oh, also: "virt" both in the file name and in these enumerators doesn't
match the purpose (emulated devices), but could as well include para-
virtual devices then or, maybe, even SR-IOV pass-through ones.

Jan

