Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5D2ACD796
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 07:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005080.1384620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMh3W-00051G-PG; Wed, 04 Jun 2025 05:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005080.1384620; Wed, 04 Jun 2025 05:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMh3W-000503-MN; Wed, 04 Jun 2025 05:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1005080;
 Wed, 04 Jun 2025 05:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMh3V-0004zx-Ij
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 05:52:53 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26bd9628-4108-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 07:52:51 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-442f9043f56so39181155e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 22:52:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2ecebb5f40sm6914100a12.67.2025.06.03.22.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 22:52:50 -0700 (PDT)
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
X-Inumbo-ID: 26bd9628-4108-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749016371; x=1749621171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6xysgJtuGxvMMNRBUfK61fJbx9rk+uZUzkoc8rRqP6Q=;
        b=gPBlp8ldDpIrKvqmYjWf4c96i9O+zTUO+tfKZxq4zlbo16YHUsUo9yvsTT1I2BV7wK
         jEnxGmdWKoc2xe1GIZ5Fz1fNECE4IMTeKBTmdJwvWgtZZmuL40ADxSphhAzbW0XqP7l3
         n9aQiCufi6QiVhR8r6AII1m1O0ogbOlccvrWuk/xFPWkFd7qCT0kJNXwpQBD6X7XPAKK
         5sNm4Ibbf9R1BHAeUfQaE1hYi/ycVTO2M9qRStUEB5qe6hUHTZYFVT+HbM6I6h8lXSX/
         ESRxRPhKI8juA0uBFwGJJDMCQCB60OnYhMIVFlNJw/0HgebHSpRQJaNvebw6BoBDfeuI
         G+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749016371; x=1749621171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xysgJtuGxvMMNRBUfK61fJbx9rk+uZUzkoc8rRqP6Q=;
        b=iKrdB7S8Sx7NzKQYLRBsOsw3Mt1LopTZHX50cJ7ibutCbfrRyv/yOAQcb5LM4zMxtb
         Aa8OzbwaSrOm+ojS38/XLr159p3zR4QmZwiPlbYzNlm1B9C4VVC6wxmS8K3KA+fQ1p05
         HXH2gz18BaKPQx3RTaHmlyjvYY3c9ppfsZmUwxAbbNjNXD4PwISI3ylbBJ3t0NFD/w3D
         w1Hxwv7HXSjAlg7ModIDJuVne0Yb6M7XP7smnJOhqkfmBoh5ZYfWK/gJx71T9QMxwJm9
         Hkw8eibkGEkrmZQFXVHfTyThELjYLaGP2AMgik4j/yPE8klq8CpDZ3svIQNdeiZbo1Ze
         ECcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvTfQFIPTpv37rWoT3Uip/sDE+gtl1iQApO3ge7UMU1sLfRztGDFPs6LaA74AtTOFiIKYjMp123jY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyqva4Hyv2AatFEkR12js0zOHIls99+I9RK8BZpAt04GiZXRTYy
	rTbAEXEud3wgDnzTqVmqS5F3PPj8S9PkJhqJfebSDT1VyvROcg9trMrHF7thEBzjVw==
X-Gm-Gg: ASbGnctytwNZuyuHJsuBKGyvRvi4yuoEvdtKV+FPggOLDAkihATKFZSZxXV7flk36WR
	OemGIKRkspqUx8JmUdPV6Giio610QamFyLTIe3t6i3+u7cqxy7um1K5hwV9R6B5RuXNkFokSHm6
	42MHeTt+xJfg7rc+DyjUki2kZ8Zg4VO0KJbJBwgw1ZvnFe6Tn5235O5SMt8riguvW23snZ1rJzb
	oBU0VWu/bXghdpLjhD0v3Td9xFeSh2SdoJCBoGMHMV3d4Qo50idUAxMnQZDmRXiyHotq0OBoBXI
	5kS2cMfShdW6oLU1n+qkjMdtuNTD4WDtt0MSsw3NFNctp6m5MWc7h56rKTCL/Dz+tlr3BaHjGu4
	2cLgoCnWM3g3zbBXH5Pc5S+DWL1v97HcVDrO8
X-Google-Smtp-Source: AGHT+IH1QA9XaM7sNNEGRlTenWmHQ/dXp2xH90NrOuAIW4vSDmwDtCc3bfIt2F/VpyJQBHE1JIJ1ww==
X-Received: by 2002:a05:6000:2913:b0:3a3:6415:96c8 with SMTP id ffacd0b85a97d-3a51d973ce1mr935968f8f.41.1749016370895;
        Tue, 03 Jun 2025 22:52:50 -0700 (PDT)
Message-ID: <a73e2e41-6101-4a4e-a50e-f68d28a0637f@suse.com>
Date: Wed, 4 Jun 2025 07:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/7] xen/arm: enable dom0 to use PCI devices with
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
References: <cover.1748422217.git.mykyta_poturai@epam.com>
 <c0b080618909580e527d7c6cce6010edf5278d2c.1748422217.git.mykyta_poturai@epam.com>
 <66cda989-efe9-4389-ae8d-cb9bc4dc5239@suse.com>
 <c5ff547e-4e0e-4f31-a07d-55527a6d8457@epam.com>
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
In-Reply-To: <c5ff547e-4e0e-4f31-a07d-55527a6d8457@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2025 15:31, Mykyta Poturai wrote:
> On 02.06.25 11:11, Jan Beulich wrote:
>> On 28.05.2025 11:12, Mykyta Poturai wrote:
>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>
>>> Enable the use of IOMMU + PCI in dom0 without having to specify
>>> "pci-passthrough=yes". Due to possible platform specific dependencies
>>> of the PCI host, we rely on dom0 to initialize it and perform
>>> a PHYSDEVOP_pci_device_add/remove call to add each device to SMMU.
>>> PHYSDEVOP_pci_device_reset is left untouched as it does not have the
>>> pci_passthrough_enabled check.
>>
>> Just to re-raise the question here: Is this actually correct?
> 
> I'm afraid I don't quite understand your concerns here.
> 
> The purpose of this patch is to relax the pci_passthrough_enabled checks 
> and make PCI physdev ops work with passthrough disabled.
> The reset op worked independently of PCI passthrough being on or off and 
> will continue to do so after this patch.
> If your concerns are about the correctness of allowing reset to always 
> work, you specifically requested this behavior in the patches 
> implementing it here[1].

Right, yet even there I had already asked for possible differing opinions.
Plus the case I had mentioned was specifically Dom0, which fits here.

Jan

