Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203D78AE5FB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 14:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710563.1109830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFD8-0000vH-D6; Tue, 23 Apr 2024 12:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710563.1109830; Tue, 23 Apr 2024 12:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFD8-0000sV-9p; Tue, 23 Apr 2024 12:25:22 +0000
Received: by outflank-mailman (input) for mailman id 710563;
 Tue, 23 Apr 2024 12:25:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzFD6-0000sP-CG
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 12:25:20 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b6c547c-016c-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 14:25:18 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3499f1bed15so3619379f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 05:25:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d590a000000b003437ad152f9sm14356202wrd.105.2024.04.23.05.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 05:25:17 -0700 (PDT)
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
X-Inumbo-ID: 8b6c547c-016c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713875117; x=1714479917; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J7cxVEYxx90QdZKbVCjbOSLgnc2DhaRVlt1GSr3m4cs=;
        b=ZDRKpH/6rMRaNVQf/5sBDic5/rOVs++coVAEcFjbf9LQVP/w9N1mvPImQeeCQQCJ6e
         L/EG7oyZ21dgLy8Vn8AW42AqNdAbeABf3pLU3utlf1OFn2srf5NXagOiXW8CVTsWZBjz
         w6xcHU3UGIkyWGtCyKWGOyp63Xeh9h2Bgps+cK7BWA4uRkyNvqQhyLTI+u1858V8xT0K
         dYxf0LXaF+CaCxyb4FidBIZnX37jQoDXQnm3Pm0JmcUNQJ7Je82vJX7EFqf41581U8Xw
         rfjCVV+FgZaZJHJaQdTq/B24wtAbvnotMsWBu7OAGpbBcKgL/t/Bg2JOjYCQbR57qsEt
         vRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713875117; x=1714479917;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7cxVEYxx90QdZKbVCjbOSLgnc2DhaRVlt1GSr3m4cs=;
        b=kJD1pXSb0fTpkrrFLwBy3+CuSjwIREy6cbKcKjECH6SaTw2y0HHXERY7Wr55XeIhyr
         r7AfDXymMZ8YgkTKn1Uj31TCsCum+tllZX7ivadO0MEcASzGpAQMBQSCR95a2KaAtrLQ
         uihV3j7B8oskJSlGMXZakqQhZwP9THGKfwRIH6tDbGRM8OVj0js9kgXugf4JMVtseQi7
         S1wWwfbDTS1xT5RWjLft1mF+SC7WnPOzffAz/Loc8a80xHfA1x7qxarX7yhgu9lh3bEY
         Afz1hc2ml4pdslgWbdILLiFn5YyEeage85PMuEv9jLC1dezdX/F3GGaNWjxT7TM1e3h3
         EAoA==
X-Forwarded-Encrypted: i=1; AJvYcCWAW+Gyn9lN74RDdF0JGM+e0TSeNuwCNSy/E+5JRvh56F6sMYweV5QPFB9KZgCvG430e3qxuktfWND8MAA4/QGtxeR7CHaAf4f32zBArAU=
X-Gm-Message-State: AOJu0YxzawkGVPbwvN9lAYfJXB1WcXtNaxswQO1akK8glrcZqLWfj+qc
	C5MNyhKWjaPjeOVOa1dTttWeRNO+DNxDIBIZ0KP9WmtEItZaALFaWYLzbduYww==
X-Google-Smtp-Source: AGHT+IGk5nEVXjfzUrWV/Iqwbgp2t09Pi4b9pwl+U/Wm0qRjH6RUSSAX5eVZ76m/OnsXcvuNWGCTTw==
X-Received: by 2002:a5d:6a89:0:b0:343:b748:9af2 with SMTP id s9-20020a5d6a89000000b00343b7489af2mr1718838wru.19.1713875117467;
        Tue, 23 Apr 2024 05:25:17 -0700 (PDT)
Message-ID: <94da8512-2a02-4109-90f5-627715e48f1e@suse.com>
Date: Tue, 23 Apr 2024 14:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: introduce header file with section related
 symbols
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-2-roger.pau@citrix.com>
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
In-Reply-To: <20240419100217.12072-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.04.2024 12:02, Roger Pau Monne wrote:
> Start by declaring the beginning and end of the init section.
> 
> No functional change intended.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/arm/mmu/setup.c   |  3 +--
>  xen/arch/x86/setup.c       |  3 +--
>  xen/include/xen/sections.h | 17 +++++++++++++++++
>  3 files changed, 19 insertions(+), 4 deletions(-)
>  create mode 100644 xen/include/xen/sections.h

Noticing a few things only after committing / pushing: For one, I should have
waited for an Arm ack. I hope that's not a big issue.

> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -7,6 +7,7 @@
>  
>  #include <xen/init.h>
>  #include <xen/libfdt/libfdt.h>
> +#include <xen/sections.h>
>  #include <xen/sizes.h>
>  #include <xen/vmap.h>
>  
> @@ -62,8 +63,6 @@ vaddr_t directmap_virt_start __read_mostly;
>  unsigned long directmap_base_pdx __read_mostly;
>  #endif
>  
> -extern char __init_begin[], __init_end[];

Then I wonder why it was this rather than ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -5,6 +5,7 @@
>  #include <xen/param.h>
>  #include <xen/sched.h>
>  #include <xen/domain.h>
> +#include <xen/sections.h>
>  #include <xen/serial.h>
>  #include <xen/softirq.h>
>  #include <xen/acpi.h>
> @@ -309,8 +310,6 @@ void __init discard_initial_images(void)
>      initial_images = NULL;
>  }
>  
> -extern unsigned char __init_begin[], __init_end[];

... this ...

> --- /dev/null
> +++ b/xen/include/xen/sections.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __XEN_SECTIONS_H__
> +#define __XEN_SECTIONS_H__
> +
> +/* SAF-0-safe */
> +extern char __init_begin[], __init_end[];

... that was moved. "unsigned char" is generally preferred over
declaring binary stuff "strings". I further wonder why the opportunity
wasn't taken to make both array-of-const. And finally I'm slightly
puzzled by the SAF comment appearing with no mention at all in the
description; of course I don't mind its addition.

Jan

