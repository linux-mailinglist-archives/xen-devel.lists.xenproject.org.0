Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC4185BAFB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 12:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683452.1062982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcOfi-0004st-9C; Tue, 20 Feb 2024 11:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683452.1062982; Tue, 20 Feb 2024 11:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcOfi-0004qM-6U; Tue, 20 Feb 2024 11:52:26 +0000
Received: by outflank-mailman (input) for mailman id 683452;
 Tue, 20 Feb 2024 11:52:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rcOfg-0004qE-Bs
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 11:52:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcOfe-000106-OE; Tue, 20 Feb 2024 11:52:22 +0000
Received: from [15.248.2.238] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcOfe-0005IK-I8; Tue, 20 Feb 2024 11:52:22 +0000
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
	bh=wbrEDILVp4grnBFXiGbeWqL9LdN5bNqLHXmk79SVRTU=; b=5sulXFrXBVy9DjZEF1NvBCx09n
	fuQXRycHoQyQ4qMNQgY1Ecp0hUeDTNYCRkUmlHiiQrdCNun+NjMO6gdly+ZJeNWmMYyVSn5Ort2Zk
	aZpmW5rKVTeb8dqUht9lPwVW4x7dyWJq8cns5x7h7Uy9nqkdwrQMXznQ2PNkT3MzEgaM=;
Message-ID: <a2348c5f-39ce-42f3-ad2a-a5edf88352e9@xen.org>
Date: Tue, 20 Feb 2024 11:52:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] almost fully ignore zero-size flush requests
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
 <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com>
 <7dd78c97-b82f-4ae1-a257-98f612c6bad2@xen.org>
 <6466155e-9883-4743-a897-ef565f14fdf0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6466155e-9883-4743-a897-ef565f14fdf0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/02/2024 08:26, Jan Beulich wrote:
> On 19.02.2024 23:22, Julien Grall wrote:
>> Title: I would add 'gnttab:' to clarify which subsystem you are modifying.
> 
> That's how I actually have it here; it's not clear to me why I lost the
> prefix when sending.
> 
>> On 05/02/2024 11:03, Jan Beulich wrote:
>>> Along the line with observations in the context of XSA-448, besides
>>> "op" no field is relevant when the range to be flushed is empty, much
>>> like e.g. the pointers passed to memcpy() are irrelevant (and would
>>> never be "validated") when the passed length is zero. Split the existing
>>> condition validating "op", "offset", and "length", leaving only the "op"
>>> part ahead of the check for length being zero (or no flushing to be
>>> performed).
>>
>> I am probably missing something here. I understand the theory behind
>> reducing the number of checks when len == 0. But an OS cannot rely on it:
>>     1) older hypervisor would still return an error if the check doesn't
>> pass)
> 
> Right, but that's no reason to keep the bogus earlier behavior.

Hmmm... I am not sure why you say the behavior is bogus. From the commit 
message, it seems this is just an optimization that have side effect 
(ignoring the other fields).

> 
>>     2) it does feel odd to allow "invalid" offset when len == 0 (at least.
> 
> I'm puzzled: You've given R-b for patch 1 (thanks), where exactly the
> same reasoning is used, i.e. similarly referring to memcpy() to
> justify the (new / supposed) behavior.

I realize it. But I viewed it slightly different as you are adding the 
check. I think it is a good idea to add the check and ideally it should 
be after.

Here you don't seem to add any check and only re-order it. Hence why I 
treated it differently.

Cheers,

-- 
Julien Grall

