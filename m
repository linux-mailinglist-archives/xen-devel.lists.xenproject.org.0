Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BF434ACB5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 17:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101955.195323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpYe-0006nv-JW; Fri, 26 Mar 2021 16:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101955.195323; Fri, 26 Mar 2021 16:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpYe-0006nW-GD; Fri, 26 Mar 2021 16:43:36 +0000
Received: by outflank-mailman (input) for mailman id 101955;
 Fri, 26 Mar 2021 16:43:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPpYd-0006nR-A1
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 16:43:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPpYd-00033V-55
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 16:43:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPpYd-0007Ow-3v
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 16:43:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPpYZ-0003Ey-MN; Fri, 26 Mar 2021 16:43:31 +0000
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
	bh=y+Unkinlcfob9Uis45yPN2CsWa6fStajlF6LYeaBUfU=; b=ak4NTxpbDWUeMlnkOpTADP5meu
	Gy518QkbJkwAvxgIcMp/8w4KKnZcyMwoISeKaYpn6g6rqozreQ37PxXYLedEys6TThW5/O/STxBBa
	zv92eqG528BsPMoQBN3bKtiWfQKFwQ33cwEb2uKxIhFwcQBaPpHgOm7Gsu6l1rHeMJMo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24670.3891.328817.908772@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 16:43:31 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
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

Reviewed-by: Ian Jackson <iwj@xenproject.org>

I have to say that this

   -    if ( hpet_rate )
   +    if ( hpet_rate || !hpet_address || !opt_hpet )
            return hpet_rate;

   -    if ( hpet_address == 0 )
   -        return 0;
   -

is to my mind quite an obscure coding style.

Do we really want to return a nozero hpet_rate even if !opt_hpet ?

I would have said

   +
   +    if ( hpet_address == 0 || !opt_hpet )
   +        return 0;

        if ( hpet_rate )
        if ( hpet_rate )
            return hpet_rate;

   -    if ( hpet_address == 0 )
   -        return 0;
   -

But Andy's version of expresses it the same way so fine, if that's the
way you like to do things, and hpet_opt is new in this patch so I
don't consider it a crisis if it doesn't work right.

Ian.

