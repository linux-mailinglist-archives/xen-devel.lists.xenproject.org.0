Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E8300765
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:33:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72882.131373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yQs-0002Vh-6p; Fri, 22 Jan 2021 15:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72882.131373; Fri, 22 Jan 2021 15:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yQs-0002VI-3Q; Fri, 22 Jan 2021 15:33:06 +0000
Received: by outflank-mailman (input) for mailman id 72882;
 Fri, 22 Jan 2021 15:33:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yQq-0002VD-BE
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:33:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yQp-000219-Sg
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:33:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yQp-0007HN-Rt
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:33:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2yQm-000462-Ll; Fri, 22 Jan 2021 15:33:00 +0000
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
	bh=baHlpmCM+7LXwEs3U+LjvwJddk49UkxH33O3v3qMIbY=; b=lWQgxKSasa2UpD/MI4HM33IeUD
	l7+wCZjmUia/Hmvc2JXUrEam30lL2RQo5ENkEkGDGJT73Ep9Ka++6xYpIpePLZ44KdE0VGFcpAfXn
	1LK1SPutjdkXTy/pO9r5rh/D1gxKYzL6iVzKH9wS4Ejg2WCuVqB7dVHYRYxs7Fc1y4xU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Message-ID: <24586.61484.451595.44272@mariner.uk.xensource.com>
Date: Fri, 22 Jan 2021 15:33:00 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Wei Liu <wl@xen.org>,
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v7 08/10] tools/misc: Add xen-vmtrace tool
In-Reply-To: <20210121212718.2441-9-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
	<20210121212718.2441-9-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v7 08/10] tools/misc: Add xen-vmtrace tool"):
> From: Micha³ Leszczyñski <michal.leszczynski@cert.pl>
...
> +    if ( signal(SIGINT, int_handler) == SIG_ERR )
> +        err(1, "Failed to register signal handler\n");

How bad is it if this signal handler is not effective ?

> +    if ( xc_vmtrace_disable(xch, domid, vcpu) )
> +        perror("xc_vmtrace_disable()");

I guess the tracing will remain on, pointlessly, which has a perf
impact but nothing else ?

How is it possible for the user to clean this up ?

Also: at the very least, you need to trap SIGTERM SIGHUP SIGPIPE.

It would be good to exit with the right signal by re-raising it.

> +static volatile int interrupted = 0;

sig_atomic_t

Ian.

