Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9C544B4FD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 22:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224106.387194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkZ34-0003oL-Oo; Tue, 09 Nov 2021 21:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224106.387194; Tue, 09 Nov 2021 21:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkZ34-0003ln-Kq; Tue, 09 Nov 2021 21:52:58 +0000
Received: by outflank-mailman (input) for mailman id 224106;
 Tue, 09 Nov 2021 21:52:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkZ33-0003lh-8J
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 21:52:57 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61da705e-41a7-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 22:52:55 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AEA961184;
 Tue,  9 Nov 2021 21:52:48 +0000 (UTC)
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
X-Inumbo-ID: 61da705e-41a7-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636494769;
	bh=4XUko2H5+cFh+91UeQ2RXl+TI0hc4F9tXTbDOewfhzA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XnuIG8y6vYzYb5K2etoFJkInBKnNejwyst69L0+0KNiYTfIFsrSGooqq3onN172Ma
	 mFSDegNs6IReo6tkmlGZ/7gP0K1gPhpJe4fyFj+uVy1t2WAhVFEHiRqxXH1jCIuOOY
	 hnZ8m4gqAbya8odL8eSv6U51B1o62nBWDO6zVCr98qbZcG9mABbUSpX8kbVV7dZPcz
	 UZS0Cam/etQofqxSHGVbJqWRyh0mWJj6q+0IXaZnWAEri8RrtDB19wWEH4mweiVNyC
	 dtVcmGFHGVtYa3nkbVPBtgqftATYwjsm+9TPBXSk2xyenwy9qlNR4x1r/ZAFV4+bIw
	 i/9MIExup0qkw==
Date: Tue, 9 Nov 2021 13:52:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
References: <20211104141206.25153-1-luca.fancellu@arm.com> <81685961-501e-7a41-6f6f-bc4491645264@suse.com> <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop> <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop> <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com> <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop> <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop> <9bd58aa4-602b-4c64-e759-581513909457@suse.com> <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop> <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Nov 2021, Jan Beulich wrote:
> On 09.11.2021 03:11, Stefano Stabellini wrote:
> > On Mon, 8 Nov 2021, Jan Beulich wrote:
> >> On 05.11.2021 16:33, Stefano Stabellini wrote:
> >>> My main concern is performance and resource utilization. With v3 of the
> >>> patch get_parent_handle will get called for every module to be loaded.
> >>> With dom0less, it could easily get called 10 times or more. Taking a
> >>> look at get_parent_handle, the Xen side doesn't seem small and I have
> >>> no idea how the EDK2 side looks. I am just worried that it would
> >>> actually have an impact on boot times (also depending on the bootloader
> >>> implementation).
> >>
> >> The biggest part of the function deals with determining the "residual" of
> >> the file name. That part looks to be of no interest at all to
> >> allocate_module_file() (whether that's actually correct I can't tell). I
> >> don't see why this couldn't be made conditional (e.g. by passing in NULL
> >> for "leaf").
> > 
> > I understand the idea of passing NULL instead of "leaf", but I tried
> > having a look and I can't tell what we would be able to skip in
> > get_parent_handle.
> 
> My bad - I did overlook that dir_handle gets updated even past the
> initial loop.
> 
> > Should we have a global variable to keep the dir_handle open during
> > dom0less module loading?
> 
> If that's contained within Arm-specific code, I (obviously) don't mind.
> Otherwise I remain to be convinced.

I think we can do something decent entirely within
xen/arch/arm/efi/efi-boot.h.

Luca, see below as reference; it is untested and incomplete but should
explain the idea better than words. With the below, we only open/close
the handle once for the all dom0less modules.


diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 458cfbbed4..b5218d5228 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -24,6 +24,7 @@ static struct file __initdata module_binary;
 static module_name __initdata modules[MAX_UEFI_MODULES];
 static unsigned int __initdata modules_available = MAX_UEFI_MODULES;
 static unsigned int __initdata modules_idx;
+static EFI_FILE_HANDLE __initdata dir_handle;
 
 #define ERROR_BINARY_FILE_NOT_FOUND (-1)
 #define ERROR_ALLOC_MODULE_NO_SPACE (-1)
@@ -651,9 +652,7 @@ static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
                                        const char *name,
                                        unsigned int name_len)
 {
-    EFI_FILE_HANDLE dir_handle;
     module_name *file_name;
-    CHAR16 *fname;
     union string module_name;
     int ret;
 
@@ -685,14 +684,9 @@ static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
     strlcpy(file_name->name, name, name_len + 1);
     file_name->name_len = name_len;
 
-    /* Get the file system interface. */
-    dir_handle = get_parent_handle(loaded_image, &fname);
-
     /* Load the binary in memory */
     read_file(dir_handle, s2w(&module_name), &module_binary, NULL);
 
-    dir_handle->Close(dir_handle);
-
     /* Save address and size */
     file_name->addr = module_binary.addr;
     file_name->size = module_binary.size;
@@ -862,6 +856,7 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
 {
     int chosen, node, addr_len, size_len;
     unsigned int i = 0, modules_found = 0;
+    CHAR16 *fname;
 
     /* Check for the chosen node in the current DTB */
     chosen = setup_chosen_node(fdt, &addr_len, &size_len);
@@ -871,6 +866,8 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
         return ERROR_DT_CHOSEN_NODE;
     }
 
+    dir_handle = get_parent_handle(loaded_image, &fname);
+
     /* Check for nodes compatible with xen,domain under the chosen node */
     for ( node = fdt_first_subnode(fdt, chosen);
           node > 0;
@@ -902,6 +899,8 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
         efi_bs->FreePool(modules[i].name);
     }
 
+    if ( dir_handle )
+        dir_handle->Close(dir_handle);
     return modules_found;
 }
 

