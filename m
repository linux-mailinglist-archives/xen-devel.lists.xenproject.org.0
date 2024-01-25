Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F383BEE3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 11:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671436.1044774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSx1k-0003w6-E4; Thu, 25 Jan 2024 10:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671436.1044774; Thu, 25 Jan 2024 10:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSx1k-0003uC-9S; Thu, 25 Jan 2024 10:32:08 +0000
Received: by outflank-mailman (input) for mailman id 671436;
 Thu, 25 Jan 2024 10:32:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rSx1i-0003u6-Og
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 10:32:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rSx1X-0000fk-Sn; Thu, 25 Jan 2024 10:31:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rSx1X-0004FK-HO; Thu, 25 Jan 2024 10:31:55 +0000
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
	bh=H89KEc9r3dsEnqZYNLYQEqrLkSMslQ+40ffmODQUhtI=; b=jhKc3RdGtS2BnF1JE0veTxMBys
	vWjNVa8oGDhawk6AUz9csJVqWU60iMCR6jcdnmEuhQT9aSU5vElZvmqdNw8mkVDj5eFw3frsF9JUG
	FkzVZUZkJQNnrN3AnTRnwldtymxDO6StqmkT8HuD2OiLCLWLnIWfy19QwM3xscUS7E3U=;
Message-ID: <2523d40b-02d4-4b58-a734-bb9ac8a4e691@xen.org>
Date: Thu, 25 Jan 2024 10:31:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing
 Dom0 when using VLANs
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@cloud.com>,
 Elliott Mitchell <ehem+xen@m5p.com>, Paul Leiber <paul@onlineschubla.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
 <4cddfd89-f195-4a50-a14d-b86121414e56@onlineschubla.de>
 <f8f39239-ea95-4fc7-9abe-6ca005eb02d2@onlineschubla.de>
 <ZarcWQ6Ugwowy050@mattapan.m5p.com>
 <CA+zSX=Y=BsVEp3o6jRprn5sntWVA0Z6wNXUxtffDN+=fPv_Fzg@mail.gmail.com>
 <D2496DDC-78FA-4CC1-B7FC-EB62E506BC4F@arm.com>
 <211c5cbb-2269-48b6-91b5-3a1a8127ce48@citrix.com>
 <5DA12CD1-9F65-43EE-BA11-0B4E45E3E44E@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5DA12CD1-9F65-43EE-BA11-0B4E45E3E44E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 25/01/2024 08:14, Bertrand Marquis wrote:
> Hi Andrew,
> 
>> On 25 Jan 2024, at 00:27, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 23/01/2024 8:29 am, Bertrand Marquis wrote:
>>>> Thanks for raising the visibility of this.  I'm not familiar with ARM,
>>>> but if I were investigating this I'd try to figure out what the
>>>> "unhandled" error messages are.  "gnttab_mark_dirty not implemented
>>>> yet" looks pretty sus too, and also sounds like it might be something
>>>> ARM-specific.
>>> I tried to explain those and they are not the reason of the problem.
>>
>> The "gnttab_mark_dirty not implemented yet" printk() should be deleted.
>>
>> It's /* TODO - logdirty support */ in a form that is actively unhelpful
>> to people using a debug hypervisor to debug other things.
> 
> Could make sense.
> It is true that this one appears in all debug log but it might not be
> very useful in fact.
> 
> @julien and Stefano: what would you say ?
I would be fine to replace the printk with a comment. I am happy to 
review it if someone wants to send a patch.

Cheers,

-- 
Julien Grall

