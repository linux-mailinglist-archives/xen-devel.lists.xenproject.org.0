Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7327A126E2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 16:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872704.1283685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4yt-0004mc-1B; Wed, 15 Jan 2025 15:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872704.1283685; Wed, 15 Jan 2025 15:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4ys-0004kQ-Up; Wed, 15 Jan 2025 15:06:54 +0000
Received: by outflank-mailman (input) for mailman id 872704;
 Wed, 15 Jan 2025 15:06:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tY4yr-0004kG-9U
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 15:06:53 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59361bc6-d352-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 16:06:51 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso49319625e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 07:06:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74ac221sm25832325e9.11.2025.01.15.07.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 07:06:50 -0800 (PST)
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
X-Inumbo-ID: 59361bc6-d352-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736953610; x=1737558410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/9x7n8Nj7/KmGswwOkmdXcJc8JRIk694v+DXVaWg5Kc=;
        b=LNJwqwnIriwbiexx6f9a67wrbZ1ZWJkU9hIHBciVsmoC2s9JkCCLi1PGon0UHQR/aa
         +1bRIsPWa2Xt9z1SYx0RVqsXBlbmeLIX7rDLTLS0fk32Ie7hslcRK+CRaAqA7EH+AiBp
         VyZm9DnxbunXCOs6hxLx9jHo94vTrBu30P/l1z7+rLKP8KjpoMGDGWLmfm7K0nOHeUeM
         xd1X2aQujeLIy/7UO9Q0y1XyLVxHzVXxvVKOaLl/CWP7bzGomLSalOE12B6m1xe2R/J1
         zPvM40s1nUwOa5dT7vk8dcV3LB1w1eBx0YGjzfsxgWJQ/ExGlp5Q6WpWkKjI+cpJJSaW
         mb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736953610; x=1737558410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9x7n8Nj7/KmGswwOkmdXcJc8JRIk694v+DXVaWg5Kc=;
        b=rBL+MukW1/HgNj2lICur2hZlqM2ZCJFE9obi0We+gUhFq2PNhoWwBffmHPEHFaQG13
         nPtS2mdtWjM6FSnQH3OCfAlDeG4tNf9kS4VBV+Y8qqnLT6DI/HhGJFDCjtQGsN5MDPHZ
         hMTBhHEJl8E5Tp6CWUdzNdAg14LV2fe6xDiaUqDq9EmHDr4j2lYwTsruHRzZkkvn/zxF
         2sOKNiCSVMZOc/X2bQL1UwAlXI+QtRPmfTB3QsRxA9sM+40kQc7SGFKimQjmQFeMRpz6
         IvdbprzNivRNHIKfJMugB+7m0vyRchpIDYwHfmG8sa5wRBrjcI9BKavegXQZOlulc3/n
         Y5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWcVNLHARBqv4yaypctSsqOx/2fzUk9Pz0iCpF5n1nwibef0DCZvPUBIaAgmO32E/gFdHDmOmJeXMs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzzCJ/YrvTkxxSTAYqx27wtYt/dEetcfjco/JkcZlBZ/8JyEUZ
	hEMcG/CMkp+WaV40JVHhC1FAyJjzLbnH8swA5HKjwzrnL6FLo6T+1FVEDn0Yzg==
X-Gm-Gg: ASbGncuRhOnoy5O/qtzXnsaYZCYfBF5uKjNpLVK4D1sDizbvtgTTpJNwmyxsqYP/V8e
	Ix6tdamSDk2nQrGqxhPvHPyCwNPFAJIqccQlNJ3ip8EOHDLSP2f0YUkbU4cCmKcRb/3NhsXlaT6
	6grws690ChKSoguW6DYY7U45He0Shg0MNneLsAzbQs5BUwWRt2qGTxbdHoYYourmn+GjmLyoa4N
	x0vP23f0Qwd+8ObXkglWC9+8oAN+qK1/DPbZHWOAnKtGeMj3watVfuGVz9EVaWc4tiYXSJntWcI
	kkFMKOn7yDFFEkqvLERImpgb8P1og8gvnu1RQG3WQA==
X-Google-Smtp-Source: AGHT+IFsiu1KRaWL1i05xrnLoX9hwxvCIVvqwAxC5IyMv/dI0s2Ai/UtjcHwsmSQsVEAVp+VMKRRnQ==
X-Received: by 2002:a05:600c:450d:b0:434:a711:ace4 with SMTP id 5b1f17b1804b1-436e26a9510mr287410195e9.17.1736953610395;
        Wed, 15 Jan 2025 07:06:50 -0800 (PST)
Message-ID: <0bb26991-9310-445d-8eee-8cb421f18543@suse.com>
Date: Wed, 15 Jan 2025 16:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ppc: Fix double xen_ulong_t typedef in
 public/arch-ppc.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250115150339.53931-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250115150339.53931-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2025 16:03, Andrew Cooper wrote:
> public/arch-ppc.h contains two adjacent #ifndef __ASSEMBLY__ blocks.
> 
> With these merged, it becomes very obvious that there's a duplicate
> definition of xen_ulong_t, which is also noticed by the docs build:
> 
>   /usr/bin/perl -w /local/xen.git/docs/xen-headers -O html/hypercall/ppc \
>           -T 'arch-ppc - Xen public headers' \
>           -X arch-arm -X arch-riscv -X arch-x86_32 -X arch-x86_64 \
>           -X xen-arm -X xen-riscv -X xen-x86_32 -X xen-x86_64 \
>           -X arch-x86 \
>           /local/xen.git/docs/../xen include/public include/xen/errno.h
>   include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:55
>   include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:61
>   include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:61
>   include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:55
> 
> Drop the second typedef.  Finally, annotate the #endif so it's clear
> what it refers to.
> 
> Fixes: 08c192cc1127 ("xen/ppc: Add public/arch-ppc.h")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



