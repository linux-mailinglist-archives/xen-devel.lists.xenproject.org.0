Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9AAAE378C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022114.1397834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTc1x-0007d5-TX; Mon, 23 Jun 2025 07:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022114.1397834; Mon, 23 Jun 2025 07:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTc1x-0007a8-QP; Mon, 23 Jun 2025 07:55:53 +0000
Received: by outflank-mailman (input) for mailman id 1022114;
 Mon, 23 Jun 2025 07:55:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTc1w-0007a2-H3
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:55:52 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b7ae3c6-5007-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 09:55:51 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso3318164f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 00:55:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f126c50asm6172381a12.78.2025.06.23.00.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 00:55:50 -0700 (PDT)
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
X-Inumbo-ID: 7b7ae3c6-5007-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750665351; x=1751270151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=shnXoTgJcSWO/SHvv//18LlP9kpBfxHM1Pisu9ULKK4=;
        b=Qjl/hqktL/MAUBdYeMC9cDqb6Kx28GgeFxZHk748642eJO8fLwbJBjxNGByTTmYWme
         E0dG4Y/4H/bB6eivDhXKznZEzFPRHUK3yra8VJWpEDgmeIyZ5JprL8dG+hfGOB31kzMn
         k6j3+K8jEkPZb7D7ag5sHdGG/nqm68kw0GnSP+FIIWAowUFvcArRko8XbU5ebgJO5bll
         Ac/MBmco8KE2lppG3FF4v6vtoqt/mTAo2UgAm4FUOlZfa2HOSYMCQ9IYMI/qjNbA9g9r
         2R7Mo5rGMeGdG8UjMCpLF5BPHQrcUxCyEBhtkVP1OtkuoSSPSgryvNN6bRa+cw0zF65N
         kVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665351; x=1751270151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shnXoTgJcSWO/SHvv//18LlP9kpBfxHM1Pisu9ULKK4=;
        b=vIRjB9WDr0vIOXYakjv5ZvBgZUvZW3uxMgjn/Ui6/3ON539stv347ydAdShwrSVDfM
         p9VPEUmqFQSnKbRmWBtat/o1oE58GTiHODTBXTOABM7Csjo5M1E6U/WhuowDfWY8Q//L
         a8/P2uMldqgdGjdbXY45pYCZ0Z4+yvl6wJRxx1XY8TdDw5oZEILwP5HiRjsuaT1lYWU/
         eUdFFXx67fWFVl2Nz7NYaMnvzZ32AER16PZ4ynPVRwDp3UxN4odFPzeYPOpV4Ya+HSTi
         niVlmSAIFiTCXXvi/HcKjOLsrCZA0dQLx8/jXDzLJRgLlAZUp9cXW0mUJl33BMJVbqCu
         aNEw==
X-Gm-Message-State: AOJu0YwnRSodizH70vDJpRWDufcP198Sd6Wb/wXDQkVEuQ7UgbLPoHTy
	O0GpChvKPQnhfQQZuoU43HV05jBlN2QSA9SkSO0w1H0ge9hJm9+6jfRB10v5m6Ya7F8c4mQT//q
	LMXE=
X-Gm-Gg: ASbGncuofqZ4JmYaIW9mORKBheTALckn6+ADW5s8bJn4YXxMyCTwomXPNotuNl2fNZY
	aS+SQ4/S7Fk9Mw7NeJ036cENvs054SnD8b5O/k42nYn3uF1o9sRvqz3BD4Ov+sDl7oV9v6mAPyp
	1QFFxcRuoTYAUN1nimj0JRPTJKgxdWNK7fqJzT+/edScPG618gnultnb8eHnISQ/CbWuDF2D6+O
	Ez7h/iYyyRYpNitkVbstA8X5ljghhusZerRiniS7oqGIEFmvrW/Lueoue0i4awR4Lpfe5cmmT4I
	4WmN3aR1mmMVzBW7IYEp2B7H3+i66QEzBUHrlFFsLPjvHTAzwb9bDDMW4nr63Yyiv05WcK3T0sg
	5frwt0VCg4WIxE0MEefHLsXDHQ52QyrsgyHT6IJV5t9YEsK4=
X-Google-Smtp-Source: AGHT+IFeahiijg1SzPOtbaEhjPkLimTBa579c/GDJ5SGg5kZrdWNo/8bFtRev5ockOPI5l4FTbWRLQ==
X-Received: by 2002:adf:e182:0:b0:3a4:f50a:bd5f with SMTP id ffacd0b85a97d-3a6d12fc18bmr9275637f8f.31.1750665351024;
        Mon, 23 Jun 2025 00:55:51 -0700 (PDT)
Message-ID: <0d1cdd47-8fc2-4aa4-8c78-32f2ef2cc524@suse.com>
Date: Mon, 23 Jun 2025 09:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen_pciback: error enabling MSI-X / MSI for guest -- WAS: Re:
 Kernel panic when passing through 2 identical PCI devices
To: "J. Roeleveld" <joost@antarean.org>
References: <2226691.irdbgypaU6@persephone> <4683544.LvFx2qVVIh@persephone>
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
In-Reply-To: <4683544.LvFx2qVVIh@persephone>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2025 16:39, J. Roeleveld wrote:
> I managed to get past the kernel panic (sort of) by doing the following:
> 
> 1) Ensure system is fully OFF before booting. A reset/reboot will cause these 
> errors.
> 
> 2) Fix the BIOS config to ensure the PCI-ports are split correctly. If anyone 
> has a Supermicro board and gets errors about PCI-slots not getting full speed 
> let me know.
> 
> Not entirely convinced the 2nd was part of the cause, but that's ok.
> 
> I now, however, get a new error message in the Domain0 dmesg:
> pciback <pci-address>: xen_map irq failed -28 for <domid> domain
> pciback <pci-address>: error enabling MSI-X for guest <domid>: err -28!
> 
> For the NVMe devices, I get these twice, with the 2nd time complaining about 
> MSI (without the -X)
> 
> I feel there is something missing in my kernel-config and/or domain config.
> If anyone can point me at what needs to be enabled/disabled or suggestions on 
> what I can try?

The default number of extra IRQs the guest may (have) set up may be too small.
You may need to make use of Xen's extra_guest_irqs= command line option.

Jan

