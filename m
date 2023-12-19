Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556AB8188E5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 14:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656832.1025299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaTt-0004X6-6y; Tue, 19 Dec 2023 13:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656832.1025299; Tue, 19 Dec 2023 13:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaTt-0004UX-3j; Tue, 19 Dec 2023 13:49:57 +0000
Received: by outflank-mailman (input) for mailman id 656832;
 Tue, 19 Dec 2023 13:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFaTr-0004UP-Tk
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 13:49:55 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d31aa89-9e75-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 14:49:54 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3333b46f26aso3790201f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 05:49:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b0033661255299sm8121682wrn.34.2023.12.19.05.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 05:49:53 -0800 (PST)
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
X-Inumbo-ID: 7d31aa89-9e75-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702993794; x=1703598594; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJ/x5r7S1V8t1jZNdx2JKpMDf32cYcP7sIFLL4ti1n0=;
        b=VQmDCK7cu8pBOwcDeYZNTOHq+0ccZmndGR/YuIRf/YIpkOgsiCwNMgRUMTTg76OlO/
         MhMnMxHYEBdsaT40D3gvTCgIUw1ZKI1U8X5/TL4NdNjM/Hg4t5iFotN8j2lGywyNV5Ux
         D1NMAkrVhncyeMvaKM0wnmmX/yHMzApJH7vMfWt8cA9h4TjJr9ET7LWqBoz1R4CbVI3T
         8OGk4admKH3+ofM35qmOw3jCKfFU5hIhFg/IxorVGIAdXQwRHXQw0JbygESMlSO88oE+
         kHhVbcNhme1HEXh8pyUXx1MWikp0Nzx0vGz5fg0lGmjCsmFcr7ouG9BB4rK7Jwt88oSX
         9Oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993794; x=1703598594;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJ/x5r7S1V8t1jZNdx2JKpMDf32cYcP7sIFLL4ti1n0=;
        b=L1qacfw5e1MRpoJo9GFwX6aMQnqPzw27zYM7sTNvc96BpJ8wU1VTgovo5N9aRJLoMV
         WMG6N3zYh/TZ/YyIaZ0P3w9x6p1e31jh9ZaBfIRhR6H5F2WG79YupWg3TWygEngFVq+u
         GC03sTzZJlJ2bIaL78jJtZ2RJPBzFI7+5L4qBZ3x5UFMGWVU0tL1Lpp+osFvMbbq3pCN
         QeNJbzW0yQatbHCpNrV8+t9Z59eBoyGFoDfRMnloT9EgxGSHegLb9mB0N9oz5MX+fGN9
         kqLtNno7ps0V+XPGKB/0fxe8R8DwIdd4cZDnjNJtPlMEg5AzTG7aIh7Etz9rxHXQT9+j
         31Rw==
X-Gm-Message-State: AOJu0Yxw8Hjh5sMvDIj6wDa1zNp9f+cZqsMzFnl+v9kEfXi/yo+02mL3
	tMhpqSdH6doRi9zc31UzLzNrGKV0wywPb72/Snic
X-Google-Smtp-Source: AGHT+IHv3EGRWzLQMLXNO4tKJYOA3T+YgRyNEz+/pzAaLllgGs2lxnQZviIluTwSNzUZFqa7V2ADog==
X-Received: by 2002:adf:f3d0:0:b0:336:768f:f840 with SMTP id g16-20020adff3d0000000b00336768ff840mr210376wrp.83.1702993794025;
        Tue, 19 Dec 2023 05:49:54 -0800 (PST)
Message-ID: <072a4e90-78dd-47ff-9890-ba377e0a2b66@suse.com>
Date: Tue, 19 Dec 2023 14:49:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/IO-APIC: correct RET polarity comment
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

The comment there was the wrong way round, documentation clearly states
that 0 is high and 1 is low.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -101,7 +101,7 @@ struct IO_APIC_route_entry {
                                            */
             unsigned int dest_mode:1;     /* 0: physical, 1: logical */
             unsigned int delivery_status:1;
-            unsigned int polarity:1;      /* 0: low, 1: high */
+            unsigned int polarity:1;      /* 0: high, 1: low */
             unsigned int irr:1;
             unsigned int trigger:1;       /* 0: edge, 1: level */
             unsigned int mask:1;          /* 0: enabled, 1: disabled */

