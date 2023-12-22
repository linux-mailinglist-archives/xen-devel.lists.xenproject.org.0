Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F404081C6CF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 09:46:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659264.1028789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGbAa-0000Aw-8v; Fri, 22 Dec 2023 08:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659264.1028789; Fri, 22 Dec 2023 08:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGbAa-00008i-6C; Fri, 22 Dec 2023 08:46:12 +0000
Received: by outflank-mailman (input) for mailman id 659264;
 Fri, 22 Dec 2023 08:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2k+=IB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGbAZ-00008c-II
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 08:46:11 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d3ec999-a0a6-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 09:46:09 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3367f8f8cb0so1539654f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 00:46:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a4-20020adff7c4000000b003366da509ecsm3758401wrq.85.2023.12.22.00.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 00:46:08 -0800 (PST)
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
X-Inumbo-ID: 8d3ec999-a0a6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703234768; x=1703839568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fQEBXwweOx++P9CgfuZJxzI/5Z5BDAWa9A5BziGKOlE=;
        b=Cab42e4XFi91lbSEqKxRgnxec6Tok+P9EMaLZRrSrroA5r8RBDzduLkQnKAR668OZM
         ooXQv16ypCwhs5um02TxlXuSg1oGhcjmlZNsb0CCHim/ORoF8GKnU/6avxHzpm+Rq1Qn
         2WLLeN64ckG+esm5p54QS9qSBJidSuj/DT7wclRRkmUyg5IkpvotFNsOaMhzExbd5WG/
         1nT3ZESahamrIBBaoaWbGYJj0T7leJ2Kz/zIwK25aOYa1bJ/xNLYx0zyRsHvMZZP/QMg
         gbjeoOQIgfJxdfFfN2/bv4QJ9y1rbL6/lJoGiDhpxlhsDJT7DR8vykC/d1cR9caSAzps
         Br+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703234768; x=1703839568;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQEBXwweOx++P9CgfuZJxzI/5Z5BDAWa9A5BziGKOlE=;
        b=NJ62yg2B+GvrD+/NWYpQ2aqwiscM6yzjtrRyhm99zPFU7WAc7PFHH41wUufrCUKQ3f
         JNieH0bYTKQE/XhHeBMfKVnmt+lbL+bUBw/LttiJA9Xsw5f2HlSkbBWbi84PajW62cNV
         WVsFwDUVDQnxMveA0OSHE81tq+Qm6rzhxs5uDIiH0OFADBuOJMj5sL3trJ58xklk/pXy
         1eLC33acXyTtMTyVRbsugEpmH+7h6fOvrmTx0bsiJKWLPEw/m93ieNtf2B/yPFY1oKER
         zmMTL1X5jCgEN4Bx6jM+BEf5NJpcPU00hmIlYDtvL9n6g0CpXGa3KmW5CtILv9BXABvd
         e5Lg==
X-Gm-Message-State: AOJu0Yx5Bf8q7tshxETdfIaRM4iDc+WuzvXP2+1Yrth0GBl0pyTDACcN
	cyCLopYWukOIpss2KKFE4agWT/GB6OcW
X-Google-Smtp-Source: AGHT+IElBoJugbZXs+ia3aAKE3IILjdZGVf0a+OwgevMCWVPfH1cr+Yd13ArU33MKk1fu5G7eOGFtw==
X-Received: by 2002:adf:ec09:0:b0:336:957:2aec with SMTP id x9-20020adfec09000000b0033609572aecmr581773wrn.100.1703234768559;
        Fri, 22 Dec 2023 00:46:08 -0800 (PST)
Message-ID: <f539144c-885a-461c-a506-bdb73e626a65@suse.com>
Date: Fri, 22 Dec 2023 09:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com>
 <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com>
 <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com>
 <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com>
 <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
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
In-Reply-To: <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.12.2023 21:41, Sébastien Chaumat wrote:
> Le jeu. 21 déc. 2023 à 14:29, Juergen Gross <jgross@suse.com> a écrit :
> 
>> On 21.12.23 13:40, Jan Beulich wrote:
>>> On 20.12.2023 17:34, Sébastien Chaumat wrote:
>>>> Here are the patches I made to xen and linux kernel
>>>> Plus dmesg (bare metal,xen) and "xl dmesg"
>>>
>>> So the problem looks to be that pci_xen_initial_domain() results in
>>> permanent setup of IRQ7, when there only "static" ACPI tables (in
>>> particular source overrides in MADT) are consulted. The necessary
>>> settings, however, are known only after _CRS for the device was
>>> evaluated (and possibly _PRS followed by invocation of _SRS). All of
>>> this happens before xen_register_gsi() is called. But that function's
>>> call to xen_register_pirq() is short-circuited by the very first if()
>>> in xen_register_pirq() when there was an earlier invocation. Hence
>>> the (wrong) "edge" binding remains in place, as was established by
>>> the earlier call here.
>>>
>>> Jürgen, there's an interesting comment in xen_bind_pirq_gsi_to_irq(),
>>> right before invoking irq_set_chip_and_handler_name(). Despite what
>>> the comment says (according to my reading), the fasteoi one is _not_
>>> used in all cases. Assuming there's a reason for this, it's not clear
>>> to me whether updating the handler later on is a valid thing to do.
>>> __irq_set_handler() being even an exported symbol suggests that might
>>> be an option to use here. Then again merely updating the handler may
>>> not be sufficient, seeing there are also e.g. IRQD_TRIGGER_MASK and
>>> IRQD_LEVEL.
>>
>> I understand the last paragraph of that comment to reason, that in case
>> pirq_needs_eoi() return true even in case of an edge triggered interrupt,
>> the outcome is still okay.
>>
>> I don't think updating the handler later is valid.
>>
>>> Sébastien, to prove the (still pretty weak) theory that the change in
>>> handler is all that's needed to make things work in your case, could
>>> you fiddle with pci_xen_initial_domain() to have it skip IRQ7? (That
>>> of course won't be a proper solution, but ought to be okay for your
>>> system.) The main weakness of the theory is that IRQ7 really isn't
>>> very special in this regard - other PCI IRQs routed to the low 16
>>> IO-APIC pins ought to have similar issues (from the log, on your
>>> system this would be at least IRQ6 and IRQ10, except that they happen
>>> to be edge/low, so fitting the ISA defaults); only IRQ16 and up would
>>> work okay.
>>>
>>
> 
> Doing just that : IQR7 is now  of type level
>   xen-pirq     -ioapic-level  pinctrl_amd
> 
> 
> (but is ioapic-level there totally equivalent to the fasteoi of baremetal)
> Still the touchpad does not work.
> 
> And we have now :
> Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-PIXA3854:00: failed to
> reset device: -61
> Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-PIXA3854:00
> failed with error -61
> 
> in addition to
> Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-FRMW0004:00: failed to
> reset device: -61
> Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-FRMW0005:00: failed to
> reset device: -61
> Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-FRMW0004:00
> failed with error -61
> Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-FRMW0005:00
> failed with error -61

So there's more to this, which I'm afraid will (first) need looking into
by a person familiar with the involved drivers.

> I noticed that on baremetal :
> 
>   53:          0          0          0          0          0       1268
>      0          0          0          0          0          0          0
>        0          0          0  amd_gpio    5  FRMW0005:00
>   54:          0          0          0          0          0          1
>      0          0          0          0          0          0          0
>        0          0          0  amd_gpio   84  FRMW0004:00
>   55:          0          0          0          0          0       1403
>      0          0          0          0          0          0          0
>        0          0          0  amd_gpio    8  PIXA3854:00
> 
> with xen with IRQ7 setup only once there's only (the touchpad is
> PIXA3854:00)
> 
>  176:          0          0          0          0          0          0
>      1          0          0          0          0          0          0
>        0          0          0  amd_gpio    8
> 
> Interestingly when IRQ7 is setup twice (normal xen)
>  176:          0          0          0          0          0          0
>      1          0          0          0          0          0          0
>        0          0          0  amd_gpio    8  PIXA3854:00

That's odd, as with IRQ7 (wrongly) setup as edge, it should also be marked
as non-sharable. Otoh with the "i2c-PIXA3854:00:" error above it's no
surprise no interrupt is set up there.

>> Furthermore it might be interesting to know whether ELCR would give us
>>> any hint in this case. Sadly depending on where you look,
>>> applicability of this pair of registers (I/O ports 0x4d0 and 0x4d1)
>>> to other than EISA systems is claimed true or false. Could you perhaps
>>> make Xen simply log the values read from those two ports, by e.g.
>>> inserting
>>>
>>>      printk("ELCR: %02x, %02x\n", inb(0x4d0), inb(0x4d1));
>>>
>>> in, say, setup_dump_irqs()?
>>>
>>
> did that but I don't know how to trigger the dump.

There's no need to trigger the dump. The message will be logged during
boot, and hence ought to be visible in "xl dmesg" output.

Jan

