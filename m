Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823636237DC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 01:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441165.695496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osuzi-0006we-Mb; Thu, 10 Nov 2022 00:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441165.695496; Thu, 10 Nov 2022 00:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osuzi-0006ur-Je; Thu, 10 Nov 2022 00:00:34 +0000
Received: by outflank-mailman (input) for mailman id 441165;
 Thu, 10 Nov 2022 00:00:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+5rg=3K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1osuzg-0006ul-Il
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 00:00:32 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0a8de92-608a-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 01:00:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B511B82005;
 Thu, 10 Nov 2022 00:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC4BC433B5;
 Thu, 10 Nov 2022 00:00:28 +0000 (UTC)
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
X-Inumbo-ID: b0a8de92-608a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668038429;
	bh=91RZcB/Wqh151kDL/nvrYpSum707zjk0s+P6Me8r0ao=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VvxBcVAkdqUubfH4s5sIO3vLgm1lEO6fGVuIZeBrNVFvORtlWwCvjDG1tKYULzJsY
	 +TUsIun7mJTIvTpjoHXNHmxLS5MknJetHSEBEiakZGqwONgJCrS4/D05zvrwG/0mBL
	 XGUdCN6ysbD5P1Qh/jTAqXGossrlYpRh2dB0K9YxxA5M9jjSGTVDqKmeqBA/Fj8z9Q
	 0xwOkSIIMuk0Fchb+AVD4lsXqofqrLzHY6IfanRjGKZnIYYpo2m87Q6OAIU69wQWSW
	 dU9mtNXBM94dcjfJbEv95BS1MHJ9Kzf2v3mvUDI+ysJlpZuI9f44bPvsNfl3yIrqFK
	 ZE4mHw+OF9pGg==
Date: Wed, 9 Nov 2022 16:00:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, 
    Ayan Kumar Halder <ayankuma@amd.com>
Subject: Re: [XEN v3] xen/arm: Enforce alignment check in debug build for
 {read, write}_atomic
In-Reply-To: <20221108094503.40253-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2211091600180.50442@ubuntu-linux-20-04-desktop>
References: <20221108094503.40253-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Nov 2022, Ayan Kumar Halder wrote:
> From: Ayan Kumar Halder <ayankuma@amd.com>
> 
> Xen provides helper to atomically read/write memory (see {read,
> write}_atomic()). Those helpers can only work if the address is aligned
> to the size of the access (see B2.2.1 ARM DDI 08476I.a).
> 
> On Arm32, the alignment is already enforced by the processor because
> HSCTLR.A bit is set (it enforce alignment for every access). For Arm64,
> this bit is not set because memcpy()/memset() can use unaligned access
> for performance reason (the implementation is taken from the Cortex
> library).
> 
> To avoid any overhead in production build, the alignment will only be
> checked using an ASSERT. Note that it might be possible to do it in
> production build using the acquire/exclusive version of load/store. But
> this is left to a follow-up (if wanted).
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Julien Grall <julien@xen.org>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changes from :-
> v1 - 1. Referred to the latest Arm Architecture Reference Manual in the commit
> message.
> 
> v2 - 1. Updated commit message to specify the reason for using ASSERT().
> 2. Added Julien's SoB.
> 
>  xen/arch/arm/include/asm/atomic.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
> index 1f60c28b1b..64314d59b3 100644
> --- a/xen/arch/arm/include/asm/atomic.h
> +++ b/xen/arch/arm/include/asm/atomic.h
> @@ -78,6 +78,7 @@ static always_inline void read_atomic_size(const volatile void *p,
>                                             void *res,
>                                             unsigned int size)
>  {
> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>      switch ( size )
>      {
>      case 1:
> @@ -102,6 +103,7 @@ static always_inline void write_atomic_size(volatile void *p,
>                                              void *val,
>                                              unsigned int size)
>  {
> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>      switch ( size )
>      {
>      case 1:
> -- 
> 2.17.1
> 

