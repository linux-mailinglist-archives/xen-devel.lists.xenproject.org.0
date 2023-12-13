Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7553280ECAB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 13:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653100.1019325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2Kk-0006Pm-QY; Tue, 12 Dec 2023 12:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653100.1019325; Tue, 12 Dec 2023 12:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2Kk-0006Mz-Nr; Tue, 12 Dec 2023 12:57:58 +0000
Received: by outflank-mailman (input) for mailman id 653100;
 Tue, 12 Dec 2023 12:57:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD2Kj-0006Mt-BQ
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 12:57:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD2Kj-0006rb-67; Tue, 12 Dec 2023 12:57:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD2Ki-0003wo-V3; Tue, 12 Dec 2023 12:57:57 +0000
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
	bh=eibWchE1L62Y+xtGPEEyf4o62UjRh+mYlk+et5su8xk=; b=XuRdZLGXhkTGVd4FVAbjPz7k9f
	EH7rcPi+v2Jj62i2dCMTUZWpcqNJlRacTls9eSwqLkT0Ruy3rOUKMS/aSRk/nY2dJ4G2u4HHdtk7s
	G2sTzM06VYVazDG3LaC4Tkn+WNIWyVMDPmo6LZBqFAPzxQLjgKPs/TPCXi4Bt6K2G+s4=;
Message-ID: <ea25863a-f5da-4873-89f2-d75b3abb9ef8@xen.org>
Date: Tue, 12 Dec 2023 12:57:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] xen/spinlock: introduce new type for recursive
 spinlocks
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231212094725.22184-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 12/12/2023 09:47, Juergen Gross wrote:
> diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> index 1cd9120eac..20d15f34dd 100644
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -45,7 +45,7 @@ union lock_debug { };
>       lock profiling on:
>   
>       Global locks which should be subject to profiling must be declared via
> -    DEFINE_SPINLOCK.
> +    DEFINE_[R]SPINLOCK.
>   
>       For locks in structures further measures are necessary:
>       - the structure definition must include a profile_head with exactly this
> @@ -56,7 +56,7 @@ union lock_debug { };
>       - the single locks which are subject to profiling have to be initialized
>         via
>   
> -      spin_lock_init_prof(ptr, lock);
> +      [r]spin_lock_init_prof(ptr, lock);
>   
>         with ptr being the main structure pointer and lock the spinlock field
>   
> @@ -109,12 +109,16 @@ struct lock_profile_qhead {
>       spinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                 \
>       static struct lock_profile __lock_profile_data_##l = _LOCK_PROFILE(l);    \
>       _LOCK_PROFILE_PTR(l)
> +#define DEFINE_RSPINLOCK(l)                                                   \
> +    rspinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                \
> +    static struct lock_profile __lock_profile_data_##l = _LOCK_PROFILE(l);    \
> +    _LOCK_PROFILE_PTR(l)
>   
> -#define spin_lock_init_prof(s, l)                                             \
> +#define __spin_lock_init_prof(s, l, locktype)                                 \

If I am not mistaken the double-underscore prefix is a violation in 
MISRA. So can this be renamed to:

spin_lock_init_prof__()?

The rest of the code looks fine. I have checked the lock you are 
modifying in common/drivers and they all are meant to be recursive lock:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

