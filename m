Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AF895669C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 11:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779458.1189190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyV1-0003hO-GJ; Mon, 19 Aug 2024 09:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779458.1189190; Mon, 19 Aug 2024 09:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyV1-0003cV-Ck; Mon, 19 Aug 2024 09:16:27 +0000
Received: by outflank-mailman (input) for mailman id 779458;
 Mon, 19 Aug 2024 09:16:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sfyV0-0003cP-9v
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 09:16:26 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b53efed3-5e0b-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 11:16:25 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f15dd0b489so57520331fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 02:16:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbdfad42sm5402554a12.47.2024.08.19.02.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 02:16:23 -0700 (PDT)
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
X-Inumbo-ID: b53efed3-5e0b-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724058984; x=1724663784; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xqfXXQo+VGUr7CPyfLola7XWo/mf5CNCWV5+/4hOBck=;
        b=W1V6GbM7fnKTqLjOe9UFtBibkVF7fYDMVIYxPpWZ4soK8yLQmYaqvsNhMKtz3cIIbQ
         QyrM342+3ghqT66T/lcxaGAWJQms0Kr2HQk5epOITDtmLpeXM4XEcb/Sz88wMqD5pvyp
         yuB1ZSYugrm+ynVY2/48zRvYnacncPbm+hneMc3wwMaATKPvrJkV7GBtUuj8SAv8CG80
         saWkvNHBjn09hdbDVaYRhlVniXDZnX9bqiJd9Oyt+ppdRlnWTFRo9D9aC9f/wnzlglsx
         M8m14gwW3YqPDXA2AZJibBYoGF9moQM5ZGNugRQMWVHhKiLuBoyGr5ZUJdlmBU5br7yY
         10Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058984; x=1724663784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqfXXQo+VGUr7CPyfLola7XWo/mf5CNCWV5+/4hOBck=;
        b=vagma6buyTk3VPdiOiL8o4D4niRgFZ4t0ebkhqrtNREQEY4y5Vq9lZ+aVLykmG3jmm
         k08PAFVLJYReRuyc7wgKXd7ryJDYv2CWijpXB0K8PzrLnN6+Oc+k91b3Po7Vsy7Y8ITn
         qNnH5R42ATPigGED1p9HuOuRgewCGNeTKdURGSInhMGVndfJcH0/T84r0mA9TcEgzsR4
         mqyGk3OWLOpYdy4s3X7h0oMQvihGEE7CDqrMoyR0RUcL9Ukx5wZKd77w5AiTUAMFjm17
         5Ai+Bt6NObGSWgO5BPsQgArsLAHAbn9mAcxJh6062hKmFz9/2l1gp71nTIWEZxfOMz2H
         4zvw==
X-Forwarded-Encrypted: i=1; AJvYcCWVbOYbCBVNI7WPxirKEYBg0o6G3aqDKiN0ux+cMN6NSGG5dYY6x+VECy9INGHbO04onj/nxk/eXqhOAa8sRctYh9kUfJDvpBEu9IaMgvw=
X-Gm-Message-State: AOJu0YyJXGtx4gz8XJMPt/caJAr6KWx5AwCFCUKUd2cTWGY3nBUNWKfE
	7Pd7aG/Nj+Rpe6BPzwwFjXqDjWy/HoUz60qDObx8UblGASD7F3r411jM7VQyTQ==
X-Google-Smtp-Source: AGHT+IEeBsoX96eikzTpVNLBBSCeMBfzYwyCdNvQNhgNJpIdgvP+8VQ6GW4WCxIgrp9tCk6vOVgpQA==
X-Received: by 2002:a05:651c:a0a:b0:2f3:cbc3:b093 with SMTP id 38308e7fff4ca-2f3cf4caf48mr38860681fa.43.1724058984180;
        Mon, 19 Aug 2024 02:16:24 -0700 (PDT)
Message-ID: <745cd8cc-59c2-44b8-b42b-1e5e0b3026ca@suse.com>
Date: Mon, 19 Aug 2024 11:16:23 +0200
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

So: Underlying XSA-461 was the observation that the very limited set of
cases where this fake IRQ handler is installed is an issue. The problem
of dealing with "false" IRQs when a line-based interrupt is shared
between devices affects all parties, not just Dom0 and not just PV
guests. Therefore an alternative to the introduction of a new hypercall
would be to simply leverage that the installation of such a handler
will need widening anyway.

However, the installation of said handler presently also occurs in
cases where it's not really needed - when the line isn't shared. Thus,
if the handler registration would also be eliminated when it's not
really needed, we'd be back to needing a separate hypercall.

So I think first of all it needs deciding what is going to be done in
Linux, at least in pciback (as here we care about the Dom0 case only).

Jan

