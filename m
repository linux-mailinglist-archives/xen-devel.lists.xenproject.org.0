Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BFFAE37CE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 10:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022128.1397853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcCN-00027E-38; Mon, 23 Jun 2025 08:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022128.1397853; Mon, 23 Jun 2025 08:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcCN-00024F-0I; Mon, 23 Jun 2025 08:06:39 +0000
Received: by outflank-mailman (input) for mailman id 1022128;
 Mon, 23 Jun 2025 08:06:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uTcCL-000249-7H
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 08:06:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTcCK-00G9Nw-1q;
 Mon, 23 Jun 2025 08:06:36 +0000
Received: from [2a02:8012:3a1:0:bd17:6d03:6e6c:1c7e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTcCK-00EPaz-1K;
 Mon, 23 Jun 2025 08:06:36 +0000
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
	bh=fD9RY0HINj/jfBcakbkQDkzaJqNfM60M0bB058HMl+Q=; b=fvnVX2R02mxpAKy2xlCkKQ8FXr
	YvLgHNdETEb9jjyP3TmAK1OQ2KAhJ4gFURPTg9r9WN7hCJcat3kZ4F5Iwtgkaojr3cxWRzWrDsyzg
	e/sHIqji2Iz6eunhkBCmW1jrgTYW20OGknpVX258BZNIzNatetwZiBAbS9YwdJZUFz0k=;
Message-ID: <bd09db53-2a99-420a-8a78-8bd9dee8c6b2@xen.org>
Date: Mon, 23 Jun 2025 09:06:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop>
 <6080ff71-2634-4269-8a63-fdafdf03f01b@epam.com>
 <alpine.DEB.2.22.394.2506171556520.1780597@ubuntu-linux-20-04-desktop>
 <769aad0a-8bee-45c6-8c5c-35f9d47ed8ae@epam.com>
 <alpine.DEB.2.22.394.2506221432421.8066@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2506221432421.8066@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 22/06/2025 23:15, Stefano Stabellini wrote:
> On Thu, 19 Jun 2025, Oleksii Moisieiev wrote:
>> On 18/06/2025 02:22, Stefano Stabellini wrote:
>>> On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
>>>> [1]:https://git.iliana.fyi/linux/patch/?id=d5141f37c42e0b833863f157ac4cee203b2ba3d2
>>> Keep in mind that [0] refers specifically to access to MMIO regions. I
>>> assume that the SCMI shared buffers are on normal memory? Regarding [1],
>>> it makes sense if Linux is trying to support shared memory over MMIO.
>>>
>>> Looking at one of your replies below, I am guessing the memory buffers
>>> are actually in normal memory but the issue is that TF-A is mapping them
>>> as uncacheable. Is that correct?
>>>
>>> In that case, I still don't understand why a simple memcpy would not be
>>> sufficient. Can you check?
>>>
>>> If yes, then for now I would just simplify it down to memcpy. When
>>> someone adds support for an SCMI server elsewhere we could look into
>>> adding a more sophisticated memcpy and we can look at the details at
>>> that point in time. Specifically, I am not convinced that memcpy_toio
>>> and memcpy_fromio would work if the SCMI server is on a separate
>>> non-coherent microcontroller.
>>>
>> According to the TF-A implementation  SCMI memory
>>
>> is mapped with the  flags: MT_DEVICE (like for  stm32mp1) or
>> MT_NON_CACHEABLE (for rpi3)
>>
>> So probably you're right. I will check with simple memcpy.
> 
> There is a difference between MT_DEVICE and MT_NON_CACHEABLE: as far as
> I know MT_DEVICE requires aligned accesses while MT_NON_CACHEABLE does
> not.
> 
> However, as I wrote in the other email, if I am not mistaken the current
> implementation of memcpy might work well for us anyway. (To be
> confirmed.)

I am not entirely sure what exactly you want to confirm. I have already 
mentioned several time that our memcpy() on arm64 is using unaligned 
access. So it can't be used for copying data to/from device memory area.

Are you looking for a different things?

Cheers,

-- 
Julien Grall


