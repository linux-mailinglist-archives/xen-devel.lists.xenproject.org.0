Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA595EA96
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 09:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783340.1192657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siUFp-0003pB-11; Mon, 26 Aug 2024 07:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783340.1192657; Mon, 26 Aug 2024 07:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siUFo-0003n8-Tr; Mon, 26 Aug 2024 07:35:08 +0000
Received: by outflank-mailman (input) for mailman id 783340;
 Mon, 26 Aug 2024 07:35:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siUFn-0003mx-T0
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 07:35:07 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b68c82a6-637d-11ef-8776-851b0ebba9a2;
 Mon, 26 Aug 2024 09:35:05 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f3ea86377aso41660461fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 00:35:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a4c43dcsm5504215a12.69.2024.08.26.00.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 00:35:04 -0700 (PDT)
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
X-Inumbo-ID: b68c82a6-637d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724657705; x=1725262505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D3wrz/wXUtAoX4MlKaY6tCmyhosp49RzRGS6sqJiMZ0=;
        b=QrLHl6G0qyXIvK2VvCcWdtWkAExx8GMgRLuvnBRqYW3HX9oHBsXYrVFghhfkIit8Oy
         kzXJJiYwwOkx5wY557A4CmAnfyPX/dGHPIQf/jJt88Vk/LfMFlMWkRypMypP8Wdvy/R1
         Q5R22mvLziyroRjPWRgzPg9jATbv3g+9rbCNcf/X0bpCD7xzw6SmXHRVwBfZl2rNoeqd
         qsG4kusuV7EUZO+f2degtmWMVenn1jYBO2IZ2qG1SGNbeHqyY3C8NjZuimQfMaJ71EU3
         daoeppMNQowCLviKgONGZaufDJydsarTa5sv4UyFd74lXfXB17E7FF7SFGosERX7fO4N
         40qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724657705; x=1725262505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3wrz/wXUtAoX4MlKaY6tCmyhosp49RzRGS6sqJiMZ0=;
        b=IEVhDZfEqAJQdzebhlhP/T29QSuNW/+y5w7a7uyOEGwlurdvMm01tpYkuf9cOKk+Bf
         Nh+y94+nj6vDXX9XmI4xFc/q8FjKgjbxqW+MqmOqplXJgoCyN/JJT+3E6hBuUg0tFdME
         X2nKWsgtljbhpIsOqcwNf89CNQFm4T44Sh1ZsYWmV6MMMAd9orgzZsLqXgmilXya0FGB
         vUxvQjMr3HbFaBZB5n3M+7ClOGh11k8Wt/1Ev8sEkj++rfFtGiqvvgFpEJQcR2fuXZJ1
         e1qg3C5i9TRR4xTomjE+rVfvwnBVT/KqeOPNdmcgKVlOUt3ip+roKXNm4mg5afmYgm+p
         Bw+g==
X-Forwarded-Encrypted: i=1; AJvYcCVgkizqDEvYZnaOmjj+wZKCNMgnmvwKuRq5LI+4bzfe4dFWO2Ih6XT2oIRgDGp0IEo5lcGfjvLh1WQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpHoDVma9/QaBoYqGgwq1pG91jeauhgYOAI8+Za/TCzT92UppT
	3tNHc6wOf9KKwchcxGikT6Q63stPWiy3gTMb33Qb4kdMeDpDzcHwCaVdsyb/QA==
X-Google-Smtp-Source: AGHT+IFA8rA1Qw+HeIHe4PjVONsiMSU76kVNkm8eg2Y56aswRGku5KGndyyHShXLGk+Px+nx5YtCQQ==
X-Received: by 2002:a05:651c:507:b0:2ef:2dc7:a8f7 with SMTP id 38308e7fff4ca-2f4f48ef4bcmr60599891fa.7.1724657705067;
        Mon, 26 Aug 2024 00:35:05 -0700 (PDT)
Message-ID: <6d527021-7d71-452a-b4fc-5a41f6ca8493@suse.com>
Date: Mon, 26 Aug 2024 09:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v13 3/6] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <gwd@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-4-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240816110820.75672-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 13:08, Jiqian Chen wrote:
> The gsi of a passthrough device must be configured for it to be
> able to be mapped into a hvm domU.
> But When dom0 is PVH, the gsis may not get registered(see below
> clarification), it causes the info of apic, pin and irq not be
> added into irq_2_pin list, and the handler of irq_desc is not set,
> then when passthrough a device, setting ioapic affinity and vector
> will fail.
> 
> To fix above problem, on Linux kernel side, a new code will
> need to call PHYSDEVOP_setup_gsi for passthrough devices to
> register gsi when dom0 is PVH.
> 
> So, add PHYSDEVOP_setup_gsi into hvm_physdev_op for above
> purpose.
> 
> Clarify two questions:
> First, why the gsi of devices belong to PVH dom0 can work?
> Because when probe a driver to a normal device, it uses the normal
> probe function of pci device, in its callstack, it requests irq
> and unmask corresponding ioapic of gsi, then trap into xen and
> register gsi finally.
> Callstack is(on linux kernel side) pci_device_probe->
> request_threaded_irq-> irq_startup-> __unmask_ioapic->
> io_apic_write, then trap into xen hvmemul_do_io->
> hvm_io_intercept-> hvm_process_io_intercept->
> vioapic_write_indirect-> vioapic_hwdom_map_gsi-> mp_register_gsi.
> So that the gsi can be registered.
> 
> Second, why the gsi of passthrough device can't work when dom0
> is PVH?
> Because when assign a device to passthrough, it uses the specific
> probe function of pciback, in its callstack, it doesn't install a
> fake irq handler due to the ISR is not running. So that
> mp_register_gsi on Xen side is never called, then the gsi is not
> registered.
> Callstack is(on linux kernel side) pcistub_probe->pcistub_seize->
> pcistub_init_device-> xen_pcibk_reset_device->
> xen_pcibk_control_isr->isr_on==0.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



