Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359DB307916
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 16:08:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77165.139601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58uQ-0002fl-2H; Thu, 28 Jan 2021 15:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77165.139601; Thu, 28 Jan 2021 15:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58uP-0002fM-UQ; Thu, 28 Jan 2021 15:08:33 +0000
Received: by outflank-mailman (input) for mailman id 77165;
 Thu, 28 Jan 2021 15:08:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l58uO-0002fH-GV
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 15:08:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l58uJ-0008BE-FH; Thu, 28 Jan 2021 15:08:27 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l58uI-0002ER-IA; Thu, 28 Jan 2021 15:08:27 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=94mV8buX+QgiZf1VETofOj5AlzPwFsmFXIVFgntCygo=; b=xhquJ/kwQlmEps8FhCBNkXwLst
	DFD2LdvScn5CRuJjQsvO4eoX3ZQjM+YdudVJl9gggFuKoqY8cZnCGYBmb9BvyW62Er/5PpSYzusvR
	RNdvkvJq55QRHoZUaTXNRia4E5DXN8Rp8F+iro9Lu3GHrXeVVWZvEfW9U/Sx/XnWc6TU=;
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
 <67136393-8454-9d28-628a-bfb380fd8fc9@xen.org>
 <aa19b356-aa5b-2427-ab8d-2c1ade84ad1c@gmail.com>
 <a5fd81ac-3ed4-40e7-66d7-a8daf3be4987@xen.org>
 <078a6aa6-2f72-d816-9e14-8132648d3370@gmail.com>
 <d0ff4658-30c2-ffed-3a9d-3dadd6195a61@gmail.com>
 <fef8ba7e-d434-5c72-779c-53fd323558de@gmail.com>
 <4385cb3d-c91f-08d2-e9c3-6d3d7af155b0@xen.org>
 <bcee25d0-1022-3aed-e269-e2e097b0d899@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <36f81705-764e-54e8-c314-d6f46d372a17@xen.org>
Date: Thu, 28 Jan 2021 15:08:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <bcee25d0-1022-3aed-e269-e2e097b0d899@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 28/01/2021 14:52, Oleksandr wrote:
> 
> On 28.01.21 16:41, Julien Grall wrote:
>> On 28/01/2021 14:29, Oleksandr wrote:
>>> On 28.01.21 15:39, Oleksandr wrote:
>>>>
>>>> On 28.01.21 13:33, Oleksandr wrote:
>>>>
>>>> Hi Julien
>>>>
>>>>>
>>>>> On 28.01.21 11:40, Julien Grall wrote:
>>>>>
>>>>> Hi Julien
>>>>>
>>>>>> Hi Oleksandr,
>>>>>>
>>>>>> On 27/01/2021 19:20, Oleksandr wrote:
>>>>>>  >  >>> So I think we may be able to drop the include from 
>>>>>> asm/hvm/domain.h
>>>>>>> (this would avoid to include it everywhere...).
>>>>>>>
>>>>>>> I have tried that, but other CUs use definitions from 
>>>>>>> public/hvm/dm_op.h, for example:
>>>>>>>
>>>>>>> p2m-pt.c: In function 'p2m_type_to_flags':
>>>>>>> p2m-pt.c:87:33: error: 'XEN_DMOP_IOREQ_MEM_ACCESS_WRITE' 
>>>>>>> undeclared (first use in this function)
>>>>>>>           if ( p2m->ioreq.flags & XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>>>>>>>                                   ^
>>>>>>> So, I would prefer to leave it as is, please let me know if you 
>>>>>>> think otherwise.
>>>>>>
>>>>>> AFAICT, there is only 2 places (p2m-pt.c and p2m-ept.c) that 
>>>>>> requires <public/hvm/dm_op.h> but doesn't directly include it. 
>>>>>> Folding the diff below in patch #4 should do the job:
>>>>>
>>>>> ok, will do
>>>>
>>>>
>>>> Just to clarify, you mentioned about patch #4, but shouldn't we make 
>>>> these changes in patch #9 which actually tries to sort dm related 
>>>> stuff?
>>>
>>> or a least in patch #8 which moves the stuff from 
>>> asm-x86/hvm/domain.h to xen/ioreq.h (including the user of 
>>> XEN_DMOP_IO_RANGE_PCI),
>>
>> I looked at the header asm-x86/hvm/domain.h after applying patch #4, 
>> there is nothing requiring DMOP from there.
>>
>> I tried to build it with this series applied up to patch #4 + my diff. 
>> It does build without any issue.
> 
> Hmm, interesting. I might miss something, but I got an build issue if I 
> split these changes with patch #4 and build the series up to this patch:

I think I looked and tried with the wrong commit. :( This was moved in 
patch #7 (xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs 
common).

Sorry for the confusion.

Cheers,

