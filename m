Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4EBAFCE40
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 16:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036776.1409222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ9gk-0003Ep-8G; Tue, 08 Jul 2025 14:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036776.1409222; Tue, 08 Jul 2025 14:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ9gk-0003C5-4W; Tue, 08 Jul 2025 14:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1036776;
 Tue, 08 Jul 2025 14:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ9gi-0003Bz-35
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 14:52:52 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3859daf7-5c0b-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 16:52:51 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso3497358f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 07:52:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce4180970sm11979237b3a.93.2025.07.08.07.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 07:52:49 -0700 (PDT)
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
X-Inumbo-ID: 3859daf7-5c0b-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751986370; x=1752591170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WcOmGJzcOzd70Nj8coSFnxaDnV9O0qqqKpu2vlZbB4c=;
        b=TU9mLz+ubRG0dcET7EJxCynMmd3OZQhND7LT2UczvljWzhVFqQ3nrAnG3r6/ReroHz
         9TUQJuDj9loHa3QD4yXUHNH2cLklumWPMlR6uzmhNbPcm1L/j1IoSZb2OoVDQO4yK52a
         iTGTNQYQujWtp/0kDg1f6PPK6mCxqV9ybUwabND960dl2lRZ8QnccRy6bg1+hMjUIjX/
         d1tdhFP4xMJsSpNnFTFAONv2ruaORDp+276fYaLjMZxQzwbKGaH5EmMNEph7oRGTm7Tr
         XhV5sk24iWtVDaV2KSR+LwbMDwk8qpZJrBLSFht1C0vt8qrZ3FW1f1LvKOziITHKoPkO
         rQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986370; x=1752591170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcOmGJzcOzd70Nj8coSFnxaDnV9O0qqqKpu2vlZbB4c=;
        b=AvU33i7yMVIqgt0VplvGSZcPKLDK7f62J5ejJgJcscopgsT1mxxN/j3Pl1/mDoW7GI
         wCSdHmh5fWFTOI+Heny8B332DnezGbilsRQwYAelsvc1iZnzyf3tNXOfwAmFJ3CYsmyQ
         /oKBKpUWRb1H4W6A92s4b7eKpiF2E7fSj5RSQhGQFlYxh3DFbqK4WdB8yEHlGOnyaUGM
         nnFtUFgBgcS6CFPjzmD6wQht6OYipreXkvPU8VTYnS7HvJUQYCl3LaKOW6Os0iC/RHqN
         SF8RScHp76s1S1OhcsBF0i/68v65j6ldfL9yfshPV6Lt4rkXPk0UhAv2+pNNtUnkdciW
         cvBA==
X-Forwarded-Encrypted: i=1; AJvYcCXnvfxtYjjnrCB3EuK9/R2HgUfi0mYQN64+d8YQsxqb0RlfwqxVglpkASpq2NGJ6KYEHftyzvAl3ig=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFyKTrgebpv4jP0Zr5ijowqsbubEeiyXJ0eYz+SupRjmClEaSe
	C5yQsqDGviKRPcT7sPq4MiOcrQX3P3Eq8vc7STVqzDA/M6JH87QZ0Nx1+tSl2yRrsw==
X-Gm-Gg: ASbGncvn3/9B5EFh8NE54/NJWyBOyB1IP+flAznR1+03ApJOIIUSkVATQpsnjLlOyKP
	8D/eS5+kpPMHShgJdi1Hbvgv6g9sUerg2HYvejds9zGcNxle3bfmGlAxb7AdR+OqChfYJDkD+KG
	s0fdpEhWvHvv5I5NS+AUbBLLlb0nhclFnXbCpSGemnO3YxRgfDcTogd0hycB2th+Lcwi0H2eyQy
	W7VjudPCeKm04qm38AMtemFuw+N5QPESx8vZAdViLy0EnNGnzAs6tQw8FA/FnWhPwA0ss3scY4E
	FJziHIa6zN2mnjJ2kuD8Vx21dKQZ2HsL6PCF1VAVZvTDulYQ47n2pFUWj2Gc4RKgtFR8Se6wund
	htz0DYrib6yt90vu0APA1SJIZIDnN/8MyncSke7nw1HNxD1g=
X-Google-Smtp-Source: AGHT+IEfvOCRDituqp/vr9eMiRWufGct6AHWYRf7P+WNSxgYCLQhUN0faQkHtz+66idGBDYzELzpBA==
X-Received: by 2002:a05:6000:2dc7:b0:3a5:75a6:73b9 with SMTP id ffacd0b85a97d-3b4964f4d95mr13489172f8f.11.1751986370187;
        Tue, 08 Jul 2025 07:52:50 -0700 (PDT)
Message-ID: <6e42be51-4dfa-41bb-afe6-5b08d54be08b@suse.com>
Date: Tue, 8 Jul 2025 16:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] vpci: Refactor REGISTER_VPCI_INIT
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250704070803.314366-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2025 09:07, Jiqian Chen wrote:
> Refactor REGISTER_VPCI_INIT to contain more capability specific
> information, this will benefit further follow-on changes to hide
> capability when initialization fails.
> 
> What's more, change the definition of init_header() since it is
> not a capability and it is needed for all devices' PCI config space.
> 
> After refactor, the "priority" of initializing capabilities isn't
> needed anymore, so delete its related codes.
> 
> Note:
> Call vpci_make_msix_hole() in the end of init_msix() since the change
> of sequence of init_header() and init_msix(). And delete the call of
> vpci_make_msix_hole() in modify_decoding() since it is not needed.
> 
> The cleanup hook is also added in this change, even if it's still
> unused. Further changes will make use of it.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> There is a byte alignment problem in the array __start_vpci_array, which can be solved after
> "[PATCH] x86: don't have gcc over-align data" is merged.

I was meaning to suggest a way to actually detect the issue at build time,
but sadly what's wanted to do so will first need adding to gas. Which now
will likely be only after 2.45 went out.

Jan

