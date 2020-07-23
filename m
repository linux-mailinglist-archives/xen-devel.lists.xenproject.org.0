Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6586322AD9E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 13:23:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyZK5-0004VA-5j; Thu, 23 Jul 2020 11:23:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyZK3-0004Un-8y
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 11:23:35 +0000
X-Inumbo-ID: f1b43260-ccd6-11ea-86ef-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1b43260-ccd6-11ea-86ef-bc764e2007e4;
 Thu, 23 Jul 2020 11:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595503415;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5043FSVGr2QCvh6VcUR41H4uVQ36RMQBykxDE6RLfnI=;
 b=XeWHtdWLWMVOqxmZ5DM9qLmwnQTyJ5Kk20bXvi92fhsEhZ59QtikqBjp
 0xXQbGvqqL/jzgVgH/CQjpkQmTMGHhsD5pP/bXMeonWfzB/KkFQ39KJEf
 hvnPkerjqlZWfhlFTdf3KtEmj/PHJW4xpK0mUOMi2rrMunxNlfA5ix44a k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vxqR4kR3NFdeXoQIdd/lZ2KjBYnYUtfy8k4I7QKFU0B5I6AHWNTGf6L9c9ox5XlFeQE3qfMcOR
 PUxsS5JL2/DAJnFJSkkQOpeCqtACTlU9A75yhk/CRFPELO/eOBEStkzm/p5LoqBTveg+p4hUTu
 d9TCbHgOZrcURSbVmt2miurQmHOb+83finivTHy/cIcsv8Jxyskrt5tmlxHX7ECMn7LeXMRJjN
 yKiafd6R963rapUhglBRw5lVM0Sgvw3lMLtrp3uKyqFbm8ckHz/lzBYzhA9ummZ8XI9D7ia1lI
 Mn8=
X-SBRS: 2.7
X-MesageID: 23024954
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23024954"
Subject: Re: [PATCH 1/2] lockprof: don't leave locks uninitialized upon
 allocation failure
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <47f5478d-2f46-656c-0882-121aebc77f39@suse.com>
 <7c4f50ce-6212-2f16-c9c5-c9af450b10ba@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <39e8063c-3e91-fb27-1160-13baa0a97849@citrix.com>
Date: Thu, 23 Jul 2020 12:23:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7c4f50ce-6212-2f16-c9c5-c9af450b10ba@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/07/2020 11:51, Jan Beulich wrote:
> Even if a specific struct lock_profile instance can't be allocated, the
> lock itself should still be functional. As this isn't a production use
> feature, also log a message in the event that the profiling struct can't
> be allocated.
>
> Fixes: d98feda5c756 ("Make lock profiling usable again")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -103,10 +103,16 @@ struct lock_profile_qhead {
>      do {                                                                      \
>          struct lock_profile *prof;                                            \
>          prof = xzalloc(struct lock_profile);                                  \
> -        if (!prof) break;                                                     \
> +        (s)->l = (spinlock_t)_SPIN_LOCK_UNLOCKED(prof);                       \
> +        if ( !prof )                                                          \
> +        {                                                                     \
> +            printk(XENLOG_WARNING                                             \
> +                   "lock profiling unavailable for %p(%d)'s " #l "\n",        \
> +                   s, (s)->profile_head.idx);                                 \

You'll end up with far less .rodata if you use %s and pass #l in as a
parameter.

Either way, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> +            break;                                                            \
> +        }                                                                     \
>          prof->name = #l;                                                      \
>          prof->lock = &(s)->l;                                                 \
> -        (s)->l = (spinlock_t)_SPIN_LOCK_UNLOCKED(prof);                       \
>          prof->next = (s)->profile_head.elem_q;                                \
>          (s)->profile_head.elem_q = prof;                                      \
>      } while(0)
>


