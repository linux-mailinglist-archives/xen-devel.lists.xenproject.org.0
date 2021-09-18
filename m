Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A5E410226
	for <lists+xen-devel@lfdr.de>; Sat, 18 Sep 2021 02:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189759.339635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRNrw-0000zC-VZ; Sat, 18 Sep 2021 00:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189759.339635; Sat, 18 Sep 2021 00:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRNrw-0000x3-SE; Sat, 18 Sep 2021 00:06:12 +0000
Received: by outflank-mailman (input) for mailman id 189759;
 Sat, 18 Sep 2021 00:06:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgpN=OI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mRNrv-0000wx-5A
 for xen-devel@lists.xenproject.org; Sat, 18 Sep 2021 00:06:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39fec4b6-1814-11ec-b742-12813bfff9fa;
 Sat, 18 Sep 2021 00:06:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92C1161164;
 Sat, 18 Sep 2021 00:06:08 +0000 (UTC)
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
X-Inumbo-ID: 39fec4b6-1814-11ec-b742-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631923569;
	bh=NPLabLNTVNuhRxRzuKO9eoANfe1U0WU4IO68gQjGKoc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ENzvoWYvZVw7btIl8cwgL86MPVhZJTMgHFsQdkm0JRZ4c368Ts33vuLbaM6okoszg
	 whwMfy+wSpCMXL3ZZwnWGuuPqsprYZZ3WtgL8siDrz7gpURnEkq9lLWIK5U5bwvHbI
	 gBHefva0sbQ5cZpO5Abqhc+EcmUrIdJcjbO/UDjBS48OnBP4cLSc0EZcPom8KxMVm8
	 snYh3snzyGyfhj7fCNF0ZWRbzdZnXIoWIInHtqGfOjdkEzjZWxPyDFp+TSzj3y51AS
	 T8GieKeJ5FtXf0OpD1JIECu++GOPHBkWv/FCaEghI1UvhJMgTjQFy/o2/Z7voxhua5
	 WF1sC/7wUR55Q==
Date: Fri, 17 Sep 2021 17:06:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
In-Reply-To: <CDC5AD61-D71B-46BC-952B-DE592879F9F3@arm.com>
Message-ID: <alpine.DEB.2.21.2109171630460.21985@sstabellini-ThinkPad-T480s>
References: <20210915142602.42862-1-luca.fancellu@arm.com> <20210915142602.42862-3-luca.fancellu@arm.com> <alpine.DEB.2.21.2109151721210.21985@sstabellini-ThinkPad-T480s> <CDC5AD61-D71B-46BC-952B-DE592879F9F3@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Sep 2021, Luca Fancellu wrote:
> > On 16 Sep 2021, at 02:16, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 15 Sep 2021, Luca Fancellu wrote:
> >> This patch introduces the support for dom0less configuration
> >> when using UEFI boot on ARM, it permits the EFI boot to
> >> continue if no dom0 kernel is specified but at least one domU
> >> is found.
> >> 
> >> Introduce the new property "uefi,binary" for device tree boot
> >> module nodes that are subnode of "xen,domain" compatible nodes.
> >> The property holds a string containing the file name of the
> >> binary that shall be loaded by the uefi loader from the filesystem.
> >> 
> >> Update efi documentation about how to start a dom0less
> >> setup using UEFI
> >> 
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >> ---
> >> docs/misc/efi.pandoc        |  37 ++++++
> >> xen/arch/arm/efi/efi-boot.h | 244 +++++++++++++++++++++++++++++++++++-
> >> xen/common/efi/boot.c       |  20 ++-
> >> 3 files changed, 294 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> >> index ac3cd58cae..db9b3273f8 100644
> >> --- a/docs/misc/efi.pandoc
> >> +++ b/docs/misc/efi.pandoc
> >> @@ -165,3 +165,40 @@ sbsign \
> >> 	--output xen.signed.efi \
> >> 	xen.unified.efi
> >> ```
> >> +
> >> +## UEFI boot and dom0less on ARM
> >> +
> >> +Dom0less feature is supported by ARM and it is possible to use it when Xen is
> >> +started as an EFI application.
> >> +The way to specify the domU domains is by Device Tree as specified in the
> >> +[dom0less](dom0less.html) documentation page under the "Device Tree
> >> +configuration" section, but instead of declaring the reg property in the boot
> >> +module, the user must specify the "uefi,binary" property containing the name
> >> +of the binary file that has to be loaded in memory.
> >> +The UEFI stub will load the binary in memory and it will add the reg property
> >> +accordingly.
> >> +
> >> +An example here:
> >> +
> >> +    domU1 {
> >> +        #address-cells = <1>;
> >> +        #size-cells = <1>;
> >> +        compatible = "xen,domain";
> >> +        memory = <0 0x20000>;
> >> +        cpus = <1>;
> >> +        vpl011;
> >> +
> >> +        module@1 {
> >> +            compatible = "multiboot,kernel", "multiboot,module";
> >> +            uefi,binary = "vmlinuz-3.0.31-0.4-xen";
> >> +            bootargs = "console=ttyAMA0";
> >> +        };
> >> +        module@2 {
> >> +            compatible = "multiboot,ramdisk", "multiboot,module";
> >> +            uefi,binary = "initrd-3.0.31-0.4-xen";
> >> +        };
> >> +        module@3 {
> >> +            compatible = "multiboot,ramdisk", "multiboot,module";
> >> +            uefi,binary = "passthrough.dtb";
> >> +        };
> >> +    };
> > 
> > Can you please also update docs/misc/arm/device-tree/booting.txt ?
> > Either a link to docs/misc/efi.pandoc or a definition of the uefi,binary
> > property (mentioning that it is EFI-only.)
> 
> Yes I will update it.
> 
> > 
> > 
> >> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> >> index 5ff626c6a0..8d7ced70f2 100644
> >> --- a/xen/arch/arm/efi/efi-boot.h
> >> +++ b/xen/arch/arm/efi/efi-boot.h
> >> @@ -8,9 +8,39 @@
> >> #include <asm/setup.h>
> >> #include <asm/smp.h>
> >> 
> >> +typedef struct {
> >> +    char* name;
> >> +    int name_len;
> >> +} dom0less_module_name;
> >> +
> >> +/*
> >> + * Binaries will be translated into bootmodules, the maximum number for them is
> >> + * MAX_MODULES where we should remove a unit for Xen and one for Xen DTB
> >> + */
> >> +#define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
> >> +static struct file __initdata dom0less_files[MAX_DOM0LESS_MODULES];
> >> +static dom0less_module_name __initdata dom0less_bin_names[MAX_DOM0LESS_MODULES];
> > 
> > I suggest a slightly different model where we don't call AllocatePool to
> > allocate dom0less_module_name.name and instead we just set the pointer
> > directly to the fdt string. There is no risk of the fdt going away at
> > this point so it should be safe to use.
> 
> Yes I thought about this approach but since I was not sure how the DTB behaves when we modify
> It to add the reg property or to modify the module name, then I used this other approach.
> Are you sure that the pointed memory will stay the same after we modify the DTB? My main concern
> was that the DTB structure was going to be modified and the string I was pointing in the DTB memory
> can be relocated elsewhere. 

You are right: fdt_set_name and fdt_set_reg can cause a memmove to be
called, which might change the pointers. Which means we cannot simply
set the char* pointer to the device tree string as it might change.
That's unfortunate. For the lack of a better suggestion, go ahead and
keep AllocatePool/FreePool for the next version.

