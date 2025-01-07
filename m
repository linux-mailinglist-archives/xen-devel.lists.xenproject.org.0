Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C2A03ADB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866165.1277446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5g6-000357-D2; Tue, 07 Jan 2025 09:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866165.1277446; Tue, 07 Jan 2025 09:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5g6-00033d-A6; Tue, 07 Jan 2025 09:15:10 +0000
Received: by outflank-mailman (input) for mailman id 866165;
 Tue, 07 Jan 2025 09:15:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QnJ5=T7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tV5g5-00033X-MT
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:15:09 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3fad2ea-ccd7-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 10:15:08 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-300392cc4caso168878461fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 01:15:08 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b082dc8sm58217361fa.108.2025.01.07.01.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 01:15:07 -0800 (PST)
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
X-Inumbo-ID: e3fad2ea-ccd7-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736241308; x=1736846108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3Nd9qoFHTYlqrzl1iRpc8+ZuivKjkCDK+a01NNYKnU=;
        b=SDhOTqMUbb4rsFYupR5WkdFN7XwfSe80YAZovfE6c7D57XE4E/R4/8owdwtVZs7Xcl
         nHVw3JoPMFdc6QKgzfSxAG0RS8XH2NXiT7R3GKWt4zVT9kv/9xACvRX9FUDxVXm1TG1Q
         +F0UX9tmyPnjJGYT111QLlSP4MCmtAdN6IlS7aMIIuLA37q4Z6zByoRVA0zzCGUM+DJA
         Rh8Fiye3jEjel0mJ6MFIZTw1I4PM48ZDtbDDq0CbWjsmaSbJ926SVUXnCkL6CjC5lFrw
         kMQ3/WGQy3K4KcpT9WMfFIvHdDhNOby+lyRWMVGegmCSISwOQi7uHUNoZ76p1AG8Zh60
         StGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736241308; x=1736846108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3Nd9qoFHTYlqrzl1iRpc8+ZuivKjkCDK+a01NNYKnU=;
        b=I6OXWmX2qCT9KJFmnCSwc6S88HeGmIh4eWW8tyZaP+YAjKzwaUzIaKF2WUt+Dr+ILB
         qhnC08AuUXdgvVyyJ/ZKAGbylLMPIYBi+ZDOcx7dPe92ElgKULQZJsrZe70c3bfBEdwJ
         /hubdRzIu2rFtX8GuZNmqpn750LgCp25B75C+BVZBWNQC9SDXX8l9oC7SkcH8NjXmgiq
         rg11xVqJeBMgn9hjZk35AXJYVgIHcKMLTDKi27mkaGt4msGvvBI8p8yOGRPwo3x3da06
         uSUDW/MC84DUv8TubEOjBPtY9+VJ2I4UXYAyR2+f3VXDC5LS+b8LWLlWYlcIjybh8Jvk
         PZCw==
X-Forwarded-Encrypted: i=1; AJvYcCUBIkBqTENVn/fB6kVgxWjq3qWEB3suIvs0YN+HRr1GprOV1RQUweHnv2gylWhy0yzQV9/dq4RmHGA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+qyBwI8sj4RcRBhWedw84pnHcs/L3EHkErskBO6bir+OpvoQv
	WfaPtGGCN3Psh5cXotdvd/qfwzKt86lcHyr6w/F48y4qbNEUb8CR
X-Gm-Gg: ASbGncs7slFmatuTEmKSTaH3/hI27idXuUYY7lweWaeuWDPpRMp1NA0MmKo4tay8Xha
	kGGYjh5JMyQWHbVMz76atfz7if8m/6NoYCM1OSO6letlK9JzYXVRnz4UcYnRx8m6iB6Qyfatokc
	jeDkf2lj7Xx2xX10f4rAUBXChWA26fC5deOoBUl2Eo5RW26uDqePFK4MTGvpCm4B6+iJlgrH3r4
	BLKVtu/AFIbrQJKXUEfVT9TF5SfrR39+DIt7vcS0ZrKVHUuH8eJWMF83vGQ79M2OC6kuw==
X-Google-Smtp-Source: AGHT+IH3RxJXLTcyEizL1+L5pmDxuPiSPmo6vZ8LpY/TlcuXUHnwSP+r2lTBIJ/RPVDH8JobrnhiHg==
X-Received: by 2002:a05:651c:400b:b0:302:2baf:6d14 with SMTP id 38308e7fff4ca-304685f0594mr117707441fa.40.1736241307797;
        Tue, 07 Jan 2025 01:15:07 -0800 (PST)
Message-ID: <531848d5-4ee3-45ea-9ef1-e7ed9a1eabab@gmail.com>
Date: Tue, 7 Jan 2025 10:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/perfc: Add perfc_defn.h to asm-generic
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
 <20250102192508.2405687-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250102192508.2405687-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/2/25 8:25 PM, Andrew Cooper wrote:
> ... and hook it up for RISC-V and PPC.
>
> On RISC-V at least, no combination of headers pulls in errno.h, so include it
> explicitly.
>
> Guard the hypercalls array declaration based on NR_hypercalls existing.  This
> is sufficient to get PERF_COUNTERS fully working on RISC-V and PPC, so drop
> the randconfig override.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

LKGTM:  Acked-by: Oleksii Kurohcko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>   automation/gitlab-ci/build.yaml      | 1 -
>   xen/arch/ppc/include/asm/Makefile    | 1 +
>   xen/arch/riscv/include/asm/Makefile  | 1 +
>   xen/common/perfc.c                   | 1 +
>   xen/include/asm-generic/perfc_defn.h | 5 +++++
>   xen/include/xen/perfc_defn.h         | 2 ++
>   6 files changed, 10 insertions(+), 1 deletion(-)
>   create mode 100644 xen/include/asm-generic/perfc_defn.h
>
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 1b884cc81cdb..41f17ed45641 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -734,7 +734,6 @@ debian-12-riscv64-gcc:
>         CONFIG_GRANT_TABLE=n
>         CONFIG_LIVEPATCH=n
>         CONFIG_MEM_ACCESS=n
> -      CONFIG_PERF_COUNTERS=n
>         CONFIG_QEMU_PLATFORM=y
>         CONFIG_XSM=n
>   
> diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
> index ced02e26ed13..c989a7f89b34 100644
> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -7,6 +7,7 @@ generic-y += hypercall.h
>   generic-y += iocap.h
>   generic-y += paging.h
>   generic-y += percpu.h
> +generic-y += perfc_defn.h
>   generic-y += random.h
>   generic-y += softirq.h
>   generic-y += vm_event.h
> diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
> index ced02e26ed13..c989a7f89b34 100644
> --- a/xen/arch/riscv/include/asm/Makefile
> +++ b/xen/arch/riscv/include/asm/Makefile
> @@ -7,6 +7,7 @@ generic-y += hypercall.h
>   generic-y += iocap.h
>   generic-y += paging.h
>   generic-y += percpu.h
> +generic-y += perfc_defn.h
>   generic-y += random.h
>   generic-y += softirq.h
>   generic-y += vm_event.h
> diff --git a/xen/common/perfc.c b/xen/common/perfc.c
> index ed4dba36f1bc..8c967ab900f9 100644
> --- a/xen/common/perfc.c
> +++ b/xen/common/perfc.c
> @@ -1,4 +1,5 @@
>   
> +#include <xen/errno.h>
>   #include <xen/lib.h>
>   #include <xen/smp.h>
>   #include <xen/time.h>
> diff --git a/xen/include/asm-generic/perfc_defn.h b/xen/include/asm-generic/perfc_defn.h
> new file mode 100644
> index 000000000000..8237636d83fb
> --- /dev/null
> +++ b/xen/include/asm-generic/perfc_defn.h
> @@ -0,0 +1,5 @@
> +/* This file is legitimately included multiple times. */
> +/* #ifndef ASM_GENERIC_PERFC_DEFN_H */
> +/* #define ASM_GENERIC_PERFC_DEFN_H */
> +
> +/* #endif ASM_GENERIC_PERFC_DEFN_H */
> diff --git a/xen/include/xen/perfc_defn.h b/xen/include/xen/perfc_defn.h
> index 0027d95a60bc..a987d80dd6f1 100644
> --- a/xen/include/xen/perfc_defn.h
> +++ b/xen/include/xen/perfc_defn.h
> @@ -4,7 +4,9 @@
>   
>   #include <asm/perfc_defn.h>
>   
> +#ifdef NR_hypercalls
>   PERFCOUNTER_ARRAY(hypercalls,           "hypercalls", NR_hypercalls)
> +#endif
>   
>   PERFCOUNTER(calls_from_multicall,       "calls from multicall")
>   

