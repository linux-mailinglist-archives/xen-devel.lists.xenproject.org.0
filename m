Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E92F6FF4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 02:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67594.120752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Dqy-0006h0-S1; Fri, 15 Jan 2021 01:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67594.120752; Fri, 15 Jan 2021 01:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Dqy-0006gb-Ox; Fri, 15 Jan 2021 01:24:40 +0000
Received: by outflank-mailman (input) for mailman id 67594;
 Fri, 15 Jan 2021 01:24:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yB8v=GS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0Dqw-0006gW-Je
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 01:24:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5904b6d-816d-4a7a-9be0-fb47180ad096;
 Fri, 15 Jan 2021 01:24:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 713AB221FD;
 Fri, 15 Jan 2021 01:24:36 +0000 (UTC)
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
X-Inumbo-ID: d5904b6d-816d-4a7a-9be0-fb47180ad096
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610673876;
	bh=Os60j1dCbnYfefg9N/h+905pn32g9ySmnrxFRjy2gSA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rjQUk1GpS0aY10U5Zn+dwNLCnrg4LxsCfclvYsGizg8oJjhh1jL0VBwBsOBvqAtec
	 x2iRPyQvY+WyTaQAMYORpzYzT0sVgWf2SbuhAKTRDPsbXvO8DTh+qlET0p2JPTRhXM
	 ofanl1AB11fe59VMr06hgQM0aWjcFKT3cxnMcNWRJAFpjEgTepSYj+PRqaEu2e8vQY
	 7aISdA38wU62qMn0wAr5XdjGMd761sO5reRYAUo4NF+Q5dFgqAJ9L5O1vcbkd0mZUH
	 Hik0BPANppquZU2r6cBHbAPfS+EITske5EoxProCKolgkJLStah1EOJcoc/oK3/9AX
	 jUw/ybJaAOjMg==
Date: Thu, 14 Jan 2021 17:24:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Paul Durrant <paul@xen.org>, Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V4 17/24] xen/ioreq: Introduce
 domain_has_ioreq_server()
In-Reply-To: <1610488352-18494-18-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2101141723090.31265@sstabellini-ThinkPad-T480s>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-18-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Jan 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch introduces a helper the main purpose of which is to check
> if a domain is using IOREQ server(s).
> 
> On Arm the current benefit is to avoid calling vcpu_ioreq_handle_completion()
> (which implies iterating over all possible IOREQ servers anyway)
> on every return in leave_hypervisor_to_guest() if there is no active
> servers for the particular domain.
> Also this helper will be used by one of the subsequent patches on Arm.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes RFC -> V1:
>    - new patch
> 
> Changes V1 -> V2:
>    - update patch description
>    - guard helper with CONFIG_IOREQ_SERVER
>    - remove "hvm" prefix
>    - modify helper to just return d->arch.hvm.ioreq_server.nr_servers
>    - put suitable ASSERT()s
>    - use ASSERT(d->ioreq_server.server[id] ? !s : !!s) in set_ioreq_server()
>    - remove d->ioreq_server.nr_servers = 0 from hvm_ioreq_init()
> 
> Changes V2 -> V3:
>    - update patch description
>    - remove ASSERT()s from the helper, add a comment
>    - use #ifdef CONFIG_IOREQ_SERVER inside function body
>    - use new ASSERT() construction in set_ioreq_server()
> 
> Changes V3 -> V4:
>    - update patch description
>    - drop per-domain variable "nr_servers"
>    - reimplement a helper to count the non-NULL entries
>    - make the helper out-of-line
> ---
>  xen/arch/arm/traps.c    | 15 +++++++++------
>  xen/common/ioreq.c      | 16 ++++++++++++++++
>  xen/include/xen/ioreq.h |  2 ++
>  3 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 4a83e1e..35094d8 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2262,14 +2262,17 @@ static bool check_for_vcpu_work(void)
>      struct vcpu *v = current;
>  
>  #ifdef CONFIG_IOREQ_SERVER
> -    bool handled;
> +    if ( domain_has_ioreq_server(v->domain) )
> +    {
> +        bool handled;
>  
> -    local_irq_enable();
> -    handled = vcpu_ioreq_handle_completion(v);
> -    local_irq_disable();
> +        local_irq_enable();
> +        handled = vcpu_ioreq_handle_completion(v);
> +        local_irq_disable();
>  
> -    if ( !handled )
> -        return true;
> +        if ( !handled )
> +            return true;
> +    }
>  #endif
>  
>      if ( likely(!v->arch.need_flush_to_ram) )
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index d5f4dd3..59f4990 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -80,6 +80,22 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
>      return &p->vcpu_ioreq[v->vcpu_id];
>  }
>  
> +/*
> + * This should only be used when d == current->domain or when they're
> + * distinct and d is paused. Otherwise the result is stale before
> + * the caller can inspect it.
> + */
> +bool domain_has_ioreq_server(const struct domain *d)
> +{
> +    const struct ioreq_server *s;
> +    unsigned int id;
> +
> +    FOR_EACH_IOREQ_SERVER(d, id, s)
> +        return true;
> +
> +    return false;
> +}
> +
>  static struct ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
>                                             struct ioreq_server **srvp)
>  {
> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
> index ec7e98d..f0908af 100644
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -81,6 +81,8 @@ static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
>  #define HANDLE_BUFIOREQ(s) \
>      ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
>  
> +bool domain_has_ioreq_server(const struct domain *d);
> +
>  bool vcpu_ioreq_pending(struct vcpu *v);
>  bool vcpu_ioreq_handle_completion(struct vcpu *v);
>  bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
> -- 
> 2.7.4
> 

