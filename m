Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD4454F9A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 22:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227012.392497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnSrU-00013u-UC; Wed, 17 Nov 2021 21:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227012.392497; Wed, 17 Nov 2021 21:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnSrU-00010Y-QE; Wed, 17 Nov 2021 21:53:00 +0000
Received: by outflank-mailman (input) for mailman id 227012;
 Wed, 17 Nov 2021 21:52:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mnSrT-00010S-2J
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 21:52:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnSrR-0001Yb-MP; Wed, 17 Nov 2021 21:52:57 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.25.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnSrR-00014j-G8; Wed, 17 Nov 2021 21:52:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=uQ9M9maJldFdsKSJxr6/TT1y3h5jC4AqQtZknHTrpoE=; b=6XGShNuELR+IKCUPH5fIFl2AZc
	gD/EPO+/LUdXDTWjpXiJN9tVlpRDN1aqtumdpGHgxj4v0pFIQJjzuju5RLDmfXze8cxkp5JXdg6A5
	uxKS5InC7GsXKkOw0BIsmJOfh7u/ay6LyMBQ+7xQ+YDVRMpatpB7omxWvJr7ZoBMI00k=;
Message-ID: <9fbc1b5f-67e1-cf1d-0d03-463fd5de3209@xen.org>
Date: Wed, 17 Nov 2021 21:52:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH-4.16] arm/efi: Improve performance requesting filesystem
 handle
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 wei.chen@arm.com, iwj@xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20211116150624.7720-1-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2111161235260.1412361@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111161235260.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/11/2021 20:38, Stefano Stabellini wrote:
> On Tue, 16 Nov 2021, Luca Fancellu wrote:
> So I think we can queue it in the Xen on ARM temporary for-next branch.

I have pushed it to for-next/4.17 on both my repo and gitlab (hopefully 
this triggered a CI run).

Cheers,

> 
> 
>> Tested in this configurations:
>>   - Bootloader loads modules and specify them as multiboot modules in DT:
>>     * combination of Dom0, DomUs, Dom0 and DomUs
>>   - DT specifies multiboot modules in DT using xen,uefi-binary property:
>>     * combination of Dom0, DomUs, Dom0 and DomUs
>>   - Bootloader loads a Dom0 module and appends it as multiboot module in DT,
>>     other multiboot modules are listed for DomUs using xen,uefi-binary
>>   - No multiboot modules in DT and no kernel entry in cfg file:
>>     * proper error thrown
>> ---
>>   xen/arch/arm/efi/efi-boot.h | 33 +++++++++++++++++++++------------
>>   1 file changed, 21 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>> index 458cfbbed4..c4ed412845 100644
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -45,14 +45,17 @@ void __flush_dcache_area(const void *vaddr, unsigned long size);
>>   static int get_module_file_index(const char *name, unsigned int name_len);
>>   static void PrintMessage(const CHAR16 *s);
>>   static int allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
>> +                                EFI_FILE_HANDLE *dir_handle,
>>                                   const char *name,
>>                                   unsigned int name_len);
>>   static int handle_module_node(EFI_LOADED_IMAGE *loaded_image,
>> +                              EFI_FILE_HANDLE *dir_handle,
>>                                 int module_node_offset,
>>                                 int reg_addr_cells,
>>                                 int reg_size_cells,
>>                                 bool is_domu_module);
>>   static int handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
>> +                                       EFI_FILE_HANDLE *dir_handle,
>>                                          int domain_node);
>>   static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
>>   
>> @@ -648,10 +651,10 @@ static void __init PrintMessage(const CHAR16 *s)
>>    * index of the file in the modules array or a negative number on error.
>>    */
>>   static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
>> +                                       EFI_FILE_HANDLE *dir_handle,
>>                                          const char *name,
>>                                          unsigned int name_len)
>>   {
>> -    EFI_FILE_HANDLE dir_handle;
>>       module_name *file_name;
>>       CHAR16 *fname;
>>       union string module_name;
>> @@ -686,12 +689,11 @@ static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
>>       file_name->name_len = name_len;
>>   
>>       /* Get the file system interface. */
>> -    dir_handle = get_parent_handle(loaded_image, &fname);
>> +    if ( !*dir_handle )
>> +        *dir_handle = get_parent_handle(loaded_image, &fname);
>>   
>>       /* Load the binary in memory */
>> -    read_file(dir_handle, s2w(&module_name), &module_binary, NULL);
>> -
>> -    dir_handle->Close(dir_handle);
>> +    read_file(*dir_handle, s2w(&module_name), &module_binary, NULL);
>>   
>>       /* Save address and size */
>>       file_name->addr = module_binary.addr;
>> @@ -712,6 +714,7 @@ static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
>>    * Returns 1 if module is multiboot,module, 0 if not, < 0 on error
>>    */
>>   static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
>> +                                     EFI_FILE_HANDLE *dir_handle,
>>                                        int module_node_offset,
>>                                        int reg_addr_cells,
>>                                        int reg_size_cells,
>> @@ -744,8 +747,8 @@ static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
>>       file_idx = get_module_file_index(uefi_name_prop, uefi_name_len);
>>       if ( file_idx < 0 )
>>       {
>> -        file_idx = allocate_module_file(loaded_image, uefi_name_prop,
>> -                                        uefi_name_len);
>> +        file_idx = allocate_module_file(loaded_image, dir_handle,
>> +                                        uefi_name_prop, uefi_name_len);
>>           if ( file_idx < 0 )
>>               return file_idx;
>>       }
>> @@ -812,6 +815,7 @@ static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
>>    * Returns number of multiboot,module found or negative number on error.
>>    */
>>   static int __init handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
>> +                                              EFI_FILE_HANDLE *dir_handle,
>>                                                 int domain_node)
>>   {
>>       int module_node, addr_cells, size_cells, len;
>> @@ -842,8 +846,8 @@ static int __init handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
>>             module_node > 0;
>>             module_node = fdt_next_subnode(fdt, module_node) )
>>       {
>> -        int ret = handle_module_node(loaded_image, module_node, addr_cells,
>> -                                     size_cells, true);
>> +        int ret = handle_module_node(loaded_image, dir_handle, module_node,
>> +                                     addr_cells, size_cells, true);
>>           if ( ret < 0 )
>>               return ret;
>>   
>> @@ -862,6 +866,7 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>>   {
>>       int chosen, node, addr_len, size_len;
>>       unsigned int i = 0, modules_found = 0;
>> +    EFI_FILE_HANDLE dir_handle = NULL;
>>   
>>       /* Check for the chosen node in the current DTB */
>>       chosen = setup_chosen_node(fdt, &addr_len, &size_len);
>> @@ -881,20 +886,24 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>>           if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
>>           {
>>               /* Found a node with compatible xen,domain; handle this node. */
>> -            ret = handle_dom0less_domain_node(loaded_image, node);
>> +            ret = handle_dom0less_domain_node(loaded_image, &dir_handle, node);
>>               if ( ret < 0 )
>>                   return ERROR_DT_MODULE_DOMU;
>>           }
>>           else
>>           {
>> -            ret = handle_module_node(loaded_image, node, addr_len, size_len,
>> -                                     false);
>> +            ret = handle_module_node(loaded_image, &dir_handle, node, addr_len,
>> +                                     size_len, false);
>>               if ( ret < 0 )
>>                    return ERROR_DT_MODULE_DOM0;
>>           }
>>           modules_found += ret;
>>       }
>>   
>> +    /* dir_handle can be allocated in allocate_module_file, free it if exists */
>> +    if ( dir_handle )
>> +        dir_handle->Close(dir_handle);
>> +
>>       /* Free boot modules file names if any */
>>       for ( ; i < modules_idx; i++ )
>>       {
>> -- 
>> 2.17.1
>>

-- 
Julien Grall

