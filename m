Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8EB82DCE1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 17:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667496.1038813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPPSA-0007fD-TM; Mon, 15 Jan 2024 16:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667496.1038813; Mon, 15 Jan 2024 16:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPPSA-0007d0-Pu; Mon, 15 Jan 2024 16:04:46 +0000
Received: by outflank-mailman (input) for mailman id 667496;
 Mon, 15 Jan 2024 16:04:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPPS8-0007cu-TC
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 16:04:44 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb362d0e-b3bf-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 17:04:42 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cd33336b32so116487621fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 08:04:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5-20020a6b1505000000b007bf2c9bbdd6sm1685623iov.50.2024.01.15.08.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 08:04:41 -0800 (PST)
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
X-Inumbo-ID: cb362d0e-b3bf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705334682; x=1705939482; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCc5gGShZi5EVXBN8KRKI8Xy/r8mgNWyBwfE1SiFBSc=;
        b=bC2poJ4kubNyybM/bqW8cQdt9NI0MY/1jho4RP9pdsQPc+kd1oZQoNtrH8c3DGiTKh
         rTIrnWHxwCRYhDdzWm3+gnqhvOUPm8Re9RxolFNvllsuPEh+eMTbVBuuL7dHqakpq8TS
         xmyXr1dZiBk4hQnXej7ODCWqOjfdAncpQKhcvqJfavTPZmhdlBmU1fFAATUZrdFVwTxs
         nzwQ+B1v3r851wMmn+66wHSIXJgH3nzOIShKN6WIkCyzcOKzlGoK7S8KHeP5oI+d1cA8
         vhORd2eqTbFuWWC+D/9+nF7JVg9lM5qCrdkNO//KQtxeIgmF7iBhCfDZnMEmecXF3RXY
         97pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334682; x=1705939482;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCc5gGShZi5EVXBN8KRKI8Xy/r8mgNWyBwfE1SiFBSc=;
        b=MmPhJz3mqdyzaXLNxqzWfFZgW4PoYJvw6o56yvVkWhQ666FPF/nrjlZKt3VzxTRknA
         14J6LZ+5hwOy/59BMud8rniPAi4LVAI2LiMfRt5k4M/0+3LcWTOAb/ZEZq1OjyTd0M1j
         WnIxlWsKW4ibnvFytVd+IIG/jTKQUeOCF0knNzfMC0/Sh5mnft0FkXPx/RldwxXe7AKP
         QbqOhZK40OHO5pU8OyDTCp56l7QWwCcPz2zI4QG96xHa8CQhhVL7WMsFrKgQ1fleb0iM
         ov0uaDRJBLKqzojN1IIuLpAEp6dcKoBhS7bSQYKH4+TjCj4Ls3M4qhiEjvbVcahso7D+
         G4Pw==
X-Gm-Message-State: AOJu0Yxrpy1lMMqdPyo9jZ+bq7U7QBraNrF5oCeRvFpDmLafw1G4Agmm
	3RU0rY4v9L34JW3dpvLVu1BETSMi46FVg2+Uus2VIDD8aw==
X-Google-Smtp-Source: AGHT+IH7/sFTV+ZLF0+QI/eezDMnNfQ88ntDnr9nmyyA4EpXyb3BL9vTgi3drzxaEwq2e4m2s/6brg==
X-Received: by 2002:a05:651c:168f:b0:2cc:effb:cbb2 with SMTP id bd15-20020a05651c168f00b002cceffbcbb2mr2618061ljb.52.1705334682043;
        Mon, 15 Jan 2024 08:04:42 -0800 (PST)
Message-ID: <e2e66d36-5545-40e4-847d-be3b3a523944@suse.com>
Date: Mon, 15 Jan 2024 17:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: HWP vs "xenpm get-cpufreq-..."
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

Jason,

I thought I'd try hwp on a SapphireRapids system, and of course - short
of easy other ways of seeing whether it actually has any apparent
effect - I've looked at "xenpm get-cpufreq-states" output. Just to find
that according to this, the system never enters any of the designated
Pn states (all CPUs are always claimed to be in P0), while at the same
time the P0 residencies remain in the hundreds of milliseconds. The
latter suggests CPUs do leave P0, yet it's then unclear what state they
are in during such time periods.

I was also a little puzzled when comparing "xenpm get-cpufreq-para"
output with hwp against that with acpi-cpufreq: The latter lists a range
of 800MHz ... 2501MHz, while with hwp base is 2500MHz and max is 4800MHz.

Do you have any explanation for these apparent anomalies?

Thanks, Jan

