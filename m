Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D4D533B18
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 12:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337125.561638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntoii-0005ya-BQ; Wed, 25 May 2022 10:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337125.561638; Wed, 25 May 2022 10:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntoii-0005vI-8a; Wed, 25 May 2022 10:58:28 +0000
Received: by outflank-mailman (input) for mailman id 337125;
 Wed, 25 May 2022 10:58:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntoig-0005v6-Cx
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 10:58:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntoif-0006jz-L4; Wed, 25 May 2022 10:58:25 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.21.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntoif-0006aY-Ey; Wed, 25 May 2022 10:58:25 +0000
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
	bh=wb21tvMwamgQVXjHLuXLsmVqCbuV0KapQD8Yu8rT6Tk=; b=V0MyhWuRGKVFmJWhQRy7KfoiZC
	TmIk6ZArrAsxAg7Iz6Ta7mXx/V83FnxqdLxKHOrLP1TflaW3+wVswkY0jLQfCGGySrJ+aKYy+Sw8W
	zxq6Z3BY9isTVhkfsHqoJcHbDN5XL3TGv26ixh47ThOFnW1e7qtE+oA8F/TtenOtBWdU=;
Message-ID: <6f333841-17e3-c9ac-580a-fc89f1741596@xen.org>
Date: Wed, 25 May 2022 11:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2] SUPPORT.md: extend security support for x86 hosts to
 12 TiB of memory
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <5835df1e-8f92-79ce-94c5-1b5df9c9ff65@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5835df1e-8f92-79ce-94c5-1b5df9c9ff65@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/05/2022 10:21, Jan Beulich wrote:
> c49ee0329ff3 ("SUPPORT.md: limit security support for hosts with very
> much memory"), as a result of XSA-385, restricted security support to
> 8 TiB of host memory. While subsequently further restricted for Arm,
> extend this to 12 TiB on x86, putting in place a guest restriction to
> 8 TiB (or yet less for Arm) in exchange.
> 
> A 12 TiB x86 host was certified successfully for use with Xen 4.14 as
> per https://www.suse.com/nbswebapp/yesBulletin.jsp?bulletinNumber=150753.
> This in particular included running as many guests (2 TiB each) as
> possible in parallel, to actually prove that all the memory can be used
> like this. It may be relevant to note that the Optane memory there was
> used in memory-only mode, with DRAM acting as cache.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Rebase over new host limits for Arm. Refine new guest values for
>      Arm.
> 
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -50,7 +50,7 @@ For the Cortex A57 r0p0 - r1p1, see Erra
>   
>   ### Physical Memory
>   
> -    Status, x86: Supported up to 8 TiB. Hosts with more memory are supported, but not security supported.
> +    Status, x86: Supported up to 12 TiB. Hosts with more memory are supported, but not security supported.
>       Status, Arm32: Supported up to 12 GiB
>       Status, Arm64: Supported up to 2 TiB
>   
> @@ -121,6 +121,17 @@ ARM only has one guest type at the momen
>   
>       Status: Supported
>   
> +## Guest Limits
> +
> +### Memory
> +
> +    Status, x86: Supported up to 8 TiB
> +    Status, Arm64: Supported up to 1 TiB
> +    Status, Arm32: Supported up to 32 GiB

IIRC, the max the architecture would allow us is 16 Gib. Here we are 
limited with how much physical memory is supported by Xen. So this wants 
to be 12 GiB.


> +
> +Guests with more memory, but less than 16 TiB, are supported,
> +but not security supported.

On Arm32, we definitely can't support up to 16 TiB. On Arm64, we would 
need some work to support it. So I would move this sentence in the 
"Status, x86" section.

Cheers,

-- 
Julien Grall

