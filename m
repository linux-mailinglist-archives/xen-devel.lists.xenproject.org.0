Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349CC32EFFA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 17:25:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93880.177327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDG7-0003LX-HP; Fri, 05 Mar 2021 16:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93880.177327; Fri, 05 Mar 2021 16:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDG7-0003L9-D6; Fri, 05 Mar 2021 16:24:59 +0000
Received: by outflank-mailman (input) for mailman id 93880;
 Fri, 05 Mar 2021 16:24:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AbCD=ID=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lIDG5-0003L4-PN
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:24:57 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7ea0c497-7950-46e9-a1a0-7b16d62c25e9;
 Fri, 05 Mar 2021 16:24:56 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-xgHIlVA7Nke9YTXo2SF8IQ-1; Fri, 05 Mar 2021 11:24:54 -0500
Received: by mail-wr1-f70.google.com with SMTP id z17so1260876wrv.23
 for <xen-devel@lists.xenproject.org>; Fri, 05 Mar 2021 08:24:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z1sm5226754wru.95.2021.03.05.08.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 08:24:52 -0800 (PST)
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
X-Inumbo-ID: 7ea0c497-7950-46e9-a1a0-7b16d62c25e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614961496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZDLO6AgAwZqZSFXjooFMmkuOmLvh4T78MBb11ItBM0=;
	b=fTlv0sdqCigpxZwb8FewDIc73RlAoMJ9MMR8grN6RLPFkywdIxRBVmHPkHglHWH3zefou1
	bBUSAx6Ybb4bkQD2w7qKjNSGJHrDrhSX2HxVe1wXIEBLsz/rhjPc8teu/EGs9tKBPhftf+
	nJtkQ5FOqS8E+O44K0XVNdnEcKD/b+M=
X-MC-Unique: xgHIlVA7Nke9YTXo2SF8IQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MZDLO6AgAwZqZSFXjooFMmkuOmLvh4T78MBb11ItBM0=;
        b=GwgLFfxf6PU9Vju01KdRP4TTsKtv17wwq3e3mcSyYp40UMnZMAbXg/HOZYIhvnna4e
         aLdhdvQvPxEQ/O3n8JOsQkSBXr4B/2fmBUcUUB+M6xjybyseuo7oK4XA7PNj7IDyrhdQ
         Cb0y5GKu98lqqzZo/j7V24riWbmn5YalEiuiFjBICoGlPXXih/OkwfeVXJl7gtUneaOr
         xHdsgQE1P/rQA9XOdEVVmPMlgEwChIqcvbCjsZyKSrmuKhlApnu0oIBs7vN4vJaR2qZg
         3+Fb+vnPnkugh2qkTxSwiRGMjFZcLaLiInc+zRPWiyRodUlFOyS/HuWnFxklzxiaJibA
         iMPg==
X-Gm-Message-State: AOAM533kEK6n4Kjycp+QCoAGunUaFxQCLY2k9guXHjVG4JfITPC/fPi9
	kBJX2zxaGpyq0tQCG22jEzHHYsA8fSX8F9pNz4VQzaDhJGdGtEcGMvXjlFGS0ko8RzFm/tNV+Sd
	dHBw5sgUSoIpa3P9nnvzIRXyVMxCeDrcmxrLgqTyuqJ6+gjpzanR0sFBmZKO+qluJ/k6IeLEDff
	Ef
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr10163653wrt.133.1614961492982;
        Fri, 05 Mar 2021 08:24:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhaGfuSDgbUvCEoNwU9vU3X+dGsovOI0z8QXVKWhHunJudgLUqDc6ePSfoV5mliOuqBAdvFg==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr10163616wrt.133.1614961492677;
        Fri, 05 Mar 2021 08:24:52 -0800 (PST)
Subject: Re: [RFC v4 30/33] target/arm: remove broad "else" statements when
 checking accels
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210305145941.32020-1-cfontana@suse.de>
 <20210305145941.32020-31-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <36e4893f-8eeb-9e16-5d1f-4167d5dc0e7d@redhat.com>
Date: Fri, 5 Mar 2021 17:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305145941.32020-31-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Cc'ing Xen list

On 3/5/21 3:59 PM, Claudio Fontana wrote:
> There might be more than just KVM and TCG in the future,
> so where appropriate, replace broad "else" statements
> with the appropriate if (accel_enabled()) check.
> 
> Also invert some checks for !kvm_enabled() or !tcg_enabled()
> where it seems appropriate to do so.
> 
> Note that to make qtest happy we need to perform gpio
> initialization in the qtest_enabled() case as well.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu.c     | 10 ++++++----
>  target/arm/cpu64.c   | 13 +++++++++----
>  target/arm/machine.c | 19 ++++++-------------
>  3 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index be86bd4b8b..353cd652bc 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -37,6 +37,7 @@
>  #endif
>  
>  #include "sysemu/tcg.h"
> +#include "sysemu/qtest.h"
>  #include "kvm/kvm_arm.h"
>  #include "disas/capstone.h"
>  #include "fpu/softfloat.h"
> @@ -564,7 +565,8 @@ static void arm_cpu_initfn(Object *obj)
>           * the same interface as non-KVM CPUs.
>           */
>          qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
> -    } else {
> +    }
> +    if (tcg_enabled() || qtest_enabled()) {
>          qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
>      }
>  
> @@ -741,14 +743,14 @@ void arm_cpu_post_init(Object *obj)
>          ? cpu_isar_feature(aa64_fp_simd, cpu)
>          : cpu_isar_feature(aa32_vfp, cpu)) {
>          cpu->has_vfp = true;
> -        if (!kvm_enabled()) {
> +        if (tcg_enabled()) {
>              qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
>          }
>      }
>  
>      if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
>          cpu->has_neon = true;
> -        if (!kvm_enabled()) {
> +        if (tcg_enabled()) {
>              qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
>          }
>      }
> @@ -849,7 +851,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>           * We have not registered the cpu properties when KVM
>           * is in use, so the user will not be able to set them.
>           */
> -        if (!kvm_enabled()) {
> +        if (tcg_enabled()) {
>              arm_cpu_pauth_finalize(cpu, &local_err);
>              if (local_err != NULL) {
>                  error_propagate(errp, local_err);
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 7c27b0febb..be3c1c6f36 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -23,6 +23,7 @@
>  #include "qemu/qemu-print.h"
>  #include "cpu.h"
>  #include "qemu/module.h"
> +#include "sysemu/tcg.h"
>  #include "sysemu/kvm.h"
>  #include "kvm/kvm_arm.h"
>  #include "qapi/visitor.h"
> @@ -296,7 +297,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>               */
>              bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
>              bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
> -        } else {
> +        }
> +        if (tcg_enabled()) {
>              /* Propagate enabled bits down through required powers-of-two. */
>              for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
>                  if (!test_bit(vq - 1, cpu->sve_vq_init)) {
> @@ -333,7 +335,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>                                    "vector length must be enabled.\n");
>                  return;
>              }
> -        } else {
> +        }
> +        if (tcg_enabled()) {
>              /* Disabling a power-of-two disables all larger lengths. */
>              if (test_bit(0, cpu->sve_vq_init)) {
>                  error_setg(errp, "cannot disable sve128");
> @@ -415,7 +418,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>              }
>              return;
>          }
> -    } else {
> +    }
> +    if (tcg_enabled()) {
>          /* Ensure all required powers-of-two are enabled. */
>          for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
>              if (!test_bit(vq - 1, cpu->sve_vq_map)) {
> @@ -609,7 +613,8 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> -    } else {
> +    }
> +    if (tcg_enabled()) {
>          uint64_t t;
>          uint32_t u;
>          aarch64_a57_initfn(obj);
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 595ab94237..cfc2bb4982 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -638,24 +638,21 @@ static int cpu_pre_save(void *opaque)
>  
>      if (tcg_enabled()) {
>          pmu_op_start(&cpu->env);
> +        if (!write_cpustate_to_list(cpu, false)) {
> +            /* This should never fail. */
> +            abort();
> +        }
>      }
> -
>      if (kvm_enabled()) {
>          if (!write_kvmstate_to_list(cpu)) {
>              /* This should never fail */
>              abort();
>          }
> -
>          /*
>           * kvm_arm_cpu_pre_save() must be called after
>           * write_kvmstate_to_list()
>           */
>          kvm_arm_cpu_pre_save(cpu);
> -    } else {
> -        if (!write_cpustate_to_list(cpu, false)) {
> -            /* This should never fail. */
> -            abort();
> -        }
>      }
>  
>      cpu->cpreg_vmstate_array_len = cpu->cpreg_array_len;
> @@ -754,20 +751,16 @@ static int cpu_post_load(void *opaque, int version_id)
>           */
>          write_list_to_cpustate(cpu);
>          kvm_arm_cpu_post_load(cpu);
> -    } else {
> +    }
> +    if (tcg_enabled()) {
>          if (!write_list_to_cpustate(cpu)) {
>              return -1;
>          }
> -    }
> -
> -    if (tcg_enabled()) {
>          hw_breakpoint_update_all(cpu);
>          hw_watchpoint_update_all(cpu);
> -
>          pmu_op_finish(&cpu->env);
>          arm_rebuild_hflags(&cpu->env);
>      }
> -
>      return 0;
>  }
>  
> 


