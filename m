Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B17A03177
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865997.1277297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtmz-0005Gz-2T; Mon, 06 Jan 2025 20:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865997.1277297; Mon, 06 Jan 2025 20:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtmy-0005Dp-UG; Mon, 06 Jan 2025 20:33:28 +0000
Received: by outflank-mailman (input) for mailman id 865997;
 Mon, 06 Jan 2025 20:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/ZK=T6=ventanamicro.com=dbarboza@srs-se1.protection.inumbo.net>)
 id 1tUtmx-0005D2-Sm
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:33:27 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a653d06-cc6d-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 21:33:25 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-219f8263ae0so167477945ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 12:33:25 -0800 (PST)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9cde66sm296704655ad.145.2025.01.06.12.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 12:33:23 -0800 (PST)
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
X-Inumbo-ID: 7a653d06-cc6d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736195604; x=1736800404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRChKa/6ydnGwRW0eNjgRJAJvFNapuIamBmUVRUNy3A=;
        b=ee7djeOEkdNPwbwf3CcHXY7f7EqFFqFtrKBu9v6Rtq4HrqPrLI/hbSWbR4FsllwLR3
         POUku3QTqfcRmmSLfdkHjCvwui0Sn1DCkcB8GAiLZz4gLG3y/qFrRyzRs8Fnz7HbA4Pg
         Q0goFVS+IjZwPxvLdWlT/creXk3GpN32whNuc/zDH8wYCNqg3wWOVLCUogwg/rE0gPrZ
         TuekyeLcQjC4hUrPQI03IIqija77Y/qfMjUAOWWyYM1dV/U/goSJc9MCoLYeBDe6+Per
         13eUMTkK2+9NpzHLPMYvI7phyMfzLlidEn+rGSf6SbuHalWm7FMq+RTILitWRf9+505m
         O0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736195604; x=1736800404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRChKa/6ydnGwRW0eNjgRJAJvFNapuIamBmUVRUNy3A=;
        b=WcD7Mp+9dFRVnvvb6h97El65wVfpKpBDRemVB5/1/kxGLT4B6RZQjbe6fnSJCFZvNR
         g/UG52TXA1gcU+S8CZ3PveQt7A8X9lb9UMco78q9VEwC5k/pfzrZUFLwQPv8ne/MvETJ
         3GWkIRrGevbXY1i5/XQcV7fJYrX17CTrkDFT8d/5SLSWOnUWYFrbA3UrmR2Ts3mJRq8C
         /fyI3enCr4/AcFnM6AKEw7v/BsFpTwHc0JF+ZbzgWwh6xgf7pbe7jYibtZOZkH6+AnLz
         MW2eTY5cLBsZP3Vk3P1jv3/D0ssAXej0pIbEZt3w8Igh6z4V1UpBuZ/rtYblsqnHOYtI
         eGhA==
X-Forwarded-Encrypted: i=1; AJvYcCX4KrP3cWW2Y481CNjSFFBTY428B4SmkLr9BUrIznbJb3x703yE+QGF2KYSvLcY/OIdK8UdOBpjrSg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/4PPJpNASj4KyQ5dx9eIt6+KYVBz3BEAdoIVuNARE8sz4mCvE
	o9LxSou6Oy/DIO5homxKkt0/mLNBY6OwsKshckI1ac6W9THaEVZHG7D232paNno=
X-Gm-Gg: ASbGncv5XmwW4YUn4gvqxHDXD9pEQyEcooGthnQ4G68dSf+2AJOnd2fs5bR2uHEuA/W
	pKFJpUqLfXTF4uXv2JwZZCPHaiM8A0kXFiHQhLkfThvAl3SIcqnXUIyGJGopnghMsBj7Y2TXqFC
	c5HzZ4AggQ+PdSuAUr2ql4bQOMd/yhkZb+BqRtjOMZO5Bq5/I3BzbeJmWtTh9AFxhPE2g8qbaZk
	2ME0/L+//zmQtJAYM/jBrHCWDiCJtSmeUgqBVzpSeIPdS8nxIRDJNFD0rb9AZXE/s7QHBoswkMI
	92TJ3ywooZpSHYHjVPXup71fzSdo9IN8C3M=
X-Google-Smtp-Source: AGHT+IGIo280ucsBcngxguAyG9JQ9T3VFgxxJUPO1hVz/7EWXjloduoiThjDr/f0vbWxM4+ikOS8ZQ==
X-Received: by 2002:a17:903:2384:b0:216:5cbd:5449 with SMTP id d9443c01a7336-219e6e9e8c5mr891272455ad.13.1736195604239;
        Mon, 06 Jan 2025 12:33:24 -0800 (PST)
Message-ID: <bd8168fe-c774-4f75-8a94-1a67ec31e38d@ventanamicro.com>
Date: Mon, 6 Jan 2025 17:33:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/7] accel/hvf: Use CPU_FOREACH_HVF()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cameron Esfahani <dirty@apple.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Alexander Graf <agraf@csgraf.de>, Paul Durrant <paul@xen.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>, Anthony PERARD <anthony@xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, Zhao Liu
 <zhao1.liu@intel.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 David Woodhouse <dwmw2@infradead.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>
References: <20250106200258.37008-1-philmd@linaro.org>
 <20250106200258.37008-7-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250106200258.37008-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/6/25 5:02 PM, Philippe Mathieu-Daudé wrote:
> Only iterate over HVF vCPUs when running HVF specific code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/hvf_int.h  | 4 ++++
>   accel/hvf/hvf-accel-ops.c | 9 +++++----
>   target/arm/hvf/hvf.c      | 4 ++--
>   3 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
> index 42ae18433f0..3cf64faabd1 100644
> --- a/include/system/hvf_int.h
> +++ b/include/system/hvf_int.h
> @@ -11,6 +11,8 @@
>   #ifndef HVF_INT_H
>   #define HVF_INT_H
>   
> +#include "system/hw_accel.h"
> +
>   #ifdef __aarch64__
>   #include <Hypervisor/Hypervisor.h>
>   typedef hv_vcpu_t hvf_vcpuid;
> @@ -74,4 +76,6 @@ int hvf_put_registers(CPUState *);
>   int hvf_get_registers(CPUState *);
>   void hvf_kick_vcpu_thread(CPUState *cpu);
>   
> +#define CPU_FOREACH_HVF(cpu) CPU_FOREACH_HWACCEL(cpu)


Cosmetic comment: given that this is HVF specific code and we only support one hw
accelerator at a time, I'd skip this alias and use CPU_FOREACH_HWACCEL(cpu) directly.
It would make it easier when grepping to see where and how the macro is being used.
Same thing in the next patch with CPU_FOREACH_KVM().


LGTM otherwise. Thanks,

Daniel


> +
>   #endif
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index 945ba720513..bbbe2f8d45b 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -504,7 +504,7 @@ static int hvf_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len)
>           }
>       }
>   
> -    CPU_FOREACH(cpu) {
> +    CPU_FOREACH_HVF(cpu) {
>           err = hvf_update_guest_debug(cpu);
>           if (err) {
>               return err;
> @@ -543,7 +543,7 @@ static int hvf_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len)
>           }
>       }
>   
> -    CPU_FOREACH(cpu) {
> +    CPU_FOREACH_HVF(cpu) {
>           err = hvf_update_guest_debug(cpu);
>           if (err) {
>               return err;
> @@ -560,7 +560,7 @@ static void hvf_remove_all_breakpoints(CPUState *cpu)
>       QTAILQ_FOREACH_SAFE(bp, &hvf_state->hvf_sw_breakpoints, entry, next) {
>           if (hvf_arch_remove_sw_breakpoint(cpu, bp) != 0) {
>               /* Try harder to find a CPU that currently sees the breakpoint. */
> -            CPU_FOREACH(tmpcpu)
> +            CPU_FOREACH_HVF(tmpcpu)
>               {
>                   if (hvf_arch_remove_sw_breakpoint(tmpcpu, bp) == 0) {
>                       break;
> @@ -572,7 +572,7 @@ static void hvf_remove_all_breakpoints(CPUState *cpu)
>       }
>       hvf_arch_remove_all_hw_breakpoints();
>   
> -    CPU_FOREACH(cpu) {
> +    CPU_FOREACH_HVF(cpu) {
>           hvf_update_guest_debug(cpu);
>       }
>   }
> @@ -581,6 +581,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
>   {
>       AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
>   
> +    ops->get_cpus_queue = hw_accel_get_cpus_queue;
>       ops->create_vcpu_thread = hvf_start_vcpu_thread;
>       ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
>   
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 0afd96018e0..13400ff0d5f 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2269,10 +2269,10 @@ static void hvf_arch_set_traps(void)
>   
>       /* Check whether guest debugging is enabled for at least one vCPU; if it
>        * is, enable exiting the guest on all vCPUs */
> -    CPU_FOREACH(cpu) {
> +    CPU_FOREACH_HVF(cpu) {
>           should_enable_traps |= cpu->accel->guest_debug_enabled;
>       }
> -    CPU_FOREACH(cpu) {
> +    CPU_FOREACH_HVF(cpu) {
>           /* Set whether debug exceptions exit the guest */
>           r = hv_vcpu_set_trap_debug_exceptions(cpu->accel->fd,
>                                                 should_enable_traps);


