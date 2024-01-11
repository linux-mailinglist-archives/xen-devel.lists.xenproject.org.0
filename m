Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FFA82A841
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665894.1036195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpO4-0001TL-Gf; Thu, 11 Jan 2024 07:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665894.1036195; Thu, 11 Jan 2024 07:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpO4-0001Rh-E7; Thu, 11 Jan 2024 07:22:00 +0000
Received: by outflank-mailman (input) for mailman id 665894;
 Thu, 11 Jan 2024 07:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpO2-0001Rb-PF
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:21:58 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a74c619-b052-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:21:57 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e60e1378eso1701225e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:21:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0040e3bdff98asm4589894wmn.23.2024.01.10.23.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:21:56 -0800 (PST)
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
X-Inumbo-ID: 1a74c619-b052-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704957717; x=1705562517; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+5CGOukjfQO94V4R3Cj4aE/IhM5ucCz6YzI5SlI/Cg=;
        b=gLl0njn0yCqlsd6TsR9xKHK4BX9yyBUW0JHC/s+t1q4XccBQi7EuT1q8XZ7h5ccxC7
         4hXqRAl+HRuUmnpw75Ud1zg4Cpai+OgYEf3dGo98g7oBE8RwARJwrC/aX2RajMQVp/KB
         iP4VBlPmq3L11YRPIEKD6iD5y/JkU0LUEnR4qj7lO4D1Iz9UgrmsSacJNBSyzR/Fp0en
         BdLmEZ+WihtOQUJZ8nd1e4/ti5CAFeNjmuhxZHWp5LicqNKWsKHmdsL/lIC0B1nlhuRt
         cWnQiiurVARBVmi1zvh7S/5pbU3djDqWQBA006wJAMm3POHxcOYBXn7qf2lZuMn/rG86
         edZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704957717; x=1705562517;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M+5CGOukjfQO94V4R3Cj4aE/IhM5ucCz6YzI5SlI/Cg=;
        b=JpwnogHLSN5PzKlRbteZbjzYUWr5nfX2xvlG33MkeijFoWKKKRSM3XQjhCV7SAokN+
         uSMBxV/X93xJBiWXq/VB4FA4sQcSa2HuLtL8Hm0He/BUPe+r1GQ0XLJflUQ4E6E50hyV
         2p0uvUACSEPNSO7GHX0UyIjB516ZHk72P7Irl568qjLq/7fwHfGccP/6bUoX7FfGrwxb
         HnKqIE/YlEhYaslc3JoQuDprSFp9OKEHQEMlPigaMi4yy6QcR8RaB4hjSt29D5/HGyUf
         KcsBZZvj7P0rlj67V4BkGPPc6fFm7QtgMiBDm9cfncYAFeSnE7nKCsFSfcXQTZ89JY09
         g40w==
X-Gm-Message-State: AOJu0Yx0HqQMtwqbcayqlkX3LZN1eX/aXpYwd8rVjykjnyb7RZimwV9L
	j+/u/pug+ZAUTqM3yf2/BhNidYJKuoxQq6kbD6BRNjf9cQ==
X-Google-Smtp-Source: AGHT+IFkyYuMAsT4/HiJMCGUHgpiBSLBZEHHh4SHeaBfpFk1N3a0WRqN5rgewDg3ynbm8kmp631eDg==
X-Received: by 2002:a05:600c:518e:b0:40e:4e0f:3b2 with SMTP id fa14-20020a05600c518e00b0040e4e0f03b2mr139625wmb.5.1704957716863;
        Wed, 10 Jan 2024 23:21:56 -0800 (PST)
Message-ID: <5d6089a4-c597-49ce-b042-24f13922f581@suse.com>
Date: Thu, 11 Jan 2024 08:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/8] limit passing around of cpu_user_regs
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Unlike (synchronous) exception handlers, interrupt handlers don't normally
have a need to know the outer context's register state. Similarly, the vast
majority of key handlers has no need for such.

1: keyhandler: don't pass cpu_user_regs around
2: IRQ: generalize [gs]et_irq_regs()
3: serial: drop serial_rx_fn's regs parameter
4: PV-shim: drop pv_console_rx()'s regs parameter
5: serial: drop serial_[rt]x_interrupt()'s regs parameter
6: IRQ: drop regs parameter from handler functions
7: x86/vPMU: drop regs parameter from interrupt functions
8: x86/APIC: drop regs parameter from direct vector handler functions

Jan

