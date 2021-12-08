Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180D346D8A7
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 17:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242497.419400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzyO-0002Nu-Ht; Wed, 08 Dec 2021 16:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242497.419400; Wed, 08 Dec 2021 16:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzyO-0002LY-Ex; Wed, 08 Dec 2021 16:39:16 +0000
Received: by outflank-mailman (input) for mailman id 242497;
 Wed, 08 Dec 2021 16:39:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1muzyN-0002LS-5X
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 16:39:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muzyM-0001Zf-E4; Wed, 08 Dec 2021 16:39:14 +0000
Received: from [54.239.6.189] (helo=[192.168.13.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muzyM-00019g-8f; Wed, 08 Dec 2021 16:39:14 +0000
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
	bh=lq+VIYqhSHkwA+dze9flyV6dPJ3HodJ4KerB6l3QmFw=; b=WswzJ6WBsObqlnNzN1koRHW8jf
	538umxnRYBJ6zIhLZxFJ+/l20reIxw3oNvCYpJQjPttXXsRV69Thd4Y8eVb1aaZ7segD7x3qldqku
	ny/xQXS9slaIPEXU8bRIQsTBHALHQf6KZjcC56lHztGix9ZlR2WUS02KA7UUTEzu5RCA=;
Message-ID: <67af462c-34b2-861e-da52-d3ec7e110205@xen.org>
Date: Wed, 8 Dec 2021 16:39:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v7 6/7] xen/arm: process pending vPCI map/unmap operations
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "paul@xen.org" <paul@xen.org>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-7-andr2000@gmail.com>
 <9647b586-e325-0d3a-3369-e3b13e45af9d@gmail.com>
 <be0d06fc-f024-73c3-8b0d-59bc8791312e@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <be0d06fc-f024-73c3-8b0d-59bc8791312e@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/12/2021 11:57, Oleksandr Andrushchenko wrote:
> Hi, Julien!

Hi,

> On 03.12.21 18:10, Durrant, Paul wrote:
>> On 23/11/2021 23:59, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> vPCI may map and unmap PCI device memory (BARs) being passed through which
>>> may take a lot of time. For this those operations may be deferred to be
>>> performed later, so that they can be safely preempted.
>>>
>>> Currently this deferred processing is happening in common IOREQ code
>>> which doesn't seem to be the right place for x86 and is even more
>>> doubtful because IOREQ may not be enabled for Arm at all.
>>> So, for Arm the pending vPCI work may have no chance to be executed
>>> if the processing is left as is in the common IOREQ code only.
>>> For that reason make vPCI processing happen in arch specific code.
>>>
>>> Please be aware that there are a few outstanding TODOs affecting this
>>> code path, see xen/drivers/vpci/header.c:map_range and
>>> xen/drivers/vpci/header.c:vpci_process_pending.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> [x86 part]
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>>
> Do we need anything else for this patch?

No. I have committed the patch.

Cheers,

-- 
Julien Grall

