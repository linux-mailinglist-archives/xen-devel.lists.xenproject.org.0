Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIgoNvY152mg5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:31:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB7F4382EE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288589.1568847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6WC-0003rJ-6u; Tue, 21 Apr 2026 08:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288589.1568847; Tue, 21 Apr 2026 08:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6WC-0003oZ-3D; Tue, 21 Apr 2026 08:31:40 +0000
Received: by outflank-mailman (input) for mailman id 1288589;
 Tue, 21 Apr 2026 08:31:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF6WA-0003oS-74
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:31:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6W9-00DgwI-K0
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:31:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e735e0-e002-0a2a0a5209dd-0a2a45049682-24
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:31:37 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e735e9-1dec-0a2a45040019-d1558036dde7-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:31:37 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso17332595e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:31:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4412150a092sm340796f8f.23.2026.04.21.01.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 01:31:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776760297; x=1777365097; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ejUCKJBJuIVKOh3AShHgtlyYlNQiSlVxp2XulL+yZxM=;
        b=TRKqmXt1pcpo0bRNOlYLk96AKvj+mVMQp0iKmonyRnGl/CTtPdfjwexKrgRFgcQKET
         hU/tlYrD3ZJykfOOxMQWBmkAeFqFH4wFYtNxyziTUzveqDvcE77ynypEe7258mQE/Ey4
         wRltMu05zwQ4FsfSLXhBagQgB7ryvfkqQoOvG3nfMrlxN+AFfSnf36cidt5Yybhbzv5g
         iXxnSvruQcMu29j/y/9AVPcPQHlx+if/xXwweC24GtFKWh6sx/lNcxUV5co1/Ipy2zZd
         k4sJt+HAiXofldCEeU0iW2AxvCUNsw3+66YFmwyjLGLcoNyxQitpXz/pHFDqYTi6792s
         niYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760297; x=1777365097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejUCKJBJuIVKOh3AShHgtlyYlNQiSlVxp2XulL+yZxM=;
        b=SZfi27+5G8Yj5eaFxVRy5XEWj2BNoDHrL+Ek7Gc+f2s5X0RV/5ceBla8XsYHQeIzBu
         EMXxSxKbTavGBm8bAqiwTXomGTkZIW/8hkOZpgNcca99iy9spEeo68K8m8ze3HUV6bYd
         EdyYYdUZCZwVtZTp7zwTr7YqWJWhkBAjZFDZJWyFlgvdxXxAB1ipxt/mibmyuA+b+E5E
         QzyQTl5AP4NKtBsqaXu8ZNs0aAt9r3GKC9bX3Sa6g2MrZ57Uyq7LwhJE3dUPDZZj/Obw
         MVOWncEwk0ZOAO77S72UxkPAyvpsscwFI9ZV5KRQOzrtDVOMh6Z6vW5krV9+FDXJ7IXi
         RcMg==
X-Forwarded-Encrypted: i=1; AFNElJ9ERg9sl9WOT0tdMNla06zbbq40duTsl1LY5Ivb9G1gMnSsHN9sWpNykgQfbm52pfuW6PMHrvFsuAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxr3ijTLSPxfSASbKGWaXWKaOF0dXvbEsA3Z6vZfyCZ3JLsG+Js
	/yzTEkackJYAqDubvRZkzMck9wiIPqmTv788PWAscoiMUyxrys+2lgP0Ub56dQsh7Q==
X-Gm-Gg: AeBDietevXxy6m2R0o5eZLK/B/W60SzEalz+0JELb6wn0g8zhhKpVqyg+MA1jHTvEfT
	O3Oz6PsLu7EIARBH1GZ7dihwLsxW2DygvUiJQ3Lr9KA8I81k91nCVb2lY4yACogshpgYFYrQwG1
	RhD/PdQ8Cqwbckj+BjmRTrNPeRNP7XqKsv4HKgOJcf1qJZ7qOA5tyJYPNeQC5SpWrshDSrnh3AF
	EaQ8Z51dU9Icgxi9lyT0+/5jyCRZC4VxbFx+6n5wSsIpmDpO1gVQhnv3OC16zF+Iikv6CuKuE5E
	rJJJ8iZXvg5vhw6Ln34X5MR7OFZSZMe7upeDqnyNWjQGJIYuBoAyn61FhxrFs2hzM7+zd9SpTHb
	rUB7WbsDAkeIMox9PRCGWPTTvICFJOChCWBHCP4uP/9ccWxzy3Ufeney13ISlT0ggoWMntRuy1s
	t3txra+9+g7+CfAOhw4+MBAuuhgf5C2K+vq9MaxbiCYBXsKvpXEE/tJ3Idq1tVPhEqc91gqDfLm
	i5kT6FSNqgdHbP4k96Tq1OudosZJB0EKwMr
X-Received: by 2002:a05:6000:40de:b0:441:1ca1:6404 with SMTP id ffacd0b85a97d-4411ca1642cmr5284888f8f.18.1776760296724;
        Tue, 21 Apr 2026 01:31:36 -0700 (PDT)
Message-ID: <2a2275ce-3c84-4db8-b4d5-79c4cd6c9e8b@suse.com>
Date: Tue, 21 Apr 2026 10:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] pci: Allow platforms to modify BAR adresses
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1776756291.git.mykyta_poturai@epam.com>
 <a0f623792497ab92cfb64c50bd17d28138e10b99.1776756291.git.mykyta_poturai@epam.com>
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
In-Reply-To: <a0f623792497ab92cfb64c50bd17d28138e10b99.1776756291.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776760297-2B1663FF-D4C9B6CA/0/0
X-purgate-type: clean
X-purgate-size: 2264
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4BB7F4382EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 09:57, Mykyta Poturai wrote:
> This patch is a preparatory work for adding Region ID support on Renesas
> R-Car series boards. Add new host bridge op "fixup_bar" that allows
> platforms to modify BAR addresses before they are mapped.
> 
> Because x86 don't have support for PCI Host Bridge drivers, add another
> level of indirection in form of platform_pci_fixup_bar() function, that
> will call host bridge op on ARM and do nothing on x86.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/include/asm/pci.h  |  3 +++
>  xen/arch/arm/include/asm/vpci.h |  9 +++++++++
>  xen/arch/arm/vpci.c             | 12 ++++++++++++
>  xen/arch/x86/include/asm/vpci.h |  6 ++++++
>  xen/drivers/vpci/header.c       |  2 ++
>  5 files changed, 32 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 7c3211823f..398a4eb746 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -80,6 +80,9 @@ struct pci_ops {
>      void (*init_bus_range)(struct dt_device_node *dev,
>                             struct pci_host_bridge *bridge,
>                             struct pci_config_window *cfg);
> +    void (*fixup_bar)(struct pci_host_bridge *bridge,
> +                      unsigned int bar_num,
> +                      paddr_t *addr);

I'm not an Arm maintainer, but if such a hook - used only when a certain
CONFIG_* is active, as per patch 2 - was introduced in common or x86 code,
I'd ask for the hook to also be conditional. Doing so avoids accidental use
without ...

> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -189,6 +189,18 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
>      return 1;
>  }
>  
> +void platform_pci_fixup_bar(const struct pci_dev *pdev,
> +                                          unsigned int bar_num,
> +                                          paddr_t *addr)
> +{
> +    struct pci_host_bridge *bridge = pci_find_host_bridge(pdev->sbdf.seg, pdev->sbdf.bus);
> +
> +    if ( bridge->ops->fixup_bar )
> +    {
> +        bridge->ops->fixup_bar(bridge, bar_num, addr);
> +    }

... such a conditional around it.

Jan

