Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E127636E9D7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 13:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119930.226756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc5GZ-0001sU-R7; Thu, 29 Apr 2021 11:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119930.226756; Thu, 29 Apr 2021 11:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc5GZ-0001s5-Nw; Thu, 29 Apr 2021 11:55:35 +0000
Received: by outflank-mailman (input) for mailman id 119930;
 Thu, 29 Apr 2021 11:55:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lc5GY-0001s0-5g
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 11:55:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc5GY-0003VT-0M; Thu, 29 Apr 2021 11:55:34 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc5GX-00034d-O7; Thu, 29 Apr 2021 11:55:33 +0000
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
	bh=6uim1+IRw/02nA1d4ujSW+6FKnUnu1DbHh1PJtrZPJ0=; b=T1YhCNNAz/yIpqwjSd8zrpt4Sz
	wrR7QiBNR+dpoROVfh2NPzSke48Mh+sQaypyWOIfaudVd18JKtFOYKvV3wgDaQ/YU6lsergy5DRki
	HSX9xxFnwL1BBXpiJHi45DWX2r0YPxnIBN5fQIOzM/mwRLWgVlM1GBLey+of9dIwA+uQ=;
Subject: Re: [PATCH v3] evtchn/fifo: don't enforce higher than necessary
 alignment
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2a08aa31-fdbf-89ee-cd49-813f818b709a@suse.com>
 <e6ce03a5-cfec-42ea-91c4-b51849e2f299@suse.com>
 <69766ecb-d234-eebb-9b31-1533389a502e@xen.org>
 <0377e61a-3813-0a9e-f724-418383c01050@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <04ef688f-1eb4-c17f-02f0-2cb7e5cb5c68@xen.org>
Date: Thu, 29 Apr 2021 12:55:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0377e61a-3813-0a9e-f724-418383c01050@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 22/04/2021 10:19, Jan Beulich wrote:
> On 21.04.2021 21:52, Julien Grall wrote:
>> Hi,
>>
>> On 21/04/2021 15:36, Jan Beulich wrote:
>>> Neither the code nor the original commit provide any justification for
>>> the need to 8-byte align the struct in all cases. Enforce just as much
>>> alignment as the structure actually needs - 4 bytes - by using alignof()
>>> instead of a literal number.
>>
>> I had another fresh look today at this patch. The 32-bit padding is
>> right after the field 'ready'.
>>
>> I can't for sure tell how the second half is going to ever be used and how.
>>
>> However, one possibility would be to extend the field 'ready' to 64-bit.
>> With the current code, we could easily make a single 64-bit access
>> without having to know whether the guest is able to interpret the top half.
> 
> I don't think extending field sizes is generally to be considered ABI-
> compatible. I also don't think we can re-use the field at all, as I
> couldn't find any checking of it being zero (input) or it getting set
> to zero (output). 

That's would be fine so long we have a flag to control it. We can still 
write unconditionally because a guest can't rely on the pad...

> struct evtchn_init_control, which in principle could
> be a way to convey respective controlling flags, similarly has no room
> for extension, as its _pad[] also doesn't look to get checked anywhere.
Right, we would need to have a different way to convey. Yet, I am still 
unconvinced of the benefits change offer in this patch.

I am not going to Nack. So another maintainer in "THE REST" can express 
support for your patch and ack it.

Cheers,

-- 
Julien Grall

