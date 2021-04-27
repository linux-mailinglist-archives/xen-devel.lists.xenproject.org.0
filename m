Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47BF36C8AA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 17:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118633.224826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbPgP-000373-AD; Tue, 27 Apr 2021 15:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118633.224826; Tue, 27 Apr 2021 15:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbPgP-00036e-6m; Tue, 27 Apr 2021 15:31:29 +0000
Received: by outflank-mailman (input) for mailman id 118633;
 Tue, 27 Apr 2021 15:31:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbPgN-00036Z-MD
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 15:31:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84573d28-fe5d-4c53-99e9-41a8e03bf0ed;
 Tue, 27 Apr 2021 15:31:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9101B1C9;
 Tue, 27 Apr 2021 15:31:25 +0000 (UTC)
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
X-Inumbo-ID: 84573d28-fe5d-4c53-99e9-41a8e03bf0ed
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619537485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dr3lNssrnegV65sh/XYbCcnihlj+poCpFJ5i+N5Pe5E=;
	b=ls6jWpiG0bGa6VZoDfRRaAJ7Sq1lqZQCTL6dxUkRKJrbzFvSBPpNmxTbVPeVKWRRHpE+gI
	Z9WCQY3lDNwuQfH/0V4rXub0zhoD1pe8MPQ+2HwVDG2WGByS8I6vtO+y4+XXRwPN7QDwuZ
	dBCz6WRZosYPG51AtiFxADC42wqMhSU=
Subject: Re: [PATCH v3] x86/oprofile: remove compat accessors usage from
 backtrace
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210427142113.31961-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3aa0fdb1-87c8-39db-98eb-26664a0569ab@suse.com>
Date: Tue, 27 Apr 2021 17:31:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427142113.31961-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 16:21, Roger Pau Monne wrote:
> Remove the unneeded usage of the compat layer to copy frame pointers
> from guest address space. Instead just use raw_copy_from_guest.
> 
> While there change the accessibility check of one frame_head beyond to
> be performed as part of the copy, like it's done in the Linux code.
> Note it's unclear why this is needed.
> 
> Also drop the explicit truncation of the head pointer in the 32bit
> case as all callers already pass a zero extended value. The first
> value being rsp from the guest registers, and further calls will use
> ebp from frame_head_32bit struct.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Keep accessibility check for one frame_head beyond.
>  - Fix coding style.

I'm indeed more comfortable with this variant, so
Acked-by: Jan Beulich <jbeulich@suse.com>

Andrew - can you live with the 2-frame thingy staying around?

> @@ -51,52 +49,35 @@ static inline int is_32bit_vcpu(struct vcpu *vcpu)
>      else
>          return is_pv_32bit_vcpu(vcpu);
>  }
> -#endif
>  
>  static struct frame_head *
>  dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
>                       int mode)
>  {
> -    frame_head_t bufhead;
> +    /* Also check accessibility of one struct frame_head beyond. */
> +    frame_head_t bufhead[2];
>  
> -#ifdef CONFIG_COMPAT
>      if ( is_32bit_vcpu(vcpu) )
>      {
> -        DEFINE_COMPAT_HANDLE(frame_head32_t);
> -        __compat_handle_const_frame_head32_t guest_head =
> -            { .c = (unsigned long)head };
> -        frame_head32_t bufhead32;
> -
> -        /* Also check accessibility of one struct frame_head beyond */
> -        if (!compat_handle_okay(guest_head, 2))
> -            return 0;
> -        if (__copy_from_compat(&bufhead32, guest_head, 1))
> -            return 0;
> -        bufhead.ebp = (struct frame_head *)(unsigned long)bufhead32.ebp;
> -        bufhead.ret = bufhead32.ret;
> -    }
> -    else
> -#endif
> -    {
> -        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
> -            const_guest_handle_from_ptr(head, frame_head_t);
> +        frame_head32_t bufhead32[2];
>  
> -        /* Also check accessibility of one struct frame_head beyond */
> -        if (!guest_handle_okay(guest_head, 2))
> -            return 0;
> -        if (__copy_from_guest(&bufhead, guest_head, 1))
> +        if ( raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)) )

As a minor remark, personally I'd prefer the & to be dropped here
and ...

>              return 0;
> +        bufhead[0].ebp = (struct frame_head *)(unsigned long)bufhead32[0].ebp;
> +        bufhead[0].ret = bufhead32[0].ret;
>      }
> +    else if ( raw_copy_from_guest(&bufhead, head, sizeof(bufhead)) )

... here (and doing so while committing would be easy), but I'm
not going to insist.

Jan

