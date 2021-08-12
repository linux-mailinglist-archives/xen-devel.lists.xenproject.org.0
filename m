Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F09C3EA3A8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 13:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166254.303576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE8pL-0003DZ-F0; Thu, 12 Aug 2021 11:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166254.303576; Thu, 12 Aug 2021 11:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE8pL-0003Bm-Bu; Thu, 12 Aug 2021 11:24:47 +0000
Received: by outflank-mailman (input) for mailman id 166254;
 Thu, 12 Aug 2021 11:24:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mE8pJ-0003Bg-KV
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 11:24:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mE8pJ-0004Kq-Jd
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 11:24:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mE8pJ-0003nm-Ip
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 11:24:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mE8pG-0006mN-Al; Thu, 12 Aug 2021 12:24:42 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=XMV6M/SiklNU5dzwA9GDgpAdmx0iS//fONcI8E11YU4=; b=I+k1BW7EBHBOiB9O2sm01uasqY
	5cXzRlGV94uCaJZyqt3M0VIlYEWGeRxeWV44cVdlMJcL1GAWx/ta++WNmhYgDvbIVt5g21JPuswPk
	KA/3tkkJeOVl9EG9TLGt4YQxGzA/uAGE+PWyeQQlYPzPWN3HckDUFUPpbkE1pT43t+S0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24853.1273.985325.539310@mariner.uk.xensource.com>
Date: Thu, 12 Aug 2021 12:24:41 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>
Subject: [PATCH] tests/xenstore: link in librt
In-Reply-To: <3fe5f85c-3702-286c-46a3-d90eb094123f@suse.com>
References: <3fe5f85c-3702-286c-46a3-d90eb094123f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] tests/xenstore: link in librt"):
> Old enough glibc has clock_gettime() in librt.so, hence the library
> needs to be specified to the linker.
> 
> Fixes: 93c9edbef51b ("tests/xenstore: Rework Makefile")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Cc list based on the assumption that the XENSTORE section of
> ./MAINTAINERS probably ought to list the containing directory.
> 
> --- a/tools/tests/xenstore/Makefile
> +++ b/tools/tests/xenstore/Makefile
> @@ -31,6 +31,7 @@ CFLAGS += -Werror
>  CFLAGS += $(CFLAGS_libxenstore)
>  CFLAGS += $(APPEND_CFLAGS)
>  
> +LDFLAGS += -lrt

Don't this unconditionally is definitely not right.

How old a glibc are we talking about ?  (I looked at the minimum
versions listed in README and there's notthing about glibc; perhaps
should be.)

Ian.

