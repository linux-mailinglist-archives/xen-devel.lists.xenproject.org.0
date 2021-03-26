Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FAC34A73D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 13:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101774.194858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlbI-0007GR-Bq; Fri, 26 Mar 2021 12:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101774.194858; Fri, 26 Mar 2021 12:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlbI-0007F2-8G; Fri, 26 Mar 2021 12:30:04 +0000
Received: by outflank-mailman (input) for mailman id 101774;
 Fri, 26 Mar 2021 12:30:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlbG-00075t-QV
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:30:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlbG-0006Zs-L9
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:30:02 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlbG-0002mr-Hw
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:30:02 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPlbB-0002U7-BL; Fri, 26 Mar 2021 12:29:57 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=kuqU7UGFtqlF21kRS5Le7NiFuiCjs3/tyZNP8WZKr8M=; b=gTLZKUSjx5lZFpM0Cz+Px4nJu/
	L4meU61Gr/bkcxJnr21SayVXmBDYEzotlEkfYv3zuEoRTLssflazezO7JhwHim4T6ZBa0UoISpMvJ
	2u7Ep8TmvVjc87RkaVa2pILYD9D86CwNvcVKEhkmI7pQWNK4OH+ZSCCprjwgGg/BKhIk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.54213.173154.400771@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 12:29:57 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Wei Liu <wl@xen.org>,
    Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
    =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally
In-Reply-To: <24669.52641.499147.88002@mariner.uk.xensource.com>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
	<20210325172132.14980-1-andrew.cooper3@citrix.com>
	<24669.52641.499147.88002@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I wrote:
> I'm sorry, but I think it is too late for 4.15 to do this.  I prefer
> Jan's patch which I have alread release-acked.
> 
> Can someone qualified please provide a maintainer review for this,
> ideally today ?

I asked Andrew on IRC:

12:08 <Diziet> andyhhp__: Are you prepared to maintainer-ack Jan's
               more-minimal hpet workaround approach ?
12:16 <andyhhp__> Diziet: honestly, no.  I don't consider that
                  acceptable behaviour, and it is a fairly big "f you"
                  (this was literally feedback I got in private) to
                  the downstreams who've spent years trying to get us
                  to fix this bug, and have now backported the first
                  version.
12:16 <andyhhp__> I'm looking into the feedback on my series
12:17 <andyhhp__> one way or another, the moment we enter the fallback
                  path for interrupt routing, something is very broken
                  on the system
12:19 <andyhhp__> so the tradeoff is an unspecified bug on one ancient
                  laptop which can't be tested now, vs 5 years of Atom
                  CPUs, 2 years of latop CPUs, and the forthcoming
                  Server line of Intel CPUs
12:19 <andyhhp__> or whatever other compromise we can work on

I'm sorry that this bug is going to continue to be not properly fixed.
As I understand it the practical impact is that users of those
affected systems (the newer ones you mention) will have to add a
command-line option.  That is, unfortunately, the downside of
time-based releases.  If we had been having this conversation two
weeks ago I would have very likely had a different answer.

I consider the current situation in xen.git#staging-4.15 a blocker for
the release and I want to get the code finalised.  I hope that
Monday's RC will be the last RC and that after that there will be only
docs changes.  That would mean committing a workaround today.

Roger, would you be able to give me a maintainer review of Jan's

 [PATCH][4.15] x86/HPET: don't enable legacy replacement mode unconditionally

?

Andrew, I don't think you have, so far, Nak'd Jan's patch.  If you
feel it warrants your Nak please provide it ASAP.

Thanks,
Ian.

