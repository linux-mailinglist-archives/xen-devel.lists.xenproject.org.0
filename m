Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B38CD82F
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 18:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728731.1133768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAB4i-0005rl-Aj; Thu, 23 May 2024 16:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728731.1133768; Thu, 23 May 2024 16:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAB4i-0005pz-7b; Thu, 23 May 2024 16:13:52 +0000
Received: by outflank-mailman (input) for mailman id 728731;
 Thu, 23 May 2024 16:13:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sAB4g-0005pt-DP
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 16:13:50 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa70c37-191f-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 18:13:48 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e716e302bdso59321091fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 09:13:48 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100f598d7sm28915355e9.23.2024.05.23.09.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 09:13:46 -0700 (PDT)
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
X-Inumbo-ID: 6fa70c37-191f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716480827; x=1717085627; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNMl+c2aUThh6P7gC9FUhiHaLSy9TBrVGvb+cYGQxWc=;
        b=Usl45pg81WsqOnKEHVWXQU2mvc4qKTedpvqMJeAh3lAmxemxgjmUN55cGga7eXGOkI
         LZc60JWN2oEKAd/QGTy4ViV4qT0lb2AFkcgPBzRjRAdyTTJmnb3bjxp/3xdydqT4IX6v
         5XTstFMUWWnwHHZD6WxU27Eh1/hTUzERPv9dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716480827; x=1717085627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNMl+c2aUThh6P7gC9FUhiHaLSy9TBrVGvb+cYGQxWc=;
        b=TwjenH9elul3qKzp46vTIJ+tvm/f2fUf644xA40pY6bW577U3g6ZAzAMXH00Oxs/bs
         WzDc+2KkrMpmy150Nxe4VCymi1YcIDXVimg8U8rGnvf2pj36fS1XYdjRUnrVDkNgnH7T
         corLj1EVplwdr20l0T/SxRv2c6hxSEu6rRQikEmc1rzb6yAzjF3rPGbBA+XILB7P5ZuF
         r0iasVpuy6FDUDlosBd4WMJJRu/UPOgiUCRIAbB6gGdWCS9XS4GUDRpG3ilXz+3zlphi
         zLzTM2P3eRPVCBurgURH0W0iMUxGR52yA8PtNSoUGyajeFZ8liD/eDbOxo46a/rEmub3
         X/iA==
X-Gm-Message-State: AOJu0Yw2hSb8yUvpHnAVHyM7h3pyc+rEKA+FxtpmEob1f2KcTtJfsVh/
	QddUZI+CTE/Itx8nDZRyhgkoDWK0weM9TlvNEZ+q2qrGm2Z7l6dJcMM5Ywyz4So=
X-Google-Smtp-Source: AGHT+IFWO8EnZg4CmyGpDarYXZFCzXACW6e7USkMCprj1r6E9eXenEKjdKat3z1+BnmxOdEerGHfpA==
X-Received: by 2002:a2e:8e8c:0:b0:2e1:aa94:cf48 with SMTP id 38308e7fff4ca-2e9495a87famr33424921fa.20.1716480827345;
        Thu, 23 May 2024 09:13:47 -0700 (PDT)
Date: Thu, 23 May 2024 18:13:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH v2 5/8] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
Message-ID: <Zk9rOqooa3PJCyw1@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <b2d4109cd30c82e0af153d36f8dce77c59f03695.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b2d4109cd30c82e0af153d36f8dce77c59f03695.1715102098.git.alejandro.vallejo@cloud.com>

On Wed, May 08, 2024 at 01:39:24PM +0100, Alejandro Vallejo wrote:
> Make it so the APs expose their own APIC IDs in a LUT. We can use that LUT to
> populate the MADT, decoupling the algorithm that relates CPU IDs and APIC IDs
> from hvmloader.
> 
> While at this also remove ap_callin, as writing the APIC ID may serve the same
> purpose.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * New patch. Replaces adding cpu policy to hvmloader in v1.
> ---
>  tools/firmware/hvmloader/config.h    |  6 ++++-
>  tools/firmware/hvmloader/hvmloader.c |  4 +--
>  tools/firmware/hvmloader/smp.c       | 40 +++++++++++++++++++++++-----
>  tools/firmware/hvmloader/util.h      |  5 ++++
>  xen/arch/x86/include/asm/hvm/hvm.h   |  1 +
>  5 files changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
> index c82adf6dc508..edf6fa9c908c 100644
> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -4,6 +4,8 @@
>  #include <stdint.h>
>  #include <stdbool.h>
>  
> +#include <xen/hvm/hvm_info_table.h>
> +
>  enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
>  extern enum virtual_vga virtual_vga;
>  
> @@ -49,8 +51,10 @@ extern uint8_t ioapic_version;
>  
>  #define IOAPIC_ID           0x01
>  
> +extern uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
> +
>  #define LAPIC_BASE_ADDRESS  0xfee00000
> -#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
> +#define LAPIC_ID(vcpu_id)   (CPU_TO_X2APICID[(vcpu_id)])
>  
>  #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
>  #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
> diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
> index c58841e5b556..1eba92229925 100644
> --- a/tools/firmware/hvmloader/hvmloader.c
> +++ b/tools/firmware/hvmloader/hvmloader.c
> @@ -342,11 +342,11 @@ int main(void)
>  
>      printf("CPU speed is %u MHz\n", get_cpu_mhz());
>  
> +    smp_initialise();
> +
>      apic_setup();
>      pci_setup();
>  
> -    smp_initialise();
> -
>      perform_tests();
>  
>      if ( bios->bios_info_setup )
> diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
> index a668f15d7e1f..4d75f239c2f5 100644
> --- a/tools/firmware/hvmloader/smp.c
> +++ b/tools/firmware/hvmloader/smp.c
> @@ -29,7 +29,34 @@
>  
>  #include <xen/vcpu.h>
>  
> -static int ap_callin, ap_cpuid;
> +static int ap_cpuid;
> +
> +/**
> + * Lookup table of x2APIC IDs.
> + *
> + * Each entry is populated its respective CPU as they come online. This is required
> + * for generating the MADT with minimal assumptions about ID relationships.
> + */
> +uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
> +
> +static uint32_t read_apic_id(void)
> +{
> +    uint32_t apic_id;
> +
> +    cpuid(1, NULL, &apic_id, NULL, NULL);
> +    apic_id >>= 24;
> +
> +    /*
> +     * APIC IDs over 255 are represented by 255 in leaf 1 and are meant to be
> +     * read from topology leaves instead. Xen exposes x2APIC IDs in leaf 0xb,
> +     * but only if the x2APIC feature is present. If there are that many CPUs
> +     * it's guaranteed to be there so we can avoid checking for it specifically
> +     */

Maybe I'm missing something, but given the current code won't Xen just
return the low 8 bits from the x2APIC ID?  I don't see any code in
guest_cpuid() that adjusts the IDs to be 255 when > 255.

> +    if ( apic_id == 255 )
> +        cpuid(0xb, NULL, NULL, NULL, &apic_id);

Won't the correct logic be to check if x2APIC is set in CPUID, and
then fetch the APIC ID from leaf 0xb, otherwise fallback to fetching
the APID ID from leaf 1?

> +
> +    return apic_id;
> +}
>  
>  static void ap_start(void)
>  {
> @@ -37,12 +64,12 @@ static void ap_start(void)
>      cacheattr_init();
>      printf("done.\n");
>  
> +    wmb();
> +    ACCESS_ONCE(CPU_TO_X2APICID[ap_cpuid]) = read_apic_id();

A comment would be helpful here, that CPU_TO_X2APICID[ap_cpuid] is
used as synchronization that the AP has started.

You probably want to assert that read_apic_id() doesn't return 0,
otherwise we are skewed.

> +
>      if ( !ap_cpuid )
>          return;
>  
> -    wmb();
> -    ap_callin = 1;
> -
>      while ( 1 )
>          asm volatile ( "hlt" );
>  }
> @@ -86,10 +113,11 @@ static void boot_cpu(unsigned int cpu)
>          BUG();
>  
>      /*
> -     * Wait for the secondary processor to complete initialisation.
> +     * Wait for the secondary processor to complete initialisation,
> +     * which is signaled by its x2APIC ID being writted to the LUT.
>       * Do not touch shared resources meanwhile.
>       */
> -    while ( !ap_callin )
> +    while ( !ACCESS_ONCE(CPU_TO_X2APICID[cpu]) )
>          cpu_relax();

As a further improvement, we could launch all APs in pararell, and use
a for loop to wait until all positions of the CPU_TO_X2APICID array
are set.

>  
>      /* Take the secondary processor offline. */
> diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
> index 14078bde1e30..51e9003bc615 100644
> --- a/tools/firmware/hvmloader/util.h
> +++ b/tools/firmware/hvmloader/util.h
> @@ -23,6 +23,11 @@ enum {
>  #define __STR(...) #__VA_ARGS__
>  #define STR(...) __STR(__VA_ARGS__)
>  
> +#define __ACCESS_ONCE(x) ({                             \
> +            (void)(typeof(x))0; /* Scalar typecheck. */ \
> +            (volatile typeof(x) *)&(x); })
> +#define ACCESS_ONCE(x) (*__ACCESS_ONCE(x))

Might be better for this to be placed in common-macros.h?

> +
>  /* GDT selector values. */
>  #define SEL_CODE16          0x0008
>  #define SEL_DATA16          0x0010
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 84911f3ebcb4..6c005f0b0b38 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -16,6 +16,7 @@
>  #include <asm/current.h>
>  #include <asm/x86_emulate.h>
>  #include <asm/hvm/asid.h>
> +#include <asm/hvm/vlapic.h>

Is this a stray change?  Otherwise I don't see why this need to be
part of this patch when the rest of the changes are exclusively to
hvmloader.

Thanks, Roger.

