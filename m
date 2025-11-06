Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BC8C3AD4F
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 13:15:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156867.1485834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGytY-0007I1-Sa; Thu, 06 Nov 2025 12:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156867.1485834; Thu, 06 Nov 2025 12:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGytY-0007Fx-PO; Thu, 06 Nov 2025 12:15:16 +0000
Received: by outflank-mailman (input) for mailman id 1156867;
 Thu, 06 Nov 2025 12:15:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGytX-0007Fp-Li
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 12:15:15 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3e5b1e-bb0a-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 13:15:13 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b713c7096f9so65444766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 04:15:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7289334288sm202003766b.15.2025.11.06.04.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 04:15:12 -0800 (PST)
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
X-Inumbo-ID: 3f3e5b1e-bb0a-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762431313; x=1763036113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=59BqtCx4cmPQig7Vf46c7RV554Z2/TvCdMGFK7CIRY0=;
        b=gwd45uYmmiL3AT8Vd3Cov5dgpzVB26/kk2guyC3q7NAThv4/05IXvS6tbSqPF5yV0H
         OXkEQ59hBoDadkSexAHggcZLYJajvtHOGxY7JTxhxxO1Y299FwU3LobWmOLnABjj8QRq
         /XWr+ZWOreChepooBdJGJlmk/Zz2Uem9fKHomcT6x+gz0tpMgyTKn8P30CAVTvPG6xtl
         CKXr8MhdczvV5oG4VwzeprG6UkLEXneO7mXVT5X0f6v30yHv/LtmgfsBOnDxQqxEckjh
         m8B8b/VHAZiS4QC2Q8um46cJ0ggwnJD308oyKQ5x2ANr2l8TXeZ0N7OlV1WgquvXfZIC
         UIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762431313; x=1763036113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59BqtCx4cmPQig7Vf46c7RV554Z2/TvCdMGFK7CIRY0=;
        b=oiAtdfA4b0mCCsn7MYGwBTTd1rvDL8k+EZ0utygz+mMDiJqZUhB7imnfyf+UjpjGdc
         iumOPbhu8fXtEctD3bUm8eSvFjcCsqJMTbY/M3XNS/7mv0KxAyknOWfH/9/pLdW8S1t4
         5q5TdFy0ZKEU9QFsVUekKvWs3a6j2BbvB+a+NOMkVSH9o1ozuIKyj3q3QQ0MDBp68sib
         kDJNjh7/batODiNxu9c8zBUWsknk4tbh7o+rYlzeJToEiGkddkGG3jmLN4bncfIW67eG
         jd/UM0JbT0W+zTeIAqvUxyY5ZwPQgDqQIykvTIjGrJKsi6aXLcuDnzcpK9DMsqQDcbtE
         FkLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1zJNKsDVXpSpCUGlWXpKdIWmc7WDQOq28+Q+sSiASRj9VSqdGcJDo5iQo5iZOtgQPVoB/SmLSnyg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmEOsTwI/qNIVw8Oyze8ypg3Y2vYFHDKS62cN3KQd2o3vohhMt
	sDjSq/Pc3bxD9p1iVzv5/Ezsk21O5F7e51kAsiGstY/7c5XnfqaFtyU3j/E6SJPqcQ==
X-Gm-Gg: ASbGncuj440Bv1c59G1FHvQfqYk8WbL4l7fSi34wAqQezQIE6ebfOJn221ZJSvPrty3
	BxhM1iGoW8e9GS70clVLCu2p+TClX8W+csh3P5c+kCZUUpZNazgp3xDVCpZoNrE4vKN0TqGiCKs
	YYlJ9HPxbGzuo090clEZqloHJccF7JOgcSqUMubjkiZay9Lo+upnZOCTtI+eda8NSqjakLronLW
	OlW+4z/rivh1+9Cnwc1MhG+3XQfC8oX1dBvL4If1+Tse+oCd8ibZN0hTw7M3tXotOiwd9YEpJUm
	GkRQglN53Y3QHunbtf0N5aHGtssAmpYoyzrh+Rwk3WQ8Lx9Z14jPt1Sjmp5zUtHZqBuiqrAQwYp
	cWobkitddyfuyWKWDmrvFLhqUvFHXxXVbQGccJyRr4EUp02PjN+V067rWLMtiuO9eXZj5htFto0
	d+3ePJ6QZFArRfzqSfNEArZbTOogEJnqCx+y8NZ6umNd04t87WuaIgscJJnHeK/FywwuL0nQM=
X-Google-Smtp-Source: AGHT+IFt6gEe1ZvKk1PnrUUg+08KFAZ5sAe/UlrgxVnw6SJwKYvEPY82XEMJCEauwiFySNBPC1zwrA==
X-Received: by 2002:a17:907:a4e:b0:b1d:285c:e0ef with SMTP id a640c23a62f3a-b72652bea31mr762381966b.26.1762431312887;
        Thu, 06 Nov 2025 04:15:12 -0800 (PST)
Message-ID: <39458e03-31c1-4aa6-8b66-f6d72ec8bdd9@suse.com>
Date: Thu, 6 Nov 2025 13:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] xen/pci: introduce has_vpci_bridge
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
 <acb8da959fac97fbec7bc086b921e31dd52d44f6.1758618839.git.mykyta_poturai@epam.com>
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
In-Reply-To: <acb8da959fac97fbec7bc086b921e31dd52d44f6.1758618839.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 09:59, Mykyta Poturai wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> has_vpci_bridge is a macro to check if the domain is a domU or is dom0
> with vPCI (pci-scan=yes) enabled.

Hmm. Why would DomU-s, now and forever, not have (virtual) bridges? Wasn't them
gaining (virtual) bridges actually the longer-term plan?

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -230,7 +230,7 @@ bool vpci_process_pending(struct vcpu *v)
>  
>              read_unlock(&v->domain->pci_lock);
>  
> -            if ( !is_hardware_domain(v->domain) )
> +            if ( has_vpci_bridge(v->domain) )
>                  domain_crash(v->domain);
>  
>              return false;
> @@ -492,7 +492,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              }
>          }
>  
> -        if ( !is_hardware_domain(d) )
> +        if ( has_vpci_bridge(d) )
>              break;
>  
>          d = dom_xen;
> @@ -522,7 +522,7 @@ static void cf_check cmd_write(
>  {
>      struct vpci_header *header = data;
>  
> -    if ( !is_hardware_domain(pdev->domain) )
> +    if ( has_vpci_bridge(pdev->domain) )
>      {
>          const struct vpci *vpci = pdev->vpci;
>  
> @@ -564,7 +564,7 @@ static void cf_check bar_write(
>      struct vpci_bar *bar = data;
>      bool hi = false;
>  
> -    ASSERT(is_hardware_domain(pdev->domain));
> +    ASSERT(!has_vpci_bridge(pdev->domain));
>  
>      if ( bar->type == VPCI_BAR_MEM64_HI )
>      {
> @@ -747,7 +747,7 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>  {
>      int rc;
>      bool mask_cap_list = false;
> -    bool is_hwdom = is_hardware_domain(pdev->domain);
> +    bool is_hwdom = !has_vpci_bridge(pdev->domain);
>  
>      if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
>      {
> @@ -829,7 +829,7 @@ static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
>  {
>      unsigned int pos = PCI_CFG_SPACE_SIZE;
>  
> -    if ( !is_hardware_domain(pdev->domain) )
> +    if ( has_vpci_bridge(pdev->domain) )
>          /* Extended capabilities read as zero, write ignore for DomU */
>          return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>                                   pos, 4, (void *)0);
> @@ -866,7 +866,7 @@ int vpci_init_header(struct pci_dev *pdev)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
> -    bool is_hwdom = is_hardware_domain(pdev->domain);
> +    bool is_hwdom = !has_vpci_bridge(pdev->domain);
>  
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));

For none of the changes (also further ones) it is clear (to me) why the
substitution is (logically) correct. For this last instance the variable
name also ends up wrong after the replacement.

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -339,6 +339,15 @@ static inline int __must_check vpci_reset_device(struct pci_dev *pdev)
>      return vpci_assign_device(pdev);
>  }
>  
> +#ifdef CONFIG_ARM
> +#include <asm/pci.h>
> +
> +#define has_vpci_bridge(d) (!is_hardware_domain(d) || \
> +                           (is_hardware_domain(d) && pci_scan_enabled))

Nit: Off-by-1 indentation.

Jan

