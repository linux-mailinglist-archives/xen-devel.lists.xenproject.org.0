Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3079BA87961
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949174.1345833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4EZN-0005K6-Hv; Mon, 14 Apr 2025 07:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949174.1345833; Mon, 14 Apr 2025 07:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4EZN-0005Ie-FK; Mon, 14 Apr 2025 07:49:29 +0000
Received: by outflank-mailman (input) for mailman id 949174;
 Mon, 14 Apr 2025 07:49:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4EZL-0005IY-FD
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:49:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4EZH-00EiOW-2v;
 Mon, 14 Apr 2025 07:49:23 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4EZH-00AZvz-1R;
 Mon, 14 Apr 2025 07:49:23 +0000
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
	bh=ll0sxhXC1mMGQmoSAuxcQQECADv7BSeHVP3hqAzxiss=; b=Ve3bSsBnPukQzCCYDY1dbkH1Ox
	4/zYZ8R06jjJLLZ61I2vl46BQpokLa4SCHpougcc2mlzXTkolFobIjmThbP8hhGgCrFKbh/1UP4f8
	ClNLJasKdJXlvJ85M9dn41X9Gu2nZLG7NSWWtJA4t8ngl6Km1i120GKQb1TrbwE89QJ4=;
Message-ID: <28db4a69-ea60-4c4d-a6e8-0dcc548a9e75@xen.org>
Date: Mon, 14 Apr 2025 16:49:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/io: provide helpers for multi size MMIO accesses
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-3-roger.pau@citrix.com>
 <bd77106c-7e5c-4e6f-98f9-faacf4f9deef@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bd77106c-7e5c-4e6f-98f9-faacf4f9deef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/04/2025 15:07, Jan Beulich wrote:
> On 11.04.2025 12:54, Roger Pau Monne wrote:
>> Several handlers have the same necessity of reading from an MMIO region
>> using 1, 2, 4 or 8 bytes accesses.  So far this has been open-coded in the
>> function itself.  Instead provide a new handler that encapsulates the
>> accesses.
>>
>> Since the added helpers are not architecture specific, introduce a new
>> generic io.h header.
> 
> Except that ...
> 
>> --- /dev/null
>> +++ b/xen/include/xen/io.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Generic helpers for doing MMIO accesses.
>> + *
>> + * Copyright (c) 2025 Cloud Software Group
>> + */
>> +#ifndef XEN_IO_H
>> +#define XEN_IO_H
>> +
>> +#include <xen/bug.h>
>> +
>> +#include <asm/io.h>
>> +
>> +static inline uint64_t read_mmio(const volatile void __iomem *mem,
>> +                                 unsigned int size)
>> +{
>> +    switch ( size )
>> +    {
>> +    case 1:
>> +        return readb(mem);
>> +
>> +    case 2:
>> +        return readw(mem);
>> +
>> +    case 4:
>> +        return readl(mem);
>> +
>> +    case 8:
>> +        return readq(mem);
> 
> ... this and ...
> 
>> +    }
>> +
>> +    ASSERT_UNREACHABLE();
>> +    return ~0UL;
>> +}
>> +
>> +static inline void write_mmio(volatile void __iomem *mem, uint64_t data,
>> +                              unsigned int size)
>> +{
>> +    switch ( size )
>> +    {
>> +    case 1:
>> +        writeb(data, mem);
>> +        break;
>> +
>> +    case 2:
>> +        writew(data, mem);
>> +        break;
>> +
>> +    case 4:
>> +        writel(data, mem);
>> +        break;
>> +
>> +    case 8:
>> +        writeq(data, mem);
>> +        break;
> 
> ... this may (generally will) not work on 32-bit architectures. Add
> CONFIG_64BIT conditionals? At which point return type / last parameter
> type could move from uint64_t to unsigned long.

Technically arm32 bit supports 64-bit write because we mandate LPAE. I 
see this is used by the vPCI code. Are we expecting to have any 64-bit 
access?

Cheers,

-- 
Julien Grall


