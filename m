Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F0CBFC9DB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 16:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148272.1480400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBa4p-0004KV-Fn; Wed, 22 Oct 2025 14:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148272.1480400; Wed, 22 Oct 2025 14:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBa4p-0004IM-CW; Wed, 22 Oct 2025 14:44:35 +0000
Received: by outflank-mailman (input) for mailman id 1148272;
 Wed, 22 Oct 2025 14:44:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBa4o-0004IG-LO
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 14:44:34 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f810b19-af55-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 16:44:33 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-426ff694c1fso1929026f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 07:44:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427e1be5d6csm25276014f8f.0.2025.10.22.07.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 07:44:32 -0700 (PDT)
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
X-Inumbo-ID: 9f810b19-af55-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761144272; x=1761749072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XuOnv6FJfcaIwZA6lb2WBt2EPovowxb58J9EXwF7wp0=;
        b=dO9Vf2Zrpqk3tjzIJqMrRoXPEpo+gbNqzq2ZnVjyOd8NmG/1QyZE5z3nmUZ2Li1Dxa
         1uYXWWd/67Ot7DLEYJnzBpbNZUX6ATJ6xA8YMixB3kB2ukCnbxizqLAj4Z+7GZ3Ie/bO
         q3/arcWWphT0bXFE2ZhC7lMlT20JIZg8AlAHvndIoTBKBH3EZpSJNGRkQYgbRf6YyyRS
         OkAIcJB/mTP0vFGJcdbHJjdmu9JpjKtfyYcD/SReLZmaaTiWlsMXagkE7zC89MB2q7RT
         /e7yTn5Rl8VS1QV2odU1ldxk6yhA5GWVCXfOz/Fq8LrbPIJyaTsuVdF5fxi3cxakDQuq
         R+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144272; x=1761749072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuOnv6FJfcaIwZA6lb2WBt2EPovowxb58J9EXwF7wp0=;
        b=fGOe9uPDxFp+X2j7q4y55R1oWw1LkRdHDeIA5oXYtUtnSycJfBLu8OwpQH+HY7qnhZ
         rdIYeNsMZ3W0gQgtgu7W/XuaRfoAkOuayAfjc/28rPmKuBE1g4AfEya37NUP/qDML/RX
         SVr5UPTbR677TyA5k+6nKy9GJEroXEgQgcJs0sGUeBj8lU2QcLPX00GeZBnUwf/sfbsp
         3+EiU0h3ZsTY9QdCyK8FsNF1IRQ7XsuFaBvblQ4XlNzYvmpqpdOfZiiZ8H7hsfaEu4k6
         GosLxHOYCYgS7TVEijzYUPg8Bc1gOQICiFUaFVfpRIyNldniRGepxoEYNXq+HKwCGdnv
         bK1A==
X-Forwarded-Encrypted: i=1; AJvYcCW9GPHo2d+EAnTGgFkaOf6yITyfZwbSh9KxeeJKp/+8siPF4809fRWdxGq/FXn/u85p3sv8bdBEqq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi6HAnn+r+oOpnMS6hTCbbFWJDy+NYv3D165rw6+STLFSTb1RS
	y92ZhEqjKV4HVVjJCQlFmxPJDCvqz6Ajc7G9eVgi26J2fxs2pAuGrOEOABz2mrqEKA==
X-Gm-Gg: ASbGnctzVqIW1c251djQfePphC8SG30/w+f2qrO/ESVDMdK23DIFMm5cf5tVGwvB/il
	efuy/1yOjX8nqWDsLTf5m5L5CdZAeoujJSVxwJG29399cZk5iDBOQwSaZZIb8rSBW+0UHAN7If6
	N8DP4dAFf93LnxOmFcy/5Kj4G77g4s0p+IEhI4ZYTEbvcF7vncxtax4P/3QNdrORKY+lRtx4HGq
	I88wRl1P/G+fs+m6cmyTu2qf4gl33NNKIIKcUlc3uNtGyKSapfDqyVPIWlYO6fqr+J9Dc4ebwvx
	na1HnymqzGjlK8bt3ZdtoV+tbQ3NWmNM0bFYTwCp0pEsk6Dt/X0foI1ydVT4dqgb1WgVbp5P2RO
	q2mXNrpRQj1nU3sv49AjL92S87WHkwCPDERd7Whzh8kFakvIJBj0EELkM9Ohik73qpuDswkdI7c
	QteYPZ9GxncgQNjCdxxCnfEpgc24qPI7xx7+JJfGIk/nUIoQ/RWUvJg08S229J
X-Google-Smtp-Source: AGHT+IHCXbhQ2xZsVADmxs3/KRH2S/eKL+lxeus1nnT22jdVwiw0PEHsLYzMbn3HICFw5ESCQXgkmw==
X-Received: by 2002:a5d:5f82:0:b0:40f:288e:9968 with SMTP id ffacd0b85a97d-42704db9eb7mr14016299f8f.51.1761144272573;
        Wed, 22 Oct 2025 07:44:32 -0700 (PDT)
Message-ID: <e65f29f9-6005-42c1-9b66-706d8fa59796@suse.com>
Date: Wed, 22 Oct 2025 16:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen/pci: assign discovered devices to hwdom
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1761134829.git.mykyta_poturai@epam.com>
 <78c0e358bd15266b029b3b6d0d71b142ea7d84bb.1761134829.git.mykyta_poturai@epam.com>
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
In-Reply-To: <78c0e358bd15266b029b3b6d0d71b142ea7d84bb.1761134829.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.10.2025 15:56, Mykyta Poturai wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Hook up existing PCI setup routines for hwdom into Arm iommu
> initialization sequence, only assign endpoint devices.
> 
> During scanned PCI device assignment, also permit access to the BAR
> ranges if hwdom is using vpci and hide host bridges from domains that
> use the fully emulated one.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

From: and first S-o-b don't match, which either is wrong or needs an explanation.

> @@ -1255,7 +1262,7 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
>                                                  struct pci_dev *pdev)
>  {
>      u8 devfn = pdev->devfn;
> -    int err;
> +    int err, i, rc;

I doubt i wants to be signed, and as per its use below rc also wants to be
unsigned. rc (generally standing for "return code") also may be a misleading
name for the variable. Elsewhere we use "ret".

> @@ -1276,6 +1283,34 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
>      if ( err )
>          printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
>                 ctxt->d->domain_id, err);
> +
> +    if ( !has_vpci_bridge(hardware_domain) )
> +        return;

This (and the other one further down) is odd to see, as it'll expand to
!is_hardware_domain(hardware_domain) (with, for Arm, some 2nd check, yes).

> +    for ( i = 0; i < PCI_HEADER_NORMAL_NR_BARS; i += rc )

What about the ROM BAR?

> +    {
> +        uint64_t addr, size;
> +        uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
> +
> +        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE)
> +             == PCI_BASE_ADDRESS_SPACE_IO )
> +        {
> +            rc = 1;
> +            continue;
> +        }
> +
> +        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
> +                              (i == PCI_HEADER_NORMAL_NR_BARS - 1)
> +                                  ? PCI_BAR_LAST : 0);

Nit: Indentation.

> +        if ( !size )
> +            continue;
> +
> +        err = iomem_permit_access(hardware_domain, paddr_to_pfn(addr),
> +                             paddr_to_pfn(PAGE_ALIGN(addr + size - 1)));

Again.

Also this one may read better when you use PFN_DOWN() and PFN_UP(). Of course
I wonder what the result would be if there were non-page-aligned, multiple-of-
page-size BARs.

Jan

