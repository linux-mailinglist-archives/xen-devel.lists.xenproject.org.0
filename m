Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99591300186
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 12:28:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72695.130932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ubF-0008Bs-8Q; Fri, 22 Jan 2021 11:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72695.130932; Fri, 22 Jan 2021 11:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ubF-0008BT-5E; Fri, 22 Jan 2021 11:27:33 +0000
Received: by outflank-mailman (input) for mailman id 72695;
 Fri, 22 Jan 2021 11:27:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2ubD-0008BO-Ks
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 11:27:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbadab7c-fd2e-487f-a4b6-2b4b8c9123ef;
 Fri, 22 Jan 2021 11:27:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E8F9AB9F;
 Fri, 22 Jan 2021 11:27:29 +0000 (UTC)
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
X-Inumbo-ID: cbadab7c-fd2e-487f-a4b6-2b4b8c9123ef
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611314849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acRTWlwsRO3tCobqEArtH/sD9iTUEWe8VYcJ4NrOAWs=;
	b=C71jDvR1knPOI6WT4GWyjNVa8CBIhLVeLMEbnLxBU8TKI37W7KGtnImeK45nJ8U54WZqmk
	2engRo1KqJ5hulLoxLQDD2uO3ImTTNGtZHycO5jpobE5O5Nnz+55ODJuayodMpq3HfP1RA
	qTu03BPGh0eOOQGqQr7UMmEid7QbhLI=
Subject: Re: [PATCH v3 1/5] xen: add XEN_BUILD_POSIX_TIME
To: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Daniel Kiper <daniel.kiper@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <e8c57268455291bad0bbcdf0013b0d5aa349be1b.1611273359.git.bobbyeshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52e85ee7-b980-ece1-50d4-7deac182bca0@suse.com>
Date: Fri, 22 Jan 2021 12:27:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e8c57268455291bad0bbcdf0013b0d5aa349be1b.1611273359.git.bobbyeshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 01:51, Bobby Eshleman wrote:
> From: Daniel Kiper <daniel.kiper@oracle.com>
> 
> POSIX time is required to fill the TimeDateStamp field
> in the PE header.
> 
> Use SOURCE_DATE_EPOCH if available, otherwise use
> `date +%s` (available on both Linux and FreeBSD).
> 
> Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>

Especially with there not being any user of the new item,
you will want to at least briefly explain ...

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -11,6 +11,7 @@ export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) |
>  export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
>  export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
>  export XEN_BUILD_HOST	?= $(shell hostname)
> +export XEN_BUILD_POSIX_TIME	?= $(shell echo $${SOURCE_DATE_EPOCH:-$(shell date +%s)})

... the use of SOURCE_DATE_EPOCH here when it's not used for
XEN_BUILD_TIME (the two could also do with living side by
side) and ...

> --- a/xen/include/xen/compile.h.in
> +++ b/xen/include/xen/compile.h.in
> @@ -1,5 +1,6 @@
>  #define XEN_COMPILE_DATE	"@@date@@"
>  #define XEN_COMPILE_TIME	"@@time@@"
> +#define XEN_COMPILE_POSIX_TIME	@@posix_time@@
>  #define XEN_COMPILE_BY		"@@whoami@@"
>  #define XEN_COMPILE_DOMAIN	"@@domain@@"
>  #define XEN_COMPILE_HOST	"@@hostname@@"

... the lack of quotes here when all neighboring items have
them.

Jan

