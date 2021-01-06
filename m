Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D672EBD1B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 12:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62430.110564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6us-0002pW-1A; Wed, 06 Jan 2021 11:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62430.110564; Wed, 06 Jan 2021 11:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6ur-0002p7-Tq; Wed, 06 Jan 2021 11:23:49 +0000
Received: by outflank-mailman (input) for mailman id 62430;
 Wed, 06 Jan 2021 11:23:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kx6uq-0002p1-NT
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:23:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kx6uq-0007IY-Ku
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:23:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kx6uq-00021A-JD
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:23:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kx6ul-0005j4-Nz; Wed, 06 Jan 2021 11:23:43 +0000
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
	bh=2WteMOgX1p1m+KjvnO7HtZ06C+Zd/fAunLzV5kbXupA=; b=oZZnxSCtsQQrEKnUwra+NAyQ5y
	0KzHyvVx+1IbZ8wtsFRjCONc9uHNP4yFTLFQRg1TfzyqeFPAWF4M02FIrO9LhdCZrTmmyUSQnAS1W
	nheDnH+xOQxGW09Uxtz30g52ZEkGoW3tlvtg0zTvIcGtaY2A0nXOrFI9lMh+uiF/M9XM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24565.40383.481245.649560@mariner.uk.xensource.com>
Date: Wed, 6 Jan 2021 11:23:43 +0000
To: Wei Liu <wl@xen.org>
Cc: Olaf Hering <olaf@aepfle.de>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC10 [and 1 more messages]
In-Reply-To: <20210105115708.aq2nfk3x4cnizzws@liuwe-devbox-debian-v2>,
	<osstest-158191-mainreport@xen.org>
References: <osstest-158191-mainreport@xen.org>
	<20210104115223.25403-1-olaf@aepfle.de>
	<20210105115708.aq2nfk3x4cnizzws@liuwe-devbox-debian-v2>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Wei Liu writes ("Re: [PATCH v1] tools: ipxe: update for fixing build with GCC10"):
> On Mon, Jan 04, 2021 at 12:52:23PM +0100, Olaf Hering wrote:
> > Update to v1.21.1 to fix build in Tumbleweed, which has been broken
> > since months due to lack of new release.
> > 
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Acked-by: Wei Liu <wl@xen.org>
...
> > -IPXE_GIT_TAG := 1dd56dbd11082fb622c2ed21cfaced4f47d798a6
> > +IPXE_GIT_TAG := 988d2c13cdf0f0b4140685af35ced70ac5b3283c

Unfortunately this broke the build, but it's not really your fault:

osstest service owner writes ("[xen-unstable-smoke test] 158191: regressions - FAIL"):
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 158134

--2021-01-06 01:27:19--  http://xenbits.xen.org/xen-extfiles/ipxe-git-988d2c13cdf0f0b4140685af35ced70ac5b3283c.tar.gz
Resolving cache (cache)... 172.16.148.6
Connecting to cache (cache)|172.16.148.6|:3128... connected.
Proxy request sent, awaiting response... 404 Not Found

We currently insist on having have a tarball.

That means someone (me, I guess) has to do a "git archive" and put the
resulting tarball in the right place on xenbits.  Unfortunately this
is still manual, but we don't update ipxe very often.

I have made the tarball now.

Ian.

