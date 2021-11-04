Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3294E445B5B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 21:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221872.383790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mijmY-0003zN-Ee; Thu, 04 Nov 2021 20:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221872.383790; Thu, 04 Nov 2021 20:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mijmY-0003wN-AJ; Thu, 04 Nov 2021 20:56:22 +0000
Received: by outflank-mailman (input) for mailman id 221872;
 Thu, 04 Nov 2021 20:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqP1=PX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mijmX-0003do-7l
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 20:56:21 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8cb80b9-3db1-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 21:56:20 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1208160E98;
 Thu,  4 Nov 2021 20:56:18 +0000 (UTC)
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
X-Inumbo-ID: a8cb80b9-3db1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636059378;
	bh=36u8fpAzAfcjW9ta+qI0K6hG3z1d9HGHzCpBs72u2Q8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e9g4wzh4QwYcxjgBHjRkThwYZAOX4gMBgxCqUwz21UbzWXtzgUwlipOfNfgz5l6Eb
	 iEa54L3vcnUZNiUEN2ywSZkH6Go8zFPh6+1HpnhBtkbkbUnrILzmadhJlKWRpHLjaV
	 51vGZlSfI0hav6q3bLHfdpAjiejrieV9tcgeEeV6uSBfzaXp4nmMmg0tVDx4owxltG
	 bkEk+lhuF8zDtNup3mDD94P/Hko+tiTLIjsCJ+3C4hScPiQ6uv0e5IswlNA3fIhzYX
	 dJedVhwVjYjWSvRXUfh2A8523J2IZS+u1Ig9wnU7Ms07TCBc6hPoAjesbSlAFnDROb
	 6owqK+9gux5WA==
Date: Thu, 4 Nov 2021 13:56:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, bertrand.marquis@arm.com, 
    wei.chen@arm.com, iwj@xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
Message-ID: <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
References: <20211104141206.25153-1-luca.fancellu@arm.com> <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-122792740-1636059378=:284830"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-122792740-1636059378=:284830
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Nov 2021, Jan Beulich wrote:
> On 04.11.2021 15:12, Luca Fancellu wrote:
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -449,6 +449,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
> >      CHAR16 *pathend, *ptr;
> >      EFI_STATUS ret;
> >  
> > +    /*
> > +     * Grub2 running on top of EDK2 has been observed to supply a NULL
> > +     * DeviceHandle. We can't use that to gain access to the filesystem.
> > +     * However the system can still boot if it doesn’t require access to the
> > +     * filesystem.
> > +     */
> > +    if ( !loaded_image->DeviceHandle )
> > +        return NULL;
> > +
> >      do {
> >          EFI_FILE_IO_INTERFACE *fio;
> >  
> > @@ -581,6 +590,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
> >      EFI_STATUS ret;
> >      const CHAR16 *what = NULL;
> >  
> > +    if ( !dir_handle )
> > +        blexit(L"Error: No access to the filesystem");
> >      if ( !name )
> >          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> >      ret = dir_handle->Open(dir_handle, &FileHandle, name,
> > @@ -1333,8 +1344,18 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> >              EFI_FILE_HANDLE handle = get_parent_handle(loaded_image,
> >                                                         &file_name);
> >  
> > -            handle->Close(handle);
> > -            *argv = file_name;
> > +            if ( !handle )
> > +            {
> > +                PrintErr(L"Error retrieving image name: no filesystem access."
> > +                         L" Setting default to xen.efi");
> > +                PrintErr(newline);
> > +                *argv = L"xen.efi";
> > +            }
> > +            else
> > +            {
> > +                handle->Close(handle);
> > +                *argv = file_name;
> > +            }
> >          }
> >  
> >          name.s = get_value(&cfg, section.s, "options");
> > @@ -1369,7 +1390,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> >      /* Get the number of boot modules specified on the DT or an error (<0) */
> >      dt_modules_found = efi_check_dt_boot(dir_handle);
> >  
> > -    dir_handle->Close(dir_handle);
> > +    if ( dir_handle )
> > +        dir_handle->Close(dir_handle);
> >  
> >      if ( dt_modules_found < 0 )
> >          /* efi_check_dt_boot throws some error */
> > 
> 
> I'm sorry, but I think we need to take a step back here and revisit
> the earlier change. If that hadn't moved obtaining dir_handle out by
> one level of scope, nothing bad would have happened to the case that
> you're now trying to fix, I understand? So perhaps that part wants
> undoing, with efi_check_dt_boot() instead getting passed loaded_image.
> That way, down the call tree the needed handle can be obtained via
> another call to get_parent_handle(), and quite likely in the scenario
> you're trying to fix here execution wouldn't even make it there. This
> then wouldn't be much different to the image name retrieval calling
> get_parent_handle() a 2nd time, rather than trying to re-use
> dir_handle.
> 
> Net effect being that I think get_parent_handle() would then again
> only be called when the returned handle is actually needed, and hence
> when failure of HandleProtocol() (for DeviceHandle being NULL just
> like for any other reason) is indeed an error that needs reporting.

In my opinion the current version is good enough. Regardless, I looked
at your suggestion into details. As it took me some time to understand
it, I thought I would share the code changes that I think correspond to
what you wrote. Does everything check out?

If so, I think it looks fine, maybe a bit better than the current
version. I'll leave that to you and Luca.


diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index c3ae9751ab..9dcd8547cd 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -8,6 +8,8 @@
 #include <asm/setup.h>
 #include <asm/smp.h>
 
+extern EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
+                                                CHAR16 **leaf);
 typedef struct {
     char *name;
     unsigned int name_len;
@@ -54,7 +56,7 @@ static int handle_module_node(EFI_FILE_HANDLE dir_handle,
                               bool is_domu_module);
 static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
                                        int domain_node);
-static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
+static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
 
 #define DEVICE_TREE_GUID \
 {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
@@ -851,10 +853,14 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
  * dom0 and domU guests to be loaded.
  * Returns the number of multiboot modules found or a negative number for error.
  */
-static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
+static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
 {
     int chosen, node, addr_len, size_len;
     unsigned int i = 0, modules_found = 0;
+    EFI_FILE_HANDLE dir_handle;
+    CHAR16 *file_name;
+
+    dir_handle = get_parent_handle(loaded_image, &file_name);
 
     /* Check for the chosen node in the current DTB */
     chosen = setup_chosen_node(fdt, &addr_len, &size_len);
@@ -895,6 +901,8 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
         efi_bs->FreePool(modules[i].name);
     }
 
+    dir_handle->Close(dir_handle);
+
     return modules_found;
 }
 
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 112b7e7571..2407671a7d 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -167,7 +167,7 @@ static void __init PrintErr(const CHAR16 *s)
 }
 
 #ifndef CONFIG_HAS_DEVICE_TREE
-static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
+static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
 {
     return 0;
 }
@@ -439,8 +439,8 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
     return argc;
 }
 
-static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
-                                                CHAR16 **leaf)
+EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
+                                         CHAR16 **leaf)
 {
     static EFI_GUID __initdata fs_protocol = SIMPLE_FILE_SYSTEM_PROTOCOL;
     static CHAR16 __initdata buffer[512];
@@ -1236,9 +1236,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
     efi_arch_relocate_image(0);
 
-    /* Get the file system interface. */
-    dir_handle = get_parent_handle(loaded_image, &file_name);
-
     if ( use_cfg_file )
     {
         UINTN depth, cols, rows, size;
@@ -1251,6 +1248,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
         gop = efi_get_gop();
 
+        /* Get the file system interface. */
+        dir_handle = get_parent_handle(loaded_image, &file_name);
+
         /* Read and parse the config file. */
         if ( read_section(loaded_image, L"config", &cfg, NULL) )
             PrintStr(L"Using builtin config file\r\n");
@@ -1344,18 +1344,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
             EFI_FILE_HANDLE handle = get_parent_handle(loaded_image,
                                                        &file_name);
 
-            if ( !handle )
-            {
-                PrintErr(L"Error retrieving image name: no filesystem access."
-                         L" Setting default to xen.efi");
-                PrintErr(newline);
-                *argv = L"xen.efi";
-            }
-            else
-            {
-                handle->Close(handle);
-                *argv = file_name;
-            }
+            handle->Close(handle);
+            *argv = file_name;
         }
 
         name.s = get_value(&cfg, section.s, "options");
@@ -1383,15 +1373,14 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
         cfg.addr = 0;
 
+        dir_handle->Close(dir_handle);
+
         if ( gop && !base_video )
             gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
     }
 
     /* Get the number of boot modules specified on the DT or an error (<0) */
-    dt_modules_found = efi_check_dt_boot(dir_handle);
-
-    if ( dir_handle )
-        dir_handle->Close(dir_handle);
+    dt_modules_found = efi_check_dt_boot(loaded_image);
 
     if ( dt_modules_found < 0 )
         /* efi_check_dt_boot throws some error */
--8323329-122792740-1636059378=:284830--

