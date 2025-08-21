Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC6AB2F2DF
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 10:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088251.1446013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up12M-0000qF-DN; Thu, 21 Aug 2025 08:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088251.1446013; Thu, 21 Aug 2025 08:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up12M-0000oV-Ae; Thu, 21 Aug 2025 08:52:46 +0000
Received: by outflank-mailman (input) for mailman id 1088251;
 Thu, 21 Aug 2025 08:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up12L-0000ZZ-Ku
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 08:52:45 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c894a0-7e6c-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 10:52:44 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-618b83e5b27so909144a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 01:52:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a92678f45sm3330159a12.18.2025.08.21.01.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 01:52:43 -0700 (PDT)
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
X-Inumbo-ID: 33c894a0-7e6c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755766363; x=1756371163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1EUL3qG1NEOtTui0EP6TOD0gafplJiEMMtQ5leoiCPQ=;
        b=NG5XbS+13PPheRclj6ys+tOYjk2KdQ9tn69U26rLANhndXrqXTkQQa8go2h1Rfi8fL
         kHXF0M3tBvt+F6XbMAh5U4Zcl8l/zCO//WUxipqmxVaDAnAO72W2IlDkKViphp+zDtCT
         zG6Nsr9jyPjRl62Xxy1zt7IfvGq6/LoXdSoRarjAJeb8pocTGiwU14ekUszXDY1XZlnm
         ZJqyHqeYOd3WLcJl07hmgLmChBcGEPR+pLJlENrsIP52PzCIjG8AX/RFOEzd7X3SB6NU
         9Dk89LzQ/y2fixMmiKGCCkVaPOaOxMdzScXEJy2+CrVmaazV/SbZNFwpcQc9GIvBeEhu
         AAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755766363; x=1756371163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EUL3qG1NEOtTui0EP6TOD0gafplJiEMMtQ5leoiCPQ=;
        b=IUUkKs8xAi74WjY1Q5cYFkioZ6y1zMKJvl9/x/ER2EUkLCPr3qZil8YGUfrrI6wvZD
         cqgEi/6vklQjPOwc6u7H+t+4k5y7PPq5eGN+5rw5N4bGL/+zTWSDFF4mHFUfI3b+3kdp
         03mLVum4m78Zo2DNL0fwl9RMyOV2jowd2oN34mM+UVPB0UNZPFY4DYiFLehCtGiDHDF9
         BdPFG8/hWLFtRqzu51R92BqRG4Y00+F/cx8QEaAYihw/19SHvUV0+4pxZObVXmCn+EKQ
         A7Dezwk3ggyK6BnOIi0KMaI9OLYaBZTlJt8HkEAH32g5ndpsaEJdogVKMSxzw3em+Tjf
         D0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkAzjh0rqVaU4sXiPV5DF35Waofb5IZY2P6RSwlf6919swMdEG+vB5PHRSrnLmP1gZITp3EDTPBAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyovb0OQkRCawSIpHs0Kzu0P2izYKkI85gYrWSgMRTJKHAMa78/
	YfH5GYkvTm3KivWvpQjLcYi6VRx6RreccWRyG5OEZ2XgSWaSyVFfNuZIuB+JNQCbnA==
X-Gm-Gg: ASbGncv3zRxFl4iwmk9UIenJdK/AtMKbRzEy4xgVn6u8i7Wplo17B3CnbxMjkCxbDS+
	vH8uIZzqSnuqkhQQqLUJDvfxfwsH/Ld4jN3ymaTOqzm15nJtpJMFOKuNTr9pilqmqluCFQouJr6
	XPIwD8/XoRx+pwzMkjFz/NFNvitmWwq1kqw9uDf38jLOyjefuiI3vN71lKpJK+U2GKQroj7a+Ew
	WFyKOnI7DXFUSAhYkW/5TX7pxguEI4E/WaZ+Nh6zCMgcBjlgZLk0QxxoslB8z2MbxneX+EJXYRF
	7Z8QJdsNbB+d7JOCy08XUBfi5fFYv8hKQBnT/sZL7O4fv/m38OEVDH97jDc/uStC8+KegME9U2o
	w6cdjiTvzCJhY2eq7bV35yhT3jtMp3i0rGncskR4n5dWi0zCAlc3hPwoNg7zwQnqGUJoCysKDBt
	Jdnv1nkDw=
X-Google-Smtp-Source: AGHT+IFhkyYXlEnYL/cecI7LQVIFUzXvLYNMZYEWpaApzXUk91J7/wB8WIaXwi+vDUbPscpbHS53fg==
X-Received: by 2002:a05:6402:34c5:b0:61b:fb76:a244 with SMTP id 4fb4d7f45d1cf-61bfb76a530mr1044320a12.10.1755766363348;
        Thu, 21 Aug 2025 01:52:43 -0700 (PDT)
Message-ID: <de9b2f08-b16c-4d9b-a720-00a27fe81661@suse.com>
Date: Thu, 21 Aug 2025 10:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/pci: modify pci_add_device to handle device
 add by Xen
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <cover.1755683961.git.mykyta_poturai@epam.com>
 <e0da037322b978d427d23a1af50406598a08b378.1755683961.git.mykyta_poturai@epam.com>
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
In-Reply-To: <e0da037322b978d427d23a1af50406598a08b378.1755683961.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2025 14:28, Mykyta Poturai wrote:
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
> owner would be the caller domain, otherwise when Xen is calling it,
> it would be another domain since hw domain could not be there
> (dom0less guests without Dom0 use case).
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> (cherry picked from commit f0c85d9043f7c9402e85b73361c8a13c683428ca from
>  the downstream branch poc/pci-passthrough from
>  https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> 
> v1->v2:
> * remove dom_io check
> * fixup pci_add_device parameters
> * use current->domain instead of hardware_domain

What I'm missing (as per my v1 comment) is discussion of the hardware_domain
-> current->domain change, including the XSM aspect. Because of the XSM aspect,
please also Cc the XSM maintainer going forward (I'm adding him here as well).

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -654,8 +654,9 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
>      return is64bits ? 2 : 1;
>  }
>  
> -int pci_add_device(u16 seg, u8 bus, u8 devfn,
> -                   const struct pci_dev_info *info, nodeid_t node)
> +int pci_add_device(uint16_t seg, uint8_t bus, uint8_t devfn,
> +                   const struct pci_dev_info *info, nodeid_t node,
> +                   struct domain *d)
>  {
>      struct pci_seg *pseg;
>      struct pci_dev *pdev;
> @@ -663,6 +664,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      const char *type;
>      int ret;
>  
> +    if ( !d )
> +        return -EINVAL;

This should't be needed. Very remotely ASSERT(d) could be added here, but
we don't normally do so elsewhere.

> @@ -767,9 +771,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      ret = 0;
>      if ( !pdev->domain )
>      {
> -        pdev->domain = hardware_domain;
> -        write_lock(&hardware_domain->pci_lock);
> -        list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> +        pdev->domain = d;
> +        write_lock(&d->pci_lock);
> +        list_add(&pdev->domain_list, &pdev->domain->pdev_list);

Why pdev->domain instead of the shorter and more efficient d?

Jan

