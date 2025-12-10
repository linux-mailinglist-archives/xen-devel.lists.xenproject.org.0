Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8C5CB33A5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 15:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182996.1505789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTLaj-0005Zm-MM; Wed, 10 Dec 2025 14:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182996.1505789; Wed, 10 Dec 2025 14:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTLaj-0005Wh-JI; Wed, 10 Dec 2025 14:54:57 +0000
Received: by outflank-mailman (input) for mailman id 1182996;
 Wed, 10 Dec 2025 14:54:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vTLah-0005Wb-RY
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 14:54:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vTLah-003GqO-0N;
 Wed, 10 Dec 2025 14:54:55 +0000
Received: from [2a01:cb15:80df:da00:d2b0:117d:791c:30c0] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vTLah-00A3mo-0H;
 Wed, 10 Dec 2025 14:54:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=72qyOyJ+3tFrLzMg1G91GD7fLoNYYn3oTMvzwY3PRc8=; b=EzQwJGjOBlX95izK2kNjTeYR20
	Z+U0hWBp04Hm9zZtMRxYUvyl+TQ0783LUgkts1gJrbZUi1tCqOt9rdYcneT3ZgSop7k2ICLkhmmvn
	Qjkcg/V0vi9Jije7uPW70rzLsEFkv0Mgi6aU/SevP4soTs5OmMwKMR2j0HB2g706H8EU=;
Date: Wed, 10 Dec 2025 15:54:52 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] tools/sd-notify.h: Include string.h too
Message-ID: <aTmJvMAkVXzmHw41@l14>
References: <20251205220012.1976435-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251205220012.1976435-1-andrew.cooper3@citrix.com>

On Fri, Dec 05, 2025 at 10:00:12PM +0000, Andrew Cooper wrote:
> Alpine Linux, when using --enable-systemd to get the init files, fails with:
> 
>   tools/include/xen-sd-notify.h:69:3: error: call to undeclared library
>   function 'memcpy' with type 'void *(void *, const void *, unsigned long)';
>   ISO C99 and later do not support implicit function declarations
>   [-Wimplicit-function-declaration]
>      69 |   memcpy(socket_addr.sun.sun_path, socket_path, path_length);
>         |   ^
> 
> This will be down to using musl rather than glibc.  Include the appropriate
> header.
> 
> Fixes: 78510f3a1522 ("tools: Import stand-alone sd_notify() implementation from systemd")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

