Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE80B19D96
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 10:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068925.1432779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqWT-0004TW-W0; Mon, 04 Aug 2025 08:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068925.1432779; Mon, 04 Aug 2025 08:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqWT-0004S0-Sk; Mon, 04 Aug 2025 08:26:21 +0000
Received: by outflank-mailman (input) for mailman id 1068925;
 Mon, 04 Aug 2025 08:26:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiqWR-0004Ru-QJ
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 08:26:19 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b15c2b28-710c-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 10:26:17 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-af8f5e38a9fso706529466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 01:26:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af938aa8275sm462991166b.57.2025.08.04.01.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 01:26:16 -0700 (PDT)
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
X-Inumbo-ID: b15c2b28-710c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754295977; x=1754900777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zzbJ4R48y9Crp9qGV5X/ShtJPGeeIWCQbX8njn+wAtc=;
        b=eFWgcFjueiHZx9SrhidnmnJTapykkIIGtCrqjUFMzglJ9C0FXOYj87qGmz1Ph7HyG3
         jlmC+5fO1TIwXw4iOsSNmKliDhdxXutlFEiBMpBzCwgP5C8xosYJCXBmmEowPJ3/w/J+
         PehaYWWkxRHrW4kmXuLKTvCQ17jqbund90I1udrBrtvN10uCQro55k0isHSppB+4sIP2
         LWkE7zeuNhtcmrtaVY7cCR9D7tLp2jqw3NQ1o2puTV7UTlW5tnO7xaTEFwuPtr50riME
         xhP/4d2zK2iY4G1oM9gSITglAUsOUb+8z//Az97aL80b5wip+UjhYKdypj+q8Aazn7Xp
         mJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754295977; x=1754900777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzbJ4R48y9Crp9qGV5X/ShtJPGeeIWCQbX8njn+wAtc=;
        b=mr0YQx9oU6mMXAi/eqQ+KZaLXgLRkxPdTNgCQ+AzQlSXATkQIOvppG6c1F/nPLyR6h
         16/W2y6MDZbYhFkKniO4XagBZAfnsdusUoPt5z/YurHzHkiNrsVOxlvPZTE27YQprUpH
         xyufUaWpudjxLHlTO5pcjOXiLpiTKej5RFmXcb2ojniNooJAtb5wv3ZZO+5gd1wQ5JeG
         L2KfSRzb8/xGJiAS/0hIFOLNT7CMs6xaNDBHzmBRY0wtVTIKS74/fbmpowWxrKBJRnRK
         31cs6yT4gmv9Md+7LTUuqD84Bye8/V53Y+TUuac1wFXu+LB2oTvfD6ApI/CloGcvDspt
         qdwA==
X-Forwarded-Encrypted: i=1; AJvYcCWwO3pOCJ+PW+HvEQbhIx1PVro5gl0U9ip6d7WPRChoOra7Jei4X4XVPZWt6ymWTqZSj5DszfAsV+8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7TSD7hOlYymq8FDvmbrI0VWOZenyUvK2FEd7xzYKPMLZUi3jz
	WiSW0qKpYfWtPFiQCTH5xJJlNggCf1iZ2mKXlC1n0a213FxpA6JwURbxJXvxhSXYlg==
X-Gm-Gg: ASbGnctqPUFh44NGUYG5ZEX4t+/njIDOETVkrwyUy4RxGNGmRZk38SZ4tUA3IhIQn2p
	HowRmePfKQyGc916YYKTYY0XPIYQvTlWpKqc9LvjkrldD3Z0g9Duv69udEm0eML48EL8SWeMKZH
	s9VNPThOFqR4v/lCdcc+QfHAEIASQSYCSuYVZF9UnoSm4F347rcpkYp/UOuCsXhUZusp0tj928u
	UVHdf2AM+DziOYBStpeEmpL+kTwVeb24pweR0Fvj8anKSXIg32CSZuJupMkUWjpbRZ8lorkuj4B
	jXuaVdhd0qzrzEqU7ul8aYWxcZurZv/jCnP3sz9qh4eBCG8KHTIFMwKX3N0SWc/Fl81yitY5g6C
	5PjBMcf0JrfZV6sKysrApMPPJElH+YHfxUd7YbNwKsvbZshh29/j6ikHE377N2BHpmNRf7W9TkB
	xVrg42xeI=
X-Google-Smtp-Source: AGHT+IH5yl6yyHkCRAZDJOdMJWfYAfylPNQnjas1tAc2/D3KNaq/BYw0Y5kW6Cpf4mEKaHQ1G9hXSA==
X-Received: by 2002:a17:907:2d93:b0:ad4:d00f:b4ca with SMTP id a640c23a62f3a-af9401f3c44mr897043966b.50.1754295977186;
        Mon, 04 Aug 2025 01:26:17 -0700 (PDT)
Message-ID: <0086c661-6365-4cb3-ae60-2d5bc86582c2@suse.com>
Date: Mon, 4 Aug 2025 10:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/pci: modify pci_add_device to handle device
 add by Xen
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753968306.git.mykyta_poturai@epam.com>
 <32cf834e95664805604b13d10bcaa857897f0890.1753968306.git.mykyta_poturai@epam.com>
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
In-Reply-To: <32cf834e95664805604b13d10bcaa857897f0890.1753968306.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2025 11:22, Mykyta Poturai wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Currently pci_add_device is called from hypercalls requested by Dom0
> to add pci devices and when the device has no domain associated with
> it, it is assumed that hardware_domain is the owner.
> 
> On the dom0less scenario, the enumeration is performed by the
> firmware and Xen at boot time might want to assign some pci devices
> to guests, so it has to firstly add the device and then assign it to
> the final guest.
> 
> Modify pci_add_device to have the owner domain passed as a parameter
> to the function, so that when it is called from the hypercall the
> owner would be the hardware domain, otherwise when Xen is calling it,
> it would be another domain since hw domain could not be there
> (dom0less guests without Dom0 use case).
> 
> In pci_add_device there is a call to xsm that doesn't consider the
> requester of the function to be Xen itself, so add a check to skip
> the call if the owner domain is dom_io, since it means the call is
> coming directly from Xen.

I don't understand this particular aspect: All call sites pass
hardware_domain. Checking against dom_io therefore looks unnecessary, or
at least premature. In Misra's terms it is "dead code" that you add.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -654,7 +654,7 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
>      return is64bits ? 2 : 1;
>  }
>  
> -int pci_add_device(u16 seg, u8 bus, u8 devfn,
> +int pci_add_device(struct domain *d, u16 seg, u8 bus, u8 devfn,
>                     const struct pci_dev_info *info, nodeid_t node)

For a pci_*() function I don't think it's appropriate to have a domain (not a
PCI domain, aka segment, which would be fine) as first parameter.

While you touch this it might also be nice if you switched u<N> to uint<N>_t.

> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -50,7 +50,8 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          }
>  #endif
>  
> -        ret = pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, node);
> +        ret = pci_add_device(hardware_domain, add.seg, add.bus, add.devfn,
> +                             &pdev_info, node);

Here as well as in the x86-specific counterparts: Why hardware_domain, i.e.
why not current->domain? Yes, what you do is in line with how the code has
behaved so far, but now that you want to change it, it needs to be sorted
what it is that's really wanted. This btw also plays into the XSM aspect
that you're fiddling with.

Also, what if you end up passing NULL here in the dom0less case?

Jan

