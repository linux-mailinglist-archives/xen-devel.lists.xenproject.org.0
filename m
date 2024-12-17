Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F159F47BD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 10:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858703.1270949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNU4D-0004yG-40; Tue, 17 Dec 2024 09:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858703.1270949; Tue, 17 Dec 2024 09:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNU4D-0004vI-0l; Tue, 17 Dec 2024 09:40:37 +0000
Received: by outflank-mailman (input) for mailman id 858703;
 Tue, 17 Dec 2024 09:40:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNU4B-0004vB-CA
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 09:40:35 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6078dd1-bc5a-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 10:40:33 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so3988906f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 01:40:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801a8b0sm10508398f8f.53.2024.12.17.01.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 01:40:32 -0800 (PST)
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
X-Inumbo-ID: f6078dd1-bc5a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734428433; x=1735033233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nH81FfSCIIZDa7C6JLgxhb0Mejj/xRdGi8nDarQcVnc=;
        b=Vy8s8qx4c4E6q/oYWOv9YuyZF1xdXhPZwq6GjuxL7h+C1ammfvpDfb1AwIo5SnRYeD
         r0xZpDNXzd2GiMfTcnw8kutqqO2r+eJ9wU0LML/NiC/rzRiKVwwEQyyJOxvvKvCfjxCT
         0Cy+DukaW3mjgS1LhFnJR49v6xRsQ7W9BBplA99/8Pm/COg1bW/P47ammnzYK2zlNphW
         d7sakCLURj/Q/leuy7S7TTzkxkyRUekNi0V33Cp8K/BOfLm2UgVyyeAozFpx35cJoCPM
         pBbdazTjuVR2HtnklzyIl0MAL/ncvxnlz4euxRYEOIQz4msvzFeviUGUSmvHqbnoXz6K
         z4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734428433; x=1735033233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nH81FfSCIIZDa7C6JLgxhb0Mejj/xRdGi8nDarQcVnc=;
        b=suOSPRH1FLXnXLfi5wRhHSCcXGkHQd1wY0XjMobzgSctki/yJg+PLX3EjlSUuXBW1O
         v2aRwyhIVEN2w9YBkTLVXVnZBo9A6hYvicr+MwCu8npq7XH+K/OIxLPB3Sll94G0TFH1
         W490X6V1R52GrJHFFP8cxbe+X4Yn7yKvc68whXYTTPP0k0EctkDmVsxvFD1FT19CtBMK
         iFko3IqTWqL1A8SiBQ3YfTXExriaqn5sOtBccnXfYYB+0XuaZYlv7YvznQHVkwBTzfVB
         ykRtfCMplBaw4KsdzpwKTbbGLEHlAqKzloEKZ0UBI5JNeHpYHAkCWhrl4zUFo0oiOMVb
         Ct9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlxTyryDVCFCMcOXCRsadOoddwc8jmKM6+UtyUazXmvDXk9Z4H8CisSqT0K3dNf+nrqv1l/rqVYcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGxX2gLf88BRY6suUeexNYu+tFVp7uYUZuO07WlgHnDjmluKi1
	JeHcoyxmgtZANi6ZEYl8RAeGw1fm/X1C4JWrIubBstHm9oT1YQawbKSTIL8n8g==
X-Gm-Gg: ASbGncs8vtHcorUrd2xnG7Up72cj318ILm91niQAePe9Iq5CEoOxxRf6ECZD7GNcEwf
	I3oUPfl1WC2E3BtHMW0sOFP6SUtesLqmkcdZoVMfaz/kM9gfH6s4vpXCvDK7jV5PxuYhbhUQCtq
	aUu5xLrJPaPHvEww3ItTTs9Hkg9MAzTcEPMGDtSOKqzEzBSoZRiQk1JVrZQiKUJTSzvn+/YD0Fo
	hRcsHAwrZ7HcQOY28oI36jEQUqkF4yyup2ocLRB2GsXo+3bzIkrCh8aBNrcVK3zOB7ua1es4EqD
	HSqWsZL1ByFN15WXPDr9Sp3fn25Htqi8HS+pyCciNQ==
X-Google-Smtp-Source: AGHT+IH7MhAPvUgRAQdACxoSOYiQVzioVfYuev4xjfpnEMLAVCU5jDVd9Dr7aolnKAuy3MWUYMnA9w==
X-Received: by 2002:a05:6000:1f89:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-388db22663cmr2243342f8f.2.1734428432828;
        Tue, 17 Dec 2024 01:40:32 -0800 (PST)
Message-ID: <a44e6726-4c4b-434d-bace-585859c5d66d@suse.com>
Date: Tue, 17 Dec 2024 10:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/io-apic: prevent early exit from i8259 loop detection
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
References: <20241217090045.6251-1-roger.pau@citrix.com>
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
In-Reply-To: <20241217090045.6251-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.12.2024 10:00, Roger Pau Monne wrote:
> Avoid exiting early from the loop when a pin that could be connected to the
> i8259 is found, as such early exit would leave the EOI handler translation
> array only partially allocated and/or initialized.
> 
> Otherwise on systems with multiple IO-APICs and an unmasked ExtINT pin on
> any IO-APIC that's no the last one the following NULL pointer dereference
> triggers:
> 
> (XEN) Enabling APIC mode.  Using 2 I/O APICs
> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d040328046>] __ioapic_write_entry+0x83/0x95
> [...]
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040328046>] R __ioapic_write_entry+0x83/0x95
> (XEN)    [<ffff82d04027464b>] F amd_iommu_ioapic_update_ire+0x1ea/0x273
> (XEN)    [<ffff82d0402755a1>] F iommu_update_ire_from_apic+0xa/0xc
> (XEN)    [<ffff82d040328056>] F __ioapic_write_entry+0x93/0x95
> (XEN)    [<ffff82d0403283c1>] F arch/x86/io_apic.c#clear_IO_APIC_pin+0x7c/0x10e
> (XEN)    [<ffff82d040328480>] F arch/x86/io_apic.c#clear_IO_APIC+0x2d/0x61
> (XEN)    [<ffff82d0404448b7>] F enable_IO_APIC+0x2e3/0x34f
> (XEN)    [<ffff82d04044c9b0>] F smp_prepare_cpus+0x254/0x27a
> (XEN)    [<ffff82d04044bec2>] F __start_xen+0x1ce1/0x23ae
> (XEN)    [<ffff82d0402033ae>] F __high_start+0x8e/0x90
> (XEN)
> (XEN) Pagetable walk from 0000000000000000:
> (XEN)  L4[0x000] = 000000007dbfd063 ffffffffffffffff
> (XEN)  L3[0x000] = 000000007dbfa063 ffffffffffffffff
> (XEN)  L2[0x000] = 000000007dbcc063 ffffffffffffffff
> (XEN)  L1[0x000] = 0000000000000000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=0002]
> (XEN) Faulting linear address: 0000000000000000
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> 
> Reported-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> Fixes: 86001b3970fe ('x86/io-apic: fix directed EOI when using AMD-Vi interrupt remapping')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Hmm, considering the earlier change was backported, I'm even inclined to
delay 4.18.4 a little, for taking this one there as well.

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1389,14 +1389,15 @@ void __init enable_IO_APIC(void)
>              /* If the interrupt line is enabled and in ExtInt mode
>               * I have found the pin where the i8259 is connected.
>               */
> -            if ((entry.mask == 0) && (entry.delivery_mode == dest_ExtINT)) {
> +            if ( ioapic_i8259.apic == -1 && entry.mask == 0 &&
> +                 entry.delivery_mode == dest_ExtINT )
> +            {
> +                ASSERT(ioapic_i8259.pin == -1);

I'm not sure of the value of this assertion. It is provable that ...

>                  ioapic_i8259.apic = apic;
>                  ioapic_i8259.pin  = pin;

... both fields are updated together (and not earlier on), and hence once
we've been here neither field will still be -1.

Looking around I further notice that it's generally ioapic_i8259.pin that
we check against -1, so I wonder whether - just for consistency - the if()
condition wouldn't better too use that one.

Preferably with these adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

