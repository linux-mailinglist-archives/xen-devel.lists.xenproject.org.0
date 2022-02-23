Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCCC4C1B5E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 20:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277748.474565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwxY-0003Pk-Tz; Wed, 23 Feb 2022 19:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277748.474565; Wed, 23 Feb 2022 19:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwxY-0003NY-R8; Wed, 23 Feb 2022 19:05:56 +0000
Received: by outflank-mailman (input) for mailman id 277748;
 Wed, 23 Feb 2022 19:05:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMwxX-0003NQ-9C
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 19:05:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMwxV-0008Px-P0; Wed, 23 Feb 2022 19:05:53 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.122.138]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMwxV-0002mw-Gs; Wed, 23 Feb 2022 19:05:53 +0000
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
	bh=5IszUqZNjYgVAlproL7eMfi10ABrxZmEo7SvnGmAxwU=; b=LHDO1SOMnsU4InsAHC9j004FjL
	LkCIniZqmg8b9WFraeJLXKiSQlmHUC+i2uxswZGYB3MMjegvFWBjFiMU4oQ/Q9Z8e/4HVD1GuYPki
	phjVRNIPUHObK6L4Vz/qacos+MF8Wpzl1uiP+/yAbqfsZ2GayJf+iQ+OIeCcKzccx7Pk=;
Message-ID: <db9ee22b-22fa-46ff-9cf0-190628f1329b@xen.org>
Date: Wed, 23 Feb 2022 19:05:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/mm: pg_offlined can be defined as bool in
 free_heap_pages()
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220223184110.7941-1-julien@xen.org>
 <2978f831-5bed-d2d1-afc4-965a6c9770fb@srcf.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2978f831-5bed-d2d1-afc4-965a6c9770fb@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/02/2022 19:03, Andrew Cooper wrote:
> On 23/02/2022 18:41, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The local variable pg_offlined in free_heap_pages() can only take two
>> values. So switch it to a bool.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/common/page_alloc.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index e971bf91e0be..72e6cac2365d 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1437,8 +1437,9 @@ static void free_heap_pages(
>>   {
>>       unsigned long mask;
>>       mfn_t mfn = page_to_mfn(pg);
>> -    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), pg_offlined = 0;
>> +    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn));
>>       unsigned int zone = page_to_zone(pg);
>> +    bool pg_offlined = true;
> 
> = false ?

Whoops. Yes.

I will resend the patch.

Cheers,

-- 
Julien Grall

