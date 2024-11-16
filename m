Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9C49CFE52
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 11:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838766.1254748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCGJx-0005Uu-5e; Sat, 16 Nov 2024 10:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838766.1254748; Sat, 16 Nov 2024 10:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCGJx-0005SP-2q; Sat, 16 Nov 2024 10:46:29 +0000
Received: by outflank-mailman (input) for mailman id 838766;
 Sat, 16 Nov 2024 10:46:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCGJv-0005SJ-Ta
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 10:46:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCGJv-0080J2-1S;
 Sat, 16 Nov 2024 10:46:27 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCGJv-007wNl-1s;
 Sat, 16 Nov 2024 10:46:27 +0000
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
	bh=4xafzWDyFCS8EqMS8Q3J/7F9jW0pZGXTTfZD82KFeH4=; b=vUg79IESugv9Qb5BcRNcBoruRK
	c4QMdjifRfp5ytM5lz7YfYMbpNL+1j/N19zedUUeDbfk6Fj9imuMXpHS0AipjU/YMQQT4DIs+NF26
	wivINfgL8tVj18HjfpTK52n/m64vJTQnKccMu5fCaj59LyBhsrnK66m/KA3x01dLQk5s=;
Message-ID: <0f058cca-8c5b-4b6b-919b-cccff9ee2df6@xen.org>
Date: Sat, 16 Nov 2024 10:46:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen: add a domain unique id to each domain
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241023131005.32144-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/10/2024 14:10, Juergen Gross wrote:
> Xenstore is referencing domains by their domid, but reuse of a domid
> can lead to the situation that Xenstore can't tell whether a domain
> with that domid has been deleted and created again without Xenstore
> noticing the domain is a new one now.
> 
> Add a global domain creation unique id which is updated when creating
> a new domain, and store that value in struct domain of the new domain.
> The global unique id is initialized with the system time and updates
> are done via the xorshift algorithm which is used for pseudo random
> number generation, too (see https://en.wikipedia.org/wiki/Xorshift).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> V1:
> - make unique_id local to function (Jan Beulich)
> - add lock (Julien Grall)
> - add comment (Julien Grall)
> ---
>   xen/common/domain.c     | 20 ++++++++++++++++++++
>   xen/include/xen/sched.h |  3 +++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 92263a4fbd..3948640fb0 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -562,6 +562,25 @@ static void _domain_destroy(struct domain *d)
>       free_domain_struct(d);
>   }
>   
> +static uint64_t get_unique_id(void)
> +{
> +    static uint64_t unique_id;
> +    static DEFINE_SPINLOCK(lock);
> +    uint64_t x = unique_id ? : NOW();

I think unique_id needs to be read within the critical section. 
Otherwise, get_unique_id() could return the same ID twice.

> +
> +    spin_lock(&lock);
> +
> +    /* Pseudo-randomize id in order to avoid consumers relying on sequence. */
> +    x ^= x << 13;
> +    x ^= x >> 7;
> +    x ^= x << 17;
> +    unique_id = x;
> +
> +    spin_unlock(&lock);
> +
> +    return x;
> +}
> +
>   static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>   {
>       bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
> @@ -654,6 +673,7 @@ struct domain *domain_create(domid_t domid,
>   
>       /* Sort out our idea of is_system_domain(). */
>       d->domain_id = domid;
> +    d->unique_id = get_unique_id();
>   
>       /* Holding CDF_* internal flags. */
>       d->cdf = flags;
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 90666576c2..1dd8a425f9 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -370,6 +370,9 @@ struct domain
>       domid_t          domain_id;
>   
>       unsigned int     max_vcpus;
> +
> +    uint64_t         unique_id;       /* Unique domain identifier */
> +
>       struct vcpu    **vcpu;
>   
>       shared_info_t   *shared_info;     /* shared data area */

Cheers,

-- 
Julien Grall

