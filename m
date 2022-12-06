Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F856644D55
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 21:37:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455529.713015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2egS-0003be-Q3; Tue, 06 Dec 2022 20:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455529.713015; Tue, 06 Dec 2022 20:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2egS-0003Zk-NR; Tue, 06 Dec 2022 20:36:56 +0000
Received: by outflank-mailman (input) for mailman id 455529;
 Tue, 06 Dec 2022 20:36:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2egR-0003Ze-8Z
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 20:36:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2egO-0001fG-MK; Tue, 06 Dec 2022 20:36:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2egO-0000XG-Hd; Tue, 06 Dec 2022 20:36:52 +0000
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
	bh=TQeE9We7ZtVdlcZH6cDKAsIse3P0yNznHDK8hktbePU=; b=6nZ3ECd2y24wEBVWTS4X6c6kE4
	g7fhDsnvSGsl/lggqe0Q38JdKw9OUE0wGgoM92lsGu7y0GESPSqrp4yo0wQCw/iJcJdCXOlLDi1/h
	JV0lqHIOyR2/9loRcjlVG55TPqjHSCt7fMouLvO/BD79uEbLdHYwLWI6TXUzCsQyPAHY=;
Message-ID: <86b15c22-de90-fbbe-43ce-4f500b3ba5af@xen.org>
Date: Tue, 6 Dec 2022 20:36:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 05/19] xen/x86: Move freeze/thaw_domains into common files
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <931418d761e47eee7847e6bd559e02597cbab1b6.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <931418d761e47eee7847e6bd559e02597cbab1b6.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> These functions will be reused by suspend/resume support for ARM.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>

Your Signed-off-by is missing.

> ---
>   xen/common/domain.c     | 29 +++++++++++++++++++++++++++++

The title suggests that there will be code movement. However... I only 
see addition here. Did you intend to remove the functions from 
arch/x86/acpi/power.c?

>   xen/include/xen/sched.h |  3 +++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 56d47dd664..5e5894c468 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1884,6 +1884,35 @@ int continue_hypercall_on_cpu(
>       return 0;
>   }
>   
> +
> +void freeze_domains(void)
> +{
> +    struct domain *d;
> +
> +    rcu_read_lock(&domlist_read_lock);
> +    /*
> +     * Note that we iterate in order of domain-id. Hence we will pause dom0
> +     * first which is required for correctness (as only dom0 can add domains to
> +     * the domain list). Otherwise we could miss concurrently-created domains.
> +     */
> +    for_each_domain ( d )
> +        domain_pause(d);
> +    rcu_read_unlock(&domlist_read_lock);
> +}
> +
> +void thaw_domains(void)
> +{
> +    struct domain *d;
> +
> +    rcu_read_lock(&domlist_read_lock);
> +    for_each_domain ( d )
> +    {
> +        restore_vcpu_affinity(d);
> +        domain_unpause(d);
> +    }
> +    rcu_read_unlock(&domlist_read_lock);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 00a939aa01..c8ddfdd51c 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -978,6 +978,9 @@ static inline struct vcpu *domain_vcpu(const struct domain *d,
>       return vcpu_id >= d->max_vcpus ? NULL : d->vcpu[idx];
>   }
>   
> +void freeze_domains(void);
> +void thaw_domains(void);
> +
>   void cpu_init(void);
>   
>   /*

Cheers,

-- 
Julien Grall

