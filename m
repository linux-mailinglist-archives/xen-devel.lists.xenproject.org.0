Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2F02C9A3E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41751.75160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk1RV-0001Nw-QB; Tue, 01 Dec 2020 08:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41751.75160; Tue, 01 Dec 2020 08:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk1RV-0001NX-N1; Tue, 01 Dec 2020 08:55:25 +0000
Received: by outflank-mailman (input) for mailman id 41751;
 Tue, 01 Dec 2020 08:55:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kk1RU-0001NS-E3
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:55:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3b7a3dd-f7b6-444f-bf74-0270d97608e1;
 Tue, 01 Dec 2020 08:55:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5620ACA8;
 Tue,  1 Dec 2020 08:55:21 +0000 (UTC)
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
X-Inumbo-ID: b3b7a3dd-f7b6-444f-bf74-0270d97608e1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606812922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DAvSpJ/mylxBxeBiq1yxunlL1Xy2FoBL45NFThfm2E=;
	b=ZTpcSMuq5ube2ooETDSTxmQYoea4DLrZTIE+2qWETTC+IyWaICboFVdJXdMjsRWMfje2tr
	zx54s065aETpuZSmQn5gyp/yD3K/3/duSRMySH1DDmqNTYfPHSdtXnGKEdxIACO/IldF74
	6YjkGJiZaw727/74O9q/NQCf4SPdjnY=
Subject: Re: [PATCH v2 04/17] xen/cpupool: switch cpupool id to unsigned
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0bac022-fe6e-aae6-6d07-6a2b9bc492b3@suse.com>
Date: Tue, 1 Dec 2020 09:55:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-5-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> @@ -243,11 +243,11 @@ void cpupool_put(struct cpupool *pool)
>   * - unknown scheduler
>   */
>  static struct cpupool *cpupool_create(
> -    int poolid, unsigned int sched_id, int *perr)
> +    unsigned int poolid, unsigned int sched_id, int *perr)
>  {
>      struct cpupool *c;
>      struct cpupool **q;
> -    int last = 0;
> +    unsigned int last = 0;
>  
>      *perr = -ENOMEM;
>      if ( (c = alloc_cpupool_struct()) == NULL )
> @@ -256,7 +256,7 @@ static struct cpupool *cpupool_create(
>      /* One reference for caller, one reference for cpupool_destroy(). */
>      atomic_set(&c->refcnt, 2);
>  
> -    debugtrace_printk("cpupool_create(pool=%d,sched=%u)\n", poolid, sched_id);
> +    debugtrace_printk("cpupool_create(pool=%u,sched=%u)\n", poolid, sched_id);
>  
>      spin_lock(&cpupool_lock);

Below from here we have

    c->cpupool_id = (poolid == CPUPOOLID_NONE) ? (last + 1) : poolid;

which I think can (a) wrap to zero and (b) cause a pool with id
CPUPOOLID_NONE to be created. The former is bad in any event, and
the latter will cause confusion at least with cpupool_add_domain()
and cpupool_get_id(). I realize this is a tangential problem, i.e.
may want fixing in a separate change.

> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -505,8 +505,8 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
>  
>  struct cpupool
>  {
> -    int              cpupool_id;
> -#define CPUPOOLID_NONE    (-1)
> +    unsigned int     cpupool_id;
> +#define CPUPOOLID_NONE    (~0U)

How about using XEN_SYSCTL_CPUPOOL_PAR_ANY here? Furthermore,
together with the remark above, I think you also want to consider
the case of sizeof(unsigned int) > sizeof(uint32_t).

Jan

