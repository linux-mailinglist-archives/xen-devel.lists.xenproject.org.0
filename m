Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37781444ADF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 23:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221168.382739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miOlZ-0005C6-EJ; Wed, 03 Nov 2021 22:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221168.382739; Wed, 03 Nov 2021 22:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miOlZ-00059E-A3; Wed, 03 Nov 2021 22:29:57 +0000
Received: by outflank-mailman (input) for mailman id 221168;
 Wed, 03 Nov 2021 22:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5wz0=PW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1miOlX-000594-Cv
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 22:29:55 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90465336-3cf5-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 23:29:53 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9AA4610FD;
 Wed,  3 Nov 2021 22:29:51 +0000 (UTC)
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
X-Inumbo-ID: 90465336-3cf5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635978592;
	bh=RpM3sDRhsehYphyelFM8Wrph+g6XSbrv+fqZR8ZQy8Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uJBZiB0KEP4/4SmtDScqQs+MjiDZQKWim4aU9BSpen3sohf2ZfcNPfcph7XHkSeJs
	 KHRSa1gtzPCfUvApJBETV2tcrtCiXiMe+NP4K8vpqx8wT2YNYNy5nckZ4jB2hljtlL
	 FkbQh7E2uad/W/hWmKMtGUuoFcmWpDDU0Pb07nYfkrYWB0GX8OrYiyQfK1u+mSC9up
	 p5OMadWQV0PVaBmimh59YBOTQorIm9TvBKn3mY48BufWDD7E4lJPYZxz8INvgqqZmb
	 ilpnjd4DyOQOIWbNK2bQo1oZoaaHm3Fi43wBLeS6Y80CXzkJk1U4KuLIBquCBVZLhZ
	 X1KBzFcQk3JfQ==
Date: Wed, 3 Nov 2021 15:29:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <67A7B343-8230-49C5-91CA-18C0E2ACDEF3@arm.com>
Message-ID: <alpine.DEB.2.22.394.2111031526150.267621@ubuntu-linux-20-04-desktop>
References: <20211102140511.5542-1-luca.fancellu@arm.com> <alpine.DEB.2.21.2111021610180.18170@sstabellini-ThinkPad-T480s> <67A7B343-8230-49C5-91CA-18C0E2ACDEF3@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1876138409-1635978591=:267621"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1876138409-1635978591=:267621
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 3 Nov 2021, Luca Fancellu wrote:
> > On 2 Nov 2021, at 23:17, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Tue, 2 Nov 2021, Luca Fancellu wrote:
> >> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b882
> >> ("arm/efi: Use dom0less configuration when using EFI boot") is
> >> introducing a problem to boot Xen using Grub2 on ARM machine using EDK2.
> >> 
> >> The problem comes from the function get_parent_handle(...) that inside
> >> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
> >> is NULL, making Xen stop the UEFI boot.
> >> 
> >> Before the commit above, the function was never called because the
> >> logic was skipping the call when there were multiboot modules in the
> >> DT because the filesystem was never used and the bootloader had
> >> put in place all the right modules in memory and the addresses
> >> in the DT.
> >> 
> >> To fix the problem we allow the get_parent_handle(...) function to
> >> return a NULL handle on error and we check the usage of the function
> >> to handle the new use case. The function in fact should not prevent
> >> the boot even if the filesystem can't be used, because the DT and
> >> the modules could be put in place by the bootloader before running
> >> Xen and if xen,uefi-binary property is not used, there is no need
> >> for the filesystem.
> >> 
> >> Another problem is found when the UEFI stub tries to check if Dom0
> >> image or DomUs are present.
> >> The logic doesn't work when the UEFI stub is not responsible to load
> >> any modules, so the efi_check_dt_boot(...) return value is modified
> >> to return the number of multiboot module found and not only the number
> >> of module loaded by the stub.
> >> 
> >> Fixes: a1743fc3a9 ("arm/efi: Use dom0less configuration when using EFI boot")
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >> ---
> >> Justification for integration in 4.16:
> >> Upside: allow booting xen from grub on arm64 when the stub doesn't load
> >>        any module.
> >> Downside: It's affecting the EFI boot path.
> >> Risk: It's not affecting x86 arch that works the same way as before.
> >>      If something is wrong it creates a problem on early boot and not at
> >>      runtime, so risk is low.
> >> 
> >> Tested in this configurations:
> >> - Bootloader loads modules and specify them as multiboot modules in DT:
> >>   * combination of Dom0, DomUs, Dom0 and DomUs
> >> - DT specifies multiboot modules in DT using xen,uefi-binary property:
> >>   * combination of Dom0, DomUs, Dom0 and DomUs
> >> - Bootloader loads a Dom0 module and appends it as multiboot module in DT,
> >>   other multiboot modules are listed for DomUs using xen,uefi-binary
> >> - No multiboot modules in DT and no kernel entry in cfg file:
> >>   * proper error thrown
> >> 
> >> ---
> >> xen/arch/arm/efi/efi-boot.h | 28 ++++++++++++++++++----------
> >> xen/common/efi/boot.c       | 15 ++++++++++++++-
> >> 2 files changed, 32 insertions(+), 11 deletions(-)
> >> 
> >> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> >> index 8b88dd26a5..e714b2b44c 100644
> >> --- a/xen/arch/arm/efi/efi-boot.h
> >> +++ b/xen/arch/arm/efi/efi-boot.h
> >> @@ -51,9 +51,11 @@ static int handle_module_node(EFI_FILE_HANDLE dir_handle,
> >>                               int module_node_offset,
> >>                               int reg_addr_cells,
> >>                               int reg_size_cells,
> >> -                              bool is_domu_module);
> >> +                              bool is_domu_module,
> >> +                              unsigned int *modules_found);
> >> static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> >> -                                       int domain_node);
> >> +                                       int domain_node,
> >> +                                       unsigned int *modules_found);
> >> static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
> >> 
> >> #define DEVICE_TREE_GUID \
> >> @@ -707,7 +709,8 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> >>                                      int module_node_offset,
> >>                                      int reg_addr_cells,
> >>                                      int reg_size_cells,
> >> -                                     bool is_domu_module)
> >> +                                     bool is_domu_module,
> >> +                                     unsigned int *modules_found)
> >> {
> >>     const void *uefi_name_prop;
> >>     char mod_string[24]; /* Placeholder for module@ + a 64-bit number + \0 */
> >> @@ -725,6 +728,9 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> >>         /* Module is not a multiboot,module */
> >>         return 0;
> >> 
> >> +    /* Count the multiboot module as found */
> >> +    (*modules_found)++;
> >> +
> >>     /* Read xen,uefi-binary property to get the file name. */
> >>     uefi_name_prop = fdt_getprop(fdt, module_node_offset, "xen,uefi-binary",
> >>                                  &uefi_name_len);
> >> @@ -804,7 +810,8 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> >>  * Returns 0 on success, negative number on error.
> >>  */
> >> static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> >> -                                              int domain_node)
> >> +                                              int domain_node,
> >> +                                              unsigned int *modules_found)
> >> {
> >>     int module_node, addr_cells, size_cells, len;
> >>     const struct fdt_property *prop;
> >> @@ -834,7 +841,7 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> >>           module_node = fdt_next_subnode(fdt, module_node) )
> >>     {
> >>         int ret = handle_module_node(dir_handle, module_node, addr_cells,
> >> -                                     size_cells, true);
> >> +                                     size_cells, true, modules_found);
> >>         if ( ret < 0 )
> >>             return ret;
> >>     }
> >> @@ -845,12 +852,12 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> >> /*
> >>  * This function checks for xen domain nodes under the /chosen node for possible
> >>  * dom0 and domU guests to be loaded.
> >> - * Returns the number of modules loaded or a negative number for error.
> >> + * Returns the number of multiboot modules found or a negative number for error.
> >>  */
> >> static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> >> {
> >>     int chosen, node, addr_len, size_len;
> >> -    unsigned int i = 0;
> >> +    unsigned int i = 0, modules_found = 0;
> >> 
> >>     /* Check for the chosen node in the current DTB */
> >>     chosen = setup_chosen_node(fdt, &addr_len, &size_len);
> >> @@ -868,11 +875,12 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> >>         if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
> >>         {
> >>             /* Found a node with compatible xen,domain; handle this node. */
> >> -            if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
> >> +            if ( handle_dom0less_domain_node(dir_handle, node,
> >> +                                             &modules_found) < 0 )
> >>                 return ERROR_DT_MODULE_DOMU;
> >>         }
> >>         else if ( handle_module_node(dir_handle, node, addr_len, size_len,
> >> -                                     false) < 0 )
> >> +                                     false, &modules_found) < 0 )
> >>                  return ERROR_DT_MODULE_DOM0;
> > 
> > I think there is no need to add modules_found to the parameters of
> > handle_dom0less_domain_node and handle_module_node. You could just
> > increment modules_found here for every iteration of the loop where
> > there is no error.  You would have to change a couple of returns in
> > handle_module_node, just to give you the idea:
> 
> Yes we could do that but when we handle a xen,domain node we will count
> only one module and that defeats the aim to count every multiboot,module.
> 
> If we want to continue with your proposal let me know and I will implement it.

Not necessarely. We could make the change that both
handle_dom0less_domain_node and handle_module_node return:

- < 0 on error
- 0 on nothing to do
- the number of modules on success (currently this is also 0)

In the dom0less case, if one of the modules returns error, we should
return error as we already do today.


> > diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> > index e714b2b44c..7739789c41 100644
> > --- a/xen/arch/arm/efi/efi-boot.h
> > +++ b/xen/arch/arm/efi/efi-boot.h
> > @@ -726,7 +726,7 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> > 
> >     if ( module_compat != 0 )
> >         /* Module is not a multiboot,module */
> > -        return 0;
> > +        return 1;
> > 
> >     /* Count the multiboot module as found */
> >     (*modules_found)++;
> > @@ -737,7 +737,7 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> > 
> >     if ( !uefi_name_prop )
> >         /* Property not found */
> > -        return 0;
> > +        return 1;
> > 
> >     file_idx = get_module_file_index(uefi_name_prop, uefi_name_len);
> >     if ( file_idx < 0 )
> > 
> > 
> >>     }
> >> 
> >> @@ -883,7 +891,7 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> >>         efi_bs->FreePool(modules[i].name);
> >>     }
> >> 
> >> -    return modules_idx;
> >> +    return modules_found;
> >> }
> >> 
> >> static void __init efi_arch_cpu(void)
> >> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> >> index 392ff3ac9b..495e7a4096 100644
> >> --- a/xen/common/efi/boot.c
> >> +++ b/xen/common/efi/boot.c
> >> @@ -449,6 +449,13 @@ static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
> >>     CHAR16 *pathend, *ptr;
> >>     EFI_STATUS ret;
> >> 
> >> +    /*
> >> +     * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PROTOCOL
> >> +     * to have access to the filesystem.
> >> +     */
> >> +    if ( !loaded_image->DeviceHandle )
> >> +        return NULL;
> >> +
> >>     do {
> >>         EFI_FILE_IO_INTERFACE *fio;
> >> 
> >> @@ -581,6 +588,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
> >>     EFI_STATUS ret;
> >>     const CHAR16 *what = NULL;
> >> 
> >> +    if ( !dir_handle )
> >> +        blexit(L"Error: No access to the filesystem");
> >>     if ( !name )
> >>         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> >>     ret = dir_handle->Open(dir_handle, &FileHandle, name,
> >> @@ -1333,6 +1342,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> >>             EFI_FILE_HANDLE handle = get_parent_handle(loaded_image,
> >>                                                        &file_name);
> >> 
> >> +            if ( !handle )
> >> +                blexit(L"Error retrieving image name: no filesystem access");
> > 
> > I think it would be nice to have an other explicit check like this one
> > at the beginning of if ( use_cfg_file ) to make sure dir_handle is not
> > null in that case. If I am not mistaken, if we take the use_cfg_file
> > path, dir_handle has to be valid, right?
> 
> Dir_handle could be invalid and we would be able to boot successfully when we take everywhere
> the path using read_section, for that reason I didn’t stop the boot earlier.
> Given Jan suggestion that check could be also modified to be something like “if there is no handle, *argv=“xen.efi” "
> so the boot can continue without problem if we don’t need to read anything from the filesystem.

OK
--8323329-1876138409-1635978591=:267621--

