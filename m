Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FA9AF584A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 15:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031123.1404844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxJV-0001EA-3p; Wed, 02 Jul 2025 13:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031123.1404844; Wed, 02 Jul 2025 13:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxJV-0001Ci-1B; Wed, 02 Jul 2025 13:15:49 +0000
Received: by outflank-mailman (input) for mailman id 1031123;
 Wed, 02 Jul 2025 13:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWxJT-0001Cc-Oi
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 13:15:47 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa0bad46-5746-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 15:15:46 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so3775278f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 06:15:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5382ef7sm19159061a91.4.2025.07.02.06.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 06:15:45 -0700 (PDT)
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
X-Inumbo-ID: aa0bad46-5746-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751462146; x=1752066946; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1IEZME7EzCjx820R5mdVvdmsNUmq6ttmIvXehsM9pus=;
        b=I81BjfXhGT81rfHhDkKTB3P5L1b9Un6Qi5a0gcwPsJEHgKDT7G8KHkq/91ooFps7qw
         jegS8Tfd1jKTBeXTLAO+wo3Oqru1xX642ZVii4iL+91olUvTav5G1uAMrZFfw5tk7EXe
         9MLsG2SGfT1qWtpDPdqottSXWzhR3jBKQHyT4Y2m6gyvMsDQ6Z0+7BOa9YVrRI6WxWTx
         MtIqFwkaPq4PMh6kvOxDQMuE0YaNxDnZPV2odUydEchMcEDADDzDTnxGZnX3ChQvMVwD
         RZilL+N38Al7EFuzNiuatwpn0J8MIlNRnOrUEU8vo2ZQxs0zrU+eOPtievYZ579W7W05
         T2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462146; x=1752066946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IEZME7EzCjx820R5mdVvdmsNUmq6ttmIvXehsM9pus=;
        b=bjJce2IFwwi2xJcibn0bdv0skt6TZa5zwt7LEiMfx2l7dAunPIfEmLltBAy7hQOZun
         DEN/8AZHsPxKk3WpEz1H3qvxLFATh5U/K1hbNhO43jkNJ0ISb/xJGHfXYwoY8G3CRgM7
         14cPfKRRazW/L08WoW5wMLdzeQ3C2l0ljHwsupcBHdcXSW0HNzO6fO55vnnDoZ2EGMRR
         vD/RBm9Cyc01rQ82zYzV8wEPQWnKAYI1ExBDJn88SmCys0IVdCepRlSvaxvNrp3wW1tw
         aZQfLJbbT4OB4DP3V6MhByQlJt1Y1F2mFcEsuwr707eDhw9WC8+a7LqGlMWbOy1Qrm3F
         9ExA==
X-Forwarded-Encrypted: i=1; AJvYcCWw81qf0VShqJE6Uq1syeQIrltKIiwgiDRxD1mM3IoCVbKsohj7Pc1jsJY6yrKCdDAyttcs92g+LPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf/1hZ9Pb7Zg0RQDnbRmfarE3cafWk4YrllMO2aKuJTqZguGyM
	R7zdcvdMN1g1wudHyHtvc5/v/YHSL+5lrY6z20INpd1Cef67gmZBBNsBx/cakthRk1pu4hqHDZ+
	embU=
X-Gm-Gg: ASbGncsjOCuJQwZQSNXASO/wsU7ScKyTQgsp0LKprt/FgtOKjm58ns94MLw6KZaLzf6
	EXFzr7XJBK8UGSrpHi9Hv5jgDLLWqnycjdRk9SX3Xpm5JuxVBGZvC4KeCTWqTw9v62qDTyP98I7
	Myx8qOSIMXAL3LMjYQogmpEawIo+TN5PUegf7hTR9HDvcnd7gA/JjZt7topQLVUl827N9GdtyiZ
	J45wxdCx3L7Eh3jBatl6dY3mz4fXcjl1stOUW6wI++Hsif4/Gs3oRN9bztRHFSr8Xda15I4IYus
	mDV9qQH/AyHuW+CPWaaU0PuphA1rQtIEY8Zz2kaWOfRJjreDtITDGkwGVAnKkPtY9r6DwN23Lda
	+Nryc9MSrkO2Aiodbh7Sm7LxmfWpW74zHriis3TD0Z31r13U=
X-Google-Smtp-Source: AGHT+IHgTNh1ms8E5sE0gDe4Gm/KyjroLOtSLKVykhvL9VUBV5SQ8nUTGN6cUKByEpghxyOBHvw9PA==
X-Received: by 2002:a05:6000:651:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3b200865ae3mr1992265f8f.32.1751462145956;
        Wed, 02 Jul 2025 06:15:45 -0700 (PDT)
Message-ID: <0a4196db-dfc8-4259-bfef-e62cf3fe17d1@suse.com>
Date: Wed, 2 Jul 2025 15:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] x86: Replace arch-specific boot_domain with the
 common one
To: Alejandro Vallejo <agarciav@amd.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-4-agarciav@amd.com>
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
In-Reply-To: <20250701105706.86133-4-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2025 12:56, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/include/asm/bootfdt.h
> +++ b/xen/arch/x86/include/asm/bootfdt.h
> @@ -3,6 +3,12 @@
>  #define X86_BOOTFDT_H
>  
>  #include <xen/types.h>
> +#include <public/xen.h>
> +
> +struct arch_boot_domain
> +{
> +    domid_t domid;
> +};
>  
>  struct arch_boot_module
>  {
>[...]
> @@ -1048,11 +1050,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
>      /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> -    d = domain_create(bd->domid, &dom0_cfg,
> +    bd->arch.domid = get_initial_domain_id();
> +    d = domain_create(bd->arch.domid, &dom0_cfg,
>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>      if ( IS_ERR(d) )
> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
> +        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));

This being the only place where the (now) arch-specific field is used, why
does it exist? A local variable would do? And if it's needed for
(supposedly arch-agnostic) hyperlaunch, then it probably shouldn't be
arch-specific? Daniel, Jason?

Jan

