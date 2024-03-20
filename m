Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B476D880DD3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:52:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695804.1085922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrgj-0003YH-P0; Wed, 20 Mar 2024 08:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695804.1085922; Wed, 20 Mar 2024 08:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrgj-0003W9-La; Wed, 20 Mar 2024 08:52:45 +0000
Received: by outflank-mailman (input) for mailman id 695804;
 Wed, 20 Mar 2024 08:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmrgj-000214-1K
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:52:45 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36909d9b-e697-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 09:52:43 +0100 (CET)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-42a0ba5098bso38070801cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 01:52:43 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 ey22-20020a05622a4c1600b00430b22f5735sm5858345qtb.78.2024.03.20.01.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 01:52:41 -0700 (PDT)
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
X-Inumbo-ID: 36909d9b-e697-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710924762; x=1711529562; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5WGmL1cHF0FTChTrEJdhA2rD3/SU2TArjtWLZvEb/ag=;
        b=ViloRNxFa0SZrBUKcbKOfEz5PinW2tnNDNZN0VVwKOpXfjVhcFPhRcP8oIy9XrhUDJ
         zsFmzOS7xRU+PwMR4QSTOyLFUl1BfrtgyjIIhPVUVXo89zf9MN7tCZcNPkyIz+4nyuKX
         nb0ko4ngCRXYjL1F42WDZ/8YaaPPEl8+Fmf/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710924762; x=1711529562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WGmL1cHF0FTChTrEJdhA2rD3/SU2TArjtWLZvEb/ag=;
        b=uENkafdqQA+2htJoltnK71IYCnw8Yiilk9MJfzY04l5L5oX/xkyDyg6qaFW5L98FHZ
         lUsCuDn4NNGs+mWX2ZLPokL3mIrn/TGB2F0EYvU5bxxkan7eMxwb8bekElZhvKVS5pG5
         XXqL58CvrlzeXismqqdWAujU2we2OS107R+zLX4YBvSfp3AtJg0O0LkTHMSLhvaSbl6J
         gejP9BljdNGGl+/aMUl0JLk5QVT9/EZtovcC3ENA/3C8AibkwkXle6lyiKZrYvFAWH6E
         Ym0V+OJmz1FolNkiavsRPhZOmCRKRRjWP4xyWTuqaOGtxaTRlPRVdIDsWlxBD8S6r7er
         a79Q==
X-Gm-Message-State: AOJu0YzR1has9ncRm2oeIEINVp9jPhx53eXa8uLygWVwO7mxIkfiahN+
	ZGIrHkcWWHdeLiZDxiHt8ueFfFKPyZhptfO9939M8KAxejDxnJJKYkp2a4SKAvo=
X-Google-Smtp-Source: AGHT+IFeYfU3bQvPW4z7n0HHKlmIUMpOJKh8isYEcR475d8shVlOA1SXXvCEf7iz7RlgB7js+PlJKA==
X-Received: by 2002:ac8:5789:0:b0:430:bd61:d5c with SMTP id v9-20020ac85789000000b00430bd610d5cmr4565848qta.34.1710924761834;
        Wed, 20 Mar 2024 01:52:41 -0700 (PDT)
Date: Wed, 20 Mar 2024 09:52:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/6] tools/hvmloader: Use cpu_policy to determine APIC IDs
Message-ID: <Zfqj17EfeDygzzEv@macbook>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-5-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240109153834.4192-5-alejandro.vallejo@cloud.com>

On Tue, Jan 09, 2024 at 03:38:32PM +0000, Alejandro Vallejo wrote:
> As part of topology correction efforts, APIC IDs can no longer be derived
> strictly through the vCPU ID alone. Bring in the machinery for policy
> retrieval and parsing in order to generate the proper MADT table and wake
> the appropriate CPUs.

I'm kind of unsure about this last part of the sentence, as I see no
waking of CPUs in hvmloader.  Is this referring to something else?

I'm kind of unsure about bringing the cpu_policy machinery to
hvmloader.  Won't it be simpler to just pass the array of APIC IDs in
hvm_info_table?  The current size of this struct is 48bytes, and an
array of 128 32bit integers would be an additional 512bytes.

AFAICT there's plenty of room in hvm_info_table, it's
positioned at 0x9f800, and there's unused space up to 0x9fc00, so 1024
bytes of memory we could use.

I know this doesn't give us much room for expansion if we want to bump
past 128 vCPUs, but a more appropriate solution IMO would be to move
ACPI table creation to the toolstack.

It's possible I'm missing some aspects, so if this has been considered
and rejected would be good to note in the commit message.

> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/firmware/hvmloader/Makefile    |  7 +++++++
>  tools/firmware/hvmloader/config.h    |  5 ++++-
>  tools/firmware/hvmloader/hvmloader.c |  6 ++++++
>  tools/firmware/hvmloader/util.c      |  3 ++-
>  tools/libacpi/build.c                | 27 +++++++++++++++++++++------
>  tools/libacpi/libacpi.h              |  5 ++++-
>  tools/libs/light/libxl_x86_acpi.c    | 21 +++++++++++++++++++--
>  7 files changed, 63 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
> index e5de1ade17..503ef2e219 100644
> --- a/tools/firmware/hvmloader/Makefile
> +++ b/tools/firmware/hvmloader/Makefile
> @@ -37,6 +37,13 @@ ifeq ($(debug),y)
>  OBJS += tests.o
>  endif
>  
> +CFLAGS += -I../../../xen/arch/x86/include/
> +
> +vpath cpuid.c ../../../xen/lib/x86/
> +OBJS += cpuid.o
> +vpath policy.c ../../../xen/lib/x86/
> +OBJS += policy.o
> +
>  CIRRUSVGA_DEBUG ?= n
>  
>  ROMBIOS_DIR := ../rombios
> diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
> index c82adf6dc5..3304b63cd8 100644
> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -3,10 +3,13 @@
>  
>  #include <stdint.h>
>  #include <stdbool.h>
> +#include <xen/lib/x86/cpu-policy.h>
>  
>  enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
>  extern enum virtual_vga virtual_vga;
>  
> +extern struct cpu_policy cpu_policy;
> +
>  extern unsigned long igd_opregion_pgbase;
>  #define IGD_OPREGION_PAGES 3
>  
> @@ -50,7 +53,7 @@ extern uint8_t ioapic_version;
>  #define IOAPIC_ID           0x01
>  
>  #define LAPIC_BASE_ADDRESS  0xfee00000
> -#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
> +#define LAPIC_ID(vcpu_id) x86_x2apic_id_from_vcpu_id(&cpu_policy, vcpu_id)
>  
>  #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
>  #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
> diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
> index c58841e5b5..8874165c66 100644
> --- a/tools/firmware/hvmloader/hvmloader.c
> +++ b/tools/firmware/hvmloader/hvmloader.c
> @@ -28,6 +28,7 @@
>  #include <acpi2_0.h>
>  #include <xen/version.h>
>  #include <xen/hvm/params.h>
> +#include <xen/lib/x86/cpu-policy.h>
>  #include <xen/arch-x86/hvm/start_info.h>
>  
>  const struct hvm_start_info *hvm_start_info;
> @@ -118,6 +119,9 @@ uint8_t ioapic_version;
>  
>  bool acpi_enabled;
>  
> +/* TODO: Remove after HVM ACPI building makes it to libxl */
> +struct cpu_policy cpu_policy;
> +
>  static void init_hypercalls(void)
>  {
>      uint32_t eax, ebx, ecx, edx;
> @@ -331,6 +335,8 @@ int main(void)
>      printf("HVM Loader\n");
>      BUG_ON(hvm_start_info->magic != XEN_HVM_START_MAGIC_VALUE);
>  
> +    x86_cpu_policy_fill_native(&cpu_policy);
> +
>      init_hypercalls();
>  
>      memory_map_setup();
> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
> index e82047d993..25a0245c5c 100644
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -30,6 +30,7 @@
>  #include <xen/sched.h>
>  #include <xen/hvm/hvm_xs_strings.h>
>  #include <xen/hvm/params.h>
> +#include <xen/lib/x86/cpu-policy.h>
>  
>  /*
>   * Check whether there exists overlap in the specified memory range.
> @@ -1041,7 +1042,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>      ctxt.mem_ops.free = acpi_mem_free;
>      ctxt.mem_ops.v2p = acpi_v2p;
>  
> -    acpi_build_tables(&ctxt, config);
> +    acpi_build_tables(&ctxt, config, &cpu_policy);
>  
>      hvm_param_set(HVM_PARAM_VM_GENERATION_ID_ADDR, config->vm_gid_addr);
>  }
> diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
> index 2f29863db1..ab05e54c96 100644
> --- a/tools/libacpi/build.c
> +++ b/tools/libacpi/build.c
> @@ -17,6 +17,7 @@
>  #include <xen/hvm/hvm_xs_strings.h>
>  #include <xen/hvm/params.h>
>  #include <xen/memory.h>
> +#include <xen/lib/x86/cpu-policy.h>
>  
>  #define ACPI_MAX_SECONDARY_TABLES 16
>  
> @@ -65,7 +66,8 @@ static void set_checksum(
>  
>  static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
>                                             const struct acpi_config *config,
> -                                           struct acpi_info *info)
> +                                           struct acpi_info *info,
> +                                           const struct cpu_policy *policy)
>  {
>      struct acpi_20_madt           *madt;
>      struct acpi_20_madt_intsrcovr *intsrcovr;
> @@ -143,14 +145,25 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
>      info->madt_lapic0_addr = ctxt->mem_ops.v2p(ctxt, lapic);
>      for ( i = 0; i < hvminfo->nr_vcpus; i++ )
>      {
> +        uint32_t x2apic_id = x86_x2apic_id_from_vcpu_id(policy, i);
> +
>          memset(lapic, 0, sizeof(*lapic));
>          lapic->type    = ACPI_PROCESSOR_LOCAL_APIC;
>          lapic->length  = sizeof(*lapic);
>          /* Processor ID must match processor-object IDs in the DSDT. */
>          lapic->acpi_processor_id = i;
> -        lapic->apic_id = config->lapic_id(i);
> +        lapic->apic_id = x2apic_id;
>          lapic->flags = (test_bit(i, hvminfo->vcpu_online)
>                          ? ACPI_LOCAL_APIC_ENABLED : 0);
> +
> +        /*
> +         * Error-out if the x2APIC ID doesn't fit in the entry
> +         *
> +         * TODO: Use "x2apic" entries if biggest x2apic_id > 254

Nit: while it's true that we could fit bigger IDs by using x2apic
entries, there's a bit more to it.  Most OSes will refuse to use APIC
IDs >= 255 unless they have a way to target those CPUs as interrupt
destinations, either with interrupt remapping or with the extended
destination ID workaround [0].

[0] https://gitlab.com/xen-project/xen/-/issues/173

Thanks, Roger.

