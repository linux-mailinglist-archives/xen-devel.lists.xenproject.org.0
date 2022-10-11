Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E214B5FB2D0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 15:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420206.664800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiEte-0005Pt-0u; Tue, 11 Oct 2022 13:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420206.664800; Tue, 11 Oct 2022 13:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiEtd-0005NC-UB; Tue, 11 Oct 2022 13:02:09 +0000
Received: by outflank-mailman (input) for mailman id 420206;
 Tue, 11 Oct 2022 13:02:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oiEtc-0005N6-9f
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 13:02:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiEtX-00021O-1S; Tue, 11 Oct 2022 13:02:03 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.14.212]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiEtW-0000OD-PA; Tue, 11 Oct 2022 13:02:02 +0000
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
	bh=x4kUecLRn/PpXV1NA2Xv+wHU7ZIN5eA7nNXU1lzxSeQ=; b=m3IYHxRfVe/qYuqp0TSpd47nbt
	csiIiKbODTEYFrGDktJvBKk5zI1lAlMKfVEk8M2taSvHTm/r1RwmckJdx0PmVqVgPeqeBFzxlWFY0
	MjgPhHXr+O2IozdCRfmx+PZkaNsu8CV9SPn1OKvOseqlPtkT23Nfem/nq4/I6xFsH9Ro=;
Message-ID: <acedd354-9050-5340-ffd8-259aeb95b101@xen.org>
Date: Tue, 11 Oct 2022 14:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Henry Wang <Henry.Wang@arm.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <20220716145658.4175730-2-olekstysh@gmail.com>
 <df56f268-59d8-4b9a-52a6-40bfd0b91414@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <df56f268-59d8-4b9a-52a6-40bfd0b91414@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/10/2022 12:59, Jan Beulich wrote:
> On 16.07.2022 16:56, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Rework Arm implementation to store grant table frame GFN
>> in struct page_info directly instead of keeping it in
>> standalone status/shared arrays. This patch is based on
>> the assumption that a grant table page is a xenheap page.
>>
>> To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
>> to hold 52-bit/28-bit + extra bit value respectively. In order
>> to not grow the size of struct page_info borrow the required
>> amount of bits from type_info's count portion which current
>> context won't suffer (currently only 1 bit is used on Arm).
> 
> I'm afraid this isn't true: There's no requirement for a guest to pass
> all different GFNs to VCPUOP_register_vcpu_info, yet map_vcpu_info()
> tries to obtain a reference for every vCPU. 

AFAIU, this would be a reference of the **count_info** not **type_info** 
(which BTW will never be incremented on Arm because we have no type 
support).

The commit message is only referring to the 'type_info's count'. So...

> With my adding of GFN
> (really gaddr) based registration of the runstate area (already
> looking towards 4.18) the maximum possible count is to further grow.

... I am not sure which problem you are referring too.

Cheers,

-- 
Julien Grall

