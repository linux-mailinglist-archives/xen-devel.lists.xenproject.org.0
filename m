Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB83A2FE8A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 00:41:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885042.1294808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thdNq-0000By-0i; Mon, 10 Feb 2025 23:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885042.1294808; Mon, 10 Feb 2025 23:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thdNp-00009P-Tx; Mon, 10 Feb 2025 23:40:09 +0000
Received: by outflank-mailman (input) for mailman id 885042;
 Mon, 10 Feb 2025 23:40:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHzs=VB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1thdNo-00009J-Cg
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 23:40:08 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5425ef99-e808-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 00:39:54 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so2588658f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 15:39:54 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc33939f3sm12564787f8f.17.2025.02.10.15.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 15:39:52 -0800 (PST)
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
X-Inumbo-ID: 5425ef99-e808-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739230793; x=1739835593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fSSMHcGhkAYYBR3D6lKQmaMCj5sWXpYx6vjCWsA0GBg=;
        b=R+v1+KgvFmZVGh9psln7vL4x3kHuTuDbK3PujpkujwdCHaWhYP/vIzQOKIjpT29OOz
         bF/ynP5yraitsc1mX5zTa7mwopU8PhgRjD9wshqhjD8yqolqhba+KgfOvbQtIGvL4fK+
         SPh3KBKsIi7QAYW4iSQ3uMIB7cXrTXnVP7DC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739230793; x=1739835593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSSMHcGhkAYYBR3D6lKQmaMCj5sWXpYx6vjCWsA0GBg=;
        b=kC4asDnvmIQiNim5vKprghIMouBqZNM9s1xy6wrwk06diQ5xRerKZsTqZW7W81JKsf
         Eyclt0cl5nkxqFRL4clpz4TlBnaJIeIuZnZMScuDMNrMR0jfYUgIHLZzq8sfTvwd3c1l
         X9wQUB5o4s7fsLEicRuJsTvwTmoNpWJHKtl2TcbwmbgeU5F06UzLWcFxA5EzPsKYHuwY
         4umwpdUvqo3PJlMd0qvXefcVxCRPbl4vxmvPYEMaoMaoRzI/tNzAlLA+/FZBFMEwlXHK
         hrKWin0zalOKUM8871pgoNbG0obocSHwNgqLt48F26UKYL9kdnEc1aBfGyhB9sLCCW7H
         AZUA==
X-Forwarded-Encrypted: i=1; AJvYcCV6XFnkBO69dGDEqPqAaLA1h30OwaB8dqEeBr1zWCVMrNIBqud7A7eFwyTMq5ysy2iuiqEf5kqPzpE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylcwQJko+e0U7+XArLkHd8udgxLBY5xUPA6Us7TemRl9CucuAz
	r6d75UaeRGOHdxVcbd1JRBmp/Gaj6toGwqZjsY8A9AO3jaiLVwdZb/B+IfCiTxs=
X-Gm-Gg: ASbGncvbR+qW7GDML6710K5/xeleiris50Ut/Uom+bJuhhUtK7AxVKuZ0uZBctch8tn
	TNY1HMKJ/C85IlXEe4JBDKJlgTkBkCLE5OfXrEbjVUqXcW+CfgDihrhZpc7ssF/TcdejCbG/Oa0
	YutaXbEqq5vxxBYD6czoRbSserBkxNBv+PiJuu7KLBf1IJHow669/qDtanI72WHv7E5iuGpSo7K
	lkIN+gYi/QtzUs4dSx7AoUYtYgFc/1nubZfQlq/OPlMebw36rlueGLoBTiplTWa4/3HPqP6zTJd
	8AIZjrNhxQTxkGuj1OlFOqW4kn3ebOs+L2v7Ju2RxRs8B9H82W1AJVk=
X-Google-Smtp-Source: AGHT+IEf29WHMyQRUtIuV+pP656sApS6Ep9iLdJFsKyJ+aCi7uI+uhDmXVq57kTgYmud7pS9MZurHw==
X-Received: by 2002:a05:6000:186f:b0:38d:e052:625a with SMTP id ffacd0b85a97d-38de05263fbmr4757004f8f.16.1739230793582;
        Mon, 10 Feb 2025 15:39:53 -0800 (PST)
Message-ID: <5ae0595f-cd97-43c7-9143-3e5d370b569d@citrix.com>
Date: Mon, 10 Feb 2025 23:39:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 3/3] RISCV: Activate UBSAN in testing
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250207220122.380214-1-andrew.cooper3@citrix.com>
 <20250207220122.380214-4-andrew.cooper3@citrix.com>
 <00c5784f-3202-4301-a6ad-5840d84908cd@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <00c5784f-3202-4301-a6ad-5840d84908cd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/02/2025 9:03 am, Oleksii Kurochko wrote:
>
>
> On 2/7/25 11:01 PM, Andrew Cooper wrote:
>> RISC-V has less complicated headers, so update ubsan.c to pull in everything
>> it needs.  Provide dump_execution_state(), and update the printk() message to
>> make it more obvious that it's an outstanding task.
>>
>> As with commit 8ef2ac727e21 ("automation: enable UBSAN for debug tests"),
>> enable UBSAN in RISC-V testing too.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Testing of this series:
>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078817715
>>
>> Sample run with an intentional UBSAN failure:
>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570135
>> ---
>>  automation/gitlab-ci/build.yaml        | 3 +++
>>  xen/arch/riscv/Kconfig                 | 1 +
>>  xen/arch/riscv/include/asm/processor.h | 2 ++
>>  xen/arch/riscv/traps.c                 | 2 +-
>>  xen/common/ubsan/ubsan.c               | 5 ++++-
>>  5 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>> index fb55d4ce5568..35e224366f62 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -359,6 +359,9 @@ debian-12-riscv64-gcc-debug:
>>      CONTAINER: debian:12-riscv64
>>      KBUILD_DEFCONFIG: tiny64_defconfig
>>      HYPERVISOR_ONLY: y
>> +    EXTRA_XEN_CONFIG: |
>> +      CONFIG_UBSAN=y
>> +      CONFIG_UBSAN_FATAL=y
>>  
>>  # Arm32 cross-build
>>  
>> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
>> index 00f329054c94..fa95cd0a4213 100644
>> --- a/xen/arch/riscv/Kconfig
>> +++ b/xen/arch/riscv/Kconfig
>> @@ -4,6 +4,7 @@ config RISCV
>>  	select GENERIC_BUG_FRAME
>>  	select HAS_DEVICE_TREE
>>  	select HAS_PMAP
>> +	select HAS_UBSAN
>>  	select HAS_VMAP
>>  
>>  config RISCV_64
>> diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
>> index 90b800956303..39696fb58dc6 100644
>> --- a/xen/arch/riscv/include/asm/processor.h
>> +++ b/xen/arch/riscv/include/asm/processor.h
>> @@ -91,6 +91,8 @@ static inline void sfence_vma(void)
>>      asm volatile ( "sfence.vma" ::: "memory" );
>>  }
>>  
>> +#define dump_execution_state() run_in_exception_handler(show_execution_state)
>> +
>>  #endif /* __ASSEMBLY__ */
>>  
>>  #endif /* ASM__RISCV__PROCESSOR_H */
>> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
>> index d55a4a827b8c..ea3638a54fed 100644
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -140,7 +140,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>>  
>>  void show_execution_state(const struct cpu_user_regs *regs)
>>  {
>> -    printk("implement show_execution_state(regs)\n");
>> +    printk("TODO: Implement show_execution_state(regs)\n");
>>  }
>>  
>>  void arch_hypercall_tasklet_result(struct vcpu *v, long res)
>> diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
>> index 7f73f94759db..e99370322b44 100644
>> --- a/xen/common/ubsan/ubsan.c
>> +++ b/xen/common/ubsan/ubsan.c
>> @@ -10,8 +10,11 @@
>>   *
>>   */
>>  
>> -#include <xen/spinlock.h>
>> +#include <xen/bitops.h>
>> +#include <xen/kernel.h>
>> +#include <xen/lib.h>
>>  #include <xen/percpu.h>
>> +#include <xen/spinlock.h>
> I am not insisting on to have these changes in a separate patch, but they don't really
> look as RISC-V specific.

They are a direct consequence of RISC-V having less complicated (== less
entwined) headers.

>
> Anyway, changes look good to me, so:
>  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~Andrew

