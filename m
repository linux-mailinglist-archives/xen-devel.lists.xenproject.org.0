Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0639C951A61
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 13:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777102.1187292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seCVL-0003bG-Lq; Wed, 14 Aug 2024 11:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777102.1187292; Wed, 14 Aug 2024 11:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seCVL-0003Z9-JG; Wed, 14 Aug 2024 11:49:27 +0000
Received: by outflank-mailman (input) for mailman id 777102;
 Wed, 14 Aug 2024 11:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lR0F=PN=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1seCVJ-0003Z3-CF
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 11:49:25 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fb2da3f-5a33-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 13:49:23 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ef248ab2aeso101778921fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 04:49:23 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f291ddbaedsm14068641fa.18.2024.08.14.04.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 04:49:21 -0700 (PDT)
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
X-Inumbo-ID: 3fb2da3f-5a33-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723636163; x=1724240963; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dp0L+GamiTI78LaNXUI0L+8bA2ZqatuVzlZrQCRiNiI=;
        b=mZhkzZ/L1Ebhbxuxz7NcZc5jPjiysQ8/aVc3Wr1cxUnZotIYvmQjSen9gxOz6kIi7T
         dKayuZVU839wROByrxq56jseJkl1uhdDNGGzPVTB4M3gTRJyqnLHHRcWZDHpXjl8xYtW
         H++AnTQiT2wcYOZJnj5egnvdU6lVq8ig9/KkEuDEzml40EwqHrw7mb+U7UkSMTjt1i2y
         U0xJjbRhmSRY90uamMrThkmNRa0k5oomBfQ83UdhH0aTSQvWU9Fs3Z4bo0iKqTshIPlA
         Z0DjaIzH8BOIV0mYyhJSEsIN+DRMqVyoBR/fSRUiMhmEOa6GkagB+U9SPJbvj+8q3aqd
         DWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636163; x=1724240963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp0L+GamiTI78LaNXUI0L+8bA2ZqatuVzlZrQCRiNiI=;
        b=bVJo2mPPRXusc7ruoyHSSDOc2/Kn1pwezbCOaNU+KZpJNRwJC9mAdB9SOIBXorZ2PL
         3PhCxcyBwaHrb+pgqz9oT086yIaz98/Cmga3xDNQYtJLL3uHcQB2iTaRQLdJEbOithtS
         u7DVUZyr2lK58YFyXjQUb/GWy72LsYJEiHywP7cI3e0Z3rur7n7hTEYIlauPSL4K2JcB
         ypjd/7QlVKRY/uZYxf8JAU2M7zV0koqPAQvV5t1RlXxMVr5qCOUcSvvBJUudic+lYmdN
         GjH6oAOcYtOZ1xToGP1ZgexVGuhs5keS0EL8oKZJ20iJXuHt24PrcmBHqSDn3O2eLaEd
         CDVw==
X-Forwarded-Encrypted: i=1; AJvYcCUP2G0XhImqftICXbC76aJKYBKPXgJqO4Xs5zRYWhnRO3eKKt/ZVMlJcNLwnXHc+kxzexXaKgYMNJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3zSHz9qxgPCT1tYkgXVyoMv7xavSuYiMex2o5r41Ab3WACMBR
	vJYgfTxdm5WPz5pysHXId21hproylmhV1BsSILYKuWaptyIS48bE
X-Google-Smtp-Source: AGHT+IFMKxXSID3krkFoZ71TRri2uuaWjn55H1yF6EWyj543s/obDY84Jsw9e73Y36BCyYIts5LDiQ==
X-Received: by 2002:a05:651c:1079:b0:2ef:26f2:d3ec with SMTP id 38308e7fff4ca-2f3aa1df0e5mr17466981fa.12.1723636161891;
        Wed, 14 Aug 2024 04:49:21 -0700 (PDT)
Date: Wed, 14 Aug 2024 13:49:20 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org,
	peter.maydell@linaro.org, alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com, jason.andryuk@amd.com,
	edgar.iglesias@amd.com, xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
Message-ID: <ZryZwOoadeb1UWK8@zapote>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
 <20240812130606.90410-5-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
 <ZruRm34zIMtUm7oH@zapote>
 <alpine.DEB.2.22.394.2408131550080.298534@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2408131550080.298534@ubuntu-linux-20-04-desktop>

On Tue, Aug 13, 2024 at 03:52:32PM -0700, Stefano Stabellini wrote:
> On Tue, 13 Aug 2024, Edgar E. Iglesias wrote:
> > On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
> > > On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > > 
> > > > Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
> > > > servers to handle hotplug.
> > > > 
> > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > ---
> > > >  hw/arm/xen_arm.c | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > > > index 5f75cc3779..ef8315969c 100644
> > > > --- a/hw/arm/xen_arm.c
> > > > +++ b/hw/arm/xen_arm.c
> > > > @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
> > > >  
> > > >      xen_init_ram(machine);
> > > >  
> > > > -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
> > > > +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
> > > >  
> > > >      xen_create_virtio_mmio_devices(xam);
> > > >  
> > > > @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> > > >      MachineClass *mc = MACHINE_CLASS(oc);
> > > >      mc->desc = "Xen PVH ARM machine";
> > > >      mc->init = xen_arm_init;
> > > > -    mc->max_cpus = 1;
> > > > +    /* MAX number of vcpus supported by Xen.  */
> > > > +    mc->max_cpus = GUEST_MAX_VCPUS;
> > > 
> > > Will this cause allocations of data structures with 128 elements?
> > > Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
> > > possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called
> > 
> > Yes, in theory there's probably overhead with this but as you correctly
> > noted below, a PVH aware xl will set the max_cpus option to a lower value.
> > 
> > With a non-pvh aware xl, I was a little worried about the overhead
> > but I couldn't see any visible slow-down on ARM neither in boot or in network
> > performance (I didn't run very sophisticated benchmarks).
>  
> What do you mean by "non-pvh aware xl"? All useful versions of xl
> support pvh?


I mean an xl without our PVH patches merged.
xl in upstream doesn't know much about PVH yet.
Even for ARM, we're still carrying significant patches in our tree.


> > > later on with the precise vCPU value which should be provided to QEMU
> > > via the -smp command line option
> > > (tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?
> > 
> > Yes, a pvh aware xl will for example pass -smp 2,maxcpus=4 based on
> > values from the xl.cfg. If the user doesn't set maxvcpus in xl.cfg, xl
> > will set maxvcpus to the same value as vcpus.
> 
> OK good. In that case if this is just an initial value meant to be
> overwritten, I think it is best to keep it as 1.

Sorry but that won't work. I think the confusion here may be that
it's easy to mix up mc->max_cpus and machine->smp.max_cpus, these are
not the same. They have different purposes.

I'll try to clarify the 3 values in play.

machine-smp.cpus:
Number of guest vcpus active at boot.
Passed to QEMU via the -smp command-line option.
We don't use this value in QEMU's ARM PVH machines.

machine->smp.max_cpus:
Max number of vcpus that the guest can use (equal or larger than machine-smp.cpus).
Will be set by xl via the "-smp X,maxcpus=Y" command-line option to QEMU.
Taken from maxvcpus from xl.cfg, same as XEN_DMOP_nr_vcpus.
This is what we use for xen_register_ioreq().

mc->max_cpus:
Absolute MAX in QEMU used to cap the -smp command-line options.
If xl tries to set -smp (machine->smp.max_cpus) larger than this, QEMU will bail out.
Used to setup xen_register_ioreq() ONLY if -smp maxcpus was NOT set (i.e by a non PVH aware xl).
Cannot be 1 because that would limit QEMU to MAX 1 vcpu.

I guess we could set mc->max_cpus to what XEN_DMOP_nr_vcpus returns but I'll
have to check if we can even issue that hypercall this early in QEMU since
mc->max_cpus is setup before we even parse the machine options. We may
not yet know what domid we're attaching to yet.

Cheers,
Edgar

