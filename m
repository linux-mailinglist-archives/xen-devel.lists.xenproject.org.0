Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827CAA907CC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 17:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956420.1349844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u54lx-0005jR-PF; Wed, 16 Apr 2025 15:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956420.1349844; Wed, 16 Apr 2025 15:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u54lx-0005hh-Ld; Wed, 16 Apr 2025 15:33:57 +0000
Received: by outflank-mailman (input) for mailman id 956420;
 Wed, 16 Apr 2025 15:33:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u54lw-0005hb-4x
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 15:33:56 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 342241ea-1ad8-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 17:33:54 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso1283129366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 08:33:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b3452fbsm24809425e9.0.2025.04.16.08.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 08:27:39 -0700 (PDT)
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
X-Inumbo-ID: 342241ea-1ad8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744817633; x=1745422433; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7wRUbMj+4O4pgL6s1ZoExCgb2YAxupPE+TqeRPIC7OU=;
        b=c5gTWc+VTcm9COj7pEDHMM5Fr6dS93PwPNJmQzvzV9AspDzcpPdkTV/p6+FInW9UUM
         sNEc3baUxTa4CkGjI9nNmnlBu+atdsc0RBGVGWduUoKLSiCee/lpe6vo49ifMw9o7LMf
         AdklW24GjNl+x7vUIrABO2hFht35sQxWb3VdVs3+qU0+yvtfqjKlmr34tX3EkD8WQS1X
         DNH1Wlmo8Dy/O6neHJPCL+tIniDZP2h0QQ0OgCbX6Bqcz9JMAj/7mT9mmw+lqjVviV0S
         Q2thtpg1++Yio1E7UrGktzOENvOhM721icdoNJHQ6HjV17O5TDUVged07UEz+pnm3FCZ
         PZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817633; x=1745422433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wRUbMj+4O4pgL6s1ZoExCgb2YAxupPE+TqeRPIC7OU=;
        b=CVcwH2HptQktOcN04PC5MhGJ6nw9cpkNnz/TyqbEh+bW8Rran0GfDzNOuZrrXIUtSi
         SqwD6RKbDpw6r4wBfFLqEFvyR4vMummpyp27FY10c9iYZNxQLN5EyFMg2YSE8HimADvZ
         xQvwAQhS44suAGwsunTz4d1vdfFq9ZPefRgFNNrfi9/tEGjlr+OZFgzS8fTX8BrsAcjp
         dHRrdhJHM9tCdP39ZQ1UdRNw0l/Sjq/GGqlkUxW/bvexM442+PkXaPq1clTs+R+erHRR
         Wkh0sY8BtXoVmBzY1VnlsOvBZ0kT2u9wVlOsaAFayZlkzgfmZlM8GXiyrc1O0i9SsasJ
         3McQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAJy9SoUdmbATsYOtTx61Pn4ve80Y8FYx3C33+IThRh1TGeX6DTPpQDRu5JhCahcQFMFh5AIp6fUo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGwEmj54h6HWo56lrAyk/WbZmv2LQkmadEuJr4X5mfPC6CSjih
	KUx7F07xj/FvzG8NRuRW1injmLCHXUurPYXEcn4btmgdEFLJFOawTy3daF8bzo0XeYyf7nNHLCE
	=
X-Gm-Gg: ASbGnct8BRIqHyE2T4K0DRMNlCdRUvfj4U7IHN4rtXh9f+GF/GUlAfFpNoJNtB2Xp9N
	6CpeFGQnfViKzGEVYirzqlobqe80fD6WPbNJ4j/TXHYPXuOyqOuaFi7FefDXTLx/8GWk7kb1XZ6
	JWxzs4VMv2OQUD1DY+SztimlQdSe+DArGYzwtqIfg+sDgBlXRkHwAs/nzAZbjCYd71igNSsa3NN
	F2byJZ1ppU3ve/yNMvNzFW4AW29jgV8DcwsbFQWxou/ded1xNTUb0BLQ1xVt4/O6L1UkN84Ecsg
	ZjCDLP3IiVJqSqMafCmFkeVIoPZpJ1NbRM0m/1v4QaNuEMt50jHdLaGmqxVnBDfF8gtyAb8jZ9E
	7sv2s3wSRJvjiVoPC7qP/m8naaA==
X-Google-Smtp-Source: AGHT+IEKm1ENKdWrh8MvcHnDkmDowktqv7M2sTcgIaOnXkW4JewO10Xbn72nuSiDDks3PwRgKOZvNA==
X-Received: by 2002:a05:6000:430c:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-39ee5b9f85fmr2351157f8f.41.1744817259294;
        Wed, 16 Apr 2025 08:27:39 -0700 (PDT)
Message-ID: <ab982710-0172-472b-b3eb-07914d6579cf@suse.com>
Date: Wed, 16 Apr 2025 17:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/3] vpci: acquire d->pci_lock in I/O handlers
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250415165404.435506-1-stewart.hildebrand@amd.com>
 <20250415165404.435506-3-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250415165404.435506-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 18:54, Stewart Hildebrand wrote:
> In preparation for translating virtual PCI bus topology (where a pdev
> lookup will be needed in the vPCI I/O handlers), acquire d->pci_lock in
> the vPCI I/O handlers.

I find it concerning that the locked regions (it's a domain-wide lock
after all) are further grown.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -440,6 +440,8 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>      unsigned int data_offset = 0;
>      uint32_t data = ~(uint32_t)0;
>  
> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
>      if ( !size )
>      {
>          ASSERT_UNREACHABLE();
> @@ -452,15 +454,11 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>       * If this is hwdom and the device is assigned to DomXEN, acquiring hwdom's
>       * pci_lock is sufficient.
>       */
> -    read_lock(&d->pci_lock);

The comment now becomes meaningless in its context.

> @@ -570,7 +569,6 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>       * TODO: We need to take pci_locks in exclusive mode only if we
>       * are modifying BARs, so there is a room for improvement.
>       */
> -    write_lock(&d->pci_lock);

Same here.

Jan

