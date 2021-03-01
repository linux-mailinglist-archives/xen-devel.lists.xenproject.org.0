Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9B632896F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91900.173466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmn9-0004pD-Mi; Mon, 01 Mar 2021 17:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91900.173466; Mon, 01 Mar 2021 17:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmn9-0004oo-JD; Mon, 01 Mar 2021 17:57:11 +0000
Received: by outflank-mailman (input) for mailman id 91900;
 Mon, 01 Mar 2021 17:57:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmn8-0004oi-NP
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:57:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmn8-0005dX-Hy
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:57:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmn8-0006Af-Ey
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:57:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmn5-0005Av-7H; Mon, 01 Mar 2021 17:57:07 +0000
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
	bh=/tsqDgDiCXCBV/dlxEtU4ZyBhohY5NbuMKO23ydx0Ac=; b=Fd8eZPyttvCHYPOI8z/Y4ahAbm
	rWzwcxzMUbn+iNZWCQILcd+4l5Vop1GoQYsp5qgXkIck1x5KvDe4+MCXiHrx5fKzQkgT68teA0tNa
	kw/PqP2cpehQE/HnTAtOfOqtLXgwqAKRGKFtDGm527yO2vOC0dPsKi02exJFJichmWRg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24637.10994.995547.72710@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:57:06 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Jun Nakajima <jun.nakajima@intel.com>,
    Kevin  Tian <kevin.tian@intel.com>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
In-Reply-To: <YD0pwgN3jOYTGWnH@Air-de-Roger>
References: <20210301162357.76527-1-roger.pau@citrix.com>
	<24637.8562.514355.845883@mariner.uk.xensource.com>
	<YD0pwgN3jOYTGWnH@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR behavior selection"):
> On Mon, Mar 01, 2021 at 05:16:34PM +0000, Ian Jackson wrote:
> > So AIUI this patch is to make it possible for Xen 4.15 to behave like
> > Xen 4.14, thus avoiding a regression for these troublesome guests.
> 
> Yes, sorry I haven't provided a release executive summary, as I wasn't
> sure this would be acceptable in it's current form. Can do if there's
> consensus this is an acceptable fix.

Thanks for the information.  I am in favour of fixing this issue.
I have it on my 4.15 blockers list.

Thanks,
Ian.

