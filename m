Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2055B2EB04C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 17:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62083.109705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwpMq-0006oH-9d; Tue, 05 Jan 2021 16:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62083.109705; Tue, 05 Jan 2021 16:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwpMq-0006ns-6U; Tue, 05 Jan 2021 16:39:32 +0000
Received: by outflank-mailman (input) for mailman id 62083;
 Tue, 05 Jan 2021 16:39:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwpMo-0006nn-NJ
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 16:39:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e90c9cb6-f0cf-4796-bd48-436200305fdb;
 Tue, 05 Jan 2021 16:39:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15384AA7C;
 Tue,  5 Jan 2021 16:39:29 +0000 (UTC)
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
X-Inumbo-ID: e90c9cb6-f0cf-4796-bd48-436200305fdb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609864769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=znRVwlmzHraFEzooLiJ9sHODpAkG7p0BL1iV5YqA+no=;
	b=E5l3YwUtCKb+E7+7ayjEyIoccna0oHTYn1asW2xvnKvM8thttf1uuD97/+X0GmB9ZhxNea
	HUZgxfOFSodUjQE2F2M65EIeo7eYCENnnKm6UEInXAT6O3uFD3x9tV6YNp2AMLpaN64gbb
	xmBAzo5ubVxiDHZYFJQQbFgi2D4VK5Y=
Subject: Re: [PATCH 3/4] xen/domctl: Introduce fault_ttl
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
 <20201223163442.8840-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8956065-1528-d85a-a222-187ae737178a@suse.com>
Date: Tue, 5 Jan 2021 17:39:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201223163442.8840-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 17:34, Andrew Cooper wrote:
> To inject a simulated resource failure, for testing purposes.
> 
> Given a specific set of hypercall parameters, the failure is in a repeatable
> position, for the currently booted Xen.  The exact position of failures is
> highly dependent on the build of Xen, and hardware support.

What about other kinds of resources, or ones only indirectly
related to memory allocations (e.g. where we don't mean to
associate them with the domain)?

> RFC:
>  * Probably wants to be Kconfig'd

Yes.

>  * I'm thinking of dropping handle from xen_domctl_createdomain because it's a
>    waste of valuable space.

Looks entirely unrelated, but yes - as long as Xen itself has no
consumer of the field. The more that there already is
XEN_DOMCTL_setdomainhandle.

> --- a/xen/common/dmalloc.c
> +++ b/xen/common/dmalloc.c
> @@ -10,7 +10,13 @@ void dfree(struct domain *d, void *ptr)
>  
>  void *_dzalloc(struct domain *d, size_t size, size_t align)
>  {
> -    void *ptr = _xmalloc(size, align);
> +    void *ptr;
> +
> +    if ( atomic_read(&d->fault_ttl) &&
> +         atomic_dec_and_test(&d->fault_ttl) )
> +        return NULL;

Perhaps we want to introduce Linux'es atomic_add_unless()?

Jan

