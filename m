Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435AD4F62B3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299974.511374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7Ng-0007QW-Us; Wed, 06 Apr 2022 15:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299974.511374; Wed, 06 Apr 2022 15:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7Ng-0007Nw-Rv; Wed, 06 Apr 2022 15:15:36 +0000
Received: by outflank-mailman (input) for mailman id 299974;
 Wed, 06 Apr 2022 15:15:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nc7Nf-0007No-Ex
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:15:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nc7Ne-0006tP-LL; Wed, 06 Apr 2022 15:15:34 +0000
Received: from [54.239.6.190] (helo=[192.168.16.200])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nc7Ne-0007uQ-Ey; Wed, 06 Apr 2022 15:15:34 +0000
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
	bh=zrhhKxYRFt0oNNximxDKFPmJU0HX1ATTCZI1UaDNYBc=; b=zifQb8YS5m6vbD3arrdgagcnsu
	AabfW1ZmRnOxjeuAaSFY6SQvDaG7VHqVK3lhh1ZM5QMmc0MVv5Kbqvvj/Ks3TdMSrkFw3tt+nLIuC
	ilrJb+voV9co2QlP7b39Ik4UEJXfsBAw4mtL80wZgh9h+BZSi6v4KMM3KfeizgAVjziA=;
Message-ID: <6ec0e3d9-374c-1caa-9889-f091dcf894e3@xen.org>
Date: Wed, 6 Apr 2022 16:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] SUPPORT.md: extend security support for hosts to 12 TiB
 of memory
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <4c49e4cf-9d86-e630-a1bb-37afdf091c99@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4c49e4cf-9d86-e630-a1bb-37afdf091c99@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/04/2022 15:44, Jan Beulich wrote:
> c49ee0329ff3 ("SUPPORT.md: limit security support for hosts with very
> much memory"), as a result of XSA-385, restricted security support to
> 8 TiB of host memory. Extend this to 12 TiB, putting in place a guest
> restriction to 8 TiB in exchange.

And this is even without CONFIG_BIGMEM?

> 
> A 12 TiB host was certified successfully for use with Xen 4.14 as per
> https://www.suse.com/nbswebapp/yesBulletin.jsp?bulletinNumber=150753.
> This in particular included running as many guests (2 TiB each) as
> possible in parallel, to actually prove that all the memory can be used
> like this. It may be relevant to note that the Optane memory there was
> used in memory-only mode, with DRAM acting as cache.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -50,7 +50,7 @@ For the Cortex A57 r0p0 - r1p1, see Erra
>   
>   ### Physical Memory
>   
> -    Status: Supported up to 8 TiB
> +    Status: Supported up to 12 TiB

I am afraid this limit is going to be too high for Arm. Even the 
previous one was technically incorrect. From [1], it should be:
   - 5TB for arm64
   - 16GB for arm32

>   
>   Hosts with more memory are supported, but not security supported.
>   
> @@ -121,6 +121,14 @@ ARM only has one guest type at the momen
>   
>       Status: Supported
>   
> +## Guest Limits
> +
> +### Memory
> +
> +    Status: Supported up to 8 TiB

For Arm, this should be limited to 1TB for arm64 and 16GB for arm32.

> +
> +Guests with more memory are supported, but not security supported.

d->max_pages is a 32-bit value. So Xen can effectively only support up 
to 16TB of memory. AFAICT, it would require quite a bit rework to lift 
that limit. So I think it would be better to spell out the upper limit.

Cheers,

[1] https://wiki.xenproject.org/wiki/Xen_Project_Release_Features

-- 
Julien Grall

