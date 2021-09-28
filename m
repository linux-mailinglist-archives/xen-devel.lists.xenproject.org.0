Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B77AC41BA8C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 00:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198517.352057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVLrT-0001bA-Gi; Tue, 28 Sep 2021 22:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198517.352057; Tue, 28 Sep 2021 22:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVLrT-0001Ye-Dm; Tue, 28 Sep 2021 22:46:07 +0000
Received: by outflank-mailman (input) for mailman id 198517;
 Tue, 28 Sep 2021 22:46:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVLrR-0001YY-48
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 22:46:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6603ce58-ea49-47b4-bc35-cfa249efeed0;
 Tue, 28 Sep 2021 22:46:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDC1060F4F;
 Tue, 28 Sep 2021 22:46:01 +0000 (UTC)
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
X-Inumbo-ID: 6603ce58-ea49-47b4-bc35-cfa249efeed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632869161;
	bh=iYhQyp0qqty8xbtUNQeFlurSIIW0Kb9Ood31Of3E/PA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eLGt8Y6E66B38X00n8TBeKPC6aNPOU9ovUW0Qm3BdAy+RZzy2ICThNA2YbwoBSuCx
	 IP7DJ4uMlUWva7ye9hCEecFKjOA20YafUFiGFpDfnBhCW3ixkszF4uOZk/2n3Tt/eR
	 Uya1Dla7V2/FlVZFBCxty8hpNathlL5AnzRdU6jNsClUW6ZKK6meDwjl3KhgioTgGy
	 oF+7d+ha/C9eNY9zylCHfO0baHhd+3IDjojq/CCGR9w4dWTUZfayVO3l+3CdqMuQx0
	 mhMc6Bre8L//PtJIiwDG6b6aAHfMlKvcNQM4KShWo7LYfiSVkjwTeblDp5IlHwIAbi
	 1+qbpt1q0sCNQ==
Date: Tue, 28 Sep 2021 15:46:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/3] arm/efi: load dom0 modules from DT using UEFI
In-Reply-To: <20210928163209.49611-4-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2109281534480.5022@sstabellini-ThinkPad-T480s>
References: <20210928163209.49611-1-luca.fancellu@arm.com> <20210928163209.49611-4-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Luca Fancellu wrote:
> Add support to load Dom0 boot modules from
> the device tree using the uefi,binary property.
> 
> Update documentation about that.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

It is great how simple this patch is!

The patch looks all correct. Only one question: do we need a check to
make sure the dom0 ramdisk is not loaded twice? Once via uefi,binary and
another time via the config file? In other words...

> ---
> Changes in v3:
> - new patch
> ---
>  docs/misc/arm/device-tree/booting.txt |  8 ++++
>  docs/misc/efi.pandoc                  | 64 +++++++++++++++++++++++++--
>  xen/arch/arm/efi/efi-boot.h           | 36 +++++++++++++--
>  xen/common/efi/boot.c                 | 12 ++---
>  4 files changed, 108 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 354bb43fe1..e73f6476d4 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -70,6 +70,14 @@ Each node contains the following properties:
>  	priority of this field vs. other mechanisms of specifying the
>  	bootargs for the kernel.
>  
> +- uefi,binary (UEFI boot only)
> +
> +	String property that specifies the file name to be loaded by the UEFI
> +	boot for this module. If this is specified, there is no need to specify
> +	the reg property because it will be created by the UEFI stub on boot.
> +	This option is needed only when UEFI boot is used, the node needs to be
> +	compatible with multiboot,kernel or multiboot,ramdisk.
> +
>  Examples
>  ========
>  
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 800e67a233..4cebc47a18 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -167,6 +167,28 @@ sbsign \
>  	--output xen.signed.efi \
>  	xen.unified.efi
>  ```
> +## UEFI boot and Dom0 modules on ARM
> +
> +When booting using UEFI on ARM, it is possible to specify the Dom0 modules
> +directly from the device tree without using the Xen configuration file, here an
> +example:
> +
> +chosen {
> +	#size-cells = <0x1>;
> +	#address-cells = <0x1>;
> +	xen,xen-bootargs = "[Xen boot arguments]"
> +
> +	module@1 {
> +		compatible = "multiboot,kernel", "multiboot,module";
> +		uefi,binary = "vmlinuz-3.0.31-0.4-xen";
> +		bootargs = "[domain 0 command line options]";
> +	};
> +
> +	module@2 {
> +		compatible = "multiboot,ramdisk", "multiboot,module";
> +		uefi,binary = "initrd-3.0.31-0.4-xen";
> +	};
> +}
>  
>  ## UEFI boot and dom0less on ARM
>  
> @@ -326,10 +348,10 @@ chosen {
>  ### Boot Xen, Dom0 and DomU(s)
>  
>  This configuration is a mix of the two configuration above, to boot this one
> -the configuration file must be processed so the /chosen node must have the
> -"uefi,cfg-load" property.
> +the configuration file can be processed or the Dom0 modules can be read from
> +the device tree.
>  
> -Here an example:
> +Here the first example:
>  
>  Xen configuration file:
>  
> @@ -369,4 +391,40 @@ chosen {
>  };
>  ```
>  
> +Here the second example:
> +
> +Device tree:
> +
> +```
> +chosen {
> +	#size-cells = <0x1>;
> +	#address-cells = <0x1>;
> +	xen,xen-bootargs = "[Xen boot arguments]"
> +
> +	module@1 {
> +		compatible = "multiboot,kernel", "multiboot,module";
> +		uefi,binary = "vmlinuz-3.0.31-0.4-xen";
> +		bootargs = "[domain 0 command line options]";
> +	};
> +
> +	module@2 {
> +		compatible = "multiboot,ramdisk", "multiboot,module";
> +		uefi,binary = "initrd-3.0.31-0.4-xen";
> +	};
> +
> +	domU1 {
> +		#size-cells = <0x1>;
> +		#address-cells = <0x1>;
> +		compatible = "xen,domain";
> +		cpus = <0x1>;
> +		memory = <0x0 0xc0000>;
> +		vpl011;
>  
> +		module@1 {
> +			compatible = "multiboot,kernel", "multiboot,module";
> +			uefi,binary = "Image-domu1.bin";
> +			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
> +		};
> +	};
> +};
> +```
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 4f7c913f86..df63387136 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -31,8 +31,10 @@ static unsigned int __initdata modules_idx;
>  #define ERROR_MISSING_DT_PROPERTY   (-3)
>  #define ERROR_RENAME_MODULE_NAME    (-4)
>  #define ERROR_SET_REG_PROPERTY      (-5)
> +#define ERROR_DOM0_ALREADY_FOUND    (-6)
>  #define ERROR_DT_MODULE_DOMU        (-1)
>  #define ERROR_DT_CHOSEN_NODE        (-2)
> +#define ERROR_DT_MODULE_DOM0        (-3)
>  
>  void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
>  void __flush_dcache_area(const void *vaddr, unsigned long size);
> @@ -45,7 +47,8 @@ static int allocate_module_file(EFI_FILE_HANDLE dir_handle,
>  static int handle_module_node(EFI_FILE_HANDLE dir_handle,
>                                int module_node_offset,
>                                int reg_addr_cells,
> -                              int reg_size_cells);
> +                              int reg_size_cells,
> +                              bool is_domu_module);
>  static bool is_boot_module(int dt_module_offset);
>  static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>                                         int domain_node);
> @@ -701,7 +704,8 @@ static int __init allocate_module_file(EFI_FILE_HANDLE dir_handle,
>  static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
>                                       int module_node_offset,
>                                       int reg_addr_cells,
> -                                     int reg_size_cells)
> +                                     int reg_size_cells,
> +                                     bool is_domu_module)
>  {
>      const void *uefi_name_prop;
>      char mod_string[24]; /* Placeholder for module@ + a 64-bit number + \0 */
> @@ -743,6 +747,24 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
>          return ERROR_SET_REG_PROPERTY;
>      }
>  
> +    if ( !is_domu_module &&
> +         (fdt_node_check_compatible(fdt, module_node_offset,
> +                                    "multiboot,kernel") == 0) )
> +    {
> +        /*
> +         * This is the Dom0 kernel, wire it to the kernel variable because it
> +         * will be verified by the shim lock protocol later in the common code.
> +         */
> +        if ( kernel.addr )
> +        {
> +            PrintMessage(L"Dom0 kernel already found in cfg file.");
> +            return ERROR_DOM0_ALREADY_FOUND;
> +        }
> +        kernel.need_to_free = false; /* Freed using the module array */
> +        kernel.addr = file->addr;
> +        kernel.size = file->size;
> +    }

... is it necessary to update ramdisk as well or check if it is already
set? As far as I can tell it is the only other potential conflict that
we could have.


>      return 0;
>  }
>  
> @@ -799,7 +821,7 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>          if ( is_boot_module(module_node) )
>          {
>              int ret = handle_module_node(dir_handle, module_node, addr_cells,
> -                                         size_cells);
> +                                         size_cells, true);
>              if ( ret < 0 )
>                  return ret;
>          }
> @@ -809,7 +831,7 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>  
>  /*
>   * This function checks for xen domain nodes under the /chosen node for possible
> - * domU guests to be loaded.
> + * dom0 and domU guests to be loaded.
>   * Returns the number of modules loaded or a negative number for error.
>   */
>  static int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> @@ -836,6 +858,12 @@ static int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>              if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
>                  return ERROR_DT_MODULE_DOMU;
>          }
> +        else if ( is_boot_module(node) )
> +        {
> +            if ( handle_module_node(dir_handle, node, addr_len, size_len,
> +                                    false) < 0 )
> +                return ERROR_DT_MODULE_DOM0;
> +        }
>      }
>  
>      /* Free dom0less file names if any */
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index c8c57fbb54..b221494a06 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1296,11 +1296,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          {
>              read_file(dir_handle, s2w(&name), &kernel, option_str);
>              efi_bs->FreePool(name.w);
> -
> -            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> -                            (void **)&shim_lock)) &&
> -                 (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
> -                PrintErrMesg(L"Dom0 kernel image could not be verified", status);
>          }
>  
>          if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
> @@ -1372,6 +1367,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>      if (dt_module_found < 0)
>          /* efi_arch_check_dt_boot throws some error */
>          blexit(L"Error processing boot modules on DT.");
> +
> +    /* If Dom0 is specified, verify it */
> +    if ( kernel.ptr &&
> +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> +                                           (void **)&shim_lock)) &&
> +        (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
> +        PrintErrMesg(L"Dom0 kernel image could not be verified", status);
>      /*
>       * Check if a proper configuration is provided to start Xen:
>       *  - Dom0 specified (minimum required)
> -- 
> 2.17.1
> 

