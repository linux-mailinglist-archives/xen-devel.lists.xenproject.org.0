Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C66C1BC261
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:11:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTRtW-0003F4-Ls; Tue, 28 Apr 2020 15:11:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTRtV-0003Ez-12
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:11:33 +0000
X-Inumbo-ID: 8b0536e8-8962-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b0536e8-8962-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 15:11:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6FD35AE0F;
 Tue, 28 Apr 2020 15:11:30 +0000 (UTC)
Subject: Re: [PATCH 1/6] x86_64/mm: map and unmap page tables in
 cleanup_frame_table
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <12c4fe0c0c05b9f76377c085d8a6558beae64003.1587116799.git.hongyxia@amazon.com>
 <a1caa70d-9c7a-b0c2-d7cf-1893db8f0ac4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87e3db0e-1d6d-c248-9442-106923cb4ea7@suse.com>
Date: Tue, 28 Apr 2020 17:11:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a1caa70d-9c7a-b0c2-d7cf-1893db8f0ac4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.2020 11:02, Julien Grall wrote:
> On 17/04/2020 10:52, Hongyan Xia wrote:
>> @@ -763,10 +763,10 @@ static void cleanup_frame_table(struct mem_hotadd_info *info)
>>               continue;
>>           }
>>   -        ASSERT(l1e_get_flags(l2e_to_l1e(l2e)[l1_table_offset(sva)]) &
>> -                _PAGE_PRESENT);
>> -         sva = (sva & ~((1UL << PAGE_SHIFT) - 1)) +
>> -                    (1UL << PAGE_SHIFT);
>> +        ASSERT(l1e_get_flags(l1e_from_l2e(l2e, l1_table_offset(sva))) &
>> +               _PAGE_PRESENT);
>> +
>> +        sva = (sva & ~((1UL << PAGE_SHIFT) - 1)) + (1UL << PAGE_SHIFT);
> 
> NIT: While you are modifying the indentation. Couldn't we use PAGE_MASK and PAGE_SIZE here?

And with this (which I think can be done while committing)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

