Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21773DBD89
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 19:15:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162623.298178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9W5u-00039X-G4; Fri, 30 Jul 2021 17:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162623.298178; Fri, 30 Jul 2021 17:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9W5u-00037J-CE; Fri, 30 Jul 2021 17:14:46 +0000
Received: by outflank-mailman (input) for mailman id 162623;
 Fri, 30 Jul 2021 17:14:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m9W5s-00037D-Qv
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 17:14:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m9W5r-0007nV-G9; Fri, 30 Jul 2021 17:14:43 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m9W5r-0008WV-9u; Fri, 30 Jul 2021 17:14:43 +0000
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
	bh=awmYRQXf2EgzawXjK3Ac8YHe+leA+8ZV8uM1p3Snf/I=; b=R/99Kifesk/byYQpn3zA0G5uN8
	IeavFP/FKm6NmVEKQDW4mIbryx34WFv9QoUGc8Qsv1u+Bxc7DgH61tCv1b4SdU35C2w7RV0KLDFTr
	rCDEOTEdYCZHVbzP8THgZgl3B0sJH262oRyPkNlagsDu9ogl13KefvwDxHSlH69vBiUc=;
Subject: Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
To: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20210730122643.2043-1-jgross@suse.com>
 <20210730122643.2043-3-jgross@suse.com>
 <24836.28.655841.510063@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>
Date: Fri, 30 Jul 2021 18:14:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24836.28.655841.510063@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 30/07/2021 14:35, Ian Jackson wrote:
> Juergen Gross writes ("[PATCH v3 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
>> Add a configuration item for the maximum number of domains xenstored
>> should support and set the limit of open file descriptors accordingly.
>>
>> For HVM domains there are up to 5 socket connections per domain (2 by
>> the xl daemon process, and 3 by qemu). So set the ulimit for xenstored
>> to 5 * XENSTORED_MAX_DOMAINS + 100 (the "+ 100" is for some headroom,
>> like logging, event channel device, etc.).
> ...
>> +## Type: integer
>> +## Default: 32768
>> +#
>> +# Select maximum number of domains supported by xenstored.
>> +# Only evaluated if XENSTORETYPE is "daemon".
>> +#XENSTORED_MAX_N_DOMAINS=32768
> 
> I approve of doing something about the fd limit.  I have some qualms
> about the documentation.
> 
> The documentation doesn't say what happens if this limit is exceeded.
> Also the default of 32758 suggests that we actually support that many
> domains.  I don't think we do...
> 
> I didn't find anything in SUPPORT.md about how many guests we support
> but I wouldn't want this setting here to imply full support for 32768
> domains.
> 
> If you don't want to tackle this can of works, maybe add this:
> 
>    # This just controls some resource limits for xenstored; if the
>    # limit is exceeded, xenstored will stop being able to function
>    # properly for additional guests.  The default value is so large
>    # that it won't be exceeded in a supported configuration, but
>    # should not be taken to mean that the whole Xen system is
>    # guaranteed to work properly with that many guests.
> 
> Julien, did you ask for this to be made configurable ?  Having written
> the text above, I wonder if it wouldn't just be better to
> unconditionally set it to "unlimited" rather than offering footgun
> dressed up like a tuneable...

So in v1 (see [1]), Juergen wanted to raise the limit. I assumed this 
meant that the default limit (configured by the system may not be enough).

I felt this was wrong to impose an higher limit on everyone when an 
admin may know the maximum number of domains.

By "unlimited", do you mean the calling "ulimit" (or whatever is used 
for configuring FDs) with unlimited?

If so, I would be OK with that. My main was was to move the raising the 
limit outside Xenstored because:
  1) This is easier for an admin to tweak it (in particular the OOM)
  2) It feels wrong to me that the daemon chose the limits
  3) An admin can enforce it

Cheers,

[1] 1e38cce0-6960-ac21-b349-dac8551e23ed@xen.org

-- 
Julien Grall

