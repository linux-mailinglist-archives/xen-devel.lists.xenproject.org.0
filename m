Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193789591FA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 02:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780810.1190415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgZdt-0000YU-0M; Wed, 21 Aug 2024 00:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780810.1190415; Wed, 21 Aug 2024 00:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgZds-0000W4-Tb; Wed, 21 Aug 2024 00:56:04 +0000
Received: by outflank-mailman (input) for mailman id 780810;
 Wed, 21 Aug 2024 00:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0c/y=PU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sgZdr-0000Vy-Da
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 00:56:03 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22ad3f30-5f58-11ef-a507-bb4a2ccca743;
 Wed, 21 Aug 2024 02:56:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 28EFAA40BDC;
 Wed, 21 Aug 2024 00:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAACC4AF0B;
 Wed, 21 Aug 2024 00:55:58 +0000 (UTC)
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
X-Inumbo-ID: 22ad3f30-5f58-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724201760;
	bh=zt+bRCw1JFD/aYFu4ktsx31ttxki0L5FzmNifjsxUGo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iI83DkJv6j8k3NwYp3USCf0B3ZclwH5Y1YWOB1Tna4gSgKqk2zmAd9N/mD4VDBvvv
	 +A/jNt2WgABrEJ6EE4SmE64oNTLlJGfTs5oPUgirlfbd/Hv21IJkKvnlDuxHBJKute
	 ki2g/3OvEer63dOW0xuoNak1WYxdb1mtUTu+nNKKY8lMCxHe2PHkHvjgSiPnvWlVJd
	 ukCOwkU1Wu7xfKiF+GlqYB0GMs5ZcBSEFaCSH5IcbzLAuka3BmMMc+Kh7mcznbcVFi
	 CNB+f8ZQFX+qGhDUXztlAUrsKzsfMGlSw8VqKXqUvFt7l6UV7+uFPZWqdn26jRSQmp
	 gBmwgbn77MXbA==
Date: Tue, 20 Aug 2024 17:55:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 04/12] hw/arm: xenpvh: Add support for SMP guests
In-Reply-To: <20240820142949.533381-5-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408201755430.298534@ubuntu-linux-20-04-desktop>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com> <20240820142949.533381-5-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add SMP support for Xen PVH ARM guests.
> Create ms->smp.max_cpus ioreq servers to handle hotplug.
> 
> Note that ms->smp.max_cpus will be passed to us by the
> user (Xen tools) set to the guests maxvcpus.
> 
> The value in mc->max_cpus is an absolute maximum for the
> -smp option and won't be used to setup ioreq servers unless
> the user explicitly specifies it with -smp.
> 
> If the user doesn't pass -smp on the command-line, smp.cpus
> and smp.max_cpus will default to 1.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 5f75cc3779..fda65d0d8d 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
>  
>      xen_init_ram(machine);
>  
> -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
> +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
>  
>      xen_create_virtio_mmio_devices(xam);
>  
> @@ -218,7 +218,26 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>      MachineClass *mc = MACHINE_CLASS(oc);
>      mc->desc = "Xen PVH ARM machine";
>      mc->init = xen_arm_init;
> -    mc->max_cpus = 1;
> +
> +    /*
> +     * mc->max_cpus holds the MAX value allowed in the -smp command-line opts.
> +     *
> +     * 1. If users don't pass any -smp option:
> +     *   ms->smp.cpus will default to 1.
> +     *   ms->smp.max_cpus will default to 1.
> +     *
> +     * 2. If users pass -smp X:
> +     *   ms->smp.cpus will be set to X.
> +     *   ms->smp.max_cpus will also be set to X.
> +     *
> +     * 3. If users pass -smp X,maxcpus=Y:
> +     *   ms->smp.cpus will be set to X.
> +     *   ms->smp.max_cpus will be set to Y.
> +     *
> +     * In scenarios 2 and 3, if X or Y are set to something larger than
> +     * mc->max_cpus, QEMU will bail out with an error message.
> +     */
> +    mc->max_cpus = GUEST_MAX_VCPUS;
>      mc->default_machine_opts = "accel=xen";
>      /* Set explicitly here to make sure that real ram_size is passed */
>      mc->default_ram_size = 0;
> -- 
> 2.43.0
> 

