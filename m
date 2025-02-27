Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B80A47854
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 09:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897946.1306563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnZf5-0004BA-Mw; Thu, 27 Feb 2025 08:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897946.1306563; Thu, 27 Feb 2025 08:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnZf5-00048P-Jh; Thu, 27 Feb 2025 08:54:31 +0000
Received: by outflank-mailman (input) for mailman id 897946;
 Thu, 27 Feb 2025 08:54:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnZf4-00048H-OT
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 08:54:30 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 730fbd3a-f4e8-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 09:54:27 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso4271905e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 00:54:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a7850sm1355407f8f.39.2025.02.27.00.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 00:54:26 -0800 (PST)
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
X-Inumbo-ID: 730fbd3a-f4e8-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740646467; x=1741251267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mdh/5DjgY5kGwbaUZryfGV/KWej3t3pRrePnCHbB8Mc=;
        b=HI3EiTddoUB8tB1ezBiqEaJRIvH7i55pJ65rw0DAwCdGnrUmRbZyKDOQ57yYhya89j
         grGiNP+h65adkObID7gVrppiflSQuXX46WkyT/xcrdng2APaIVrnMg245XSXilHeMLdL
         MBTzVTMxDH8U5zV7c6R3WuYzbuQ2DrsqszBZ+Xfnq2B/GEEWVlN4kzUplq/cuilzCrTf
         i4MyKCiGhTztbQwxmDR2YrUCls+LpiWPL5HrbIpXHU+hN+UHINpFpAp8ksF5gdtp1jay
         nvgmnGYjqYuQsCsczUzVlL8VyEB0UDhBOF3mB5npwccogw++GtFVyArGCWcH50kYPjFp
         q6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740646467; x=1741251267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdh/5DjgY5kGwbaUZryfGV/KWej3t3pRrePnCHbB8Mc=;
        b=Mcx0Fe/Uat5SKkNu+RM4wvJdS5+An7eWaFWyr+9fCpMOyRTibl+wGTdAKXV0XIvPVz
         XGdDF9pKIs6h0V2QL5TqvnFVPUWpXAxMQUHaK9Cy+PWFnzdM6AlY8KsDHa9kBSfEqQIl
         d2dRh+PrRhQTYfk0yG3CsWJL8ma6jAbsWrj8qKsbO2NCbFv3OwMRR46dUfgHuiPvC3CQ
         P1VAA0KkHFX1MR2spqJZcvU8LLykrZRDLx9DBdW1Yr8kvedA+T8NLMMThwirfk+eRRWb
         IIm5hJ2dLz9vtiY7iFmKywJUNxSUNtFfC17wcSfzn+8OgPFq9bZVSDNunQLlgcuUuFQz
         NDtg==
X-Forwarded-Encrypted: i=1; AJvYcCU7uuh9JmYoPY0x15DCMiN1RHGw9Rh26BypWFvbBZjLEYmioyoqRHgXqmN/HgGAPUjl7FbJoV3EFW8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3VeDU4eju1Z/Et/u2omijuSfOCrBFUWJERzWgBpt8NXmHMVoT
	U1IAkD/HIn++Rx19SvlLo5OR1RK6fTxaqPQ692zWWIlHuY9yomDIR4yrhJv/Ew==
X-Gm-Gg: ASbGnctWu7Cw4TaUQQwKsQXGFytUMuEaWpdkd7tUyld2TfhewRFpFPHTSgeNTBNyyB6
	uSkld+MzvnrWYtfZ4QTP6fD/jby3otlMq1lTzOJUp83U+jWwTv0xZWknTFzSk3VMHVuc7GBrUEA
	0vE8jJ/3K2IEqzYpjrMQVqkAsL+M20G+BiXwJOqiuV9YZH5dinnwR0/Xq5/MwwiRdGv7yRf7afd
	LJEOZJPwi3M9Ky+43oCGJL8AgvLh7R7L2WcFZKz5MxiuLiCp3D8+ZgAcpPVsOmANoIOw4MRXRBV
	93CsiRnsjOXnXfnrSlPLsCcknEUqLRcFCkFgDYosq4+carK6CHmpPSO6VBW/oGOLGUYMRRI7iUU
	u+7wuZD88sy0=
X-Google-Smtp-Source: AGHT+IEqnUKY/HaOYB/EHiuZDV8s6VdG4kRpOKCIoB2Cjjh7HbkKIFvxmLpfYIQi9m8ZPrkgcdU7CA==
X-Received: by 2002:a05:600c:1906:b0:439:9c0e:3709 with SMTP id 5b1f17b1804b1-439aeafab74mr181918115e9.8.1740646466608;
        Thu, 27 Feb 2025 00:54:26 -0800 (PST)
Message-ID: <5184725e-baf6-460f-a8ee-2bb9982d7adc@suse.com>
Date: Thu, 27 Feb 2025 09:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <20250226211125.43625-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250226211125.43625-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 22:11, Jason Andryuk wrote:
> Sometimes we have to quirk the PCI IRTE to use a non-zero remap_index
> corresponding to the guest's view of the MSI data register.  The MSI
> data guest vector equals interrupt remapping table index.
> 
> The ath11k wifi device does unusual things with MSIs.  The driver lets
> Linux program the MSI capability.  Linux internally caches the MSI data
> it thinks it programmed.  It sets its affinity to CPU0.  The ath11k
> driver then reads the MSI address from the PCI configuration space.  The
> MSI address and cached data are then passed to other components on the
> same card to generate MSI interrupts.

I'm curious whether it's known how e.g. KVM deals with this.

> With Xen, vPCI and QEMU PCI passthrough have a guest idea of the MSI
> address and data.  But Xen programs the actual hardware with its own
> address and data.  With per-device IRT, xen uses index 0.  When the
> ath11k driver passes the guest address and data to the hardware, it
> generates faults when there is no IRTE for the guest data (~0x25).
> 
> To work around this, we can, for per-device IRTs, program the hardware
> to use the guest data & associated IRTE.  The address doesn't matter
> since the IRTE handles that, and the Xen address & vector can be used as
> expected.
> 
> For vPCI, the guest MSI data is available at the time of initial MSI
> setup, but that is not the case for HVM.  With HVM, the initial MSI
> setup is done when PHYSDEVOP_map_pirq is called, but the guest vector is
> only available later when XEN_DOMCTL_bind_pt_irq is called.  In that
> case, we need to tear down and create a new IRTE.  This later location
> can also handle vPCI.
> 
> Add pirq_guest_bind_gvec to plumb down the gvec without modifying all
> call sites.  Use msi_desc->gvec to pass through the desired value.
> 
> Only tested with AMD-Vi.  Requires per-device IRT.  With AMD-Vi, the
> number of MSIs is passed in, but a minimum of a page is allocated for
> the table.  The vector is 8 bits giving indices 0-255.  Even with 128bit
> IRTEs, 16 bytes, 1 page 4096 / 16 = 256 entries, so we don't have to
> worry about overflow.  N MSIs can only have the last one at 255, so the
> guest can't expect to have N vectors starting above 255 - N.
> 
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Just to clarify: Who's the original patch author? The common expectation
is that the first S-o-b: matches From:.

> ---
> Is something like this feasible for inclusion upstream?  I'm asking
> before I look into what it would take to support Intel.

Well, I wouldn't outright say "no". It needs to be pretty clear that this
doesn't put at risk the "normal" cases. Which is going to be somewhat
difficult considering how convoluted the involved code (sadly) is. See
also the commentary related remark at the very bottom.

> e.g. Replace amd_iommu_perdev_intremap with something generic.
> 
> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
> all that has been tested.
> 
> Using msi_desc->gvec should be okay since with posted interrupts - the
> gvec is expected to match.
> 
> hvm_pi_update_irte() changes the IRTE but not the MSI data in the PCI
> capability, so that isn't suitable by itself.

These last two paragraphs look to again be related to the VT-d aspect.
Yet there's the middle one which apparently doesn't, hence I'm uncertain
I read all of this as it's intended.

> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -543,6 +543,31 @@ int cf_check amd_iommu_msi_msg_update_ire(
>      if ( !msg )
>          return 0;
>  
> +    if ( pdev->gvec_as_irte_idx && amd_iommu_perdev_intremap )
> +    {
> +        int new_remap_index = 0;
> +        if ( msi_desc->gvec )
> +        {
> +            printk("%pp: gvec remap_index %#x -> %#x\n", &pdev->sbdf,
> +                   msi_desc->remap_index, msi_desc->gvec);
> +            new_remap_index = msi_desc->gvec;
> +        }
> +
> +        if ( new_remap_index && new_remap_index != msi_desc->remap_index &&
> +             msi_desc->remap_index != -1 )
> +        {
> +            /* Clear any existing entries */
> +            update_intremap_entry_from_msi_msg(iommu, bdf, nr,
> +                                               &msi_desc->remap_index,
> +                                               NULL, NULL);
> +
> +            for ( i = 0; i < nr; ++i )
> +                msi_desc[i].remap_index = -1;
> +
> +            msi_desc->remap_index = new_remap_index;

You zap nr entries, and then set only 1? Doesn't the zapping loop need to
instead be a setting one? Perhaps with a check up front that the last value
used will still fit in 8 bits? Or else make applying the quirk conditional
upon nr == 1?

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -306,6 +306,17 @@ static void apply_quirks(struct pci_dev *pdev)
>          { PCI_VENDOR_ID_INTEL, 0x6fa0 },
>          { PCI_VENDOR_ID_INTEL, 0x6fc0 },
>      };
> +    static const struct {
> +        uint16_t vendor, device;
> +    } hide_irt[] = {
> +#define PCI_VENDOR_ID_QCOM		0x17cb

At least this wants to move into xen/pci_ids.h.

> +#define QCA6390_DEVICE_ID		0x1101
> +#define QCN9074_DEVICE_ID		0x1104
> +#define WCN6855_DEVICE_ID		0x1103
> +        { PCI_VENDOR_ID_QCOM, QCA6390_DEVICE_ID },
> +        { PCI_VENDOR_ID_QCOM, QCN9074_DEVICE_ID },
> +        { PCI_VENDOR_ID_QCOM, WCN6855_DEVICE_ID },
> +    };

May I ask what's the source of information on which specific devices are
affected by this anomalous behavior? Just the Linux driver?

I'm also uncertain #define-s are very useful in such a case. Raw hex numbers
in the table with a comment indicating the device name ought to be as fine.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -127,6 +127,8 @@ struct pci_dev {
>      /* Device with errata, ignore the BARs. */
>      bool ignore_bars;
>  
> +    bool gvec_as_irte_idx;
> +
>      /* Device misbehaving, prevent assigning it to guests. */
>      bool broken;
>  

Overall more commentary would be needed throughout the patch. This field is
just one example where some minimal explanation is missing.

Jan

