Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EDA849672
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 10:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675715.1051106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvGx-0004H5-LH; Mon, 05 Feb 2024 09:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675715.1051106; Mon, 05 Feb 2024 09:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvGx-0004Dt-IT; Mon, 05 Feb 2024 09:28:15 +0000
Received: by outflank-mailman (input) for mailman id 675715;
 Mon, 05 Feb 2024 09:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWvGw-0004Ct-EW
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 09:28:14 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e25b0ce9-c408-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 10:28:13 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33b406e16d4so262648f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 01:28:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4c42000000b0033b39cba5e4sm2739049wrt.116.2024.02.05.01.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:28:12 -0800 (PST)
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
X-Inumbo-ID: e25b0ce9-c408-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707125293; x=1707730093; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuRT6PO9FlqzfTLIgTmJkdWYkbG+oUe7ID0Ea5F8FhM=;
        b=dQlpDUSoK8AZbC2HhZMsQCHYvuHrlbCR4HQPjHk+2KKfdxXQjOqJyh01b3iNgr3TtT
         x1FPpwQWTLSQYedop9XIiKDOsakc6d+oPrIzF4/Ii3y3j7YXWH8/m4LzImdWTGbZtAcm
         GUNWwrlxWe9ZMKBbG1giEhSSTfC2jr7ENH+857fJdnOXqDEeSpFrTfN9H4Gm7TfDRTAZ
         W1GOLeD0mrrENSYoGnpR3nvBnEXFrUJC0dVOl2IrCt60UHTnIz7Yb/kXR6p6qPo4jJz4
         zgzlIIgH20uiu2r5c3xrGp02EU1PGy6S65ejv8ZzdeNKA4gjgrzQI1D8hKQjpWl15aOF
         ihOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125293; x=1707730093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuRT6PO9FlqzfTLIgTmJkdWYkbG+oUe7ID0Ea5F8FhM=;
        b=D5CDvmlRhJjdcECiYi/Y526O4uioiAkckC1YvyaaRSc6GncAdG14NqjqYSVRP8nwkG
         X8vnKlGFsnP7LOcWIjHPxy2oPLtf1LWb+VTiDx/JN03xw/Ib79eugw7lhMpFEqrx5t4F
         fGj85hB/4a5MVPjhlynhkTamKONOo06cRW97yoRoMY4wLD+IKlrrKiZ0pjoJepFmrK/6
         TleiloxR2fG/5DY8qm905qmOHhzehjcbUCN46VnF1zRDCzfQt9nvE48VqktRr31KXTUA
         615m/owP79/zLEbnY2pVUy+NOHIRHcmTXnEIIvo5oIfilMZeFj5anj/lD1zqM7ThkmHs
         WSwg==
X-Gm-Message-State: AOJu0Ywqnhe1O39gL8qVaZ4g9gy4Q8fszgopZT1bin0fneJnaoO7wBFJ
	grU8DQs7kCwqcvRgF2HjhyeKXC9tI/2OxrKTEI+yBw6iRHU35sQ+QL5WEesd6w==
X-Google-Smtp-Source: AGHT+IFc7YV6GyTNBo1TERsFx+qmUms3imNQX8kvzJl7L0pUwmaMOGJqIwjMCX74SVgd+y4M86JoEg==
X-Received: by 2002:a05:6000:22f:b0:33b:3040:df03 with SMTP id l15-20020a056000022f00b0033b3040df03mr2990275wrz.46.1707125292759;
        Mon, 05 Feb 2024 01:28:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXeMCyKqtCCJQ2XZ10rVc3LbkRbD+YsHU+P54QqFPcYt1cgnEaLAP4eyhGoHdg8NRaCaKkU2HNyU8LmNLixV9yJlGiDoTkO5d/LQA7E0Z6UMGhr8gVwI5iVoyQ3xqoqWCSVnrN8Iiv8c93d4qegRx94jAMUwBrclwO7RakOWAVi849ipw+2/Zqm5TlR4eB5ZQ+Vk1lskzJEv4y3WDFVXyu36BdONIsSuG6KayrkcRlT42cbmOyyG99xghTYyRdKxxn1mftx4Hlu3QzRS7brxBi92NNUAZtn
Message-ID: <817898fc-b58d-4977-9cb8-977922019ccd@suse.com>
Date: Mon, 5 Feb 2024 10:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/15] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-2-carlo.nonato@minervasys.tech>
 <749799db-de6f-4ca8-bab1-67468f97929b@suse.com>
 <CAG+AhRV8gPdbm5MK6-g_DO+=KNrakWs82xMCGDMGy05Rxngvtg@mail.gmail.com>
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
In-Reply-To: <CAG+AhRV8gPdbm5MK6-g_DO+=KNrakWs82xMCGDMGy05Rxngvtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2024 11:57, Carlo Nonato wrote:
> On Thu, Feb 1, 2024 at 1:59 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.01.2024 18:17, Carlo Nonato wrote:
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -31,3 +31,20 @@ config NR_NUMA_NODES
>>>         associated with multiple-nodes management. It is the upper bound of
>>>         the number of NUMA nodes that the scheduler, memory allocation and
>>>         other NUMA-aware components can handle.
>>> +
>>> +config LLC_COLORING
>>> +     bool "Last Level Cache (LLC) coloring" if EXPERT
>>> +     depends on HAS_LLC_COLORING
>>> +
>>> +config NR_LLC_COLORS
>>> +     int "Maximum number of LLC colors"
>>> +     range 2 1024
>>
>> What's the reasoning behind this upper bound? IOW - can something to this
>> effect be said in the description, please?
> 
> The only reason is that this is the number of colors that fit in a 4 KiB page.
> I don't have any other good way of picking a number here. 1024 is already big
> and probably nobody would use such a configuration. But 512 or 256 would be
> equally arbitrary.

And because of this I'm asking that you say in the description how you
arrived at this value. As to fitting in 4k-page: That makes two
assumptions (both true for all ports right now, but liable to be missed if
either changed down the road): PAGE_SIZE == 0x1000 && sizeof(int) == 4.

>>> --- /dev/null
>>> +++ b/xen/common/llc-coloring.c
>>> @@ -0,0 +1,87 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Last Level Cache (LLC) coloring common code
>>> + *
>>> + * Copyright (C) 2022 Xilinx Inc.
>>> + */
>>> +#include <xen/keyhandler.h>
>>> +#include <xen/llc-coloring.h>
>>> +#include <xen/param.h>
>>> +
>>> +bool __ro_after_init llc_coloring_enabled;
>>> +boolean_param("llc-coloring", llc_coloring_enabled);
>>
>> The variable has no use right now afaics, so it's unclear whether (a) it
>> is legitimately non-static and (b) placed in an appropriate section.
> 
> My bad here. The variable should be tested for in llc_coloring_init() and in
> domain_dump_llc_colors() (in domain_llc_coloring_free() as well, in later
> patches). That change was lost in the rebase of the series.
> 
> Anyway per this patch, the global is only accessed from this file while it's
> going to be accessed from outside in later patches. In this case what should
> I do? Declare it static and then make it non-static afterwards?

That would be preferred, considering that there may be an extended time
period between the 1st and 2nd patches going in. Explaining why a
variable is non-static despite not needing to be just yet would be an
alternative, but then you'd also need to justify why transiently
violating the respective Misra guideline is acceptable.

Jan

