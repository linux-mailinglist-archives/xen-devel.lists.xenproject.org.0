Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6484F505E42
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 21:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307543.522699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngWmK-00048z-8w; Mon, 18 Apr 2022 19:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307543.522699; Mon, 18 Apr 2022 19:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngWmK-00046v-5T; Mon, 18 Apr 2022 19:11:16 +0000
Received: by outflank-mailman (input) for mailman id 307543;
 Mon, 18 Apr 2022 19:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hjWk=U4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ngWmJ-00046X-2W
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 19:11:15 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f1b56b2-bf4b-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 21:11:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A97D4B81060;
 Mon, 18 Apr 2022 19:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AE5C385A7;
 Mon, 18 Apr 2022 19:11:08 +0000 (UTC)
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
X-Inumbo-ID: 4f1b56b2-bf4b-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650309069;
	bh=4YKezrNNiB9m8IY/75trg+uDeE7rdnHIo5cZ9GUis00=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iB4T6PRJQ/PKnUiFGV0kERbAIMsu/ZMsqV0vd8fXTENKsNL/Tltd13gSLsYQPTMgw
	 3+sVGM22tO6yathGP9PBYeMd9xLJMQ0f4DDQMBIlg+vy+n0ZnWnz148N7MAb6RMrkX
	 zATi/Y9l1605SLRUrYuA23MKANhBqDqE+FxK0U60m7zlj1lWOLbPpOsvX8mlB8QJsI
	 5xSYg4w4iF243ekVooz3mQg4iUDwd9p7FjbvnOlegC4CgGuDTWXahyOOxe3bKmm3fw
	 3ucmpsFSnkdKjD10ynpex39h49+PFhqpNe6+jvIeX+r9T7fnmIXkhP15hu2tzu9HBn
	 PjktHBLyZ1gQw==
Date: Mon, 18 Apr 2022 12:11:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, x86@kernel.org, 
    linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Julien Grall <julien@xen.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    linux-arm-kernel@lists.infradead.org, 
    Christoph Hellwig <hch@infradead.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 2/6] virtio: add option to restrict memory access
 under Xen
In-Reply-To: <8a66ad42-a3e7-c29d-7d4e-35766dcccd15@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204181151030.915916@ubuntu-linux-20-04-desktop>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com> <1649963973-22879-3-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.22.394.2204151235440.915916@ubuntu-linux-20-04-desktop> <8a66ad42-a3e7-c29d-7d4e-35766dcccd15@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-171909756-1650308130=:915916"
Content-ID: <alpine.DEB.2.22.394.2204181201000.915916@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-171909756-1650308130=:915916
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2204181201001.915916@ubuntu-linux-20-04-desktop>

On Sun, 17 Apr 2022, Oleksandr wrote:
> On 16.04.22 01:01, Stefano Stabellini wrote:
> > On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
> > > From: Juergen Gross <jgross@suse.com>
> > > 
> > > In order to support virtio in Xen guests add a config option enabling
> > > the user to specify whether in all Xen guests virtio should be able to
> > > access memory via Xen grant mappings only on the host side.
> > > 
> > > This applies to fully virtualized guests only, as for paravirtualized
> > > guests this is mandatory.
> > > 
> > > This requires to switch arch_has_restricted_virtio_memory_access()
> > > from a pure stub to a real function on x86 systems (Arm systems are
> > > not covered by now).
> > > 
> > > Add the needed functionality by providing a special set of DMA ops
> > > handling the needed grant operations for the I/O pages.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >   arch/x86/mm/init.c        |  15 ++++
> > >   arch/x86/mm/mem_encrypt.c |   5 --
> > >   arch/x86/xen/Kconfig      |   9 +++
> > >   drivers/xen/Kconfig       |  20 ++++++
> > >   drivers/xen/Makefile      |   1 +
> > >   drivers/xen/xen-virtio.c  | 177
> > > ++++++++++++++++++++++++++++++++++++++++++++++
> > >   include/xen/xen-ops.h     |   8 +++
> > >   7 files changed, 230 insertions(+), 5 deletions(-)
> > >   create mode 100644 drivers/xen/xen-virtio.c
> > > 
> > > diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> > > index d8cfce2..526a3b2 100644
> > > --- a/arch/x86/mm/init.c
> > > +++ b/arch/x86/mm/init.c
> > > @@ -8,6 +8,8 @@
> > >   #include <linux/kmemleak.h>
> > >   #include <linux/sched/task.h>
> > >   +#include <xen/xen.h>
> > > +
> > >   #include <asm/set_memory.h>
> > >   #include <asm/e820/api.h>
> > >   #include <asm/init.h>
> > > @@ -1065,3 +1067,16 @@ unsigned long max_swapfile_size(void)
> > >   	return pages;
> > >   }
> > >   #endif
> > > +
> > > +#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
> > > +int arch_has_restricted_virtio_memory_access(void)
> > > +{
> > > +	if (IS_ENABLED(CONFIG_XEN_PV_VIRTIO) && xen_pv_domain())
> > > +		return 1;
> > > +	if (IS_ENABLED(CONFIG_XEN_HVM_VIRTIO_GRANT) && xen_hvm_domain())
> > > +		return 1;
> > I think these two checks could be moved to a separate function in a Xen
> > header, e.g. xen_restricted_virtio_memory_access, and here you could
> > just
> > 
> > if (xen_restricted_virtio_memory_access())
> >      return 1;
> 
> Agree, will do
> 
> 
> > 
> > 
> > 
> > > +	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
> > > +}
> > > +EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
> > > +#endif
> > > diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
> > > index 50d2099..dda020f 100644
> > > --- a/arch/x86/mm/mem_encrypt.c
> > > +++ b/arch/x86/mm/mem_encrypt.c
> > > @@ -77,8 +77,3 @@ void __init mem_encrypt_init(void)
> > >   	print_mem_encrypt_feature_info();
> > >   }
> > >   -int arch_has_restricted_virtio_memory_access(void)
> > > -{
> > > -	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
> > > -}
> > > -EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
> > > diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
> > > index 85246dd..dffdffd 100644
> > > --- a/arch/x86/xen/Kconfig
> > > +++ b/arch/x86/xen/Kconfig
> > > @@ -92,3 +92,12 @@ config XEN_DOM0
> > >   	select X86_X2APIC if XEN_PVH && X86_64
> > >   	help
> > >   	  Support running as a Xen Dom0 guest.
> > > +
> > > +config XEN_PV_VIRTIO
> > > +	bool "Xen virtio support for PV guests"
> > > +	depends on XEN_VIRTIO && XEN_PV
> > > +	default y
> > > +	help
> > > +	  Support virtio for running as a paravirtualized guest. This will
> > > +	  need support on the backend side (qemu or kernel, depending on the
> > > +	  virtio device types used).
> > > diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> > > index 120d32f..fc61f7a 100644
> > > --- a/drivers/xen/Kconfig
> > > +++ b/drivers/xen/Kconfig
> > > @@ -335,4 +335,24 @@ config XEN_UNPOPULATED_ALLOC
> > >   	  having to balloon out RAM regions in order to obtain physical memory
> > >   	  space to create such mappings.
> > >   +config XEN_VIRTIO
> > > +	bool "Xen virtio support"
> > > +	default n
> > > +	depends on VIRTIO && DMA_OPS
> > > +	select ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
> > > +	help
> > > +	  Enable virtio support for running as Xen guest. Depending on the
> > > +	  guest type this will require special support on the backend side
> > > +	  (qemu or kernel, depending on the virtio device types used).
> > > +
> > > +config XEN_HVM_VIRTIO_GRANT
> > > +	bool "Require virtio for fully virtualized guests to use grant
> > > mappings"
> > > +	depends on XEN_VIRTIO && X86_64
> > > +	default y
> > > +	help
> > > +	  Require virtio for fully virtualized guests to use grant mappings.
> > > +	  This will avoid the need to give the backend the right to map all
> > > +	  of the guest memory. This will need support on the backend side
> > > +	  (qemu or kernel, depending on the virtio device types used).
> > I don't think we need 3 visible kconfig options for this.
> > 
> > In fact, I would only add one: XEN_VIRTIO. We can have any X86 (or ARM)
> > specific dependencies in the "depends" line under XEN_VIRTIO. And I
> > don't think we need XEN_HVM_VIRTIO_GRANT as a kconfig option
> > necessarely. It doesn't seem like some we want as build time option. At
> > most, it could be a runtime option (like a command line) or a debug
> > option (like an #define at the top of the source file.)
> 
> 
> I don't know what was the initial idea of having and extra XEN_HVM_VIRTIO and
> XEN_PV_VIRTIO options, but taking into the account that
> they are only used in arch_has_restricted_virtio_memory_access() currently, I
> share your opinion regarding a single XEN_VIRTIO option.
> 
> Looking ahead (including changes in the commit #4), we can imagine the
> resulting option:
> 
> config XEN_VIRTIO
>     bool "Xen virtio support"
>     default n
>     depends on VIRTIO && DMA_OPS
>     depends on (X86_64 || ARM || ARM64)
>     select ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
>     help
>       Enable virtio support for running as Xen guest. Depending on the
>       guest type this will require special support on the backend side
>       (qemu or kernel, depending on the virtio device types used).
> 
> 
> and then arch_has_restricted_virtio_memory_access() per arch:
> 
> 
> 1. x86:
> 
> int arch_has_restricted_virtio_memory_access(void)
> {
>     return (xen_has_restricted_virtio_memory_access() ||
>             cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT));
> }
> 
> 
> 2. Arm:
> 
> int arch_has_restricted_virtio_memory_access(void)
> {
>     return xen_has_restricted_virtio_memory_access();
> }
> 
> 
> 3. xen.h:
> 
> static inline int xen_has_restricted_virtio_memory_access(void)
> {
>     if (IS_ENABLED(CONFIG_XEN_VIRTIO) && (xen_pv_domain() ||
> xen_hvm_domain()))
>         return 1;
> 
>     return 0;
> }
> 
> 
> Actually, as domain type on Arm is always XEN_HVM_DOMAIN, we could probably
> have the following on Arm:
> 
> int arch_has_restricted_virtio_memory_access(void)
> {
>     return IS_ENABLED(CONFIG_XEN_VIRTIO);
> }
> 
> but I would prefer not to diverge and use common
> xen_has_restricted_virtio_memory_access().
> 
> Any thoughts?

Yes, I would also prefer not to diverge between the x86 and arm versions
of xen_has_restricted_virtio_memory_access. But what case are we trying
to catch with (xen_pv_domain() || xen_hvm_domain()) ? Even on x86, it is
not going to leave much out. Is it really meant only to exclude pvh
domains?

I have the feeling that we could turn this check into:

static inline int xen_has_restricted_virtio_memory_access(void)
{
    return IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain();
}

even on x86, but one of the xen/x86 maintainers should confirm.
--8323329-171909756-1650308130=:915916--

