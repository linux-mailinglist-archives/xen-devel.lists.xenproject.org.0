Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6DAB070D6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 10:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044971.1415022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxlG-00079e-6l; Wed, 16 Jul 2025 08:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044971.1415022; Wed, 16 Jul 2025 08:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxlG-00078K-3m; Wed, 16 Jul 2025 08:45:10 +0000
Received: by outflank-mailman (input) for mailman id 1044971;
 Wed, 16 Jul 2025 08:45:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubxlF-00078E-8r
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 08:45:09 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d247b1d-6221-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 10:45:08 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so4829271f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 01:45:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd6068sm13538198b3a.32.2025.07.16.01.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 01:45:06 -0700 (PDT)
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
X-Inumbo-ID: 2d247b1d-6221-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752655507; x=1753260307; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri+nMJBIqQ/3BJ1gjegL8iyYPZ66nDxvWsykEeCzTNo=;
        b=PJTTLCDne+7g47AytuPvqN8EWP3KzYSmWx/9ZXEqb19nBa8IEcx8CDkCrKKulRk3Et
         PXjxHpmMITGiimNaaNcGney16hH25oSA8Q9NDsaeQTQV8nLwyx6+MKLYRocnfuPmdT/2
         KCP9tihu29uWomFdaFvr/U8UkU4lh97FCikhKVszDjYjA7b0Gd+lYPqYAT4iWl4N9YF8
         2VJwVUZTJklBVC1D4n6+Sy8yDRiHwp0U/yYxNWQ+Dd8hylOo8Op6u+4dYyiTh7Zo+QGS
         jjgbbquV0sN8Oa6monCzHk4OGS6NqHYf3GekGdyJeNHZ3JNF0Z/fm/1/OoGj0x/tK84e
         BFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752655507; x=1753260307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri+nMJBIqQ/3BJ1gjegL8iyYPZ66nDxvWsykEeCzTNo=;
        b=FNBFw1yhL+hvCTwzZKqlNILHcnVom5XwFeHU9ZUketM+EvUhLrK8cx/1XghhnETc48
         /rrDP6XrokI6ZdEwNlppsHfdBjnK7PvpS5WVOvun5h2SUS+frpxyZAMtO4eqpVaQ2u9O
         iXniuDOIgcQfFOwYhM186iZtNzqgi3Emsa26l54G+SKoNLjSV5AcIh1ofn+cwsYC56jU
         30nfNmujL7Hth+myYJbbbAM1MbwgZYoyuMGg1zNKO+woW856Us3OUnA4Uo0xoRpLsglA
         Xodhp61B7+fwUD6YYIV6htFRGuthwKJDvGzI190BzCgp63sEa748oIcdRduUEcFlTxlZ
         0GIg==
X-Forwarded-Encrypted: i=1; AJvYcCViscXiKUdEFMgaCi7mznfwJ6Hk2qscnf2X1fLOBi7E4McwR/QmwE/RsTaP9otRdqUeOj5tdcokCp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7jQJE5DlfXZJ3jXF7GYX8O2LXrmHOEtduaGI+aBxnpqzxa8MP
	oTTxuPzkB+z6TfIEMWcDHu5K7m1u9NtHKjKvFlNiZhXVPMHL/Ys8d8z+/vIBNAEKnw==
X-Gm-Gg: ASbGncup2q+XzTLPzsws8B3pmc0XHlozwJXDbuJTkVNqAqe1Rahq63R4abURFJF8aMA
	yIV+w5kLm5V18fboxO/r5aatJMDRQGJhwRpeDubk8V4ZZf/RHyDfLpRYJyiBfTHetZP+t4yx1aB
	zDwpzEovKib7d6p8viEjZTchFWS/aIEetIcwLWBknFtcJxzSX8CHA12m6is9QaKmdPAnqHrCD8B
	M4BZpU9pAU220un3cTMfB7DFKSxzqunGmIUa06QY17MoV1wF6/O6JWcrf7u1UDEDoHVUQN7B91N
	6skxzeZ4fe0LslfkLZK830de98Enzt/0BCRWx3/QXhWs4Iq0/XkMsUL+96DjkfgNB9movZUim5U
	qKwaRB9Hjsg+E+X75vRX2mg/E6IBFgPUgtiCXD+dGBbswhetx4IbTqCTGj6rveyYuLuig+tVWDQ
	wkjkJmUuE=
X-Google-Smtp-Source: AGHT+IGCcSU9YQa5bXaZ0OlQSw2ORIwBlW7ilhbe7aW2gr6Bk4nAFLXRjaBDmXB4zWbB1SyG172L7Q==
X-Received: by 2002:a05:6000:64b:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3b60dd4f79dmr1784102f8f.16.1752655507397;
        Wed, 16 Jul 2025 01:45:07 -0700 (PDT)
Message-ID: <64974c4f-3e53-4806-a785-c36451552bd0@suse.com>
Date: Wed, 16 Jul 2025 10:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/2] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1752649797.git.mykyta_poturai@epam.com>
 <7fee1963a17015a4b77b0ac10618198a2647acb0.1752649797.git.mykyta_poturai@epam.com>
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
In-Reply-To: <7fee1963a17015a4b77b0ac10618198a2647acb0.1752649797.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 09:43, Mykyta Poturai wrote:
> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -64,4 +64,10 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
>  struct rangeset;
>  int pci_sanitize_bar_memory(struct rangeset *r);
>  
> +/* PCI passthrough is always enabled on x86 so no special handling is needed */
> +static inline bool arch_pci_device_physdevop(void)
> +{
> +    return false;
> +}

The comment is somewhat odd, as it talks about pass-through when the function
is all about physdevop. A connection wants making imo. Plus isn't it benign
right now whether the function returned false or true? From an abstract
perspective, it returning true would perhaps make more sense (as opposed to
the generic stub in include/xen/pci.h). IOW I think the return value wants
changing _and_ the comment wants to clarify that either value could be used
with the present call sites (thus helping people finding themselves in need
of altering the return value, in order to use the function elsewhere).

I also think this would better go directly below is_pci_passthrough_enabled().

Jan

