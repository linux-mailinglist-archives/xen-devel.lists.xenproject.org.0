Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 147093A8740
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 19:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142352.262683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltCc9-0003xL-Ge; Tue, 15 Jun 2021 17:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142352.262683; Tue, 15 Jun 2021 17:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltCc9-0003uo-Da; Tue, 15 Jun 2021 17:12:37 +0000
Received: by outflank-mailman (input) for mailman id 142352;
 Tue, 15 Jun 2021 17:12:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltCc7-0003ui-TE
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 17:12:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltCc5-00088o-GR; Tue, 15 Jun 2021 17:12:33 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltCc5-0002oZ-8P; Tue, 15 Jun 2021 17:12:33 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=GW5AmU1Yn1mLV0MhHismtI5cS8vL2PV+0Z0rJWlmtzA=; b=obHYWaWeDp3qPeeSAJauHrK2/f
	keBKFhyADL3h3KJ32oWrRO4YZykQGyAEpBeYGgi5xLhhDkj7cJSrxV9QR3R2EVLXbO9RJiBuh5AZ/
	2/1h0EIIRvJC8lG9hl+3KuPcuUXKiRc7GhNoXRnC8i7qhGJPblo+9ZJlG+6q8yrZ+nbY=;
Subject: Re: PING Re: [XEN PATCH] libs/foreignmemory: Fix
 osdep_xenforeignmemory_map prototype
From: Julien Grall <julien@xen.org>
To: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20210601154147.55799-1-anthony.perard@citrix.com>
 <a5d4f4ae-21b9-9798-5501-2c288a70e7b4@suse.com>
 <d80b6904-ff5c-33d6-b0e3-6882fe3e8e89@xen.org>
Message-ID: <1eed05e4-958c-c724-67dc-266cc0011c94@xen.org>
Date: Tue, 15 Jun 2021 19:12:30 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d80b6904-ff5c-33d6-b0e3-6882fe3e8e89@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 15/06/2021 15:31, Julien Grall wrote:
> Hi Ian & Wei,
> 
> On 02/06/2021 10:25, Jan Beulich wrote:
>> On 01.06.2021 17:41, Anthony PERARD wrote:
>>> Commit cf8c4d3d13b8 made some preparation to have one day
>>> variable-length-array argument, but didn't declare the array in the
>>> function prototype the same way as in the function definition. And now
>>> GCC 11 complains about it.
>>>
>>> Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length 
>>> argument to map forward")
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Ian - this (or whichever alternative might be chosen to address gcc11's
>> valid complaint) also will want backporting.
> 
> I was about to commit this patch and noticed that there is still a 
> missing an ack from the tools maintainers. @Ian, @Wei, can you provide one?

 From an IRC discussion, Ian was happy to follow the rule:

"Commit something without the necessary acks if you're reasonably 
certain that the maintainer would have approved it"

This doesn't seem to be part of MAINTAINERS, but I will use it for this 
patch as Ian gave his assent.

This is committed now.

Cheers,

-- 
Julien Grall

