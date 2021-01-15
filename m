Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C102F788B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 13:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68032.121687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0O1V-0002sN-Op; Fri, 15 Jan 2021 12:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68032.121687; Fri, 15 Jan 2021 12:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0O1V-0002ry-Le; Fri, 15 Jan 2021 12:16:13 +0000
Received: by outflank-mailman (input) for mailman id 68032;
 Fri, 15 Jan 2021 12:16:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0O1U-0002rp-Ew
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 12:16:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0O1T-00033C-Dw; Fri, 15 Jan 2021 12:16:11 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0O1T-0004QH-7k; Fri, 15 Jan 2021 12:16:11 +0000
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
	bh=FTKcGsVmTRuCrxwdhVwlpvZerTPTIWHSQJkpMZ1o+IQ=; b=RbqA4csspFjyjAoXY96yJuw8iB
	O5HkjEIHU9ob1oldaJUsYWThZXtALKg5U7NdjxeDSeI9JGctJzFa+98AP5tqfAELu2k3R5PDDU/wm
	2ygeaKPjENDn/JEgboI4Xc2hfGyJhs8gAiGyuqiue3BkHhFn8Kya5u09VokId9jsMgNI=;
Subject: Re: [PATCH v4 07/11] xen/arm: bitops: Implement a ffsll function
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <7c0410f150d78bae49c1d8ae0d918b56c2b0c7de.1610115608.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0dc36eca-9fec-2e1d-7904-137b427a74bb@xen.org>
Date: Fri, 15 Jan 2021 12:16:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <7c0410f150d78bae49c1d8ae0d918b56c2b0c7de.1610115608.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 08/01/2021 14:46, Rahul Singh wrote:
> Implement the ffsll based on built-in function "__builtin_ffsll()"
> 
> ffsll will return one plus the index of the least significant 1-bit in
> doublewords or if doublewords is zero, returns zero.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in V4:
>   - This patch is introduce in this verison.
> ---
>   xen/include/asm-arm/bitops.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/xen/include/asm-arm/bitops.h b/xen/include/asm-arm/bitops.h
> index 71ae14cab3..7f83ee1828 100644
> --- a/xen/include/asm-arm/bitops.h
> +++ b/xen/include/asm-arm/bitops.h
> @@ -170,6 +170,18 @@ static inline unsigned int find_first_set_bit(unsigned long word)
>           return ffsl(word) - 1;
>   }
>   
> +/**
> + * ffsll - find the first least significant set bit
> + * @doubleword: double word to search
> + *
> + * Returns one plus the index of the least significant 1-bit in @doubleword
> + * or if doubleword is zero, returns zero.
> + */
> +static inline int ffsll(long long doubleword)

If I am not mistaken, we already have an helper doing exactly the same 
(see ffs64() in xen/bitops.h).

Can you check if it is effectively the case and use it?

Cheers,

-- 
Julien Grall

