Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972EDB2F527
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:22:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088386.1446152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2RD-0002Ce-QU; Thu, 21 Aug 2025 10:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088386.1446152; Thu, 21 Aug 2025 10:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2RD-0002A3-N9; Thu, 21 Aug 2025 10:22:31 +0000
Received: by outflank-mailman (input) for mailman id 1088386;
 Thu, 21 Aug 2025 10:22:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up2RD-00029x-5q
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:22:31 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be16248f-7e78-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:22:30 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-618b62dba1aso1158441a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 03:22:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe018f1943sm173433166b.87.2025.08.21.03.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 03:22:29 -0700 (PDT)
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
X-Inumbo-ID: be16248f-7e78-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755771749; x=1756376549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mSoLkXUvoS3y7n5r2usrSlXtvtQ9nAOgtNtBsIsP/vk=;
        b=BpwbDW6dYF4OcyKfaZO9LZr6UWbnjvvVm+6l8vAxIaBbHLtWidl5cWLWdJTvzjLfcL
         TiPikaMeSa7zkjpY44iurfb2LN+TIFS6N5ZqmGQ7vxGF+vC26Fa/8uc3yJrFxrq163+U
         UYeBEhrjBXubJ7n0vFIkdJEmGeSBDpEaG/v59UEpcjLhLyrZxgWqxL87ztKQG/HBB4ee
         YXE6AN7ztAJr449kKq2uvw6oa2ga9zfDaXIwpT1BnEQvl/EzkDLvkWQRW+3h/Px4fd5G
         RBL3ppHwhT8iYnHIklmFYK4+Ica6ddhjxdsNw5G2guFGHpdc4+gOwsfugrK5Dx+y4n5d
         hz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755771749; x=1756376549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSoLkXUvoS3y7n5r2usrSlXtvtQ9nAOgtNtBsIsP/vk=;
        b=AzO9d3mDm1mMA8/ZQ9U/TqqenOtSkHnC+ZdTdGCgDwHCZLt9FH9FfJ5fn55N6xTXYc
         jFmWxJCbpHr4R0Fooahqk1eE8VSrePMeAZsMett5IR08pKhTZNivAlld0YLIm7Qzilx5
         68m3dtWcIUxQmsSzFR+F6x2xJBUc5yeAIXKoT/rPAx5arg+ZYKGRhDGi9WBmb0mP+lxg
         MBKnzDLgi5A735QlLTNULF2XHySdPnBuRR2/pctgOr7g918Ya1ABEtDRXCPF9XECfSLJ
         MCayRh8T2z2eIqePwt2iDo+VbZ2owpYzLABJr+Zml8wk8HmxQeqypiCBaLvm9nPGVBpI
         A73Q==
X-Gm-Message-State: AOJu0Yy5GSSnpftaMnKjrgAxqxgIFHA7t4BTL88qjOx80yVzK5D5a+fp
	jkLrjpQDsRAKu3IYf9fuiF8b75ofUpk84eQ+raOtTT63kHIywhBfUCr7IA06pIwCKA==
X-Gm-Gg: ASbGncuGft+z3BxWdQAmEEn9EuvvAr56Hlf2dhCj0OCl73cwoHSTNIFmQ5nisOSbpfN
	WgNMBLmPkKGuuokiGvdX5quUeWBSAZLehHJ45uO8hzD4zyy3DcnsA5WVHU2Z7Fm6mJC2R7v20jr
	4UKF9UoEP0lO07NPHCAN3fYRqKzdoqjjDhQbBZDW8BFK+F8opRtUxqwWs5rySzflFQS9iNICSeU
	Ob2fFXFf9IVUSsQj+EUSzqD4X4E7uz+S2w5wcm2K2rTJtyJDYnvJB6/GXew7h+WlB7586McMotk
	2QlTBMzldrDQ/kL8oXWLnB6BliGo3pjY1/T0yEbC4E54yUg0zy+0JeLbmy9XTjemmvFWj7oMKrZ
	RBF6NB/EcG/Sk+joXwxL2zFeG9SdtcazrSoUHQWOpyXMCh7PQit8tz9CITW8FgoDdzB3Zr48NZO
	lDNFXUD5dbzynj4yTAgQ==
X-Google-Smtp-Source: AGHT+IHuxFVV0uxUT9UO2MQfLvh7iCGsvp3p6PWw8krNhBf7Xdin35YEJalPPso4RunDLh73+xpnpg==
X-Received: by 2002:a17:907:1ca6:b0:af9:a1e4:1bbd with SMTP id a640c23a62f3a-afe07b952c8mr167436466b.34.1755771749245;
        Thu, 21 Aug 2025 03:22:29 -0700 (PDT)
Message-ID: <d0f3e8e6-fb33-49b6-9872-ea9478368be3@suse.com>
Date: Thu, 21 Aug 2025 12:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] IPMMU handling for PCIe Passthrough on ARM
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <cover.1755771103.git.mykyta_poturai@epam.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <cover.1755771103.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 12:15, Mykyta Poturai wrote:
> This series introduces IPMMU handling for PCIe passthrough on ARM. It includes
> changes to pci-designware, pci-host-rcar and ipmmu-vmsa drivers to enable
> configuring BDF->OSID->uTLB translation chain needed to pass different PCIe
> devices to different domains.
> 
> Tested on RCar S4 Spider board.
> 
> v2->v3:
> * see individual patches
> 
> v1->v2:
> * see individual patches
> 
> Mykyta Poturai (2):
>   arm/pci: allow designware-based hosts to have private data
>   pci/rcar: implement OSID configuration for Renesas RCar Gen4 PCIe host
> 
> Oleksandr Tyshchenko (1):
>   iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID support

These patches went in already, one causing a randconfig issue. What is this
re-posting about? Are you implying that the entire series is going to be
reverted? (I really expected an incremental patch to deal with the issue CI
ran into.)

Jan

