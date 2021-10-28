Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A27043EA00
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 23:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218291.378652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgCcm-0003HT-K3; Thu, 28 Oct 2021 21:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218291.378652; Thu, 28 Oct 2021 21:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgCcm-0003Fh-Gu; Thu, 28 Oct 2021 21:07:48 +0000
Received: by outflank-mailman (input) for mailman id 218291;
 Thu, 28 Oct 2021 21:07:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TkaK=PQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mgCck-0003FY-SI
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 21:07:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18caf938-3833-11ec-84b9-12813bfff9fa;
 Thu, 28 Oct 2021 21:07:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8631D60F02;
 Thu, 28 Oct 2021 21:07:44 +0000 (UTC)
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
X-Inumbo-ID: 18caf938-3833-11ec-84b9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635455264;
	bh=ETP106AJ5Wm/QlV2E9AF5Sl7aujUTPXDcEd7droTXpA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ENOatHPSvUGJdwE1pLHko9V38A3aptvBP/gTFTGEMx9AO1JjGzNEF3w7lKBjiXZta
	 Zwu0cwc7kCJVHz0sAII2dV7wWl5SUvu+NdhoUlHFf3835CCwUETZ9ypkFyOVv7he+q
	 pAn2QBzZcfyez3aCp9dyy3vlOQ+EydEF1y2Wb302byI0PObE4uEVirkio3yRTR5CTI
	 7QSBmX45J9MKbfRsS2dPhlQUd+Se0UqQ21LC5PSTQUGNbBxzz27bOjs99dkvrW4Sxn
	 2P0NpFqpSLMMx5Jd0uEhUxYilq+EaL+CNqt6CbSo93LPsdTBD5eeH9OdhNNZR6EGWh
	 dv5SNnUlTgBNA==
Date: Thu, 28 Oct 2021 14:07:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Dongli Zhang <dongli.zhang@oracle.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, iwj@xenproject.org, jbeulich@suse.com, 
    wl@xen.org, joe.jin@oracle.com
Subject: Re: [PATCH v2 1/1] xen: update system time immediately when
 VCPUOP_register_vcpu_info
In-Reply-To: <20211025173523.3647-1-dongli.zhang@oracle.com>
Message-ID: <alpine.DEB.2.21.2110281406550.20134@sstabellini-ThinkPad-T480s>
References: <20211025173523.3647-1-dongli.zhang@oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Oct 2021, Dongli Zhang wrote:
> The guest may access the pv vcpu_time_info immediately after
> VCPUOP_register_vcpu_info. This is to borrow the idea of
> VCPUOP_register_vcpu_time_memory_area, where the
> force_update_vcpu_system_time() is called immediately when the new memory
> area is registered.
> 
> Otherwise, we may observe clock drift at the VM side if the VM accesses
> the clocksource immediately after VCPUOP_register_vcpu_info().
> 
> Reference:
> https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00571.html
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> Changed since v1:
>   - Implement force_update_vcpu_system_time() for ARM
>     (suggested by Jan Beulich)
>     While I have tested ARM compilation with aarch64-linux-gnu-gcc, I did
>     not test on ARM platform.

This is fine. Of course it is not going to do anything on ARM given that
update_vcpu_system_time in unimplemented but it is certainly harmless.

For the ARM part:
Acked-by: Stefano Stabellini <sstabellini@kernel.org>


>  xen/arch/arm/time.c        | 5 +++++
>  xen/common/domain.c        | 2 ++
>  xen/include/asm-arm/time.h | 2 ++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index 7dbd363537..dec53b5f7d 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -351,6 +351,11 @@ void update_vcpu_system_time(struct vcpu *v)
>      /* XXX update shared_info->wc_* */
>  }
>  
> +void force_update_vcpu_system_time(struct vcpu *v)
> +{
> +    update_vcpu_system_time(v);
> +}
> +
>  void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
>  {
>      d->time_offset.seconds = time_offset_seconds;
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8b53c49d1e..d71fcab88c 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1704,6 +1704,8 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = map_vcpu_info(v, info.mfn, info.offset);
>          domain_unlock(d);
>  
> +        force_update_vcpu_system_time(v);
> +
>          break;
>      }
>  
> diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
> index 6b8fd839dd..4b401c1110 100644
> --- a/xen/include/asm-arm/time.h
> +++ b/xen/include/asm-arm/time.h
> @@ -105,6 +105,8 @@ extern uint64_t ns_to_ticks(s_time_t ns);
>  
>  void preinit_xen_time(void);
>  
> +void force_update_vcpu_system_time(struct vcpu *v);
> +
>  #endif /* __ARM_TIME_H__ */
>  /*
>   * Local variables:
> -- 
> 2.17.1
> 

