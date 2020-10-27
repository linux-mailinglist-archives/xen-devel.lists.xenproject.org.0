Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0168D29CC23
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 23:44:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13134.33733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXXhR-0001Hd-OW; Tue, 27 Oct 2020 22:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13134.33733; Tue, 27 Oct 2020 22:44:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXXhR-0001HC-L3; Tue, 27 Oct 2020 22:44:17 +0000
Received: by outflank-mailman (input) for mailman id 13134;
 Tue, 27 Oct 2020 22:44:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXXhP-0001Gk-A6
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 22:44:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cd50051-5bf8-4a75-9d8d-22c5a7558a9f;
 Tue, 27 Oct 2020 22:44:14 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8C0A2070E;
 Tue, 27 Oct 2020 22:44:13 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXXhP-0001Gk-A6
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 22:44:15 +0000
X-Inumbo-ID: 7cd50051-5bf8-4a75-9d8d-22c5a7558a9f
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7cd50051-5bf8-4a75-9d8d-22c5a7558a9f;
	Tue, 27 Oct 2020 22:44:14 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B8C0A2070E;
	Tue, 27 Oct 2020 22:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603838654;
	bh=rv/hDW3fGoRvDjcOou9Oo677MhsJNQXyeWnFU4rkdy0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YXcoYVhHg8cALr2h6Ft9QtCM/feZOTIpU7xdDndfuQMzQkgOhJgptFaWbE334RDMQ
	 +d+CLGmOK0Y9D8iX2Yj21Fk5W3IVeYm/InKiRLIxulBrCpmA+ffgH4fKgnfz8wIhMO
	 iJiTjJ8R79FtAN+Gya9zqB8/Qekz8bKcgZAKIBU0=
Date: Tue, 27 Oct 2020 15:44:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
In-Reply-To: <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2010271540110.12247@sstabellini-ThinkPad-T480s>
References: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com> <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Oct 2020, Bertrand Marquis wrote:
> When a Cortex A57 processor is affected by CPU errata 832075, a guest
> not implementing the workaround for it could deadlock the system.
> Add a warning during boot informing the user that only trusted guests
> should be executed on the system.
> An equivalent warning is already given to the user by KVM on cores
> affected by this errata.
> 
> Also taint the hypervisor as unsecure when this errata applies and
> mention Cortex A57 r0p0 - r1p2 as not security supported in SUPPORT.md
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  SUPPORT.md               |  1 +
>  xen/arch/arm/cpuerrata.c | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 5fbe5fc444..f7a3b046b0 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -38,6 +38,7 @@ supported in this document.
>  ### ARM v8
>  
>      Status: Supported
> +    Status, Cortex A57 r0p0 - r1p2, not security supported (Errata 832075)
>  
>  ## Host hardware support
>  
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 0430069a84..b35e8cd0b9 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -503,6 +503,19 @@ void check_local_cpu_errata(void)
>  void __init enable_errata_workarounds(void)
>  {
>      enable_cpu_capabilities(arm_errata);
> +
> +#ifdef CONFIG_ARM64_ERRATUM_832075
> +    if ( cpus_have_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) )
> +    {
> +        printk_once("**** This CPU is affected by the errata 832075. ****\n"
> +                    "**** Guests without CPU erratum workarounds     ****\n"
> +                    "**** can deadlock the system!                   ****\n"
> +                    "**** Only trusted guests should be used.        ****\n");

These can be on 2 lines, no need to be on 4 lines.


I know that Julien wrote about printing the warning from
enable_errata_workarounds but to me it looks more natural if we did it
from the .enable function specific to ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE.

That said, I don't feel strongly about it, I am fine either way. Julien,
do you have a preference?


Other than that, it is fine.


> +        /* Taint the machine has being insecure */
> +        add_taint(TAINT_MACHINE_UNSECURE);
> +    }
> +#endif


