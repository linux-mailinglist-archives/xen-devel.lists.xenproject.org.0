Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E777136927E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 14:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116304.221992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvJ8-0001Om-C7; Fri, 23 Apr 2021 12:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116304.221992; Fri, 23 Apr 2021 12:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvJ8-0001OM-8o; Fri, 23 Apr 2021 12:53:18 +0000
Received: by outflank-mailman (input) for mailman id 116304;
 Fri, 23 Apr 2021 12:53:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZvJ7-0001OG-54
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 12:53:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aba5f916-d7af-4dcb-9674-7c6fda0182d2;
 Fri, 23 Apr 2021 12:53:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC86FB1B1;
 Fri, 23 Apr 2021 12:53:14 +0000 (UTC)
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
X-Inumbo-ID: aba5f916-d7af-4dcb-9674-7c6fda0182d2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619182394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OH1ib3JmgY4rmD88rHAp/fAvcQqWqkmqvTRWo8WAEiE=;
	b=WZq/sSibEFlVgkk+XF4pq/IfTzj3KPe0icbBVZazaxovx2P/SXoAB062E5rCUxJeV7Z3tk
	fpsMK3nO98a4Gw1U9Se4zmVDdpTTfoQA8dFvO3zaBkyz9/u3ZBgMZO3CV6qSZhcpYHk0QH
	0k7LPeEhNK1FI9dB65PuE73W2r0fiRA=
Subject: Re: [PATCH] x86/oprofile: remove compat accessors usage from
 backtrace
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210423123509.9354-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d77cd67-5866-9d58-b2d0-b8d28b827084@suse.com>
Date: Fri, 23 Apr 2021 14:53:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423123509.9354-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 14:35, Roger Pau Monne wrote:
> Remove the unneeded usage of the compat layer to copy frame pointers
> from guest address space. Instead just use raw_copy_from_guest.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Just build tested. Note sure I'm missing something, since using the
> compat layer here was IMO much more complicated than just using the
> raw accessors.

The main reason, I suppose, was that raw_copy_*() aren't supposed to
be used directly.

> @@ -59,34 +56,17 @@ dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
>  {
>      frame_head_t bufhead;
>  
> -#ifdef CONFIG_COMPAT
>      if ( is_32bit_vcpu(vcpu) )
>      {
> -        DEFINE_COMPAT_HANDLE(frame_head32_t);
> -        __compat_handle_const_frame_head32_t guest_head =
> -            { .c = (unsigned long)head };

You're losing the truncation to 32 bits here.

>          frame_head32_t bufhead32;
>  
> -        /* Also check accessibility of one struct frame_head beyond */
> -        if (!compat_handle_okay(guest_head, 2))
> -            return 0;

If you intentionally remove this and ...

> -        if (__copy_from_compat(&bufhead32, guest_head, 1))
> +        if (raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)))
>              return 0;
>          bufhead.ebp = (struct frame_head *)(unsigned long)bufhead32.ebp;
>          bufhead.ret = bufhead32.ret;
>      }
> -    else
> -#endif
> -    {
> -        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
> -            const_guest_handle_from_ptr(head, frame_head_t);
> -
> -        /* Also check accessibility of one struct frame_head beyond */
> -        if (!guest_handle_okay(guest_head, 2))
> -            return 0;

... this, then you should justify why these aren't needed anymore
(or maybe were never really needed). They've been put there for a
purpose, I'm sure, even if I'm unclear about what one it was/is.

Jan

