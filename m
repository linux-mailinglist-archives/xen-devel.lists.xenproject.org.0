Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D561326B16
	for <lists+xen-devel@lfdr.de>; Sat, 27 Feb 2021 02:59:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90647.171649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFosh-0003uN-Pm; Sat, 27 Feb 2021 01:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90647.171649; Sat, 27 Feb 2021 01:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFosh-0003ty-Mo; Sat, 27 Feb 2021 01:58:55 +0000
Received: by outflank-mailman (input) for mailman id 90647;
 Sat, 27 Feb 2021 01:58:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ph90=H5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFosf-0003td-VW
 for xen-devel@lists.xenproject.org; Sat, 27 Feb 2021 01:58:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e55d613a-c953-4020-b94f-a78558af8258;
 Sat, 27 Feb 2021 01:58:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5053964EE2;
 Sat, 27 Feb 2021 01:58:52 +0000 (UTC)
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
X-Inumbo-ID: e55d613a-c953-4020-b94f-a78558af8258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614391132;
	bh=sJ11UUMLMAOXLV7KBsrsf1WImOyN0UyQsOelVCL69Lg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OPZBlJLN3oW9zMbCEl1J969n8DRCEDCXhu4MMVWAtxp48MX+/kIWeoA7hwt/iZl+L
	 IqIXGFQI5eYBhKU/xWgb30v87XpYtvNtD8l8v/n8ZThOsZddXdY61oXFL2PFx5s9TG
	 XxsN2mPMcKQQBKZ1fQJ2awngq9xFSXbd9RByeEp/BYFXZ3H5Kp4AmnKZlaEUxKF1Ju
	 qlYaOkDpjU1EYOUwkHYhVdbrqJcQ26D/1g3k8BX/JNxRfGHilFOY6ggC4b/xHGaVP/
	 C8ZE5fViDTiV7b3elEvogJeKnFVUi8DjzAUHImcy5VOZ2cRUvQe4RLN/RqQcU1cPdv
	 jj0O8NKXymPAw==
Date: Fri, 26 Feb 2021 17:58:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    ash.j.wilding@gmail.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Ensure the vCPU context is seen before clearing
 the _VPF_down
In-Reply-To: <20210226205158.20991-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2102261756280.2682@sstabellini-ThinkPad-T480s>
References: <20210226205158.20991-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Feb 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> A vCPU can get scheduled as soon as _VPF_down is cleared. As there is
> currently not ordering guarantee in arch_set_info_guest(), it may be
> possible that flag can be observed cleared before the new values of vCPU
> registers are observed.
> 
> Add an smp_mb() before the flag is cleared to prevent re-ordering.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Barriers should work in pair. However, I am not entirely sure whether to
> put the other half. Maybe at the beginning of context_switch_to()?

It should be right after VGCF_online is set or cleared, right? So it
would be:

xen/arch/arm/domctl.c:arch_get_info_guest
xen/arch/arm/vpsci.c:do_common_cpu_on

But I think it is impossible that either of them get called at the same
time as arch_set_info_guest, which makes me wonder if we actually need
the barrier...



> The issues described here is also quite theoritical because there are
> hundreds of instructions executed between the time a vCPU is seen
> runnable and scheduled. But better be safe than sorry :).
> ---
>  xen/arch/arm/domain.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index bdd3d3e5b5d5..2b705e66be81 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -914,7 +914,14 @@ int arch_set_info_guest(
>      v->is_initialised = 1;
>  
>      if ( ctxt->flags & VGCF_online )
> +    {
> +        /*
> +         * The vCPU can be scheduled as soon as _VPF_down is cleared.
> +         * So clear the bit *after* the context was loaded.
> +         */
> +        smp_mb();
>          clear_bit(_VPF_down, &v->pause_flags);
> +    }
>      else
>          set_bit(_VPF_down, &v->pause_flags);
>  
> -- 
> 2.17.1
> 

