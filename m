Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E79ACAA64
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 10:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002888.1382291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM0EE-0005SD-AO; Mon, 02 Jun 2025 08:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002888.1382291; Mon, 02 Jun 2025 08:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM0EE-0005PW-6j; Mon, 02 Jun 2025 08:09:06 +0000
Received: by outflank-mailman (input) for mailman id 1002888;
 Mon, 02 Jun 2025 08:09:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM0EC-0005PQ-BW
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 08:09:04 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d82cf40c-3f88-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 10:09:02 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso2800738f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 01:09:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e3228f6sm5045193a91.46.2025.06.02.01.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 01:09:01 -0700 (PDT)
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
X-Inumbo-ID: d82cf40c-3f88-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748851742; x=1749456542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J+X3nOHKqYKn6IBZ9pDsGZ0xvJicwk19L46SIvP3EOM=;
        b=fysdBtjQ/5L1Zn4up8iM6G8T9eKzy6TZlAbZV/cGzWylZ8BI/IIkNzkezbyMi/eRbX
         U3JKKqLb0hYvQ9B03uKDi5I4UAqxWVuMOW/IGzFwuREVVRYoeo3b2jNubQihpAnLXKSm
         cxdDpfTIfhObvuFWdVrucdqmLi3yMYR/URBeqwEJEsKYWvau1CEVt3wtrUiFEaeA7Iw+
         1O1JQ2Qup1OJ6X9ya+BoVolw6FwXdXuVLfjvMb+WbkVK9x3D0L4kLgJSj0tQUDhlC4rY
         lYqCS0dWhE3D72CZNd/PXgWwqjphZiSDFBP+neYP8FPsKKyMfej/yPgYcs2IKPBFsEiB
         AuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748851742; x=1749456542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+X3nOHKqYKn6IBZ9pDsGZ0xvJicwk19L46SIvP3EOM=;
        b=BVBeXuTtUnRsu8MRBP7EgnqzRzbQdsxgfBcL0ck/U8VrKkprmwm7AAYGz2L3D/V22F
         Gd8pAizUDL+y0ypqnqRgcye8kwlk+c1RzTg5hu1wUGYTqOoJzcN2oH/6KB/LhTyhEv0g
         rTRoWZh/fj7pHdmJARcScJGlpQwAAC7grt9ETAggGc4+7h8Qw1kQT/5zjGpN3mGcvJke
         jxaCFOBDK5tbqohZMiKy168T44+qnitkeYa10Sn8xD5zv3fCg6qNPZM1fjSxmVjxwvO2
         OgvhosDOzKSxSoRPGweCTqYp/VPpOV7nJvszak6UyWqBmWrqMkfLAmoO1uUk4aj6jMKH
         4ZGA==
X-Forwarded-Encrypted: i=1; AJvYcCVRJbgYlLzGZtIjduvMaWvgtdo8ASFQfew3YIAatkuEve9hwuYD/zwCJ2Tr7Oe4htEBVljI9CgCNUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyB9usAW63x/juejQGU/zQr0lphM2g0M5ZuQoJSMU6nR1NAgKpD
	UEqxwvb59dG0gdApplcAjDMv3UMqbrdwdejGKc8AQwspLCA+OVStNqekWFYSVc3qjA==
X-Gm-Gg: ASbGncvV8iQl5EV8rgHGOKkZ4/tzS+azuP1m3WQkP3efDayS51BG0K720kxFOQKI67c
	bqmYYctaTljecRgXLfZHmrx35jsbksgRKARYRcY9DQfMJ+dnv2XR7Smvd2vnUQDRrBn2bWEb6l8
	jqeWiwxrkav3n9ghorEZecQy7qhZQ9lIzKHfdn19i3ghpfwAOKMmKJj4N0evxb6mCB8uWGtCWSA
	Xn1Bwv5sgouaBhhNdsRGTtIBw2hIJe+EbzwOeD5n+T6u7KwEAxraz5XaYj+6qNRkiYIts/0v+tB
	ztewX45b9JAJPINLTEkDIyUyZfpWIGCLVE0OhI1JxHFdfF2pX2ku7Uai9/jIgZVgkmZxKD0r2jo
	wVFLrXs6M1/NUIgVF0VcCeb5vB2zH6JRafuN2
X-Google-Smtp-Source: AGHT+IHH57sWuTFbXkuTymxD86Piq2+iWZcP0oxWqJ6rWCif3AwkcHPGBprdKedQ8oL/V07lqzrbuQ==
X-Received: by 2002:a05:6000:22c1:b0:3a4:ec2a:158d with SMTP id ffacd0b85a97d-3a4f89df510mr7465719f8f.55.1748851741823;
        Mon, 02 Jun 2025 01:09:01 -0700 (PDT)
Message-ID: <24e2b3c2-6533-4e09-a33c-35dedaa89d66@suse.com>
Date: Mon, 2 Jun 2025 10:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/7] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1748422217.git.mykyta_poturai@epam.com>
 <503fe598dd53b4023bc60e621592f4f0a0e0bf6c.1748422217.git.mykyta_poturai@epam.com>
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
In-Reply-To: <503fe598dd53b4023bc60e621592f4f0a0e0bf6c.1748422217.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:12, Mykyta Poturai wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The main purpose of this patch is to add a way to register PCI device
> (which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
> before assigning that device to a domain.
> 
> This behaves similarly to the existing iommu_add_dt_device API, except it
> handles PCI devices, and it is to be invoked from the add_device hook in the
> SMMU driver.
> 
> The function dt_map_id to translate an ID through a downstream mapping
> (which is also suitable for mapping Requester ID) was borrowed from Linux
> (v5.10-rc6) and updated according to the Xen code base.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

While I'm not happy about all this DT stuff in ...

> ---
>  xen/arch/arm/include/asm/iommu.h      | 15 +++++
>  xen/common/device-tree/device-tree.c  | 91 +++++++++++++++++++++++++++
>  xen/drivers/passthrough/arm/iommu.c   | 13 ++++
>  xen/drivers/passthrough/device_tree.c | 42 +++++++++++++
>  xen/include/xen/device_tree.h         | 23 +++++++
>  xen/include/xen/iommu.h               | 21 ++++++-

... this file, it's only adding to what's there already, so
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

