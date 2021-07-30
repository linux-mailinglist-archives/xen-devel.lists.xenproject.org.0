Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A622B3DB963
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 15:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162576.298106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Sfh-0006Fa-Bs; Fri, 30 Jul 2021 13:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162576.298106; Fri, 30 Jul 2021 13:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Sfh-0006CA-7u; Fri, 30 Jul 2021 13:35:29 +0000
Received: by outflank-mailman (input) for mailman id 162576;
 Fri, 30 Jul 2021 13:35:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9Sfg-0006C4-4K
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 13:35:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9Sfg-0003pL-1j
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 13:35:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9Sfg-0002SD-0j
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 13:35:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m9Sfc-0006Hu-T5; Fri, 30 Jul 2021 14:35:24 +0100
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
	bh=3Bd3KcKj1rEjsKhrRTMeCLndfIbyNAYI7a+6VmdAAbQ=; b=T6Wz83eUuaf1rUSKOCxpif70Ka
	WvTfvDX0ChfqSNnRtm7XSRK0yvAqwgpOKrYyram7uuPNXR1/tGaMrj1puqEjhvBBXqnXoX4dkFNYT
	ETqnK+q7IFKGC5Q53yMz6EPeT/+DJ9DpAAenRnMNYerOvNGB93f8TYvao//8mI3dr3J0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24836.28.655841.510063@mariner.uk.xensource.com>
Date: Fri, 30 Jul 2021 14:35:24 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    julien@xen.org,
    Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for xenstored
In-Reply-To: <20210730122643.2043-3-jgross@suse.com>
References: <20210730122643.2043-1-jgross@suse.com>
	<20210730122643.2043-3-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v3 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
> Add a configuration item for the maximum number of domains xenstored
> should support and set the limit of open file descriptors accordingly.
> 
> For HVM domains there are up to 5 socket connections per domain (2 by
> the xl daemon process, and 3 by qemu). So set the ulimit for xenstored
> to 5 * XENSTORED_MAX_DOMAINS + 100 (the "+ 100" is for some headroom,
> like logging, event channel device, etc.).
...
> +## Type: integer
> +## Default: 32768
> +#
> +# Select maximum number of domains supported by xenstored.
> +# Only evaluated if XENSTORETYPE is "daemon".
> +#XENSTORED_MAX_N_DOMAINS=32768

I approve of doing something about the fd limit.  I have some qualms
about the documentation.

The documentation doesn't say what happens if this limit is exceeded.
Also the default of 32758 suggests that we actually support that many
domains.  I don't think we do...

I didn't find anything in SUPPORT.md about how many guests we support
but I wouldn't want this setting here to imply full support for 32768
domains.

If you don't want to tackle this can of works, maybe add this:

  # This just controls some resource limits for xenstored; if the
  # limit is exceeded, xenstored will stop being able to function
  # properly for additional guests.  The default value is so large
  # that it won't be exceeded in a supported configuration, but
  # should not be taken to mean that the whole Xen system is
  # guaranteed to work properly with that many guests.

Julien, did you ask for this to be made configurable ?  Having written
the text above, I wonder if it wouldn't just be better to
unconditionally set it to "unlimited" rather than offering footgun
dressed up like a tuneable...

If xenstored does go mad or leadk lots of fds, things are basically
stuffed in anycase.  Having its syscalls fail with EMFILE is not
really going to help.

Ian.

