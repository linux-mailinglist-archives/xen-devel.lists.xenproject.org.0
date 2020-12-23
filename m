Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934692E1C8D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 14:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58351.102507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4B6-0005Jt-6H; Wed, 23 Dec 2020 13:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58351.102507; Wed, 23 Dec 2020 13:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4B6-0005JU-2z; Wed, 23 Dec 2020 13:27:44 +0000
Received: by outflank-mailman (input) for mailman id 58351;
 Wed, 23 Dec 2020 13:27:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks4B4-0005JP-Jp
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 13:27:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6861c487-a0e5-4f2b-b21d-ab323437cafb;
 Wed, 23 Dec 2020 13:27:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0F52AD45;
 Wed, 23 Dec 2020 13:27:40 +0000 (UTC)
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
X-Inumbo-ID: 6861c487-a0e5-4f2b-b21d-ab323437cafb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608730061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OdUfEwYEnASrmMpQj9X+Zt6vSHa6Px9UUqg94/zIqhc=;
	b=Yp25mES6hT90Hth+GskiQN/MBcXRiRXBnrXO0NZXP0JtR9k2XaPBqLVyVyiQHoX0cXLJtE
	RpFhcFoK/kZxAx/Zv4kNk5ya0Qe60eG7qrU0rCIIpjkuoQPfq7QUK5j+8F5SSOR+U1RFY3
	ghFP9HKGSIxJ/rHcOc077F3jOYrTlCo=
Subject: Re: [PATCH for-4.15 1/4] xen/iommu: Check if the IOMMU was
 initialized before tearing down
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9dd2fbc-d4bb-6b12-73e7-52a4fdda9020@suse.com>
Date: Wed, 23 Dec 2020 14:27:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222154338.9459-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.12.2020 16:43, Julien Grall wrote:
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -226,7 +226,15 @@ static void iommu_teardown(struct domain *d)
>  
>  void iommu_domain_destroy(struct domain *d)
>  {
> -    if ( !is_iommu_enabled(d) )
> +    struct domain_iommu *hd = dom_iommu(d);
> +
> +    /*
> +     * In case of failure during the domain construction, it would be
> +     * possible to reach this function with the IOMMU enabled but not
> +     * yet initialized. We assume that hd->platforms will be non-NULL as
> +     * soon as we start to initialize the IOMMU.
> +     */
> +    if ( !is_iommu_enabled(d) || !hd->platform_ops )
>          return;

From your description I'd rather say is_iommu_enabled() is the
wrong predicate to use here. IOW I'd rather see it be replaced.

A couple of additional nits: "hd" isn't really necessary to
have as a local variable, but if you insist on introducing it
despite being used just once, it should be pointer-to-const.
Plus the comment would better spell correctly the field it
talks about. But I consider this comment excessive anyway, as
the check of ->platform_ops is quite clear by itself.

And finally "we assume" is in at least latent conflict with
->platform_ops getting set only after arch_iommu_domain_init()
was called. Right now neither x86'es nor Arm's do anything
that would need undoing, but I'd still suggest to replace
"assume" here (if you want to keep the comment in the first
place) and move the assignment up a few lines (right after the
is_iommu_enabled() check there).

Jan

