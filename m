Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110C68CFC37
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 10:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730644.1135788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBW5R-0004Nf-IY; Mon, 27 May 2024 08:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730644.1135788; Mon, 27 May 2024 08:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBW5R-0004Ln-Fs; Mon, 27 May 2024 08:52:09 +0000
Received: by outflank-mailman (input) for mailman id 730644;
 Mon, 27 May 2024 08:52:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0flO=M6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sBW5Q-0004Lh-0K
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 08:52:08 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6542de2f-1c06-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 10:52:06 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-355080e6ff9so2228813f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 01:52:06 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a1c95absm8358761f8f.87.2024.05.27.01.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 01:52:05 -0700 (PDT)
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
X-Inumbo-ID: 6542de2f-1c06-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716799926; x=1717404726; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Nj/Vs328r6a6QlUFucJaFjZBMVd7L2aGPqvHoZfrn4=;
        b=YSpEG4AnAwwKiHqAozzmBoLkaLhb02JENQ6b4d4upaIyiF2ZKu+ay6h1n2UHV96Lhp
         P6Ade8BvLmV6YnGtaLqvAU/Bb/AJ9B8L2exmezwRLAu3LSYd81sBHbRWQlHiikW975AO
         aeLf3PRrtruN0P2UZvrxq3I3lrcMAR1a5MKJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799926; x=1717404726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Nj/Vs328r6a6QlUFucJaFjZBMVd7L2aGPqvHoZfrn4=;
        b=BzapTNCY81d4x9cwHpHH1OdvHFSr4YVSt5RvwOnII+CU2brdCujdSe6QYaW7dMGEoV
         j+oJ1EBFG4vMXaTiJq8yXuB6GD4NlvRSgh+KQBPHqrpsQA8+JuYVi/uroh5qLYKerL+D
         PY+AA/y5iUPqOxgarYoRipgdDQDeTLf6tolmVzvUnNViv74qtxonJpxw+ok1Ab6m7Skt
         w5vMf60jdGNxAK6mHZTlrVheH80pRssHHf6IMV+ZkAYUc+Z7NwEqCsbxvyOpbtmBDjVf
         Hd9uN2rIJD6nkPO3372Pid+LzNoGLiqSabsZ8HxbCq0a4tUyeirvV5bSFHglAegqZaws
         NdSg==
X-Gm-Message-State: AOJu0YwH5yqHNY8KftpGrp+wYt1KF0PkT22vdUsVRWu2/1Qk40SIosea
	D3e5UTvaOe5LwRZ816ozAOAUFeCUQMs9WHhza6cxVCUcaJF98pwZAbpy/R6ZkDY=
X-Google-Smtp-Source: AGHT+IGL8jcBCEHtxR6QSk/ZQ0mcFuCa85folu6oCF9qiGNxcjtSXlU61yzDYkQOuULLmcF/ElfyDA==
X-Received: by 2002:a5d:42c8:0:b0:346:e9c4:65b with SMTP id ffacd0b85a97d-3552f9cfc66mr5133300f8f.27.1716799926147;
        Mon, 27 May 2024 01:52:06 -0700 (PDT)
Date: Mon, 27 May 2024 10:52:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH v2 5/8] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
Message-ID: <ZlRJtN7h32uOHEOi@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <b2d4109cd30c82e0af153d36f8dce77c59f03695.1715102098.git.alejandro.vallejo@cloud.com>
 <ZlA_6Abtw-u4a84J@macbook>
 <8cac1707-855b-478a-b88d-7fd619f19352@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cac1707-855b-478a-b88d-7fd619f19352@cloud.com>

On Fri, May 24, 2024 at 04:15:34PM +0100, Alejandro Vallejo wrote:
> On 24/05/2024 08:21, Roger Pau Monné wrote:
> > On Wed, May 08, 2024 at 01:39:24PM +0100, Alejandro Vallejo wrote:
> >> Make it so the APs expose their own APIC IDs in a LUT. We can use that LUT to
> >> populate the MADT, decoupling the algorithm that relates CPU IDs and APIC IDs
> >> from hvmloader.
> >>
> >> While at this also remove ap_callin, as writing the APIC ID may serve the same
> >> purpose.
> >>
> >> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >> ---
> >> v2:
> >>   * New patch. Replaces adding cpu policy to hvmloader in v1.
> >> ---
> >>  tools/firmware/hvmloader/config.h    |  6 ++++-
> >>  tools/firmware/hvmloader/hvmloader.c |  4 +--
> >>  tools/firmware/hvmloader/smp.c       | 40 +++++++++++++++++++++++-----
> >>  tools/firmware/hvmloader/util.h      |  5 ++++
> >>  xen/arch/x86/include/asm/hvm/hvm.h   |  1 +
> >>  5 files changed, 47 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
> >> index c82adf6dc508..edf6fa9c908c 100644
> >> --- a/tools/firmware/hvmloader/config.h
> >> +++ b/tools/firmware/hvmloader/config.h
> >> @@ -4,6 +4,8 @@
> >>  #include <stdint.h>
> >>  #include <stdbool.h>
> >>  
> >> +#include <xen/hvm/hvm_info_table.h>
> >> +
> >>  enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
> >>  extern enum virtual_vga virtual_vga;
> >>  
> >> @@ -49,8 +51,10 @@ extern uint8_t ioapic_version;
> >>  
> >>  #define IOAPIC_ID           0x01
> >>  
> >> +extern uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
> >> +
> >>  #define LAPIC_BASE_ADDRESS  0xfee00000
> >> -#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
> >> +#define LAPIC_ID(vcpu_id)   (CPU_TO_X2APICID[(vcpu_id)])
> >>  
> >>  #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
> >>  #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
> >> diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
> >> index c58841e5b556..1eba92229925 100644
> >> --- a/tools/firmware/hvmloader/hvmloader.c
> >> +++ b/tools/firmware/hvmloader/hvmloader.c
> >> @@ -342,11 +342,11 @@ int main(void)
> >>  
> >>      printf("CPU speed is %u MHz\n", get_cpu_mhz());
> >>  
> >> +    smp_initialise();
> >> +
> >>      apic_setup();
> >>      pci_setup();
> >>  
> >> -    smp_initialise();
> >> -
> >>      perform_tests();
> >>  
> >>      if ( bios->bios_info_setup )
> >> diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
> >> index a668f15d7e1f..4d75f239c2f5 100644
> >> --- a/tools/firmware/hvmloader/smp.c
> >> +++ b/tools/firmware/hvmloader/smp.c
> >> @@ -29,7 +29,34 @@
> >>  
> >>  #include <xen/vcpu.h>
> >>  
> >> -static int ap_callin, ap_cpuid;
> >> +static int ap_cpuid;
> >> +
> >> +/**
> >> + * Lookup table of x2APIC IDs.
> >> + *
> >> + * Each entry is populated its respective CPU as they come online. This is required
> >> + * for generating the MADT with minimal assumptions about ID relationships.
> >> + */
> >> +uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
> >> +
> >> +static uint32_t read_apic_id(void)
> >> +{
> >> +    uint32_t apic_id;
> >> +
> >> +    cpuid(1, NULL, &apic_id, NULL, NULL);
> >> +    apic_id >>= 24;
> >> +
> >> +    /*
> >> +     * APIC IDs over 255 are represented by 255 in leaf 1 and are meant to be
> >> +     * read from topology leaves instead. Xen exposes x2APIC IDs in leaf 0xb,
> >> +     * but only if the x2APIC feature is present. If there are that many CPUs
> >> +     * it's guaranteed to be there so we can avoid checking for it specifically
> >> +     */
> >> +    if ( apic_id == 255 )
> >> +        cpuid(0xb, NULL, NULL, NULL, &apic_id);
> >> +
> >> +    return apic_id;
> >> +}
> >>  
> >>  static void ap_start(void)
> >>  {
> >> @@ -37,12 +64,12 @@ static void ap_start(void)
> >>      cacheattr_init();
> >>      printf("done.\n");
> >>  
> >> +    wmb();
> >> +    ACCESS_ONCE(CPU_TO_X2APICID[ap_cpuid]) = read_apic_id();
> > 
> > Further thinking about this: do we really need the wmb(), given the
> > usage of ACCESS_ONCE()?
> > 
> > wmb() is a compiler barrier, and the usage of volatile in
> > ACCESS_ONCE() should already prevent any compiler re-ordering.
> > 
> > Thanks, Roger.
> 
> volatile reads/writes cannot be reordered with other volatile
> reads/writes, but volatile reads/writes can be reordered with
> non-volatile reads/writes, AFAIR.

Right, I've read the C99 spec and it does indeed only guarantee the
state of volatile objects to be as expected at sequence points.  I
think however this specific code would still be fine since the
function calls are considered to have side-effects, and those must all
be completed before the volatile access.

> My intent here was to prevent the compiler omitting the write (though in
> practice it didn't). I think the barrier is still required to prevent
> reordering according to the spec.

Yes, my understating is that you added the ACCESS_ONCE() to possibly
prevent the compiler from re-ordering the CPU_TO_X2APICID[ap_cpuid]) =
read_apic_id() after the 'hlt' loop?

AFAICT the expressions in the `for` statement are considered sequence
points, and the calling `read_apic_id()` could have side-effects, so
the compiler won't be able to elide or move the setting of
CPU_TO_X2APICID[] due to all side-effects of previous evaluations must
be complete at sequence points.

I'm fine with leaving the wmb() + ACCESS_ONCE().

Thanks, Roger.

