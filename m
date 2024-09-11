Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF98974B8E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 09:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796256.1205767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHu5-0001Sm-Je; Wed, 11 Sep 2024 07:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796256.1205767; Wed, 11 Sep 2024 07:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHu5-0001PQ-GI; Wed, 11 Sep 2024 07:36:41 +0000
Received: by outflank-mailman (input) for mailman id 796256;
 Wed, 11 Sep 2024 07:36:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soHu3-0001LI-7W
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 07:36:39 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 948deab2-7010-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 09:36:38 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso113134666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 00:36:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25979fa3sm573062466b.71.2024.09.11.00.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 00:36:37 -0700 (PDT)
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
X-Inumbo-ID: 948deab2-7010-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726040198; x=1726644998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R/q8SaA6D+ErddKtIE+AkzhmC+5behmJljKxZ/rYFrI=;
        b=S1Sxm5kDBz/YRze6sFv7WnpDN2KD/DBaudiTC84zqImTucScg8wQ2/io9nehbE/Txh
         mW5Cz/tpVV5MH/baJRv9wQM43OY53yhoLoCEvwUYhoePv7XDurSj7juELVzGfM82WFx8
         8mi8JUfHFtlFQwo1Mkl4slHe/6j1MZcuUNFdBKOp5/pCfkejOXS1SGNbT4/zCfrHhBao
         cS8KsldDKDiG5+AFQ8rBrcdScP0tHKIcl+Ffh3LDzNBrpRnn6XH/seBZAQteBfAeQWyc
         jkCjimS/1bHglECUxnqagO1m93rIb9HAXUjhrRvE2Ox7NuSyZe75wslCjokifPPS5Lpq
         zdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040198; x=1726644998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/q8SaA6D+ErddKtIE+AkzhmC+5behmJljKxZ/rYFrI=;
        b=ewuozH3MRMFik5ouuoxn4UD4QpquPn2GQBJ0o17wPdFosmSYhTJN9XS8XwkdT6O7YB
         HUaeO2GgH14M56izzGyDoC/qeRLsPzl3TfVesXTya9tkpeC2OB8xnZHPkMfS+oXJGERM
         Luhn81ocgCsgWBpzIRdO4ZWK9lcQzq291jTJU06xsUx1cE1SLgnBIb3xlFVXoWm7kJfK
         Nk1IR8i2j8BAUx+sY/y2i6+kqyolAzDwYKgptQ8UKFUPEatrpCGddBFbHHJw8T1XwT6R
         nvlU9xYVWtWjVmSAqy1IF/bR2CuF++oMCZS3Qi902bBtgt86HI0N4c6jUz76fBp1JfND
         fPAA==
X-Forwarded-Encrypted: i=1; AJvYcCUSLZ15w2P0kHt0uaJneb6LDkT9n3XCURNatoK6k9YVaHNFoJ9iEA+Wwadq2J2NJV1obPZ3ajGo7mM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGqBpj97EH4WtO1N56E3hyDfjOgkvEY3ITCvRrU5OSa9VN63Q/
	zvQTUSd/hjSbQxHROmvmwySjd1vbdqzgth+EKR1uxYAaJCt5gA5hjqN2n90RuQ==
X-Google-Smtp-Source: AGHT+IGYvztYlWeXYaCsWpOSHuRa+y15zsTQHqrioLqRXU+0RJZP364S3sucM/zj8B6UW43ipUg3kg==
X-Received: by 2002:a17:907:94d4:b0:a8d:141a:87cb with SMTP id a640c23a62f3a-a8ffb2459a6mr325379866b.18.1726040198034;
        Wed, 11 Sep 2024 00:36:38 -0700 (PDT)
Message-ID: <fd4ada5a-86dd-42a7-8ab0-7d0f607b85ff@suse.com>
Date: Wed, 11 Sep 2024 09:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v15 1/4] x86/hvm: allow {,un}map_pirq hypercalls
 unconditionally
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
 <20240911065832.1591273-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240911065832.1591273-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2024 08:58, Jiqian Chen wrote:
> The current hypercall interfaces to manage and assign interrupts to
> domains is mostly based in using pIRQs as handlers.  Such pIRQ values
> are abstract domain-specific references to interrupts.
> 
> Classic HVM domains can have access to {,un}map_pirq hypercalls if the
> domain is allowed to route physical interrupts over event channels.
> That's however a different interface, limited to only mapping
> interrupts to itself. PVH domains on the other hand never had access
> to the interface, as PVH domains are not allowed to route interrupts
> over event channels.
> 
> In order to allow setting up PCI passthrough from a PVH domain it
> needs access to the {,un}map_pirq hypercalls so interrupts can be
> assigned a pIRQ handler that can then be used by further hypercalls to
> bind the interrupt to a domain.
> 
> Note that the {,un}map_pirq hypercalls end up calling helpers that are
> already used against a PVH domain in order to setup interrupts for the
> hardware domain when running in PVH mode.  physdev_map_pirq() will
> call allocate_and_map_{gsi,msi}_pirq() which is already used by the
> vIO-APIC or the vPCI code respectively.  So the exposed code paths are
> not new when targeting a PVH domain, but rather previous callers are
> not hypercall but emulation based.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



