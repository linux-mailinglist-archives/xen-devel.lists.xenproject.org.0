Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7FE4297C6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 21:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206536.362133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma1MU-0004Me-6S; Mon, 11 Oct 2021 19:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206536.362133; Mon, 11 Oct 2021 19:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma1MU-0004JZ-2p; Mon, 11 Oct 2021 19:53:26 +0000
Received: by outflank-mailman (input) for mailman id 206536;
 Mon, 11 Oct 2021 19:53:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ma1MS-0004JT-KF
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 19:53:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e43827a4-2acc-11ec-80f4-12813bfff9fa;
 Mon, 11 Oct 2021 19:53:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8434A60F5B;
 Mon, 11 Oct 2021 19:53:22 +0000 (UTC)
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
X-Inumbo-ID: e43827a4-2acc-11ec-80f4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633982002;
	bh=x6nuLNNO0CSS+lqXe6rR81flILAADJkHmjOTAhqx8cM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BZRm0oFwrZO9qGHaPZqbXrFSgjE89zt273wrOYUeu8q44op3iTpUGBlYwUgO3nyV0
	 CR9WpEm6jHX336DJHXXncyREZNTnBqzg6/VpvuwKJjrEMIcha9/rJ222CA0fjFQbe9
	 icleOSYMA29PNBFs9FGvfuMgjlGvBmnDUTlob9syf8Hn4twIXbRjoctovn3WF1/V2m
	 aBhXljw/J6Sk8DwlAN0HEgFx8c93OdUSI7N9cYjB9inEylKfS1KvglHQJK1IO+iVIZ
	 VhmCzbfs4sl7rEsPogSVfJCI4VOh8p7eZcb+Y/x7Euim6VN7LjFJNlPbcskRKhLfz9
	 VEFfJyS9CWzLg==
Date: Mon, 11 Oct 2021 12:53:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 2/2] arm/efi: load dom0 modules from DT using UEFI
In-Reply-To: <20211011181528.17367-3-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2110111243290.25528@sstabellini-ThinkPad-T480s>
References: <20211011181528.17367-1-luca.fancellu@arm.com> <20211011181528.17367-3-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Oct 2021, Luca Fancellu wrote:
> Add support to load Dom0 boot modules from
> the device tree using the xen,uefi-binary property.
> 
> Update documentation about that.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Unfortunately, due to the change to the previous patch, this patch now
has one issue, see below.


> @@ -754,6 +760,41 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
>          return ERROR_SET_REG_PROPERTY;
>      }
>  
> +    if ( !is_domu_module )
> +    {
> +        if ( (fdt_node_check_compatible(fdt, module_node_offset,
> +                                    "multiboot,kernel") == 0) )
> +        {
> +            /*
> +            * This is the Dom0 kernel, wire it to the kernel variable because it
> +            * will be verified by the shim lock protocol later in the common
> +            * code.
> +            */
> +            if ( kernel.addr )
> +            {
> +                PrintMessage(L"Dom0 kernel already found in cfg file.");
> +                return ERROR_DOM0_ALREADY_FOUND;
> +            }
> +            kernel.need_to_free = false; /* Freed using the module array */
> +            kernel.addr = file->addr;
> +            kernel.size = file->size;
> +        }
> +        else if ( ramdisk.addr &&
> +                  (fdt_node_check_compatible(fdt, module_node_offset,
> +                                             "multiboot,ramdisk") == 0) )
> +        {
> +            PrintMessage(L"Dom0 ramdisk already found in cfg file.");
> +            return ERROR_DOM0_RAMDISK_FOUND;
> +        }
> +        else if ( xsm.addr &&
> +                  (fdt_node_check_compatible(fdt, module_node_offset,
> +                                             "xen,xsm-policy") == 0) )
> +        {
> +            PrintMessage(L"XSM policy already found in cfg file.");
> +            return ERROR_XSM_ALREADY_FOUND;
> +        }
> +    }
> +
>      return 0;
>  }
>  
> @@ -793,7 +834,7 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>            module_node = fdt_next_subnode(fdt, module_node) )
>      {
>          int ret = handle_module_node(dir_handle, module_node, addr_cells,
> -                                        size_cells);
> +                                     size_cells, true);
>          if ( ret < 0 )
>              return ret;
>      }
> @@ -803,7 +844,7 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>  
>  /*
>   * This function checks for xen domain nodes under the /chosen node for possible
> - * domU guests to be loaded.
> + * dom0 and domU guests to be loaded.
>   * Returns the number of modules loaded or a negative number for error.
>   */
>  static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> @@ -830,6 +871,9 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>              if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
>                  return ERROR_DT_MODULE_DOMU;
>          }
> +        else if ( handle_module_node(dir_handle, node, addr_len, size_len,
> +                                     false) < 0 )
> +                 return ERROR_DT_MODULE_DOM0;
>      }

handle_module_node comes with a "multiboot,module" compatible check now,
which is fine for dom0less DomU modules, but it is not OK for dom0
modules.

That is because it is also possible to write the dom0 modules (kernel
and ramdisk) with the following compabile strings:

/chosen/dom0 compatible "xen,linux-zimage" "xen,multiboot-module"
/chosen/dom0-ramdisk compatible "xen,linux-initrd" "xen,multiboot-module"

They are legacy but we are not meant to break support for them. Also
third party tools might still use them -- I checked and even
ImageBuilder still uses them.

One way to solve the problem is to make the "multiboot,module"
compatible check at the beginning of handle_module_node conditional on
!is_domu_module.

Or maybe just ignore compabible errors if !is_domu_module. Something like:

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 840728d6c0..cbfcd55449 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -721,7 +721,7 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
         /* Error while checking the compatible string */
         return ERROR_CHECK_MODULE_COMPAT;
 
-    if ( module_compat != 0 )
+    if ( is_domu_module && module_compat != 0 )
         /* Module is not a multiboot,module */
         return 0;
 

