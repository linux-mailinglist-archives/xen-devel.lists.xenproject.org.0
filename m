Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304902F761B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 10:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67869.121327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Lsn-0003CU-2m; Fri, 15 Jan 2021 09:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67869.121327; Fri, 15 Jan 2021 09:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Lsm-0003C4-VK; Fri, 15 Jan 2021 09:59:04 +0000
Received: by outflank-mailman (input) for mailman id 67869;
 Fri, 15 Jan 2021 09:59:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0Lsl-0003By-MK
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 09:59:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0Lsk-0000a4-TP; Fri, 15 Jan 2021 09:59:02 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0Lsk-0002YC-Jc; Fri, 15 Jan 2021 09:59:02 +0000
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
	bh=t+6R6s7TQGJ88DNQUHjb2eBNQeWDHc4Kzd8x3YzjqoA=; b=MfKGdMCqU4eqaxHYVA3GnJzqn6
	SUzCmp6i8qPr+bRl4NFTdacnhKtraPdg8xiO38tJst+ZfF7uJuv4DJxMHnvwjUuQV7YvXJL7/MMSh
	tW0sV+4BtDc5S+Y/q6qyWQACnPbmC12Dy+T+u4uXQ1TlaZ2fXlBlvXrqSdBplY5RLZF0=;
Subject: Re: [PATCH] common: don't require use of DOMID_SELF
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
 <6b80d9bd-58a1-0854-2ff9-7153ddecae26@xen.org>
 <a53b09f9-a1cd-2f98-35e4-d8a6b16e1cc0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <30a85796-300f-3d50-b017-7b7f5cf6af35@xen.org>
Date: Fri, 15 Jan 2021 09:59:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <a53b09f9-a1cd-2f98-35e4-d8a6b16e1cc0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/01/2021 15:30, Jan Beulich wrote:
> On 14.01.2021 15:43, Julien Grall wrote:
>> On 14/01/2021 14:02, Jan Beulich wrote:
>>> It's not overly difficult for a domain to figure out its ID, so
>>> requiring the use of DOMID_SELF in a very limited set of places isn't
>>> really helpful towards keeping the ID opaque to the guest.
>>
>> So I agree that a domid can be figured out really easily today and in
>> principle it would be fine to relax it.
>>
>> However, most of the guest OSes will care about running on older Xen
>> versions. Therefore they are not going to be able to use this relaxation.
>>
>> So I am not entirely convinced the relaxation is actually worth it for
>> existing hypercalls.
> 
> I'm aware of the concern (Andrew has voiced it both here and in
> earlier contexts), but personally I think undue restrictions should
> not be retained just because they used to be enforced.

I don't disagree about the undue restrictions. My main concern is it 
makes more difficult for a developper to write portable code. The more 
when there is no easy way to find out the differences between Xen 
versions (see more below).

> We've gone
> this same route in a few other occasions not overly long ago, and
> iirc there are two patches going in a similar direction (different
> area of course) that I have still pending and which neither got
> ack-ed nor firmly rejected. >> Anyway, if we decide to relax it, then I think we should update the
>> public headers because an OS using this relaxation will not work on
>> older Xen. A developper will not be able to know that without looking at
>> the implementation.
> 
> Well, DOMID_SELF exists because that's the preferred form to use.
> I can certainly add commentary, but it would feel a little odd to
> do so.

Lets imagine your are the developer of a new OS but don't know Xen 
internal. How would you find out the difference between Xen interfaces?

With no documentation you have two choices:
    1) Dig into Xen code to understand the parameters
    2) Rely on the testing to find interface

Neither of the two solutions are great for the developper.

> To be honest I'm also not sure how helpful this is going to
> be, considering that consumers often have their own clones of our
> headers.
Right, but IMHO, anyone writing code that interface with the hypervisor 
should read the latest documentation/interface.

At the moment, most of our documentations are in the public headers. So 
it makes a suitable place.

We may need to duplicate the comment, but it is small enough to be fine.

Cheers,

-- 
Julien Grall

