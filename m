Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B727227F5FD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 01:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961.3241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNlV1-00021p-MN; Wed, 30 Sep 2020 23:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961.3241; Wed, 30 Sep 2020 23:27:03 +0000
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
	id 1kNlV1-00021Q-Iz; Wed, 30 Sep 2020 23:27:03 +0000
Received: by outflank-mailman (input) for mailman id 961;
 Wed, 30 Sep 2020 23:27:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kNlUz-00021L-Ra
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 23:27:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df3b5c13-ddbc-4720-b6ac-5a9c2e4c8c72;
 Wed, 30 Sep 2020 23:27:01 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47205206F4;
 Wed, 30 Sep 2020 23:27:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BzSz=DH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kNlUz-00021L-Ra
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 23:27:01 +0000
X-Inumbo-ID: df3b5c13-ddbc-4720-b6ac-5a9c2e4c8c72
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id df3b5c13-ddbc-4720-b6ac-5a9c2e4c8c72;
	Wed, 30 Sep 2020 23:27:01 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 47205206F4;
	Wed, 30 Sep 2020 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601508420;
	bh=cfrFwFkWYhO7Vl/7IfOuT/uOwX+kHaR6TN7ZUiaBmYQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HnGzGK+8hbtGWnAFQv/RftCBnW70CdPVaAjX1qo1OmrUZo+Ohua2mt0sO4PGRSOgT
	 U79DkMqWklPaG8sDO2ajHzHoGkrFE8dcEU7x+4iChoMhYoQodSp/xqbO4VY5X34H33
	 HI30XYpXJ5VGVO29AXv4u0dnQBn9iSXkD/jgZK2s=
Date: Wed, 30 Sep 2020 16:26:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org, 
    masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/4] xen/arm: Check if the platform is not using ACPI
 before initializing Dom0less
In-Reply-To: <20200926205542.9261-4-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2009301626300.10908@sstabellini-ThinkPad-T480s>
References: <20200926205542.9261-1-julien@xen.org> <20200926205542.9261-4-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 26 Sep 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Dom0less requires a device-tree. However, since commit 6e3e77120378
> "xen/arm: setup: Relocate the Device-Tree later on in the boot", the
> device-tree will not get unflatten when using ACPI.
> 
> This will lead to a crash during boot.
> 
> Given the complexity to setup dom0less with ACPI (for instance how to
> assign device?), we should skip any code related to Dom0less when using
> ACPI.

Yeah...

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index f16b33fa87a2..35e5bee04efa 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -987,7 +987,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>  
>      system_state = SYS_STATE_active;
>  
> -    create_domUs();
> +    if ( acpi_disabled )
> +        create_domUs();
>  
>      domain_unpause_by_systemcontroller(dom0);
>  
> -- 
> 2.17.1
> 

