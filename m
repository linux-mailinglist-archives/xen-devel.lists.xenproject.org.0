Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398B6446B1A
	for <lists+xen-devel@lfdr.de>; Sat,  6 Nov 2021 00:06:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222682.385005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj8Ha-00051x-Nw; Fri, 05 Nov 2021 23:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222682.385005; Fri, 05 Nov 2021 23:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj8Ha-00050A-Kl; Fri, 05 Nov 2021 23:06:02 +0000
Received: by outflank-mailman (input) for mailman id 222682;
 Fri, 05 Nov 2021 23:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvBC=PY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mj8HY-000504-Tz
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 23:06:00 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef0dc454-3e8c-11ec-9787-a32c541c8605;
 Sat, 06 Nov 2021 00:05:59 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D626161165;
 Fri,  5 Nov 2021 23:05:55 +0000 (UTC)
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
X-Inumbo-ID: ef0dc454-3e8c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636153556;
	bh=f7lKiReoiLEL+uPnRE3zXuvLHugz5v6Kn93YBx69LK0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sWmxIGkkB3MUxV+K6XPDiGu/sD74hkPfK8lHWMEReVbmbqPh1gwR+/LFzB1/iydSD
	 J+oDnRtxoWOOyyaAR2U170vsEWl8INT1Oq4eyG0RN+blb5WYK5LBYYjGvvRNBec+2f
	 Sdj51GMq7heKdWRlnYPKwKRdaJdO1vxEDWCEkfpnBLBmwxnkw4qS+X+bNF8mGwV8g0
	 RmhS3x2EJGDM1tKgDN1zvJ/4061j5mVt9dhryHI2EABMNDtg7x8zJWbIDUybNXqhDK
	 YrUuZoZc0CFiXXkyekreBLk/vOjFYL8bMm7c8FeZDWQKIE53JetzEpYpueAqzuy6rd
	 wPrAWtFKLRjhg==
Date: Fri, 5 Nov 2021 16:05:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Penny Zheng <Penny.Zheng@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, julien@xen.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, iwj@xenproject.org
Subject: RE: static-mem preventing dom0 from booting
In-Reply-To: <alpine.DEB.2.22.394.2111051554000.284830@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2111051604530.284830@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2111041829300.284830@ubuntu-linux-20-04-desktop> <DU2PR08MB73256624607E7624CAAD38E5F78E9@DU2PR08MB7325.eurprd08.prod.outlook.com> <DU2PR08MB7325A7A5658B1EB7C6EB4DECF78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2111050836580.284830@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2111051554000.284830@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+ Julien, Ian and others

On Fri, 5 Nov 2021, Stefano Stabellini wrote:
> On Fri, 5 Nov 2021, Stefano Stabellini wrote:
> > The scenario is extremely simple; you can see the full device tree
> > configuration in the attachment to my previous email.
> > 
> > - dom0
> > - dom0less domU with static-mem
> > 
> > That's it! So basically it is just a normal dom0 + dom0less domU
> > configuration, which already works fine, where I added static-mem to the
> > domU and suddenly dom0 (not the domU!) stopped working.
> 
> I did some more debugging today and I found the problem. The issue is
> that static-mem regions are added to the list of reserved_mem. However,
> reserved_mem is automatically assigned to Dom0 by default at the bottom
> of xen/arch/arm/domain_build.c:handle_node, see the second call to
> make_memory_node. Really, we shouldn't give to dom0 static-mem ranges
> meant for other domUs. E.g. the following change is sufficient to solve
> the problem:
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 88a79247cb..dc609c4f0e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -891,6 +891,9 @@ static int __init make_memory_node(const struct domain *d,
>          u64 start = mem->bank[i].start;
>          u64 size = mem->bank[i].size;
>  
> +        if ( mem->bank[i].xen_domain )
> +            continue;
> +
>          dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
>                     i, start, start + size);
>  
> However, maybe a better fix would be to purge reserved_mem of any
> xen_domain items before calling make_memory_node.
> 
> 
> I found one additional issue regarding is_domain_direct_mapped which
> doesn't return true for static-mem domains. I think we need to add a
> direct_map bool to arch_domain and set it for both dom0 and static-mem
> dom0less domUs, so that we can change the implementation of
> is_domain_direct_mapped to:
> 
> #define is_domain_direct_mapped(d) (d->arch.direct_map)
> 

