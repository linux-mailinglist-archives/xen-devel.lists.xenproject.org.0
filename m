Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C9BA27278
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:10:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881441.1291583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIgx-00084N-2y; Tue, 04 Feb 2025 13:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881441.1291583; Tue, 04 Feb 2025 13:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIgx-00081T-0C; Tue, 04 Feb 2025 13:10:15 +0000
Received: by outflank-mailman (input) for mailman id 881441;
 Tue, 04 Feb 2025 13:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yR1u=U3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tfIgv-00081N-2s
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:10:13 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d14f6b9-e2f9-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:10:11 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso38285585e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:10:10 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13146sm222900895e9.4.2025.02.04.05.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:10:09 -0800 (PST)
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
X-Inumbo-ID: 5d14f6b9-e2f9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738674610; x=1739279410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vMH5mtoLnXHJECKB5gH/a3BEvXvqk5p57s/Eb97hodA=;
        b=JiS2sKJgUWo2HnWUx/MDC+FDmcMpJilqD61vEDBi1nzgfLtuTWbXqikESK+8z29yva
         vdQbOcsPpsRWVILYWhClxPVRcz4ESCN/h/MiDuodD+oBPmLCDSGZVRLdmTOB0Nh1dvJS
         aK2IzA1Th8V2OtuGAE2+Kc1DYiyrtzFDgrs4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674610; x=1739279410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMH5mtoLnXHJECKB5gH/a3BEvXvqk5p57s/Eb97hodA=;
        b=OrvacRstUTi8oHB01B8l3uEDa3Peql84H3r/CrqDIE7oj4x0MhIcxGi+M4fyy7Y+kk
         C3+d1hsospB0yyaGvtCuIZYvh5J1b4Z5XZtkl00WpoypXIqzYuP//lJNj1156bCBrrza
         H6leD6nYA99S38GaNGGUsc/2AiQEw/ig8XX3ASEHIGlNRIjrK0btA9ek3oylswxUJWWk
         vjD850TbuhPRh57YBoe84ndaDfHnemJ2FC5JVVd6Abm25Ny29TnJVk/kZnOMCogUm9yQ
         SRnm60FctQl9ImopuypGpqQTP23nYK/fnqNIwT5MXLKXnw+D/g1ic0NPXsO6O0XF11Qk
         BFMA==
X-Forwarded-Encrypted: i=1; AJvYcCWKwY4Y7yS55anVIQThOz3kt0iYB4VoR4l5FZJq3vQ1lZAHuTPCarok/weLDTkO+V6ae1Xl3NouAt8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJwZlWCF47DG0ikZx4QAgUKeRyrOb0/odYfJJxi8RZIN7vTt+i
	c3M5nBehL0a2hWH9xlvEp35xyDtSLqLMYw3kYP/xeJO3aWpYT3jFHnYy5MbheCs=
X-Gm-Gg: ASbGncuGDHfY/kYPv9Uh4g98FLwc9U5PReGw4il4t2yKCHOaGRcwsvjutYElh1jPmkJ
	rBUqM9CNjZgtv0MAvTDLa1wDl6T1cgZdZnd8EIoj4ZwsjkfbmYlYr0oaq6Af0aB4B1UW5fkMjz4
	T3VVTSaxfCVPdmHWTYkoVR1pQsPjF/5l8BWFR4s08Xc4KzJRi2zbrE/K22X0/H0sDk3iDFUPbXs
	6Jpah7xaHXYLQqH0cjvHk8PaaYnaf1A4oec+mGF956hFRwlfCHLqWiIrRm4D6qYtyD9pC6/BBL9
	SJSQ2Ty6iLaSiBzhEo5Wfv5IkgJazD11W/Hvthv8/NsUThS2B5nNrJ4=
X-Google-Smtp-Source: AGHT+IHDoLkePZepuzsWMFBsLvoi3zgc+eo9e5LGB8eYetxiP+iMURnNgbGqziFqxccnzT41jq98zg==
X-Received: by 2002:a05:600c:3583:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-438dc4349dbmr220045445e9.31.1738674610333;
        Tue, 04 Feb 2025 05:10:10 -0800 (PST)
Message-ID: <8c0dc0bb-0fdc-425d-bbe6-796573bb7f61@citrix.com>
Date: Tue, 4 Feb 2025 13:10:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.20 2/4] radix-tree: introduce
 RADIX_TREE{,_INIT}()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
 <e1114d64-61f9-47b9-a1ed-33b526d40089@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e1114d64-61f9-47b9-a1ed-33b526d40089@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2025 1:03 pm, Jan Beulich wrote:
> ... now that static initialization is possible. Use RADIX_TREE() for
> pci_segments and ivrs_maps.
>
> This then fixes an ordering issue on x86: With the call to
> radix_tree_init(), acpi_mmcfg_init()'s invocation of pci_segments_init()
> will zap the possible earlier introduction of segment 0 by
> amd_iommu_detect_one_acpi()'s call to pci_ro_device(), and thus the
> write-protection of the PCI devices representing AMD IOMMUs.
>
> Fixes: 3950f2485bbc ("x86/x2APIC: defer probe until after IOMMU ACPI table parsing")
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> Sadly gcc below 5.x doesn't support compound literals in static
> initializers (Clang 3.5 does). Hence the request in response to v2 has
> to remain un-addressed.
> ---
> v3: Extend description and add Fixes: tag.
> v2: New.
>
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -31,7 +31,7 @@ static struct tasklet amd_iommu_irq_task
>  unsigned int __read_mostly amd_iommu_acpi_info;
>  unsigned int __read_mostly ivrs_bdf_entries;
>  u8 __read_mostly ivhd_type;
> -static struct radix_tree_root ivrs_maps;
> +static RADIX_TREE(ivrs_maps);
>  LIST_HEAD_RO_AFTER_INIT(amd_iommu_head);
>  bool iommuv2_enabled;
>  
> @@ -1408,7 +1408,6 @@ int __init amd_iommu_prepare(bool xt)
>          goto error_out;
>      ivrs_bdf_entries = rc;
>  
> -    radix_tree_init(&ivrs_maps);
>      for_each_amd_iommu ( iommu )
>      {
>          rc = amd_iommu_prepare_one(iommu);
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -68,7 +68,7 @@ bool pcidevs_locked(void)
>      return rspin_is_locked(&_pcidevs_lock);
>  }
>  
> -static struct radix_tree_root pci_segments;
> +static RADIX_TREE(pci_segments);
>  
>  static inline struct pci_seg *get_pseg(u16 seg)
>  {
> @@ -124,7 +124,6 @@ static int pci_segments_iterate(
>  
>  void __init pci_segments_init(void)
>  {
> -    radix_tree_init(&pci_segments);
>      if ( !alloc_pseg(0) )
>          panic("Could not initialize PCI segment 0\n");
>  }
> --- a/xen/include/xen/radix-tree.h
> +++ b/xen/include/xen/radix-tree.h
> @@ -72,6 +72,9 @@ struct radix_tree_root {
>   *** radix-tree API starts here **
>   */
>  
> +#define RADIX_TREE_INIT() {}
> +#define RADIX_TREE(name) struct radix_tree_root name = RADIX_TREE_INIT()

We can still use this form in radix_tree_init(), can't we?

~Andrew

