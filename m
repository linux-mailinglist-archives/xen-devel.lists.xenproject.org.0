Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDA32747D5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 19:54:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmUD-0004vD-7b; Tue, 22 Sep 2020 17:53:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDRM=C7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKmUB-0004v3-J0
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 17:53:51 +0000
X-Inumbo-ID: 6592c694-0972-44d6-9430-f54c34c62f71
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6592c694-0972-44d6-9430-f54c34c62f71;
 Tue, 22 Sep 2020 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=IVLxWPcWbQZyI71ViTcgQRMO0JlDsa1VVDmwU519uUA=; b=QO9fsf2w829iJGORngMe6dXx9H
 LZTI4aJRZ5Jst/O8w/Ag2JuVR9HAYBifpxyFOoAxu795TXCLSVUcYn/khT+R4xbKFaoYzqKP7sja6
 3y2FtvHt9lxCv4UUkyhZY9b+Ly9o5Ta8HEMHJAtpFovHW075VYlZ8D8vD3NZVBTU7aOo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKmU5-0004jS-Ut; Tue, 22 Sep 2020 17:53:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKmU5-0003AI-Mx; Tue, 22 Sep 2020 17:53:45 +0000
Subject: Re: [PATCH v4 1/4] xen: XENMEM_exchange should only be used/compiled
 for arch supporting PV guest
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-2-julien@xen.org>
 <6e22ec07-d489-33dc-62e7-415e760bb3ea@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <19b0a5af-a4f1-0058-1e36-e4ceaf18216a@xen.org>
Date: Tue, 22 Sep 2020 18:53:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6e22ec07-d489-33dc-62e7-415e760bb3ea@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

On 21/09/2020 20:46, Andrew Cooper wrote:
> On 21/09/2020 19:02, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> XENMEM_exchange can only be used by PV guest but the check is well
>> hidden in steal_page(). This is because paging_model_external() will
>> return false only for PV domain.
>>
>> To make clearer this is PV only, add a check at the beginning of the
>> implementation. Take the opportunity to compile out the code if
>> CONFIG_PV is not set.
>>
>> This change will also help a follow-up patch where the gmfn_mfn() will
>> be completely removed on arch not supporting the M2P.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> Jan suggested to #ifdef anything after the check to is_pv_domain().
>> However, it means to have two block of #ifdef as we can't mix
>> declaration and code.
>>
>> I am actually thinking to move the implementation outside of mm.c in
>> possibly arch/x86 or a pv specific directory under common. Any opinion?
> 
> arch/x86/pv/mm.c, with the case XENMEM_exchange: moving into
> arch_memory_op().
> 
> However, making this happen is incredibly tangled, and we're years
> overdue a fix here.
> 
> Lets go with this for now, and tidying up can come later.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, however...

Thanks!

> 
>>
>>      Changes in v4:
>>          - Patch added
>> ---
>>   xen/common/memory.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index 714077c1e597..9300104943b0 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -504,6 +504,7 @@ static bool propagate_node(unsigned int xmf, unsigned int *memflags)
>>   
>>   static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>   {
>> +#ifdef CONFIG_PV
>>       struct xen_memory_exchange exch;
>>       PAGE_LIST_HEAD(in_chunk_list);
>>       PAGE_LIST_HEAD(out_chunk_list);
>> @@ -516,6 +517,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>       struct domain *d;
>>       struct page_info *page;
>>   
>> +    if ( !is_pv_domain(d) )
>> +        return -EOPNOTSUPP;
>> +
>>       if ( copy_from_guest(&exch, arg, 1) )
>>           return -EFAULT;
>>   
>> @@ -797,6 +801,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
> 
> ... there are now a load of #ifdef CONFIG_X86 between these two hunks
> which can be dropped.

I didn't drop them because I wasn't sure whether we wanted to cater 
future arch.

Anyway, I am happy to do the cleanup :).

Cheers,

-- 
Julien Grall

