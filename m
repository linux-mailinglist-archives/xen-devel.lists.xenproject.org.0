Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F431FD53
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 17:42:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86988.163800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8rH-0002Tx-5m; Fri, 19 Feb 2021 16:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86988.163800; Fri, 19 Feb 2021 16:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8rH-0002TW-2F; Fri, 19 Feb 2021 16:42:23 +0000
Received: by outflank-mailman (input) for mailman id 86988;
 Fri, 19 Feb 2021 16:42:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8rF-0002TN-3B
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:42:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8rF-0004md-0Z
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:42:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8rE-0002U1-V0
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:42:20 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lD8rB-0001Of-Mf; Fri, 19 Feb 2021 16:42:17 +0000
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
	bh=hWjHV8b6g6GxCZgpsU4NfV7RHhGd7hhRUk3swvyHJiM=; b=1GJaFAhJQNaoJib5nttyNsxj4a
	UirwyaQsb1ijyx2U3c4za5lOXzTN5vNSO0EXmTrb1kuTeXZ2hxY/BQqLDlDtb9y7jQy1FDTXFqTAF
	e68SSGf6JqZCKhOE2WLm14Y/tRDtrv4D/9+qdM5x7jkz/Zu9lykz0bNQofJWPMQmOaec=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24623.60009.486528.814166@mariner.uk.xensource.com>
Date: Fri, 19 Feb 2021 16:42:17 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [for-4.15 PATCH] build: remove more absolute paths from dependency tracking
 files
In-Reply-To: <0a68efee-9595-b272-fc8b-8ceb284d3163@suse.com>
References: <0a68efee-9595-b272-fc8b-8ceb284d3163@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] build: remove more absolute paths from dependency tracking files"):
> d6b12add90da ("DEPS handling: Remove absolute paths from references to
> cwd") took care of massaging the dependencies of the output file, but
> for our passing of -MP to the compiler to take effect the same needs to
> be done on the "phony" rules that the compiler emits.

Thanks.

I think this is a bugfix.  As discussed in d6b12add90da these absolute
paths can cause build races.  So:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/Config.mk
> +++ b/Config.mk
> @@ -63,7 +63,7 @@ DEPS_INCLUDE = $(addsuffix .d2, $(basena
>  DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
>  
>  %.d2: %.d
> -	sed "s! $$PWD/! !" $^ >$@.tmp && mv -f $@.tmp $@
> +	sed "s!\(^\| \)$$PWD/! !" $^ >$@.tmp && mv -f $@.tmp $@
>  
>  include $(XEN_ROOT)/config/$(XEN_OS).mk
>  include $(XEN_ROOT)/config/$(XEN_TARGET_ARCH).mk

