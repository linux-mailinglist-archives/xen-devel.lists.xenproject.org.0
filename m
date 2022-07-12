Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC85721C1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 19:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365971.596494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBJgk-0006ff-9C; Tue, 12 Jul 2022 17:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365971.596494; Tue, 12 Jul 2022 17:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBJgk-0006cz-6V; Tue, 12 Jul 2022 17:28:46 +0000
Received: by outflank-mailman (input) for mailman id 365971;
 Tue, 12 Jul 2022 17:28:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oBJgi-0006ct-KK
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 17:28:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBJgi-00044c-6X; Tue, 12 Jul 2022 17:28:44 +0000
Received: from [54.239.6.187] (helo=[192.168.9.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBJgh-0000lB-Ve; Tue, 12 Jul 2022 17:28:44 +0000
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
	bh=e2HEhEiGMUhE8eMHuzNGcK/l3cgZlCvrEZV4JUy+p/U=; b=D+LcnBQTyrlBJP0IEArU9BLCCH
	8h9EWHIISYfF9hMYGh13WJkMUtDw2RqZTu+M8zbDnrh88QXMtMlapqk+B71bM8TFmfRSKjMlFMsKw
	RNBAJE2DwUux+zt7xpOw6PjaGCe8Hx+zpFzVwUA+W9nOHJAZ4CG25cij1eutaloheJBY=;
Message-ID: <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
Date: Tue, 12 Jul 2022 18:28:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/07/2022 17:08, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,
>> On 22 Jun 2022, at 3:51 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 22/06/2022 15:37, Rahul Singh wrote:
>>> evtchn_alloc_unbound() always allocates the next available port. Static
>>> event channel support for dom0less domains requires allocating a
>>> specified port.
>>> Modify the evtchn_alloc_unbound() to accept the port number as an
>>> argument and allocate the specified port if available. If the port
>>> number argument is zero, the next available port will be allocated.
>>
>> I haven't yet fully reviewed this series. But I would like to point out that this opening a security hole (which I thought I had mention before) that could be exploited by a guest at runtime.
>>
>> You would need [1] or similar in order to fix the issue. I am wrote "similar" because the patch could potentially be a problem if you allow a guest to use FIFO (you may need to allocate a lot of memory to fill the hole).
>>
>> Cheers,
>>
>> [1] https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=commit;h=2d89486fcf11216331e58a21b367b8a9be1af725
> 
> Thanks for sharing the patch.  If you are okay I can use this patch in next version to fix the security hole.

I am fine with that.

> 
> For the FIFO issue, we can introduce the new config option to restrict the maximum number of static
> port supported in Xen. We can check the user-defined static port when we parse the device tree and if
> a user-defined static port is greater than the maximum allowed static port will return an error to the user.
> In this way, we can avoid allocating a lot of memory to fill the hole.
> 
> Let me know your view on this.
> 
> config MAX_STATIC_PORT
>      int "Maximum number of static ports”
>      range 1 4095
>      help
>         Controls the build-time maximum number of static port supported

The problem is not exclusive to the static event channel. So I don't 
think this is right to introduce MAX_STATIC_PORT to mitigate the issue 
(even though this is the only user today).

A few of alternative solutions:
   1) Handle preemption in alloc_evtchn_bucket()
   2) Allocate all the buckets when the domain is created (the max 
numbers event channel is known). We may need to think about preemption
   3) Tweak is_port_valid() to check if the bucket is valid. This would 
introduce a couple of extra memory access (might be OK as the bucket 
would be accessed afterwards) and we would need to update some users.

At the moment, 3) is appealing me the most. I would be interested to 
have an opionions from the other maintainers.

Cheers,

-- 
Julien Grall

