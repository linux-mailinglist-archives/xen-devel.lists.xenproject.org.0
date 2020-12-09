Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D62D4CE4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 22:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48784.86295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn74s-0005yp-DH; Wed, 09 Dec 2020 21:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48784.86295; Wed, 09 Dec 2020 21:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn74s-0005yQ-A0; Wed, 09 Dec 2020 21:32:50 +0000
Received: by outflank-mailman (input) for mailman id 48784;
 Wed, 09 Dec 2020 21:32:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kn74q-0005yL-PI
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 21:32:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bca2c42-c755-443d-9530-0ffb5b08eeb9;
 Wed, 09 Dec 2020 21:32:48 +0000 (UTC)
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
X-Inumbo-ID: 9bca2c42-c755-443d-9530-0ffb5b08eeb9
Date: Wed, 9 Dec 2020 13:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607549567;
	bh=5CVtPUFtiMxACabaGtBvf6XMIWIWvn7TVRc7ElyN5X8=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=fQZQiimmrHmRpECbf3+ldOiRcQMOI5BAEOnbMUsx5eB/c/XYhcpQORv92uS3bA0Wz
	 5Vx1WF7sflBexLwWIribrYfG7fR+ai3YB5QApxDDvwWVqKpNsMogAWaoexRqLNWAXL
	 IX475PS7tLXCRCJ3A/V6i5SuyCPcIE+uQizdSfhzdSqS5xrHtsUIppV/Z8sNZkmj4A
	 vkiX8XON7B0BrOOb3vjJK0Rwgj1lvVLjlj4ebiJJCzG8pe6NkJ5Tr3KmJxJQXCJXW6
	 yHKrzo+1kwoD+Ezj6Xr/R9UgKDlB5xUT7DIxXuGLenrATeSBUT01akhF/iof7VIkwA
	 3ipsRT5cxDIuA==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Paul Durrant <paul@xen.org>, Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V3 13/23] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
In-Reply-To: <1606732298-22107-14-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2012091329480.20986@sstabellini-ThinkPad-T480s>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-14-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The cmpxchg() in ioreq_send_buffered() operates on memory shared
> with the emulator domain (and the target domain if the legacy
> interface is used).
> 
> In order to be on the safe side we need to switch
> to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.
> 
> As there is no plan to support the legacy interface on Arm,
> we will have a page to be mapped in a single domain at the time,
> so we can use s->emulator in guest_cmpxchg64() safely.
> 
> Thankfully the only user of the legacy interface is x86 so far
> and there is not concern regarding the atomics operations.
> 
> Please note, that the legacy interface *must* not be used on Arm
> without revisiting the code.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
>
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes RFC -> V1:
>    - new patch
> 
> Changes V1 -> V2:
>    - move earlier to avoid breaking arm32 compilation
>    - add an explanation to commit description and hvm_allow_set_param()
>    - pass s->emulator
> 
> Changes V2 -> V3:
>    - update patch description
> ---
> ---
>  xen/arch/arm/hvm.c | 4 ++++
>  xen/common/ioreq.c | 3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
> index 8951b34..9694e5a 100644
> --- a/xen/arch/arm/hvm.c
> +++ b/xen/arch/arm/hvm.c
> @@ -31,6 +31,10 @@
>  
>  #include <asm/hypercall.h>
>  
> +/*
> + * The legacy interface (which involves magic IOREQ pages) *must* not be used
> + * without revisiting the code.
> + */

This is a NIT, but I'd prefer if you moved the comment a few lines
below, maybe just before the existing comment starting with "The
following parameters".

The reason is that as it is now it is not clear which set_params
interfaces should not be used without revisiting the code.

With that:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


>  static int hvm_allow_set_param(const struct domain *d, unsigned int param)
>  {
>      switch ( param )
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index 3ca5b96..4855dd8 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -29,6 +29,7 @@
>  #include <xen/trace.h>
>  #include <xen/vpci.h>
>  
> +#include <asm/guest_atomics.h>
>  #include <asm/hvm/ioreq.h>
>  
>  #include <public/hvm/ioreq.h>
> @@ -1182,7 +1183,7 @@ static int ioreq_send_buffered(struct ioreq_server *s, ioreq_t *p)
>  
>          new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
>          new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
> -        cmpxchg(&pg->ptrs.full, old.full, new.full);
> +        guest_cmpxchg64(s->emulator, &pg->ptrs.full, old.full, new.full);
>      }
>  
>      notify_via_xen_event_channel(d, s->bufioreq_evtchn);
> -- 
> 2.7.4
> 

