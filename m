Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F5F86CA2C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687094.1069951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgNd-0003qr-Dz; Thu, 29 Feb 2024 13:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687094.1069951; Thu, 29 Feb 2024 13:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgNd-0003pL-BA; Thu, 29 Feb 2024 13:23:21 +0000
Received: by outflank-mailman (input) for mailman id 687094;
 Thu, 29 Feb 2024 13:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfgNc-0003p3-3v
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:23:20 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b353b0e2-d705-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 14:23:18 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a36126ee41eso154084666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 05:23:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gb18-20020a170907961200b00a3efa4e033asm680118ejc.151.2024.02.29.05.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 05:23:17 -0800 (PST)
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
X-Inumbo-ID: b353b0e2-d705-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709212997; x=1709817797; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIlpSUibrCGxxNEFFk2NHMnPuwzvvO9KjQXdlo3fam4=;
        b=X7FkwMaxR0PMwcv98lRIHSBWaKmp24VkO6+M2hYvGhEwIxm0evJa75fRWOMiZ/Gx1n
         sCcBvlk9kA2MS9sC4FEJ1zHrWjpqC4V94qqJAvc1bkadfI9o7D/sLzTlBxA1+DObuE9W
         ZnW2V7gyoVd0aMqSsjkxeFEhBnSsGIj7L+PqjRctVwpz3TdRRCpZ8UFG6nDnapep+Oo4
         nnN3VwJnkXvjstY1Y6Z0TXQquzaXC/O50JoPs5NSaYCJBHiQCxYpIGMgNYTaUqVdsUPh
         1XUnpp68B2cz8ADhMOrmcrkjUI1CuAFkZE94f0Hub3MsDKTI9PdTcmpuqhjspeto0J88
         zYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212997; x=1709817797;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIlpSUibrCGxxNEFFk2NHMnPuwzvvO9KjQXdlo3fam4=;
        b=nDYfJIS4IhHWxUdRtePW1eCx9qyXDXtN1ImrBk/+tNoFIxgRWLzs0Agng3XIq4vi4N
         ea9/TsoOnQUtdFyctiq60Onsks+IA3X2uXaXPuosd5tw6RgqCFLrMRk0NmDQWbdbRSpD
         anTruA0QnccyTU+PZvx1m8cyle9f50PP8GlK20O/ejsaOeQb0LfFWaV64CiZpibupeDh
         jt5xYWIvxlrzaeYMvgj7nSy1LvpdBgxf0xq9AsRnlWJNlcDP0xFZ8eMoZ77oAK36faaT
         takkqh8errHKxsmUnPoX6hj7AOKXKmtP/U4cgrbHG9p9VIufx8kapGRfQ+zX5xRtfs31
         LlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCt9b5s1P5yNMECvHiHu9YwoxgbwCp83Nd6n6vxYnw11ewY1Z269dZ/XUpM7cIOcBozVFMVzNkKmieLP+eE1auYESVbRxWs/KZbJB8hQA=
X-Gm-Message-State: AOJu0YwlfnvGsYrukwaOUQrDYU7u34mJe0P7Jcw034nmdwoeqtCGcivC
	pqqUYqA+E+lKfayGJrWffs9u0CfvdTtMhV5XcK6KVgsNnZPItdTouNbUyYBy8Q==
X-Google-Smtp-Source: AGHT+IF4VjaypXJweyqY+HBHnsTuyLsGPbWapDIRwUVXGLrurLzWm+JSjMgWDtKOXPkTcN3C3a+XrQ==
X-Received: by 2002:a17:906:d8b4:b0:a3f:2ffd:c68b with SMTP id qc20-20020a170906d8b400b00a3f2ffdc68bmr1641034ejb.6.1709212997377;
        Thu, 29 Feb 2024 05:23:17 -0800 (PST)
Message-ID: <29bebf83-a78b-440f-a642-0ec9aa40c0d7@suse.com>
Date: Thu, 29 Feb 2024 14:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pci: fix locking around vPCI removal in
 pci_remove_device()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <20240229131525.19099-1-roger.pau@citrix.com>
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
In-Reply-To: <20240229131525.19099-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 14:15, Roger Pau Monne wrote:
> Currently vpci_deassign_device() is called without holding the per-domain
> pci_lock in pci_remove_device(), which leads to:
> 
> Assertion 'rw_is_write_locked(&pdev->domain->pci_lock)' failed at ../drivers/vpci/vpci.c:47
> [...]
> Xen call trace:
>    [<ffff82d040260eac>] R vpci_deassign_device+0x10d/0x1b9
>    [<ffff82d04027932f>] S pci_remove_device+0x2b1/0x380
>    [<ffff82d040260bd0>] F pci_physdev_op+0x197/0x19e
>    [<ffff82d04032272d>] F do_physdev_op+0x342/0x12aa
>    [<ffff82d0402f067a>] F pv_hypercall+0x58e/0x62b
>    [<ffff82d0402012ba>] F lstar_enter+0x13a/0x140
> 
> Move the existing block that removes the device from the domain pdev_list ahead
> and also issue the call to vpci_deassign_device() there.  It's fine to remove
> the device from the domain list of assigned devices, as further functions only
> care that the pdev domain field is correctly set to the owner of the device
> about to be removed.
> 
> Moving the vpci_deassign_device() past the pci_cleanup_msi() call can be
> dangerous, as doing the MSI cleanup ahead of having removed the vPCI handlers
> could lead to stale data in vPCI MSI(-X) internal structures.
> 
> Fixes: 4f78438b45e2 ('vpci: use per-domain PCI lock to protect vpci structure')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -817,15 +817,15 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
>          {
> -            vpci_deassign_device(pdev);
> -            pci_cleanup_msi(pdev);
> -            ret = iommu_remove_device(pdev);
>              if ( pdev->domain )
>              {
>                  write_lock(&pdev->domain->pci_lock);
> +                vpci_deassign_device(pdev);
>                  list_del(&pdev->domain_list);
>                  write_unlock(&pdev->domain->pci_lock);

This then also is properly symmetric with what pci_add_device() has.

Jan

>              }
> +            pci_cleanup_msi(pdev);
> +            ret = iommu_remove_device(pdev);
>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
>              free_pdev(pseg, pdev);
>              break;


