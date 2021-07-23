Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DA13D36BF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 10:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160018.294275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6qbH-0004F3-AS; Fri, 23 Jul 2021 08:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160018.294275; Fri, 23 Jul 2021 08:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6qbH-0004Bb-73; Fri, 23 Jul 2021 08:32:07 +0000
Received: by outflank-mailman (input) for mailman id 160018;
 Fri, 23 Jul 2021 08:32:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m6qbG-0004BV-3m
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 08:32:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6qbF-0008Cg-Us; Fri, 23 Jul 2021 08:32:05 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6qbF-0005pS-PK; Fri, 23 Jul 2021 08:32:05 +0000
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
	bh=S5RH9tTfPA8QoMYgwOYYW1aPor0eM3oQWmjOWkUNJAI=; b=dzZBADE0dPPE+NB6z7jG3VFTRK
	P5LxukSsfslnq/pHl7oPJI8IFBcQZ6BLVPzCeu4qhDsCGtdJY/c8eY52rBulnj/wWkyLVaOuvASc+
	vroV5Un0mHz+1b6TyK+NpvZ6lR1UmutWsW8uK54GZrwCZMqVCo1e2dXl0dG08qKn4j+M=;
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>
References: <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org>
 <PA4PR03MB7136452DF9961BC283718F4BE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <8ce6f5fe-ccb6-d463-a39e-50fd82816b86@xen.org>
 <PA4PR03MB7136D3B811F820FC8A5AFF95E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2107211850540.14204@sstabellini-ThinkPad-T480s>
 <7c3453ed-181f-a166-f16c-43a33bcc529c@xen.org>
 <alpine.DEB.2.21.2107221437120.10122@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <88c43f6c-9d76-1cab-93f5-ddecc76b487f@xen.org>
Date: Fri, 23 Jul 2021 09:32:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2107221437120.10122@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 22/07/2021 22:39, Stefano Stabellini wrote:
> On Thu, 22 Jul 2021, Julien Grall wrote:
>>> You can go and edit 76085aff29f585139a37a10ea0a7daa63f70872c to change
>>> from 4K to any multiple of 4K, e.g. 8K, 12K, 16K, 20K. They should all
>>> work the same.
>>>
>>> Looking at the boot logs on pastebin I noticed that Xen is not loaded at
>>> a 2MB aligned address. I recommend you change Xen loading address to
>>> 0x500200000. And the kernel loading address to 0x500400000.
>>
>> I am curious to know why you recommend to load at 2MB aligned address. The
>> Image protocol doesn't require to load a 2MB aligned address. In fact, we add
>> issue on Juno because the bootloader would load Xen at a 4KB address. UEFI
>> will also load at a 4KB align address.
> 
> It is from empirical evidence :-)

Right...

> I cannot tell you the exact reason but I saw "strange" problems in the
> past that went away after choosing a 2MB alignment. So we settled for
> using 2MB in ImageBuilder and we haven't seen any more issues.

It would have been good to report such issue back then so it could have 
been analyzed and possibly fixed.

> However, it could have been anything: a bug in U-Boot not relevant
> anymore, a bug in Linux, etc. I don't know for sure.

This is the worrying part. We have a potential bug that no one knows why 
it happened. Can this be reproduced?

Cheers,

-- 
Julien Grall

