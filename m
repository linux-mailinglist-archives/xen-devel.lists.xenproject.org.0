Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D13D599718
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 10:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390137.627391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxNF-00031G-UN; Fri, 19 Aug 2022 08:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390137.627391; Fri, 19 Aug 2022 08:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxNF-0002y3-R7; Fri, 19 Aug 2022 08:29:01 +0000
Received: by outflank-mailman (input) for mailman id 390137;
 Fri, 19 Aug 2022 08:29:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOxNE-0002xx-Rn
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 08:29:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOxNE-00040c-GL; Fri, 19 Aug 2022 08:29:00 +0000
Received: from [54.239.6.188] (helo=[192.168.16.114])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOxNE-00065m-AI; Fri, 19 Aug 2022 08:29:00 +0000
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
	bh=T1DniYxvh+soHF3b4qDNzU4NRsFcg/H5V9saA8j6vdY=; b=ctp3/vfsvd2pZ8fCWiyhffMXp3
	lvUvEeAkxUxZqmZAadJxI/zvGjbHPmpCcUqls9Yz7WKFNZ5mcSN/4e761Pwi+kT9KpohVUQ4PT6iQ
	Dc4T5Ryc5hEDjKBaTg3qNg8VzGmu86mZj2PycYegq0pQQkBvhc5GcdKahtCT2FvezrJE=;
Message-ID: <c9a6d9c4-ea22-c429-fcad-547df02a0248@xen.org>
Date: Fri, 19 Aug 2022 09:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 1/2] Arm32: correct string.h functions for "int" ->
 "unsigned char" conversion
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <14e9bd8c-3f4c-4d7c-401a-c9de7b483308@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <14e9bd8c-3f4c-4d7c-401a-c9de7b483308@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/08/2022 08:49, Jan Beulich wrote:
> While Arm64 does so uniformly, for Arm32 only strchr() currently handles
> this properly. Add the necessary conversion also to strrchr(), memchr(),
> and memset().
> 
> As to the placement in memset(): Putting the new insn at the beginning
> of the function could perhaps be deemed more "obvious", but the code
> reachable without ever making it to the "1" label only ever does byte
> stores.
So the assumption here is the rest of the code will always use byte 
stores. Given that this issue has been present for a long time, I think 
it would be wiser to do the conversion at the start of the function.

The changes in memchr() and strrchr() looks fine to me.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/arm32/lib/memchr.S
> +++ b/xen/arch/arm/arm32/lib/memchr.S
> @@ -14,6 +14,7 @@
>   	.text
>   	.align	5
>   ENTRY(memchr)
> +	and	r1, r1, #0xff
>   1:	subs	r2, r2, #1
>   	bmi	2f
>   	ldrb	r3, [r0], #1
> --- a/xen/arch/arm/arm32/lib/memset.S
> +++ b/xen/arch/arm/arm32/lib/memset.S
> @@ -21,7 +21,8 @@ ENTRY(memset)
>   
>    * we know that the pointer in ip is aligned to a word boundary.
>    */
> -1:	orr	r1, r1, r1, lsl #8
> +1:	and	r1, r1, #0xff
> +	orr	r1, r1, r1, lsl #8
>   	orr	r1, r1, r1, lsl #16
>   	mov	r3, r1
>   	cmp	r2, #16
> --- a/xen/arch/arm/arm32/lib/strrchr.S
> +++ b/xen/arch/arm/arm32/lib/strrchr.S
> @@ -14,6 +14,7 @@
>   		.text
>   		.align	5
>   ENTRY(strrchr)
> +		and	r1, r1, #0xff
>   		mov	r3, #0
>   1:		ldrb	r2, [r0], #1
>   		teq	r2, r1
> 

Cheers,

-- 
Julien Grall

