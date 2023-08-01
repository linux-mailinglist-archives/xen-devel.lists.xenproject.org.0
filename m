Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD3576C071
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 00:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574569.899953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQxrz-0002IW-SJ; Tue, 01 Aug 2023 22:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574569.899953; Tue, 01 Aug 2023 22:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQxrz-0002G7-Nl; Tue, 01 Aug 2023 22:29:35 +0000
Received: by outflank-mailman (input) for mailman id 574569;
 Tue, 01 Aug 2023 22:29:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j6MK=DS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQxry-0002G1-0d
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 22:29:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e20faa3f-30ba-11ee-b25c-6b7b168915f2;
 Wed, 02 Aug 2023 00:29:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3520E61696;
 Tue,  1 Aug 2023 22:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04990C433C7;
 Tue,  1 Aug 2023 22:29:27 +0000 (UTC)
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
X-Inumbo-ID: e20faa3f-30ba-11ee-b25c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690928969;
	bh=y7Xj3uYtClikgUD+bLbpt8U+auf0lAO5gADuiw8ZcWM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EHuXYE+ZYSKFBO+sr5dpsomE3370A4lpxngSk+43GmuwhwtUt9n1JlcpE+1BymtNC
	 NsPdcZBSc2u1yh+gScXJDIkeD6YENbxBTgRh7FBmtWprIx8O4hKxZFczjBTb0yK2Pb
	 fa4UGenoZNE0zG6fRieLwAAW8FClRGineWPY9GsdOAldrD1Ih2tf7bNZeR0CEJkkyZ
	 t1p1eh02Cl5LYU66jDc8lYRZ3HW6CqQENh5YX+y+ZY1ioWG0SNHGZjJJrjMp8wFBCO
	 thzF2mKsjDacoClWKusGINl2KPLPw3sRkx2iJPNsnczzLALVXDUmzlc2XLWyafHm3s
	 A/wfdBI/zc/4Q==
Date: Tue, 1 Aug 2023 15:29:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v2 3/3] arm/efi: address MISRA C:2012 Rule 5.3
In-Reply-To: <688eea3584d537b6f41bb32f227f8be74ffd2783.1690893696.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308011529150.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690893696.git.nicola.vetrini@bugseng.com> <688eea3584d537b6f41bb32f227f8be74ffd2783.1690893696.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Aug 2023, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The file-scope variable 'fdt' is shadowed by function parameters,
> and thus violates the rule, hence it's renamed to 'fdt_efi'
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> Changes in v2:
> - Renamed the file-scope variable instead of removing function parameters.
> ---
>  xen/arch/arm/efi/efi-boot.h | 84 ++++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 6126a71400..f24df2abb9 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -49,7 +49,7 @@ static void PrintMessage(const CHAR16 *s);
>  {0xb1b621d5U, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
>  
>  static struct file __initdata dtbfile;
> -static void __initdata *fdt;
> +static void __initdata *fdt_efi;
>  static void __initdata *memmap;
>  
>  static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
> @@ -383,7 +383,7 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
>      if ( EFI_ERROR(status) )
>          blexit(L"EFI memory map processing failed");
>  
> -    status = fdt_add_uefi_nodes(SystemTable, fdt, map, map_size, desc_size,
> +    status = fdt_add_uefi_nodes(SystemTable, fdt_efi, map, map_size, desc_size,
>                                  desc_ver);
>      if ( EFI_ERROR(status) )
>          PrintErrMesg(L"Updating FDT failed", status);
> @@ -395,7 +395,7 @@ static void __init efi_arch_pre_exit_boot(void)
>  
>  static void __init noreturn efi_arch_post_exit_boot(void)
>  {
> -    efi_xen_start(fdt, fdt_totalsize(fdt));
> +    efi_xen_start(fdt_efi, fdt_totalsize(fdt_efi));
>  }
>  
>  static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
> @@ -420,8 +420,8 @@ static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
>              efi_bs->FreePool(name.w);
>          }
>      }
> -    fdt = fdt_increase_size(&dtbfile, cfg.size + EFI_PAGE_SIZE);
> -    if ( !fdt )
> +    fdt_efi = fdt_increase_size(&dtbfile, cfg.size + EFI_PAGE_SIZE);
> +    if ( !fdt_efi )
>          blexit(L"Unable to create new FDT");
>  }
>  
> @@ -465,7 +465,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>      int chosen;
>  
>      /* locate chosen node, which is where we add Xen module info. */
> -    chosen = fdt_subnode_offset(fdt, 0, "chosen");
> +    chosen = fdt_subnode_offset(fdt_efi, 0, "chosen");
>      if ( chosen < 0 )
>          blexit(L"Unable to find chosen node");
>  
> @@ -498,7 +498,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>      else
>      {
>          /* Get xen,xen-bootargs in /chosen if it is specified */
> -        const char *dt_bootargs_prop = fdt_getprop(fdt, chosen,
> +        const char *dt_bootargs_prop = fdt_getprop(fdt_efi, chosen,
>                                                     "xen,xen-bootargs", NULL);
>          if ( dt_bootargs_prop )
>          {
> @@ -526,7 +526,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>              blexit(L"FDT string overflow");
>      }
>  
> -    if ( fdt_setprop_string(fdt, chosen, "xen,xen-bootargs", buf) < 0 )
> +    if ( fdt_setprop_string(fdt_efi, chosen, "xen,xen-bootargs", buf) < 0 )
>          blexit(L"Unable to set xen,xen-bootargs property.");
>  
>      efi_bs->FreePool(buf);
> @@ -542,7 +542,7 @@ static void __init efi_arch_handle_module(const struct file *file,
>  
>      if ( file == &dtbfile )
>          return;
> -    chosen = setup_chosen_node(fdt, &addr_len, &size_len);
> +    chosen = setup_chosen_node(fdt_efi, &addr_len, &size_len);
>      if ( chosen < 0 )
>          blexit(L"Unable to setup chosen node");
>  
> @@ -551,13 +551,13 @@ static void __init efi_arch_handle_module(const struct file *file,
>          static const char __initconst ramdisk_compat[] = "multiboot,ramdisk\0"
>                                                           "multiboot,module";
>  
> -        node = fdt_add_subnode(fdt, chosen, "ramdisk");
> +        node = fdt_add_subnode(fdt_efi, chosen, "ramdisk");
>          if ( node < 0 )
>              blexit(L"Unable to add ramdisk FDT node.");
> -        if ( fdt_setprop(fdt, node, "compatible", ramdisk_compat,
> +        if ( fdt_setprop(fdt_efi, node, "compatible", ramdisk_compat,
>                           sizeof(ramdisk_compat)) < 0 )
>              blexit(L"Unable to set compatible property.");
> -        if ( fdt_set_reg(fdt, node, addr_len, size_len, ramdisk.addr,
> +        if ( fdt_set_reg(fdt_efi, node, addr_len, size_len, ramdisk.addr,
>                      ramdisk.size) < 0 )
>              blexit(L"Unable to set reg property.");
>      }
> @@ -566,13 +566,13 @@ static void __init efi_arch_handle_module(const struct file *file,
>          static const char __initconst xsm_compat[] = "xen,xsm-policy\0"
>                                                       "multiboot,module";
>  
> -        node = fdt_add_subnode(fdt, chosen, "xsm");
> +        node = fdt_add_subnode(fdt_efi, chosen, "xsm");
>          if ( node < 0 )
>              blexit(L"Unable to add xsm FDT node.");
> -        if ( fdt_setprop(fdt, node, "compatible", xsm_compat,
> +        if ( fdt_setprop(fdt_efi, node, "compatible", xsm_compat,
>                           sizeof(xsm_compat)) < 0 )
>              blexit(L"Unable to set compatible property.");
> -        if ( fdt_set_reg(fdt, node, addr_len, size_len, xsm.addr,
> +        if ( fdt_set_reg(fdt_efi, node, addr_len, size_len, xsm.addr,
>                      xsm.size) < 0 )
>              blexit(L"Unable to set reg property.");
>      }
> @@ -581,15 +581,15 @@ static void __init efi_arch_handle_module(const struct file *file,
>          static const char __initconst kernel_compat[] = "multiboot,kernel\0"
>                                                          "multiboot,module";
>  
> -        node = fdt_add_subnode(fdt, chosen, "kernel");
> +        node = fdt_add_subnode(fdt_efi, chosen, "kernel");
>          if ( node < 0 )
>              blexit(L"Unable to add dom0 FDT node.");
> -        if ( fdt_setprop(fdt, node, "compatible", kernel_compat,
> +        if ( fdt_setprop(fdt_efi, node, "compatible", kernel_compat,
>                           sizeof(kernel_compat)) < 0 )
>              blexit(L"Unable to set compatible property.");
> -        if ( options && fdt_setprop_string(fdt, node, "bootargs", options) < 0 )
> +        if ( options && fdt_setprop_string(fdt_efi, node, "bootargs", options) < 0 )
>              blexit(L"Unable to set bootargs property.");
> -        if ( fdt_set_reg(fdt, node, addr_len, size_len, kernel.addr,
> +        if ( fdt_set_reg(fdt_efi, node, addr_len, size_len, kernel.addr,
>                           kernel.size) < 0 )
>              blexit(L"Unable to set reg property.");
>      }
> @@ -719,7 +719,7 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
>      module_info *file;
>  
>      /* Check if the node is a multiboot,module otherwise return */
> -    module_compat = fdt_node_check_compatible(fdt, module_node_offset,
> +    module_compat = fdt_node_check_compatible(fdt_efi, module_node_offset,
>                                                "multiboot,module");
>      if ( module_compat < 0 )
>          /* Error while checking the compatible string */
> @@ -730,7 +730,7 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
>          return 0;
>  
>      /* Read xen,uefi-binary property to get the file name. */
> -    uefi_name_prop = fdt_getprop(fdt, module_node_offset, "xen,uefi-binary",
> +    uefi_name_prop = fdt_getprop(fdt_efi, module_node_offset, "xen,uefi-binary",
>                                   &uefi_name_len);
>  
>      if ( !uefi_name_prop )
> @@ -751,13 +751,13 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
>      snprintf(mod_string, sizeof(mod_string), "module@%"PRIx64, file->addr);
>  
>      /* Rename the module to be module@{address} */
> -    if ( fdt_set_name(fdt, module_node_offset, mod_string) < 0 )
> +    if ( fdt_set_name(fdt_efi, module_node_offset, mod_string) < 0 )
>      {
>          PrintMessage(L"Unable to modify module node name.");
>          return ERROR_RENAME_MODULE_NAME;
>      }
>  
> -    if ( fdt_set_reg(fdt, module_node_offset, reg_addr_cells, reg_size_cells,
> +    if ( fdt_set_reg(fdt_efi, module_node_offset, reg_addr_cells, reg_size_cells,
>                       file->addr, file->size) < 0 )
>      {
>          PrintMessage(L"Unable to set module reg property.");
> @@ -766,7 +766,7 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
>  
>      if ( !is_domu_module )
>      {
> -        if ( (fdt_node_check_compatible(fdt, module_node_offset,
> +        if ( (fdt_node_check_compatible(fdt_efi, module_node_offset,
>                                      "multiboot,kernel") == 0) )
>          {
>              /*
> @@ -784,14 +784,14 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
>              kernel.size = file->size;
>          }
>          else if ( ramdisk.addr &&
> -                  (fdt_node_check_compatible(fdt, module_node_offset,
> +                  (fdt_node_check_compatible(fdt_efi, module_node_offset,
>                                               "multiboot,ramdisk") == 0) )
>          {
>              PrintMessage(L"Dom0 ramdisk already found in cfg file.");
>              return ERROR_DOM0_RAMDISK_FOUND;
>          }
>          else if ( xsm.addr &&
> -                  (fdt_node_check_compatible(fdt, module_node_offset,
> +                  (fdt_node_check_compatible(fdt_efi, module_node_offset,
>                                               "xen,xsm-policy") == 0) )
>          {
>              PrintMessage(L"XSM policy already found in cfg file.");
> @@ -816,7 +816,7 @@ static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_ima
>      unsigned int mb_modules_found = 0;
>  
>      /* Get #address-cells and #size-cells from domain node */
> -    prop = fdt_get_property(fdt, domain_node, "#address-cells", &len);
> +    prop = fdt_get_property(fdt_efi, domain_node, "#address-cells", &len);
>      if ( !prop )
>      {
>          PrintMessage(L"#address-cells not found in domain node.");
> @@ -825,7 +825,7 @@ static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_ima
>  
>      addr_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
>  
> -    prop = fdt_get_property(fdt, domain_node, "#size-cells", &len);
> +    prop = fdt_get_property(fdt_efi, domain_node, "#size-cells", &len);
>      if ( !prop )
>      {
>          PrintMessage(L"#size-cells not found in domain node.");
> @@ -835,9 +835,9 @@ static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_ima
>      size_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
>  
>      /* Check for nodes compatible with multiboot,module inside this node */
> -    for ( module_node = fdt_first_subnode(fdt, domain_node);
> +    for ( module_node = fdt_first_subnode(fdt_efi, domain_node);
>            module_node > 0;
> -          module_node = fdt_next_subnode(fdt, module_node) )
> +          module_node = fdt_next_subnode(fdt_efi, module_node) )
>      {
>          int ret = handle_module_node(loaded_image, dir_handle, module_node,
>                                       addr_cells, size_cells, true);
> @@ -862,7 +862,7 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
>      EFI_FILE_HANDLE dir_handle = NULL;
>  
>      /* Check for the chosen node in the current DTB */
> -    chosen = setup_chosen_node(fdt, &addr_len, &size_len);
> +    chosen = setup_chosen_node(fdt_efi, &addr_len, &size_len);
>      if ( chosen < 0 )
>      {
>          PrintMessage(L"Unable to setup chosen node");
> @@ -870,13 +870,13 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
>      }
>  
>      /* Check for nodes compatible with xen,domain under the chosen node */
> -    for ( node = fdt_first_subnode(fdt, chosen);
> +    for ( node = fdt_first_subnode(fdt_efi, chosen);
>            node > 0;
> -          node = fdt_next_subnode(fdt, node) )
> +          node = fdt_next_subnode(fdt_efi, node) )
>      {
>          int ret;
>  
> -        if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
> +        if ( !fdt_node_check_compatible(fdt_efi, node, "xen,domain") )
>          {
>              /* Found a node with compatible xen,domain; handle this node. */
>              ret = handle_dom0less_domain_node(loaded_image, &dir_handle, node);
> @@ -951,29 +951,29 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>       * node to decide whether to skip the UEFI Xen configuration file or not.
>       */
>  
> -    fdt = lookup_fdt_config_table(SystemTable);
> -    dtbfile.ptr = fdt;
> +    fdt_efi = lookup_fdt_config_table(SystemTable);
> +    dtbfile.ptr = fdt_efi;
>      dtbfile.need_to_free = false; /* Config table memory can't be freed. */
>  
> -    if ( fdt &&
> -         (fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0) )
> +    if ( fdt_efi &&
> +         (fdt_node_offset_by_compatible(fdt_efi, 0, "multiboot,module") > 0) )
>      {
>          /* Locate chosen node */
> -        int node = fdt_subnode_offset(fdt, 0, "chosen");
> +        int node = fdt_subnode_offset(fdt_efi, 0, "chosen");
>          const void *cfg_load_prop;
>          int cfg_load_len;
>  
>          if ( node > 0 )
>          {
>              /* Check if xen,uefi-cfg-load property exists */
> -            cfg_load_prop = fdt_getprop(fdt, node, "xen,uefi-cfg-load",
> +            cfg_load_prop = fdt_getprop(fdt_efi, node, "xen,uefi-cfg-load",
>                                          &cfg_load_len);
>              if ( !cfg_load_prop )
>                  load_cfg_file = false;
>          }
>      }
>  
> -    if ( !fdt || load_cfg_file )
> +    if ( !fdt_efi || load_cfg_file )
>      {
>          /*
>           * We either have no FDT, or one without modules, so we must have a
> @@ -983,7 +983,7 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>      }
>      PrintStr(L"Using modules provided by bootloader in FDT\r\n");
>      /* We have modules already defined in fdt, just add space. */
> -    fdt = fdt_increase_size(&dtbfile, EFI_PAGE_SIZE);
> +    fdt_efi = fdt_increase_size(&dtbfile, EFI_PAGE_SIZE);
>  
>      return false;
>  }
> -- 
> 2.34.1
> 

