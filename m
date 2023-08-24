Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FDA7875E3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 18:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590231.922369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZDTu-0002bK-8S; Thu, 24 Aug 2023 16:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590231.922369; Thu, 24 Aug 2023 16:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZDTu-0002ZG-5H; Thu, 24 Aug 2023 16:46:50 +0000
Received: by outflank-mailman (input) for mailman id 590231;
 Thu, 24 Aug 2023 16:46:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZDTs-0002Z6-Nm
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 16:46:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZDTr-0003EM-Hg; Thu, 24 Aug 2023 16:46:47 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.2.129]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZDTr-0001aP-9a; Thu, 24 Aug 2023 16:46:47 +0000
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
	bh=r5INkS0ZLRgUVoI3do/BTqKxnbne21v2LAIdWF7GM7A=; b=46Izl+BFZS+HYppnANyappQvxn
	cmV0EQ6wEmOTLOrPcv7IVGvWxu4mjT9fYSWoOx4Z4o5LmozpnI25f95V3FwaDVhjXzJwJj2T4YPxQ
	6IXPZdQMxAA9IcGnWkDR6MRsVzE+eyZIiQUipDBQfMD3ic+fyOEUHMxKIdDNXGRm27hg=;
Message-ID: <f060a049-b01a-4dcc-a89a-48716e418671@xen.org>
Date: Thu, 24 Aug 2023 17:46:45 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <656761cd-22ba-4edb-b7a1-bc08f672243a@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 24/08/2023 17:34, Anthony PERARD wrote:
> On Thu, Aug 24, 2023 at 12:15:39PM +0100, Julien Grall wrote:
>> On 18/08/2023 18:04, Anthony PERARD wrote:
>>> So, this new pci_revoke_permissions() function been place before
>>> do_pci_remove() will make it harder to follow what do_pci_remove() does.
>>> Does it need to be a separate function? Can't you inline it in
>>> pci_remove_detached() ?
>>
>> I decided to go with an inline function to avoid increasing the size of
>> pci_remove_detached() and also separate the logic from cleaning-up QMP an
>> resetting the PCI device.
> 
> It's fine to have a long function, if there's that much to do. You can
> add a comment if you want to separate a bit from the rest.
> 
> Having a new function would be ok if it was used from different places,
> or if it was needed for a new callback in the chain of callbacks of a
> long-running operation.

I don't agree with this definition on when to create a new function. 
Smaller functions help to logically split your code and also avoids to 
have to define 20 local variables right at the beginning of the function 
(this is what will happen with folding the function) among other advantages.

> 
>>>
>>> If it does needs to be a separate function, a better way to lay it down
>>> would be to replace calls to pci_remove_detached() by
>>> pci_revoke_permissions() as appropriate, and rename it with the prefixed
>>> "pci_remove_", that is pci_remove_revoke_permissions().
>>
>> I don't understand this suggestion. pci_revoke_permissions() is called right
>> in the middle of pci_remove_detached(). So it is not clear how it can be
>> called ahead.
>>
>> Also, if I replace pci_remove_detached() with pci_revoke_permissions(), does
>> this mean you are expecting the latter to call the former?
> 
> Let's just keep things simpler, and just add the code into
> pci_remove_detached().

I will attempt to fold the code. But I am not convinced about the 
simplicity and readability.

Cheers,

-- 
Julien Grall

