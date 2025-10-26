Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6DFC0B4A0
	for <lists+xen-devel@lfdr.de>; Sun, 26 Oct 2025 22:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151421.1481969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vD8R0-0002Dj-F4; Sun, 26 Oct 2025 21:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151421.1481969; Sun, 26 Oct 2025 21:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vD8R0-0002Aw-8g; Sun, 26 Oct 2025 21:37:54 +0000
Received: by outflank-mailman (input) for mailman id 1151421;
 Sun, 26 Oct 2025 21:37:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vD8Qy-0002Ao-Po
 for xen-devel@lists.xenproject.org; Sun, 26 Oct 2025 21:37:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vD8Qr-003Hno-2U;
 Sun, 26 Oct 2025 21:37:45 +0000
Received: from [2a02:8012:3a1:0:287b:7bf1:36a7:b05c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vD8Qr-0047Px-2F;
 Sun, 26 Oct 2025 21:37:45 +0000
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
	bh=lR75HtxH0VG8ik5u8bR3hExd/hFpyEulQCaOmsO/oPY=; b=FHSw6KLXLRbl79Pvw5Dxm9Yz+C
	i/BQV3+AO0TDwHbgrU8HanLpqZ/po8BRV7N1g5cvehf0VTKQeG+UKPm3o6kOdiSr6G5XXNigQLb9K
	cw6NeEpjn/yCQqE9x1GiTt8Cuefg1BwDuhTDKjlHrMUUtlozqWv4FwpX4hb9lIDie/dQ=;
Message-ID: <c64c1733-e2bb-4fff-b969-5b075ce75f04@xen.org>
Date: Sun, 26 Oct 2025 21:37:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: address Rule 11.3 for NextMemoryDescriptor macro
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <78112778d6fd5f720f7102db7125c844b747a962.1761242341.git.dmytro_prokopchuk1@epam.com>
 <309b29ce-2e32-4f9a-9436-051cf65c0780@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <309b29ce-2e32-4f9a-9436-051cf65c0780@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 24/10/2025 08:43, Jan Beulich wrote:
> On 23.10.2025 20:00, Dmytro Prokopchuk1 wrote:
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -227,6 +227,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESCRIPTOR *
>>               }
>>           }
>>   #endif
>> +        /* SAF-15-safe casting a pointer */
>>           desc_ptr = NextMemoryDescriptor(desc_ptr, desc_size);
>>       }
>>   
> 
> While at present we have only one use site, needing per-use-site comments
> isn't very nice. Putting it into the imported header isn't nice either.
> Could Arm perhaps get away without using the macro, just like x86 manages
> to?


IIUC, you mean something like:

EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;

If so, this would work for me.

Cheers,

-- 
Julien Grall


