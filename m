Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F07CAFA82
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 11:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181377.1504433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSv3t-0001Ky-Ct; Tue, 09 Dec 2025 10:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181377.1504433; Tue, 09 Dec 2025 10:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSv3t-0001Iy-9c; Tue, 09 Dec 2025 10:35:17 +0000
Received: by outflank-mailman (input) for mailman id 1181377;
 Tue, 09 Dec 2025 10:35:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCN0=6P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vSv3s-0001Iq-4Q
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 10:35:16 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beb27878-d4ea-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 11:35:13 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso241485866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 02:35:13 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7a715226b7sm65136666b.22.2025.12.09.02.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 02:35:12 -0800 (PST)
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
X-Inumbo-ID: beb27878-d4ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765276513; x=1765881313; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0uTBvp5iofLJ4mTT/eO/PplH7c9whmufIsWu+E31pI=;
        b=dfPO5e+9jRZyIMGwWz5j6gk3vHcVdGmMuGUSOjt0swv4b88y/XLSsSKY4NQg58+TPd
         joKUu1Z4NLEGyYzLAYATSjk5GKVLarqm/VMczO6V3xAIq8/XK75yFUlaUdy0zbWeCZd3
         FVWR9ijfh8cPfZeS+GOg94xpHPqvHeB5bPokXxlnUleyS3ViJjLYYdMVy398sDq6pDEf
         s7bNxUYo+XcXxjBD0Vtx8Raf1DGw3zgRl8NTFsEeHFZU7cmJi7efXv9hXyGtzlBSAc0Z
         sEYkOgLoP++zZGfA7JzZ8lPegCf2BAbgtgPBdhJtrXoNHsVwXRkKLDkQ7biRpIfm2Bea
         Rw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765276513; x=1765881313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0uTBvp5iofLJ4mTT/eO/PplH7c9whmufIsWu+E31pI=;
        b=fpn/rmC2I0bRtp3n4HjzZ6hhG6xytGzRXLWxdl7i9x2OG+3Qdx4sdM/21WjePhtRvx
         8msr+5EkMYDcuJrWmnXyCJciKa/u5s5z60sCTmPanX79ov9W2y3GojszP48XuggpmLFB
         WEsjqWRNEQP+tbNWC0KrVfP+24XOaBbZ3nn/tt85ntjJgobZJ325eRUHzKDBs24BtLrC
         axsqUQtMIIWVTW6QB+qNod299zZjeJJN1TR3daRSnxx3StUUdOnvDD1+baakwtL0ibaV
         jW30oHPaxtPmS4viAw94soFSY4LPhvKngQtgAhfrUEPl3u1jgEXckZia3nDmp5vrLECe
         3YVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbivnlV66yfEM1V4n/z3i9PFJk0/TiYpA4xYJjjBGhSFZAgX39DJqr1bjunCs9fdcR8BHuQFztvF0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHhcybFTHY4zF44tNRglPn0RF/YhjNzd4Gbd7v14WJCtYts6a+
	Umvhw0RoEBwpqovq0i5LOnIMfRz7N2WwzstWUrfpH2ZX5QK26vgnTtc2
X-Gm-Gg: ASbGncs1lotBJyPwHj1s5u1PFbdiDVr+cyLnFPtFo0alsdH0Yxo/IgmMnTKiT+JhkXN
	/RuxkZZ08Tl1mz4EhwJo9bGe9IoFyQfRuGbvOxfZwM2U+1fO6eb8AwsUtvxlOdmczDSCalAIY7s
	vtOeZ1YWmHOZggt9jnsousBKf75d9YjACNmTScqGhx1c0kgE4noiFzMJksCwkg7FZIMceMiBted
	tn2ULSUIWhiu0mWcWM5Kk4scxcZrB45I0NZPQGLT/AtaPVRsJZiwkv7TauW0vbtKe2RJ5TOqKzP
	2ZghmuqZt3vFhOfMAU6jHS77V+3Rpv98B1VV65NAXqn0yh/+qZOTDLsdCK3hhPSwE+WZ+bm/zDO
	ZZjZ6HZYARLs4JTU2UEkBnhIEz6Cm9kB9K5f9sB80LoeeTnrE61VHYJSmjP7OcnsTSDkplFd9jd
	OmnaEJcLzv2EyMG7zFjSQEDbJ9R6nKvIvE1fa5pjFWdXM54Cd8f/afibi5hH/l
X-Google-Smtp-Source: AGHT+IESBsqGXppEJVKGdSNZn8in3p2o1DnKsqNZD1qYdGv4XG6Tbrb43X7EzM50O/Gsh2yZp+VwDQ==
X-Received: by 2002:a17:907:8694:b0:b72:ad95:c1c2 with SMTP id a640c23a62f3a-b7a242d00c9mr1181779366b.11.1765276512817;
        Tue, 09 Dec 2025 02:35:12 -0800 (PST)
Message-ID: <369f14b0-8ed9-43ef-b5eb-7f5df9e2c642@gmail.com>
Date: Tue, 9 Dec 2025 11:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/19] xen/riscv: introduce VMID allocation and
 manegement
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <7805662d530eca29c5b0d0afa05a3cd0aac963bb.1763986955.git.oleksii.kurochko@gmail.com>
 <dc12d791-c76e-499c-9731-0163c95203da@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <dc12d791-c76e-499c-9731-0163c95203da@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/8/25 5:31 PM, Jan Beulich wrote:
> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -3096,3 +3096,12 @@ the hypervisor was compiled with `CONFIG_XSM` enabled.
>>   * `silo`: this will deny any unmediated communication channels between
>>     unprivileged VMs.  To choose this, the separated option in kconfig must also
>>     be enabled.
>> +
>> +### vmid (RISC-V)
>> +> `= <boolean>`
>> +
>> +> Default: `true`
>> +
>> +Permit Xen to use Virtual Machine Identifiers. This is an optimisation which
>> +tags the TLB entries with an ID per vcpu. This allows for guest TLB flushes
>> +to be performed without the overhead of a complete TLB flush.
> Please obey to the alphabetic sorting within this file.

Do we have a definition of alphabetical order? In xen-command-line.pandoc there is
`### vm-notify-window (Intel)`, and I would expect `### vmid` to appear before it.
Am I right? So the ordering should be: letters first, then numbers, then special
characters?

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/vmid.c
>> @@ -0,0 +1,170 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/domain.h>
>> +#include <xen/init.h>
>> +#include <xen/sections.h>
>> +#include <xen/lib.h>
>> +#include <xen/param.h>
>> +#include <xen/percpu.h>
>> +
>> +#include <asm/atomic.h>
>> +#include <asm/csr.h>
>> +#include <asm/flushtlb.h>
>> +#include <asm/p2m.h>
>> +
>> +/* Xen command-line option to enable VMIDs */
>> +static bool __ro_after_init opt_vmid = true;
>> +boolean_param("vmid", opt_vmid);
>> +
>> +/*
>> + * VMIDs partition the physical TLB. In the current implementation VMIDs are
>> + * introduced to reduce the number of TLB flushes. Each time a guest-physical
>> + * address space changes, instead of flushing the TLB, a new VMID is
>> + * assigned. This reduces the number of TLB flushes to at most 1/#VMIDs.
>> + * The biggest advantage is that hot parts of the hypervisor's code and data
>> + * retain in the TLB.
>> + *
>> + * Sketch of the Implementation:
>> + *
>> + * VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
>> + * VMIDs are assigned in a round-robin scheme. To minimize the overhead of
>> + * VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
>> + * 64-bit generation. Only on a generation overflow the code needs to
>> + * invalidate all VMID information stored at the VCPUs with are run on the
>> + * specific physical processor. When this overflow appears VMID usage is
>> + * disabled to retain correctness.
>> + */
>> +
>> +/* Per-Hart VMID management. */
>> +struct vmid_data {
>> +   uint64_t generation;
>> +   uint16_t next_vmid;
>> +   uint16_t max_vmid;
>> +   bool used;
>> +};
>> +
>> +static DEFINE_PER_CPU(struct vmid_data, vmid_data);
>> +
>> +static unsigned int vmidlen_detect(void)
>> +{
>> +    unsigned int vmid_bits;
>> +    unsigned char gstage_mode = get_max_supported_mode();
>> +
>> +    /*
>> +     * According to the RISC-V Privileged Architecture Spec:
>> +     *   When MODE=Bare, guest physical addresses are equal to supervisor
>> +     *   physical addresses, and there is no further memory protection
>> +     *   for a guest virtual machine beyond the physical memory protection
>> +     *   scheme described in Section "Physical Memory Protection".
>> +     *   In this case, the remaining fields in hgatp must be set to zeros.
>> +     * Thereby it is necessary to set gstage_mode not equal to Bare.
>> +     */
>> +    ASSERT(gstage_mode != HGATP_MODE_OFF);
>> +    csr_write(CSR_HGATP,
>> +              MASK_INSR(gstage_mode, HGATP_MODE_MASK) | HGATP_VMID_MASK);
>> +    vmid_bits = MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
>> +    vmid_bits = flsl(vmid_bits);
>> +    csr_write(CSR_HGATP, _AC(0, UL));
>> +
>> +    /* local_hfence_gvma_all() will be called at the end of pre_gstage_init. */
>> +
>> +    return vmid_bits;
>> +}
>> +
>> +void vmid_init(void)
> With the presently sole caller being __init, this (and likely the helper above)
> could be __init. Iirc you intend to also call this as secondary harts come up,
> so this may be okay. But then it wants justifing in the description.

I will add the comment aobve vmidlen_detect():
/*
  * vmidlen_detect() is expected to be called during secondary hart bring-up,
  * so it should not be marked as __init.
  */

And the similar comment for vmid_init().

Thanks.

~ Oleksii


