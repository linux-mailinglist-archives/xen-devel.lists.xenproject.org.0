Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B3823CC12
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 18:22:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3MAr-00079R-JX; Wed, 05 Aug 2020 16:21:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3MAq-00079L-9d
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 16:21:52 +0000
X-Inumbo-ID: 53b87ad9-041d-4b32-a0b8-24ac53ae949e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53b87ad9-041d-4b32-a0b8-24ac53ae949e;
 Wed, 05 Aug 2020 16:21:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68107AC65;
 Wed,  5 Aug 2020 16:22:07 +0000 (UTC)
Subject: Re: [RFC PATCH V1 08/12] xen/arm: Invalidate qemu mapcache on
 XENMEM_decrease_reservation
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-9-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <21b7d8ed-f305-8abe-0e4e-174d72d087c8@suse.com>
Date: Wed, 5 Aug 2020 18:21:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596478888-23030-9-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1652,6 +1652,12 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +    /* x86 already sets the flag in hvm_memory_op() */
> +#if defined(CONFIG_ARM64) && defined(CONFIG_IOREQ_SERVER)
> +    if ( op == XENMEM_decrease_reservation )
> +        curr_d->arch.hvm.qemu_mapcache_invalidate = true;
> +#endif

Doesn't the comment already indicate a route towards an approach
not requiring to alter common code?

Jan

