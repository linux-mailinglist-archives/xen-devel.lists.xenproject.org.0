Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED05A5E819
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910934.1317516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVFF-0002ok-Gk; Wed, 12 Mar 2025 23:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910934.1317516; Wed, 12 Mar 2025 23:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVFF-0002mx-Dq; Wed, 12 Mar 2025 23:12:13 +0000
Received: by outflank-mailman (input) for mailman id 910934;
 Wed, 12 Mar 2025 23:12:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVFD-0002lv-UH
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:12:11 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d247d21-ff97-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 00:12:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 92CA0A44875;
 Wed, 12 Mar 2025 23:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5DAC4CEDD;
 Wed, 12 Mar 2025 23:12:08 +0000 (UTC)
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
X-Inumbo-ID: 6d247d21-ff97-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741821130;
	bh=tqElY0dHGdM3qHyhspsDJ9M7niWCShOsN96K7ZSNufM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i8IPHpdI8NsI8ejDJM/XZECxDjxTL+y8UnaffX/90ipkcjh19lu1cNS5MIaohWbxR
	 Uo1MqV1U4RnhhrlnWr0Rp5W2tj+YiZUd1gTwUwZj5/XUG/bpcH6Ao63PgID0JXCOCm
	 UWpXTDZdK25GPrNMj41XQTZtLLrNqeu2lzdQZiRTcNVaebGrtNMC7mR3N1KRc85dkQ
	 /ynh5+zLa4aUReVhT/0IUCJRQLfWnqJNvWS63apLUWbLwKvkdHD3zUy+5xQZu1mWvp
	 0tpEadrX/3SJbVBYNFn+H9mLOaocg8qMIhQR2xcGsG527Y3WCzibyFj04FG3xm6Td+
	 eauoe5q0YAqzg==
Date: Wed, 12 Mar 2025 16:12:07 -0700 (PDT)
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
Subject: Re: [PATCH v1 06/19] xen/sysctl: wrap around XEN_SYSCTL_perfc_op
In-Reply-To: <20250312040632.2853485-7-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121610510.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-7-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> perfc_control() and perfc_copy_info() are responsible for providing control
> of perf counters via XEN_SYSCTL_perfc_op in DOM0, so they both shall
> be wrapped.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/common/perfc.c      | 2 ++
>  xen/include/xen/perfc.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/xen/common/perfc.c b/xen/common/perfc.c
> index 8302b7cf6d..0f3b89af2c 100644
> --- a/xen/common/perfc.c
> +++ b/xen/common/perfc.c
> @@ -149,6 +149,7 @@ void cf_check perfc_reset(unsigned char key)
>      }
>  }
>  
> +#ifdef CONFIG_SYSCTL

I think in this case it would be best to make CONFIG_PERF_COUNTERS
depending on CONFIG_SYSCTL. The consequence is that without
CONFIG_SYSCTL, xen/common/perfc.c will be disabled in the build.



>  static struct xen_sysctl_perfc_desc perfc_d[NR_PERFCTRS];
>  static xen_sysctl_perfc_val_t *perfc_vals;
>  static unsigned int      perfc_nbr_vals;
> @@ -265,6 +266,7 @@ int perfc_control(struct xen_sysctl_perfc_op *pc)
>  
>      return rc;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  /*
>   * Local variables:
> diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
> index bf0eb032f7..6cc8af12d5 100644
> --- a/xen/include/xen/perfc.h
> +++ b/xen/include/xen/perfc.h
> @@ -5,6 +5,7 @@
>  
>  #include <xen/macros.h>
>  #include <xen/percpu.h>
> +#include <xen/errno.h>
>  
>  /*
>   * NOTE: new counters must be defined in perfc_defn.h
> @@ -92,7 +93,14 @@ DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
>  #endif
>  
>  struct xen_sysctl_perfc_op;
> +#ifdef CONFIG_SYSCTL
>  int perfc_control(struct xen_sysctl_perfc_op *pc);
> +#else
> +static inline int perfc_control(struct xen_sysctl_perfc_op *pc)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif
>  
>  extern void cf_check perfc_printall(unsigned char key);
>  extern void cf_check perfc_reset(unsigned char key);
> -- 
> 2.34.1
> 

