Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73B950B01
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 19:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776473.1186630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sduuf-00056n-FG; Tue, 13 Aug 2024 17:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776473.1186630; Tue, 13 Aug 2024 17:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sduuf-00054g-Cf; Tue, 13 Aug 2024 17:02:25 +0000
Received: by outflank-mailman (input) for mailman id 776473;
 Tue, 13 Aug 2024 17:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJb4=PM=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sduue-00054Y-IZ
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 17:02:24 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceb8286d-5995-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 19:02:22 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52efd8807aaso7623888e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 10:02:22 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f29203d817sm11755511fa.99.2024.08.13.10.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 10:02:20 -0700 (PDT)
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
X-Inumbo-ID: ceb8286d-5995-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723568542; x=1724173342; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGJpkmzwhAHPEBfWQMTLg/zF6IPgm68M3yUmp2d77TM=;
        b=fLyyc+M8iuIjYKNkHmxRWOUEqWXnTH3rvAtnzg7HM01d3/X+mS/o+Xh3WkRpIwpZiz
         z1vABSn4woy8t2YyZoErE/1WnGfxJW7RdI2sVv4a20r0Nz/vuAp5Y9Ycr9caWv9BDdkj
         1zANWYlYYC/LAxMaXUcXPnboe+9rGCZuV0v3rNmYKPTFyfOiNg7qVDSKXnwToNhlO4dl
         xlWwGwHoYmO9i2JcggEgpHzXhdf9ALRrRg290Leq6zKRmPKYjugCKeQ/SuGdxzjJBhqK
         cGbPUmoneZQ1B5MFKqr89oAhryKrS2SXYgtK4a5XEUdohQfzKOz3YQemQGp1b1hGGbx2
         X5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723568542; x=1724173342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGJpkmzwhAHPEBfWQMTLg/zF6IPgm68M3yUmp2d77TM=;
        b=odNB/veGX9gMk0ZXRhKHecDBuvV12Y28JwomqgFI0IQOp1ZlQxOWU8hU3IKjLW6Rce
         H1TZU/xERVpjkArIrJFklnHEPIziQx5qFf9u1HUZJTB0sovUtcDj8PZHBv7ookJ0aK3w
         szOEi2W+elOHbRB7Cu8/h3wyneryeLAs3hcEZkxR8vYcDLhdlEjlOxgmczeQXInEqIBy
         Qo4PTmldohnu9hWSF5vCxElk3zkAsTJIZH33l6F0GJ3ZV8HzMGdSI6iSy1jxdj7XyVnH
         emCYJPCerypSr8WWIlx3IOMu/YHSQobz+hfePqdBBwfMTmo9euIaBMYO2hMH3aFPgq9w
         pGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfade5JlcsHyP8YxVtshOz5P8Dt7MVP9+n4tiWz+9S/9pOKH987VTOzqY/5ab/mkEM4ie81HlH15b+YevygXtKvDGzKdH9fwSdXIHSjpo=
X-Gm-Message-State: AOJu0YyvrE40YbdK92Jk8HFzZZ4pg6+Gfrbrr+wn6eMh200fUGvIhguu
	HNGjArfn4+/CD3aFY0fNlz/IOSrn1ORfZ5wZi2SrvvKNvNHcNHLB
X-Google-Smtp-Source: AGHT+IHZuurj1sUG8YFtdeInfXPdWplweffYruWCp+QQjqA/XiC02As6mGM3q9lJSfLX6jrUtjaRPw==
X-Received: by 2002:a2e:90cd:0:b0:2f1:585b:f326 with SMTP id 38308e7fff4ca-2f3aa1fe856mr50841fa.45.1723568541128;
        Tue, 13 Aug 2024 10:02:21 -0700 (PDT)
Date: Tue, 13 Aug 2024 19:02:19 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org,
	peter.maydell@linaro.org, alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com, jason.andryuk@amd.com,
	edgar.iglesias@amd.com, xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
Message-ID: <ZruRm34zIMtUm7oH@zapote>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
 <20240812130606.90410-5-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>

On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
> On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
> > servers to handle hotplug.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  hw/arm/xen_arm.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > index 5f75cc3779..ef8315969c 100644
> > --- a/hw/arm/xen_arm.c
> > +++ b/hw/arm/xen_arm.c
> > @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
> >  
> >      xen_init_ram(machine);
> >  
> > -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
> > +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
> >  
> >      xen_create_virtio_mmio_devices(xam);
> >  
> > @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> >      MachineClass *mc = MACHINE_CLASS(oc);
> >      mc->desc = "Xen PVH ARM machine";
> >      mc->init = xen_arm_init;
> > -    mc->max_cpus = 1;
> > +    /* MAX number of vcpus supported by Xen.  */
> > +    mc->max_cpus = GUEST_MAX_VCPUS;
> 
> Will this cause allocations of data structures with 128 elements?
> Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
> possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called

Yes, in theory there's probably overhead with this but as you correctly
noted below, a PVH aware xl will set the max_cpus option to a lower value.

With a non-pvh aware xl, I was a little worried about the overhead
but I couldn't see any visible slow-down on ARM neither in boot or in network
performance (I didn't run very sophisticated benchmarks).


> later on with the precise vCPU value which should be provided to QEMU
> via the -smp command line option
> (tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?

Yes, a pvh aware xl will for example pass -smp 2,maxcpus=4 based on
values from the xl.cfg. If the user doesn't set maxvcpus in xl.cfg, xl
will set maxvcpus to the same value as vcpus.

Best regards,
Edgar

