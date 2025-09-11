Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A8EB5269E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:41:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119194.1464696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXF9-0000Wv-FB; Thu, 11 Sep 2025 02:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119194.1464696; Thu, 11 Sep 2025 02:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXF9-0000UD-Bo; Thu, 11 Sep 2025 02:41:03 +0000
Received: by outflank-mailman (input) for mailman id 1119194;
 Thu, 11 Sep 2025 02:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwXF7-0000U7-UP
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:41:01 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf93404b-8eb8-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 04:41:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 75EF143D27;
 Thu, 11 Sep 2025 02:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024D5C4CEEB;
 Thu, 11 Sep 2025 02:40:56 +0000 (UTC)
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
X-Inumbo-ID: bf93404b-8eb8-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757558458;
	bh=gp7DVx+O61bT7TGkqRLjVfPd/Iv53dEhT1p5X1jLCow=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zdq288wsj3U2FaK6b+HufkUW+XnHYJfQNuFIKe3CRbOLoaWK/+KDY2Jq5xfuQHf5s
	 ss/XFGf37dg/xnyfoOG0kaX6Cn3UCcBGeTzIKv808oSDJo2RhYVTN4L2A+OngdzKAp
	 jmiVNoE9A6BkI/a7KcwdZr0hMyrP3X11Kv8TpVOKCRmjh8b5Vitdh0fpJdDUfEUl06
	 R8WPSwRcH4wfmfV8tBiZxg8qWSuIpsStarTG6+uoJ2Lia2wCma7YLVVwK/Y9bfhIwI
	 T8k32dZpWmX8NWHkaMSLxGbUjd1e9kkm94dKe84uiG+NK7Pj+k68n4OcQSDvcvAmEE
	 UcE7QvJ61GVYQ==
Date: Wed, 10 Sep 2025 19:40:55 -0700 (PDT)
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
Subject: Re: [PATCH v2 19/26] xen/domctl: wrap set_global_virq_handler() with
 CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-20-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101938360.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-20-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Function set_global_virq_handler() is reponsible for
> XEN_DOMCTL_set_virq_handler domctl-op, and shall be wrapped with
> CONFIG_MGMT_HYPERCALLS.
> Wrap XEN_DOMCTL_set_virq_handler-case transiently with CONFIG_MGMT_HYPERCALLS,
> and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
> common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
> - wrap XEN_DOMCTL_set_virq_handler-case transiently
> ---
>  xen/common/domctl.c        | 2 ++
>  xen/common/event_channel.c | 2 ++
>  2 files changed, 4 insertions(+)

There is a call to set_global_virq_handler in
xen/common/device-tree/dom0less-build.c

ld: prelink.o: in function `set_xs_domain':
/local/repos/xen-upstream/xen/common/device-tree/dom0less-build.c:45: undefined reference to `set_global_virq_handler'
/local/repos/xen-upstream/xen/common/device-tree/dom0less-build.c:45:(.init.text+0x2eb0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `set_global_virq_handler'
ld: ./.xen-syms.0: hidden symbol `set_global_virq_handler' isn't defined
ld: final link failed: bad value


> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 776bf7b8e2..736ad52265 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -808,9 +808,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          break;
>  #endif
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      case XEN_DOMCTL_set_virq_handler:
>          ret = set_global_virq_handler(d, op->u.set_virq_handler.virq);
>          break;
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>      case XEN_DOMCTL_setvnumainfo:
>      {
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index 67700b050a..bb53dc1fb0 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -1006,6 +1006,7 @@ void send_global_virq(uint32_t virq)
>      send_guest_domain_virq(get_global_virq_handler(virq), virq);
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  int set_global_virq_handler(struct domain *d, uint32_t virq)
>  {
>      struct domain *old, *hdl;
> @@ -1068,6 +1069,7 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
>  
>      return rc;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  static void clear_global_virq_handlers(struct domain *d)
>  {
> -- 
> 2.34.1
> 
> 

