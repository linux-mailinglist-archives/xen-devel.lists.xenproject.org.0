Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB942410153
	for <lists+xen-devel@lfdr.de>; Sat, 18 Sep 2021 00:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189739.339608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRMQ6-0006V9-VT; Fri, 17 Sep 2021 22:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189739.339608; Fri, 17 Sep 2021 22:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRMQ6-0006TL-SO; Fri, 17 Sep 2021 22:33:22 +0000
Received: by outflank-mailman (input) for mailman id 189739;
 Fri, 17 Sep 2021 22:33:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WA1=OH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mRMQ5-0006TD-DU
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 22:33:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da4fecf4-eb70-4bb1-9217-4ed0e6ee9673;
 Fri, 17 Sep 2021 22:33:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED8186112E;
 Fri, 17 Sep 2021 22:33:16 +0000 (UTC)
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
X-Inumbo-ID: da4fecf4-eb70-4bb1-9217-4ed0e6ee9673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631917997;
	bh=hwjaTeuJO6RsTxtk9kcnXZVC5SKxYYbdPQCB8BSkpoc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LPvhv4qXBlnp4x1lLUb4FQfEfIDBVGCYN5sZtOODcv6yy1yugBS1WRZbQ2q10s0ca
	 O80D1Do68zr69RlOY3jln9OHMIRNcDJZc88o4Chy7SNv/kJ6rrQu6r1xboK6dGWw/u
	 +k3Mt9Um5fXgwbeucbyR1ENeJ2B9lqpIdbK1vGpm6mengr9rcXnNpzSnv2xvyEoYgI
	 3cFGR+ShQ7xq+pXyed4mTpMdcoTdcnirfx4Rwb6k6xWML4N33X4iW/0n+UqnyzT15L
	 uKrD/DBMVWWKgDZ24qIZkFwoMiEshVObqq2j+OdoXsYdeAom4GrAadmywSeqqjcPyU
	 40Qy5s1/iuGQQ==
Date: Fri, 17 Sep 2021 15:33:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
In-Reply-To: <28787ACF-F70E-49C8-B3E2-CFCE8E9B6AA7@arm.com>
Message-ID: <alpine.DEB.2.21.2109171516270.21985@sstabellini-ThinkPad-T480s>
References: <20210915142602.42862-1-luca.fancellu@arm.com> <20210915142602.42862-3-luca.fancellu@arm.com> <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com> <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com> <5bfb2544-402b-d6e1-9a8a-027e36a60acd@suse.com>
 <29091674-DCAE-4289-901E-9158FD029D96@arm.com> <125df38d-ac1f-c4a3-2ef9-1ce0f03e77c6@suse.com> <alpine.DEB.2.21.2109161255040.21985@sstabellini-ThinkPad-T480s> <28787ACF-F70E-49C8-B3E2-CFCE8E9B6AA7@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-264986810-1631917997=:21985"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-264986810-1631917997=:21985
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 17 Sep 2021, Luca Fancellu wrote:
> > On 16 Sep 2021, at 21:16, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 16 Sep 2021, Jan Beulich wrote:
> >> On 16.09.2021 17:07, Luca Fancellu wrote:
> >>> I explain here my understanding on dom0less, this feature is used to start domUs at
> >>> Xen boot in parallel, the name is misleading but it doesn’t require dom0 to be absent.
> >>> 
> >>> So if you have a dom0 kernel embed in the image, it's completely fine to start it and it 
> >>> doesn’t have to be skipped.
> >>> 
> >>> Here the possible user cases:
> >>> 1) start only dom0 [dom0 modules on xen.cfg or embedded in Xen image]
> >>> 2) start only domUs, true dom0less [no dom0 modules on xen.cfg or embedded in Xen image, domUs on DT]
> >>> 3) start dom0 and domUs [(dom0 modules on xen.cfg or embedded in Xen image) and domUs on DT]
> >> 
> >> If that's the intention - fine. Stefano?
> > 
> 
> Hi Stefano,
> 
> > What do you mean by dom0 modules embedded in the Xen image? I am not
> > familiar with it, but I imagine it doesn't involve any multiboot,module
> > nodes in device tree, right?
> > 
> > Putting aside "dom0 modules embedded in Xen image" that I didn't fully
> > understand, there are three ways to load Dom0:
> > 
> > - dom0 kernel (and ramdisk, optional) on xen.cfg
> > - dom0 kernel (and ramdisk, optional) on device tree using the "reg" property
> > - dom0 kernel (and ramdisk, optional) on device tree using the "uefi,binary" property
> 
> True for the #1 and #2, the last one is not implemented. The uefi,binary property
> for now is only used to load domU modules.

Yeah, it is no problem that is not currently implemented, but from a
device tree binding / efi interface perspective it should be possible.

 
> > Then, the other use cases are:
> > 
> > - true dom0less, domUs on device tree using the "reg" property
> > - true dom0less, domUs on device tree using the "uefi,binary" property
> > 
> > And of course all the possible combinations between Dom0 and DomU
> > loading.
> > 
> > 
> > Currently, patch #1 checks for the presence of a Dom0 kernel node and, if
> > present, it decides not to proceed with xen.cfg. So if the Dom0 kernel
> > node is *not* present, efi_arch_use_config_file returns true.
> > 
> > However, this could be a true dom0less configuration without any Dom0
> > kernel. If so, you might not want to load xen.cfg at all because it is
> > not needed. In a true dom0less configuration, we probably want
> > efi_arch_use_config_file to return false.
> 
> In a true dom0less configuration we might need to read xen.cfg to retrieve the
> Xen command line, 

The Xen command line could also be on device tree
(/chosen/xen,xen-bootargs).


> but following the actual implementation of the common code
> there is more. I’m going to explain.
> 
> What efi_arch_use_config_file really does is not only choosing to read xen.cfg
> or not. Following the common code (xen/common/efi/boot.c) and what its result activate
> along the path, it basically decides if the UEFI stub is used as a loader from filesystem
> or not. We need the UEFI stub as a loader to be 100% UEFI and load our modules.
>
> The original check basically says “if there are multiboot,module in the DT, then some
> bootloader has loaded in memory the required modules so I’m not gonna load anything
> from the filesystem because I assume it puts everything in place for me to boot.”

OK, I am following. It looks like this is the source of the issue.

 
> >From misc/efi.txt:
> When booted as an EFI application, Xen requires a configuration file as described below unless a bootloader,
> such as GRUB, has loaded the modules and describes them in the device tree provided to Xen. If a bootloader
> provides a device tree containing modules then any configuration files are ignored, and the bootloader is
> responsible for populating all relevant device tree nodes.
> 
> What I’m doing in patch #1 is restricting that check to just the multiboot,module that are
> Dom0 module, why? Because with the introduction of dom0less we need to specify
> multiboot,modules for domUs, but the presence or not of dom0 modules is the only
> Information we need to understand if the user decided to start Xen with everything
> in places (modules in memory, xen command line, dtb) or if the job is demanded to the
> UEFI stub and its configuration file.

I don't think so. Imagine a case where the user has everything in device
tree, doesn't need xen.cfg, but dom0 and domUs are specified as
uefi,binary.

We don't want xen.cfg but we do want to be able to load files from the
filesystem. This might not be currently implemented but from an bindings
perspective it should be possible.


> By the configuration file you can also load in memory the Xen dtb, so Xen can
> be started as an EFI application without the DTB and then load it using the EFI stub.

This can be very useful but it would follow the !fdt check and return
true from efi_arch_use_config_file. So it doesn't really conflict with
anything we would around multiboot,module and xen,cfg-loading.


> I’m not against this new property “xen,cfg-loading”, I just think it is not needed because
> we have all the information we need without it and in any case we need to read the
> configuration file because otherwise we won’t have access to the Xen command line.

We don't necessarely need to read the Xen command line from xen.cfg :-)


> Now I’m going to show you examples of all use cases that are valid with the introduction
> of this serie:
> 
> 1) Start Xen as EFI application and load only Dom0
> 
>     Xen.cfg:
>     [global]
>     default=xen_dom0
> 
>     [xen_dom0]
>     options=<Xen command line>
>     kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>     ramdisk=initrd-3.0.31-0.4-xen
>     dtb=<xen DTB>
> 
>     DT:
>     {no modification}
> 
> 2) Start Xen as EFI application to load a true dom0less setup
> 
>     Xen.cfg:
>     [global]
>     default=xen_true_dom0less
> 
>     [xen_true_dom0less]
>     options=<Xen command line>
>     dtb=<xen DTB>
> 
>     DT:
>     chosen {
>         #size-cells = <0x1>;
> 	#address-cells = <0x1>;
> 
> 	domU1 {
>             #size-cells = <0x1>; 
>             #address-cells = <0x1>;
>             compatible = "xen,domain”;
>             cpus = <1>;
>             memory = <0 0xC0000>;
>            
>             module@1 {
>                 compatible = "multiboot,kernel", "multiboot,module”;
>                 bootargs = "console=ttyAMA0 root=/dev/ram0 rw”;
>                 uefi,binary = “domU_kernel1.bin"
>             };
> 
>             module@2 {
>                 compatible = “multiboot,ramdisk", "multiboot,module”;
>                 uefi,binary = “domU_ramdisk1.bin"
>             };
> 
>             module@3 {
>                 compatible = "multiboot,device-tree", "multiboot,module”;
>                 uefi,binary = “domU_passthrough1.dtb"
>             }; 
>         };
>         
>         domU2 { <as above> };
>     }
> 
> 3) Start Xen as EFI application to load Dom0 and DomUs
> 
>     Xen.cfg:
>     [global]
>     default=xen_dom0_domUs
> 
>     [xen_dom0_domUs]
>     options=<Xen command line>
>     kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>     ramdisk=initrd-3.0.31-0.4-xen
>     dtb=<xen DTB>
> 
>     DT:
>     chosen {
>         #size-cells = <0x1>;
> 	#address-cells = <0x1>;
> 
> 	domU1 {
>             #size-cells = <0x1>; 
>             #address-cells = <0x1>;
>             compatible = "xen,domain”;
>             cpus = <1>;
>             memory = <0 0xC0000>;
>            
>             module@1 {
>                 compatible = "multiboot,kernel", "multiboot,module”;
>                 bootargs = "console=ttyAMA0 root=/dev/ram0 rw”;
>                 uefi,binary = “domU_kernel1.bin"
>             };
> 
>             module@2 {
>                 compatible = “multiboot,ramdisk", "multiboot,module”;
>                 uefi,binary = “domU_ramdisk1.bin"
>             };
> 
>             module@3 {
>                 compatible = "multiboot,device-tree", "multiboot,module”;
>                 uefi,binary = “domU_passthrough1.dtb"
>             }; 
>         };
>         
>         domU2 { <as above> };
>     }
> 
> So as you see every case is covered without the introduction of the
> property.
> 
> Please let me know what do you think.

I think that from an interface perspective (not a code perspective) we
need to be able to account for cases like:

4) Start Xen as EFI application and load only Dom0
no Xen.cfg
DT:
  xen,xen-bootargs
  dom0/uefi,binary
  domUs/uefi,binary


But in any case, even disregarding this case, past experience has taught
me that it is always better to have an explicit flag to trigger a new
behavior, rather than relying on "guesswork". If we introduce
"xen,cfg-loading", we are going to be a lot more future-proof that if we
don't introduce it in terms of backward and forward compatibility in
case we need to change anything.
--8323329-264986810-1631917997=:21985--

