Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EAE415313
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 23:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193109.343961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTA9m-0002Db-Ht; Wed, 22 Sep 2021 21:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193109.343961; Wed, 22 Sep 2021 21:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTA9m-0002B9-Dm; Wed, 22 Sep 2021 21:51:58 +0000
Received: by outflank-mailman (input) for mailman id 193109;
 Wed, 22 Sep 2021 21:51:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTA9l-0002B3-E4
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 21:51:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d24572a-1bef-11ec-b9eb-12813bfff9fa;
 Wed, 22 Sep 2021 21:51:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAB5060F24;
 Wed, 22 Sep 2021 21:51:53 +0000 (UTC)
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
X-Inumbo-ID: 4d24572a-1bef-11ec-b9eb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632347514;
	bh=O3nmDTs7JcZl+ngCNmYPU2k++1e7RYgX2tsBYicvZ8I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eNclAZjJ4tKOK7vKdmKcNnAE2WiNJamlEXIOAwknYI85U/ibr03h6z1RFdtBsJTXk
	 vGQa0J86jInj1Ol/xMafU91hFe9LE9hGCg1GMzTyrPbrP+74Ovnfyq3EH9aqzpF8zv
	 ZgBfDkKIHV//PN3+tY216ywcTaNa7+AbxUTKNu6JHGDXtqtRUQJzc7N4wkG1j2W5sf
	 vxnENX1feo+O61/MRAHDHtu3PfpNOWL3eKdx4m0IOYYB05N1BIoG68wNhuUrAXDyKn
	 Lgv+loHVgLirruooWtfGxQ0X7rCTD/RHmc6KmmEoeDm530iFbvIHtoZNdc594Ij+ZJ
	 VFC0xzCKysggw==
Date: Wed, 22 Sep 2021 14:51:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] arm/efi: Use dom0less configuration when using
 EFI boot
In-Reply-To: <20210922141341.42288-3-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2109221430210.17979@sstabellini-ThinkPad-T480s>
References: <20210922141341.42288-1-luca.fancellu@arm.com> <20210922141341.42288-3-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Luca Fancellu wrote:
> This patch introduces the support for dom0less configuration
> when using UEFI boot on ARM, it permits the EFI boot to
> continue if no dom0 kernel is specified but at least one domU
> is found.
> 
> Introduce the new property "uefi,binary" for device tree boot
> module nodes that are subnode of "xen,domain" compatible nodes.
> The property holds a string containing the file name of the
> binary that shall be loaded by the uefi loader from the filesystem.
> 
> Update efi documentation about how to start a dom0less
> setup using UEFI
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Overall the patch is pretty good. I don't have any major concerns (only
one about the documentation). Some minor comments below.


> ---
> Changes in v2:
> - remove array of struct file
> - fixed some int types
> - Made the code use filesystem even when configuration
> file is skipped.
> - add documentation of uefi,binary in booting.txt
> - add documentation on how to boot all configuration
> for Xen using UEFI in efi.pandoc
> ---
>  docs/misc/arm/device-tree/booting.txt |  21 +++
>  docs/misc/efi.pandoc                  | 203 ++++++++++++++++++++
>  xen/arch/arm/efi/efi-boot.h           | 257 +++++++++++++++++++++++++-
>  xen/arch/x86/efi/efi-boot.h           |   6 +
>  xen/common/efi/boot.c                 |  36 ++--
>  5 files changed, 508 insertions(+), 15 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 44cd9e1a9a..bc0f8913db 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -182,6 +182,13 @@ The kernel sub-node has the following properties:
>  
>      Command line parameters for the guest kernel.
>  
> +- efi,binary (UEFI boot only)

Below it is actually uefi,binary, not efi,binary. I would use
uefi,binary consistently.


> +    Specifies the file name to be loaded by the UEFI boot for this module. If
> +    this is specified, there is no need to specify the reg property because it
> +    will be created by the UEFI stub on boot.
> +    This option is needed only when UEFI boot is used.

We need to specify that this parameter is a string.


>  The ramdisk sub-node has the following properties:
>  
>  - compatible
> @@ -193,6 +200,13 @@ The ramdisk sub-node has the following properties:
>      Specifies the physical address of the ramdisk in RAM and its
>      length.
>  
> +- efi,binary (UEFI boot only)
> +
> +    Specifies the file name to be loaded by the UEFI boot for this module. If
> +    this is specified, there is no need to specify the reg property because it
> +    will be created by the UEFI stub on boot.
> +    This option is needed only when UEFI boot is used.

same here

>  
>  Example
>  =======
> @@ -257,6 +271,13 @@ The dtb sub-node should have the following properties:
>      Specifies the physical address of the device tree binary fragment
>      RAM and its length.
>  
> +- efi,binary (UEFI boot only)
> +
> +    Specifies the file name to be loaded by the UEFI boot for this module. If
> +    this is specified, there is no need to specify the reg property because it
> +    will be created by the UEFI stub on boot.
> +    This option is needed only when UEFI boot is used.

same here


>  As an example:
>  
>          module@0xc000000 {
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index e289c5e7ba..698196e129 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -167,3 +167,206 @@ sbsign \
>  	--output xen.signed.efi \
>  	xen.unified.efi
>  ```
> +
> +## UEFI boot and dom0less on ARM
> +
> +Dom0less feature is supported by ARM and it is possible to use it when Xen is
> +started as an EFI application.
> +The way to specify the domU domains is by Device Tree as specified in the
> +[dom0less](dom0less.html) documentation page under the "Device Tree
> +configuration" section, but instead of declaring the reg property in the boot
> +module, the user must specify the "uefi,binary" property containing the name
> +of the binary file that has to be loaded in memory.
> +The UEFI stub will load the binary in memory and it will add the reg property
> +accordingly.
> +
> +An example here:
> +
> +domU1 {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "xen,domain";
> +	memory = <0 0x20000>;
> +	cpus = <1>;
> +	vpl011;
> +
> +	module@1 {
> +		compatible = "multiboot,kernel", "multiboot,module";
> +		uefi,binary = "vmlinuz-3.0.31-0.4-xen";
> +		bootargs = "console=ttyAMA0";
> +	};
> +	module@2 {
> +		compatible = "multiboot,ramdisk", "multiboot,module";
> +		uefi,binary = "initrd-3.0.31-0.4-xen";
> +	};
> +	module@3 {
> +		compatible = "multiboot,ramdisk", "multiboot,module";
> +		uefi,binary = "passthrough.dtb";
> +	};
> +};
> +
> +## How to boot different Xen setup using UEFI
> +
> +Here the supported user cases for Xen when UEFI boot is used:

"Supported" means different things to different people, so I would say
instead:

These are the different ways to boot a Xen system from UEFI:


> +
> + - Boot Xen and Dom0 (minimum required)
> + - Boot Xen and DomU(s) (true dom0less, only on ARM)
> + - Boot Xen, Dom0 and DomU(s) (only on ARM)
> +
> +### Boot Xen and Dom0
> +
> +This configuration can be started using the Xen configuration file in the
> +example above.
> +
> +### Boot Xen and DomU(s)
> +
> +This configuration needs the domU domain(s) specified in the /chosen node,
> +examples of how to do that are provided by the documentation about dom0less
> +and the example above shows how to use the "uefi,binary" property to use the
> +UEFI stub for module loading.
> +Providing the multiboot modules in the device tree, make Xen skip its UEFI
> +configuration file, if it is needed for some reason, specify the "uefi,cfg-load"
> +property in the /chosen node.

This last sentence is not very clear and it looks like one needs to
specify "uefi,cfg-load" to skip the Xen config file when actually it is
the opposite. I would suggest instead:

When adding DomU modules to device tree, also add the property
uefi,cfg-load under chosen to have Xen load the Xen config file.
Otherwise, Xen will skip the config file and rely on device tree alone.


> +Example 1 of how to boot a true dom0less configuration:
> +
> +Xen configuration file: skipped.
> +
> +Device tree:
> +
> +```
> +chosen {
> +	#size-cells = <0x1>;
> +	#address-cells = <0x1>;
> +	xen,xen-bootargs = "<Xen command line>"
> +
> +	domU1 {
> +		#size-cells = <0x1>;
> +		#address-cells = <0x1>;
> +		compatible = "xen,domain";
> +		cpus = <0x1>;
> +		memory = <0x0 0xc0000>;
> +		vpl011;
> +
> +		module@1 {
> +			compatible = "multiboot,kernel", "multiboot,module";
> +			uefi,binary = "Image-domu1.bin";
> +			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
> +		};
> +	};
> +	domU2 {
> +		#size-cells = <0x1>;
> +		#address-cells = <0x1>;
> +		compatible = "xen,domain";
> +		cpus = <0x1>;
> +		memory = <0x0 0x100000>;
> +		vpl011;
> +
> +		module@2 {
> +			compatible = "multiboot,kernel", "multiboot,module";
> +			uefi,binary = "Image-domu2.bin";
> +			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
> +		};
> +	};
> +};
> +```
> +
> +Example 2 of how to boot a true dom0less configuration:
> +
> +Xen configuration file:
> +
> +```
> +[global]
> +default=xen
> +
> +[xen]
> +options=<Xen command line>
> +dtb=<optional DTB>
> +```
> +
> +Device tree:
> +
> +```
> +chosen {
> +	#size-cells = <0x1>;
> +	#address-cells = <0x1>;
> +	uefi,cfg-load;
> +
> +	domU1 {
> +		#size-cells = <0x1>;
> +		#address-cells = <0x1>;
> +		compatible = "xen,domain";
> +		cpus = <0x1>;
> +		memory = <0x0 0xc0000>;
> +		vpl011;
> +
> +		module@1 {
> +			compatible = "multiboot,kernel", "multiboot,module";
> +			uefi,binary = "Image-domu1.bin";
> +			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
> +		};
> +	};
> +	domU2 {
> +		#size-cells = <0x1>;
> +		#address-cells = <0x1>;
> +		compatible = "xen,domain";
> +		cpus = <0x1>;
> +		memory = <0x0 0x100000>;
> +		vpl011;
> +
> +		module@2 {
> +			compatible = "multiboot,kernel", "multiboot,module";
> +			uefi,binary = "Image-domu2.bin";
> +			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
> +		};
> +	};
> +};
> +```
> +
> +### Boot Xen, Dom0 and DomU(s)
> +
> +This configuration is a mix of the two configuration above, to boot this one
> +the configuration file must be processed so the /chosen node must have the
> +"uefi,cfg-load" property.
> +
> +Here an example:
> +
> +Xen configuration file:
> +
> +```
> +[global]
> +default=xen
> +
> +[xen]
> +options=<Xen command line>
> +kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
> +ramdisk=initrd-3.0.31-0.4-xen
> +dtb=<optional DTB>
> +```
> +
> +Device tree:
> +
> +```
> +chosen {
> +	#size-cells = <0x1>;
> +	#address-cells = <0x1>;
> +	uefi,cfg-load;
> +
> +	domU1 {
> +		#size-cells = <0x1>;
> +		#address-cells = <0x1>;
> +		compatible = "xen,domain";
> +		cpus = <0x1>;
> +		memory = <0x0 0xc0000>;
> +		vpl011;
> +
> +		module@1 {
> +			compatible = "multiboot,kernel", "multiboot,module";
> +			uefi,binary = "Image-domu1.bin";
> +			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
> +		};
> +	};
> +};
> +```
> +
> +
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 8ceeba4ad1..e2b007ece0 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -8,9 +8,43 @@
>  #include <asm/setup.h>
>  #include <asm/smp.h>
>  
> +typedef struct {
> +    char *name;
> +    unsigned int name_len;
> +    EFI_PHYSICAL_ADDRESS addr;
> +    UINTN size;
> +} dom0less_module_name;
> +
> +/*
> + * Binaries will be translated into bootmodules, the maximum number for them is
> + * MAX_MODULES where we should remove a unit for Xen and one for Xen DTB
> + */
> +#define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
> +static struct file __initdata dom0less_file;
> +static dom0less_module_name __initdata dom0less_modules[MAX_DOM0LESS_MODULES];
> +static unsigned int __initdata dom0less_modules_available =
> +                               MAX_DOM0LESS_MODULES;
> +static unsigned int __initdata dom0less_modules_idx;

This is a lot better!

We don't need both dom0less_modules_idx and dom0less_modules_available.
You can just do:

#define dom0less_modules_available (MAX_DOM0LESS_MODULES - dom0less_modules_idx)
static unsigned int __initdata dom0less_modules_idx;

But maybe we can even get rid of dom0less_modules_available entirely?

We can change the check at the beginning of allocate_dom0less_file to:

if ( dom0less_modules_idx == dom0less_modules_available )
    blexit

Would that work?


> +#define ERROR_DOM0LESS_FILE_NOT_FOUND (-1)
> +
>  void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
>  void __flush_dcache_area(const void *vaddr, unsigned long size);
>  
> +static int get_dom0less_file_index(const char *name, unsigned int name_len);
> +static unsigned int allocate_dom0less_file(EFI_FILE_HANDLE dir_handle,
> +                                           const char *name,
> +                                           unsigned int name_len);
> +static void handle_dom0less_module_node(EFI_FILE_HANDLE dir_handle,
> +                                        int module_node_offset,
> +                                        int reg_addr_cells,
> +                                        int reg_size_cells);
> +static void handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> +                                        int domain_node,
> +                                        int addr_cells,
> +                                        int size_cells);
> +static bool efi_arch_check_dom0less_boot(EFI_FILE_HANDLE dir_handle);
>
>  #define DEVICE_TREE_GUID \
>  {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
>  
> @@ -552,8 +586,218 @@ static void __init efi_arch_handle_module(const struct file *file,
>                           kernel.size) < 0 )
>              blexit(L"Unable to set reg property.");
>      }
> -    else
> +    else if ( file != &dom0less_file )
> +        /*
> +         * If file is not a dom0 module file and it's not a domU module,
> +         * stop here.
> +         */
>          blexit(L"Unknown module type");
> +    /*
> +     * dom0less_modules_available is decremented here because for each dom0
> +     * file added, there will be an additional bootmodule, so the number
> +     * of dom0less module files will be decremented because there is
> +     * a maximum amount of bootmodules that can be loaded.
> +     */
> +    dom0less_modules_available--;
> +}
> +
> +/*
> + * This function checks for a binary previously loaded with a give name, it
> + * returns the index of the file in the dom0less_files array or a negative
> + * number if no file with that name is found.
> + */
> +static int __init get_dom0less_file_index(const char *name,
> +                                          unsigned int name_len)
> +{
> +    unsigned int i;
> +    int ret = ERROR_DOM0LESS_FILE_NOT_FOUND;
> +
> +    for (i = 0; i < dom0less_modules_idx; i++)
> +    {
> +        dom0less_module_name *mod = &dom0less_modules[i];
> +        if ( (mod->name_len == name_len) &&
> +             (strncmp(mod->name, name, name_len) == 0) )
> +        {
> +            ret = i;
> +            break;
> +        }
> +    }
> +    return ret;
> +}
> +
> +/*
> + * This function allocates a binary and keeps track of its name, it
> + * returns the index of the file in the dom0less_files array.
> + */
> +static unsigned int __init allocate_dom0less_file(EFI_FILE_HANDLE dir_handle,
> +                                                  const char *name,
> +                                                  unsigned int name_len)
> +{
> +    dom0less_module_name* file_name;
> +    union string module_name;
> +    unsigned int ret_idx;
> +
> +    /*
> +     * Check if there is any space left for a domU module, the variable
> +     * dom0less_modules_available is updated each time we use read_file(...)
> +     * successfully.
> +     */
> +    if ( !dom0less_modules_available )
> +        blexit(L"No space left for domU modules");

This is the check that could be based on dom0less_modules_idx


> +    module_name.s = (char*) name;
> +    ret_idx = dom0less_modules_idx;
> +
> +    /* Save at this index the name of this binary */
> +    file_name = &dom0less_modules[ret_idx];
> +
> +    if ( efi_bs->AllocatePool(EfiLoaderData, (name_len + 1) * sizeof(char),
> +                              (void**)&file_name->name) != EFI_SUCCESS )
> +        blexit(L"Error allocating memory for dom0less binary name");
> +
> +    /* Save name and length of the binary in the data structure */
> +    strlcpy(file_name->name, name, name_len);
> +    file_name->name_len = name_len;

Sorry for the silly question but do we need to set the '\0' at the end
of the string or can we assumed the memory returned by AllocatePool is
already zeroed? Or should we call strlcpy with name_len+1 ?


> +
> +    /* Load the binary in memory */
> +    read_file(dir_handle, s2w(&module_name), &dom0less_file, NULL);
> +
> +    /* Save address and size */
> +    file_name->addr = dom0less_file.addr;
> +    file_name->size = dom0less_file.size;
> +
> +    /* s2w(...) allocates some memory, free it */
> +    efi_bs->FreePool(module_name.w);
> +
> +    dom0less_modules_idx++;
> +
> +    return ret_idx;
> +}
> +
> +/*
> + * This function checks for the presence of the uefi,binary property in the
> + * module, if found it loads the binary as dom0less module and sets the right
> + * address for the reg property into the module DT node.
> + */
> +static void __init handle_dom0less_module_node(EFI_FILE_HANDLE dir_handle,
> +                                          int module_node_offset,
> +                                          int reg_addr_cells,
> +                                          int reg_size_cells)
> +{
> +    const void *uefi_name_prop;
> +    char mod_string[24]; /* Placeholder for module@ + a 64-bit number + \0 */
> +    int uefi_name_len, file_idx;
> +    dom0less_module_name *file;
> +
> +    /* Read uefi,binary property to get the file name. */
> +    uefi_name_prop = fdt_getprop(fdt, module_node_offset, "uefi,binary",
> +                                 &uefi_name_len);
> +
> +    if ( !uefi_name_prop )
> +        /* Property not found */
> +        return;
> +
> +    file_idx = get_dom0less_file_index(uefi_name_prop, uefi_name_len);
> +    if (file_idx < 0)
> +        file_idx = allocate_dom0less_file(dir_handle, uefi_name_prop,
> +                                          uefi_name_len);
> +
> +    file = &dom0less_modules[file_idx];
> +
> +    snprintf(mod_string, sizeof(mod_string), "module@%"PRIx64, file->addr);
> +
> +    /* Rename the module to be module@{address} */
> +    if ( fdt_set_name(fdt, module_node_offset, mod_string) < 0 )
> +        blexit(L"Unable to add domU ramdisk FDT node.");
> +
> +    if ( fdt_set_reg(fdt, module_node_offset, reg_addr_cells, reg_size_cells,
> +                     file->addr, file->size) < 0 )
> +        blexit(L"Unable to set reg property.");
> +}
> +
> +/*
> + * This function checks for boot modules under the domU guest domain node
> + * in the DT.
> + */
> +static void __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> +                                               int domain_node,
> +                                               int addr_cells,
> +                                               int size_cells)
> +{
> +    int module_node;
> +    /*
> +     * Check for nodes compatible with multiboot,{kernel,ramdisk,device-tree}
> +     * inside this node
> +     */
> +    for ( module_node = fdt_first_subnode(fdt, domain_node);
> +          module_node > 0;
> +          module_node = fdt_next_subnode(fdt, module_node) )
> +        if ( (fdt_node_check_compatible(fdt, module_node,
> +                                        "multiboot,kernel") == 0) ||
> +             (fdt_node_check_compatible(fdt, module_node,
> +                                        "multiboot,ramdisk") == 0) ||
> +             (fdt_node_check_compatible(fdt, module_node,
> +                                        "multiboot,device-tree") == 0) )
> +            /* The compatible is one of the strings above, check the module */
> +            handle_dom0less_module_node(dir_handle, module_node, addr_cells,
> +                                        size_cells);
> +}
> +
> +/*
> + * This function checks for xen domain nodes under the /chosen node for possible
> + * domU guests to be loaded.
> + */
> +static bool __init efi_arch_check_dom0less_boot(EFI_FILE_HANDLE dir_handle)
> +{
> +    int chosen;
> +    int addr_len, size_len;
> +    unsigned int i = 0;
> +
> +    /* Check for the chosen node in the current DTB */
> +    chosen = setup_chosen_node(fdt, &addr_len, &size_len);
> +    if ( chosen < 0 )
> +        blexit(L"Unable to setup chosen node");
> +
> +    /* Check for nodes compatible with xen,domain under the chosen node */
> +    for ( int node = fdt_first_subnode(fdt, chosen);
> +          node > 0;
> +          node = fdt_next_subnode(fdt, node) )
> +    {
> +        int addr_cells, size_cells, len;
> +        const struct fdt_property *prop;
> +
> +        if ( fdt_node_check_compatible(fdt, node, "xen,domain") != 0 )
> +            continue;
> +
> +        /* Get or set #address-cells and #size-cells */
> +        prop = fdt_get_property(fdt, node, "#address-cells", &len);
> +        if ( !prop )
> +            blexit(L"#address-cells not found in domain node.");
> +
> +        addr_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
> +
> +        prop = fdt_get_property(fdt, node, "#size-cells", &len);
> +        if ( !prop )
> +            blexit(L"#size-cells not found in domain node.");
> +
> +        size_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
> +
> +        /* Found a node with compatible xen,domain; handle this node. */
> +        handle_dom0less_domain_node(dir_handle, node, addr_cells, size_cells);
> +    }
> +
> +    /* Free dom0less file names if any */
> +    for ( ; i < dom0less_modules_idx; i++ )
> +    {
> +        /* Free dom0less binary names */
> +        efi_bs->FreePool(dom0less_modules[i].name);
> +    }
> +
> +    if ( dom0less_modules_idx > 0 )
> +        return true;
> +
> +    return false;
>  }
>  
>  static void __init efi_arch_cpu(void)
> @@ -562,8 +806,19 @@ static void __init efi_arch_cpu(void)
>  
>  static void __init efi_arch_blexit(void)
>  {
> +    unsigned int i = 0;
> +
>      if ( dtbfile.need_to_free )
>          efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
> +    /* Free dom0less files if any */
> +    for ( ; i < dom0less_modules_idx; i++ )
> +    {
> +        /* Free dom0less binary names */
> +        efi_bs->FreePool(dom0less_modules[i].name);
> +        /* Free dom0less binaries */
> +        efi_bs->FreePages(dom0less_modules[i].addr,
> +                          PFN_UP(dom0less_modules[i].size));
> +    }
>      if ( memmap )
>          efi_bs->FreePool(memmap);
>  }
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 9b0cc29aae..950fdf16b7 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -678,6 +678,12 @@ static void __init efi_arch_handle_module(const struct file *file,
>      efi_bs->FreePool(ptr);
>  }
>  
> +static bool __init efi_arch_check_dom0less_boot(EFI_FILE_HANDLE dir_handle)
> +{
> +    /* x86 doesn't support dom0less */
> +    return false;
> +}
> +
>  static void __init efi_arch_cpu(void)
>  {
>      uint32_t eax = cpuid_eax(0x80000000);
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 758f9d74d2..7d8734199e 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1127,15 +1127,16 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>      static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
>      EFI_LOADED_IMAGE *loaded_image;
>      EFI_STATUS status;
> -    unsigned int i, argc;
> -    CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
> +    unsigned int i, argc = 0;
> +    CHAR16 **argv, *file_name = NULL, *cfg_file_name = NULL, *options = NULL;
>      UINTN gop_mode = ~0;
>      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
>      union string section = { NULL }, name;
>      bool base_video = false;
> -    const char *option_str;
> +    const char *option_str = NULL;
>      bool use_cfg_file;
> +    EFI_FILE_HANDLE dir_handle;
>  
>      __set_bit(EFI_BOOT, &efi_flags);
>      __set_bit(EFI_LOADER, &efi_flags);
> @@ -1216,9 +1217,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>  
>      efi_arch_relocate_image(0);
>  
> +    /* Get the file system interface. */
> +    dir_handle = get_parent_handle(loaded_image, &file_name);
> +
>      if ( use_cfg_file )
>      {
> -        EFI_FILE_HANDLE dir_handle;
>          UINTN depth, cols, rows, size;
>  
>          size = cols = rows = depth = 0;
> @@ -1229,9 +1232,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>  
>          gop = efi_get_gop();
>  
> -        /* Get the file system interface. */
> -        dir_handle = get_parent_handle(loaded_image, &file_name);
> -
>          /* Read and parse the config file. */
>          if ( read_section(loaded_image, L"config", &cfg, NULL) )
>              PrintStr(L"Using builtin config file\r\n");
> @@ -1285,14 +1285,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>              efi_bs->FreePool(name.w);
>          }
>  
> -        if ( !name.s )
> -            blexit(L"No Dom0 kernel image specified.");
> -
>          efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
>  
> -        option_str = split_string(name.s);
> +        if ( name.s )
> +            option_str = split_string(name.s);
>  
> -        if ( !read_section(loaded_image, L"kernel", &kernel, option_str) )
> +        if ( !read_section(loaded_image, L"kernel", &kernel, option_str) &&
> +             name.s )

I'd probably indent this and put it under the previous if, instead of
adding "&& name.s". But I'll leave it up to you.


>          {
>              read_file(dir_handle, s2w(&name), &kernel, option_str);
>              efi_bs->FreePool(name.w);
> @@ -1361,12 +1360,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>          cfg.addr = 0;
>  
> -        dir_handle->Close(dir_handle);
> -
>          if ( gop && !base_video )
>              gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
>      }
>  
> +    /*
> +     * Check if a proper configuration is provided to start Xen:
> +     *  - Dom0 specified (minimum required)
> +     *  - Dom0 and DomU(s) specified
> +     *  - DomU(s) specified
> +     */
> +    if ( !efi_arch_check_dom0less_boot(dir_handle) && !kernel.addr )
> +        blexit(L"No Dom0 kernel image specified.");
> +
> +    dir_handle->Close(dir_handle);
> +
>      efi_arch_edd();
>  
>      /* XXX Collect EDID info. */
> -- 
> 2.17.1
> 

