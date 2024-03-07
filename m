Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24654875375
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 16:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689949.1075495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riFqv-0000YZ-DY; Thu, 07 Mar 2024 15:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689949.1075495; Thu, 07 Mar 2024 15:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riFqv-0000WF-Ad; Thu, 07 Mar 2024 15:40:13 +0000
Received: by outflank-mailman (input) for mailman id 689949;
 Thu, 07 Mar 2024 15:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riFqt-0000Uk-Bx
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 15:40:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fab7a26a-dc98-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 16:40:09 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3ddc13bbb3so393985266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 07:40:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x23-20020a170906135700b00a3e4c47bad1sm8339268ejb.8.2024.03.07.07.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 07:40:08 -0800 (PST)
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
X-Inumbo-ID: fab7a26a-dc98-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709826009; x=1710430809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+ZRYqFkGQ8TOETEYoUTH6C8N+BrzyX5yY0YORN6HLQ=;
        b=MPGkRW7+gRQGkkhgNRgBTtTrvPEbtvxfLCQDXtYE4BPi0f2ksNyTLl89qdBEWOlfXH
         OVvZp64nsEK+rCLv2ItnhckesoSq1lVlFngGPVqVCQZrZtbTIcS7o8tD+J46XgqScYsH
         i3iIL0Lp1Ge62mHrx3T92afA6xN0TCw7Bj0U3ANJolMO9ibml0HRlUjEW//jactHiEAF
         Odu21/+86hUcRw4G1L6mOrQojtdIppNMS5scO3Z2VqarZ5vfc9N3qqkK2gCPphP8HfXp
         7dZ87FyWLAIedrpZ1kVMACaXbWIeRujNixIBaZZ7mdz57rFh43qJW1gxNTGEWuEEZ1xn
         Iyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709826009; x=1710430809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B+ZRYqFkGQ8TOETEYoUTH6C8N+BrzyX5yY0YORN6HLQ=;
        b=tuGjvoPSfyQEFgOCYKDEohef4EPKGwf4xKm9y8r5Lvk7rB9tE86op4qX1ru3BTE0Oi
         9k9KRML1vmka2PQRtfgtkV0ACYqchktSOiajVlrNOEFI9Hil7Re7sktqtH23dHEx/ohg
         93VuOxOXmxoRc56m8c08gVJ3w0fRmL/VWAyQeRXXEBvG8QUeKlvOBUxlRF48n5LVztP0
         GU1Rba6VMYEyqi4jy+tczVfC5lUgBmDiCV0T1YtfXC1kRDHjU121Gf78yjST8kVlL43K
         IhZNgCv4rmnqlrw+bLj6FEKMIdOH1Aj9bLGIL8QsHr5i6pMxPnxq/DR5VO+CZyxQc+0E
         +GkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPSPkZyMZFZAjiiKasN8Q888XnNQ6vt4mCaCy9dAwQa3CVvPaGbi/PfCglsGS9QUBizSse68SXyeLnIGdo2DP6pIq4sH6DXTJ3N1BoayM=
X-Gm-Message-State: AOJu0Yyex3Qp1c5tkVf4fdosRosFLCL6WkSlPprQ9iWi8KcBktdejjpH
	nZcKmfj+efJtdnZmbYp0JZTDQYVhz3mOHSf8Wu7lnx4e3LZsnOhKrChjXEIejA==
X-Google-Smtp-Source: AGHT+IEblmYc7Rd5KdWLc+n/63cHvUNmdGWrnvS4I4eFSLy+ErrR0dCQ/ttDKk2Iro5btdh/OzeTFQ==
X-Received: by 2002:a17:906:3bda:b0:a45:2cf3:6c65 with SMTP id v26-20020a1709063bda00b00a452cf36c65mr475340ejf.25.1709826009009;
        Thu, 07 Mar 2024 07:40:09 -0800 (PST)
Message-ID: <ecd6368e-a5ee-47fa-b255-ec19b16bb3cd@suse.com>
Date: Thu, 7 Mar 2024 16:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/23] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <85ad8c86901d045beed228947d4c3faf277af3ca.1708962629.git.oleksii.kurochko@gmail.com>
 <3d9b0fa3-d100-4e73-b5d5-782ef58e331a@suse.com>
 <7ae660e5da986503a1353f07ecf298bd9814afe1.camel@gmail.com>
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
In-Reply-To: <7ae660e5da986503a1353f07ecf298bd9814afe1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 14:30, Oleksii wrote:
> On Wed, 2024-03-06 at 16:31 +0100, Jan Beulich wrote:
>> On 26.02.2024 18:38, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/atomic.h
>>> @@ -0,0 +1,296 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Taken and modified from Linux.
>>> + *
>>> + * The following changes were done:
>>> + * - * atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were
>>> updated
>>> + *     to use__*xchg_generic()
>>> + * - drop casts in write_atomic() as they are unnecessary
>>> + * - drop introduction of WRITE_ONCE() and READ_ONCE().
>>> + *   Xen provides ACCESS_ONCE()
>>> + * - remove zero-length array access in read_atomic()
>>> + * - drop defines similar to pattern
>>> + *   #define atomic_add_return_relaxed   atomic_add_return_relaxed
>>> + * - move not RISC-V specific functions to asm-generic/atomics-
>>> ops.h
>>> + * 
>>> + * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
>>> + * Copyright (C) 2012 Regents of the University of California
>>> + * Copyright (C) 2017 SiFive
>>> + * Copyright (C) 2024 Vates SAS
>>> + */
>>> +
>>> +#ifndef _ASM_RISCV_ATOMIC_H
>>> +#define _ASM_RISCV_ATOMIC_H
>>> +
>>> +#include <xen/atomic.h>
>>> +
>>> +#include <asm/cmpxchg.h>
>>> +#include <asm/fence.h>
>>> +#include <asm/io.h>
>>> +#include <asm/system.h>
>>> +
>>> +#include <asm-generic/atomic-ops.h>
>>
>> While, because of the forward decls in xen/atomic.h, having this
>> #include
>> works, I wonder if it wouldn't better be placed further down. The
>> compiler
>> will likely have an easier time when it sees the inline definitions
>> ahead
>> of any uses.
> Do you mean to move it after #define __atomic_release_fence() ?

Perhaps yet further down, at least after the arithmetic ops were defined.

>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/atomic-ops.h
>>> @@ -0,0 +1,92 @@
>>> +#/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _ASM_GENERIC_ATOMIC_OPS_H_
>>> +#define _ASM_GENERIC_ATOMIC_OPS_H_
>>> +
>>> +#include <xen/atomic.h>
>>> +#include <xen/lib.h>
>>
>> If I'm not mistaken this header provides default implementations for
>> every
>> xen/atomic.h-provided forward inline declaration that can be
>> synthesized
>> from other atomic functions. I think a comment to this effect would
>> want
>> adding somewhere here.
> I think we can drop this inclusion here as inclusion of asm-
> generic/atomic-ops.h will be always go with inclusion of xen/atomic.h.

I'm okay with dropping that include, but that wasn't the purpose of my
comment. I was rather asking for a comment to be added here stating
what is (not) to be present in this header.

Jan

