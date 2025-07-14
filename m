Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A9DB03BA3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 12:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042756.1412833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubG7h-0003sF-N0; Mon, 14 Jul 2025 10:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042756.1412833; Mon, 14 Jul 2025 10:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubG7h-0003qJ-KL; Mon, 14 Jul 2025 10:09:25 +0000
Received: by outflank-mailman (input) for mailman id 1042756;
 Mon, 14 Jul 2025 10:09:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ubG7g-0003pU-2L
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 10:09:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ubG7f-00H9yw-1B;
 Mon, 14 Jul 2025 10:09:23 +0000
Received: from [2a02:8012:3a1:0:cc42:98c6:44b6:982a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ubG7f-00687I-0X;
 Mon, 14 Jul 2025 10:09:23 +0000
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
	bh=T8j5aqK/DV0WNxv410UOyrdpsfrdzXR6+D6eBnDVLlE=; b=GZUtG3btYLOUhTWSB+hhQahrfE
	vgAdA1cOVdzW32J3xVD+e7oubJY1MsHGD21GLJavxs1EJ+8YIcvGinVKr+eWwFaNby2qrvsjadIkH
	Rs3chflASni9Spv+U5M30QeVOVgQEa8mxQJHFAGxisdKNpWkHc3lnCw7l3hacxREklwg=;
Message-ID: <00f0a56f-999e-40c9-a43f-43709963058c@xen.org>
Date: Mon, 14 Jul 2025 11:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Skip loops in init_pdx() when no PDX
 compression is used
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250704075428.33485-1-michal.orzel@amd.com>
 <20250704075428.33485-3-michal.orzel@amd.com>
 <a6ad4ea4-8eca-47f6-b814-84aeedd1ac3e@xen.org>
 <037ebff1-7e78-4170-a636-989e534dc11a@amd.com>
 <6b89c55b-3aa1-49e6-8ee4-0761234aa7bc@xen.org>
 <b10f4263-c01b-4a87-b2a5-9ad13dc343fc@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <b10f4263-c01b-4a87-b2a5-9ad13dc343fc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 14/07/2025 10:50, Orzel, Michal wrote:
> 
> 
> On 14/07/2025 11:45, Julien Grall wrote:
>> Hi Michal,
>>
>> On 14/07/2025 08:37, Orzel, Michal wrote:
>>>
>>>
>>> On 12/07/2025 12:29, Julien Grall wrote:
>>>> Hi Michal,
>>>>
>>>> On 04/07/2025 08:54, Michal Orzel wrote:
>>>>> When CONFIG_PDX_COMPRESSION=n, pdx_init_mask(), pdx_region_mask() and
>>>>> pfn_pdx_hole_setup() are just stubs doing nothing. It does not make
>>>>> sense to keep the two loops iterating over all the memory banks.
>>>>
>>>> I saw this was already committed. But I have a question. Wouldn't the
>>>> compiler be able to optimize and remove the loops? Asking because we are
>>>> trying to limit the number of #ifdef in the code hence why we have stubs.
>>> Before submitting a patch I did disassembled init_pdx() with and without my
>>> patch and in the latter case the compiler did not optimize out the loops.
>>
>> One more question. Was this in debug or non-debug build?
> It was in debug build.

Ok. I would be interested to know if this change in non-debug build 
because we have quite a few places in Xen relying on code elimination.

Cheers,

-- 
Julien Grall


