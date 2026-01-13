Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74160D18813
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 12:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201500.1517122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfcfw-0003vt-9r; Tue, 13 Jan 2026 11:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201500.1517122; Tue, 13 Jan 2026 11:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfcfw-0003uS-6R; Tue, 13 Jan 2026 11:35:04 +0000
Received: by outflank-mailman (input) for mailman id 1201500;
 Tue, 13 Jan 2026 11:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0e4=7S=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vfcfu-0003uM-Rw
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 11:35:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e2c3f1f6-f073-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 12:34:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56476497;
 Tue, 13 Jan 2026 03:34:49 -0800 (PST)
Received: from [10.1.25.129] (unknown [10.1.25.129])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE4023F5A1;
 Tue, 13 Jan 2026 03:34:55 -0800 (PST)
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
X-Inumbo-ID: e2c3f1f6-f073-11f0-9ccf-f158ae23cfc8
Message-ID: <f143306f-f5f9-42b0-89bf-1cbb2538a080@arm.com>
Date: Tue, 13 Jan 2026 11:34:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm/mpu: Implement vmap functions for MPU
Content-Language: en-GB
From: Harry Ramsey <harry.ramsey@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-3-harry.ramsey@arm.com>
 <40677f79-8e3a-4c0c-876d-d57e9b230eca@amd.com>
 <c8cc26e1-248d-4d98-a7ce-d72f4ec4be5a@arm.com>
In-Reply-To: <c8cc26e1-248d-4d98-a7ce-d72f4ec4be5a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/01/2026 10:33, Harry Ramsey wrote:
> On 09/01/2026 14:00, Orzel, Michal wrote:
>>
>> On 05/01/2026 12:34, Harry Ramsey wrote:
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /*
>>>    * Update the entry in the MPU memory region mapping table 
>>> (xen_mpumap) for the
>>>    * given memory range and flags, creating one if none exists.
>>> @@ -357,18 +393,7 @@ static int xen_mpumap_update_entry(paddr_t 
>>> base, paddr_t limit,
>>>               return -EINVAL;
>>>           }
>>>   -        if ( xen_mpumap[idx].refcount == 0 )
>>> -        {
>>> -            if ( MPUMAP_REGION_FOUND == rc )
>>> -                disable_mpu_region_from_index(idx);
>>> -            else
>>> -            {
>>> -                printk("Cannot remove a partial region\n");
>>> -                return -EINVAL;
>>> -            }
>>> -        }
>>> -        else
>>> -            xen_mpumap[idx].refcount -= 1;
>>> +        return xen_mpumap_free_entry(idx, rc);
>>>       }
>>>         return 0;
>>> @@ -418,6 +443,31 @@ int destroy_xen_mappings(unsigned long s, 
>>> unsigned long e)
>>>       return xen_mpumap_update(s, e, 0);
>>>   }
>>>   +int destroy_xen_mapping_containing(paddr_t s)
>>> +{
>>> +    int rc;
>>> +    uint8_t idx;
>>> +
>>> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>>> +
>>> +    spin_lock(&xen_mpumap_lock);
>>> +
>>> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, s, s + 
>>> PAGE_SIZE,
>>> +                                &idx);
>>> +    if ( rc == MPUMAP_REGION_NOTFOUND )
>>> +    {
>>> +        printk(XENLOG_ERR "Cannot remove entry that does not exist");
>> Why do we split sanity checking between this and xen_mpumap_free_entry?
>> What are the possible region types that xen_mpumap_free_entry is 
>> expected to
>> work with? I thought that it should only be MPUMAP_REGION_FOUND.
>
> I will move the region checks to xen_mpumap_free_entry since we only 
> want xen_mpumap_update_entry and xen_mpumap_free_entry to modify our 
> refcount properties. These functions should then account for all 
> potential values of MPUMAP_REGION_*.
Sorry, after looking back at this code the reason the sanity checking 
happens here is because we require MPUMAP_REGION_FOUND to be used in 
`destroy_xen_mapping_containing` to actually remove the region. In 
`destroy_xen_mapping_containing` we are forcibly setting the region type 
to be MPUMAP_REGION_FOUND to ensure it is removed and thus we require 
the check here too.


Thanks,
Harry Ramsey.

