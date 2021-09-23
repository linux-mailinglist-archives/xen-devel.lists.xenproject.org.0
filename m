Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324404163C3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 19:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194504.346505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTS4L-0007u1-GB; Thu, 23 Sep 2021 16:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194504.346505; Thu, 23 Sep 2021 16:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTS4L-0007sD-D0; Thu, 23 Sep 2021 16:59:33 +0000
Received: by outflank-mailman (input) for mailman id 194504;
 Thu, 23 Sep 2021 16:59:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTS4J-0007s7-7u
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 16:59:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9dda70aa-1c8f-11ec-ba67-12813bfff9fa;
 Thu, 23 Sep 2021 16:59:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D16FF60F43;
 Thu, 23 Sep 2021 16:59:28 +0000 (UTC)
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
X-Inumbo-ID: 9dda70aa-1c8f-11ec-ba67-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632416369;
	bh=1qSkwmGiBJ/LOLd7+ISnhDLvK4uxCuXn7rSgFt0fOaQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bGczcaJ3Vpz761wfat5RBG4kgrQAev60iow7cTNS3zhaSNh6yPkdt1yyGnkXIhgv3
	 VZeFWdb+XhCD0DUO3YI2pZGggQIgtyUgmT4rTXMiZVWBUL4BaUUIwmN3P6v/H/fZ4V
	 O4B/tXuOENgOKUExUqs0XRwhbw825H3+iQCH6R2EdHKplDhhLTkfbm4WvUJnj6fJMa
	 cyDKrvYPu4qRPWiLsQqhDM3P5YanlAuU0ExUJRG00tr3jBxdaK8qNuyXaA4X3+OJ87
	 puSTTaQS27QVpJOx2dkngNCNP25Wig7RV0ka+5ylIQvRDNObjh1yzTCvIq877Ma5/t
	 oybsANrq9WnfQ==
Date: Thu, 23 Sep 2021 09:59:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] arm/efi: Use dom0less configuration when using
 EFI boot
In-Reply-To: <2C0E480C-DF1C-4AAD-89F5-99D52B016970@arm.com>
Message-ID: <alpine.DEB.2.21.2109230943510.17979@sstabellini-ThinkPad-T480s>
References: <20210922141341.42288-1-luca.fancellu@arm.com> <20210922141341.42288-3-luca.fancellu@arm.com> <alpine.DEB.2.21.2109221430210.17979@sstabellini-ThinkPad-T480s> <2C0E480C-DF1C-4AAD-89F5-99D52B016970@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1527541655-1632416369=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1527541655-1632416369=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 23 Sep 2021, Luca Fancellu wrote:
> >> +/*
> >> + * Binaries will be translated into bootmodules, the maximum number for them is
> >> + * MAX_MODULES where we should remove a unit for Xen and one for Xen DTB
> >> + */
> >> +#define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
> >> +static struct file __initdata dom0less_file;
> >> +static dom0less_module_name __initdata dom0less_modules[MAX_DOM0LESS_MODULES];
> >> +static unsigned int __initdata dom0less_modules_available =
> >> +                               MAX_DOM0LESS_MODULES;
> >> +static unsigned int __initdata dom0less_modules_idx;
> > 
> > This is a lot better!
> > 
> > We don't need both dom0less_modules_idx and dom0less_modules_available.
> > You can just do:
> > 
> > #define dom0less_modules_available (MAX_DOM0LESS_MODULES - dom0less_modules_idx)
> > static unsigned int __initdata dom0less_modules_idx;
> > 
> > But maybe we can even get rid of dom0less_modules_available entirely?
> > 
> > We can change the check at the beginning of allocate_dom0less_file to:
> > 
> > if ( dom0less_modules_idx == dom0less_modules_available )
> >    blexit
> > 
> > Would that work?
> 
> I thought about it but I think they need to stay, because dom0less_modules_available is the
> upper bound for the additional dom0less modules (it is decremented each time a dom0 module
> Is added), instead dom0less_modules_idx is the typical index for the array of dom0less modules.

[...]


> >> +    /*
> >> +     * Check if there is any space left for a domU module, the variable
> >> +     * dom0less_modules_available is updated each time we use read_file(...)
> >> +     * successfully.
> >> +     */
> >> +    if ( !dom0less_modules_available )
> >> +        blexit(L"No space left for domU modules");
> > 
> > This is the check that could be based on dom0less_modules_idx
> > 
> 
> The only way I see to have it based on dom0less_modules_idx will be to compare it
> to the amount of modules still available, that is not constant because it is dependent
> on how many dom0 modules are loaded, so still two variables needed.
> Don’t know if I’m missing something.

I think I understand where the confusion comes from. I am appending a
small patch to show what I had in mind. We are already accounting for
Xen and the DTB when declaring MAX_DOM0LESS_MODULES (MAX_MODULES - 2).
The other binaries are the Dom0 kernel and ramdisk, however, in my setup
they don't trigger a call to handle_dom0less_module_node because they
are compatible xen,linux-zimage and xen,linux-initrd.

However, the Dom0 kernel and ramdisk can be also compatible
multiboot,kernel and multiboot,ramdisk. If that is the case, then they
would indeed trigger a call to handle_dom0less_module_node.

I think that is not a good idea: a function called
handle_dom0less_module_node should only be called for dom0less modules
(domUs) and not dom0.

But from the memory consumption point of view, it would be better
actually to catch dom0 modules too as you intended. In that case we need to:

- add a check for xen,linux-zimage and xen,linux-initrd in
  handle_dom0less_module_node also

- rename handle_dom0less_domain_node, handle_dom0less_module_node,
  dom0less_file, dom0less_modules, dom0less_modules_idx to something
  else more generic


For instance they could be called:

handle_domain_node
handle_module_node
module_file
modules
modules_idx




diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index e2b007ece0..812d0bd607 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -22,8 +22,6 @@ typedef struct {
 #define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
 static struct file __initdata dom0less_file;
 static dom0less_module_name __initdata dom0less_modules[MAX_DOM0LESS_MODULES];
-static unsigned int __initdata dom0less_modules_available =
-                               MAX_DOM0LESS_MODULES;
 static unsigned int __initdata dom0less_modules_idx;
 
 #define ERROR_DOM0LESS_FILE_NOT_FOUND (-1)
@@ -592,14 +590,6 @@ static void __init efi_arch_handle_module(const struct file *file,
          * stop here.
          */
         blexit(L"Unknown module type");
-
-    /*
-     * dom0less_modules_available is decremented here because for each dom0
-     * file added, there will be an additional bootmodule, so the number
-     * of dom0less module files will be decremented because there is
-     * a maximum amount of bootmodules that can be loaded.
-     */
-    dom0less_modules_available--;
 }
 
 /*
@@ -643,7 +633,7 @@ static unsigned int __init allocate_dom0less_file(EFI_FILE_HANDLE dir_handle,
      * dom0less_modules_available is updated each time we use read_file(...)
      * successfully.
      */
-    if ( !dom0less_modules_available )
+    if ( dom0less_modules_idx == MAX_DOM0LESS_MODULES )
         blexit(L"No space left for domU modules");
 
     module_name.s = (char*) name;
--8323329-1527541655-1632416369=:17979--

