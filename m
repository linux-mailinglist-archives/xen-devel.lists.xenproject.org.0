Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D3A2B03BD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 12:22:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25694.53624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAfp-0001Tp-8J; Thu, 12 Nov 2020 11:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25694.53624; Thu, 12 Nov 2020 11:21:53 +0000
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
	id 1kdAfp-0001TQ-51; Thu, 12 Nov 2020 11:21:53 +0000
Received: by outflank-mailman (input) for mailman id 25694;
 Thu, 12 Nov 2020 11:21:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdAfn-0001TL-1G
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:21:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01339730-7f6e-4006-89dd-8786c823e55b;
 Thu, 12 Nov 2020 11:21:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 439E6AE95;
 Thu, 12 Nov 2020 11:21:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdAfn-0001TL-1G
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:21:51 +0000
X-Inumbo-ID: 01339730-7f6e-4006-89dd-8786c823e55b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 01339730-7f6e-4006-89dd-8786c823e55b;
	Thu, 12 Nov 2020 11:21:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605180109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FRUkI2aKuPl0W4Z27gLbGQAPZoWkrly1NUEDWgBoYc=;
	b=Zo5FCnsUzQDElAfW0Mn7K0cwcL8C9VnKMDF2djGFg7KMMGaNLTg1Esqc1vAJgqYO2Z8qHy
	mTqcXuLW7ZLrKA4qOxMNmUo1ntiTugXFbJFW2Ol2+TsWDyUnR4jBjlutmLeGpVdvoNVM7A
	5q2+A02XwhDbEpK2BDa+v+V4L36xmZo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 439E6AE95;
	Thu, 12 Nov 2020 11:21:49 +0000 (UTC)
Subject: Re: [PATCH V2 07/23] xen/ioreq: Move x86's ioreq_gfn(server) to
 struct domain
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-8-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00f9046f-5c77-cee5-b201-aa01f880d4e7@suse.com>
Date: Thu, 12 Nov 2020 12:21:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-8-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -77,7 +77,7 @@ static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
>      if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>          return -EINVAL;
>  
> -    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
> +    spin_lock_recursive(&d->ioreq_server.lock);
>  
>      s = get_ioreq_server(d, id);
>  
> @@ -92,7 +92,7 @@ static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
>      rc = p2m_set_ioreq_server(d, flags, s);
>  
>   out:
> -    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
> +    spin_unlock_recursive(&d->ioreq_server.lock);
>  
>      if ( rc == 0 && flags == 0 )
>      {


Does this build at this point, when !CONFIG_IOREQ_SERVER? Patch 1
moves the code here without guards, and patch 2, when introducing
the Kconfig symbol, doesn't add guards here. I admit I didn't
check further intermediate patches.

Jan

