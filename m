Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68683C9AFA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 11:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156513.288854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3xJK-0008Gh-O4; Thu, 15 Jul 2021 09:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156513.288854; Thu, 15 Jul 2021 09:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3xJK-0008El-Ka; Thu, 15 Jul 2021 09:05:38 +0000
Received: by outflank-mailman (input) for mailman id 156513;
 Thu, 15 Jul 2021 09:05:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3xJK-0008Ef-2Z
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 09:05:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3xJJ-0000xH-1r; Thu, 15 Jul 2021 09:05:37 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3xJI-0006FG-Sf; Thu, 15 Jul 2021 09:05:36 +0000
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
	bh=cAibhIT296tsC4ekydtfglRXOdKiHz4wp52UqkT1R1g=; b=NdbLJcldaaTv4oABonr6cEFQHy
	OPvJ9ab5k/71CQGsn0csBp69hPDcDyfhbopzLFXe3pxGhs2AUEQXNrTtXiWSBJYMQisIFcyf3d3d7
	PcD1qGsGFnPLSQpeCRbNEY/3sL5cnhq7+qpPJHMY+rBuDFqudmCO4xdsPqF2ngjZczUw=;
Subject: Re: [PATCH v2 13/13] SUPPORT.md: write down restriction of 32-bit
 tool stacks
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <ddff8b28-274d-d7fe-4ba9-0772859b7a72@suse.com>
 <e12989f7-9217-e2b8-a17d-5c252dc89248@xen.org>
 <dfc17ae6-2100-cb27-9826-1f6001788707@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <870cae2b-5601-b10b-926b-0995e661ffc1@xen.org>
Date: Thu, 15 Jul 2021 10:05:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dfc17ae6-2100-cb27-9826-1f6001788707@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 15/07/2021 07:38, Jan Beulich wrote:
> On 14.07.2021 20:16, Julien Grall wrote:
>> On 05/07/2021 16:18, Jan Beulich wrote:
>>> Let's try to avoid giving the impression that 32-bit tool stacks are as
>>> capable as 64-bit ones.
>>
>> Would you be able to provide a few examples of the known issues in the
>> commit message? This would be helpful for anyone to understand why we
>> decided to drop the support.
> 
> Not sure how useful this is going to be.

It would at least be useful to me, so I can make an informed decision. I 
suspect it would also be for anyone reading it in the future. This is 
rather frustrating to find commit message with barely any rationale and 
no-one remembering why this was done...

I vaguely recall a discussion about 64-bit hypercall ([1]). I assume the 
decision to drop support is related to it, but I have no way to prove it 
from the commit message.

It is also not clear why adding the restriction is the way to go...

> This would be pointing at the
> declarations / definitions of various tool stack internal variables or
> structure fields. Which also is why ...

... is this because such issues are too widespread in libxc/libxl to fix 
it in long term?

> 
>> At least on Arm, we tried to design the hypercall ABI in such a way that
>> it should be possible to use a 32-bit toolstack.
> 
> ... keeping the ABI tidy in this regard didn't help at all (albeit it
> of course was a prereq to writing a tool stack that would be capable).
> 
> Jan
> 

[1] 
https://lore.kernel.org/xen-devel/71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com/

-- 
Julien Grall

