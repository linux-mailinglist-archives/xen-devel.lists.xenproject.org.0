Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65BBA591CC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 11:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906416.1313863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1traj5-0006n0-RN; Mon, 10 Mar 2025 10:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906416.1313863; Mon, 10 Mar 2025 10:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1traj5-0006la-Or; Mon, 10 Mar 2025 10:51:15 +0000
Received: by outflank-mailman (input) for mailman id 906416;
 Mon, 10 Mar 2025 10:51:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1traj4-0006lU-93
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 10:51:14 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 948d1454-fd9d-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 11:51:11 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso9220255e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 03:51:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf6c74f38sm33861315e9.20.2025.03.10.03.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 03:51:10 -0700 (PDT)
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
X-Inumbo-ID: 948d1454-fd9d-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741603871; x=1742208671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wzmehQ4pIDj8/sRLN/NhOagiHJebn3c57Zcma0dsm/M=;
        b=fvJ9IIWZ6fpWAbDk1N30AFPT7Ck07+TjVVEZ2BU9rZB25KVU6SFQz3D6PvFAfNSinA
         B/RLqMGA+4um8Y4dxc3zD4yp11fnsmvnZrvjboWP20HPF7yiI3QyhaOcNuM8Mgn92rfa
         AYT9kIRFh/G5qkZEV7aVkHXYHzf3BgneSklh4FWYbYUtP1AbRBv7Rzthnaz3ieca1ewg
         tqih9/9dB+9j9H1M0P6KoEA0pIUYM76uAQf9t3kSJsf/5AMB0bHxdgppg2GxxISYQVjj
         u8gL0oJgeNH/Jbj20e5KradbMEdQb2eaoxrNcyERd3285Ava+tj96jHW0Ic+8Ci/V2pq
         3VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603871; x=1742208671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzmehQ4pIDj8/sRLN/NhOagiHJebn3c57Zcma0dsm/M=;
        b=LrU+wu6+JgP6Ib0LR+g8UVS6mGNqzzDDrumdIutDFTauJVuwzUxuE48FPPJ8wnTNhk
         2ndGJ2VzC9MwGkO9NZk8uYIHn2Dz7tYWsdnfEQDMCQVgSneULeAH5YdJvH94nBqPBWhB
         gsSIBp4LPqviAPGw57kH2kyKqcVQvXmlgT6BhE8IeFVV71Uu+Y2MEslGVK0IG5Ve1me+
         DpBPxShrv3V69sk3Dnq96vnKQ2BhUp9Ucxbp/xVJ8nTHPSakVaoJztfV7/jwOpj7J2mT
         +RjyrP+rK9/4s8QITupwOxokdU3TYGEcEKGl8v4FgKz27qs/aSnGIeM6r5Uuw8BXAELK
         LJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJgy958mpKkQELQJXSSvtpRnH9HiTesMOrihDIfNPyuOfKnri14iGGc/r0k1o92HRDmTOROh/qv2c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIn+OtuaJzDtc6C80p34InxI29RNvMMKD0Nc/12ABlrMipNbTO
	sG3no0CT0uhbm+Ivt7xf58EZAmfsh34Drtjs8+ADmiamt7blUvoh/H7H6UIFDA==
X-Gm-Gg: ASbGnctvO5kZ91FMETaQB148p79p93ZCTKmVZ6TIaebogA7X7sVB9nGi07U2SnBDl/z
	P48UoCDAeK3J6qZmrqPm7s/jMHSUAGtEn7VuQOVf0Nxxwr3NDLJbbZCGzvJs2LKivjCzT2+EYg1
	Bz+2FNeaE+M03DoGiXYkS2aAFpeVR609bNNIjjV15TVRpnYbCTJMR4A29LFi2m89La6kzXMOvHo
	hR0GhDE34DCWQ0dqXmWdQYo0oKOr3y0sC0CEm0InY9CcYIUkecUzfKlQwW7o1hLH2a+rfT4LOSc
	ujhnzS0qhWX7w+yJBZPV/e+lZ80YYVXW1xAVhZGz5TtHk0hwxNn6IQcpJm5p4R70Gv/Uj7/xQn1
	Swlli5rrTne+dWC1tLTimYd/9c7kZOA==
X-Google-Smtp-Source: AGHT+IFplJVqNIfE6TPtDRpiNXOvhW5YCRHQHQfoxxZb0bwAwbtP7ofueGlSXQuZoxZr1J3Xyt7Fnw==
X-Received: by 2002:a05:600c:46ca:b0:439:88bb:d002 with SMTP id 5b1f17b1804b1-43c5a629b5bmr76113665e9.23.1741603871123;
        Mon, 10 Mar 2025 03:51:11 -0700 (PDT)
Message-ID: <507eef19-92ff-44ca-bd0a-86299949c03b@suse.com>
Date: Mon, 10 Mar 2025 11:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/iommu: avoid MSI address and data writes if
 IRT index hasn't changed
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20250310095535.46033-1-roger.pau@citrix.com>
 <20250310095535.46033-3-roger.pau@citrix.com>
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
In-Reply-To: <20250310095535.46033-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.03.2025 10:55, Roger Pau Monne wrote:
> Attempt to reduce the MSI entry writes, and the associated checking whether
> memory decoding and MSI-X is enabled for the PCI device, when the MSI data
> hasn't changed.
> 
> When using Interrupt Remapping the MSI entry will contain an index into
> the remapping table, and it's in such remapping table where the MSI vector
> and destination CPU is stored.  As such, when using interrupt remapping,
> changes to the interrupt affinity shouldn't result in changes to the MSI
> entry, and the MSI entry update can be avoided.
> 
> Signal from the IOMMU update_ire_from_msi hook whether the MSI data or
> address fields have changed, and thus need writing to the device registers.
> Such signaling is done by returning 1 from the function.  Otherwise
> returning 0 means no update of the MSI fields, and thus no write
> required.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two purely cosmetic suggestions and an only loosely related question below.

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -415,7 +415,9 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>  
>      ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
>  
> -    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
> +    rc = iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
> +
> +    return rc < 0 ? rc : 0;

Only tangential here, but: Why does this function have a return type of
non-void, when neither caller cares?

> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -492,7 +492,7 @@ static int update_intremap_entry_from_msi_msg(
>                 get_ivrs_mappings(iommu->seg)[alias_id].intremap_table);
>      }
>  
> -    return 0;
> +    return !fresh ? 0 : 1;
>  }

Simply

    return fresh;

?

> @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
>      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>                                              &msi_desc->remap_index,
>                                              msg, &data);
> -    if ( !rc )
> +    if ( rc > 0 )
>      {
>          for ( i = 1; i < nr; ++i )
>              msi_desc[i].remap_index = msi_desc->remap_index + i;
> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -506,6 +506,7 @@ static int msi_msg_to_remap_entry(
>      unsigned int index, i, nr = 1;
>      unsigned long flags;
>      const struct pi_desc *pi_desc = msi_desc->pi_desc;
> +    bool alloc = false;
>  
>      if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
>          nr = msi_desc->msi.nvec;
> @@ -529,6 +530,7 @@ static int msi_msg_to_remap_entry(
>          index = alloc_remap_entry(iommu, nr);
>          for ( i = 0; i < nr; ++i )
>              msi_desc[i].remap_index = index + i;
> +        alloc = true;
>      }
>      else
>          index = msi_desc->remap_index;
> @@ -601,7 +603,7 @@ static int msi_msg_to_remap_entry(
>      unmap_vtd_domain_page(iremap_entries);
>      spin_unlock_irqrestore(&iommu->intremap.lock, flags);
>  
> -    return 0;
> +    return alloc ? 1 : 0;
>  }

Like above, simply

    return alloc;

?

Jan

