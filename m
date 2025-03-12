Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF95BA5E845
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:19:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910971.1317545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVM2-0005Ub-K2; Wed, 12 Mar 2025 23:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910971.1317545; Wed, 12 Mar 2025 23:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVM2-0005Rg-GX; Wed, 12 Mar 2025 23:19:14 +0000
Received: by outflank-mailman (input) for mailman id 910971;
 Wed, 12 Mar 2025 23:19:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVM1-0005Ra-TL
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:19:13 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66b68f70-ff98-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 00:19:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1EB59A448EE;
 Wed, 12 Mar 2025 23:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B960C4CEDD;
 Wed, 12 Mar 2025 23:19:07 +0000 (UTC)
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
X-Inumbo-ID: 66b68f70-ff98-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741821548;
	bh=0KbVc+hTWH5ShLJB/tVyjoB0uLQR8SuVb17sAG3n0sc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LloxY1jLz2wiTGp8sgFR3By6ZE227rYrTNNjySN8tvuFDFoxv1UqwKWWEUWuRdFX8
	 d0a83ByO4a3GclHKi3jh8NdxGlaJ6SvfVZ+i/+r8bJv1aOC/6v98iVx5ZJ2b2ICFxy
	 cqpTmw63cqqXBlIvUoLOYG+Kg2M2m+wj4LMndhtcYA4LPDXDibpOkxbYfhnry5DEws
	 iVJ9xCg89gz2azDFv01P0QAt3g9C6fkUa3AHquhSSC5SixNLHQFSaJxezKbvp5eQ5I
	 MyRmP0UtXIR5W85b8rTN5imIqTQRedNO5eIkIIB3/CTBYuZlmj5fqV1Zs8zobWfxXF
	 BLYcJ8Y0T18mA==
Date: Wed, 12 Mar 2025 16:19:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 11/19] xen/sysctl: wrap around
 XEN_SYSCTL_page_offline_op
In-Reply-To: <20250312040632.2853485-12-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121618390.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-12-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> The following functions are only to deal with XEN_SYSCTL_page_offline_op,
> then shall be wrapped:
> - xsm_page_offline
> - online_page
> - query_page_offline
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/page_alloc.c |  2 ++
>  xen/include/xen/mm.h    | 13 ++++++++++++-
>  xen/include/xsm/dummy.h |  7 +++++++
>  xen/include/xsm/xsm.h   |  9 +++++++++
>  xen/xsm/dummy.c         |  2 ++
>  xen/xsm/flask/hooks.c   |  6 ++++++
>  6 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index b5ec4bda7d..7476d37238 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1759,6 +1759,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
>      return 0;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  /*
>   * Online the memory.
>   *   The caller should make sure end_pfn <= max_page,
> @@ -1843,6 +1844,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
>  
>      return 0;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  /*
>   * This function should only be called with valid pages from the same NUMA
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index ae1c48a615..86bbb15890 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -144,9 +144,20 @@ unsigned long avail_domheap_pages(void);
>  unsigned long avail_node_heap_pages(unsigned int nodeid);
>  #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
>  #define free_domheap_page(p)  (free_domheap_pages(p,0))
> -int online_page(mfn_t mfn, uint32_t *status);
>  int offline_page(mfn_t mfn, int broken, uint32_t *status);
> +#ifdef CONFIG_SYSCTL
> +int online_page(mfn_t mfn, uint32_t *status);
>  int query_page_offline(mfn_t mfn, uint32_t *status);
> +#else
> +static inline int online_page(mfn_t mfn, uint32_t *status)
> +{
> +    return -EOPNOTSUPP;
> +}
> +static inline int query_page_offline(mfn_t mfn, uint32_t *status)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif /* CONFIG_SYSCTL */
>  
>  void heap_init_late(void);
>  
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 35d084aca7..5f89fc98fc 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -497,11 +497,18 @@ static XSM_INLINE int cf_check xsm_resource_setup_misc(XSM_DEFAULT_VOID)
>      return xsm_default_action(action, current->domain, NULL);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static XSM_INLINE int cf_check xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
>  {
>      XSM_ASSERT_ACTION(XSM_HOOK);
>      return xsm_default_action(action, current->domain, NULL);
>  }
> +#else
> +static XSM_INLINE int cf_check xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif
>  
>  static XSM_INLINE int cf_check xsm_hypfs_op(XSM_DEFAULT_VOID)
>  {
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index d322740de1..d6f27aa977 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -140,7 +140,9 @@ struct xsm_ops {
>      int (*resource_setup_gsi)(int gsi);
>      int (*resource_setup_misc)(void);
>  
> +#ifdef CONFIG_SYSCTL
>      int (*page_offline)(uint32_t cmd);
> +#endif
>      int (*hypfs_op)(void);
>  
>      long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
> @@ -601,10 +603,17 @@ static inline int xsm_resource_setup_misc(xsm_default_t def)
>      return alternative_call(xsm_ops.resource_setup_misc);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
>  {
>      return alternative_call(xsm_ops.page_offline, cmd);
>  }
> +#else
> +static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif
>  
>  static inline int xsm_hypfs_op(xsm_default_t def)
>  {
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index 4c97db0c48..aa89ee5331 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -96,7 +96,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>      .resource_setup_gsi            = xsm_resource_setup_gsi,
>      .resource_setup_misc           = xsm_resource_setup_misc,
>  
> +#ifdef CONFIG_SYSCTL
>      .page_offline                  = xsm_page_offline,
> +#endif
>      .hypfs_op                      = xsm_hypfs_op,
>      .hvm_param                     = xsm_hvm_param,
>      .hvm_param_altp2mhvm           = xsm_hvm_param_altp2mhvm,
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 7c46657d97..9819cd407d 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1206,10 +1206,12 @@ static int cf_check flask_resource_unplug_core(void)
>      return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__UNPLUG, NULL);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static int flask_resource_use_core(void)
>  {
>      return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__USE, NULL);
>  }
> +#endif
>  
>  static int cf_check flask_resource_plug_pci(uint32_t machine_bdf)
>  {
> @@ -1274,6 +1276,7 @@ static int cf_check flask_resource_setup_misc(void)
>      return avc_current_has_perm(SECINITSID_XEN, SECCLASS_RESOURCE, RESOURCE__SETUP, NULL);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static inline int cf_check flask_page_offline(uint32_t cmd)
>  {
>      switch ( cmd )
> @@ -1288,6 +1291,7 @@ static inline int cf_check flask_page_offline(uint32_t cmd)
>          return avc_unknown_permission("page_offline", cmd);
>      }
>  }
> +#endif
>  
>  static inline int cf_check flask_hypfs_op(void)
>  {
> @@ -1948,7 +1952,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>      .resource_setup_gsi = flask_resource_setup_gsi,
>      .resource_setup_misc = flask_resource_setup_misc,
>  
> +#ifdef CONFIG_SYSCTL
>      .page_offline = flask_page_offline,
> +#endif
>      .hypfs_op = flask_hypfs_op,
>      .hvm_param = flask_hvm_param,
>      .hvm_param_altp2mhvm = flask_hvm_param_altp2mhvm,
> -- 
> 2.34.1
> 

