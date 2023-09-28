Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00B7B2679
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 22:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610029.949248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlxVa-0007mj-70; Thu, 28 Sep 2023 20:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610029.949248; Thu, 28 Sep 2023 20:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlxVa-0007k2-4E; Thu, 28 Sep 2023 20:21:14 +0000
Received: by outflank-mailman (input) for mailman id 610029;
 Thu, 28 Sep 2023 20:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlxVY-0007jw-TN
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 20:21:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c410957-5e3c-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 22:21:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 54C0C61D1E;
 Thu, 28 Sep 2023 20:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D820C433C7;
 Thu, 28 Sep 2023 20:21:01 +0000 (UTC)
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
X-Inumbo-ID: 8c410957-5e3c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695932463;
	bh=sejX9pXLRGpidZ+kpQmQM1u0brz//PKs7DTFEsWWEEw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aeWuBJr90Lpg3sp/4yXdaALv+WZ5p+jZ0sl9rYYDog0ogkemFZeaDZpf6t78BVi3l
	 79HkmwYUcmBjgWnM+X26CcxITZMGv7F+rTIhj4MWGDNLzYyu9nT5xJ7IIE70Ntw5Wy
	 oM1H/WnjX81D7nmy5bnjO0Qthqgh6VCf7bhPbu0jah1q4X4Dg8LJ9pxZJJNVZ/RkdV
	 2kDXmxrvxw4nkqaNwrrQPe3d6M9m9GKxG8PIwU1kRQb6Po2NM63nVdtbd6WHKPr3Zi
	 fAQxsnSx57c16n1IMrrJpWnVob3sLwy4Etj8SO1S58AAx/jXYokE+LhjuU/mTmBMRN
	 fQWAtxqgiZe3Q==
Date: Thu, 28 Sep 2023 13:21:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Validate generic timer frequency
In-Reply-To: <20230928123435.2802-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309281320540.1996340@ubuntu-linux-20-04-desktop>
References: <20230928123435.2802-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Sep 2023, Michal Orzel wrote:
> Generic timer dt node property "clock-frequency" (refer Linux dt binding
> Documentation/devicetree/bindings/timer/arm,arch_timer.yaml) is used to
> override the incorrect value set by firmware in CNTFRQ_EL0. If the value
> of this property is 0 (i.e. by mistake), Xen would continue to work and
> use the value from the sysreg instead. The logic is thus incorrect and
> results in inconsistency when creating timer node for domUs:
>  - libxl domUs: clock_frequency member of struct xen_arch_domainconfig
>    is set to 0 and libxl ignores setting the "clock-frequency" property,
>  - dom0less domUs: "clock-frequency" property is taken from dt_host and
>    thus set to 0.
> 
> Property "clock-frequency" is used to override the value from sysreg,
> so if it is also invalid, there is nothing we can do and we shall panic
> to let user know about incorrect setting. Going even further, we operate
> under assumption that the frequency must be at least 1KHz (i.e. cpu_khz
> not 0) in order for Xen to boot. Therefore, introduce a new helper
> validate_timer_frequency() to verify this assumption and use it to check
> the frequency obtained either from dt property or from sysreg.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/time.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index 3535bd8ac7c7..04b07096b165 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -101,6 +101,17 @@ static void __init preinit_acpi_xen_time(void)
>  static void __init preinit_acpi_xen_time(void) { }
>  #endif
>  
> +static void __init validate_timer_frequency(void)
> +{
> +    /*
> +     * ARM ARM does not impose any strict limit on the range of allowable
> +     * system counter frequencies. However, we operate under the assumption
> +     * that cpu_khz must not be 0.
> +     */
> +    if ( !cpu_khz )
> +        panic("Timer frequency is less than 1 KHz\n");
> +}
> +
>  /* Set up the timer on the boot CPU (early init function) */
>  static void __init preinit_dt_xen_time(void)
>  {
> @@ -122,6 +133,7 @@ static void __init preinit_dt_xen_time(void)
>      if ( res )
>      {
>          cpu_khz = rate / 1000;
> +        validate_timer_frequency();
>          timer_dt_clock_frequency = rate;
>      }
>  }
> @@ -137,7 +149,10 @@ void __init preinit_xen_time(void)
>          preinit_acpi_xen_time();
>  
>      if ( !cpu_khz )
> +    {
>          cpu_khz = (READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MASK) / 1000;
> +        validate_timer_frequency();
> +    }
>  
>      res = platform_init_time();
>      if ( res )
> -- 
> 2.25.1
> 

