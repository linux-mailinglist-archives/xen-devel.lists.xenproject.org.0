Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BF0431681
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212030.369763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQEm-00076G-DZ; Mon, 18 Oct 2021 10:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212030.369763; Mon, 18 Oct 2021 10:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQEm-00074T-AM; Mon, 18 Oct 2021 10:51:24 +0000
Received: by outflank-mailman (input) for mailman id 212030;
 Mon, 18 Oct 2021 10:51:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQEl-00074N-2h
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:51:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQEl-0002ze-1v
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:51:23 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQEl-0003J6-11
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:51:23 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcQEe-0005av-Ld; Mon, 18 Oct 2021 11:51:16 +0100
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
	bh=8H9XuXVR6da7py2LFOMq979ejxA/c/T4INmrvC65j1A=; b=lHtciyXKXCb7SUYGkRp7AXWmR1
	6cTIcmW0ZNcZ2WW7aqXc9ewu+Y6GwX4Y69BwJ1KuVHXty9WbrUdSI4PulnoV9MCvHYHRj5wqwYEjx
	sobQF2roQeHF9L7trdxpyh7/xFZpyDf7xAiNSeb+468JfeWrVqVlljflMN3E0/feAU/Q=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24941.20900.439531.733506@mariner.uk.xensource.com>
Date: Mon, 18 Oct 2021 11:51:16 +0100
To: Jan Beulich <jbeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: committers@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: Re: Xen 4.16 development update
In-Reply-To: <e644a1d4-a7a2-0554-f639-e19ba3102294@suse.com>
References: <24913.54299.590779.955301@mariner.uk.xensource.com>
	<24925.34307.187952.463474@mariner.uk.xensource.com>
	<e644a1d4-a7a2-0554-f639-e19ba3102294@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: Xen 4.16 development update"):
> Now that we're here, I of course have given up on any of the pending
> non-bugfix patches to make 4.16. But I very much hope 4.16 won't go
> out with known bugs having fixes available. Therefore I've pinged (in
> some cases again):
> 
> x86/CPUID: don't shrink hypervisor leaves
> x86emul: de-duplicate scatters to the same linear address
> x86/AMD: make HT range dynamic for Fam17 and up
> x86/PV: address odd UB in I/O emulation
> x86/xstate: reset cached register values on resume
> x86/altp2m: don't consider "active" when enabling failed
> x86/PV: '0' debug key stack dumping adjustments [at least the first 2]
> x86/paging: restrict physical address width reported to guests
> x86/PoD: defer nested P2M flushes
> 
> In principle "x86: more or less log-dirty related improvements" also
> contains a number of bug fixes, but the way this series is stuck
> made me not include it in the pings.
> 
> I've tried to remember to Cc you on these pings, but I may not have
> succeeded in doing so.

Thanks.  I got at least most of them.

Roger, would you be able to review these changes ?

Thanks,
Ian.

