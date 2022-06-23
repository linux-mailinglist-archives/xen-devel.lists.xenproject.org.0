Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53A3558B25
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 00:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355208.582746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Uz1-0000Xh-Jy; Thu, 23 Jun 2022 22:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355208.582746; Thu, 23 Jun 2022 22:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Uz1-0000Vw-GB; Thu, 23 Jun 2022 22:07:27 +0000
Received: by outflank-mailman (input) for mailman id 355208;
 Thu, 23 Jun 2022 22:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VLWc=W6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o4Uyz-0000Vq-SC
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 22:07:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc0cc03e-f340-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 00:07:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2326961EA4;
 Thu, 23 Jun 2022 22:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080B3C341C0;
 Thu, 23 Jun 2022 22:07:21 +0000 (UTC)
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
X-Inumbo-ID: dc0cc03e-f340-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656022042;
	bh=LlUv5RLzDJ+mvV5i38k8rTDG/sLFJ6pidfM/gtiGwmc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=luTI+TugVIJOXOmUGGsTq1BBnIBPVbewgC7bPJq/IiviJunuM7SouMt0kPZRu0VsI
	 tvipyY+Jkhed3qR63KJvsugaQ6KeXrkizfVLuCDr5M9B8V5ydUnZzlz6zChQIsgNpg
	 t0y0tCnAeYJ6YtBK38TrSje7/+0iLLdqX+MKaUTLoslQm85uLubHnS1PrDSVfnRLiZ
	 5zsD4XODxojNac/f2uahfrv07Z0aBaTRQ7orwU9RC0DoEHTk/Ob9vUjmNuXCbOee7Q
	 PoQpvgGfWJz0oXIA6qmtnglBBi1DPudghMdcjRi8nZpzhWtb0I+gfA/Zg8T7gXQrs4
	 2epE76b7e86Pg==
Date: Thu, 23 Jun 2022 15:07:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmitry.semenets@gmail.com
cc: xen-devel@lists.xenproject.org, Dmytro Semenets <dmytro_semenets@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
In-Reply-To: <20220623074428.226719-1-dmitry.semenets@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206231457250.2410338@ubuntu-linux-20-04-desktop>
References: <20220623074428.226719-1-dmitry.semenets@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Jun 2022, dmitry.semenets@gmail.com wrote:
> From: Dmytro Semenets <dmytro_semenets@epam.com>
> 
> When shutting down (or rebooting) the platform, Xen will call stop_cpu()
> on all the CPUs but one. The last CPU will then request the system to
> shutdown/restart.
> 
> On platform using PSCI, stop_cpu() will call PSCI CPU off. Per the spec
> (section 5.5.2 DEN0022D.b), the call could return DENIED if the Trusted
> OS is resident on the CPU that is about to be turned off.
> 
> As Xen doesn't migrate off the trusted OS (which BTW may not be
> migratable), it would be possible to hit the panic().
> 
> In the ideal situation, Xen should migrate the trusted OS or make sure
> the CPU off is not called. However, when shutting down (or rebooting)
> the platform, it is pointless to try to turn off all the CPUs (per
> section 5.10.2, it is only required to put the core in a known state).
> 
> So solve the problem by open-coding stop_cpu() in halt_this_cpu() and
> not call PSCI CPU off.
> 
> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
> ---
>  xen/arch/arm/shutdown.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
> index 3dc6819d56..a9aea19e8e 100644
> --- a/xen/arch/arm/shutdown.c
> +++ b/xen/arch/arm/shutdown.c
> @@ -8,7 +8,12 @@
>  
>  static void noreturn halt_this_cpu(void *arg)
>  {
> -    stop_cpu();
> +    local_irq_disable();
> +    /* Make sure the write happens before we sleep forever */
> +    dsb(sy);
> +    isb();
> +    while ( 1 )
> +        wfi();
>  }


stop_cpu has already a wfi loop just after the psci call:

    call_psci_cpu_off();

    while ( 1 )
        wfi();


So wouldn't it be better to remove the panic from the implementation of
call_psci_cpu_off?

The reason I am saying this is that stop_cpu is called in a number of
places beyond halt_this_cpu and as far as I can tell any of them could
trigger the panic. (I admit they are unlikely places but still.)


Also the PSCI spec explicitely mention CPU_OFF as a way to place CPUs in
a "known state" and doesn't offer any other examples. So although what
you wrote in the commit message is correct, using CPU_OFF seems to be
the less error prone way (in the sense of triggering firmware errors) to
place CPUs in a known state.

So I would simply remove the panic from call_psci_cpu_off, so that we
try CPU_OFF first, and if it doesn't work, we use the WFI loop as
backup. Also we get to fix all the other callers of stop_cpu this way.

