Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841853EB465
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 13:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166754.304374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEV43-0004IT-8K; Fri, 13 Aug 2021 11:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166754.304374; Fri, 13 Aug 2021 11:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEV43-0004Gg-4b; Fri, 13 Aug 2021 11:09:27 +0000
Received: by outflank-mailman (input) for mailman id 166754;
 Fri, 13 Aug 2021 11:09:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mEV42-0004Ga-94
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 11:09:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mEV41-0004Fr-OH
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 11:09:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mEV41-0008Qz-NL
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 11:09:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mEV3y-00019A-7M; Fri, 13 Aug 2021 12:09:22 +0100
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
	bh=k357fCtaJ0yEVW58F8Zan4AZMTwdQ+4oQZj5tN9TPB4=; b=LcCMju0fu7Hi7Up/XwzmsEgQoF
	Ct2i90wFzZXebcec1OH403hTN0ZjrkCKS3NS3Yt8ky+SBqmhvfsy+H4dng0aLkyK/Y/WU2yV5ALic
	z4bxdBxajM52e9K4TRjdiMx1DtSItVnjRtY9/3lhN4bidSnW7hmLxmaOP9T+USHFFR1w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24854.21217.976758.626859@mariner.uk.xensource.com>
Date: Fri, 13 Aug 2021 12:09:21 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH] tests/xenstore: link in librt
In-Reply-To: <74fde732-c2bb-168f-a51c-74e2220c87c5@suse.com>
References: <3fe5f85c-3702-286c-46a3-d90eb094123f@suse.com>
	<24853.1273.985325.539310@mariner.uk.xensource.com>
	<74fde732-c2bb-168f-a51c-74e2220c87c5@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] tests/xenstore: link in librt"):
> On 12.08.2021 13:24, Ian Jackson wrote:
> >> +LDFLAGS += -lrt
> > 
> > Don't this unconditionally is definitely not right.
> 
> Assuming you meant "Doing this ..." - why? If the concern is that
> librt.so may needlessly get recorded in a DT_NEEDED entry, then I
> can replace the early addition with a late
> 
> LDFLAGS += -Wl,--as-needed -lc -lrt
> 
> one.

librt might not exist at all on some platforms.

> > How old a glibc are we talking about ?  (I looked at the minimum
> > versions listed in README and there's notthing about glibc; perhaps
> > should be.)
> 
> I've hit this with 2.11.3. I guess it has been made available by
> libc.so from 2.17 onwards, considering the symbol version is
> GLIBC_2.17.

According to
  https://www.sourceware.org/glibc/wiki/Glibc%20Timeline
glibc 2.17 was released more than eight years ago on 2012-12-25.

Ian.

