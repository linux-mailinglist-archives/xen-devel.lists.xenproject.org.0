Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C1A49DC4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 16:43:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898896.1307342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to2Vc-0003Qm-Kq; Fri, 28 Feb 2025 15:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898896.1307342; Fri, 28 Feb 2025 15:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to2Vc-0003Nj-Ht; Fri, 28 Feb 2025 15:42:40 +0000
Received: by outflank-mailman (input) for mailman id 898896;
 Fri, 28 Feb 2025 15:42:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kAP=VT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1to2Vb-0003Nd-7A
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 15:42:39 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1ff1116-f5ea-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 16:42:38 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-abee50621ecso306044866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 07:42:36 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c7bbfe2sm309857566b.171.2025.02.28.07.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 07:42:34 -0800 (PST)
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
X-Inumbo-ID: a1ff1116-f5ea-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740757356; x=1741362156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pHoQn/ZiZim6ICooxOxcZ3hZCjwRmkItGvqu6LUErYk=;
        b=MbUGNzD+f+h7DIiirb5oi+4KPYReEKtUKjWYLhlzsVJHTRFeKJbDZcAaLhTIVt0ip0
         BTxLyoTCcDLoDX0jBeT0KOqreFcrhYGKCQhXDVDDLFT2qxg8OHQna0Xf+bf8hI8Mv1DC
         eUwugeycMR8Y4mzOqZ+YdN6PQDFhiO3Fcesieil6wqGHBxEnEoNm2ted5RUuPmpp/I4s
         1bi74e3KkyQAh2bMnO9JMufThBiiGaqCxhlu8U+qokNipkUfZu7DMDR5hHPr2CbcyVWt
         HUEyHCpOOHc/W8gWRUO9D/PR5mT7yJK9Wi/MHn0Sr8DzLPm9m7KgugMA4BiMGi99CYQv
         Rwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740757356; x=1741362156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHoQn/ZiZim6ICooxOxcZ3hZCjwRmkItGvqu6LUErYk=;
        b=Xn7bq65KOe3Sp+7r3MqVO0huZryANPayxxFef4sPZh1HZKigHZ2YYvWv5jq9Tlgfy/
         8SdOg/aRK0yePien1qfkyLF+4IXpetaOHC6TgIpXtwQUzUKVCrEDdJeMY1K+r+pfOw07
         RhFs1AL2MA2TXMc2OaUQDZtegfy0nLXEi5AVYUC+M9JDR3+BOPDwhelAgAVHT8hi1Nx0
         OncLE2R8N9z9H4PTVDNd+KB+AqPThJ0Dol6QonFuQpptZ213CYhik/7vcrQ0UhUJhgGd
         yOEVVeCzA1eTp27KouvT9LU1DdI8Hfnr/2hJ7lOupp5FIR982TTtDjQJsp3Yy2M3BO0z
         w7lQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/jFsvi/375li1hd+B9Umvz28V0rnbEe6kxRc+p/adDnC+gC+Ri8LYLuPKlQDL7zroZ2PbvjtCzis=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqqTz2tvAFk/Pf1mB8g03kq0axY5DBxwQFNUHtUxTGnnITSca1
	3W7HY7D9fjv4goCXVnbWa/ckJW+9RKLjJe2wTKXIGc7XH+l8Xm1K
X-Gm-Gg: ASbGnct7kUen5WdOIpXPIO7kfzruweUhJPsCyUbLvQ3nNS7QzUamcPIRS5VLLez7ilG
	FfcvgLUfFJmCk2gISxHSPv7bE8/jbWc27jeCJPYZynkxH6WiO+OFAJpTC9rneFpKjs3TYo5rCF4
	ghQB7X+LgwNhYN+d19jFSsobRTiIC0opWlAhQmRZBkQV+xV5Hwt2kvEZ8Vh6xMsz2EwadhhcKXQ
	rhUFrKInXHPDmykYHu/x+V28Nrb9+/S/XsRb9eKH3ODMtP+jm7raVCdLqrO2TZDab2c0RWreIHY
	Y74QUuNoncyHVeVrOdkbgodnQyXk9on1Ytk=
X-Google-Smtp-Source: AGHT+IEGc86XRMqc+riZYNmtccFwDLjwrEPNujBz0EWK6PbV4ywFt6eEJbV32X2DkYSHJYnmN+2pHQ==
X-Received: by 2002:a17:907:6d25:b0:abb:e6e1:22c1 with SMTP id a640c23a62f3a-abf2687d4d2mr382880766b.35.1740757355277;
        Fri, 28 Feb 2025 07:42:35 -0800 (PST)
Message-ID: <60c8ec42-57bc-4500-8881-d1233dcd97a8@gmail.com>
Date: Fri, 28 Feb 2025 16:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/dom0: attempt to fixup p2m page-faults for PVH
 dom0
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250218143504.77638-1-roger.pau@citrix.com>
 <20250218143504.77638-3-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250218143504.77638-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/18/25 3:35 PM, Roger Pau Monne wrote:
> When building a PVH dom0 Xen attempts to map all (relevant) MMIO regions
> into the p2m for dom0 access.  However the information Xen has about the
> host memory map is limited.  Xen doesn't have access to any resources
> described in ACPI dynamic tables, and hence the p2m mappings provided might
> not be complete.
>
> PV doesn't suffer from this issue because a PV dom0 is capable of mapping
> into it's page-tables any address not explicitly banned in d->iomem_caps.
>
> Introduce a new command line options that allows Xen to attempt to fixup
> the p2m page-faults, by creating p2m identity maps in response to p2m
> page-faults.
>
> This is aimed as a workaround to small ACPI regions Xen doesn't know about.
> Note that missing large MMIO regions mapped in this way will lead to
> slowness due to the VM exit processing, plus the mappings will always use
> small pages.
>
> The ultimate aim is to attempt to bring better parity with a classic PV
> dom0.
>
> Note such fixup rely on the CPU doing the access to the unpopulated
> address.  If the access is attempted from a device instead there's no
> possible way to fixup, as IOMMU page-fault are asynchronous.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Only slightly tested on my local PVH dom0 deployment.
> ---
> Changes since v1:
>   - Make the fixup function static.
>   - Print message in case mapping already exists.
> ---
>   CHANGELOG.md                           | 10 ++++

Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>   docs/misc/xen-command-line.pandoc      | 16 +++++-
>   xen/arch/x86/dom0_build.c              |  5 ++
>   xen/arch/x86/hvm/emulate.c             | 74 +++++++++++++++++++++++++-
>   xen/arch/x86/include/asm/hvm/emulate.h |  3 ++
>   5 files changed, 105 insertions(+), 3 deletions(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1de1d1eca17f..e5e6ab3a8902 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,6 +4,16 @@ Notable changes to Xen will be documented in this file.
>   
>   The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
> +## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +
> +### Changed
> +
> +### Added
> + - On x86:
> +   - Option to attempt to fixup p2m page-faults on PVH dom0.
> +
> +### Removed
> +
>   ## [4.20.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>   
>   ### Changed
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 9bbd00baef91..83bb69cfb852 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -822,7 +822,8 @@ Specify the bit width of the DMA heap.
>   
>   ### dom0
>       = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
> -                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
> +                cpuid-faulting=<bool>, msr-relaxed=<bool>,
> +                pf-fixup=<bool> ] (x86)
>   
>       = List of [ sve=<integer> ] (Arm64)
>   
> @@ -883,6 +884,19 @@ Controls for how dom0 is constructed on x86 systems.
>   
>       If using this option is necessary to fix an issue, please report a bug.
>   
> +*   The `pf-fixup` boolean is only applicable when using a PVH dom0 and
> +    defaults to false.
> +
> +    When running dom0 in PVH mode the dom0 kernel has no way to map MMIO
> +    regions into its physical memory map, such mode relies on Xen dom0 builder
> +    populating the physical memory map with all MMIO regions that dom0 should
> +    access.  However Xen doesn't have a complete picture of the host memory
> +    map, due to not being able to process ACPI dynamic tables.
> +
> +    The `pf-fixup` option allows Xen to attempt to add missing MMIO regions
> +    to the dom0 physical memory map in response to page-faults generated by
> +    dom0 trying to access unpopulated entries in the memory map.
> +
>   Enables features on dom0 on Arm systems.
>   
>   *   The `sve` integer parameter enables Arm SVE usage for Dom0 and sets the
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 2fe6b449149e..11c20b9ab0a4 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -16,6 +16,7 @@
>   #include <asm/dom0_build.h>
>   #include <asm/guest.h>
>   #include <asm/hpet.h>
> +#include <asm/hvm/emulate.h>
>   #include <asm/io-ports.h>
>   #include <asm/io_apic.h>
>   #include <asm/p2m.h>
> @@ -286,6 +287,10 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>           opt_dom0_cpuid_faulting = val;
>       else if ( (val = parse_boolean("msr-relaxed", s, e)) >= 0 )
>           opt_dom0_msr_relaxed = val;
> +#ifdef CONFIG_HVM
> +    else if ( (val = parse_boolean("pf-fixup", s, e)) >= 0 )
> +        opt_dom0_pf_fixup = val;
> +#endif
>       else
>           return -EINVAL;
>   
> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> index 08b9493e6d88..3cd7f2e22f26 100644
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -10,12 +10,15 @@
>    */
>   
>   #include <xen/init.h>
> +#include <xen/iocap.h>
>   #include <xen/ioreq.h>
>   #include <xen/lib.h>
>   #include <xen/sched.h>
>   #include <xen/paging.h>
>   #include <xen/trace.h>
>   #include <xen/vm_event.h>
> +
> +#include <asm/altp2m.h>
>   #include <asm/event.h>
>   #include <asm/i387.h>
>   #include <asm/xstate.h>
> @@ -161,6 +164,36 @@ void hvmemul_cancel(struct vcpu *v)
>       hvmemul_cache_disable(v);
>   }
>   
> +bool __ro_after_init opt_dom0_pf_fixup;
> +static int hwdom_fixup_p2m(paddr_t addr)
> +{
> +    unsigned long gfn = paddr_to_pfn(addr);
> +    struct domain *currd = current->domain;
> +    p2m_type_t type;
> +    mfn_t mfn;
> +    int rc;
> +
> +    ASSERT(is_hardware_domain(currd));
> +    ASSERT(!altp2m_active(currd));
> +
> +    /*
> +     * Fixups are only applied for MMIO holes, and rely on the hardware domain
> +     * having identity mappings for non RAM regions (gfn == mfn).
> +     */
> +    if ( !iomem_access_permitted(currd, gfn, gfn) ||
> +         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
> +        return -EPERM;
> +
> +    mfn = get_gfn(currd, gfn, &type);
> +    if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
> +        rc = mfn_eq(mfn, _mfn(gfn)) ? -EEXIST : -ENOTEMPTY;
> +    else
> +        rc = set_mmio_p2m_entry(currd, _gfn(gfn), _mfn(gfn), 0);
> +    put_gfn(currd, gfn);
> +
> +    return rc;
> +}
> +
>   static int hvmemul_do_io(
>       bool is_mmio, paddr_t addr, unsigned long *reps, unsigned int size,
>       uint8_t dir, bool df, bool data_is_addr, uintptr_t data)
> @@ -338,8 +371,45 @@ static int hvmemul_do_io(
>           if ( !s )
>           {
>               if ( is_mmio && is_hardware_domain(currd) )
> -                gdprintk(XENLOG_DEBUG, "unhandled memory %s %#lx size %u\n",
> -                         dir ? "read from" : "write to", addr, size);
> +            {
> +                /*
> +                 * PVH dom0 is likely missing MMIO mappings on the p2m, due to
> +                 * the incomplete information Xen has about the memory layout.
> +                 *
> +                 * Either print a message to note dom0 attempted to access an
> +                 * unpopulated GPA, or try to fixup the p2m by creating an
> +                 * identity mapping for the faulting GPA.
> +                 */
> +                if ( opt_dom0_pf_fixup )
> +                {
> +                    int inner_rc = hwdom_fixup_p2m(addr);
> +
> +                    if ( !inner_rc || inner_rc == -EEXIST )
> +                    {
> +                        if ( !inner_rc )
> +                            gdprintk(XENLOG_DEBUG,
> +                                     "fixup p2m mapping for page %lx added\n",
> +                                     paddr_to_pfn(addr));
> +                        else
> +                            gprintk(XENLOG_INFO,
> +                                    "fixup p2m mapping for page %lx already present\n",
> +                                    paddr_to_pfn(addr));
> +
> +                        rc = X86EMUL_RETRY;
> +                        vio->req.state = STATE_IOREQ_NONE;
> +                        break;
> +                    }
> +
> +                    gprintk(XENLOG_WARNING,
> +                            "unable to fixup memory %s %#lx size %u: %d\n",
> +                            dir ? "read from" : "write to", addr, size,
> +                            inner_rc);
> +                }
> +                else
> +                    gdprintk(XENLOG_DEBUG,
> +                             "unhandled memory %s %#lx size %u\n",
> +                             dir ? "read from" : "write to", addr, size);
> +            }
>               rc = hvm_process_io_intercept(&null_handler, &p);
>               vio->req.state = STATE_IOREQ_NONE;
>           }
> diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
> index 760ce5e77cce..d17c025a1d45 100644
> --- a/xen/arch/x86/include/asm/hvm/emulate.h
> +++ b/xen/arch/x86/include/asm/hvm/emulate.h
> @@ -148,6 +148,9 @@ static inline void hvmemul_write_cache(const struct vcpu *v, paddr_t gpa,
>   void hvm_dump_emulation_state(const char *loglvl, const char *prefix,
>                                 struct hvm_emulate_ctxt *hvmemul_ctxt, int rc);
>   
> +/* For PVH dom0: signal whether to attempt fixup of p2m page-faults. */
> +extern bool opt_dom0_pf_fixup;
> +
>   #endif /* __ASM_X86_HVM_EMULATE_H__ */
>   
>   /*

