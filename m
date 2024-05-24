Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F338CE176
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 09:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729104.1134233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAPEs-0007TQ-4Q; Fri, 24 May 2024 07:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729104.1134233; Fri, 24 May 2024 07:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAPEs-0007SS-1I; Fri, 24 May 2024 07:21:18 +0000
Received: by outflank-mailman (input) for mailman id 729104;
 Fri, 24 May 2024 07:21:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LySr=M3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sAPEr-0007S6-5i
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 07:21:17 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34852698-199e-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 09:21:15 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4200ee78f34so27640125e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 00:21:15 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100fbb140sm45215505e9.44.2024.05.24.00.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 00:21:13 -0700 (PDT)
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
X-Inumbo-ID: 34852698-199e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716535274; x=1717140074; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ot/MgWABH9HqREAPl6rw3Run923e5V+E6Z3ZVH5fA+c=;
        b=H3ulg6kl4et+qSlsK7xcEiJsbAa8TmqdDZOKi4/kBX8mlmcGOxuT7N0c3EIoGCVhS4
         A4gye9VGe1LyJwo923/8+GkQwFA/H9ewJI0iYNtHNA6NpjBVKgJs+p3uRNCA0eLW+j/p
         XNta9cU71pDdTwZvo9eTAbemhjz/U6Dv+O4io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716535274; x=1717140074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ot/MgWABH9HqREAPl6rw3Run923e5V+E6Z3ZVH5fA+c=;
        b=bwD8da2Y2cJ+t1Gyp1qSmbZ6+al1KUHebJl6yR7rzYUFtUY8DAPlAqMmE4+pnb8UC6
         4JfPlAmKdUhg19ohrqwLIhVCVQuWUBqP9m4a4oBzZ9/mtND5E+v5aA+TGHnHorCRpxuJ
         v+z4qsHyesNGJe9v+RtAnxz7YkAFq1x5BTEK3Zn17F/AdfYrFbDh7gdacQoggy/8QPUr
         7GX4YX/Z1all1Bb09AhVQJ3Kmffksn/6nQ2q7rA8A6q46LS099H38SOp4hKpfuVO+7/m
         6OfJvnKQ8X5WK+zTHwAI9WKmZqmA8IITT0+1bWMdbP+dyWNCdvH2DVGaXfmV8ET4qigv
         nNzw==
X-Gm-Message-State: AOJu0Yyjsd/xPRWbbHW86Sdads36yGVck6vf0KKWhy3qtnO+FTXJCjFG
	v4xX1AAvj1QpZw9Zq/dzIjZyooR53028plM8IT06j9kpMsVfw8LnxoFi9SGheV/0VwNuGB1KsGc
	f
X-Google-Smtp-Source: AGHT+IExFByH1foFIEoIqFB6OUUiH2/8wABd6YVSG6aqJhNwT64F+8HLY41ZqppFzIzMa8QPsy7Nnw==
X-Received: by 2002:a05:600c:6a93:b0:41b:f359:2b53 with SMTP id 5b1f17b1804b1-42108a14eaemr11195605e9.37.1716535274219;
        Fri, 24 May 2024 00:21:14 -0700 (PDT)
Date: Fri, 24 May 2024 09:21:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH v2 5/8] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
Message-ID: <ZlA_6Abtw-u4a84J@macbook>
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
> +    if ( apic_id == 255 )
> +        cpuid(0xb, NULL, NULL, NULL, &apic_id);
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

Further thinking about this: do we really need the wmb(), given the
usage of ACCESS_ONCE()?

wmb() is a compiler barrier, and the usage of volatile in
ACCESS_ONCE() should already prevent any compiler re-ordering.

Thanks, Roger.

