Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7DD97CD50
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 19:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800880.1210878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srLHd-0006P6-DL; Thu, 19 Sep 2024 17:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800880.1210878; Thu, 19 Sep 2024 17:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srLHd-0006N4-Ag; Thu, 19 Sep 2024 17:49:37 +0000
Received: by outflank-mailman (input) for mailman id 800880;
 Thu, 19 Sep 2024 17:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tGzI=QR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1srLHb-0006My-Cf
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 17:49:35 +0000
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [2607:f8b0:4864:20::e2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86c71ad4-76af-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 19:49:33 +0200 (CEST)
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-49be3d534ffso356338137.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 10:49:33 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8493985d1bfsm1459263241.20.2024.09.19.10.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 10:49:30 -0700 (PDT)
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
X-Inumbo-ID: 86c71ad4-76af-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726768172; x=1727372972; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfx9nDEwWLIpKCVHRneBH4hvuTBkLiiktuVJaawU2nY=;
        b=Gp2yVoP2vbaPxXWlIL1ZFkGeJjL30SoJ/12p/vJUrQBH1GeJUbllOBxlLP/cSsUkRY
         TZczfTMCOYZQO+3C+bTOHQZRNoE1EBgWpC/VRIg+9OOSkh9V2HX1uH/N712+yiDq9MnI
         1jz3VvTooBGqZ2CMCsl8M9Juw3HrgpJn+vs0X0GiNiXHkCgKK7w+NsxyNnVWW48fJr3/
         TUqMmFtgjnnAFeJv+0mV1Zwv0X5ahTa+2AMsx22v7sAvZcm8TRlJnY/xYXKKfxp3t9o9
         O7/JkF/T/ihD2pHPyjjWL7qasrGM4O5coUzOyH3ojcN4FJYBOOqGmuNnXyj1gRRSZs3G
         9u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726768172; x=1727372972;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mfx9nDEwWLIpKCVHRneBH4hvuTBkLiiktuVJaawU2nY=;
        b=Vf2TTbGTNIrynEvychKzwFCdZZXCUGteAO1krfurmp195pwOkiXpA64mE1wyCM35mL
         spTx36dvRS+UYsOuOT/gweSf+8EK/NwNEqEduc/i8ZQXMEjj4WpSGdTbZ0ooje2P+u4g
         T9pRb4N4xTKXkRxkUkaRGNQCXNdXm7+ZYc1ljbWubWUZsDGlXX47vShzbDiUxzYdDgzw
         k5Eefkt6uG18ZxIU+9MhtC09VMYuTvKHkNRJI131gSlnxuQP2H5tvI6NnKBSDi7Fs8sB
         iScH/d6mu8E8aD1fqMAcedzJJ4JKRxQ1caYB2SsN0y4bnhJZxGkixvENzxc9LPjklpM0
         JYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHSGVdRVRv62d8/3K1XJZl2kTQl0X/68C9npDqALQA5cAqovOAut+ms9WO+SnZV0CudLNwnPvmDQQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwNw4Vwts/GcLgKX765JTlks4AObPM6boLNopBZr/ix5BV4cd+
	Swv+Dg4E29UASMyii5NOmTSsRjiNG3PyA6eAQDCIBWEJI1TLlVtg
X-Google-Smtp-Source: AGHT+IHTkyX02sK/cO/7bvsYYZGFbcED+nb78Jl8L86g6nddDbJklOYonskHWI5JM7i6dGduHNz0WA==
X-Received: by 2002:a05:6102:5493:b0:49b:dd30:d168 with SMTP id ada2fe7eead31-49fc7540d7emr465523137.2.1726768171832;
        Thu, 19 Sep 2024 10:49:31 -0700 (PDT)
Date: Thu, 19 Sep 2024 19:28:32 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org,
	peter.maydell@linaro.org, alex.bennee@linaro.org,
	edgar.iglesias@amd.com, xen-devel@lists.xenproject.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v1 1/4] xen: Expose handle_bufioreq in xen_register_ioreq
Message-ID: <ZuxfQAAAdP1JqT0k@zapote>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
 <20240916150853.1216703-2-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2409161643090.1417852@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2409161643090.1417852@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Mon, Sep 16, 2024 at 04:45:34PM -0700, Stefano Stabellini wrote:
> On Mon, 16 Sep 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Expose handle_bufioreq in xen_register_ioreq().
> > This is to allow machines to enable or disable buffered ioreqs.
> > 
> > No functional change since all callers still set it to
> > HVM_IOREQSRV_BUFIOREQ_ATOMIC.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  hw/i386/xen/xen-hvm.c           |   4 +-
> >  hw/xen/xen-hvm-common.c         | 100 +++++++++++++++++++-------------
> >  hw/xen/xen-pvh-common.c         |   4 +-
> >  include/hw/xen/xen-hvm-common.h |   3 +
> >  include/hw/xen/xen_native.h     |   3 +-
> >  5 files changed, 70 insertions(+), 44 deletions(-)
> > 
> > diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> > index 4f6446600c..d3df488c48 100644
> > --- a/hw/i386/xen/xen-hvm.c
> > +++ b/hw/i386/xen/xen-hvm.c
> > @@ -614,7 +614,9 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
> >  
> >      state = g_new0(XenIOState, 1);
> >  
> > -    xen_register_ioreq(state, max_cpus, &xen_memory_listener);
> > +    xen_register_ioreq(state, max_cpus,
> > +                       HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> > +                       &xen_memory_listener);
> >  
> >      xen_is_stubdomain = xen_check_stubdomain(state->xenstore);
> >  
> > diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> > index 3a9d6f981b..d8824cccf1 100644
> > --- a/hw/xen/xen-hvm-common.c
> > +++ b/hw/xen/xen-hvm-common.c
> > @@ -667,6 +667,8 @@ static int xen_map_ioreq_server(XenIOState *state)
> >      xen_pfn_t ioreq_pfn;
> >      xen_pfn_t bufioreq_pfn;
> >      evtchn_port_t bufioreq_evtchn;
> > +    unsigned long num_frames = 1;
> > +    unsigned long frame = 1;
> >      int rc;
> >  
> >      /*
> > @@ -675,59 +677,72 @@ static int xen_map_ioreq_server(XenIOState *state)
> >       */
> >      QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_bufioreq != 0);
> >      QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_ioreq(0) != 1);
> > +
> > +    if (state->has_bufioreq) {
> > +        frame = 0;
> > +        num_frames = 2;
> > +    }
> >      state->fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
> >                                           XENMEM_resource_ioreq_server,
> > -                                         state->ioservid, 0, 2,
> > +                                         state->ioservid,
> > +                                         frame, num_frames,
> >                                           &addr,
> >                                           PROT_READ | PROT_WRITE, 0);
> >      if (state->fres != NULL) {
> >          trace_xen_map_resource_ioreq(state->ioservid, addr);
> > -        state->buffered_io_page = addr;
> > -        state->shared_page = addr + XC_PAGE_SIZE;
> > +        state->shared_page = addr;
> > +        if (state->has_bufioreq) {
> > +            state->buffered_io_page = addr;
> > +            state->shared_page = addr + XC_PAGE_SIZE;
> > +        }
> >      } else if (errno != EOPNOTSUPP) {
> >          error_report("failed to map ioreq server resources: error %d handle=%p",
> >                       errno, xen_xc);
> >          return -1;
> >      }
> >  
> > -    rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
> > -                                   (state->shared_page == NULL) ?
> > -                                   &ioreq_pfn : NULL,
> > -                                   (state->buffered_io_page == NULL) ?
> > -                                   &bufioreq_pfn : NULL,
> > -                                   &bufioreq_evtchn);
> > -    if (rc < 0) {
> > -        error_report("failed to get ioreq server info: error %d handle=%p",
> > -                     errno, xen_xc);
> > -        return rc;
> > -    }
> > -
> > -    if (state->shared_page == NULL) {
> > -        trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
> > +    if (state->has_bufioreq) {
> > +        rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
> > +                                       (state->shared_page == NULL) ?
> > +                                       &ioreq_pfn : NULL,
> > +                                       (state->buffered_io_page == NULL) ?
> > +                                       &bufioreq_pfn : NULL,
> > +                                       &bufioreq_evtchn);
> > +        if (rc < 0) {
> > +            error_report("failed to get ioreq server info: error %d handle=%p",
> > +                    errno, xen_xc);
> > +            return rc;
> > +        }
> >  
> > -        state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
> > -                                                  PROT_READ | PROT_WRITE,
> > -                                                  1, &ioreq_pfn, NULL);
> >          if (state->shared_page == NULL) {
> > -            error_report("map shared IO page returned error %d handle=%p",
> > -                         errno, xen_xc);
> > +            trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
> > +
> > +            state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
> > +                                                      PROT_READ | PROT_WRITE,
> > +                                                      1, &ioreq_pfn, NULL);
> > +            if (state->shared_page == NULL) {
> > +                error_report("map shared IO page returned error %d handle=%p",
> > +                        errno, xen_xc);
> > +            }
> >          }
> > -    }
> 
> 
> If I am reading the code right the calls to xen_get_ioreq_server_info
> and xenforeignmemory_map were not done to setup bufioreq. They were done
> for legacy compatibility to support systems where
> xenforeignmemory_map_resource returns EOPNOTSUPP.
> 
> I think we should either get rid of this legacy path completely, or
> keep it for both bufioreq and non-bufioreq.


Yes, I'll fix the conditions and keep the legacy code for now!

Cheers,
Edgar


> 
> 
> 
> > -    if (state->buffered_io_page == NULL) {
> > -        trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
> > -
> > -        state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
> > -                                                       PROT_READ | PROT_WRITE,
> > -                                                       1, &bufioreq_pfn,
> > -                                                       NULL);
> >          if (state->buffered_io_page == NULL) {
> > -            error_report("map buffered IO page returned error %d", errno);
> > -            return -1;
> > +            trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
> > +
> > +            state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
> > +                    PROT_READ | PROT_WRITE,
> > +                    1, &bufioreq_pfn,
> > +                    NULL);
> > +            if (state->buffered_io_page == NULL) {
> > +                error_report("map buffered IO page returned error %d", errno);
> > +                return -1;
> > +            }
> >          }
> >      }
> >  
> > -    if (state->shared_page == NULL || state->buffered_io_page == NULL) {
> > +
> > +    if (state->shared_page == NULL ||
> > +        (state->has_bufioreq && state->buffered_io_page == NULL)) {
> >          return -1;
> >      }
> >  
> > @@ -830,14 +845,15 @@ static void xen_do_ioreq_register(XenIOState *state,
> >          state->ioreq_local_port[i] = rc;
> >      }
> >  
> > -    rc = qemu_xen_evtchn_bind_interdomain(state->xce_handle, xen_domid,
> > -                                          state->bufioreq_remote_port);
> > -    if (rc == -1) {
> > -        error_report("buffered evtchn bind error %d", errno);
> > -        goto err;
> > +    if (state->has_bufioreq) {
> > +        rc = qemu_xen_evtchn_bind_interdomain(state->xce_handle, xen_domid,
> > +                                              state->bufioreq_remote_port);
> > +        if (rc == -1) {
> > +            error_report("buffered evtchn bind error %d", errno);
> > +            goto err;
> > +        }
> > +        state->bufioreq_local_port = rc;
> >      }
> > -    state->bufioreq_local_port = rc;
> > -
> >      /* Init RAM management */
> >  #ifdef XEN_COMPAT_PHYSMAP
> >      xen_map_cache_init(xen_phys_offset_to_gaddr, state);
> > @@ -865,6 +881,7 @@ err:
> >  }
> >  
> >  void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> > +                        int handle_bufioreq,
> >                          const MemoryListener *xen_memory_listener)
> >  {
> >      int rc;
> > @@ -883,7 +900,8 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> >          goto err;
> >      }
> >  
> > -    rc = xen_create_ioreq_server(xen_domid, &state->ioservid);
> > +    state->has_bufioreq = handle_bufioreq != HVM_IOREQSRV_BUFIOREQ_OFF;
> > +    rc = xen_create_ioreq_server(xen_domid, handle_bufioreq, &state->ioservid);
> >      if (!rc) {
> >          xen_do_ioreq_register(state, max_cpus, xen_memory_listener);
> >      } else {
> > diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> > index 28d7168446..08641fdcec 100644
> > --- a/hw/xen/xen-pvh-common.c
> > +++ b/hw/xen/xen-pvh-common.c
> > @@ -194,7 +194,9 @@ static void xen_pvh_init(MachineState *ms)
> >      }
> >  
> >      xen_pvh_init_ram(s, sysmem);
> > -    xen_register_ioreq(&s->ioreq, ms->smp.max_cpus, &xen_memory_listener);
> > +    xen_register_ioreq(&s->ioreq, ms->smp.max_cpus,
> > +                       HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> > +                       &xen_memory_listener);
> >  
> >      if (s->cfg.virtio_mmio_num) {
> >          xen_create_virtio_mmio_devices(s);
> > diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
> > index 3d796235dc..7246941fe5 100644
> > --- a/include/hw/xen/xen-hvm-common.h
> > +++ b/include/hw/xen/xen-hvm-common.h
> > @@ -81,6 +81,8 @@ typedef struct XenIOState {
> >      QLIST_HEAD(, XenPciDevice) dev_list;
> >      DeviceListener device_listener;
> >  
> > +    bool has_bufioreq;
> > +
> >      Notifier exit;
> >  } XenIOState;
> >  
> > @@ -95,6 +97,7 @@ void xen_device_unrealize(DeviceListener *listener, DeviceState *dev);
> >  
> >  void xen_hvm_change_state_handler(void *opaque, bool running, RunState rstate);
> >  void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> > +                        int handle_bufioreq,
> >                          const MemoryListener *xen_memory_listener);
> >  
> >  void cpu_ioreq_pio(ioreq_t *req);
> > diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
> > index 1a5ad693a4..5caf91a616 100644
> > --- a/include/hw/xen/xen_native.h
> > +++ b/include/hw/xen/xen_native.h
> > @@ -464,10 +464,11 @@ static inline void xen_unmap_pcidev(domid_t dom,
> >  }
> >  
> >  static inline int xen_create_ioreq_server(domid_t dom,
> > +                                          int handle_bufioreq,
> >                                            ioservid_t *ioservid)
> >  {
> >      int rc = xendevicemodel_create_ioreq_server(xen_dmod, dom,
> > -                                                HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> > +                                                handle_bufioreq,
> >                                                  ioservid);
> >  
> >      if (rc == 0) {
> > -- 
> > 2.43.0
> > 

