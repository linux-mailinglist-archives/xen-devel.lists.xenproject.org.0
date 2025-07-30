Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5642B15D1E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:50:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063638.1429356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3Rw-0005Jc-Ej; Wed, 30 Jul 2025 09:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063638.1429356; Wed, 30 Jul 2025 09:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3Rw-0005HB-Bj; Wed, 30 Jul 2025 09:50:16 +0000
Received: by outflank-mailman (input) for mailman id 1063638;
 Wed, 30 Jul 2025 09:50:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh3Ru-0004GR-C4
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:50:14 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96842af4-6d2a-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 11:50:13 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b794a013bcso1340012f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:50:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63e3bfa3sm1529980a91.37.2025.07.30.02.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 02:50:12 -0700 (PDT)
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
X-Inumbo-ID: 96842af4-6d2a-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753869013; x=1754473813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fwoQ2TwyjLtj0hLzWSHmlSFAufd6WtmY/FQGMWkLSLQ=;
        b=EIpqAlyrIBBU1HdTrs9EGLX2wz5E2cy9e+msOK8Ila5+5GJXMSDqST9BU/8jiXadlb
         wOBXuACulOXOYV3Iq4oZPFl/HFuL77kOu2SdRIoRl7bIatPAVLwkRHOL5DzA3JrngXQp
         Sr58rIwmt+bCtLeckSBOyuSVBuVZ3jtIhTc18icPPuGmmkZfNnZ1lx2+W7KeP+mgwWx1
         wHuunpJL97tW7O3Lmdk5F/lMizoYCSRRkxVtm4ZAgkg0VDLL1RMVinZFt7QWDwxgNkDK
         0nvUsYdb/rMbf4UzumCW7dy0mUkt2jJfr9FQb/We+u2AkH9QDcmxV1sQGXFVrhUBdRIt
         gCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869013; x=1754473813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwoQ2TwyjLtj0hLzWSHmlSFAufd6WtmY/FQGMWkLSLQ=;
        b=J0DDnP0wgkhF0rmPTL4rqt/kyFehvCOz8k3cuK2DJhBxgq4vF5c880t//lE5elZxYj
         W3+bB3emR6cwzuIGqMD9J2oWzG8B39+tUGGaRjt/V3j2f+uhcj/HO0cXlheT+55m7EAh
         3YEDc8vT90DYrBmCMZFdIQV+3oZPtVlmdaq2IbSV/BreteUqTpCoGxTl2FOf5uGCsC1a
         qkNVGUITBF4+PZ2tPjvaS58OmQSyeBNHHBbjAMFvMxyx4oD7VEgnQK7mS1eQbVDqCXE9
         /YiRIX5Z0i9ZIkAtcb0k7QpUU8Y3rboh6CJcpPvNGivz6aQQuf8nnVyAaTCaogm8jZlY
         XExw==
X-Forwarded-Encrypted: i=1; AJvYcCU0ZpToP/xVMMq09/lkXyvgv4wvRspSBFrR39QhMGl7EIcV2m4URhHYjeH3DQVP/1eFQUhqlFgtmn0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAAZEm7Otk8WhgVAjlZxCbdhzdQaKuJQ/YIUKTM7KX2CzxINhk
	hDTKsMc0DARGJCNsgS7ZOICtink790NNX9zYPl4juVii1fCVSUas7lI5qfAFMX0KFA==
X-Gm-Gg: ASbGnctGXiJc/0UWZi2X0VZcxVeHXuqoXp2IIQlxIbv6DhGi81RZfqlsAQk4cbITA/y
	FEX5y9kH55wj/NiS0B4ckfbs68yUo+9CWrqBvHJN95hG/VF6ywgjue0n1ZiA9rUJeWuAO3YzZYL
	M6vOLTSEuIIfMRsm710mR722h8vITkWPzoPNloCnxxHFTAjFUIkT4hl7Oj8NtFnF0N5QrrmGcka
	t3Ekz2WKeFNYTqVHciUf1PX8Qhfi7iyv42XeS9ybw4PsCCaDFa7ROY+irKUkRnLPIvWw25y7oqr
	fKjzR6tn22vuB9Mfv/mvM2du1fwR6YVwsieWHOUecMtK9yM8SGSa2VpOG8FeTp4ifmTs9Wg7f45
	9tACz4t2mFpOpaGuuvfqwkxmYAjSJt6AibvE1plBuHyTn0/3qQh5x6DHHv4S8eWiTh3n9SmQz56
	jOKHseferwVz05gJH6xA==
X-Google-Smtp-Source: AGHT+IHkcvTToEA1xez030+IRXSd23bRE2RbAuTgyfXBkfj2LZWJ6W+4CIUdWCr/XeiV9fjfMbnbiw==
X-Received: by 2002:a05:6000:2908:b0:3b7:83c0:a9e0 with SMTP id ffacd0b85a97d-3b794fde526mr1690937f8f.25.1753869012639;
        Wed, 30 Jul 2025 02:50:12 -0700 (PDT)
Message-ID: <8051d388-48f9-4878-8924-8e645f313238@suse.com>
Date: Wed, 30 Jul 2025 11:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] vpci: Hide extended capability when it fails to
 initialize
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-5-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250728050401.329510-5-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.07.2025 07:03, Jiqian Chen wrote:
> +static int vpci_ext_capability_hide(
> +    const struct pci_dev *pdev, unsigned int cap)
> +{
> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
> +    struct vpci_register *r, *prev_r;
> +    struct vpci *vpci = pdev->vpci;
> +    uint32_t header, pre_header;
> +
> +    if ( offset < PCI_CFG_SPACE_SIZE )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
> +    }
> +
> +    spin_lock(&vpci->lock);
> +    r = vpci_get_register(vpci, offset, 4);
> +    if ( !r )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return -ENODEV;
> +    }
> +
> +    header = (uint32_t)(uintptr_t)r->private;
> +    if ( offset == PCI_CFG_SPACE_SIZE )
> +    {
> +        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
> +            r->private = (void *)(uintptr_t)0;

Eclair regards this a Misra rule 11.9 violation. Elsewhere we use (void *)0,
which I then would conclude is "fine". But I can't say why that is. Cc-ing
Bugseng for a possible explanation.

Jan

