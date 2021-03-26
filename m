Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E4234A6C9
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 13:04:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101748.194756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlBv-0003cj-En; Fri, 26 Mar 2021 12:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101748.194756; Fri, 26 Mar 2021 12:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlBv-0003cK-BK; Fri, 26 Mar 2021 12:03:51 +0000
Received: by outflank-mailman (input) for mailman id 101748;
 Fri, 26 Mar 2021 12:03:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlBt-0003cF-93
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:03:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlBt-000675-70
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:03:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlBt-0000fM-5H
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:03:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPlBp-0002Oh-N7; Fri, 26 Mar 2021 12:03:45 +0000
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
	bh=EjMvcT9xppmrzc6TwqrFBgO/liBMzrBGAoZU7LBBZzU=; b=sWlbBhPLdOKF8kpLcLVjVT78wW
	psGoklEZ64Ca1IBXUM8WxESdXqmwVyYAGvCOAO6UrCHDXADsuMlv6bShlQUtmKeRjEwtj6Pl/v1j9
	+97huQvBk7XWmy/BumIdKPS2JvR450lDcnGhrAyB/7zS/1ZNYFoABqFCLE5GyOUgkmDA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.52641.499147.88002@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 12:03:45 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
    =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally
In-Reply-To: <20210325172132.14980-1-andrew.cooper3@citrix.com>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
	<20210325172132.14980-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally"):
> From: Jan Beulich <jbeulich@suse.com>
> 
> Commit e1de4c196a2e ("x86/timer: Fix boot on Intel systems using ITSSPRC
> static PIT clock gating") was reported to cause boot failures on certain
> AMD Ryzen systems.
> 
> Refine the fix to do nothing in the default case, and only attempt to
> configure legacy replacement mode if IRQ0 is found to not be working.
> 
> In addition, introduce a "hpet" command line option so this heuristic
> can be overridden.  Since it makes little sense to introduce just
> "hpet=legacy-replacement", also allow for a boolean argument as well as
> "broadcast" to replace the separate "hpetbroadcast" option.

I'm sorry, but I think it is too late for 4.15 to do this.  I prefer
Jan's patch which I have alread release-acked.

Can someone qualified please provide a maintainer review for this,
ideally today ?

Ian.

