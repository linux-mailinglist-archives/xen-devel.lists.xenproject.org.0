Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDEA90B2DE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742403.1149214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDiM-0001tU-0U; Mon, 17 Jun 2024 14:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742403.1149214; Mon, 17 Jun 2024 14:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDiL-0001rS-Se; Mon, 17 Jun 2024 14:52:09 +0000
Received: by outflank-mailman (input) for mailman id 742403;
 Mon, 17 Jun 2024 14:52:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJDiK-0001rK-S2
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:52:08 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b451679-2cb9-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 16:52:07 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6f0c3d0792so513924966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 07:52:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f86dfdb22sm145574166b.77.2024.06.17.07.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 07:52:07 -0700 (PDT)
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
X-Inumbo-ID: 2b451679-2cb9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718635927; x=1719240727; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx1wzW7/Kzm5E6sX8YV5e9fXpW4+X/mgyYQf3ioxS0A=;
        b=UKgOVL+Q4vXG/W7bcKG7ibTpWEH7eAPtG/T6owYIzWfmaBHO1HB2GBdRhiWQkg+tsT
         fWXILR89+V0mgUKejni0cCit9lmjhVv9lIHc9RX11NEaQ0nfNQj2KAYDQccReabqaQxU
         JHJg95PsUzIuRMstvDRc6YSoh3JmuoJ5nF+YE4+UP1KHAMn0N08Pv6dVeF/oq77y1CBI
         69EIsxow68IjYOncnzDz3oogrU24k3uVoNS/rIR1WMJfXd7JBLSm42mY20ovpQ3GjHEA
         W9OgIX07HYkHS2hPrWyp0t9yM/aTQYMpFw0G9vMOx/iNybsholPsUx5vKSr9x+chMbl7
         muNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635927; x=1719240727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yx1wzW7/Kzm5E6sX8YV5e9fXpW4+X/mgyYQf3ioxS0A=;
        b=IEGJOt3WI0S0lYmmC86Y6K7wdjGSe9daXYt4Zbuy6EmpXsI3+1ZA3fTKliiNMDkBRW
         w/kiE6pOm2C8WlK5hCrw+vcEqpQ6cZzXsfknLzRJP8+2kJu7vteDEBtq9bSQ3yOHt1We
         5YFLtS8ROuDWqoHE2Vp7DWilg06RwhDOFQr42fvqe88mP7Vg50yMdfLdWPzDT0EjMoZo
         /Z0rLQIDykP5KxB//PslVvvOJl2mgGHZVEoMroRL6ePZFTJSs077lR7B+bjSipvhVH6K
         uW9LT/oxmfjuE8gNvt0xjpT+Tpl15WVRy/66m5wYVsrh7KfHmhQYglzaRoqQPf5y+wPN
         lBAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNHKbXyGM2zOFnF9ZX3vuMLvFr2UUx4lTA2BGx3BpM4yEPbSRDNAhpFQEf/jMiqR4woeLU17UQ0YCc2PiJ2MePbWhMeYdVxnBosyoPm7k=
X-Gm-Message-State: AOJu0YzhL3M/rCpMpcjSLvAWlyQMwJHj3MRGjQi8RXU/jMq9i6zf1XhP
	dtgoEeH9S/iVTglQom77swDnA+D38RynbionCtkuQ5/7EBkThImPbovBRCMhRg==
X-Google-Smtp-Source: AGHT+IG1UzbLqhgaIVDrRJYaVEaXsK7EJ0KpVTqfnJy3uR24H6rrcN+skomr16Yp7jlSFWOReBD8Xw==
X-Received: by 2002:a17:906:528a:b0:a6f:501c:5da8 with SMTP id a640c23a62f3a-a6f60d27e07mr754006966b.22.1718635927304;
        Mon, 17 Jun 2024 07:52:07 -0700 (PDT)
Message-ID: <ed36b376-a5f0-457b-8a1e-61104c26ffce@suse.com>
Date: Mon, 17 Jun 2024 16:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-4-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240617090035.839640-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 11:00, Jiqian Chen wrote:
> The gsi of a passthrough device must be configured for it to be
> able to be mapped into a hvm domU.
> But When dom0 is PVH, the gsis don't get registered, it causes
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
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> The code link that will call this hypercall on linux kernel side is as follows:
> https://lore.kernel.org/xen-devel/20240607075109.126277-3-Jiqian.Chen@amd.com/

One of my v9 comments was addressed, thanks. Repeating the other, unaddressed
one here:
"As to GSIs not being registered: If that's not a problem for Dom0's own
 operation, I think it'll also want/need explaining why what is sufficient for
 Dom0 alone isn't sufficient when pass-through comes into play."

Jan

