Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5162BACAA6A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 10:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002899.1382302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM0GG-0007DV-OQ; Mon, 02 Jun 2025 08:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002899.1382302; Mon, 02 Jun 2025 08:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM0GG-0007AM-LK; Mon, 02 Jun 2025 08:11:12 +0000
Received: by outflank-mailman (input) for mailman id 1002899;
 Mon, 02 Jun 2025 08:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM0GE-0007AG-Tc
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 08:11:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24097668-3f89-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 10:11:09 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4fdc27c4aso928214f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 01:11:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf908fsm65391385ad.193.2025.06.02.01.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 01:11:08 -0700 (PDT)
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
X-Inumbo-ID: 24097668-3f89-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748851869; x=1749456669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8h874oZetIgDTxJQnHT4qevISzGI0DoLGKur2SoUoUk=;
        b=NOkXHm9wKcvkw7d7N39GQykmACW0oegHuCXNrDjVZfMwAt8VDOcXCBq28hdfvUd15o
         FmGSbO8gQD/eNaE5UGH48CazONuGOkqScxx3Hj6P83/bYSvfATMjouHx5ybfrHC43+Vt
         WtTQNxB9kwQ8jNcwYgaVKPB+8Ifd438RxsnYPyKCMZZk0tjr8YZGioRugY7ekmuXT01S
         sZkxcdRRyBYVmkt9KkId90udzB7W08A3o0+KImOXIYYjOFRFvq0OxZGw/LHrA5h/whtO
         GBVCE0yhfSZ+nlFoaB95iaCZEBbDg5GvPQTtu9CovEZ6k3vWG5XOq5UK7eYGTEkY27Uz
         RPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748851869; x=1749456669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8h874oZetIgDTxJQnHT4qevISzGI0DoLGKur2SoUoUk=;
        b=VtqPo8aK2EKtSetV3UTvm5T1UEH3bEUEuw86erjxUfgOemAEwNQWCu19fhnOViWpSI
         qf/chk2JR2tdso8qgxTqcpXxnpUzNoSvNFqkp8LwvMVU2FVVk6o7N5fGrDgTkpIT2o3i
         7qMFJOYJuDp8u5OUFXBBcC4YB0k2cMygxSeLIsW4q9d0tSghxpSATuJyp29Ukv//3WHN
         CkROI5RNUDBYHrKGE70cY+izLkm+DH3mMdmHMP9QlXM/vTy4UJcL4P61hXlBAwO26rz8
         WaLV+Yk6RkQM3If0LjDv4B9nzsinC6TcVmgHRSdG9/2r6Z3pqGbybpVjOKi8Y3GLWp6e
         RS4A==
X-Forwarded-Encrypted: i=1; AJvYcCXgYwPTmVX8HsuzkpZIQQmXeNT3gja3SWFLMAQIGAYrdHGNobvFBy3s/YH9VAndPCzvbX+0rcg/a8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywtDSD6vREMSRyFpoz79+jJwrReyeu1WQoEKA0ifYZtsK31yI2
	RGP+j4j7HkgeDfoU85TbP3w44f9zsAoPS2VfdZXoi40dhbO2SLl/hErYpwjVpqXwVw==
X-Gm-Gg: ASbGncsMDrt16MGJQmVQwKTPh+jFtOkC4MS0z5AnJdHP94qounMa0Pti8/DNCHdGIwe
	QVbbL3eAEXCozQ7l83P6QEoCMh1O+gdgs+I3GaGhESs6gEAPSOTpfw55hVcZ/QYMHdN2+BncNbg
	LbST/51L06r/ozXrJ9r3+ib4Mim2PJAGktVlg/F6p2sVzgU3K4lsPlbezs3FyewqIKX8KjctxkZ
	sCeQJp7cAHNKnhde7yaD0GSwvCUbBiVxc/uYyngssb5ZqbvD9pOhDqWUHYWv2nzlLxjgpZsWgKF
	t3ZWLg43p+Lt9ojbz5iGWtRxQYMwVhFLCIJGOrlIuvy2lUIRoQCq4H3y0n47qRRUjLeOkFt66Rt
	zRbxI9zMXuP84A4uIN7bfsYmWTeAlclOnT6EQkTCIS5vlYhQ=
X-Google-Smtp-Source: AGHT+IFsrgjZwTZjW/JVCyivWRXNIYB3H84BslfVXB6S6wW8q0qP2SmsMax+HufZXoBPdAoo30V4/g==
X-Received: by 2002:a05:6000:2087:b0:3a4:eaab:5111 with SMTP id ffacd0b85a97d-3a4f89ddd94mr7844197f8f.37.1748851869167;
        Mon, 02 Jun 2025 01:11:09 -0700 (PDT)
Message-ID: <66cda989-efe9-4389-ae8d-cb9bc4dc5239@suse.com>
Date: Mon, 2 Jun 2025 10:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/7] xen/arm: enable dom0 to use PCI devices with
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
References: <cover.1748422217.git.mykyta_poturai@epam.com>
 <c0b080618909580e527d7c6cce6010edf5278d2c.1748422217.git.mykyta_poturai@epam.com>
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
In-Reply-To: <c0b080618909580e527d7c6cce6010edf5278d2c.1748422217.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:12, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Enable the use of IOMMU + PCI in dom0 without having to specify
> "pci-passthrough=yes". Due to possible platform specific dependencies
> of the PCI host, we rely on dom0 to initialize it and perform
> a PHYSDEVOP_pci_device_add/remove call to add each device to SMMU.
> PHYSDEVOP_pci_device_reset is left untouched as it does not have the
> pci_passthrough_enabled check.

Just to re-raise the question here: Is this actually correct?

> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          struct pci_dev_info pdev_info;
>          nodeid_t node = NUMA_NO_NODE;
>  
> -        if ( !is_pci_passthrough_enabled() )
> +        if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop())
>              return -EOPNOTSUPP;
>  
>          ret = -EFAULT;
> @@ -57,7 +57,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_pci_device_remove: {
>          struct physdev_pci_device dev;
>  
> -        if ( !is_pci_passthrough_enabled() )
> +        if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop())
>              return -EOPNOTSUPP;

Nit (style): You're losing a relevant blank each.

Jan

