Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F256864A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 12:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362123.592036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92k0-0002gq-CK; Wed, 06 Jul 2022 10:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362123.592036; Wed, 06 Jul 2022 10:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92k0-0002eT-9H; Wed, 06 Jul 2022 10:58:44 +0000
Received: by outflank-mailman (input) for mailman id 362123;
 Wed, 06 Jul 2022 10:58:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o92jz-0002da-98
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 10:58:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o92jw-0007W8-Af; Wed, 06 Jul 2022 10:58:40 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.237.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o92jw-0007TO-3t; Wed, 06 Jul 2022 10:58:40 +0000
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
	bh=41lDwE4fRYoItaHaK38C4LPcEe8cBh+JJvNzeZiL42Q=; b=WYfLjAKxtvmtjHI63ABGsgSaVf
	1iaI6rS0Vwuxjb/lnRBFWMXU5gb3N4gkYkOzDKcBBicDX8clKsqFuP3svfqpX96vAAKtnuuIdvLeE
	RjObtq+gfxbfZN9aVuRnPQpN9xxzA+PMt96y7fEbkBm/3ZsvRmlGAoKs6mf2gsInGaag=;
Message-ID: <46080c06-0be5-da5c-3e30-5df6e84e2b86@xen.org>
Date: Wed, 6 Jul 2022 11:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v8] Preserve the EFI System Resource Table for dom0
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
References: <7f773ea8d3967fc3dd2a485384a852c006fd82b9.1656093756.git.demi@invisiblethingslab.com>
 <863733AF-212D-4059-B780-3DDC0AC58FD7@arm.com>
 <19e001c3-fb66-2306-1e63-578239e91ad3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <19e001c3-fb66-2306-1e63-578239e91ad3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 06/07/2022 11:44, Andrew Cooper wrote:
> On 06/07/2022 11:32, Luca Fancellu wrote:
>> @@ -1051,6 +1110,70 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
>> #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
>>                                   (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
>>
>> +static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
>> +{
>> +    EFI_STATUS status;
>> +    UINTN info_size = 0, map_key, mdesc_size;
>> +    void *memory_map = NULL;
>> +    UINT32 ver;
>> +    unsigned int i;
>> +
>> +    for ( ; ; ) {
>> +        status = efi_bs->GetMemoryMap(&info_size, memory_map, &map_key,
>> +                                      &mdesc_size, &ver);
>> +        if ( status == EFI_SUCCESS && memory_map != NULL )
>> +            break;
>> +        if ( status == EFI_BUFFER_TOO_SMALL || memory_map == NULL )
>> +        {
>> +            info_size += 8 * efi_mdesc_size;
>> +            if ( memory_map != NULL )
>> +                efi_bs->FreePool(memory_map);
>> +            memory_map = NULL;
>> +            status = efi_bs->AllocatePool(EfiLoaderData, info_size, &memory_map);
>> +            if ( status == EFI_SUCCESS )
>> +                continue;
>> +            PrintErr(L"Cannot allocate memory to relocate ESRT\r\n");
>> +        }
>> +        else
>> +            PrintErr(L"Cannot obtain memory map to relocate ESRT\r\n");
>> +        return;
>> +    }
>> +
>> +    /* Try to obtain the ESRT.  Errors are not fatal. */
>> +    for ( i = 0; i < info_size; i += efi_mdesc_size )
>> +    {
>> +        /*
>> +         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
>> +         * so that the memory it is in will not be used for other purposes.
>> +         */
>> +        void *new_esrt = NULL;
>> +        size_t esrt_size = get_esrt_size(efi_memmap + i);
> 
> ... a NULL pointer here.  And the only way that could happen is if
> efi_memmap is NULL.
> 
> Which perhaps isn't surprising because presumably ARM gets memory
> information from the DT, not EFI?

We are always using the EFI memory map on Arm. The information from the 
DT used to be removed, but now kept just to get the NUMA information 
outside of the EFI stub.

Cheers,

-- 
Julien Grall

