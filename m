Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48181AC7B74
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 11:54:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999893.1380420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKZy8-0000RE-CA; Thu, 29 May 2025 09:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999893.1380420; Thu, 29 May 2025 09:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKZy8-0000Ph-9R; Thu, 29 May 2025 09:54:36 +0000
Received: by outflank-mailman (input) for mailman id 999893;
 Thu, 29 May 2025 09:54:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uKZy7-0000PZ-CB
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 09:54:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uKZy6-008IFD-37;
 Thu, 29 May 2025 09:54:34 +0000
Received: from [15.248.2.29] (helo=[10.24.66.169])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uKZy7-00DNDg-0W;
 Thu, 29 May 2025 09:54:34 +0000
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
	bh=32VvbTDuRLJieKAUMdskwK5ALoQdNBNOc76OAoZ/gzQ=; b=Uuc3sdQwg+LG1XErySXKh20XV7
	TrWXEc9NbRGjMWW8Z7Cu2qvEaOI2cwbTXylNgRKA03GYtMRQSElhxd2XFpnn99K8qUuSODtqF3Shm
	BLH7fRAtRbyU8HqZnT9OdMCyVkIKhUub2VV5i96gfrP737syDsni3dfUvkOlk9Ep6VEg=;
Message-ID: <bf485deb-4006-41b4-b03a-214dfa3966bf@xen.org>
Date: Thu, 29 May 2025 10:54:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] arm/mpu: Provide and populate MPU C data
 structures
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250523065406.3795420-1-luca.fancellu@arm.com>
 <20250523065406.3795420-4-luca.fancellu@arm.com>
 <bcd974cd-8513-4069-82de-c553da3175f5@xen.org>
 <4546F0C7-28B8-41F9-9442-0CC2E4F42B78@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4546F0C7-28B8-41F9-9442-0CC2E4F42B78@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/05/2025 10:52, Luca Fancellu wrote:
>> On 29 May 2025, at 10:45, Julien Grall <julien@xen.org> wrote:
>> On 23/05/2025 07:54, Luca Fancellu wrote:
>>>   /*
>>>    * Macro to prepare and set a EL2 MPU memory region.
>>>    * We will also create an according MPU memory region entry, which
>>> @@ -59,6 +79,24 @@
>>>       dsb   sy
>>>       isb
>>>   +    /* Load pair into xen_mpumap and invalidate cache */
>>
>> AFAICT, you don't invalidate the cache below. What did I miss?
> 
> oh right I forgot to update this comment, Should I respin the serie or could it be addressed
> on commit?
> 
> I would amend the comment as:
> /* Load pair into xen_mpumap */

It can be done on commit.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


