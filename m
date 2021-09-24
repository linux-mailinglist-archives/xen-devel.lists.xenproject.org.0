Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3234168AA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194645.346778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTYiI-0000lU-QN; Fri, 24 Sep 2021 00:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194645.346778; Fri, 24 Sep 2021 00:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTYiI-0000jd-M1; Fri, 24 Sep 2021 00:05:14 +0000
Received: by outflank-mailman (input) for mailman id 194645;
 Fri, 24 Sep 2021 00:05:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTYiH-0000jX-3o
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:05:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0ee273f-5349-477d-9146-9fd5b785ebd3;
 Fri, 24 Sep 2021 00:05:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78BE3611B0;
 Fri, 24 Sep 2021 00:05:11 +0000 (UTC)
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
X-Inumbo-ID: e0ee273f-5349-477d-9146-9fd5b785ebd3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632441911;
	bh=3O0Urk1mfIZ8pE3vYT71E1dtO5x3OpOa/42t+S1iesg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iuPC2H92OE9IyHIipMFmGd9lklFb0im44mPDdbL0948LhTnfMVbPKrDmXyJG/7PtR
	 /JtxALnXHujZctHS4L3PaKUwaxVN6xcDLt4WT8Vl86Rd1Jf3LXCsW6OVZ0ZWyV1ZD3
	 umU2JuLzE0YfdG9/a7dOnDNL7/kvolPzbrz0zccvnQHFJmEBwiKvUFspoMSlvE0Ssq
	 KhvlKkIPDEv02ycLVf7g4fwlEaXuQ/2EhwvbwW61Tept4a9ExXxY9ckSlSQtG9lSTd
	 yZuHYmR4uGqZ7UU6ygbqs2gAHMYU2GRRZIGUK49WAc7AN5sYtFzDxsFPzte88yqKun
	 6XvA3xMI5XPLg==
Date: Thu, 23 Sep 2021 17:05:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 06/37] xen/arm: use !CONFIG_NUMA to keep fake NUMA API
In-Reply-To: <20210923120236.3692135-7-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231703070.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-7-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> We have introduced CONFIG_NUMA in previous patch. And this
                                   ^ a

> option is enabled only on x86 in current stage. In a follow
                                ^ at the

> up patch, we will enable this option for Arm. But we still
> want users can disable the CONFIG_NUMA through Kconfig. In
             ^ to be able to disable CONFIG_NUMA via Kconfig.


> this case, keep current fake NUMA API, will make Arm code
                 ^ the

> still can work with NUMA aware memory allocation and scheduler.
        ^ able to work

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

With the small grammar fixes:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/asm-arm/numa.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index 9d5739542d..8f1c67e3eb 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -5,6 +5,8 @@
>  
>  typedef u8 nodeid_t;
>  
> +#ifndef CONFIG_NUMA
> +
>  /* Fake one node for now. See also node_online_map. */
>  #define cpu_to_node(cpu) 0
>  #define node_to_cpumask(node)   (cpu_online_map)
> @@ -25,6 +27,8 @@ extern mfn_t first_valid_mfn;
>  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>  #define __node_distance(a, b) (20)
>  
> +#endif
> +
>  static inline unsigned int arch_have_default_dmazone(void)
>  {
>      return 0;
> -- 
> 2.25.1
> 

