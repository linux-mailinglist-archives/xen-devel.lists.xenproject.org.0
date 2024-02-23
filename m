Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EE8607CE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 01:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684581.1064515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJfp-0002X8-QW; Fri, 23 Feb 2024 00:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684581.1064515; Fri, 23 Feb 2024 00:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJfp-0002Vc-Nv; Fri, 23 Feb 2024 00:44:21 +0000
Received: by outflank-mailman (input) for mailman id 684581;
 Fri, 23 Feb 2024 00:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdJfo-0002VW-C6
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 00:44:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aca63fbf-d1e4-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 01:44:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10CA663340;
 Fri, 23 Feb 2024 00:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE2AC433C7;
 Fri, 23 Feb 2024 00:44:14 +0000 (UTC)
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
X-Inumbo-ID: aca63fbf-d1e4-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708649056;
	bh=VSsnso58d5B5E6qzjFbJgzNWT1xjYoXRuyFXxmOrLxA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J5cgbiTTxLqPDVKVOttl443bP4SazqAHIpIk+iZ+XsTE9bXDnQ7ZcTUuUax9jnoMf
	 aVHuvrUehfROqpCGdNJMCR++JWFmgi8dZlexaQLlktBAII8Pg4faPE4XZq2N3OKrMP
	 JHLpcQSbkb84Jt52MMkgg6mUPlYZ832AhbDPQdU9LHJ4w8ozeauLDuoF2gSpC8kUjq
	 MG5SGcMwRPGVTp1vMgiGAARZIAUIdO4wJugByR0zBWUSqOs5027ciOECBRkCe0mhrd
	 VbgksYhZd9E1yzEL3M35e1F4M4xevgUqCzqGhyVRfQHJZVf3+/Am6JEajm4gHudfI1
	 EtHN0YnbMVeNw==
Date: Thu, 22 Feb 2024 16:44:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC XEN PATCH v5 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
In-Reply-To: <20240112061317.418658-4-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2402221642530.754277@ubuntu-linux-20-04-desktop>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com> <20240112061317.418658-4-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Jan 2024, Jiqian Chen wrote:
> On PVH dom0, the gsis don't get registered, but
> the gsi of a passthrough device must be configured for it to
> be able to be mapped into a hvm domU.
> On Linux kernel side, it calles PHYSDEVOP_setup_gsi for
> passthrough devices to register gsi when dom0 is PVH.
> So, add PHYSDEVOP_setup_gsi for above purpose.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  xen/arch/x86/hvm/hypercall.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 493998b42ec5..46f51ee459f6 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -76,6 +76,12 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_unmap_pirq:
>          break;
>  
> +    case PHYSDEVOP_setup_gsi:
> +        if ( !is_hardware_domain(currd) )
> +            return -EOPNOTSUPP;
> +        ASSERT(!has_pirq(currd));

Do we really need this assert? I understand that the use case right now
is for !has_pirq(currd) but in general it doesn't seem to me that
PHYSDEVOP_setup_gsi and !has_pirq should be tied together.

Aside from that, it looks fine.


> +        break;
> +
>      case PHYSDEVOP_eoi:
>      case PHYSDEVOP_irq_status_query:
>      case PHYSDEVOP_get_free_pirq:
> -- 
> 2.34.1
> 

