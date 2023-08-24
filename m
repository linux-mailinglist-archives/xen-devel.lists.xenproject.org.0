Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E11787711
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 19:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590247.922392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZE73-0008DB-GD; Thu, 24 Aug 2023 17:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590247.922392; Thu, 24 Aug 2023 17:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZE73-0008BA-DZ; Thu, 24 Aug 2023 17:27:17 +0000
Received: by outflank-mailman (input) for mailman id 590247;
 Thu, 24 Aug 2023 17:27:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZE71-0008B4-UH
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 17:27:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZE71-00048H-0p; Thu, 24 Aug 2023 17:27:15 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.2.129]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZE70-0008T7-Ms; Thu, 24 Aug 2023 17:27:14 +0000
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
	bh=JP4DGhBns8clZHQT5Qx4NfV6OE6QtPbkQMcqOTA9R0A=; b=PMaO2w+vRhW9FrlqR9GfpACy7r
	9IrBEjtiSuVqK4BZMdg29b9MkNuBagZe6qfLVlnecv6jJJBhgFzCqSllQpgPuQ6JC/o6+SfffZp45
	Lg53wquhXDJiCQTW9LogBRilHxo9Eh9b95Hf1syn+FZ5UT9Bi2VwZpYhcawLxt3HHGzI=;
Message-ID: <9b849d85-c54b-4b6c-95ef-721c57dc39f5@xen.org>
Date: Thu, 24 Aug 2023 18:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/light: Revoke permissions when a PCI detach for
 HVM domain
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20230809103305.30561-1-julien@xen.org>
 <20230809103305.30561-3-julien@xen.org>
 <48113eee-e047-47ad-b7a7-29feb8464ce9@perard>
 <438b2e6d-004c-42d6-8238-1d8e77e274e6@xen.org>
 <656761cd-22ba-4edb-b7a1-bc08f672243a@perard>
 <f060a049-b01a-4dcc-a89a-48716e418671@xen.org>
 <bc936e81-f1fa-45cf-a097-53aebde1fd6e@perard>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bc936e81-f1fa-45cf-a097-53aebde1fd6e@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/08/2023 17:58, Anthony PERARD wrote:
> On Thu, Aug 24, 2023 at 05:46:45PM +0100, Julien Grall wrote:
>> Hi Anthony,
>>
>> On 24/08/2023 17:34, Anthony PERARD wrote:
>>> On Thu, Aug 24, 2023 at 12:15:39PM +0100, Julien Grall wrote:
>>>> On 18/08/2023 18:04, Anthony PERARD wrote:
>>>>> So, this new pci_revoke_permissions() function been place before
>>>>> do_pci_remove() will make it harder to follow what do_pci_remove() does.
>>>>> Does it need to be a separate function? Can't you inline it in
>>>>> pci_remove_detached() ?
>>>>
>>>> I decided to go with an inline function to avoid increasing the size of
>>>> pci_remove_detached() and also separate the logic from cleaning-up QMP an
>>>> resetting the PCI device.
>>>
>>> It's fine to have a long function, if there's that much to do. You can
>>> add a comment if you want to separate a bit from the rest.
>>>
>>> Having a new function would be ok if it was used from different places,
>>> or if it was needed for a new callback in the chain of callbacks of a
>>> long-running operation.
>>
>> I don't agree with this definition on when to create a new function. Smaller
>> functions help to logically split your code and also avoids to have to
>> define 20 local variables right at the beginning of the function (this is
>> what will happen with folding the function) among other advantages.
> 
> You can always create a new block {} in the function, if that help with
> local variables.

I thought about it... But this is just a function in disguised with 
downside (the extra layer of indentation).

I was actually going to try the folding version. But given this 
suggestion, I am now struggling to understand why this is a problem to 
have a function only called once. This is fairly common in Xen 
Hypervisor and I can see at least one instance in libxl (see 
libxl_pci_assignable()). So what is the rationale behind this request?

I would also like the opinion from others (such as Juergen) before going 
ahead with any changes.

Cheers,

-- 
Julien Grall

