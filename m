Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF63347689
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 11:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100907.192538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP17u-0004KX-C9; Wed, 24 Mar 2021 10:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100907.192538; Wed, 24 Mar 2021 10:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP17u-0004KA-7e; Wed, 24 Mar 2021 10:52:38 +0000
Received: by outflank-mailman (input) for mailman id 100907;
 Wed, 24 Mar 2021 10:52:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP17t-0004K3-3l
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 10:52:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP17s-0007Vf-UM
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 10:52:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP17s-00046q-0f
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 10:52:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lP17o-0004mV-QS; Wed, 24 Mar 2021 10:52:32 +0000
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
	bh=FVMmDOsLRfMMzg/p7EPsKJUqppGM919XRcNJQg0/VA0=; b=cXcDDESsVord1WaxOz31jbuDZm
	/RjnHawvcTqtSyVsFIxbVRGhjxsIzZ9m90OO6r3J2L8IKyO9Z5Gv2m9bKiWvWNPxNntFmIktynHmn
	1E2C5nXpRMxBZTW186jBeu4vBkqXSrk69ErSJteTrO0q6XDGPLlXZ+S6LTtvPHg6Vx3k=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24667.6640.601389.478906@mariner.uk.xensource.com>
Date: Wed, 24 Mar 2021 10:52:32 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH][4.15] x86/HPET: don't enable legacy replacement mode
 unconditionally
In-Reply-To: <8e18a2a5-bc19-615d-0c8c-cea49adcf976@suse.com>
References: <8e18a2a5-bc19-615d-0c8c-cea49adcf976@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH][4.15] x86/HPET: don't enable legacy replacement mode unconditionally"):
> Commit e1de4c196a2e ("x86/timer: Fix boot on Intel systems using ITSSPRC
> static PIT clock gating") was reported to cause boot failures on certain
> AMD Ryzen systems. Until we can figure out what the actual issue there
> is, skip this new part of HPET setup by default. Introduce a "hpet"
> command line option to allow enabling this on hardware where it's really
> needed for Xen to boot successfully (i.e. where the PIT doesn't drive
> the timer interrupt).
> 
> Since it makes little sense to introduce just "hpet=legacy-replacement",
> also allow for a boolean argument as well as "broadcast" to replace the
> separate "hpetbroadcast" option.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks.  I would like to ee it committed by the end of the week.

I don't feel qualified to review this.  I'm slightly uncomfortable
with the command line rework but I think as you say there probably
isn't a good more-minimal version.

I would like to ask the reviewer(s) to focus on this question: if the
option is not passed, does this revert the behaviour to be identical
to the behaviour of Xen before e1de4c196a2e ?

Thanks,
Ian.

