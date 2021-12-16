Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF89477786
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248067.427843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtNy-0007W5-Uk; Thu, 16 Dec 2021 16:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248067.427843; Thu, 16 Dec 2021 16:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtNy-0007Tn-Ri; Thu, 16 Dec 2021 16:13:38 +0000
Received: by outflank-mailman (input) for mailman id 248067;
 Thu, 16 Dec 2021 16:13:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxtNx-0007Tc-5e
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:13:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxtNt-00034I-FP; Thu, 16 Dec 2021 16:13:33 +0000
Received: from [54.239.6.186] (helo=[192.168.25.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxtNt-0005uq-8u; Thu, 16 Dec 2021 16:13:33 +0000
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
	bh=jA6zvzySjIArLTmgl5+j69qsnV+6ozNjjQFFbbY/s78=; b=tAoe/csIDXy9m5pfHPSwYukuZj
	n8l+GQZPjEMRs2hvZi4dRLiLbqmqBRbYsDZwJ1KGItXLz7KJ8EUdT328eUidmX057SPzlP0pLrgLN
	wpSCL7I1FN9mGKWH9rUAysTWXZ4L/bTtcRL6vsaFzUILQXwi+jUlquN0BdMJtU+6LFPQ=;
Message-ID: <4a6a9e51-1878-9c47-f8df-b561b14fd5f8@xen.org>
Date: Thu, 16 Dec 2021 16:13:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] xen: arch_mfn_in_directmap: Reconciliate the name and the
 implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20211216152220.3317-1-julien@xen.org>
 <75446682-7f6a-d8c2-d30f-977096209a26@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <75446682-7f6a-d8c2-d30f-977096209a26@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 16/12/2021 16:11, Jan Beulich wrote:
> On 16.12.2021 16:22, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The name of arch_mfn_in_directmap() suggests that it will check against
>> that the passed MFN should be in the directmap.
>>
>> However, the current callers are passing the next MFN and the
>> implementation will return true for up to one MFN past the directmap.
>>
>> It would be more meaningful to test the exact MFN rather than the
>> next one. So rework the implementation and the caller to match the
>> name.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> Looking at the history, it looks like the check in init_node_heap()
>> was <= and it was simply moved to a new helper without any adjustment
>> as part of c6fdc9696a "boot allocator: use arch helper for virt_to_mfn
>> on DIRECTMAP_VIRT region".
> 
> Really the original intention was to check the entire range; maybe it
> would be better to express this again by ...
> 
>> --- a/xen/arch/x86/include/asm/mm.h
>> +++ b/xen/arch/x86/include/asm/mm.h
>> @@ -641,7 +641,7 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
>>   {
>>       unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>>   
>> -    return mfn <= (virt_to_mfn(eva - 1) + 1);
>> +    return mfn < (virt_to_mfn(eva - 1) + 1);
>>   }
> 
> ... this instead:
> 
> static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
> {
>      unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
> 
>      return mfn + nr <= (virt_to_mfn(eva - 1) + 1);
> }
> 
> This would allow an arch hook to also go beyond verifying just the last
> MFN.

I am fine with this approach. I will respin the patch.

Cheers,

-- 
Julien Grall

