Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DD64C1B20
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 19:50:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277720.474520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwih-00005V-QM; Wed, 23 Feb 2022 18:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277720.474520; Wed, 23 Feb 2022 18:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwih-0008VA-ND; Wed, 23 Feb 2022 18:50:35 +0000
Received: by outflank-mailman (input) for mailman id 277720;
 Wed, 23 Feb 2022 18:50:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMwig-0008V4-9z
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 18:50:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMwie-00087t-Oj; Wed, 23 Feb 2022 18:50:32 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.122.138]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMwie-0001lQ-IC; Wed, 23 Feb 2022 18:50:32 +0000
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
	bh=ketT44OH08st78q8FuF99ppIz2kkPUsJg4CPMJHWlls=; b=Ev+5j5ebPwKo+c1Zr/6Sh/O3ph
	haunwpU5hOT1oPNwUloLt1RGSveHKkXAtpj+CRyyklQ0tnEO3GKEnpl894AYCiYiCP5OpKL1/W/16
	LJrqAHrpmzkUNaRhc5s8GIOm3G9xAELtBbqTDVt6NDfzNf3iPjcKI5nk0VNApJbZL0mA=;
Message-ID: <064fe4a6-42b4-14b7-2dcd-752af5afc473@xen.org>
Date: Wed, 23 Feb 2022 18:50:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH RFC 1/3] xen/efi: Always query the console information and
 get GOP
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: ehem+xen@m5p.com, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-2-julien@xen.org>
 <88741681-929f-4cda-e841-023bdbf8f772@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <88741681-929f-4cda-e841-023bdbf8f772@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

Gentle ping. Your feedback on this approach would be helpful.

On 07/02/2022 08:46, Jan Beulich wrote:
> On 06.02.2022 20:28, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, the EFI stub will only query the console information and
>> get the GOP when using the configuration file.
>>
>> However, GRUB is never providing the a configuration file. So the
>> EFI framebuffer will not be usable at least on Arm (support will
>> be added in a follow-up patch).
>>
>> Move out the code outside of the configuration file section.
>>
>> Take the opportunity to remove the variable 'size' which was
>> set but never used (interestingly GCC is only complaining if it is
>> initialization when declaring the variable).
>>
>> With this change, GCC 8.3 will complain of argc potentially been
>> used unitiatlized. I suspect this is because the argc will
>> be iniitalized and used in a different if code-blocks. Yet they
>> are using the same check.
> 
> I'm inclined to suggest this wants to be a separate change, with its
> own justification. You're not touching any use of argc here, after
> all.
> 
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ----
>>
>> It is not entirely clear to me why the GOP was only fetched when
>> the configuration file is used.
>>
>> I have tested this on RPI4 and it seems to work. Any chance this
>> was done to workaround an x86 platform?
> 
> This was done so in the context of making the code work for Arm. See
> commit c38cf865ec82 ("EFI: ignore EFI commandline, skip console setup
> when booted from GRUB"), the description of which explicitly says
> 
> "Don't do EFI console or video configuration when booted by GRUB.  The EFI boot
>   code does some console and video initialization to support native EFI boot from
>   the EFI boot manager or EFI shell.  This initlization should not be done when
>   booted using GRUB."
> 
> What you say now is effectively the opposite (and unlike back then
> x86 is now able to use this code path as well, so needs considering
> too). Cc-ing Daniel for possibly having a GrUB-side opinion.
> 
> Jan
> 
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1129,9 +1129,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>>       static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
>>       EFI_LOADED_IMAGE *loaded_image;
>>       EFI_STATUS status;
>> -    unsigned int i, argc;
>> +    /* Initialize argc to stop GCC complaining */
>> +    unsigned int i, argc = 0;
>>       CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
>> -    UINTN gop_mode = ~0;
>> +    UINTN gop_mode = ~0, cols = 0, rows = 0;
>> +
>>       EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>>       EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
>>       union string section = { NULL }, name;
>> @@ -1219,18 +1221,16 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>>   
>>       efi_arch_relocate_image(0);
>>   
>> +    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
>> +                           &cols, &rows) == EFI_SUCCESS )
>> +        efi_arch_console_init(cols, rows);
>> +
>> +    gop = efi_get_gop();
>> +
>>       if ( use_cfg_file )
>>       {
>>           EFI_FILE_HANDLE dir_handle;
>> -        UINTN depth, cols, rows, size;
>> -
>> -        size = cols = rows = depth = 0;
>> -
>> -        if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
>> -                               &cols, &rows) == EFI_SUCCESS )
>> -            efi_arch_console_init(cols, rows);
>> -
>> -        gop = efi_get_gop();
>> +        UINTN depth = 0;
>>   
>>           /* Get the file system interface. */
>>           dir_handle = get_parent_handle(loaded_image, &file_name);
> 

Cheers,

-- 
Julien Grall

