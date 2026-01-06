Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E4CF78B4
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 10:31:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195926.1513802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd3P1-0001EN-Ld; Tue, 06 Jan 2026 09:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195926.1513802; Tue, 06 Jan 2026 09:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd3P1-0001D8-HW; Tue, 06 Jan 2026 09:30:59 +0000
Received: by outflank-mailman (input) for mailman id 1195926;
 Tue, 06 Jan 2026 09:30:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8PS=7L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vd3P0-0001D2-5h
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 09:30:58 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66ed4aef-eae2-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 10:30:56 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64b7318f1b0so1035273a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 01:30:56 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b22c3absm1676847a12.0.2026.01.06.01.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 01:30:55 -0800 (PST)
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
X-Inumbo-ID: 66ed4aef-eae2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767691855; x=1768296655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5KiI2HFK3/MUDGhJ/NFBei7zgTAAsWpBROr01X7qlc=;
        b=dXMV5tDYQdpG0y7+phGTE5SnwkcFqA1nXieYe3JlpDGzgRsa+bCkRYLcZmICiKG63z
         C8o9+JQszmbDUmgOIXlsNE1dtzO42hp8pjSJKCXN1rQ1W/bDQXstJQBKnBTgMK5nkyrY
         n69hqg6nud7HWuL+F3ABS4l1DWszi6vr/8/5uxwjddx7cbqlTXUnSovOwaropTL9ozAv
         8UVfhlv2ZsR7Byw1C1nYOMR1vVKkAaK1GCdOyAva0t15TjrvTMObPlFHuocV50UVfMEM
         +hweJ/Q5Ft7HNt8eik6s4dbBqGiph7Fi6vIAxAkrU+lhDoSyl0cdrYEfHHAPeg5W+Kby
         2y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691855; x=1768296655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5KiI2HFK3/MUDGhJ/NFBei7zgTAAsWpBROr01X7qlc=;
        b=Wh2+AZ4WnD5/pM7v88a40f662nO1ZzKI7/nx3c3vd9TdWN0lyDwHhB4TSeLlvcvI9z
         7YyObpNNVnye3OJse8B8lMTmmz/U5MK2ftUfQ4CPVw+gBOll5hcppKHAmXL6j4uq0aGl
         4VyN865sPi7XGQ43MPREl77Ds8gEAaIUTVpj78qoKM10WDswXAg+bKO9WsbvSGcg6r1y
         S1hfemIRCJpc2a3/w7gUdGEjcqSnvLlhN3WgcS9U8JBSAJoAF24tszs36EkYKwKVWw1a
         O6bIXk85iLUNSFKS2/+lSxVUDVdJ9A+5zmKX5kSwm0tsXyp1TQdS64+olBYG2Q4ecHIs
         GSNg==
X-Forwarded-Encrypted: i=1; AJvYcCUITzdSAedwmv0JtaSBwnWcf5Tr6NT+TYO9zBeqd+O31OyJVD4zlhhMxXFckKqPkaLmTflvey1aZcQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9R/q2sQHMHWZQI+w+4y0lXAwi5kO+M5i8WzGFGkIFNT9Jc8xJ
	Az9lqiNBPoGvllkUlkn2yYO/hWC5lFgjKWUmix4rlOxM9y4D348uPSWl
X-Gm-Gg: AY/fxX4VPYZ5xrIhg8LsAQM/VydFhjXapCYvx0z3fexRrhwzouF++jt+Vz+W9tZA/7K
	XzDKKZXYlzuklUtYrJz1MnZ0glWv7jZJ6JYNRFZEKr6wzTtLh+tAY0AKBoRPkKE1MtQP8L1XOg6
	Cf8Zd32yHRhFu3TLBW+tNWKyGhjpPyFfl476z7XBhc4lmbNugYCXVOXiYtuk+sazQKp3TzdBbE7
	PsA0pGtEcn2e4iwvril4wkIAGoFkapB8PRAe0lzlzz3rgd8V/Njpoa/km2/+PYR1afAp/p+L/2f
	saLMrwjSDfwX46LN+pq6mqrMnN+j0Dbk1iKoxl4Zm8C2qScLOmynUsSaZ2RjtQP0G1AK0xALu7R
	QH+GC+hj7MxgEhVWjLLkLymV2QHOo98GAocwUldUr5lMD/f3jA1jy3Qte6I1+WkCg5Mt1FwxhxQ
	y0G/2VPgtgw6RjuphC6fsXRozaX+m9VVycU6psEQwSc8gbxyn1AyMTK3oQGKpRQ9s=
X-Google-Smtp-Source: AGHT+IEPfu/TRVaqjz5eL2kvkOZ/4VUFm39SWutgAFFOyS8ihSWHrMhLvIVB3UzP8g3IgvDpR8hJGA==
X-Received: by 2002:a05:6402:1ec7:b0:641:8a92:9338 with SMTP id 4fb4d7f45d1cf-65079561be4mr2110370a12.22.1767691855330;
        Tue, 06 Jan 2026 01:30:55 -0800 (PST)
Message-ID: <6bbe1965-ff08-46dc-9e9c-215ca73f9f16@gmail.com>
Date: Tue, 6 Jan 2026 10:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1767108625.git.oleksii.kurochko@gmail.com>
 <d49e5b9555d4f04d569e20d9c9feb23b298c7ee1.1767108625.git.oleksii.kurochko@gmail.com>
 <63a1aa58-f609-4bfe-b827-90c59e40a02d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <63a1aa58-f609-4bfe-b827-90c59e40a02d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/5/26 5:26 PM, Jan Beulich wrote:
> On 30.12.2025 16:50, Oleksii Kurochko wrote:
>> Add support of virtual SBI base extension calls for RISC-V guests, delegating
>> hardware-specific queries to the underlying SBI and handling version and
>> firmware ID queries directly.
>>
>> The changes include:
>> 1. Define new SBI base extension function IDs (SBI_EXT_BASE_GET_MVENDORID,
>>     SBI_EXT_BASE_GET_MARCHID, SBI_EXT_BASE_GET_MIMPID).
>> 2. Introduce XEN_SBI_VER_MAJOR, XEN_SBI_VER_MINOR for imeplenataion of
>>     SBI_EXT_BASE_GET_SPEC_VERSION.
>> 4. Introduce SBI_XEN_IMPID to implement SBI_EXT_BASE_GET_IMP_ID.
>> 5. Implement handling of SBI base extension functions, including version,
>>     firmware ID, and machine-specific queries.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Albeit with a question:
>
>> --- /dev/null
>> +++ b/xen/arch/riscv/vsbi/base-extension.c
>> @@ -0,0 +1,82 @@
>> +
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/lib.h>
>> +#include <xen/sched.h>
>> +#include <xen/version.h>
>> +
>> +#include <asm/processor.h>
>> +#include <asm/sbi.h>
>> +#include <asm/vsbi.h>
>> +
>> +/* Xen-controlled SBI version reported to guests */
>> +#define XEN_SBI_VER_MAJOR 0
>> +#define XEN_SBI_VER_MINOR 2
> Is it clear from whatever spec it is that is ...
>
>> +static int vsbi_base_ecall_handler(unsigned long eid, unsigned long fid,
>> +                                   struct cpu_user_regs *regs)
>> +{
>> +    int ret = 0;
>> +    struct sbiret sbi_ret;
>> +
>> +    ASSERT(eid == SBI_EXT_BASE);
>> +
>> +    switch ( fid )
>> +    {
>> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
>> +        regs->a1 = MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR_MASK) |
>> +                   XEN_SBI_VER_MINOR;
>> +        break;
> ... implied here (it's ..._SPEC_VERSION after all) under what conditions the
> version would need bumping and what effects this would have on existing (e.g.
> migrating-in) guests? Recall that ...

For example, sooner or later we will want to use the SBI DBCN (Debug Console
Extension) for early debug output for guests, as it provides an API to work with
strings instead of single characters. This will require bumping the SBI version
to 2.0.

I don’t think this should cause any migration issues. If a guest was fully booted
and running with Xen SBI version 0.2, it would continue to use the legacy extension
for early console output (or for hvc console which is using SBI calls in Linux for
the moment). If the guest was still in the initialization stage (before SBI
extensions were probed), it would simply use the newer SBI DBCN extension instead
of the Legacy one.

~ Oleksii

>
>> +    case SBI_EXT_BASE_GET_IMP_ID:
>> +        regs->a1 = SBI_XEN_IMPID;
>> +        break;
>> +
>> +    case SBI_EXT_BASE_GET_IMP_VERSION:
>> +        regs->a1 = (xen_major_version() << 16) | xen_minor_version();
>> +        break;
>> +
>> +    case SBI_EXT_BASE_GET_MVENDORID:
>> +    case SBI_EXT_BASE_GET_MARCHID:
>> +    case SBI_EXT_BASE_GET_MIMPID:
>> +        if ( is_hardware_domain(current->domain) )
>> +        {
>> +            sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
>> +            ret = sbi_ret.error;
>> +            regs->a1 = sbi_ret.value;
>> +        }
>> +        else
>> +            /*
>> +             * vSBI should present a consistent, virtualized view to guests.
>> +             * In particular, DomU-visible data must remain stable across
>> +             * migration and must not expose hardware-specific details.
> ... what is being said here applies to other sub-functions as well. IOW it
> looks to me as if the version reported needs to be a per-guest property.
>
> Jan

