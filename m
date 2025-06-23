Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FC5AE41B2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022317.1398097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTgve-0004gj-2F; Mon, 23 Jun 2025 13:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022317.1398097; Mon, 23 Jun 2025 13:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTgvd-0004fH-Vo; Mon, 23 Jun 2025 13:09:41 +0000
Received: by outflank-mailman (input) for mailman id 1022317;
 Mon, 23 Jun 2025 13:09:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTgvd-0004f8-I5
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:09:41 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 526b5ee2-5033-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 15:09:40 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so2082811f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 06:09:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a46b772sm8338306b3a.32.2025.06.23.06.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 06:09:39 -0700 (PDT)
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
X-Inumbo-ID: 526b5ee2-5033-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750684180; x=1751288980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YBxeT3GbhLxQPHz0x8af+1sCrRfYL0uwQy7qx+Qh/RM=;
        b=IEdQGS11g5MkJwNhOC59//th6eWUUp9uzZB4DeydBdFC/xZY9ByI+YoL6KZNMM1ug9
         +cgv/zlhL6zIPlm+ixM6Du7vDmh4cBcCRrgVy4HX5N9YtAXzJkDZQ5daYWFRI8vS0Al6
         2ZHw9+EpDjC0558iyU0mAmeTm6tXkh5yx74yn/7pWnwF3qBI0USR82aHbJHZMsOy/joJ
         CidbJZEhqv5HJ1jkj/4Ko2YTD4wlLCg5Db9k7G6yme+AkEzczDAPqpkqYLwAXpRneDBC
         qt3xO5q5gVw97Bjrs+nPjybjE3UrmYVGLszbURiNWzjjbcF/8mbQL+47LOKk7GfqItBH
         uVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750684180; x=1751288980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBxeT3GbhLxQPHz0x8af+1sCrRfYL0uwQy7qx+Qh/RM=;
        b=EMtjT6dJUllr7dvtDhwLs118bhIbDAXxF6B5UW2/QNlPgmhFSOJnd/FLgOSW+MSwfN
         cNn6h/Jn2q+1OoR+bTJ1exTLlxoAQ7nxh/7h623Xa0G1igtX2psvwpuvJ2dU+DvDb860
         dVZlLm7jmIZ7C4C3SUkmC9XiBN9oiTm8vrhJ1J0dAEl2lmsluoXqq17JGrN4AyPePC7o
         JfhAm4ZYIFtQxYI2SH8pTec5HkCEYmQ4BC5sQwy8W5pHQ/EvwP//c0TAbFpoA9YSP3I9
         BD65tIash7JTc5nzw/r6lwJ8Tb14DMZfIEFmKy/wJcmr0JoI1Avzsx2V/fn8G8ssDMEb
         5FGw==
X-Gm-Message-State: AOJu0YxjoYQOdK++hZTp6WNpy/qt3IkkYsjE7sefeK3qLIAvLHqNQm81
	H400K77aMIkuV/8mjBMB5+LzAlDUDgwuw8Up0n+xLhp5nRv4wiF+6SfR4083lP/rfqbcEgCkGC6
	9gXE=
X-Gm-Gg: ASbGncsBaQuFOQ+lUnNOqnxOXYFkNtzI0mMdeyE51vafKS6nEQKChwBQvbdEC++s7FH
	djx4xHE1qxitWLZJI2VZs1l8dimZrfO62jMSQulwDqbAhGh5cuoYJsxUzvfbTUtR2s1RiHMbn/q
	xE2gRw91iKI4TL7dDDOrhSOWUXsD6EzbHBOeoiYe0XcvY3QWMLtRLgmZlhhR6CJ+i8FXGnY3bmc
	155mtweAxAmuAJOmV+PhpYvt47VZWMPwTd20wOXBUmUQp15uJTBPcTM7pMlel/OntU6obq57D0t
	1+ZDUZW8dzBsBZrSwKCvkvKdGMcwijWrZGSsT32pgMkIlKAuBkKgpstsMQtunTaSru9TzBHVnT5
	7WGG2l5ge0sZtRJHndpeUexmioxRx/XpfyHA1Vp83I/wec7o=
X-Google-Smtp-Source: AGHT+IHRiXe3CO8RAI+EmBkwi/4uAuhE2IhnKlcOxjGLSJ0E/67jo30qwNJKrjNEQ0qq5vVIOT8a2w==
X-Received: by 2002:a5d:5850:0:b0:3a5:14e1:d9ec with SMTP id ffacd0b85a97d-3a6d12e6386mr9861355f8f.51.1750684179863;
        Mon, 23 Jun 2025 06:09:39 -0700 (PDT)
Message-ID: <039413d6-9204-4d45-b953-e786b30a1695@suse.com>
Date: Mon, 23 Jun 2025 15:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen_pciback: error enabling MSI-X / MSI for guest -- WAS: Re:
 Kernel panic when passing through 2 identical PCI devices
To: "J. Roeleveld" <joost@antarean.org>
References: <2226691.irdbgypaU6@persephone> <4683544.LvFx2qVVIh@persephone>
 <0d1cdd47-8fc2-4aa4-8c78-32f2ef2cc524@suse.com>
 <13792333.uLZWGnKmhe@persephone>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <13792333.uLZWGnKmhe@persephone>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 13:10, J. Roeleveld wrote:
> On Monday, 23 June 2025 09:55:46 CEST Jan Beulich wrote:
>> On 21.06.2025 16:39, J. Roeleveld wrote:
>>> I managed to get past the kernel panic (sort of) by doing the following:
>>>
>>> 1) Ensure system is fully OFF before booting. A reset/reboot will cause
>>> these errors.
>>>
>>> 2) Fix the BIOS config to ensure the PCI-ports are split correctly. If
>>> anyone has a Supermicro board and gets errors about PCI-slots not getting
>>> full speed let me know.
>>>
>>> Not entirely convinced the 2nd was part of the cause, but that's ok.
>>>
>>> I now, however, get a new error message in the Domain0 dmesg:
>>> pciback <pci-address>: xen_map irq failed -28 for <domid> domain
>>> pciback <pci-address>: error enabling MSI-X for guest <domid>: err -28!
>>>
>>> For the NVMe devices, I get these twice, with the 2nd time complaining
>>> about MSI (without the -X)
>>>
>>> I feel there is something missing in my kernel-config and/or domain
>>> config.
>>> If anyone can point me at what needs to be enabled/disabled or suggestions
>>> on what I can try?
>>
>> The default number of extra IRQs the guest may (have) set up may be too
>> small. You may need to make use of Xen's extra_guest_irqs= command line
>> option.
> 
> I spent the entire weekend searching for possible causes/hints/things to try.
> That setting was one I had found some time ago (I think for MSI/MSI-X issues) 
> and it's currently set to:
> extra_guest_irqs=768,1024
> 
> Not sure if it makes sense to increase this further?

Seems unlikely, but you know how many interrupts the device(s) may have.

Jan

