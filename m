Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A541434AD30
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 18:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101980.195398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPq2D-0002SL-KU; Fri, 26 Mar 2021 17:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101980.195398; Fri, 26 Mar 2021 17:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPq2D-0002Rw-H0; Fri, 26 Mar 2021 17:14:09 +0000
Received: by outflank-mailman (input) for mailman id 101980;
 Fri, 26 Mar 2021 17:14:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPq2B-0002Rr-Kw
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 17:14:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPq2B-0003b3-K9
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 17:14:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPq2B-0005Z8-J9
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 17:14:07 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPq24-0003Lw-PL; Fri, 26 Mar 2021 17:14:00 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=FQ3n/idf9678ZfMo7cb8o1lIQwR61G2ESmgMNQoGgE0=; b=U/46LEto1QaLeC6IutKJS5pTl3
	9dKB6FrUH4gfpyEn2oJuNC9zmjBPzHqRtnkwkitND8nVoqTdXUm1GDveYaUq7ueaQ8tCbwPwCZ/nW
	6r3gOwmqI2UllyGY2LWUAg/xrWXKi9gOJBUDDYzYKaNXZM+TovallZaqO3uTGkLUY2b4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24670.5720.581893.435175@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 17:14:00 +0000
To: committers@xenproject.org,
    community.manager@xenproject.org
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
    =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>
Subject: x86/hpet: Don't enable legacy replacement mode unconditionally
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally"):
> Andrew Cooper writes ("[PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally"):
> > In addition, introduce a "hpet" command line option so this heuristic
> > can be overridden.  Since it makes little sense to introduce just
> > "hpet=legacy-replacement", also allow for a boolean argument as well as
> > "broadcast" to replace the separate "hpetbroadcast" option.
> 
> I'm sorry, but I think it is too late for 4.15 to do this.  I prefer
> Jan's patch which I have alread release-acked.

I think I have been perhaps insufficient clear.  Following discussions
earlier in the week, I made that fairly definitive statement this
morning.  There has been various discussion but I restated my postion
at 14:07 UTC today:

| I think the appropriate course, therefore, is the conditional (based
| on commaned line) revert proposed by Jan.

So to be 100% clear, this currently-still-being developed series is

Release-Nacked-by: Ian Jackson <iwj@xenproject.org>


I have reviewed the more minimal patch provided by Jan.  I am
satisfied that it is correct.  I have reviewed the checkin policy in
MAINTAINERS.  Jan is a maintainer of this code, but a second approval
is also required.  Roger has provided a review and in any case I think
my approval may also be sufficient (either due R-B implying a REST
A-B, or due to it being a R-B by "anyone of suitable stature in the
community").

The policy says that:
  Sufficient time must have been given for anyone to respond
  There must be no "open" objections.

I think under the circumstances that these have been met.  At 12:59
UTC today I wrote:

| Andrew, I don't think you have, so far, Nak'd Jan's patch.  If you
| feel it warrants your Nak please provide it ASAP.

Andrew has not, in response to that specific invitation, nacked Jan's
patch.


Roger wrote:

> I would like to avoid such RB being seen as me deciding on which
> option is best release wise.

Indeed.  Thank you for being clear, Roger.

I think that this decision falls to me as Release Manaager.  I have
considered the question, taken input, and decided to take the more
minimal change.


Therefore I have just now pushed the more minimal command-line based
conditional disablement (to both staging and staging-4.15).  I would
like to see the more comprehensive and better fixes in xen-next, but
ideally to be committed there only after 4.15 is released, in case we
need to rework this area again as part of the release.

This is not necessarily the end of the conversation.  If the
Committers feel that my decision as Release Manager is wrong, I think
it is open to the Committers to overrule me, via a vote.


Ian.
current Xen Project Release Manager

