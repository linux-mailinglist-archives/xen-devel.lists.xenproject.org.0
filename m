Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2B33F3A3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 15:46:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98729.187443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXRM-0005Lr-CL; Wed, 17 Mar 2021 14:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98729.187443; Wed, 17 Mar 2021 14:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXRM-0005LS-8z; Wed, 17 Mar 2021 14:46:28 +0000
Received: by outflank-mailman (input) for mailman id 98729;
 Wed, 17 Mar 2021 14:46:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXRK-0005LN-As
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 14:46:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXRJ-0008Ac-QI
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 14:46:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXRJ-0004XA-Nt
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 14:46:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lMXRF-0002GD-3v; Wed, 17 Mar 2021 14:46:21 +0000
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
	bh=Srs2h+RYvR2DBEbDO90F2mqfb3rlxgh8NiI51hYMaPY=; b=GvgoNtdXGzJfwhhidlA0l/bbTg
	eGiDUF8N0CjmwBLycoANKWFv3IjbBLR9RhsJw2UVfpvo1ydnMA2ds/QjVUE3ur5fXyEBgBlVP3cRr
	DyL5y0PtiopezlD8IL5r1rnAr7wwIaVpVgRjwGmnH3YG553UaZNDYrgg4asiFz8dEOP4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24658.5692.932979.892439@mariner.uk.xensource.com>
Date: Wed, 17 Mar 2021 14:46:20 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Wei Liu <wl@xen.org>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
In-Reply-To: <4b1c13ee-f121-3379-6fb3-c0d4dbb76e48@citrix.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
	<20210316161844.1658-2-andrew.cooper3@citrix.com>
	<24658.1583.601613.903527@mariner.uk.xensource.com>
	<4b1c13ee-f121-3379-6fb3-c0d4dbb76e48@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in guest_{rd,wr}msr()""):
> On 17/03/2021 13:37, Ian Jackson wrote:
> > AFAICT there is no explanation for why patches 1/ and 2/ deserve to go
> > into 4.15.

I see now, rereading the thread, that there was a sentence about this
in each patch betwen the commit message and the diff.  Sorry for
missing that.  (Although TBH at least one of those messages could
usefully have gone into the commit message, as useful motivational
background.)

> >   We are late in the freeze now, so I would ideally be
> > looking for a clear and compelling argument.  I'd also like to
> > understand what the risks are of taking these.  Can someone please
> > enlighten me ?
> 
> To make the code in 4.15 match 4.14, so patch 3 can be written in the
> first place.
> 
> Also, as a side benefit, patches 1 and 2 reduce the quantity of logspew
> from the impacted MSRs.
> 
> We cannot simply take patch 3 as-is, and say "4.14 and earlier" for
> backport, because that still forces end users to specify msr_relaxed to
> unbreak their Solaris guests, which is usability regression vs 4.14

This is plausible and going in the right direction but I still feel
uncertain.

Jan, what is your summary opinion about patch 3 ?

Roger, can I get your opinion about the possible downside risks of
this patch ?

Thanks,
Ian.

