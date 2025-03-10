Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C862A58E40
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 09:35:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906223.1313670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYbz-000426-KU; Mon, 10 Mar 2025 08:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906223.1313670; Mon, 10 Mar 2025 08:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYbz-00040b-Hj; Mon, 10 Mar 2025 08:35:47 +0000
Received: by outflank-mailman (input) for mailman id 906223;
 Mon, 10 Mar 2025 08:35:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trYbx-00040T-MF
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 08:35:45 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8685edb-fd8a-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 09:35:44 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so8819425e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 01:35:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cef25f075sm54007925e9.28.2025.03.10.01.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 01:35:43 -0700 (PDT)
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
X-Inumbo-ID: a8685edb-fd8a-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741595744; x=1742200544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Tu8M1wbmBvd2Bhn6d98e+bIIfzD1CPCBZ/EgBV4p9c=;
        b=EfH0yAl2WUfpE+DNYHrYHqKAXcmMLZgB6XeN6XpZqpiIMIYJfgYyXQ7n9x+Jy+CrSS
         IXLtBYt3IuQMPmhO/1DGWgl+qYa+WermAqBvJJn5o6xpQxZEqAaCtjAHPzASBPvEbbBu
         1ySJo0saVy2CjrY9FjAd7/OSPUVDVETB79X4ZAF6FR1FnKgIZpgt4EFfNmzXrEgp1ZX/
         LO8e1GyobvMIMqaOlTnjELYvT/pOY/tfXetBPZJLC2V9uKnnY32E/dYvozbsUcSUY4cU
         fcuna9MxewClvNUqVf+zA6xcKwuNdgk9wkJd337ILBpmbWNEb9FysUoyAHoI2Ug9rKdo
         myAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741595744; x=1742200544;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Tu8M1wbmBvd2Bhn6d98e+bIIfzD1CPCBZ/EgBV4p9c=;
        b=CIGVYg2pvXB2di4QIjBjbmUA4J/bU/VAuqrgAkMxhYm/TtEkVe7V0rzjV0LR5qHjOY
         n/lilWZBB28e4Zhd4F08dYgjG0mGQjcbSSgw4gg2HyO0VeN/qbertBysulzgufLs1lf6
         pjFWqkrCKgaA7fxGm55pGY0siGxa4Ki9rijr2advrbniYrTf2ihAp+9stBJyY2a5D3Pm
         ZEE5wtFin64oAhQppFE3KIda8mH8ehlo5z4i8rjZL58kTZfKYdMazRqMgpieqPyaeirR
         glCaHm/E4vqif/srJEwUVFOBgn91xOLwHY/xU2VWOoQIkqyuTTNrdKXGFP2yuMchCDsw
         b2MA==
X-Forwarded-Encrypted: i=1; AJvYcCXTbhXJZPtYpoFEbTQQfru49/U6qNJ1B9jyKwVU6ET6qzqp9woVcL/S31mhDedSfdIcUWBTMdC00nM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzz0Klh4mFubvYtWMQ8baXdhVXTH74h81xGjClrdE0AIpSfApuI
	GOx++GyAxhr8YmuxzDwUX0Mzfx+tDI6wheyMUv3LzRHZTXWvOKkXgtFicJsDfQ==
X-Gm-Gg: ASbGncviM/Wpmv40KLTfG0ZuGDPyC+QEdAkyUTDBjZERa8XL5sWtuMQQFaD8SfaXnbt
	rqrqj4rQ2U4aIuBgrF+V0dfoTE1GEPP+dT+a8MP4TdaKceg/9sev7XGEIO7Td6LgSgtPt0A48qh
	DoLRmH3hbjgM8fmYkzBZW9vZFfT+s6ez544Slb7FySa9liyDdd74cdfx+6JEklxA9F5Q3zFwD8s
	aCylGbCM9RIoEPCoingjhPs/gpUJU+0gSI23OFmlXlFABxCls9QtmdkvWHs1IN7ERPgNr2MDzNA
	PvignBovJrqdc4Fnu6AC9rMpQaQJIjbpwJLd2oTNhWZJv4eWNGYJDBAxvzuT3ctmFikKptFMIlV
	PfJzgkehg+JwsoFzH5lfGMqtz57dVA0209Z9IqO+J
X-Google-Smtp-Source: AGHT+IG+qXa/CeHyg4mAuA3QejpbK8bG2mH99hImli+PWiJ5tPMDOp8OGe0lZDwF1yUkNbPxt9A97g==
X-Received: by 2002:a05:600c:1c9d:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43c601d19cbmr82361235e9.30.1741595744132;
        Mon, 10 Mar 2025 01:35:44 -0700 (PDT)
Message-ID: <fd5c0f83-5236-4aa3-b727-f7769da7beca@suse.com>
Date: Mon, 10 Mar 2025 09:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] PCI: drop pci_segments_init()
From: Jan Beulich <jbeulich@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>
Content-Language: en-US
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
In-Reply-To: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 12:38, Jan Beulich wrote:
> Have callers invoke pci_add_segment() directly instead: With radix tree
> initialization moved out of the function, its name isn't quite
> describing anymore what it actually does.
> 
> On x86 move the logic into __start_xen() itself, to reduce the risk of
> re-introducing ordering issues like the one which was addressed by
> 26fe09e34566 ("radix-tree: introduce RADIX_TREE{,_INIT}()").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Arm maintainers: May I ask for an ack (or ...

> ---
> This is entirely optional and up for discussion. There certainly also is
> an argument towards keeping the function. Otoh on Arm there is the still
> open question whether segment 0 really is kind of special there (as it
> is on x86, largely for historical reasons), or whether the code can be
> dropped there altogether.

... otherwise) here please?

Jan

> ---
> v4: Move x86 logic into __start_xen() itself.
> v3: Adjust description to account for and re-base over dropped earlier
>     patch.
> v2: New.
> 
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -88,7 +88,8 @@ static int __init pci_init(void)
>      if ( !pci_passthrough_enabled )
>          return 0;
>  
> -    pci_segments_init();
> +    if ( pci_add_segment(0) )
> +        panic("Could not initialize PCI segment 0\n");
>  
>      if ( acpi_disabled )
>          return dt_pci_init();
> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
> @@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
>  {
>      bool valid = true;
>  
> -    pci_segments_init();
> -
>      /* MMCONFIG disabled */
>      if ((pci_probe & PCI_PROBE_MMCONF) == 0)
>          return;
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1898,6 +1898,13 @@ void asmlinkage __init noreturn __start_
>      setup_system_domains();
>  
>      /*
> +     * Ahead of any ACPI table parsing make sure we have control structures
> +     * for PCI segment 0.
> +     */
> +    if ( pci_add_segment(0) )
> +        panic("Could not initialize PCI segment 0\n");
> +
> +    /*
>       * IOMMU-related ACPI table parsing has to happen before APIC probing, for
>       * check_x2apic_preenabled() to be able to observe respective findings, in
>       * particular iommu_intremap having got turned off.
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -127,12 +127,6 @@ static int pci_segments_iterate(
>      return rc;
>  }
>  
> -void __init pci_segments_init(void)
> -{
> -    if ( !alloc_pseg(0) )
> -        panic("Could not initialize PCI segment 0\n");
> -}
> -
>  int __init pci_add_segment(u16 seg)
>  {
>      return alloc_pseg(seg) ? 0 : -ENOMEM;
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -219,7 +219,6 @@ void setup_hwdom_pci_devices(struct doma
>                               int (*handler)(uint8_t devfn,
>                                              struct pci_dev *pdev));
>  int pci_release_devices(struct domain *d);
> -void pci_segments_init(void);
>  int pci_add_segment(u16 seg);
>  const unsigned long *pci_get_ro_map(u16 seg);
>  int pci_add_device(u16 seg, u8 bus, u8 devfn,


