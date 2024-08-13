Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC04994FB4F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 03:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775826.1186015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgd9-0004CL-LI; Tue, 13 Aug 2024 01:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775826.1186015; Tue, 13 Aug 2024 01:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgd9-0004An-IG; Tue, 13 Aug 2024 01:47:23 +0000
Received: by outflank-mailman (input) for mailman id 775826;
 Tue, 13 Aug 2024 01:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgOn=PM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sdgd8-0004Ab-Jr
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 01:47:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fab79cb8-5915-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 03:47:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F0B06151C;
 Tue, 13 Aug 2024 01:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CFBC4AF0D;
 Tue, 13 Aug 2024 01:47:18 +0000 (UTC)
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
X-Inumbo-ID: fab79cb8-5915-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513640;
	bh=fMn8dtUROSmqJUNq0JhJUJsk6JPdhvOhOc2jEf7/A9o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=urp84KlH+9mVHG3gXIHHqyYE9L/j0qFLU5qEooK4sM9aGZ9oCL+FLaJb8+fVvC4Ff
	 CjKD9eBGmyK7Laxkdq085YiJhqISw3IenQHdSrzDE73lgB4+r/SjEakswvLj8GjvWd
	 R8rzz0dNDPzLxTYxYr9Fa9wHC5CIHfjM30QpN30ElK6fn112oU9G5wvxuEu9WHzpoO
	 eayk5KUaukLhOcFkGP7DZhQXGSbLbyTla/XO9ayBaaca2+gqjaYF9NcbFXQnRdSa5U
	 P2Mh8GirKSOPN30GARr/a5FpJ/H4Slslzl8zF4dcYHqEgNE95vTtPsgAOTmLz3kElX
	 7a3GPUSMMxHrQ==
Date: Mon, 12 Aug 2024 18:47:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
In-Reply-To: <20240812130606.90410-5-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-5-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
> servers to handle hotplug.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/arm/xen_arm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 5f75cc3779..ef8315969c 100644
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
> @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>      MachineClass *mc = MACHINE_CLASS(oc);
>      mc->desc = "Xen PVH ARM machine";
>      mc->init = xen_arm_init;
> -    mc->max_cpus = 1;
> +    /* MAX number of vcpus supported by Xen.  */
> +    mc->max_cpus = GUEST_MAX_VCPUS;

Will this cause allocations of data structures with 128 elements?
Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called
later on with the precise vCPU value which should be provided to QEMU
via the -smp command line option
(tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?


