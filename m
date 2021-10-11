Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9664298CB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 23:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206602.362212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma2mS-00087N-Fj; Mon, 11 Oct 2021 21:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206602.362212; Mon, 11 Oct 2021 21:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma2mS-00084L-Ch; Mon, 11 Oct 2021 21:24:20 +0000
Received: by outflank-mailman (input) for mailman id 206602;
 Mon, 11 Oct 2021 21:24:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ma2mR-00084F-3V
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 21:24:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e59145ba-33d9-4552-a6f3-cd028a09fcb8;
 Mon, 11 Oct 2021 21:24:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9103560EFE;
 Mon, 11 Oct 2021 21:24:16 +0000 (UTC)
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
X-Inumbo-ID: e59145ba-33d9-4552-a6f3-cd028a09fcb8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633987457;
	bh=CiZm7U3N/x/vTwC/JxzgyXPM3FhIs2K6dPxDgM1T6wY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o9CAahxveeKrIG2CEQUPMZP3Trolha0lgwN65h7HCfGfjzYNe3pmZc4RAkkm2gwTN
	 1Dqsp+r+pqDnEsfjKQzcXmYFadjnun0PUflXmrowAwL1wMQzBZRKljY8MIjQAIQb18
	 EANV8abYT7b+igPQwZQYMmyFFhP5DHELH4w4p031PPXTEbIjuv6ICnfkK0rLXrEolY
	 5EtuD6ADgvSSBE/KeDsleI0adoPSwBOGBW+IC4fBBETs7iflwZnhkQQl1zOKM87Goj
	 dqz0HIwCC3Kiu1zDh+KnyWinEaENnJwoornO+0Qp8qCSZ/RSF7exjgCXbyhJnz0XIa
	 sZW8hGR09N+oA==
Date: Mon, 11 Oct 2021 14:24:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 2/2] arm/efi: load dom0 modules from DT using UEFI
In-Reply-To: <alpine.DEB.2.21.2110111415350.25528@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2110111423310.25528@sstabellini-ThinkPad-T480s>
References: <20211011181528.17367-1-luca.fancellu@arm.com> <20211011181528.17367-3-luca.fancellu@arm.com> <alpine.DEB.2.21.2110111243290.25528@sstabellini-ThinkPad-T480s> <EC7165F9-09CE-4001-93ED-FA637F5ED36C@arm.com>
 <alpine.DEB.2.21.2110111415350.25528@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-389585025-1633987456=:25528"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-389585025-1633987456=:25528
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 11 Oct 2021, Stefano Stabellini wrote:
> On Mon, 11 Oct 2021, Luca Fancellu wrote:
> > > On 11 Oct 2021, at 20:53, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > 
> > > On Mon, 11 Oct 2021, Luca Fancellu wrote:
> > >> Add support to load Dom0 boot modules from
> > >> the device tree using the xen,uefi-binary property.
> > >> 
> > >> Update documentation about that.
> > >> 
> > >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > > 
> > 
> > Hi Stefano,
> > 
> > > Unfortunately, due to the change to the previous patch, this patch now
> > > has one issue, see below.
> > > 
> > > 
> > >> @@ -754,6 +760,41 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> > >>         return ERROR_SET_REG_PROPERTY;
> > >>     }
> > >> 
> > >> +    if ( !is_domu_module )
> > >> +    {
> > >> +        if ( (fdt_node_check_compatible(fdt, module_node_offset,
> > >> +                                    "multiboot,kernel") == 0) )
> > >> +        {
> > >> +            /*
> > >> +            * This is the Dom0 kernel, wire it to the kernel variable because it
> > >> +            * will be verified by the shim lock protocol later in the common
> > >> +            * code.
> > >> +            */
> > >> +            if ( kernel.addr )
> > >> +            {
> > >> +                PrintMessage(L"Dom0 kernel already found in cfg file.");
> > >> +                return ERROR_DOM0_ALREADY_FOUND;
> > >> +            }
> > >> +            kernel.need_to_free = false; /* Freed using the module array */
> > >> +            kernel.addr = file->addr;
> > >> +            kernel.size = file->size;
> > >> +        }
> > >> +        else if ( ramdisk.addr &&
> > >> +                  (fdt_node_check_compatible(fdt, module_node_offset,
> > >> +                                             "multiboot,ramdisk") == 0) )
> > >> +        {
> > >> +            PrintMessage(L"Dom0 ramdisk already found in cfg file.");
> > >> +            return ERROR_DOM0_RAMDISK_FOUND;
> > >> +        }
> > >> +        else if ( xsm.addr &&
> > >> +                  (fdt_node_check_compatible(fdt, module_node_offset,
> > >> +                                             "xen,xsm-policy") == 0) )
> > >> +        {
> > >> +            PrintMessage(L"XSM policy already found in cfg file.");
> > >> +            return ERROR_XSM_ALREADY_FOUND;
> > >> +        }
> > >> +    }
> > >> +
> > >>     return 0;
> > >> }
> > >> 
> > >> @@ -793,7 +834,7 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> > >>           module_node = fdt_next_subnode(fdt, module_node) )
> > >>     {
> > >>         int ret = handle_module_node(dir_handle, module_node, addr_cells,
> > >> -                                        size_cells);
> > >> +                                     size_cells, true);
> > >>         if ( ret < 0 )
> > >>             return ret;
> > >>     }
> > >> @@ -803,7 +844,7 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> > >> 
> > >> /*
> > >>  * This function checks for xen domain nodes under the /chosen node for possible
> > >> - * domU guests to be loaded.
> > >> + * dom0 and domU guests to be loaded.
> > >>  * Returns the number of modules loaded or a negative number for error.
> > >>  */
> > >> static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> > >> @@ -830,6 +871,9 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> > >>             if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
> > >>                 return ERROR_DT_MODULE_DOMU;
> > >>         }
> > >> +        else if ( handle_module_node(dir_handle, node, addr_len, size_len,
> > >> +                                     false) < 0 )
> > >> +                 return ERROR_DT_MODULE_DOM0;
> > >>     }
> > > 
> > > handle_module_node comes with a "multiboot,module" compatible check now,
> > > which is fine for dom0less DomU modules, but it is not OK for dom0
> > > modules.
> > > 
> > > That is because it is also possible to write the dom0 modules (kernel
> > > and ramdisk) with the following compabile strings:
> > > 
> > > /chosen/dom0 compatible "xen,linux-zimage" "xen,multiboot-module"
> > > /chosen/dom0-ramdisk compatible "xen,linux-initrd" "xen,multiboot-module"
> > 
> > Oh ok I’m surprised because I think even before I was not managing any module
> > with “xen,multiboot-module”, just any multiboot,{kernel,ramdisk,device-tree}
> 
> At least by looking at the code it seemed to work before, although we
> weren't explicitly checking for this case 
> 
>  
> > > They are legacy but we are not meant to break support for them. Also
> > > third party tools might still use them -- I checked and even
> > > ImageBuilder still uses them.
> > > 
> > > One way to solve the problem is to make the "multiboot,module"
> > > compatible check at the beginning of handle_module_node conditional on
> > > !is_domu_module.
> > > 
> > > Or maybe just ignore compabible errors if !is_domu_module. Something like:
> > > 
> > > diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> > > index 840728d6c0..cbfcd55449 100644
> > > --- a/xen/arch/arm/efi/efi-boot.h
> > > +++ b/xen/arch/arm/efi/efi-boot.h
> > > @@ -721,7 +721,7 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> > >         /* Error while checking the compatible string */
> > >         return ERROR_CHECK_MODULE_COMPAT;
> > > 
> > > -    if ( module_compat != 0 )
> > > +    if ( is_domu_module && module_compat != 0 )
> > >         /* Module is not a multiboot,module */
> > >         return 0;
> > > 
> > 
> > I can be ok with this change but it means that any node under chosen that is not a “xen,domain”
> > will be handled as it is a Dom0 boot module (if it has xen,uefi-binary), is it always true?
>  
> Good point. I don't think it is a safe assumption.
> 
> 
> > Otherwise I can do these changes:
> > 
> > --- a/xen/arch/arm/efi/efi-boot.h
> > +++ b/xen/arch/arm/efi/efi-boot.h
> > @@ -721,10 +721,19 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> >          /* Error while checking the compatible string */
> >          return ERROR_CHECK_MODULE_COMPAT;
> >  
> > -    if ( module_compat != 0 )
> > +    if ( is_domu_module && (module_compat != 0) )
> >          /* Module is not a multiboot,module */
> >          return 0;
> >  
> > +    /*
> > +     * For Dom0 boot modules can be specified also using the legacy compatible
> > +     * xen,multiboot-module
> > +     */
> > +    if ( !is_domu_module && module_compat &&
> > +         (fdt_node_check_compatible(fdt, module_node_offset,
> > +                                    "xen,multiboot-module") != 0) )
> > +         return 0;
> > +
> >      /* Read xen,uefi-binary property to get the file name. */
> >      uefi_name_prop = fdt_getprop(fdt, module_node_offset, "xen,uefi-binary",
> >                                   &uefi_name_len);
> > @@ -763,7 +772,9 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> >      if ( !is_domu_module )
> >      {
> >          if ( (fdt_node_check_compatible(fdt, module_node_offset,
> > -                                    "multiboot,kernel") == 0) )
> > +                                        "multiboot,kernel") == 0) ||
> > +             (fdt_node_check_compatible(fdt, module_node_offset,
> > +                                        "xen,linux-zimage") == 0) )
> >          {
> >              /*
> >              * This is the Dom0 kernel, wire it to the kernel variable because it
> > @@ -780,8 +791,10 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> >              kernel.size = file->size;
> >          }
> >          else if ( ramdisk.addr &&
> > -                  (fdt_node_check_compatible(fdt, module_node_offset,
> > -                                             "multiboot,ramdisk") == 0) )
> > +                  ((fdt_node_check_compatible(fdt, module_node_offset,
> > +                                              "multiboot,ramdisk") == 0) ||
> > +                   (fdt_node_check_compatible(fdt, module_node_offset,
> > +                                              "xen,linux-initrd") == 0)) )
> >          {
> >              PrintMessage(L"Dom0 ramdisk already found in cfg file.");
> >              return ERROR_DOM0_RAMDISK_FOUND;
> > 
> > 
> > I would need to check for “xen,linux-zimage” and “xen,linux-initrd” however
> > to be sure the user is not specifying the kernel and ramdisk twice.
> > 
> > Please let me know if you agree or if there is some issue with them.
> 
> I have another idea: I don't think we need to actually check for
> "xen,linux-zimage" or "xen,linux-initrd" because I am pretty sure they
> were always used in conjunction with "xen,multiboot-module".
> 
> So maybe it is enough to check for:
> 
> - for dom0: "xen,multiboot-module"
> - domU: "multiboot,module"
> 
> 
> E.g.:
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 840728d6c0..076b827bdd 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -713,10 +713,12 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
>      char mod_string[24]; /* Placeholder for module@ + a 64-bit number + \0 */
>      int uefi_name_len, file_idx, module_compat;
>      module_name *file;
> +    const char *compat_string = is_domu_module ? "multiboot,module" :
> +                                "xen,multiboot-module";
>  
>      /* Check if the node is a multiboot,module otherwise return */
>      module_compat = fdt_node_check_compatible(fdt, module_node_offset,
> -                                              "multiboot,module");
> +                                              compat_string);
>      if ( module_compat < 0 )
>          /* Error while checking the compatible string */
>          return ERROR_CHECK_MODULE_COMPAT;


Well... not exactly like this because this would stop a normal
"multiboot,module" dom0 kernel from being recognized.

So we need for domU: only "multiboot,module"
For Dom0, either "multiboot,module" or "xen,multiboot-module"
--8323329-389585025-1633987456=:25528--

