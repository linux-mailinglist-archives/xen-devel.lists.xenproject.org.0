Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A802464AB7
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:33:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235717.408884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLzG-0007dV-QZ; Wed, 01 Dec 2021 09:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235717.408884; Wed, 01 Dec 2021 09:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLzG-0007bi-NH; Wed, 01 Dec 2021 09:33:14 +0000
Received: by outflank-mailman (input) for mailman id 235717;
 Wed, 01 Dec 2021 09:33:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1msLzF-0007bc-Bx
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:33:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msLzE-0000JS-Mn; Wed, 01 Dec 2021 09:33:12 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.22.155]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msLzE-00053B-G0; Wed, 01 Dec 2021 09:33:12 +0000
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
	bh=nQbPJnriUaqVckOX1PDcAnacCp6QfkBl1JOSRJsYzwY=; b=mnErIKAZ8tvIwLdIAlrGtWNjrb
	JmxGIAN7HLywYDXLGJN3OMGMK0p987SVv+lWRLB1xxyajQKogry4DOYGz+/ll7NgtwA+P3Rx3moMQ
	0dST7XBkhQJ6MXz5bWnafOn4M4/x711gmNUD3Pc/77wWYnTpJbz8kg1v0eQkdNK+Dk9o=;
Message-ID: <c018e9dc-5221-a7e8-3da9-ebdb2c88311b@xen.org>
Date: Wed, 1 Dec 2021 09:33:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v2] bitops: Fix incorrect value in comment
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, jbeulich@suse.com,
 Ayan Kumar Halder <ayankuma@xilinx.com>, andre.przywara@arm.com
References: <20211130181238.5501-1-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211130181238.5501-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/11/2021 18:12, Ayan Kumar Halder wrote:
> GENMASK(30, 21) should be 0x7fe00000. Fixed this in the comment
> in bitops.h.

I am afraid this commit message is incomplete. You say you just 
corrected the bitmask returned but...

> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
> Changelog :-
> v2 :- 1. Replaced the word "vector" with "value" in comment.
> 2. Changed 0x07fe00000 to 0x7fe00000.
> 3. Updated the commit message to make it meaningful.
> (All suggested by Jan Beulich)
> 
>   xen/include/xen/bitops.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> index a64595f68e..dad4b5aa1e 100644
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -5,7 +5,7 @@
>   /*
>    * Create a contiguous bitmask starting at bit position @l and ending at
>    * position @h. For example
> - * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
> + * GENMASK(30, 21) gives us the 32bit value 0x7fe00000.

... there are two extra changes here:
   1) The bitmask is now described with 8-characters (rather than 9)
   2) 'vector' is replaced with 'value'

The former makes sense to me, but it is not clear to me why the latter 
should be changed.

Cheers,

-- 
Julien Grall

