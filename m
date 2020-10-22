Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23538295970
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 09:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10196.27014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVEs-0006IC-4G; Thu, 22 Oct 2020 07:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10196.27014; Thu, 22 Oct 2020 07:42:22 +0000
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
	id 1kVVEs-0006Hn-13; Thu, 22 Oct 2020 07:42:22 +0000
Received: by outflank-mailman (input) for mailman id 10196;
 Thu, 22 Oct 2020 07:42:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVVEq-0006Hi-1L
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:42:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b93c37c-2174-4d27-b3fe-958718084834;
 Thu, 22 Oct 2020 07:42:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EFBFB19C;
 Thu, 22 Oct 2020 07:42:17 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVVEq-0006Hi-1L
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:42:20 +0000
X-Inumbo-ID: 7b93c37c-2174-4d27-b3fe-958718084834
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7b93c37c-2174-4d27-b3fe-958718084834;
	Thu, 22 Oct 2020 07:42:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603352537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XqnchFJhBknshCnEom8XMHWkGQ4hmPvPqTXGVG7OITs=;
	b=Q00wt85dC39LR5wWKYHF7gtyagBVsjr5sQ0GczfFIHTGL153K7Lu8j+cZV8jpJnwPswLha
	ZdcNC0U3hAgS5n3iVeVmpj0OtEoHKaViBATcgHnSOw9Rp3OBYFmwKz55RmnNN+MijuqcWM
	hDFxm8vmvvWm6cxcBt6jhUUfVOJ6ses=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1EFBFB19C;
	Thu, 22 Oct 2020 07:42:17 +0000 (UTC)
Subject: Re: [PATCH] xen/acpi: Don't fail if SPCR table is absent
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201021221253.GA73207@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a960dd45-2867-5ef6-970c-952c03aa8cef@suse.com>
Date: Thu, 22 Oct 2020 09:42:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201021221253.GA73207@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.2020 00:12, Elliott Mitchell wrote:
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -42,17 +42,18 @@ static int __init acpi_iomem_deny_access(struct domain *d)
>      status = acpi_get_table(ACPI_SIG_SPCR, 0,
>                              (struct acpi_table_header **)&spcr);
>  
> -    if ( ACPI_FAILURE(status) )
> +    if ( ACPI_SUCCESS(status) )
>      {
> -        printk("Failed to get SPCR table\n");
> -        return -EINVAL;
> +        mfn = spcr->serial_port.address >> PAGE_SHIFT;
> +        /* Deny MMIO access for UART */
> +        rc = iomem_deny_access(d, mfn, mfn + 1);
> +        if ( rc )
> +            return rc;
> +    }
> +    else
> +    {
> +        printk("Failed to get SPCR table, Xen console may be unavailable\n");
>      }

Nit: While I see you've got Stefano's R-b already, I Xen we typically
omit the braces here.

Jan

