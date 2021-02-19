Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011AC31FD6F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 17:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86997.163847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD93c-0004D0-4x; Fri, 19 Feb 2021 16:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86997.163847; Fri, 19 Feb 2021 16:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD93c-0004Cb-1r; Fri, 19 Feb 2021 16:55:08 +0000
Received: by outflank-mailman (input) for mailman id 86997;
 Fri, 19 Feb 2021 16:55:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD93a-0004CU-Mk
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:55:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD93a-000502-Ky
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:55:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD93a-0007Tv-IV
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:55:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lD93X-0001S9-4c; Fri, 19 Feb 2021 16:55:03 +0000
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
	bh=MZHIVyOQN/1/fIErbtWNkeK/kPFL3SkkUFk13SXq5rM=; b=a9Kd1KLgA6zujPxFVq5WTODPNr
	YoQEcRFdbIhJFtTe4ho1V5rd1fKdOn4eSy/Mqmp2nYQ8kUiUayIhNG7TC9DvdKsXO3afwXlncHal6
	S4T7aCH1vNAU6/PocRjELu+1qlCgWK9xsYY6HgzIVjRmHoWBLvlvBAmZKHDR4r1Fw/7s=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24623.60774.894817.439652@mariner.uk.xensource.com>
Date: Fri, 19 Feb 2021 16:55:02 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: remove more absolute paths from dependency tracking
 files
In-Reply-To: <0a68efee-9595-b272-fc8b-8ceb284d3163@suse.com>
References: <0a68efee-9595-b272-fc8b-8ceb284d3163@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] build: remove more absolute paths from dependency tracking files"):
> d6b12add90da ("DEPS handling: Remove absolute paths from references to
> cwd") took care of massaging the dependencies of the output file, but
> for our passing of -MP to the compiler to take effect the same needs to
> be done on the "phony" rules that the compiler emits.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

> --- a/Config.mk
> +++ b/Config.mk
> @@ -63,7 +63,7 @@ DEPS_INCLUDE = $(addsuffix .d2, $(basena
>  DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
>  
>  %.d2: %.d
> -	sed "s! $$PWD/! !" $^ >$@.tmp && mv -f $@.tmp $@
> +	sed "s!\(^\| \)$$PWD/! !" $^ >$@.tmp && mv -f $@.tmp $@

Urgh I hate having to remember the crazy \ rules for all these
different kinds of regexps.  I have to test it every time...

Thanks for fixing this, anyway.

Ian.

