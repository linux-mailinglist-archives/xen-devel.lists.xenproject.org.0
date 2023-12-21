Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B65F81B615
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 13:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658864.1028282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGILf-00071T-Hb; Thu, 21 Dec 2023 12:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658864.1028282; Thu, 21 Dec 2023 12:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGILf-0006zN-EX; Thu, 21 Dec 2023 12:40:23 +0000
Received: by outflank-mailman (input) for mailman id 658864;
 Thu, 21 Dec 2023 12:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGILe-0006zH-GP
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 12:40:22 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a50ceef-9ffe-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 13:40:20 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33679c49fe5so611959f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 04:40:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4152000000b0033609b71825sm1956258wrq.35.2023.12.21.04.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 04:40:19 -0800 (PST)
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
X-Inumbo-ID: 1a50ceef-9ffe-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703162420; x=1703767220; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWiGAjoKj5nsfdR0+g/h457i1lzUsHRttMiW/lyiqxE=;
        b=dRCIpOBRI/Yh3V0WpygkmeQRQ7gST8A8cZS3XRFZq+bsqPALgWIbjBUAFP2CnCa6ls
         Q+JAPDfHaS2bpO7EWnb1+uMsUlSWfMXTsyxJkgSqGIiqfHEdxnJegTYElow+HRshdxcr
         Efnx2NbUTOZ/1PCeue7Xpy4ED2G4LkOwym+pzdPwJ4lLrG1wf7V8Hoo6IAhT8k3hdWs5
         zjFLRhDIFEELRbcHf0dmaeUZ+Q3J/039vLud+tPBEFtLZaSq7Hv2BZ0ya3ifzNIkahKt
         IFbDBq/U04aQruG6H/mnB/A5agONTSSbcJXu9CLI9d6SpcVdLYnnjtCTmbCWs7xAf+OS
         iQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703162420; x=1703767220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWiGAjoKj5nsfdR0+g/h457i1lzUsHRttMiW/lyiqxE=;
        b=C7N3ZGwOguH7h3wSYVxAy7V1rZ4p6kZy5Xti2NVy5UBHf63wRt4u69R0f6kKpmRb+Y
         D7Qi4RsDJGRN4tdagjE1capHihIrNa/1MTAUWY1yz4TKmjXAPy6LJYMe5eBxMujS4ZTL
         l/MvbJ5oWd/r5w5DnKT50Pj25yiUVNhGf46AfueJvAxYM1qgAaoS/waS8Q9bgqM/bha0
         F8SN4JwId9MeH4c6aEAOQIQpXToBlTWq8uX+GSU8mTeFo63IqTQuGQotoR5dn+lR0dOn
         vNYRezoWr0y+umGAnXOSHKiPb2tYr7cIZoMESWWiy2IHJ7keXA0RQX3bSAizaCfG5ydY
         D5AA==
X-Gm-Message-State: AOJu0Yx76GK3xR64idhk+TSokX2WHrcoPLlxiMB44WEkT0CvMu3Z2yWi
	CeUcxqR5tObbtrYlxEg8Gykz
X-Google-Smtp-Source: AGHT+IELQlWo9K8uMMZOoFsxOoDl73Nmk5sSabaO8kP9l5oy0tiS3Lb7gQRsm4suIjzVU7ZhGckrhw==
X-Received: by 2002:a5d:514c:0:b0:336:8b4e:3437 with SMTP id u12-20020a5d514c000000b003368b4e3437mr391966wrt.111.1703162420261;
        Thu, 21 Dec 2023 04:40:20 -0800 (PST)
Message-ID: <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com>
Date: Thu, 21 Dec 2023 13:40:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>,
 Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com>
 <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
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
In-Reply-To: <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 17:34, Sébastien Chaumat wrote:
> Here are the patches I made to xen and linux kernel
> Plus dmesg (bare metal,xen) and "xl dmesg"

So the problem looks to be that pci_xen_initial_domain() results in
permanent setup of IRQ7, when there only "static" ACPI tables (in
particular source overrides in MADT) are consulted. The necessary
settings, however, are known only after _CRS for the device was
evaluated (and possibly _PRS followed by invocation of _SRS). All of
this happens before xen_register_gsi() is called. But that function's
call to xen_register_pirq() is short-circuited by the very first if()
in xen_register_pirq() when there was an earlier invocation. Hence
the (wrong) "edge" binding remains in place, as was established by
the earlier call here.

Jürgen, there's an interesting comment in xen_bind_pirq_gsi_to_irq(),
right before invoking irq_set_chip_and_handler_name(). Despite what
the comment says (according to my reading), the fasteoi one is _not_
used in all cases. Assuming there's a reason for this, it's not clear
to me whether updating the handler later on is a valid thing to do.
__irq_set_handler() being even an exported symbol suggests that might
be an option to use here. Then again merely updating the handler may
not be sufficient, seeing there are also e.g. IRQD_TRIGGER_MASK and
IRQD_LEVEL.

Sébastien, to prove the (still pretty weak) theory that the change in
handler is all that's needed to make things work in your case, could
you fiddle with pci_xen_initial_domain() to have it skip IRQ7? (That
of course won't be a proper solution, but ought to be okay for your
system.) The main weakness of the theory is that IRQ7 really isn't
very special in this regard - other PCI IRQs routed to the low 16
IO-APIC pins ought to have similar issues (from the log, on your
system this would be at least IRQ6 and IRQ10, except that they happen
to be edge/low, so fitting the ISA defaults); only IRQ16 and up would
work okay.

Furthermore it might be interesting to know whether ELCR would give us
any hint in this case. Sadly depending on where you look,
applicability of this pair of registers (I/O ports 0x4d0 and 0x4d1)
to other than EISA systems is claimed true or false. Could you perhaps
make Xen simply log the values read from those two ports, by e.g.
inserting

    printk("ELCR: %02x, %02x\n", inb(0x4d0), inb(0x4d1));

in, say, setup_dump_irqs()?

Jürgen, looking at pci_xen_initial_domain(), what's the purpose of
the loop in the final if()? Can this ever do anything useful when
the earlier comment suggests nr_legacy_irqs() is zero anyway? Or is
the comment simply inaccurate in not covering the "no IO-APICs" case?

Jan

