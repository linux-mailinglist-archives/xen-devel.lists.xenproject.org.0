Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0F0297A09
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 02:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11378.30173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW7Ul-0001dD-Sa; Sat, 24 Oct 2020 00:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11378.30173; Sat, 24 Oct 2020 00:33:19 +0000
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
	id 1kW7Ul-0001cn-PE; Sat, 24 Oct 2020 00:33:19 +0000
Received: by outflank-mailman (input) for mailman id 11378;
 Sat, 24 Oct 2020 00:33:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BKCc=D7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kW7Uk-0001Um-IK
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 00:33:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3bf7024-3da8-42e5-9a84-c11b758c484f;
 Sat, 24 Oct 2020 00:33:13 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7E03207F7;
 Sat, 24 Oct 2020 00:33:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BKCc=D7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kW7Uk-0001Um-IK
	for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 00:33:18 +0000
X-Inumbo-ID: a3bf7024-3da8-42e5-9a84-c11b758c484f
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a3bf7024-3da8-42e5-9a84-c11b758c484f;
	Sat, 24 Oct 2020 00:33:13 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E7E03207F7;
	Sat, 24 Oct 2020 00:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603499592;
	bh=WV+e6y8JnoR4Clbfvz79BylQiPklji9goIMBmamCRZk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=zp3laeFWpKE4qFSIwpoCjQ46GfaXSpnv7sFhDPnT4ueNhaSex+PKwIu5/9HeK3Ywx
	 X9Hmd0sAkL7Rxre0c7OzYov2664do534oKafsOUrjrM2WxDNVp5Um8Rt6ApvbI7AYP
	 YCyJKrVUPGUy5DlBsu8+d61TJdHnHeFix7OwT0NE=
Date: Fri, 23 Oct 2020 17:33:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org, 
    masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Rahul.Singh@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v2 7/7] xen/arm: acpi: Allow Xen to boot with ACPI 5.1
In-Reply-To: <20201023154156.6593-8-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2010231732150.12247@sstabellini-ThinkPad-T480s>
References: <20201023154156.6593-1-julien@xen.org> <20201023154156.6593-8-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Oct 2020, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> At the moment Xen requires the FADT ACPI table to be at least version
> 6.0, apparently because of some reliance on other ACPI v6.0 features.
> 
> But actually this is overzealous, and Xen works now fine with ACPI v5.1.
> 
> Let's relax the version check for the FADT table to allow QEMU to
> run the hypervisor with ACPI.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - Patch added
> ---
>  xen/arch/arm/acpi/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
> index 55c3e5cbc834..7ea2990cb82c 100644
> --- a/xen/arch/arm/acpi/boot.c
> +++ b/xen/arch/arm/acpi/boot.c
> @@ -181,8 +181,8 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>       * we only deal with ACPI 6.0 or newer revision to get GIC and SMP
>       * boot protocol configuration data, or we will disable ACPI.
>       */
> -    if ( table->revision > 6
> -         || (table->revision == 6 && fadt->minor_revision >= 0) )
> +    if ( table->revision > 5
> +         || (table->revision == 5 && fadt->minor_revision >= 1) )
>          return 0;
>  
>      printk("Unsupported FADT revision %d.%d, should be 6.0+, will disable ACPI\n",
> -- 
> 2.17.1
> 

