Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D425839153
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 15:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670492.1043302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSHjW-00069a-Ve; Tue, 23 Jan 2024 14:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670492.1043302; Tue, 23 Jan 2024 14:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSHjW-00066y-PF; Tue, 23 Jan 2024 14:26:34 +0000
Received: by outflank-mailman (input) for mailman id 670492;
 Tue, 23 Jan 2024 14:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSHjV-00066s-Fz
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 14:26:33 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6716754b-b9fb-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 15:26:31 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ccae380df2so43674461fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 06:26:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v10-20020a92ab0a000000b0036063b51610sm8247913ilh.27.2024.01.23.06.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 06:26:30 -0800 (PST)
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
X-Inumbo-ID: 6716754b-b9fb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706019991; x=1706624791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nEWfr3iWm7zMtXJTKNzc34KH0j51M4YyuWJgkir/YZk=;
        b=bMPIHjBch4O72wOiFS7CY00OpBhEXmnKPQbeWNUllSN4Od44+e3D6jZn4PGsT01OuJ
         LZfp3RYryle2fOZeTUAMvoeSr7+pddrao1/IflCaM9LclSiJwa0/Mht19oDlXVSuUOtT
         JLGQLTe+9QkuU4GgeHqfvtvDFq+TBop4XXDbEzm1Szr3+T0mdcmzos/xBfSnFCe7E96t
         UHG0maFx64WBh6Q+z44dvgeMnH61s0DDL95t3vExTRefO9FnTXfMQH9bJU/8DEx9XSvb
         IVOGvl1skzB+7caqsyRfw3Wh+YphSGgqq5WgnUXuNPQZ6cR+N87beDbDinxVcqvAawLp
         spEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706019991; x=1706624791;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEWfr3iWm7zMtXJTKNzc34KH0j51M4YyuWJgkir/YZk=;
        b=qBc2Z/mIKX6QT3AHzHWslEnwHZ/jamCkFufOLOQU7F2avSbGnPa+ixS/IILD4GK/LJ
         W5PKXOR0ZsBHTjl3a6WuZQOXnSU2Vz20ImdVzug3sUpGyoPr8v6lQ7XD1X11tkt4qHYf
         XYr2YyjNJeAy0bsrfyRG6NMdVRXIbJ2mJl8Hz3BLJQF/bQBpxlbGrP3bgIIGxwa6mz/o
         qqq/+dvAplTaDhR+MNDleBYmscRE91jpjah9wRRiD5yQSO0eQdf1flWQLgnE92fJOTcf
         DY6IzH+YjjkDzaDWSNvq6jTmGeVUFXaO3Q/ed9UPE86fabkpZ5cynU5orlSK+YvMCZKj
         ARTQ==
X-Gm-Message-State: AOJu0YwKwspFAnZpirg1g0Vnb0C7bV2VJd76F9iGj+5bzsCetJiq/kIC
	oTpGdcRUlmIzGjTG5JlIpRnrW81w1nddal7/rlN4M1vxtVP1y7ZezqoHSFhpqw==
X-Google-Smtp-Source: AGHT+IEdivCrB0Q9cHg3jR2H3qcChKDjerjC02CQyiNE/zgbafGDiNA4XtwOSGAYrZRBIE+Teb+5eg==
X-Received: by 2002:a2e:80c2:0:b0:2cc:daca:2e81 with SMTP id r2-20020a2e80c2000000b002ccdaca2e81mr2232206ljg.15.1706019990812;
        Tue, 23 Jan 2024 06:26:30 -0800 (PST)
Message-ID: <18ec3401-4334-40c0-82a0-31abfd9797d0@suse.com>
Date: Tue, 23 Jan 2024 15:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240115194309.45683-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2024 20:43, Stewart Hildebrand wrote:
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
>      struct msixtbl_entry *entry, *new_entry;
>      int r = -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      if ( !msixtbl_initialised(d) )
> @@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
>      struct pci_dev *pdev;
>      struct msixtbl_entry *entry;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>      ASSERT(rw_is_write_locked(&d->event_lock));

I was hoping to just ack this patch, but the two changes above look
questionable to me: How can it be that holding _either_ lock is okay?
It's not obvious in this context that consumers have to hold both
locks now. In fact consumers looks to be the callers of
msixtbl_find_entry(), yet the list is RCU-protected. Whereas races
against themselves or against one another are avoided by holding
d->event_lock.

My only guess then for the original need of holding pcidevs_lock is
the use of msi_desc->dev, with the desire for the device to not go
away. Yet the description doesn't talk about interactions of the per-
domain PCI lock with that one at all; it all circles around the
domain'd vPCI lock.

Feels like I'm missing something that's obvious to everyone else.
Or maybe this part of the patch is actually unrelated, and should be
split off (with its own [proper] justification)? Or wouldn't it then
be better to also change the other paths leading here to acquire the
per-domain PCI lock?

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -413,7 +413,7 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>  
>      spin_unlock_irq(&desc->lock);
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&msi_desc->dev->domain->pci_lock));
>  
>      return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);

This then falls in the same category. And apparently there are more.

Jan

