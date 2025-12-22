Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BACD73D7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 23:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192352.1511622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXo3f-0007FU-SM; Mon, 22 Dec 2025 22:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192352.1511622; Mon, 22 Dec 2025 22:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXo3f-0007DD-PN; Mon, 22 Dec 2025 22:07:15 +0000
Received: by outflank-mailman (input) for mailman id 1192352;
 Mon, 22 Dec 2025 22:07:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vXo3e-0007D6-4o
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 22:07:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vXo3d-004qTx-0x;
 Mon, 22 Dec 2025 22:07:13 +0000
Received: from [2a02:8012:3a1:0:ec1c:da36:2cad:42dd]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vXo3d-00Egxd-0u;
 Mon, 22 Dec 2025 22:07:13 +0000
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
	bh=nlZoB2tHYgHrKK6bfl+7qKgGgd6imDqoBs6AzgGfFPY=; b=MbzfCEWqAiuEpw3Rz+/ap88tnb
	rzlzTDVBEAXi0UMy+X/Sivc7+9wC/nSHFLLxc2WuOoWiB6OkMrreMtOuifZM6v+Ky5MocqzFGysGC
	ShmK4bWp/spWRHMlpguS5f6M20jnOMgdBvjWVQ2sjKbWONEvFjKr6BZe7FMUKEFoG4Bg=;
Message-ID: <e7229816-ef11-4a2c-8910-3b38f4b0cfa6@xen.org>
Date: Mon, 22 Dec 2025 22:07:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] acpi/arm: relax MADT GICC entry length check to
 support newer ACPI revisions
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yann Dirson <yann.dirson@vates.tech>,
 Yann Sionneau <yann.sionneau@vates.tech>
References: <929f7a0fb8f92112d445015726db30122a05eb9f.1766060265.git.oleksii.kurochko@gmail.com>
 <36b89039-97e2-464c-8c1a-25981171b32f@xen.org>
 <9ec24ec4-2b9e-425e-b7bc-59eabdc2f421@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9ec24ec4-2b9e-425e-b7bc-59eabdc2f421@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 22/12/2025 11:30, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>> index ee75258fc3..a0ccda14bf 100644
>>> --- a/xen/arch/arm/gic.c
>>> +++ b/xen/arch/arm/gic.c
>>> @@ -418,8 +418,18 @@ unsigned long gic_get_hwdom_madt_size(const 
>>> struct domain *d)
>>>   {
>>>       unsigned long madt_size;
>>>   +    struct acpi_subtable_header *header;
>>> +    struct acpi_madt_generic_interrupt *host_gicc;
>>
>> For both variables, you don't seem to modify the content. So I think 
>> they should be const.
>>
>>> +
>>> +    header = 
>>> acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
>>> +    if ( !header )
>>> +        panic("Can't get GICC entry");
>>
>> I would feel happier to use panic() in this function if 
>> gic_get_hwdom_madt_size() is __init (its only caller is during boot)).
> 
> I am okay with making gic_get_hwdom_madt_size() as __init.
> 
>>
>> An alternative is to stash the GICC size in a global variable.
> 
> We also could to return 0 in the case of ( !header ) and then check if 
> the size is zero or not in estimate_acpi_efi_size(),
> and if it is zero then just return -EINVAL. Does it make sense?

This would also work for me. I will let you chose between the two 
approaches.

Cheers,

-- 
Julien Grall


