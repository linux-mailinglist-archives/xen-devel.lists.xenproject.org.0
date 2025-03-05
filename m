Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D2A4FC08
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 11:31:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902153.1310101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpm1a-0006r9-QK; Wed, 05 Mar 2025 10:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902153.1310101; Wed, 05 Mar 2025 10:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpm1a-0006o1-Mu; Wed, 05 Mar 2025 10:30:50 +0000
Received: by outflank-mailman (input) for mailman id 902153;
 Wed, 05 Mar 2025 10:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpm1a-0006m4-1A
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 10:30:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7965def-f9ac-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 11:30:48 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43bd5644de8so3403855e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 02:30:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42e51e8sm13213705e9.26.2025.03.05.02.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 02:30:47 -0800 (PST)
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
X-Inumbo-ID: e7965def-f9ac-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741170648; x=1741775448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VZ7UpXkW5IqQEzTM44e164jNNUa/Agj4+x0JpVCSNno=;
        b=Z46usWdwrc+VEeiNpshCpVnPxNzvpX+r5D7wdH2/v2xq6evjM4yfJikJyqz5gIU3PV
         xBMBHbeNRvsAVK8P+12fyJIy9HnJpH1ebe8MJYwk0LfLtkn3QgWn52HW+Hu+G6qIlfkP
         E00yH2ETvqOoXP4yJv+b/lvQFx2YN0GB+oopF1bSt3GpWWFxml8nNxHpSI4A3nLYasVj
         KRab7jdfKvPmjQFKwvEFS9u1C6HYtZw+UrfQ8nkMV0xzsqdA1NRh5wXaC93ZbTcvawrW
         ESm/Wj/aPgIS56pcSmNdcODRhW+zSutyMYYQIpKDOntOrAUL+fI0GE8eqzxHLXqzIvoc
         R12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170648; x=1741775448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ7UpXkW5IqQEzTM44e164jNNUa/Agj4+x0JpVCSNno=;
        b=w8r8Rv0AMeaRy6fL/aWJOXexaDnzyddRg06lVLChbaOFlZ54ivOJuIFlS87kWO5vcg
         Rvu+M6jD1y0sPQZAquQSCMvNGpNihwjE3Xw3yy5JxfiuVQAgwztjMSP2SsOfQEWLWHYH
         WIyW6LY9RxKe7zRS4DvFxhW2iYWH1ny1vsAkJwG18SCeuByZzqdLK24ZYN8WSaz6zmdw
         jUj2byJZWXgkRst6erP0KN9791JbUdKRz459jG/trBGc1N0X50qtwBz9pjsa08gXx63L
         xLQRmqlIBvIEGUHIcNmXP8E5DGPKiJ4zVtjevWDeR8kVNsIFo2vDt5Zb4+L0zZey3XVU
         Oc0g==
X-Forwarded-Encrypted: i=1; AJvYcCULcO64EW9BlxSqqVuyrW19wqBrO3toNRZGBb2sx3vlMUrL+HV3SA041dO2X339oEz5jvCWaVi4d10=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzr2v7i/Me8zn10RoQz5MLXUSoNX0Ao2mGAH4bFGlj89Is/S+kd
	OhYtrJfd37lavRp/1+bkAvY5DN25htBS3qyW+V2deAjgHRGyGbua1HCenSrHFA==
X-Gm-Gg: ASbGncuhMdQ0j2zZN/iKpW2VwMMrSmo4U7F4NTdCKPI2f2pBhJG0QcUW+aIZwjjMzcc
	4jmczW1dQwG6Za8PyiOWZFltbNFwcvp1eNSo6m3FrmNIkU/gwap5zvXzczCRtyiO6JwOChBTOb8
	FZBpUR6Qv5r3+n1KXPN83lvdd5wHN3ReISb6amEyYleNczx0ICK8LkhT7aWZChB9n4e2W4USgmR
	K4OVat+jDTsdgKhXbujNpY6bWbDV5I7TFjBV3KQ0/PMsuLbFn2A6WxwQcUMYUdb3NBC70XLfp9a
	HsEQx+LvlTVcrlFIhz063Ljqza24YT0tRkfJP4ZR8djGnbQy9Y3LD4VX/9/CR1F0dDSjjUtr/bJ
	sD9bwdUmX5D36u1Cjnx8daa4ixOPuPA==
X-Google-Smtp-Source: AGHT+IGzCBgpIpgqjOZJZDnPqo/bW2nNpFfO9LNnf3UvwX05Tv/B+f5KhnkY32Q/V0YG3fnMAO0Kbw==
X-Received: by 2002:a05:600c:35ca:b0:43b:ce86:b31a with SMTP id 5b1f17b1804b1-43bd29bd205mr16296315e9.22.1741170648110;
        Wed, 05 Mar 2025 02:30:48 -0800 (PST)
Message-ID: <c06573d3-36a1-4146-ac3f-5dbd4d82d22e@suse.com>
Date: Wed, 5 Mar 2025 11:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msi: prevent MSI entry re-writes of the same data
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20250228113237.6116-1-roger.pau@citrix.com>
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
In-Reply-To: <20250228113237.6116-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2025 12:32, Roger Pau Monne wrote:
> @@ -191,8 +193,6 @@ void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask, struct msi_msg
>  
>  static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
>  {
> -    entry->msg = *msg;
> -
>      if ( iommu_intremap != iommu_intremap_off )
>      {
>          int rc;
> @@ -203,6 +203,20 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
>              return rc;
>      }
>  
> +    /*
> +     * Avoid updating the MSI entry if the address and data fields haven't
> +     * changed.  When using interrupt remapping changing the MSI affinity
> +     * shouldn't change the interrupt remapping table index, and hence the MSI
> +     * address and data fields should remain the same.
> +     */
> +    if ( entry->msg.address == msg->address && entry->msg.data == msg->data )
> +    {
> +        entry->msg.dest32 = msg->dest32;
> +        return 0;
> +    }
> +
> +    entry->msg = *msg;

It is perhaps pure luck that iommu_update_ire_from_msi() doesn't use entry's
"msg" field, and hence that this re-arrangement is okay. It's unclear to me
whether going forward this might not bite us.

> @@ -1407,7 +1415,9 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>          }
>          type = entry->msi_attrib.type;
>  
> -        msg = entry->msg;
> +        msg.dest32 = entry->msg.dest32;
> +        msi_compose_msg(desc->arch.vector, NULL, &msg);
> +        entry->msg = (typeof(entry->msg)){};
>          write_msi_msg(entry, &msg);

Hmm, this isn't exactly a "restore" then anymore. That said, re-constructing
the message may even be more correct. Then, however, the question is whether
passing NULL as msi_compose_msg()'s middle argument is really appropriate. A
little bit of commentary may be desirable here in any event, also as to need
to clear entry->msg.

There's (at least) one place where behavior changes with the change of what
we store in struct msi_desc's msg field (previously untranslated, now
translated): dump_msi() wants to use the untranslated form. I fear it can't
even re-construct some of the data it means to log (without reading from
the IRTE).

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1182,7 +1182,7 @@ static void cf_check dma_msi_end(struct irq_desc *desc, u8 vector)
>  static void cf_check dma_msi_set_affinity(
>      struct irq_desc *desc, const cpumask_t *mask)
>  {
> -    struct msi_msg msg;
> +    struct msi_msg msg = {};
>      unsigned int dest;
>      unsigned long flags;
>      struct vtd_iommu *iommu = desc->action->dev_id;

Why not a similar transformation as you do in set_msi_affinity(), eliminating
the local "dest"?

A change like the one here is likely needed in __hpet_setup_msi_irq(), to
prevent accidental "uninitialized struct field" warnings.
hpet_msi_set_affinity() might then also want to use msi_compose_msg(), albeit
that may also be regarded as an independent change.

Jan

