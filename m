Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8321C32D866
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 18:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93356.176254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHrXN-0007gx-7E; Thu, 04 Mar 2021 17:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93356.176254; Thu, 04 Mar 2021 17:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHrXN-0007gY-41; Thu, 04 Mar 2021 17:13:21 +0000
Received: by outflank-mailman (input) for mailman id 93356;
 Thu, 04 Mar 2021 17:13:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHrXL-0007gR-Dk
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 17:13:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHrXL-0008E1-7a
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 17:13:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHrXL-0003Vw-3Q
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 17:13:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHrXH-0005qi-MX; Thu, 04 Mar 2021 17:13:15 +0000
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
	bh=+3bPWeNO4cRWraA/arRquDBv6TCVSBgSkRs9wkbBh6g=; b=svo0Cpxu/XtfuEPluaMtfcP3Qx
	uFr+h31rbMDz+1728pxUp1r5xYKtVHkoVikUmiBzO04Y0vCvyJ5t9qoNIons6+UfzWjApnDikmqXY
	LTP8lCG8p/0ZlC9SLiRihOSIttqZgb2Ek410u+/XOevHp1iOomtBDGpW15rP7/WZRZDA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24641.5419.379341.215528@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 17:13:15 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Jun Nakajima <jun.nakajima@intel.com>,
    "Kevin  Tian" <kevin.tian@intel.com>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
In-Reply-To: <YEERBL4AO371ZxmP@Air-de-Roger>
References: <20210304144755.35891-1-roger.pau@citrix.com>
	<24640.62938.427877.757656@mariner.uk.xensource.com>
	<YED5Czp+v2xFSCOG@Air-de-Roger>
	<24640.64194.445736.52546@mariner.uk.xensource.com>
	<YEERBL4AO371ZxmP@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed rdmsr behavior"):
> On Thu, Mar 04, 2021 at 03:20:34PM +0000, Ian Jackson wrote:
> > The guest could be stopped with xl shutdown and then recrated with xl
> > create, from the config file.  I don't think we want to break that use
> > case here either.
> 
> So my original approach was to actually risk breaking creation from
> config file and require the user to set the rdmsr_relaxed option, and
> report the problem upstream. I think ideally we would like to get to a
> point where we could drop the rdmsr_relaxed option, but maybe that's
> too optimistic.

Isn't there some way we can move in this direction without the first
thing that users experience being their guests not being able to be
created ?

Maybe we could print a warning on the console or something ?

> We have done quite a lot of testing of this new policy, but obviously
> it's not possible to test all possible guest OSes. Forcing the new
> policy by default might be too risky, so indeed falling back to
> enabling this by default could be the only solution.
> 
> The main downside of enabling by default is that then we have to
> resign to always having this kind of quirky behavior for MSR
> accesses as the default.

What would stop us changing the default later, when we had a better
idea of the set of RDMSRs that need to be special-cased ?

Ian.

