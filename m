Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B61982412B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 12:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661673.1031365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMNf-0004cL-Nq; Thu, 04 Jan 2024 11:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661673.1031365; Thu, 04 Jan 2024 11:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMNf-0004Zh-Jb; Thu, 04 Jan 2024 11:59:23 +0000
Received: by outflank-mailman (input) for mailman id 661673;
 Thu, 04 Jan 2024 11:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLMNe-0004Zb-9b
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 11:59:22 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1709c95-aaf8-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 12:59:20 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e7f58c5fbso550667e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 03:59:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bq6-20020a056e02238600b0035d0da89a0asm8397481ilb.6.2024.01.04.03.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 03:59:19 -0800 (PST)
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
X-Inumbo-ID: b1709c95-aaf8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704369559; x=1704974359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4we0YsU44Cl7Tbyz3085Euf6Lzp62iz5/pPL5FcaH/o=;
        b=dgowGHY/ngG7IVBptpiyLT47053dCYeHZWzNAT9kygOMJ/Jg6wDCPWAMq4sObGDu0C
         D76jlYJgYjd7YWwhCWusP3ecoAhAUW9kF1jwBpQ//xeBk97jQEiG+2j40B7YNaSOXaU5
         Il3d9uDuxmjZjpG68DwUDXsjutkISLZbRCGBwGJtpw/IaJz7j1tK/dkFvPv07rjedsSA
         eGt2x/NH8gOOZ2gm3QzlAuhBmC6XWkRvT/f6GfH0Vap6SJ8Cd2i3JFvepoTLzYUcAUbr
         oXXe2Nsb3DL3CMfhnOo5s1/mrBwffIZ/HhT2RWBAuzbeoOmdMT1zT+T/f4Q6xn5lC8GS
         Uocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704369559; x=1704974359;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4we0YsU44Cl7Tbyz3085Euf6Lzp62iz5/pPL5FcaH/o=;
        b=w/j3qDvUJMjGkyG4V5l+DfFpuUA+rbXh67Xe2/x8CZPzbQCmQXjNw0A2rgGW19LXi/
         IPrAp3AkZejIqFxmUmV/7msnEUK+dn6eh4RF0O8BboRsVDB3BoyRrfaTVPXExZyIrGmk
         kfy18LM1vBaxXGciE6lSwbBm1eqgZg1ZYTgeE5euNytcvJb3jb15gaNP+qNnYvn3/QJu
         1EeKq5W1LOqr6PYfomWufrrubzG04rVL4hGHxvJwQeSQ4i3l5VgoPfGaWNB2vuNqE2B5
         jDJD5Nk93yQJIDbOYh456qoPoSAf+plfg+dVVUshYN/0bwn4XNkgR+aPnhH08TY7flv6
         DDFQ==
X-Gm-Message-State: AOJu0Yz/RKs7+Td4E3Ag0Vg0BmjYFyDLUVYA5HqTlxBh+aO7kDfO72xZ
	IaOKqnA9QRyCXOF3bMWGlWKGHoMNOgynhWlKlIFeCeHbSQ==
X-Google-Smtp-Source: AGHT+IFNxExQMjD+PVahx+YCktr3W1mN2ikJAIoTFwDF/rL+mI/Kn4dRmdJXRUoeotA/peaNk+6nfw==
X-Received: by 2002:a2e:8711:0:b0:2cc:f5fa:28ac with SMTP id m17-20020a2e8711000000b002ccf5fa28acmr296568lji.102.1704369559588;
        Thu, 04 Jan 2024 03:59:19 -0800 (PST)
Message-ID: <7d5ecc76-ecd3-4940-b658-fee60e3ab740@suse.com>
Date: Thu, 4 Jan 2024 12:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Serial console stuck during boot, unblocked with xl debug-key
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <ZY6WdQlbdQxb1UR2@mail-itl>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
In-Reply-To: <ZY6WdQlbdQxb1UR2@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.12.2023 10:50, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> This is continuation from matrix chat. There is an occasional failure on
> qubes-hw2 gitlab runner that console become stuck during boot. I can now
> reproduce it _much_ more often on another system, and the serial console output
> ends with:
> 
>     (XEN) Allocated console ring of 256 KiB.
>     (XEN) Using HWP for cpufreq
>     (XEN) mwait-idle: does not run on family 6
> 
> It should be:
> 
>     (XEN) Allocated console ring of 256 KiB.
>     (XEN) Using HWP for cpufreq
>     (XEN) mwait-idle: does not run on family 6 model 183
>     (XEN) VMX: Supported advanced features:
>     (XEN)  - APIC MMIO access virtualisation
>     (XEN)  - APIC TPR shadow
>     ...
> 
> 
> Otherwise the system works perfectly fine, the logs are available in
> full via `xl dmesg` etc. Doing (any?) `xl debug-key` unblocks the
> console and missing logs gets dumped there too. I narrowed it down to
> the serial console tx buffer and collected some info with the attacked
> patch (it collects info still during boot, after the place where it
> usually breaks). When it works, I get:
> 
>     (XEN) SERIAL DEBUG: txbufc: 0x5b5, txbufp: 0x9f7, uart intr_works: 1, serial_txbufsz: 0x4000, tx_ready: 0, lsr_mask: 0x20, msi: 0, io_size: 8, skipped_interrupts: 0
> 
> And when it breaks, I get:
> 
>     (XEN) SERIAL DEBUG: txbufc: 0x70, txbufp: 0x9fd, uart intr_works: 1, serial_txbufsz: 0x4000, tx_ready: 16, lsr_mask: 0x20, msi: 0, io_size: 8, skipped_interrupts: 0

The only meaningful difference is tx_ready then. Looking at
ns16550_tx_ready() I wonder whether the LSR reports inconsistent
values on successive reads (there are at least three separate calls
to the function out of serial_tx_interrupt() alone). What you didn't
log is the LSR value itself; from the tx_ready value one can conclude
though that in the bad case fifo_size was returned, while in the good
case 0 was passed back. At the first glance this looks backwards, or
in other words I can't explain why it would be this way round. (I
assume you've had each case multiple times, and the output was
sufficiently consistent; that doesn't go without saying as your
invocation of serial_debug() is competing with the asynchronous
transmitting of data [if any].) It being this way round might suggest
that we lost an interrupt. Is this a real serial port, or one mimicked
by a BMC (SoL or alike)?

Jan

