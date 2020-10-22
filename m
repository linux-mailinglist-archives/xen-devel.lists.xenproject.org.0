Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A962964C3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 20:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10637.28386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVfZh-0004II-Ba; Thu, 22 Oct 2020 18:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10637.28386; Thu, 22 Oct 2020 18:44:33 +0000
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
	id 1kVfZh-0004Ht-8L; Thu, 22 Oct 2020 18:44:33 +0000
Received: by outflank-mailman (input) for mailman id 10637;
 Thu, 22 Oct 2020 18:44:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GjE6=D5=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVfZf-0004Ho-A4
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 18:44:31 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6212469c-41fc-4145-ac83-55828beeed68;
 Thu, 22 Oct 2020 18:44:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVfZc-0007vV-PU; Thu, 22 Oct 2020 18:44:28 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVfZc-0006PY-H3; Thu, 22 Oct 2020 18:44:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GjE6=D5=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVfZf-0004Ho-A4
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 18:44:31 +0000
X-Inumbo-ID: 6212469c-41fc-4145-ac83-55828beeed68
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6212469c-41fc-4145-ac83-55828beeed68;
	Thu, 22 Oct 2020 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=zKRIqE5QdB44gNecpq9/v2buwXY54W2I5s/epMF+zfY=; b=IvwEonIy05AykSGlxgHqIkYYMb
	UP4kh8NlEu7yrH5Gs9nYjF/r+v7zHHg9OjdMwmrDCfB9noT9cIPmzzfmiuDnUwOIbVyRbpC/jRBRe
	avS92hDWPNMsGTF+J6fogLWdRWb6rqkaWTKIXKQBP/xir9x6M26i3Rj1t4d3yrEbBgjY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVfZc-0007vV-PU; Thu, 22 Oct 2020 18:44:28 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVfZc-0006PY-H3; Thu, 22 Oct 2020 18:44:28 +0000
Subject: Re: [PATCH] xen/acpi: Don't fail if SPCR table is absent
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201021221253.GA73207@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <930267bd-5442-3ff0-bb5b-1ed8e2ebe37c@xen.org>
Date: Thu, 22 Oct 2020 19:44:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201021221253.GA73207@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

Thank you for the patch. FIY I tweak a bit the commit title before 
committing.

The title is now: "xen/arm: acpi: Don't fail it SPCR table is absent".

Cheers,

On 21/10/2020 23:12, Elliott Mitchell wrote:
> Absence of a SPCR table likely means the console is a framebuffer.  In
> such case acpi_iomem_deny_access() should NOT fail.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
>   xen/arch/arm/acpi/domain_build.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index 1b1cfabb00..bbdc90f92c 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -42,17 +42,18 @@ static int __init acpi_iomem_deny_access(struct domain *d)
>       status = acpi_get_table(ACPI_SIG_SPCR, 0,
>                               (struct acpi_table_header **)&spcr);
>   
> -    if ( ACPI_FAILURE(status) )
> +    if ( ACPI_SUCCESS(status) )
>       {
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
>       }
> -
> -    mfn = spcr->serial_port.address >> PAGE_SHIFT;
> -    /* Deny MMIO access for UART */
> -    rc = iomem_deny_access(d, mfn, mfn + 1);
> -    if ( rc )
> -        return rc;
>   
>       /* Deny MMIO access for GIC regions */
>       return gic_iomem_deny_access(d);
> 

-- 
Julien Grall

