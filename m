Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424FAB19D61
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 10:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068905.1432769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqHW-0002J6-Hn; Mon, 04 Aug 2025 08:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068905.1432769; Mon, 04 Aug 2025 08:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqHW-0002H9-Eq; Mon, 04 Aug 2025 08:10:54 +0000
Received: by outflank-mailman (input) for mailman id 1068905;
 Mon, 04 Aug 2025 08:10:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiqHV-0000kE-Aj
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 08:10:53 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89db7b3e-710a-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 10:10:52 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-615c29fc31eso6277241a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 01:10:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8effda1sm6412785a12.1.2025.08.04.01.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 01:10:51 -0700 (PDT)
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
X-Inumbo-ID: 89db7b3e-710a-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754295052; x=1754899852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hqxcAycwW6jREDVQC4ZBaPk+EjKbTlU1RZEony0lA8s=;
        b=NWr2pKOzGoBAkmLVSvoxR9LegS/wTzeUtxVLthBBBguuOm2lV147cInPnmso6kTSAo
         G5KgjUCTWmdK98eEJlP6mB0/gvwklzU+iRLqQ+nCOL3VT1thDpxOEAwvS/hMIAHRYr9Z
         mPY/hNoeEjJn9DOpdC8V0KZhtVdV9vrZDtBJ6qDBGMw0ROo4jxpoN1ReoUVmpJZunhyO
         tnNE5JHw2VY5phZJjoQSrud2oDiBaG9aDltX2AlLRe3ZZm2xxvBwokJg9MAeunJQLbtX
         /76mawJZT6khzEJhWpwSdqpFwTYtJZluk5xmQCgNyos54eVBZqnoQ3kLJh2rjXyelTMu
         aAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754295052; x=1754899852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqxcAycwW6jREDVQC4ZBaPk+EjKbTlU1RZEony0lA8s=;
        b=dy3SOrD31aoziVVED9Q+/NrTv3T/EBuFui8ZrZlmc0om/kWL33CO/1p5Mc1MKGLImd
         6eRVylopoYl7k5a3k5Sy5tBddL3GhWmEB9bViaBTFNKK8AVH0lreBgRkFsBjS4C9bkjn
         2NEwC8joHBPE/ZwWGsi7G3ued8w6EnKK4Qu37fwuHqA827iLMOdKwQqwg1N/m0sU0/5m
         M55PtzB2s+qOJt1h6fiQD78QFISdDf6Kg54YMCrhHbCqNZ6TM8784iYJVCIMDU4nxG4d
         mDmw+ZSjzruJgRFQFUTzZakA/wiDHPeDFqKNdUQWpNA0dFjhQNID7UY3fBEbShuShI+h
         /+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVDHYa9rRjNHQzMTcwei7oYuOnFsnZostPS4fxem+n0euyMZAi8AcW6iRpj5Q4O7FDG6f6tyBGfAVo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdeSylMazpx84uDBXfuBH9g6SoZq97+knCxVgOxw/pLhsAuR1r
	USnLjyC7ulTIr9pzqyWFhbH3ZQuiS2EyT3PA4rd3upb1pJ3nx2kbzyr+w8a/Pf53pg==
X-Gm-Gg: ASbGnctbEmkZ1iIISmDx/zAf2TBXQXu9tUQJLK0sY14NJygmQf59fwL0qsE/6pXb/o9
	0GmXIWjYCfpDSW7ISa5VNrRknv6qKmLWgEXLa9rbK/EdPk/V0ksNAt6SM+itJZ1czsd5m5VZ02F
	YK3f0mTm+Qphhj2OyOGAn5HXzSz6ufWridHNyPzR2+bCLS0HjcJQn4xYKDhapd4qrBSUn/PvT7b
	NOgda7v1PVqANMW9hOeUOK6YUBCskjd7+bIJ603+XsdlbuMAs9NFMn3X7/K+w4H8a9HLob+YeA8
	7ccZ8BS4NL0lzaXUa5oGjaNmNiYoHN1nRm2Ygxt9qw55Tg+jMGgIEIAdmtuluax9ELOYXE8db0E
	hqmZcOy2YizU27nL9LtlMFU4PG+JiOG27tzqn6VcvUevONzvAMrFxRC1NlJTr1Vy8fysQVcYgo1
	KTuWJV8lEM3WJu3JhmFA==
X-Google-Smtp-Source: AGHT+IEBQISzXP/6B35rUZqNFNgjUUDNsTKEZ2yH/7hGami6THUDsyjGE4OO30iwT+FipuVYHgZQ+g==
X-Received: by 2002:a05:6402:510d:b0:612:a507:5b23 with SMTP id 4fb4d7f45d1cf-615e6ed2c68mr7456566a12.11.1754295051954;
        Mon, 04 Aug 2025 01:10:51 -0700 (PDT)
Message-ID: <2464e97d-e950-4645-9aa9-5c2cddab72b2@suse.com>
Date: Mon, 4 Aug 2025 10:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm/pci: Add pci-scan boot argument
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Edward Pickup <Edward.Pickup@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753968306.git.mykyta_poturai@epam.com>
 <98c8889e07d6c82067309d8458e15dd52145b467.1753968306.git.mykyta_poturai@epam.com>
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
In-Reply-To: <98c8889e07d6c82067309d8458e15dd52145b467.1753968306.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2025 11:22, Mykyta Poturai wrote:
> From: Edward Pickup <Edward.Pickup@arm.com>
> 
> This patch adds a Xen boot arguments that, if enabled, causes a call to
> existing code to scan pci devices enumerated by the firmware.
> 
> This patch also makes an existing debug function viewable outside its
> translation unit, and uses this to dump the PCI devices found.
> The debug message is controlled by config DEBUG.
> 
> Additionally, this patch modifies segment loading to ensure that PCI
> devices on other segments are properly found.
> 
> This will be needed ahead of dom0less support for pci passthrough on
> arm.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Edward Pickup <Edward.Pickup@arm.com>

Considering the From: above and this order of S-o-b: Who is it really that
was the original author here?

> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -23,6 +23,7 @@
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>  
>  extern bool pci_passthrough_enabled;
> +extern bool pci_scan_enabled;

With the variable non-static, ...

> @@ -128,6 +129,11 @@ static always_inline bool is_pci_passthrough_enabled(void)
>      return pci_passthrough_enabled;
>  }
>  
> +static inline bool is_pci_scan_enabled(void)
> +{
> +    return pci_scan_enabled;
> +}
> +
>  void arch_pci_init_pdev(struct pci_dev *pdev);
>  
>  int pci_get_new_domain_nr(void);
> @@ -155,6 +161,11 @@ bool arch_pci_device_physdevop(void);
>  
>  #else   /*!CONFIG_HAS_PCI*/
>  
> +static inline bool is_pci_scan_enabled(void)
> +{
> +    return false;
> +}

... what's the point of the wrappers? Constrain the variable as such to
HAS_PCI=y, and use "#define pci_scan_enabled false" in the opposite case.
Just like we do elsewhere in a number of cases.

> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -91,8 +91,13 @@ bool arch_pci_device_physdevop(void)
>  bool __read_mostly pci_passthrough_enabled;
>  boolean_param("pci-passthrough", pci_passthrough_enabled);
>  
> +/* By default pci scan is disabled. */
> +bool __read_mostly pci_scan_enabled;

__ro_after_init?

> +boolean_param("pci-scan", pci_scan_enabled);
> +
>  static int __init pci_init(void)
>  {
> +    int ret;
>      /*

Nit: Blank line please between declaration(s) and statement(s).

> @@ -104,9 +109,26 @@ static int __init pci_init(void)
>          panic("Could not initialize PCI segment 0\n");
>  
>      if ( acpi_disabled )
> -        return dt_pci_init();
> +        ret = dt_pci_init();
>      else
> -        return acpi_pci_init();
> +        ret = acpi_pci_init();
> +
> +    if ( ret < 0 )
> +        return ret;
> +
> +    if ( is_pci_scan_enabled() )
> +    {
> +        ret = scan_pci_devices();
> +
> +        if ( ret < 0 )
> +            return ret;
> +
> +#ifdef DEBUG
> +        dump_pci_devices('c');
> +#endif

If I was a maintainer of this code, I would request such to be dropped.
Or if there was a good reason to have such, I think it would want to be
arch-independent.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1384,7 +1384,7 @@ static int cf_check _dump_pci_devices(struct pci_seg *pseg, void *arg)
>      return 0;
>  }
>  
> -static void cf_check dump_pci_devices(unsigned char ch)
> +void cf_check dump_pci_devices(unsigned char ch)

Note the cf_check here. It, for some reason, ...

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -217,6 +217,7 @@ static always_inline bool pcidevs_trylock(void)
>  bool pci_known_segment(u16 seg);
>  bool pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
>  int scan_pci_devices(void);
> +void dump_pci_devices(unsigned char ch);

... needs reproducing on the declaration. What about x86 though? It'll end up
as a non-static function with no caller outside of the defining CU, hence
violating some Misra rule.

Jan

