Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF17F8ACA89
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 12:24:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709863.1108872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryqqD-00085G-8k; Mon, 22 Apr 2024 10:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709863.1108872; Mon, 22 Apr 2024 10:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryqqD-00082E-5E; Mon, 22 Apr 2024 10:24:05 +0000
Received: by outflank-mailman (input) for mailman id 709863;
 Mon, 22 Apr 2024 10:24:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ryqqB-00080u-7L
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 10:24:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ryqqA-0003TD-NK; Mon, 22 Apr 2024 10:24:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ryqqA-00073L-HN; Mon, 22 Apr 2024 10:24:02 +0000
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
	bh=G6B7OymQhA2a5FbQNG6qlz7cMYSmeqi2jMGI4jh+ckA=; b=khjBe0cwZmTlDlHI5jI5obJilo
	jfK2uVfa09F6W84vS3isD8Y0PafIEkleQXN4cCM0zSGtyAXNV+wX/DnDbHnZyaKNSHOrebo9mJUbV
	kFS1ka4T/JSlz1rOPCGJZI9coHQ2s1An1+NsGMvck1Mk9kbagMCJx1sRHWp33bmhIyUw=;
Message-ID: <5de5dec4-7e2a-4e96-84c6-214ad781562a@xen.org>
Date: Mon, 22 Apr 2024 11:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] xen/arm: List static shared memory regions as
 /memory nodes
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
 <20240418073652.3622828-13-luca.fancellu@arm.com>
 <a46e7e41-cbb8-44e8-9c69-533b949f6a4a@amd.com>
 <9A107B24-E606-4926-BE1C-6FC0C6E86CF7@arm.com>
 <f7318988-85fa-4a40-8242-67db3305a397@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f7318988-85fa-4a40-8242-67db3305a397@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/04/2024 10:26, Michal Orzel wrote:
> 
> 
> On 22/04/2024 10:07, Luca Fancellu wrote:
>>
>>
>> Hi Michal,
>>
>>>> +    for ( cells = reg, i = 0; cells < reg + nr_cells; i++, cells += reg_size )
>>>> +    {
>>>> +        u64 start = dt_read_number(cells, addrcells);
>>> We should no longer use Linux derived types like u64. Use uint64_t.
>>>
>>>> +        u64 size = dt_read_number(cells + addrcells, sizecells);
>>>> +
>>>> +        dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
>>>> +                   i, start, start + size);
>>> i is unsigned so the correct format specifier should be %u
>>
>> Right, should have been more careful when copying the code from above
>>
>>>>
>>>> +void __init shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
>>>> +                                        __be32 *reg, int *nr_cells,
>>>> +                                        int addrcells, int sizecells)
>>>> +{
>>>> +    const struct membanks *mem = &kinfo->shm_mem.common;
>>>> +    unsigned int i;
>>>> +    __be32 *cells;
>>>> +
>>>> +    BUG_ON(!nr_cells || !reg);
>>>> +
>>>> +    cells = &reg[*nr_cells];
>>>> +    for ( i = 0; i < mem->nr_banks; i++ )
>>>> +    {
>>>> +        u64 start = mem->bank[i].start;
>>> ditto
>>
>> Will fix, here paddr_t should be ok isn’t it?
> yes
> 
>>
>>>
>>> Rest LGTM:
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> Thanks, I will send the next one shortly.
> I don't think there is a need to respin the whole series just for these fixes.
> You should wait for the committers opinion.

AFAICT, there are multiple changes requested in various line. So I would 
rather prefer if this is respinned.

If this is the only patch that requires to change. You could send a new 
one in reply-to this patch. I think b4 is clever enough to pick up the 
new version in that case.

Cheers,

-- 
Julien Grall

