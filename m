Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC83FA1CE76
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 21:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877285.1287422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9Od-0003Sa-5Q; Sun, 26 Jan 2025 20:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877285.1287422; Sun, 26 Jan 2025 20:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9Od-0003Pp-2Y; Sun, 26 Jan 2025 20:38:19 +0000
Received: by outflank-mailman (input) for mailman id 877285;
 Sun, 26 Jan 2025 20:38:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc9Oc-0003Pj-9L
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 20:38:18 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77da9359-dc25-11ef-99a4-01e77a169b0f;
 Sun, 26 Jan 2025 21:38:16 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2166651f752so72222305ad.3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 12:38:16 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3d9b8e0sm50214325ad.40.2025.01.26.12.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:38:14 -0800 (PST)
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
X-Inumbo-ID: 77da9359-dc25-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737923895; x=1738528695; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HVPb45ZdRMqIKUAi6GudayI0aNfKV1cv8oTD0Mxltf8=;
        b=H2fkLTO/f8gudljL5nqj5KWCCQ1hXXm6kWZXB9ZXG/Q3OonKW2X9LfDOO/bHZcFpgh
         vvr0xcmDZBtEViKFgj8R5bNMdcuCmU24gB5ZDnQdQV+iCdcZfGC7NGvPC1teY1OP2urm
         W49GwN1ZGEHvTa5Pe0waNdv4DQUQAZapsefHvkW2rH693Fams+vOnuHQ4BpNHSS9imCM
         j0Kd0yMlZGJ2UBTRaHmKorFCiNoeGkicUsc9s7wfmbhc2qsf1vhF75xk9j6dTj/HkoOp
         dJ5nKx3N7bwj6hjTksIun8I6F5aoP9VxuyLh8MhJfie3C9REI+oNzwiHyU0sMoUD9AG1
         79NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737923895; x=1738528695;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HVPb45ZdRMqIKUAi6GudayI0aNfKV1cv8oTD0Mxltf8=;
        b=S7J2hgiWg0LZOQBTDZ3VlbxWlIhD28+wjqkokmQciOSoMs4Eu3p/pw4lKhliSvd26+
         rjjPGup1Cv/qX+Q5C9N59jwRaORPfhJboteIsC2sZS86TSrn75asVgKVRde3Q06SKnQb
         /QtAM7RZMrmP/xH4AH5jdyuMyTDsDvGeHhswbFgrLeMggmOwt3zcNIe7phg4VZSrjMRr
         rNnGxm3R66eyMJJnF9phPp7Rpdpgc7rIlfJigWmvHDz21/5nJL1aIJEcTeSWc5/9pVtg
         sD6kTb7C6ll6J/YsxEuxeigQSbhLtYLUEXDgY0QgjcXYVla6q08tbWlrxtKm2fU7QGyL
         Uwfw==
X-Forwarded-Encrypted: i=1; AJvYcCWNoDm4I4lro5DcOlRPk5SafnpEaJi3eD3tr2OkwGf96I6Kf2Yuua9bEouYzE5lHu4zoDUGOCbcKXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+aeQBjVge/t0kYvI5RtP/14mBmhULVbS8mv5OlTNw9QLWkGtb
	FAdp0sikel8CoshIIHRj0K4T/i7h7V88ipSbf8qFvAaaI09PJJwher8fvb/MCiQ=
X-Gm-Gg: ASbGnctSIXHBZcP3z32HuBnQCo6SwfISWaQdNd5XPVDsLB7rmQuHv57qfqmhTMbiHX3
	iU07IYnacWh63rvRcywcsgdL/m+EH57JoMRviih1ZK09cDdUVbM03tbV9+LlLQ0c8x6OJ3PdgMh
	yhG5w5pjAESK8HYlpmhFa5QLJve2e+dVXpIUOKlXgWACEefS91FxsqcjAFzJkhBcwP+naIl3cdj
	N18t5TfTpHjPy7SI1FxC/JHojCkjqoDaTPCYxnmnq3PxirdYxlRWw0rNP0yic3E7QQvAG0i99nK
	rB9Hz4a7p7wPJtrleXwwC3R9ujmSMjnteNvTlFlcEwoLKig=
X-Google-Smtp-Source: AGHT+IFHGSYkE2gK8J+M4s6UHrhYt2yFRPQZ8hFQm3oPTcuYK/Fs6x7qFNLpzA/inMpx9KuBn36otA==
X-Received: by 2002:a17:903:41c3:b0:216:61d2:46b8 with SMTP id d9443c01a7336-21c3555eb72mr575490595ad.23.1737923894867;
        Sun, 26 Jan 2025 12:38:14 -0800 (PST)
Message-ID: <36f6337f-f076-44df-bbb0-29290a010b1a@linaro.org>
Date: Sun, 26 Jan 2025 12:38:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] accel/tcg: Rename 'hw/core/tcg-cpu-ops.h' ->
 'accel/tcg/cpu-ops.h'
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-11-philmd@linaro.org>
 <d81542e9-bebf-4f5f-a911-8ab7b6180d4e@linaro.org>
Content-Language: en-US
In-Reply-To: <d81542e9-bebf-4f5f-a911-8ab7b6180d4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/26/25 12:36, Richard Henderson wrote:
> On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
>> TCGCPUOps structure makes more sense in the accelerator context
>> rather than hardware emulation. Move it under the accel/tcg/ scope.
>>
>> Mechanical change doing:
>>
>>   $  sed -i -e 's,hw/core/tcg-cpu-ops.h,accel/tcg/cpu-ops.h,g' \
>>     $(git grep -l hw/core/tcg-cpu-ops.h)
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   MAINTAINERS                                            | 2 +-
>>   include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} | 0
>>   accel/tcg/cpu-exec.c                                   | 4 ++--
>>   accel/tcg/cputlb.c                                     | 2 +-
>>   accel/tcg/translate-all.c                              | 2 +-
>>   accel/tcg/user-exec.c                                  | 2 +-
>>   accel/tcg/watchpoint.c                                 | 2 +-
>>   bsd-user/signal.c                                      | 2 +-
>>   hw/mips/jazz.c                                         | 2 +-
>>   linux-user/signal.c                                    | 2 +-
>>   system/physmem.c                                       | 2 +-
>>   target/alpha/cpu.c                                     | 2 +-
>>   target/arm/cpu.c                                       | 2 +-
>>   target/arm/tcg/cpu-v7m.c                               | 2 +-
>>   target/arm/tcg/cpu32.c                                 | 2 +-
>>   target/arm/tcg/mte_helper.c                            | 2 +-
>>   target/arm/tcg/sve_helper.c                            | 2 +-
>>   target/avr/cpu.c                                       | 2 +-
>>   target/avr/helper.c                                    | 2 +-
>>   target/hexagon/cpu.c                                   | 2 +-
>>   target/hppa/cpu.c                                      | 2 +-
>>   target/i386/tcg/tcg-cpu.c                              | 2 +-
>>   target/loongarch/cpu.c                                 | 2 +-
>>   target/m68k/cpu.c                                      | 2 +-
>>   target/microblaze/cpu.c                                | 2 +-
>>   target/mips/cpu.c                                      | 2 +-
>>   target/openrisc/cpu.c                                  | 2 +-
>>   target/ppc/cpu_init.c                                  | 2 +-
>>   target/riscv/tcg/tcg-cpu.c                             | 2 +-
>>   target/rx/cpu.c                                        | 2 +-
>>   target/s390x/cpu.c                                     | 2 +-
>>   target/s390x/tcg/mem_helper.c                          | 2 +-
>>   target/sh4/cpu.c                                       | 2 +-
>>   target/sparc/cpu.c                                     | 2 +-
>>   target/tricore/cpu.c                                   | 2 +-
>>   target/xtensa/cpu.c                                    | 2 +-
>>   36 files changed, 36 insertions(+), 36 deletions(-)
>>   rename include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} (100%)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7be3d8f431a..fa46d077d30 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -175,7 +175,7 @@ F: include/exec/helper-info.c.inc
>>   F: include/exec/page-protection.h
>>   F: include/system/cpus.h
>>   F: include/system/tcg.h
>> -F: include/hw/core/tcg-cpu-ops.h
>> +F: include/accel/tcg/cpu-ops.h
>>   F: host/include/*/host/cpuinfo.h
>>   F: util/cpuinfo-*.c
>>   F: include/tcg/
>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/accel/tcg/cpu-ops.h
>> similarity index 100%
>> rename from include/hw/core/tcg-cpu-ops.h
>> rename to include/accel/tcg/cpu-ops.h
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index be2ba199d3d..8ee76e14b0d 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -22,7 +22,7 @@
>>   #include "qapi/error.h"
>>   #include "qapi/type-helpers.h"
>>   #include "hw/core/cpu.h"
>> -#include "hw/core/tcg-cpu-ops.h"
>> +#include "accel/tcg/cpu-ops.h"
>>   #include "trace.h"
>>   #include "disas/disas.h"
>>   #include "exec/cpu-common.h"
>> @@ -39,7 +39,7 @@
>>   #include "exec/replay-core.h"
>>   #include "system/tcg.h"
>>   #include "exec/helper-proto-common.h"
>> -#include "tb-jmp-cache.h"
>> +//#include "tb-jmp-cache.h"
> 
> What's this?

Aside from this,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

