Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002E682A856
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665921.1036246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpW5-0005T3-AP; Thu, 11 Jan 2024 07:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665921.1036246; Thu, 11 Jan 2024 07:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpW5-0005Q4-79; Thu, 11 Jan 2024 07:30:17 +0000
Received: by outflank-mailman (input) for mailman id 665921;
 Thu, 11 Jan 2024 07:30:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpW3-0005Py-Tr
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:30:15 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42eb26aa-b053-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:30:14 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e55c885d7so17677775e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:30:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c4f9000b0040d62f97e3csm4686253wmq.10.2024.01.10.23.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:30:14 -0800 (PST)
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
X-Inumbo-ID: 42eb26aa-b053-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704958214; x=1705563014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vrbYM+k3rn2StvNS14c+H1vkqzUnxcZIY2WokHy7uas=;
        b=HW1MM19UkCsR4osJyfSxs4+0bOOd0FFwi5KgAyZ2InM5ynVKKKvsWm7NwzrWsIQ6va
         w3ACnHQPIcygcQa2R5MlEoeUqU5gD3GmjiEV2hKhuAPFShliYyksqKtkRJsLpS8ZBbS1
         BMfMu5rYJKLum+N8c74apP7uv977p8zFmd5zXswggJkBfVk0jcUEK7BR2izmQdvZdqEx
         KSbn0zNZbk0x+FV+PDvbQUQFcsaGse8qymMqOURCrTmHgA7XIWKK8uagp4ihp8pWgd6h
         pH97uq+LyrRfjUcsUfvy4xlhpkCCdzu1E6CqQRnIN+CM6eQAzjgvrqfQPIHAjkUmexmo
         PYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704958214; x=1705563014;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrbYM+k3rn2StvNS14c+H1vkqzUnxcZIY2WokHy7uas=;
        b=MrtF3iag5YpvTGatoLcz3dzUi38477eChpOCY5Gw9W0xw6kMtc88bIQCb3LC10FfHo
         +BeniGzT3xy6MPUCMzsb6h2qy+YGMaQ0yFxhSgCYRP8Boz8rJyedwE7nymWwyYFhOMMu
         +7t4FDKG+Zn3c7sNfpjt+bmeD5X9mCpDTmu/6/XHkoL72l37r1vAYTOdK8ufm9UnkP5x
         aD5hlNfgYU+cLEKiKQfDNM2S3kmV182YuJ/x25aC1MvqoiXVnvgTw0q7ym8Zdow3PxS1
         a79qJ6AeB2vfujpjQyOg9OsuGiSV3V/P5rZxzIPVZyO1+7hv4BjUUKIV6W/pnF+stmg9
         V5fA==
X-Gm-Message-State: AOJu0YyNcQPtgDx9NzuADySOhX4HUtMujUsnXL9AfCsntNynP31TekzD
	WqLnZ4J65nqmk9zknZaNmY9DGt+03igLn6gNTKNOZC4GLQ==
X-Google-Smtp-Source: AGHT+IFbCF0Cmn4ze8awRNj7NnD5DZnQdD+ckerlKPuU2k00VG6SDcDngHETqq6FGgzvFaBuAykVGw==
X-Received: by 2002:a05:600c:3584:b0:40e:5f64:a6a3 with SMTP id p4-20020a05600c358400b0040e5f64a6a3mr128934wmq.173.1704958214279;
        Wed, 10 Jan 2024 23:30:14 -0800 (PST)
Message-ID: <264f1696-3555-426b-b88d-97c3f2d27eb5@suse.com>
Date: Thu, 11 Jan 2024 08:30:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] limit passing around of cpu_user_regs
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <5d6089a4-c597-49ce-b042-24f13922f581@suse.com>
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
In-Reply-To: <5d6089a4-c597-49ce-b042-24f13922f581@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.01.2024 08:21, Jan Beulich wrote:
> Unlike (synchronous) exception handlers, interrupt handlers don't normally
> have a need to know the outer context's register state. Similarly, the vast
> majority of key handlers has no need for such.
> 
> 1: keyhandler: don't pass cpu_user_regs around
> 2: IRQ: generalize [gs]et_irq_regs()
> 3: serial: drop serial_rx_fn's regs parameter
> 4: PV-shim: drop pv_console_rx()'s regs parameter
> 5: serial: drop serial_[rt]x_interrupt()'s regs parameter
> 6: IRQ: drop regs parameter from handler functions
> 7: x86/vPMU: drop regs parameter from interrupt functions
> 8: x86/APIC: drop regs parameter from direct vector handler functions

I'm sorry, I need to start over - somehow ordering got confused in the
reply-to-s sent so far.

Jan


