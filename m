Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE6A5E81E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910950.1317527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVH5-0003PG-T6; Wed, 12 Mar 2025 23:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910950.1317527; Wed, 12 Mar 2025 23:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVH5-0003MP-PC; Wed, 12 Mar 2025 23:14:07 +0000
Received: by outflank-mailman (input) for mailman id 910950;
 Wed, 12 Mar 2025 23:14:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVH3-0003M2-TY
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:14:05 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b04a04d3-ff97-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 00:14:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 30248A41FE7;
 Wed, 12 Mar 2025 23:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64879C4CEDD;
 Wed, 12 Mar 2025 23:14:01 +0000 (UTC)
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
X-Inumbo-ID: b04a04d3-ff97-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741821242;
	bh=I6k5vYS7kInbSDxZsdfUrBZye0TyXVTsN8PwRPeDRUU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mC9nTm9EYO8gVhJje/3WT4kY6IVvknn0WfJzR3dbVB5wVY0Y9iOFF2j++6cNcVCH5
	 E5f9ZvEqUq5WoP52JNQPD6apEHpGiQaB0oTYb6Bynta7WgNp7oYwIhJnOlVUA88ZBU
	 MgSg5CEV9tt7JwCDk5uqe92sJXu5pPevZQ3T5II89FSG1Hi68x3XTBysy7kJjfy4bE
	 owTDwzYaFl7e65klvGEwCS/8lO5zJc0BAcymYfidesBh1Z1bTWTchvNHBUEqEBQEqq
	 4XJ6gz3e9jjqYl3AxJzIlUi4HitEoHAeklgeDWQ74s/OxEVLNUVhmXb9XhZxXF9VPr
	 rUcLxSz5w3kOg==
Date: Wed, 12 Mar 2025 16:13:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 07/19] xen/sysctl: wrap around
 XEN_SYSCTL_lockprof_op
In-Reply-To: <20250312040632.2853485-8-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121613300.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-8-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> The following function is only to serve spinlock profiling via
> XEN_SYSCTL_lockprof_op, so it shall be wrapped:
> - spinlock_profile_control
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>


Similarly to the previous patch, could be make CONFIG_DEBUG_LOCK_PROFILE
depend on CONFIG_SYSCTL? 


> ---
>  xen/common/spinlock.c      | 2 ++
>  xen/include/xen/spinlock.h | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index 38caa10a2e..0389293b09 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -690,6 +690,7 @@ void cf_check spinlock_profile_reset(unsigned char key)
>      spinlock_profile_iterate(spinlock_profile_reset_elem, NULL);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  typedef struct {
>      struct xen_sysctl_lockprof_op *pc;
>      int                      rc;
> @@ -749,6 +750,7 @@ int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc)
>  
>      return rc;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  void _lock_profile_register_struct(
>      int32_t type, struct lock_profile_qhead *qhead, int32_t idx)
> diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> index ca9d8c7ec0..7f2a814ee0 100644
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -164,7 +164,14 @@ void _lock_profile_deregister_struct(int32_t type,
>  #define lock_profile_deregister_struct(type, ptr)                             \
>      _lock_profile_deregister_struct(type, &((ptr)->profile_head))
>  
> +#ifdef CONFIG_SYSCTL
>  extern int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc);
> +#else
> +static inline int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif
>  extern void cf_check spinlock_profile_printall(unsigned char key);
>  extern void cf_check spinlock_profile_reset(unsigned char key);
>  
> -- 
> 2.34.1
> 

