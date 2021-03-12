Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477C339292
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 16:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97215.184563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkBq-0002iT-KM; Fri, 12 Mar 2021 15:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97215.184563; Fri, 12 Mar 2021 15:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkBq-0002i3-F6; Fri, 12 Mar 2021 15:59:02 +0000
Received: by outflank-mailman (input) for mailman id 97215;
 Fri, 12 Mar 2021 15:59:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKkBp-0002hy-5B
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 15:59:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9a85205-d6d9-45fe-8c28-43b7ec5d9819;
 Fri, 12 Mar 2021 15:59:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77C1BB126;
 Fri, 12 Mar 2021 15:58:59 +0000 (UTC)
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
X-Inumbo-ID: c9a85205-d6d9-45fe-8c28-43b7ec5d9819
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615564739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1sysbFB17Or6V00qOcCRJOBVe83PeMncfFsr7otsfY=;
	b=JclNHvwAoTVVbEJ30F5fNVBzQS8RMxrGTEIiK149snnftKdqghSv1oFOX87IWCFKiwA6eM
	hLmyiB7rjlDOXKKdQXUwxoTwUaBKiS94O2l2zM/i+l4NMHKy3lTNy6zmzR2kjUMkY+Tr+X
	HSnYn8ELoNAyvnmmimwKPqK30Let780=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
 <6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
 <e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
 <24651.15544.142804.468744@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46176065-8ae3-cb42-f031-aad12512d29e@suse.com>
Date: Fri, 12 Mar 2021 16:59:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24651.15544.142804.468744@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.03.2021 11:04, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH][4.15] gnttab: work around "may be used uninitialized" warning"):
>> This is pretty much what we are already doing slowly by initializing 
>> values to shut up older compilers. I agree this is more limited, but we 
>> also waive off diagnostics from every single compiler in that code 
>> rather than just one version.
>>
>> Hence why I suggested dropping -Werror for older compiler. This is not 
>> ideal but it would give us the ability to keep support for dinausor 
>> compiler and not hamper our ability to take advantage of newer compiler 
>> diagnostics.
> 
> I agree with Julien.  I think we should avoid adding these redundant
> initialisers for the reasons he gives.
> 
>> The ideal solution is to drop support for older compiler (see my other 
>> thread). But this sounds like a daunting task so far on x86...
>>
>> Anyway, I will not Nack the patch but will also not Ack it. I will let 
>> another maintainer ack this patch.
> 
> But this is outside my usual area so I won't nack it either.

But would you be willing to release-ack v2?

Jan

