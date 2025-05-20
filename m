Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500EABD9E2
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 15:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990750.1374668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNJR-0005gc-K4; Tue, 20 May 2025 13:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990750.1374668; Tue, 20 May 2025 13:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNJR-0005f6-Gn; Tue, 20 May 2025 13:47:21 +0000
Received: by outflank-mailman (input) for mailman id 990750;
 Tue, 20 May 2025 13:47:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHNJQ-0005f0-6N
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 13:47:20 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f297f1b0-3580-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 15:47:19 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-601fb2b7884so2955341a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 06:47:19 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae48253sm7238783a12.81.2025.05.20.06.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 06:47:18 -0700 (PDT)
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
X-Inumbo-ID: f297f1b0-3580-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747748838; x=1748353638; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECeqPWjJfUNJ+dzTBt4oHwmwtG3jXAcMU1nC8SCG4YA=;
        b=caKexp7atJBhKzK4hP09saFksxm9d9wRMzp75O7KJfR5VFS4Y6tGkPBKde6OFqtinF
         wxc8gVWCAYkAKTiZYZLU99TgKjIA3LtyuVsN2BSU9Ne40Y/Yn6Ii/ZXLgpYmk6qczO3l
         fMkVQC7pY8jm6YW3dfwq1FZlubxeojnkptZYlEbMwUhXpVkPOsxqfJNNi5xwP9llqcU0
         kSLLnpgpnFf4Eok51vH3e2pRHWknZO4J57a7TioN1xva3gj9OZYGF4u+l7wnBUSSrKQ9
         lPMnKYiRehyaGr8OJR121reFM+hjcoP8tw+VTkFqjUpwtP6Vrrtwc0uHqFd9Spu21z7J
         GHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748838; x=1748353638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECeqPWjJfUNJ+dzTBt4oHwmwtG3jXAcMU1nC8SCG4YA=;
        b=T+a6yZhw+xQzcxQ3Xrte97r5clNSgF6qQROOaFSLQrJnfIvE8QwZYSWxWBgXDKFbT7
         rkdtzjNwSm1ce3Q3mOSVpGrQYLMUgBvbUbz1lFyX9fNU7JVcELjPqAHzaoxg+qx93Dr8
         14ClmHidiXEkqtTpYJxL5a7eUDYhCly5kgyEkOvWfzyTP7/BWNagpZagKEDTtH633HQG
         L99PR5dM7RCfuc6ueB8DIKp5BzgSQAKiN/eAyRYL2hokoi7WFr2/FiBv3ScNckX6Qf3t
         4ZKLPehwUgcfVaqcaGRfCcdbSLfCJdHTuBvDQrsoF2awEsReHpYnFkWJEJIef7j9UITN
         z6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVgxT/uk+ms8TUlRV7KyRRKwwoiijyRNI60ZYmWvWA4UW0n0XqqKw0H4yxXwQWBjm4i1OyBWaNOsKM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzT8XoM4d3/YOJ6hg9qtl+Wcc3I97JBuSEnwkQvAsYEPMGb6fI1
	iDLX4ArciAzfIvJvoGd8u70udMQKdnIYnmvAPiqDTaPrSSF5jHARaR6PUOPNN5TByA==
X-Gm-Gg: ASbGncsHjwM228hKiUynjO5/w2PedKyYiQlD+3s9VG5sba46m1C3LnonCyHp+KKzm4v
	a53a2TdZFPGygGzduRStmy+OMuD/GYAlKwzbHXKea4UBQ06qkeuDRUDL4jJHkTP7ngeFK7u95n0
	LOnVaMsvaWEmSChdc6L8youx3En5saCQRpoqIidSz6E4YidnK2esO62zDnktFYe9w3urFXyjRlX
	YLoNAcFdVLl/WDSQ6mnHmwtBUgGbeUWD03WtvV6AzlUnYE2FTCaMkjHHDfwKYiAm/0XynNiy7An
	qsaIeEe8Z1Y2D31Cq4H7Mv0BEgWT92gzv6GRUdNR4T+M9g/nxASxNRJaJm7we47Q3T+GxzFb
X-Google-Smtp-Source: AGHT+IF1tMWE69pR4HDYLFu4ssmj1q/sPGmjeDoCENklLfhSFlMLQK14BCXxkYVlINiWhfgMvCRWLg==
X-Received: by 2002:a05:6402:d0e:b0:5fa:a42f:70ee with SMTP id 4fb4d7f45d1cf-6010aa99504mr13720867a12.0.1747748838501;
        Tue, 20 May 2025 06:47:18 -0700 (PDT)
Message-ID: <34f5806f-d6c7-46cd-8450-fe578df54648@suse.com>
Date: Tue, 20 May 2025 15:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m
 initialization
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
 <70186bd9-20b6-48a2-9dd0-25cdc30e81f0@citrix.com>
 <b7dc409e-d18c-40eb-bbdf-86ba43b5ce74@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b7dc409e-d18c-40eb-bbdf-86ba43b5ce74@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.05.2025 11:24, Oleksii Kurochko wrote:
> On 5/9/25 6:14 PM, Andrew Cooper wrote:
>> On 09/05/2025 4:57 pm, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -0,0 +1,168 @@
>>> +#include <xen/domain_page.h>
>>> +#include <xen/iommu.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/mm.h>
>>> +#include <xen/pfn.h>
>>> +#include <xen/rwlock.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/spinlock.h>
>>> +
>>> +#include <asm/page.h>
>>> +#include <asm/p2m.h>
>>> +
>>> +/*
>>> + * Force a synchronous P2M TLB flush.
>>> + *
>>> + * Must be called with the p2m lock held.
>>> + *
>>> + * TODO: add support of flushing TLB connected to VMID.
>>> + */
>>> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>>> +{
>>> +    ASSERT(p2m_is_write_locked(p2m));
>>> +
>>> +    /*
>>> +     * TODO: shouldn't be this flush done for each physical CPU?
>>> +     *       If yes, then SBI call sbi_remote_hfence_gvma() could
>>> +     *       be used for that.
>>> +     */
>>> +#if defined(__riscv_hh) || defined(__riscv_h)
>>> +    asm volatile ( "hfence.gvma" ::: "memory" );
>>> +#else
>>> +    asm volatile ( ".insn r 0x73, 0x0, 0x31, x0, x0, x0" ::: "memory" );
>>> +#endif
>> TLB flushing needs to happen for each pCPU which potentially has cached
>> a mapping.
>>
>> In other arches, this is tracked by d->dirty_cpumask which is the bitmap
>> of pCPUs where this domain is scheduled.
> 
> I could only find usage of|d->dirty_cpumask| in x86 and common code (grant
> tables) for flushing the TLB. However, it seems that|d->dirty_cpumask| is
> not set anywhere for ARM. Is it sufficient to set a bit in|d->dirty_cpumask|
> in|startup_cpu_idle_loop()|?

No, how would the idle loop be relevant here? The bit needs setting for any
pCPU a vCPU of the domain is running on, i.e. somewhere in context switch
code.

> In addition, it’s also necessary to set and clear bits in|d->dirty_cpumask|
> during|context_switch|, correct? Set it before switching from the previous
> domain, and clear it after switching to the new domain?
> 
> Also, when a bit is set in|d->dirty_cpumask|, the|v->processor| value is also
> stored in|v->dirty_cpu|. Is this needed to track which processor is
> currently being used for the vCPU?
> 
>> CPUs need to flush their TLBs before removing themselves from
>> d->dirty_cpumask, which is typically done during context switch, but it
>> means that to flush the P2M, you only need to IPI a subset of CPUs.
> 
> I can't find where the P2M flush happens for x86/ARM. Could you please point me
> to where it is handled?

Grep for ept_sync_domain, which will give you several involved functions
(for the Intel, i.e. EPT case).

> Also, I found guest_flush_tlb_mask() for x86. I assume that it is x86 specific
> and generally it is enough to have only flush_tlb_mask(), right?

Yes, that's an x86-specific helper which you may or may not want a
counterpart of.

Jan

