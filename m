Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2918F68192A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487159.754679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYuN-0005BE-Aq; Mon, 30 Jan 2023 18:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487159.754679; Mon, 30 Jan 2023 18:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYuN-00058k-83; Mon, 30 Jan 2023 18:29:35 +0000
Received: by outflank-mailman (input) for mailman id 487159;
 Mon, 30 Jan 2023 18:29:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMYuM-00058c-Dp
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:29:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMYuM-0000iC-Cr; Mon, 30 Jan 2023 18:29:34 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMYuM-0004QW-7r; Mon, 30 Jan 2023 18:29:34 +0000
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
	bh=tzqDTVV8yfUrv9E4PbVKIfBZM3FKqaSLTNPG7sYwDNI=; b=n2GdjzizIy3/+kWvwYHUrllMT9
	C4BrrxMFcV6Nrb67tQJ9vdGVpefGNujkjmQb9/4ETL7Nqey392VPq2cCC49j5oWPEPqbIU0nRhmh9
	9zC95hnUQf2kCDmHo7nuKlatqM5yQ0bqoUNVmr9OZlMWJ+uAm7REukCLdq92yTQq+r+0=;
Message-ID: <865b2983-ca59-a135-e52d-8b33b5ef1c81@xen.org>
Date: Mon, 30 Jan 2023 18:29:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/common: rwlock: Constify the parameter of
 _rw_is{,_write}_locked()
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>
References: <20230130182840.86744-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230130182840.86744-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I forgot to CC the maintainers. Please ignore this version.

Cheers,

On 30/01/2023 18:28, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The lock is not meant to be modified by _rw_is{,_write}_locked(). So
> constify it.
> 
> This is helpful to be able to assert if the lock is taken when the
> underlying structure is const.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   xen/include/xen/rwlock.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
> index b8d52a5aa939..e0d2b41c5c7e 100644
> --- a/xen/include/xen/rwlock.h
> +++ b/xen/include/xen/rwlock.h
> @@ -149,7 +149,7 @@ static inline void _read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
>       local_irq_restore(flags);
>   }
>   
> -static inline int _rw_is_locked(rwlock_t *lock)
> +static inline int _rw_is_locked(const rwlock_t *lock)
>   {
>       return atomic_read(&lock->cnts);
>   }
> @@ -254,7 +254,7 @@ static inline void _write_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
>       local_irq_restore(flags);
>   }
>   
> -static inline int _rw_is_write_locked(rwlock_t *lock)
> +static inline int _rw_is_write_locked(const rwlock_t *lock)
>   {
>       return (atomic_read(&lock->cnts) & _QW_WMASK) == _QW_LOCKED;
>   }

-- 
Julien Grall

