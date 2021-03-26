Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F2934A7EB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101790.194906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmJa-0004G4-Ml; Fri, 26 Mar 2021 13:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101790.194906; Fri, 26 Mar 2021 13:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmJa-0004Ff-JR; Fri, 26 Mar 2021 13:15:50 +0000
Received: by outflank-mailman (input) for mailman id 101790;
 Fri, 26 Mar 2021 13:15:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPmJZ-0004Fa-B6
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:15:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPmJZ-0007LF-8e
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:15:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPmJZ-0006c5-7Y
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:15:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPmJS-0002bm-IZ; Fri, 26 Mar 2021 13:15:42 +0000
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
	bh=20g2J7MwDZnikxbnbSJAC9FAWMPrL7UpYoJbVngFzQg=; b=ZwSRf2qRU+uOCuD+t6FYvbzT3V
	VhYUZ2//afWUfHRlld0krKavxkxBldPIZezWdtCbcPFUW7veB4ybRZJ05K/mBj0r1GGCbssxggTWs
	lA2Xwk0f3AmxX+Q2xa+p3hwGaZu5+6pgSqF1lG6SsIDP5nqFdgCHTRtW7D5josnFDK2E=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.56958.383583.53595@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 13:15:42 +0000
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Wei Liu <wl@xen.org>,
    Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
    =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally
In-Reply-To: <CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
	<20210325172132.14980-1-andrew.cooper3@citrix.com>
	<24669.52641.499147.88002@mariner.uk.xensource.com>
	<24669.54213.173154.400771@mariner.uk.xensource.com>
	<CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Tamas K Lengyel writes ("Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally"):
> The problem from my perspective is that the end-users have no way to
> determine when that boot option is needing to be set. Having an
> installation step of "check if things explode when you reboot" is just
> plain bad. Many times you don't even have access to a remote serial
> console to check why Xen didn't boot. So that's not a realistic route
> that can be taken. If Jan's patch is applied then the only thing I'll
> be able to do is make all installations always-enable this option even
> on systems that would have booted fine otherwise without it. It is
> unclear if that has any downsides of its own and could very well just
> kick the can down the road and lead to other issues.

Thanks for the clear explanation.

I think our options are:

 1. What is currently in xen.git#staging-4.15: some different set of
    machines do not work (reliably? at all?), constituting a
    regression on older hardware.

 2. Jan's patch, with the consequences you describe.  Constituing a
    continued failure to properly support the newer hardware.

 3. Andy's patches which are not finished yet and are therefore high
    risk.  Ie, delay the release.

Please let me know if you think this characterisation of the situation
is inaccurate or misleading.

This is not a good set of options.

Of them, I still think I would choose (2).  But I would love it if
someone were to come up with a better suggestion (perhaps a variant on
one of the above).

Ian.

