Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F42A6AA90
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 17:05:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922875.1326679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIOH-0001jl-UX; Thu, 20 Mar 2025 16:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922875.1326679; Thu, 20 Mar 2025 16:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIOH-0001iH-Rm; Thu, 20 Mar 2025 16:05:05 +0000
Received: by outflank-mailman (input) for mailman id 922875;
 Thu, 20 Mar 2025 16:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvIOG-00019L-E3
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 16:05:04 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 155ae143-05a5-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 17:05:03 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so11011345e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 09:05:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fcea6ecsm2029985e9.5.2025.03.20.09.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 09:05:02 -0700 (PDT)
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
X-Inumbo-ID: 155ae143-05a5-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742486703; x=1743091503; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7jKzLz6cZ0LjVB8OQSlICDzQ/aoAWhMFdeZ8tZJAuIA=;
        b=Qr+EK7KHsU9MHNrZknIoJ87nftwmTTGqsBttUMrT+4JvdVIyfa3vymrNipEXZc4iDL
         k6fMBtoTDpYgwCvR1NZaRdqdozTPlhNE4wZcRLURdEBgw3mS+1gR4+76vfZwvRcVidhP
         HO5kmBMbwhDbrfQ6xly8M9js91U8P5/I3Tpr5WeaVmjp5iidcXDY7AlMBr/iQu7RkcJz
         9bLHy8Oeux8xuei86K3G4hOYhYPAP9GYLfJt8tb1/zkWwMTcMzcyCtx5fNUbxSOKh4XP
         xcmm19H71/Mdaa9xRPwHYIdsSx4NpJ7ImQmelIeGmWwqNZU+QU9/0AAxEQ3XdO3VBxI9
         PPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486703; x=1743091503;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jKzLz6cZ0LjVB8OQSlICDzQ/aoAWhMFdeZ8tZJAuIA=;
        b=s1IJJbfps6r4j+2OgdRrDKrijAgywiSfUZYSkKYGFcUD449Za6k15WtoIkYGiuwsBV
         Ul8Eap0hv5ZBFagbmUd9W8v9/GBzfI3WFhKWuPr/SrakgXU2105y5V88hIqGIaLaesIc
         XFHku7H2O7CHyxZdohVwi38t7wD10AxLqSc7TYyMQ8HljMlNVvTWbeSMMGwbZsx2zgNG
         e3D1i+SKRv0elc8kct/j1sW8G1abithGF27z6LD8sjm5uOCMouUxv17BAhVEpEonCUaa
         gEkCIyZL/ivHDPI5gba5PbRCrbSzjKo8W6Ya592Qug/fD9zw1JUolac1kLbE1kbBmjoB
         lmsA==
X-Forwarded-Encrypted: i=1; AJvYcCWH9n/7+9oI/yDVmitTBFuMsiZpSjsQRexuoxzqraiKQNCHSwBRInJefPgyKbXy2mKwKbi6t9vaa7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpHrgS+IxQMIb9pX8M2ijij0UObFw6VhG442N7fbcDcjSEOo0C
	fgVnVZwC1MrEcM+7kdOj3PPdsUiwHDtdhi78MGC/PjYJLUHCkBfXSzBhAnINfQ==
X-Gm-Gg: ASbGnct+9KwKyBxBT2yp7Ma0JWs1bpB2Qv8NR08r00KZpceUe+ft+AKmH947rS7kK/t
	So3+GBRSqQ14DOaR51I13WPI67O2yHvGV6FsEXQnHsYhMZjz8VHtXg5B8FuNGczz/SQzyQzQU7i
	rAtEqL89BKwEYmLO5oATgrV02hthVl//FSWBTGDtEYHLyfIIf3A45N9axsNZSHtuwS+UXvCG9re
	DnhCQ3tnTH+S6RymKTIVFM9UUec8sPERW4qe4gMRKnko1z3TAnMcL6ixKgSKazogxgsKpuJVjrY
	Chm43oAQiLbFg9MGdi6fU/qEZBgPaSjYwnwMoiChp8cfDUBLZE2g9SRV946EzdIKNf212ufeUPq
	I98iW39qc1e3xg1oc3tfpTka9drMBpeifRu1YpTuT
X-Google-Smtp-Source: AGHT+IFhQ607hPjnSzl6pW23sPNxQBmVu0TSmGRAPjoP76Y/WXutBX3zyz3j66Ho+6pem6bdvbI8ng==
X-Received: by 2002:a05:600c:3508:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43d49547751mr30045865e9.13.1742486702851;
        Thu, 20 Mar 2025 09:05:02 -0700 (PDT)
Message-ID: <1807d7d5-0f4e-4a8d-8acf-d4ca9fe7329b@suse.com>
Date: Thu, 20 Mar 2025 17:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Andrii Sultanov <sultanovandriy@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1742311401.git.sultanovandriy@gmail.com>
 <0d578d1bd063f5d58f3dbaf2ab0e21143333a50e.1742311401.git.sultanovandriy@gmail.com>
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
In-Reply-To: <0d578d1bd063f5d58f3dbaf2ab0e21143333a50e.1742311401.git.sultanovandriy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 16:30, Andrii Sultanov wrote:
> Following on from 250d87dc3ff9 ("x86/msi: Change __msi_set_enable() to
> take pci_sbdf_t"), struct amd_iommu has its seg and bdf fields
> backwards with relation to pci_sbdf_t.

This being backwards isn't relevant anymore, is it?

> Instead of regenerating sbdf_t
> from seg+bdf, make the struct contain pci_sbdf_t directly, which simplifies
> code.
> 
> I've avoided aliasing pci_sbdf_t's fields here, so all the usages of
> amd_iommu->seg|bdf dropped down a namespace to amd_iommu->sbdf.seg|bdf
> and required renaming.

Is this really meant to be part of the description? Feels like it was more
meant to be a remark in the post-commit-message area.

> Bloat-o-meter reports:
> add/remove: 0/0 grow/shrink: 6/11 up/down: 135/-327 (-192)
> Function                                     old     new   delta
> _einittext                                 22028   22092     +64
> amd_iommu_prepare                            853     897     +44
> _hvm_dpci_msi_eoi                            157     168     +11
> __mon_lengths                               2928    2936      +8
> _invalidate_all_devices                      133     138      +5
> amd_iommu_get_reserved_device_memory         521     524      +3
> amd_iommu_domain_destroy                      46      43      -3
> build_info                                   752     744      -8
> amd_iommu_add_device                         856     844     -12
> amd_iommu_msi_enable                          33      20     -13
> update_intremap_entry_from_msi_msg           879     859     -20
> amd_iommu_get_supported_ivhd_type             86      54     -32
> amd_iommu_detect_one_acpi                    918     886     -32
> iterate_ivrs_mappings                        169     129     -40
> flush_command_buffer                         460     417     -43
> set_iommu_interrupt_handler                  421     377     -44
> enable_iommu                                1745    1665     -80
> 
> Resolves: https://gitlab.com/xen-project/xen/-/issues/198
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>
> 
> ---
> Changes in V3:
> * Dropped the union with seg+bdf/pci_sbdf_t to avoid aliasing, renamed
>   all users appropriately
> 
> Changes in V2:
> * Split single commit into several patches
> * Added the commit title of the referenced patch
> * Dropped brackets around &(iommu->sbdf) and &(sbdf)
> ---
>  xen/drivers/passthrough/amd/iommu.h         |  4 +--
>  xen/drivers/passthrough/amd/iommu_acpi.c    | 16 +++++-----
>  xen/drivers/passthrough/amd/iommu_cmd.c     |  8 ++---
>  xen/drivers/passthrough/amd/iommu_detect.c  | 18 +++++------
>  xen/drivers/passthrough/amd/iommu_init.c    | 35 ++++++++++-----------
>  xen/drivers/passthrough/amd/iommu_intr.c    | 26 +++++++--------
>  xen/drivers/passthrough/amd/iommu_map.c     |  6 ++--
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 22 ++++++-------
>  8 files changed, 66 insertions(+), 69 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
> index 00e81b4b2a..ba541f7943 100644
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -77,8 +77,8 @@ struct amd_iommu {
>      struct list_head list;
>      spinlock_t lock; /* protect iommu */
>  
> -    u16 seg;
> -    u16 bdf;
> +    pci_sbdf_t sbdf;
> +
>      struct msi_desc msi;
>  
>      u16 cap_offset;
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
> index 5bdbfb5ba8..025d9be40f 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -58,7 +58,7 @@ static void __init add_ivrs_mapping_entry(
>      uint16_t bdf, uint16_t alias_id, uint8_t flags, unsigned int ext_flags,
>      bool alloc_irt, struct amd_iommu *iommu)
>  {
> -    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(iommu->seg);
> +    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(iommu->sbdf.seg);
>  
>      ASSERT( ivrs_mappings != NULL );
>  
> @@ -70,7 +70,7 @@ static void __init add_ivrs_mapping_entry(
>      ivrs_mappings[bdf].device_flags = flags;
>  
>      /* Don't map an IOMMU by itself. */
> -    if ( iommu->bdf == bdf )
> +    if ( iommu->sbdf.bdf == bdf )
>          return;
>  
>      /* Allocate interrupt remapping table if needed. */
> @@ -96,7 +96,7 @@ static void __init add_ivrs_mapping_entry(
>  
>              if ( !ivrs_mappings[alias_id].intremap_table )
>                  panic("No memory for %pp's IRT\n",
> -                      &PCI_SBDF(iommu->seg, alias_id));
> +                      &PCI_SBDF(iommu->sbdf.seg, alias_id));
>          }
>      }
>  
> @@ -112,7 +112,7 @@ static struct amd_iommu * __init find_iommu_from_bdf_cap(
>      struct amd_iommu *iommu;
>  
>      for_each_amd_iommu ( iommu )
> -        if ( (iommu->seg == seg) && (iommu->bdf == bdf) &&
> +        if ( (iommu->sbdf.seg == seg) && (iommu->sbdf.bdf == bdf) &&
>               (iommu->cap_offset == cap_offset) )
>              return iommu;
>  
> @@ -297,13 +297,13 @@ static int __init register_range_for_iommu_devices(
>      /* reserve unity-mapped page entries for devices */
>      for ( bdf = rc = 0; !rc && bdf < ivrs_bdf_entries; bdf++ )
>      {
> -        if ( iommu != find_iommu_for_device(iommu->seg, bdf) )
> +        if ( iommu != find_iommu_for_device(iommu->sbdf.seg, bdf) )
>              continue;
>  
> -        req = get_ivrs_mappings(iommu->seg)[bdf].dte_requestor_id;
> -        rc = reserve_unity_map_for_device(iommu->seg, bdf, base, length,
> +        req = get_ivrs_mappings(iommu->sbdf.seg)[bdf].dte_requestor_id;
> +        rc = reserve_unity_map_for_device(iommu->sbdf.seg, bdf, base, length,
>                                            iw, ir, false) ?:
> -             reserve_unity_map_for_device(iommu->seg, req, base, length,
> +             reserve_unity_map_for_device(iommu->sbdf.seg, req, base, length,
>                                            iw, ir, false);
>      }
>  
> diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
> index 83c525b84f..4defa0a44d 100644
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -40,7 +40,7 @@ static void send_iommu_command(struct amd_iommu *iommu,
>                       IOMMU_RING_BUFFER_PTR_MASK) )
>      {
>          printk_once(XENLOG_ERR "AMD IOMMU %pp: no cmd slot available\n",
> -                    &PCI_SBDF(iommu->seg, iommu->bdf));
> +                    &PCI_SBDF(iommu->sbdf.seg, iommu->sbdf.bdf));

Simply &iommu->sbdf? Much like you do e.g. ...

> @@ -85,7 +85,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
>              threshold |= threshold << 1;
>              printk(XENLOG_WARNING
>                     "AMD IOMMU %pp: %scompletion wait taking too long\n",
> -                   &PCI_SBDF(iommu->seg, iommu->bdf),
> +                   &iommu->sbdf,

... here?

> --- a/xen/drivers/passthrough/amd/iommu_detect.c
> +++ b/xen/drivers/passthrough/amd/iommu_detect.c
> @@ -162,8 +162,8 @@ int __init amd_iommu_detect_one_acpi(
>      spin_lock_init(&iommu->lock);
>      INIT_LIST_HEAD(&iommu->ats_devices);
>  
> -    iommu->seg = ivhd_block->pci_segment_group;
> -    iommu->bdf = ivhd_block->header.device_id;
> +    iommu->sbdf.seg = ivhd_block->pci_segment_group;
> +    iommu->sbdf.bdf = ivhd_block->header.device_id;

Could this now be done in a single assignment, using PCI_SBDF()?

> @@ -500,7 +500,7 @@ static struct amd_iommu *_find_iommu_for_device(int seg, int bdf)
>      struct amd_iommu *iommu;
>  
>      for_each_amd_iommu ( iommu )
> -        if ( iommu->seg == seg && iommu->bdf == bdf )
> +        if ( iommu->sbdf.seg == seg && iommu->sbdf.bdf == bdf )
>              return NULL;

Similarly here making a local sbdf up front would allow the two comparisons
to be folded.

> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -558,14 +558,14 @@ void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
>  
>      if ( !dt[dev_id].tv )
>      {
> -        printk("%pp: no root\n", &PCI_SBDF(iommu->seg, dev_id));
> +        printk("%pp: no root\n", &PCI_SBDF(iommu->sbdf.seg, dev_id));
>          return;
>      }
>  
>      pt_mfn = _mfn(dt[dev_id].pt_root);
>      level = dt[dev_id].paging_mode;
>      printk("%pp root @ %"PRI_mfn" (%u levels) dfn=%"PRI_dfn"\n",
> -           &PCI_SBDF(iommu->seg, dev_id), mfn_x(pt_mfn), level, dfn_x(dfn));
> +           &PCI_SBDF(iommu->sbdf.seg, dev_id), mfn_x(pt_mfn), level, dfn_x(dfn));
>  
>      while ( level )
>      {
> @@ -730,7 +730,7 @@ int cf_check amd_iommu_get_reserved_device_memory(
>               * the same alias ID.
>               */
>              if ( bdf != req && ivrs_mappings[req].iommu &&
> -                 func(0, 0, PCI_SBDF(seg, req).sbdf, ctxt) )
> +                 func(0, 0, sbdf.sbdf, ctxt) )

sbdf was initialized from PCI_SBDF(seg, bdf), not PCI_SBDF(seg, req), so this
looks wrong to me.

> @@ -578,7 +578,7 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
>          return -EINVAL;
>  
>      for_each_amd_iommu(iommu)
> -        if ( pdev->seg == iommu->seg && pdev->sbdf.bdf == iommu->bdf )
> +        if ( pdev->seg == iommu->sbdf.seg && pdev->sbdf.bdf == iommu->sbdf.bdf )

Fold the two comparisons into one again?

Jan

