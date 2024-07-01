Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAE91D973
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 09:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751288.1159189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBpy-0005zk-TS; Mon, 01 Jul 2024 07:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751288.1159189; Mon, 01 Jul 2024 07:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBpy-0005x4-Q2; Mon, 01 Jul 2024 07:52:34 +0000
Received: by outflank-mailman (input) for mailman id 751288;
 Mon, 01 Jul 2024 07:52:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOBpx-0005wu-2S
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 07:52:33 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dee775d0-377e-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 09:52:31 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso25406501fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 00:52:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91ce433c0sm6203883a91.16.2024.07.01.00.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 00:52:30 -0700 (PDT)
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
X-Inumbo-ID: dee775d0-377e-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719820351; x=1720425151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gWtsr+5693wwdKq5WM7bTGsLq1SE4caI1ccwLmyEATU=;
        b=MHrFVQsqDCwwbbm5CUPx6hF00CHFbXz3lT+LojgLy1n7VrIF2ZtYJ5jxihfTNi5Te2
         uihnV1X8KpT/Y3LWQCaHV7OMfOTDx8G5Ofb3FT8PSiJNrs44L16msnf7A+HX7KglJCNM
         0dZSHGI+NjJcoOd82kHWcty6/MFzPy+zBvkPmureWF7i/EQWwIR9fEg12MfZVCkHgfaj
         xZZx2ttuBsoBxy4ht3NBu+m0zLPBeexcpD3gzrbbGElRSrk+L+Aa9VF8fwZ8WKZfpuz5
         ATRj2kKU5PiB+bIyuvxPu6EPe5lWzHGfhgqlsIPxtXUu+40Aww+Q7cGgu/0Db1xqywza
         W9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719820351; x=1720425151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWtsr+5693wwdKq5WM7bTGsLq1SE4caI1ccwLmyEATU=;
        b=mdEClOzAfTLQNz7An7fTSx80dWAWDCJnZVbxWLPhIkQbirKGg+YuWcKLcwltvQglz6
         OkxwINDRfYVKIzFzZsqlGeS9XuL5Qj3cgfUbkHZa657GoTfFEsKiNHprMHELmvD50XYK
         1goWilTZ+MLulnR++ji0n2laTzMTwBR1toKqTKUTnXytETX9plYvQVEsPCLlrUOhd7NN
         eyo35dGFeEs7amu4f+889mJ+KBeN3e2KBIUYVa6r6SA616cYPH4vPbxAe2QVVEOtnn+1
         4r/tbCK527h7zRxbDOGJtwweH9qNxG57UunuW2mfEB4W47HSOrss3MfhjjKTWNd83j/T
         EKJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpsA25I71m+29lmWTqSHnhahdx24ayYS4Ii29fjrDI52Kl+IYq6TkYDbuaDNlNVKhMyn+mT21UrIHarZYh/jqFTr2gnT1bIfINs+FrpCM=
X-Gm-Message-State: AOJu0YyCW9XSLGj82X2KXedZ/jrwDq2B4AILRUAnztgjJKOqW88TMU2c
	fWFJAmYjsLcjUCLoNGLmnOQGw5wpV/adSC++qX2EwEnG2fxmOlP0/3wT7phk2Q==
X-Google-Smtp-Source: AGHT+IHft7ufbA9oK6MyS2nzRM4US2isPaPXJqjP+B3O5uYzC9+1cpfZ4CgqmgsfdZ4KwIh87Ellzw==
X-Received: by 2002:a2e:9556:0:b0:2eb:ebcd:fc1c with SMTP id 38308e7fff4ca-2ee5e38d301mr29424891fa.26.1719820351244;
        Mon, 01 Jul 2024 00:52:31 -0700 (PDT)
Message-ID: <cdb1890c-a66d-4fa9-9ab6-b678e062e085@suse.com>
Date: Mon, 1 Jul 2024 09:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 3/8] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-4-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240630123344.20623-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2024 14:33, Jiqian Chen wrote:
> The gsi of a passthrough device must be configured for it to be
> able to be mapped into a hvm domU.
> But When dom0 is PVH, the gsis don't get registered, it causes

As per below, it's not "don't" but "may not". As the details don't
follow right away, you may also want to add something like "(see
below)".

> the info of apic, pin and irq not be added into irq_2_pin list,
> and the handler of irq_desc is not set, then when passthrough a
> device, setting ioapic affinity and vector will fail.
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
> Because when probe a driver to a normal device, it calls(on linux
> kernel side) pci_device_probe-> request_threaded_irq->
> irq_startup-> __unmask_ioapic-> io_apic_write, then trap into xen
> side hvmemul_do_io-> hvm_io_intercept-> hvm_process_io_intercept->
> vioapic_write_indirect-> vioapic_hwdom_map_gsi-> mp_register_gsi.
> So that the gsi can be registered.
> 
> Second, why the gsi of passthrough device can't work when dom0
> is PVH?
> Because when assign a device to passthrough, it uses pciback to
> probe the device, and it calls pcistub_probe->pcistub_seize->
> pcistub_init_device-> xen_pcibk_reset_device->
> xen_pcibk_control_isr->isr_on, but isr_on is not set, so that the
> fake IRQ handler is not installed, then the gsi isn't unmasked.
> What's more, we can see on Xen side, the function
> vioapic_hwdom_map_gsi-> mp_register_gsi will be called only when
> the gsi is unmasked, so that the gsi can't work for passthrough
> device.

While this provides the requested detail (thanks), personally I find
this pretty hard to follow. It would likely be easier if it was
written to a larger part in English, rather than in call chain
terminology. But I'm not going to insist, unless others would agree
with that view of mine.

Jan

