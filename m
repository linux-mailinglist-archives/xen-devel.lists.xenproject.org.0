Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE7E849BB2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:26:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676031.1051785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyyD-0001Nc-VH; Mon, 05 Feb 2024 13:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676031.1051785; Mon, 05 Feb 2024 13:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyyD-0001Kw-Sd; Mon, 05 Feb 2024 13:25:09 +0000
Received: by outflank-mailman (input) for mailman id 676031;
 Mon, 05 Feb 2024 13:25:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWyyC-0001Kq-R2
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:25:08 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa2a9a7b-c429-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 14:25:06 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40fdd11475aso5040365e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:25:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b0040ebf603a89sm8663304wmo.11.2024.02.05.05.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:25:05 -0800 (PST)
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
X-Inumbo-ID: fa2a9a7b-c429-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707139506; x=1707744306; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BbMP18wcQMyz4HKulVAs9H/YyQXXuulGkgiEx5VK0Lk=;
        b=dt8bSGiHYWFITQ9BtFJhDd3ndguwCU7n/oRE1+a/Y3jLN1d4afEqzNO+6mJoB+RX9g
         EDZ65QLuFujdVfvgtY2fiDZs3FPMPdJU5wIpTm0b/fWpop7jyQPYOUBLfm/exanN3JqI
         1Yi3XBawUyYasb0thtiqQuKxzOD/ZnmNVn1REHZkCOpeqK90pHWQyGJMfYArmxLW1+71
         CsZfvEGiJrkgUI6sEYpJr9IUO0exUF5e7To+KVjBatOTpXER7i19uw9ANv4pppvQPpHg
         ILYf4EcycgPFUQAo/nYNFKkfkATLMj6WPrklDZYLbkbkstmOSxAdW+GED0yijQW8h+A+
         BmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139506; x=1707744306;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbMP18wcQMyz4HKulVAs9H/YyQXXuulGkgiEx5VK0Lk=;
        b=atXjiZqXhEN7wZ/3ASpLc0lvop/Qg0LVPgx/uR9GpWBZgrVJ4EAZd4FqVqiIc1MDDO
         K3sVhmmKgoQF9q8mc/ZpekT031FH0WyRnZsydut7F4cK2XAsuPn7uuyK1a9dwDC6mGdq
         9l6KgPd5LX1ej7s8vf1jS45YzHqs3VnD7z/JHcWYR59EHF/r2e8oET/6+2CIgjY5DwwU
         OJC4kc+4v8CjWgtGs3pFVClXG+dF+WQmf0Mf+5SzAr7jJwa7GXxMsumYkwkIfoBeAGBR
         o6XwKbZWDWL3S294fkhnYG8sH3ivEwYgG0JDHi45rS16783SDjhRpYc7OJlhUC09l/o4
         zfbw==
X-Gm-Message-State: AOJu0Yw182FCKZvg+zW3i7N0aI/Aqes2gt9Y11yLPkIlDdMPWte//Qwl
	v4dYE/oCwG/Fo9HXlhQTIB55lCEQNir7WkV/STLjlN/4yOdx0vTOctIyrk2EWpmhJYIArnO7tos
	=
X-Google-Smtp-Source: AGHT+IE6wIvlKDUdtbdGxzMztCl7pYvvP+4xpzP8xnOD95HgtZjgDqMWTRvv+j9sBG/xcRoOXDLydg==
X-Received: by 2002:a05:600c:2159:b0:40e:f632:723d with SMTP id v25-20020a05600c215900b0040ef632723dmr4805255wml.16.1707139506100;
        Mon, 05 Feb 2024 05:25:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV3AxxSVuzE8FTDwQJn+OA8JEtMQ25Q79HN6i7gf5+Tj0CDd+LCef6tgn4FAw5mgj3zIHvRMH1VhL9lLV62RyO6d2BCBzyyEwNG2jzOcymTxzI7O87rMex6sisZSKKGxBmu1ErXUmFO+KjR1eupFWgecQ4/m/bBey+nejdx
Message-ID: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
Date: Mon, 5 Feb 2024 14:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/8] limit passing around of cpu_user_regs
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
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

1: serial: fake IRQ-regs context in poll handlers
2: keyhandler: drop regs parameter from handle_keyregs()
3: serial: drop serial_rx_fn's regs parameter
4: PV-shim: drop pv_console_rx()'s regs parameter
5: serial: drop serial_[rt]x_interrupt()'s regs parameter
6: IRQ: drop regs parameter from handler functions
7: x86/APIC: drop regs parameter from direct vector handler functions
8: consolidate do_bug_frame() / bug_fn_t

Jan

