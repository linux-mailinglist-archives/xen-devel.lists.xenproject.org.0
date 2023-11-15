Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012CB7EC148
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 12:28:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633582.988553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E3y-0007yV-Qw; Wed, 15 Nov 2023 11:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633582.988553; Wed, 15 Nov 2023 11:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E3y-0007wp-OH; Wed, 15 Nov 2023 11:28:06 +0000
Received: by outflank-mailman (input) for mailman id 633582;
 Wed, 15 Nov 2023 11:28:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWFF=G4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r3E3x-0007wd-Ks
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 11:28:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ab2a9cc-83aa-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 12:28:04 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C713A4EE073D;
 Wed, 15 Nov 2023 12:28:03 +0100 (CET)
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
X-Inumbo-ID: 0ab2a9cc-83aa-11ee-98db-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 15 Nov 2023 12:28:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v2] xen: replace occurrences of SAF-1-safe
 with asmlinkage attribute
In-Reply-To: <18c366e0-0870-3a17-69a9-2bfb1fb3b25d@suse.com>
References: <aa7fa9b8cd40adb4eb5242deeff138cbe8b658f9.1699352946.git.nicola.vetrini@bugseng.com>
 <18c366e0-0870-3a17-69a9-2bfb1fb3b25d@suse.com>
Message-ID: <483c5d6b68c6dcfb6a2fe9bed10ecb60@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-13 15:44, Jan Beulich wrote:
> On 07.11.2023 11:30, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/boot/cmdline.c
>> +++ b/xen/arch/x86/boot/cmdline.c
>> @@ -31,6 +31,7 @@ asm (
>>      );
>> 
>>  #include <xen/kconfig.h>
>> +#include <xen/compiler.h>
>>  #include "defs.h"
>>  #include "video.h"
> 
> Please respect the goal of alphabetically sorted groups of #include-s.
> 

Will do

>> --- a/xen/arch/x86/boot/reloc.c
>> +++ b/xen/arch/x86/boot/reloc.c
>> @@ -33,6 +33,8 @@ asm (
>>  #include "../../../include/xen/kconfig.h"
>>  #include <public/arch-x86/hvm/start_info.h>
>> 
>> +#include <xen/compiler.h>
> 
> Same here, put on top of the tidying patch I just sent.
> 

This one, right?
https://lore.kernel.org/xen-devel/c027b9cd-37f3-8223-141f-a1dceda82ab4@suse.com/

>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1254,9 +1254,8 @@ static void __init efi_exit_boot(EFI_HANDLE 
>> ImageHandle, EFI_SYSTEM_TABLE *Syste
>>      efi_fw_vendor = (void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
>>  }
>> 
>> -/* SAF-1-safe */
>> -void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>> -                                      EFI_SYSTEM_TABLE *SystemTable)
>> +void asmlinkage EFIAPI __init noreturn efi_start(EFI_HANDLE 
>> ImageHandle,
>> +                                                 EFI_SYSTEM_TABLE 
>> *SystemTable)
>>  {
>>      static EFI_GUID __initdata loaded_image_guid = 
>> LOADED_IMAGE_PROTOCOL;
>>      static EFI_GUID __initdata shim_lock_guid = 
>> SHIM_LOCK_PROTOCOL_GUID;
> 
> Besides this patch not working on its own (as already said by Julien,
> you want to explicitly state dependencies), the change above makes me
> wonder about efi_multiboot2(): Neither the earlier series nor the
> change here are touching either of the two instances of the function.
> Was that merely an oversight, or is there another reason?
> 

Looks like an oversight, but I'll have to investigate; if it needs to be 
modified I'll do a separate patch.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

