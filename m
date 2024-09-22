Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEAD97E09E
	for <lists+xen-devel@lfdr.de>; Sun, 22 Sep 2024 10:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801496.1211468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssIC8-0008Me-1X; Sun, 22 Sep 2024 08:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801496.1211468; Sun, 22 Sep 2024 08:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssIC7-0008LC-Ua; Sun, 22 Sep 2024 08:43:51 +0000
Received: by outflank-mailman (input) for mailman id 801496;
 Sun, 22 Sep 2024 08:43:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=775k=QU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ssIC6-0008L6-H6
 for xen-devel@lists.xenproject.org; Sun, 22 Sep 2024 08:43:50 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8d5a026-78be-11ef-99a2-01e77a169b0f;
 Sun, 22 Sep 2024 10:43:48 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso483252066b.1
 for <xen-devel@lists.xenproject.org>; Sun, 22 Sep 2024 01:43:48 -0700 (PDT)
Received: from [192.168.10.236] ([212.222.86.215])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612df5afsm1058359966b.162.2024.09.22.01.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Sep 2024 01:43:46 -0700 (PDT)
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
X-Inumbo-ID: c8d5a026-78be-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726994627; x=1727599427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3dy6vdQ2pV/5nhC7F42nxARvM+THTnfH+lSXnw3MJhA=;
        b=U3NTWbCsi2YbZgQgldcHa1hGI0z4F1+EXZJlN8XB8B3EJHYW4J5r3L3EhujbLsiFsx
         7scPnXvZmgC0+wM9UiBar1dGb8X99N35XuM2mlggY9SpRj5+cvKR0V/MatSPyOWyjJFy
         cB2cuPIJBE37HBLf6K3A14h0abw0OIBI5CodY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994627; x=1727599427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dy6vdQ2pV/5nhC7F42nxARvM+THTnfH+lSXnw3MJhA=;
        b=pi8gwCQVM7WIQeE3LPByGQL7HPx9MI3SVufROg33PPeZg1TOKz2wlRyIEX6sijy5Kv
         tQ759vVJ9uQdhg5LyBQ5o5uizyJvd5LhN2CgCtRmP39oLG0ityFe8SYJwmBjE0Y5wwrQ
         Ox/Fi0EgJgOaiua5o+ZpA2izriEYuv76V3XVAeppA9bo5gb4b5H23JcDRAQQy03ZEddE
         j1C0q/X3Ie2fug7XDo2Rg8GZSBcpezzaJ3jl/wYuNvz3UUwQUckiSjJUhKttUh68T2Hz
         Qa3asXW/mwaNGGoOXUS9Qi3FEGEIspKN936EwCnnc+Oo4bqu11My5Q2kvHOjxx2vHs2T
         +VxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3ysGELKsB37Uk8wwXFPCVWwvq7i2bAt8GLMi+/99qeOXyLLqQliOMZt6B+vX5/esEBjzrVvkxws=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOla+QrnGUpo81x2208nSzZJ/InlMfiKJTWE/CWZUeKb4R74Gh
	NG95VOdd/RkqxRKNejiulC++7ITCp5JICbJ1lClfp5wAQFqrNiKBJGN0JLroaa8=
X-Google-Smtp-Source: AGHT+IFbtAVd0KMcl77a1NWTou6LgkC6YSZdCL/LpzBlozb2Je2irebSiEUPMo64vyjmg5a4AFs/FQ==
X-Received: by 2002:a17:907:e662:b0:a8b:6ee7:ba22 with SMTP id a640c23a62f3a-a90d5057597mr701133266b.39.1726994627555;
        Sun, 22 Sep 2024 01:43:47 -0700 (PDT)
Message-ID: <0a6e2cf5-e9f9-4685-880b-0ad5e29c8265@citrix.com>
Date: Sun, 22 Sep 2024 10:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen: move per-cpu area management into common code
To: Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
 <15b9b94e1acb70ba713391de5bae42a622c29747.1726746877.git.oleksii.kurochko@gmail.com>
 <a5b7dbdf-886b-45d6-8402-db04c58423e8@xen.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a5b7dbdf-886b-45d6-8402-db04c58423e8@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/09/2024 10:23 am, Julien Grall wrote:
> On 19/09/2024 17:59, Oleksii Kurochko wrote:
>> diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
>> index 3205eacea6..33bded8cac 100644
>> --- a/xen/arch/x86/percpu.c
>> +++ b/xen/arch/x86/percpu.c
>> @@ -1,79 +1,19 @@
>> -#include <xen/percpu.h>
>>   #include <xen/cpu.h>
>> -#include <xen/init.h>
>> -#include <xen/mm.h>
>> -#include <xen/rcupdate.h>
>> -
>> -unsigned long __per_cpu_offset[NR_CPUS];
>> -
>> -/*
>> - * Force uses of per_cpu() with an invalid area to attempt to access
>> the
>> - * middle of the non-canonical address space resulting in a #GP,
>> rather than a
>> - * possible #PF at (NULL + a little) which has security implications
>> in the
>> - * context of PV guests.
>> - */
>> -#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned
>> long)__per_cpu_start)
>> -#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end -
>> __per_cpu_start)
>> -
>> -void __init percpu_init_areas(void)
>> -{
>> -    unsigned int cpu;
>> -
>> -    for ( cpu = 1; cpu < NR_CPUS; cpu++ )
>> -        __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
>> -}
>> +#include <xen/percpu.h>
>> +#include <xen/smp.h>
>>   -static int init_percpu_area(unsigned int cpu)
>> +int arch_percpu_area_init_status(void)
>
> I understand that Arm and x86 are returning a different value today.
> But now that we are provising a common implementation, I think we need
> to explain the difference. This is probably a question for the x86 folks.

The declarations for CPU Parking (variable, or compile time false) wants
to be in the new common header, at which point
arch_percpu_area_init_status() doesn't need to exist.

That also makes it very clear that there's a difference in return value
based on CPU Parking (and the comment beside the variable explains this
is about not quite offlining CPUs), which is far clearer than some arch
function.

>> diff --git a/xen/common/percpu.c b/xen/common/percpu.c
>> new file mode 100644
>> index 0000000000..3837ef5714
>> --- /dev/null
>> +++ b/xen/common/percpu.c
>> @@ -0,0 +1,127 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#include <xen/percpu.h>
>> +#include <xen/cpu.h>
>> +#include <xen/init.h>
>> +#include <xen/mm.h>
>> +#include <xen/rcupdate.h>
>> +
>> +unsigned long __per_cpu_offset[NR_CPUS];

unsigned long __per_cpu_offset[NR_CPUS] = {
    [0 ... NR_CPUS - 1] = INVALID_PERCPU_AREA,
};

should work, removing the need for percpu_init_areas() and avoids a
window during boot where all CPUs "share" a percpu area.

~Andrew

