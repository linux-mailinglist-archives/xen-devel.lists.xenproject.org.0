Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9194BC30
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 13:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773907.1184335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1E2-000077-Hw; Thu, 08 Aug 2024 11:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773907.1184335; Thu, 08 Aug 2024 11:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1E2-00005b-F5; Thu, 08 Aug 2024 11:22:34 +0000
Received: by outflank-mailman (input) for mailman id 773907;
 Thu, 08 Aug 2024 11:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc1E1-00005U-ED
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 11:22:33 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81043b03-5578-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 13:22:32 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso72179766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 04:22:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0cae0sm726939466b.56.2024.08.08.04.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 04:22:31 -0700 (PDT)
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
X-Inumbo-ID: 81043b03-5578-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723116152; x=1723720952; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p8FHoDPkHcs4VHYTOWUZslUsd3E+KvGyOubSbSuJsXs=;
        b=WrFoYUwEh2gN3DQppbNJvtyhPr265hAfeVYpSZ/FxD3Hkw1OcICFzy6L//V3NWJwLT
         p73bt5p7p2PXYJKNwBVJP1KreCzkr5fzVgrnL0pvlDVmRV3M8eB9UNzOFgSFS2HEm/iO
         HmBtCV4RCf73oQjKh0hzamnkgmF5uHnpbJaQHOL+N/qPQAbVvqGF7+z8kIyoum/b0Z+3
         jH/2cckiKg0m/MM/+2snUbkDD/tCv7DNhdQjbNw0/f6foj5/S0KFTp6ZyKucK8W48G1Z
         kETORK3f7UFCOkRrA0HBWqydi8ztExW9QMPHyz3nFUky9zTHF+NlNzJUvmSORP3v/Rx7
         cJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723116152; x=1723720952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8FHoDPkHcs4VHYTOWUZslUsd3E+KvGyOubSbSuJsXs=;
        b=vQV/edXWlH9vtIcDjQ+v8216tw4svHdS2PJzrThSsIc/pImW7T6ym7n1ZwLY2tsx0o
         yHf9AjJ/wjyPebbJ59UBxWQ1/RMnG25uOHyN8BVSUklFi3S0X+wOyNnOiXtTICA62rql
         SF2X/YjRNPaeoT/4Roe/PQ/1NnzT1zfOqSsJdvijYqPF4ohcgow34xOyuJjW2Xr6IyWK
         V06GHGPYxzJY1ilrV+pQa07LMDyaoxKcEEfQy4qLZb+OWyig2+Rb+NaNIPU1xsZf9o/O
         Vcgn+JEV1WlMcCi1UVImvMY5OisBZMs9mo8l8+deRbCD45DZ9t8FnBPkxa53Xh9/gZn2
         pBFg==
X-Gm-Message-State: AOJu0Ywx2NP2aR16CTk7ARbmb4FqluSPqer0jVODyie/zAdiHZGp17Vi
	KQRxJdP3l+w8lHnhqXowTfeA7ky+pqaoUeI0pqWeeEMWV1Oi5szzkB7MYHCNCP0jOfkoOlhBT78
	=
X-Google-Smtp-Source: AGHT+IFmPlXbj4rZrGHlI/NBPvOm2s+ZNMp3BzJHTProh7JAm/dDwHLeKYmzj/RktjErBXpeU+Re2A==
X-Received: by 2002:a17:906:dc95:b0:a7c:4095:ccb6 with SMTP id a640c23a62f3a-a8090c7f43emr118676666b.16.1723116151465;
        Thu, 08 Aug 2024 04:22:31 -0700 (PDT)
Message-ID: <579fd84d-0a31-43b3-8ce1-f826134cd8a2@suse.com>
Date: Thu, 8 Aug 2024 13:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assertion failed at arch/x86/genapic/x2apic.c:38 on S3 resume
 nested in KVM on AMD
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <Zp--KHAFuDVnH1Oq@mail-itl>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <Zp--KHAFuDVnH1Oq@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2024 16:28, Marek Marczykowski-Górecki wrote:
> I'm observing a crash like the one below when trying to resume from S3.
> It happens on Xen nested in KVM (QEMU 9.0, Linux 6.9.3) but only on AMD.
> The very same software stack on Intel works just fine. QEMU is running
> with "-cpu host,+svm,+invtsc -machine q35,kernel-irqchip=split -device
> amd-iommu,intremap=on -smp 2" among others.
> 
>     (XEN) Preparing system for ACPI S3 state.
>     (XEN) Disabling non-boot CPUs ...
>     (XEN) Broke affinity for IRQ1, new: {0-1}
>     (XEN) Broke affinity for IRQ20, new: {0-1}
>     (XEN) Broke affinity for IRQ22, new: {0-1}
>     (XEN) Entering ACPI S3 state.
>     (XEN) Finishing wakeup from ACPI S3 state.
>     (XEN) Enabling non-boot CPUs  ...
>     (XEN) Assertion 'cpumask_test_cpu(this_cpu, per_cpu(cluster_cpus, this_cpu))' failed at arch/x86/genapic/x2apic.c:38
>     (XEN) ----[ Xen-4.20  x86_64  debug=y  Not tainted ]----
>     (XEN) CPU:    1
>     (XEN) RIP:    e008:[<ffff82d04028862b>] x2apic.c#init_apic_ldr_x2apic_cluster+0x8a/0x1b9
>     (XEN) RFLAGS: 0000000000010096   CONTEXT: hypervisor
>     (XEN) rax: ffff830278a25f50   rbx: 0000000000000001   rcx: ffff82d0405e1700
>     (XEN) rdx: 0000003233412000   rsi: ffff8302739da2d8   rdi: 0000000000000000
>     (XEN) rbp: 00000000000000c8   rsp: ffff8302739d7e78   r8:  0000000000000001
>     (XEN) r9:  ffff8302739d7fa0   r10: 0000000000000001   r11: 0000000000000000
>     (XEN) r12: 0000000000000001   r13: 0000000000000001   r14: 0000000000000000
>     (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000007506e0
>     (XEN) cr3: 000000007fa7a000   cr2: 0000000000000000
>     (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>     (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>     (XEN) Xen code around <ffff82d04028862b> (x2apic.c#init_apic_ldr_x2apic_cluster+0x8a/0x1b9):
>     (XEN)  cf 82 ff ff eb b7 0f 0b <0f> 0b 48 8d 05 9c fc 33 00 48 8b 0d a5 0a 35 00
>     (XEN) Xen stack trace from rsp=ffff8302739d7e78:
>     (XEN)    0000000000000000 00000000000000c8 0000000000000001 0000000000000001
>     (XEN)    0000000000000000 ffff82d0402f1d83 ffff8302739d7fff 00000000000000c8
>     (XEN)    0000000000000001 0000000000000001 ffff82d04031adb9 0000000000000001
>     (XEN)    0000000000000000 0000000000000000 0000000000000000 ffff82d040276677
>     (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>     (XEN)    ffff88810037c000 0000000000000001 0000000000000246 deadbeefdeadf00d
>     (XEN)    0000000000000001 aaaaaaaaaaaaaaaa 0000000000000000 ffffffff811d130a
>     (XEN)    deadbeefdeadf00d deadbeefdeadf00d deadbeefdeadf00d 0000010000000000
>     (XEN)    ffffffff811d130a 000000000000e033 0000000000000246 ffffc900400b3ef8
>     (XEN)    000000000000e02b 000000000000beef 000000000000beef 000000000000beef
>     (XEN)    000000000000beef 0000e01000000001 ffff8302739de000 0000003233412000
>     (XEN)    00000000007506e0 0000000000000000 0000000000000000 0000000200000000
>     (XEN)    0000000000000002
>     (XEN) Xen call trace:
>     (XEN)    [<ffff82d04028862b>] R x2apic.c#init_apic_ldr_x2apic_cluster+0x8a/0x1b9
>     (XEN)    [<ffff82d0402f1d83>] S setup_local_APIC+0x26/0x449
>     (XEN)    [<ffff82d04031adb9>] S start_secondary+0x1c4/0x37a
>     (XEN)    [<ffff82d040276677>] S __high_start+0x87/0xd0
>     (XEN) 
>     (XEN) 
>     (XEN) ****************************************
>     (XEN) Panic on CPU 1:
>     (XEN) Assertion 'cpumask_test_cpu(this_cpu, per_cpu(cluster_cpus, this_cpu))' failed at arch/x86/genapic/x2apic.c:38
>     (XEN) ****************************************

Would you mind giving the patch below a try?

Jan

x86/x2APIC: correct cluster tracking upon CPUs going down for S3

Downing CPUs for S3 is somewhat special: Since we can expect the system
to come back up in exactly the same hardware configuration, per-CPU data
for the secondary CPUs isn't de-allocated (and then cleared upon re-
allocation when the CPUs are being brought back up). Therefore the
cluster_cpus per-CPU pointer will retain its value for all CPUs other
than the final one in a cluster (i.e. in particular for all CPUs in the
same cluster as CPU0). That, however, is in conflict with the assertion
early in init_apic_ldr_x2apic_cluster().

Note that the issue is avoided on Intel hardware, where we park CPUs
instead of bringing them down.

Extend the bypassing of the freeing to the suspend case, thus making
suspend/resume also a tiny bit faster.

Fixes: 2e6c8f182c9c ("x86: distinguish CPU offlining from CPU removal")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -228,7 +228,8 @@ static int cf_check update_clusterinfo(
     case CPU_UP_CANCELED:
     case CPU_DEAD:
     case CPU_REMOVE:
-        if ( park_offline_cpus == (action != CPU_REMOVE) )
+        if ( park_offline_cpus == (action != CPU_REMOVE) ||
+             system_state == SYS_STATE_suspend )
             break;
         if ( per_cpu(cluster_cpus, cpu) )
         {



