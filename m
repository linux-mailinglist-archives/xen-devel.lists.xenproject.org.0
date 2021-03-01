Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300E328795
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91833.173319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmJT-0000Vm-2f; Mon, 01 Mar 2021 17:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91833.173319; Mon, 01 Mar 2021 17:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmJS-0000VN-Vi; Mon, 01 Mar 2021 17:26:30 +0000
Received: by outflank-mailman (input) for mailman id 91833;
 Mon, 01 Mar 2021 17:26:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmJR-0000VI-Qq
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:26:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmJR-00054I-PH
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:26:29 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmJR-0003TG-ON
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:26:29 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmJG-00051n-Pf; Mon, 01 Mar 2021 17:26:18 +0000
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
	bh=bA+VldAs5jFc9WhNWonTKwUQ2a0vJTe4ls32tzRPy8U=; b=GNxUwV/Utui3UDx+0VN3eXKYLX
	mbQT2oOUpgleFtNk6YWhkEEQNZm62D25fnSa0Wgh5a09KA+3+ozRsKmsaiFeHBewDScO3Ze9WNMNF
	qO5azUCWj89h40K+8kG2oGh3rwdvLJuaP4knVv8vAbY4wuOUhD2Pvr4XJ+2vFCO0yOrU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.9146.479629.762290@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:26:18 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH][4.15] x86/shadow: replace bogus return path in
 shadow_get_page_from_l1e()
In-Reply-To: <8bb04a4d-70ad-c557-c334-e1e55a429353@suse.com>
References: <d6cf1205-d537-fafb-a082-e973bfe11315@suse.com>
	<8bb04a4d-70ad-c557-c334-e1e55a429353@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH][4.15] x86/shadow: replace bogus return path in shadow_get_page_from_l1e()"):
> On 26.02.2021 16:08, Jan Beulich wrote:
> > Prior to be640b1800bb ("x86: make get_page_from_l1e() return a proper
> > error code") a positive return value did indicate an error. Said commit
> > failed to adjust this return path, but luckily the only caller has
> > always been inside a shadow_mode_refcounts() conditional.
> > 
> > Subsequent changes caused 1 to end up at the default (error) label in
> > the caller's switch() again, but the returning of 1 (== _PAGE_PRESENT)
> > is still rather confusing here, and a latent risk.
> 
> The confusion on my part was so significant that I screwed up
> the shadow mode fix for "VMX: use a single, global APIC access
> page" (which turned out to be necessary) initially. Hence my
> proposing this for 4.15.

Right.  I'm sympathetic, but I would like to hear from another
maintainer of this code, as to their opinion about how much this
change removes the potential for confusion.

>  I'm on the edge at this point whether
> I'd even consider this a backporting candidate.

I think you mean you think that even though the code does not compile
to something actually buggy now, this is sufficiently bad a confusion
that it risks bugs in stable trees, so you are considering
backporting.

Thanks, that is a useful piece of perspective.

Ian.

