Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A0E8078AE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 20:33:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649416.1013930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAxdj-0001wx-O9; Wed, 06 Dec 2023 19:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649416.1013930; Wed, 06 Dec 2023 19:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAxdj-0001u8-Kn; Wed, 06 Dec 2023 19:32:59 +0000
Received: by outflank-mailman (input) for mailman id 649416;
 Wed, 06 Dec 2023 19:32:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAxdi-0001u2-HC
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 19:32:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAxde-0008To-OG; Wed, 06 Dec 2023 19:32:54 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.16.253]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAxde-0006bC-Hn; Wed, 06 Dec 2023 19:32:54 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=MtqrmBb4tjRiLagWp7CTMa4iwryWtKLG9ZiLgyln1lY=; b=yb2w8DAn8BGJE+phy64jsSk3cP
	9d+JjZGVqL9rix2xcmVX/SWz5XOaDGv/wOT6l3OPoZjjJFgByb/1LsJalpoSGxz5msNKhpTo5x32k
	qOhDrDZ5SDyH5OBjxfHxpLDTKLCq7Rx/pz7hv+wF0fUjiGGWBSMDtXxst5OPleu8Mc1s=;
Message-ID: <024b468e-bee8-4bdf-9e07-cb2a5a4a6a7c@xen.org>
Date: Wed, 6 Dec 2023 19:32:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/arm: set -mno-unaligned-access compiler option
 for Arm32
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20231206071039.24435-1-jgross@suse.com>
 <20231206071039.24435-2-jgross@suse.com>
 <606969b5-5ee3-4e15-92d4-86b142845437@suse.com>
 <5bc34aa0-607b-4e89-bd71-c216c70ddc67@suse.com>
 <62a22ba6-a912-4ff7-8653-2cc019503aee@xen.org>
In-Reply-To: <62a22ba6-a912-4ff7-8653-2cc019503aee@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/12/2023 10:57, Julien Grall wrote:
> Hi Juergen,
> 
> On 06/12/2023 10:00, Juergen Gross wrote:
>> On 06.12.23 09:44, Jan Beulich wrote:
>>> On 06.12.2023 08:10, Juergen Gross wrote:
>>>> As the hypervisor is disabling unaligned accesses for Arm32, set the
>>>> -mno-unaligned-access compiler option for building. This will prohibit
>>>> unaligned accesses when e.g. accessing 2- or 4-byte data items in
>>>> packed data structures.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>>> Assuming this will want backporting, should it have some Fixes: tag?
>>
>> IMHO this might not be needed
> 
> You probably miss the discussion between Arnd and I where I pointed out 
> that this should fix [1]. I haven't yet tested to confirm.

I can't find the GCC binaries I was using anymore :(. But I still think 
it is a good idea to backport it.

@Stefano can you add it in your list?

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

