Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61201AC0E8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 14:19:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP3U5-0002Xe-Ax; Thu, 16 Apr 2020 12:19:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jP3U3-0002XZ-JN
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 12:19:07 +0000
X-Inumbo-ID: 77a79684-7fdc-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77a79684-7fdc-11ea-83d8-bc764e2007e4;
 Thu, 16 Apr 2020 12:19:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6DBD1AC6D;
 Thu, 16 Apr 2020 12:19:05 +0000 (UTC)
Subject: Re: [[PATCH v3]] xen/guest_access: Harden *copy_to_guest_offset() to
 prevent const dest operand
To: Julien Grall <julien@xen.org>
References: <20200416112423.25755-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <495b74dc-3ee3-ff23-99ce-2fa4a17d57a4@suse.com>
Date: Thu, 16 Apr 2020 14:19:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416112423.25755-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.04.2020 13:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, *copy_to_guest_offset() will allow the hypervisor to copy
> data to guest handle marked const.
> 
> Thankfully, no users of the helper will do that. Rather than hoping this
> can be caught during review, harden copy_to_guest_offset() so the build
> will fail if such users are introduced.
> 
> There is no easy way to check whether a const is NULL in C99. The
> approach used is to introduce an unused variable that is non-const and
> assign the handle. If the handle were const, this would fail at build
> because without an explicit cast, it is not possible to assign a const
> variable to a non-const variable.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further remark:

> --- a/xen/include/asm-x86/guest_access.h
> +++ b/xen/include/asm-x86/guest_access.h
> @@ -87,6 +87,8 @@
>  #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
>      const typeof(*(ptr)) *_s = (ptr);                   \
>      char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
> +    /* Check if the handle is not const */              \
> +    void *__maybe_unused _t = (hnd).p;                  \

Not being a native speaker, to me "if" doesn't look appropriate
here. I'd use "that" instead, but you may want to confirm this.
Overall then maybe "Check that the handle is not for a const type"?

Jan

