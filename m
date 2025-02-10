Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EFAA2EA35
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884707.1294446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRSw-0001Yq-94; Mon, 10 Feb 2025 10:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884707.1294446; Mon, 10 Feb 2025 10:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRSw-0001WY-6C; Mon, 10 Feb 2025 10:56:38 +0000
Received: by outflank-mailman (input) for mailman id 884707;
 Mon, 10 Feb 2025 10:56:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thRSv-0001WS-Ay
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:56:37 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b271e6d9-e79d-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:56:36 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5de5bf41652so3457502a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:56:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de50148591sm5713521a12.28.2025.02.10.02.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:56:35 -0800 (PST)
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
X-Inumbo-ID: b271e6d9-e79d-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739184996; x=1739789796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zd6PVhPPD416+WA3hM49Kwgw8U4P/Y9132Wq0sUm5mk=;
        b=ET5CxGa/LMuoiQqiDWwwZFED7p4MOfCz4qLQWx6CLm9McpTkx1dnLrewyhhN5E+Vy4
         lsSq5qDnczEB7ooB4zIZ9D/YW2bWe1RMPeRxqnUBSy/UAgYLTza4diqOhBqnrBejrA7w
         0xomdUbom6KYctOSkcXmwyvHnn05lcvxtLOCdGrnj68v6wWCBfk00/pH9oGNFX51Tfw/
         BCZ8Nc9e7DtvZ4xm+Wxbh/hSae72JRCGU5WWP7sCGFuOkf+ty3iSWo3c0sh5p+BoqLDZ
         vo53Hjqr6k2iDa3qbTawUQlwxajQqcd9c3ecQIesBtnojIL+S2k/wSuwcOYhcmdoanEQ
         ctww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184996; x=1739789796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zd6PVhPPD416+WA3hM49Kwgw8U4P/Y9132Wq0sUm5mk=;
        b=Wui9J/lPR4nPFikeaXs0laVRVP2F/r67uaWfMYgxD/+NmRpZ4cnA3S87dgDmTTvZbn
         GmLFVa2rHlUI1dbIY0SYDmTL+ZKvxqYKXd5QmdsJ+YnFt5UrZcBtw1NJM251BEJ9vH9x
         wanysWrK/JjuS5jwqM0XWpmWcK1+0I7Rx4HxhO/wwSVA7BxSnCW0wXMSoXzh1ksJ5w8f
         KXMLA374L9YY9uGlki0N5XOczCeTXmcrRLgQ74is+JRg5IDXqAECyq4Wg1Ewgnb61UA9
         xZNBLfAIwsm/Jp0wHAaNKVyi57qNVUwZCxLV4TiaYOrFLrcBD4W9pYwMZQP57LWuEYGu
         KAog==
X-Forwarded-Encrypted: i=1; AJvYcCXaSpwd9IRISHTyr1a+7ka0I4jyl8s2oZHVGHAgSpYkGf6JU9WcLsUGqR8blAXP86SGZP9rtiGFr+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaFJdd6ejI+D5ATMRg41bM1YJ+EQnxSWGzFbCZc/V9eDfE+H6M
	EpNMN0HqexR29aG2XQdJ3pxA4NfxQoElWXBHKtrJqHJ/aITIxmACTtjRkXTJag==
X-Gm-Gg: ASbGnctg3/nBMLd6TlzfBfsaQFSgQiFZWEUTEGA7a3qLlUtThPpxRm6K9DVDfNm8kgR
	iVHmLJM6zEe48RFm7E1ty05RFg8Ufnsv7fdffgzmTP7SQ1OUigfmA2cRkPxmA0wHSU9uXKerqDA
	ogmtKDfhcOfK6omgNPlPlRVBjHegf435vuJBNUCN2WaObV3A1mkdafJdU1jkOKqWZw3/pF+Z9Tq
	k92T2S1/bYPoxSaYN187YddFWEXEVLa99ZCXdF8ar4TEm+aIRY0JsPPiNEJGg6arBfMBsErjj3X
	km3pvnwwNvMk/tCj2x/rplj2fwXL9GbWQjF2inz76wRNpDuLyFQQy0cEztL3mqgpRoNY5mGOVDX
	B
X-Google-Smtp-Source: AGHT+IFqV0yKs8/C2XH1pLvI8sizZrzpGk4xbOYOGuY0ZCgL8umwCeGLvu7DHbqMQUkwmi3H+ydh4A==
X-Received: by 2002:a05:6402:5252:b0:5dc:5a34:1296 with SMTP id 4fb4d7f45d1cf-5de45022b20mr13855460a12.16.1739184995537;
        Mon, 10 Feb 2025 02:56:35 -0800 (PST)
Message-ID: <57a595e3-9b90-41e6-8116-94b77ccba615@suse.com>
Date: Mon, 10 Feb 2025 11:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <9950eff2f8344c5d658def7d2c6d7fc010607498.1739182214.git.mykyta_poturai@epam.com>
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
In-Reply-To: <9950eff2f8344c5d658def7d2c6d7fc010607498.1739182214.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.02.2025 11:30, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Enable the use of IOMMU + PCI in dom0 without having to specify
> "pci-passthrough=yes".

Why? It _is_ passing through, even if Dom0 is special.

> @@ -83,9 +84,9 @@ static int __init pci_init(void)
>  {
>      /*
>       * Enable PCI passthrough when has been enabled explicitly
> -     * (pci-passthrough=on).
> +     * (pci-passthrough=on) or IOMMU is present and enabled.
>       */
> -    if ( !pci_passthrough_enabled )
> +    if ( !is_pci_passthrough_enabled() && !iommu_enabled )
>          return 0;

I can't reasonably judge on this adjustment, but ...

> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          struct pci_dev_info pdev_info;
>          nodeid_t node = NUMA_NO_NODE;
>  
> -        if ( !is_pci_passthrough_enabled() )
> +        if ( !is_pci_passthrough_enabled() && !iommu_enabled )
>              return -EOPNOTSUPP;
>  
>          ret = -EFAULT;
> @@ -57,7 +57,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_pci_device_remove: {
>          struct physdev_pci_device dev;
>  
> -        if ( !is_pci_passthrough_enabled() )
> +        if ( !is_pci_passthrough_enabled() && !iommu_enabled )
>              return -EOPNOTSUPP;
>  
>          ret = -EFAULT;

... these two certainly look wrong to be made. If an Arm-specific adjustment
is needed (and can be justified), a per-arch hook may need introducing.

Jan

