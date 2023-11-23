Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69907F5B0A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 10:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639462.996861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r65xd-0002Xz-RR; Thu, 23 Nov 2023 09:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639462.996861; Thu, 23 Nov 2023 09:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r65xd-0002V1-Ny; Thu, 23 Nov 2023 09:25:25 +0000
Received: by outflank-mailman (input) for mailman id 639462;
 Thu, 23 Nov 2023 09:25:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FfzT=HE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r65xc-0002Uv-OS
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 09:25:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a46b398-89e2-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 10:25:23 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6D6E64EE073C;
 Thu, 23 Nov 2023 10:25:22 +0100 (CET)
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
X-Inumbo-ID: 3a46b398-89e2-11ee-98e2-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 23 Nov 2023 10:25:22 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
In-Reply-To: <23575a74-2a8d-41d3-a71a-420f6a6007c8@suse.com>
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <23575a74-2a8d-41d3-a71a-420f6a6007c8@suse.com>
Message-ID: <2123235ad5e5d18c89369b6cc1be3a4c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-23 09:57, Jan Beulich wrote:
> On 16.11.2023 10:08, Nicola Vetrini wrote:
>> The comment-based justifications for MISRA C:2012 Rule 8.4 are 
>> replaced
>> by the asmlinkage pseudo-attribute, for the sake of uniformity.
>> 
>> Add missing 'xen/compiler.h' #include-s where needed.
>> 
>> The text in docs/misra/deviations.rst and docs/misra/safe.json
>> is modified to reflect this change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> This patch should be applied after patch 2 of this series.
>> The request made by Julien to update the wording is
>> contained in the present patch.
> 
> Along with this request he supplied you with an ack. Did you drop that
> for a particular reason, or did you simply forget to record it here?
> 

I forgot and added it in a reply.

>> --- a/xen/arch/x86/boot/reloc.c
>> +++ b/xen/arch/x86/boot/reloc.c
>> @@ -28,6 +28,7 @@ asm (
>> 
>>  #include "defs.h"
>> 
>> +#include <xen/compiler.h>
>>  #include <xen/kconfig.h>
>>  #include <xen/multiboot.h>
>>  #include <xen/multiboot2.h>
>> @@ -348,9 +349,8 @@ static multiboot_info_t *mbi2_reloc(uint32_t 
>> mbi_in, uint32_t video_out)
>>      return mbi_out;
>>  }
>> 
>> -/* SAF-1-safe */
>> -void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t 
>> trampoline,
>> -                      uint32_t video_info)
>> +void *asmlinkage __stdcall reloc(uint32_t magic, uint32_t in,
>> +                                 uint32_t trampoline, uint32_t 
>> video_info)
>>  {
> 
> One purpose of asmlinkage is to possibly alter the default C calling 
> convention
> to some more easy to use in assembly code. At least over a period of 
> time Linux
> for example used that on ix86. If we decided to do something like this, 
> there
> would be a collision with __stdcall. Hence I'm not convinced we can put
> asmlinkage here. At which point the complete removal of SAF-1-safe also 
> would
> need dropping.
> 

Ok, so we can keep SAF-1 here and below and leave the wording in 
deviations.rst and safe.sjon as is.

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
> 
> Same here wrt EFIAPI, as that also alters the calling convention.
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

