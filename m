Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E96A39E2D9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 18:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138091.255714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqHzs-0007Wr-D5; Mon, 07 Jun 2021 16:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138091.255714; Mon, 07 Jun 2021 16:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqHzs-0007U6-9j; Mon, 07 Jun 2021 16:21:04 +0000
Received: by outflank-mailman (input) for mailman id 138091;
 Mon, 07 Jun 2021 16:21:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=esLc=LB=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lqHzq-0007U0-PL
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 16:21:02 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 189ab8c2-3e4d-498f-b838-fa119a9192c0;
 Mon, 07 Jun 2021 16:21:01 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lqHzm-000JhA-4r; Mon, 07 Jun 2021 16:20:58 +0000
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
X-Inumbo-ID: 189ab8c2-3e4d-498f-b838-fa119a9192c0
Date: Mon, 7 Jun 2021 17:20:58 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roberto Bagnara <roberto.bagnara@bugseng.com>,
	xen-devel@lists.xenproject.org
Subject: Re: Invalid _Static_assert expanded from HASH_CALLBACKS_CHECK
Message-ID: <YL5Hah0rmLMpG/rs@deinos.phlegethon.org>
References: <ccb37c2e-a3a6-a2e4-bf15-da81f97c94be@bugseng.com>
 <38898d21-fe76-36dc-f1e6-497b52c5c0b7@suse.com>
 <YLEP73On6EBjv3Ks@deinos.phlegethon.org>
 <11b5b29e-0baf-9f50-6d9e-985e791148b2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <11b5b29e-0baf-9f50-6d9e-985e791148b2@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

Hi,

At 08:45 +0200 on 31 May (1622450756), Jan Beulich wrote:
> On 28.05.2021 17:44, Tim Deegan wrote:
> > Hi,
> > 
> > At 10:58 +0200 on 25 May (1621940330), Jan Beulich wrote:
> >> On 24.05.2021 06:29, Roberto Bagnara wrote:
> >>> I stumbled upon parsing errors due to invalid uses of
> >>> _Static_assert expanded from HASH_CALLBACKS_CHECK where
> >>> the tested expression is not constant, as mandated by
> >>> the C standard.
> >>>
> >>> Judging from the following comment, there is partial awareness
> >>> of the fact this is an issue:
> >>>
> >>> #ifndef __clang__ /* At least some versions dislike some of the uses. */
> >>> #define HASH_CALLBACKS_CHECK(mask) \
> >>>      BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
> >>>
> >>> Indeed, this is not a fault of Clang: the point is that some
> >>> of the expansions of this macro are not C.  Moreover,
> >>> the fact that GCC sometimes accepts them is not
> >>> something we can rely upon:
> > 
> > Well, that is unfortunate - especially since the older ad-hoc
> > compile-time assertion macros handled this kind of thing pretty well.
> > Why when I were a lad &c &c. :)
> 
> So I have to admit I don't understand: The commit introducing
> HASH_CALLBACKS_CHECK() (90629587e16e "x86/shadow: replace stale
> literal numbers in hash_{vcpu,domain}_foreach()") did not replace
> any prior compile-time checking. Hence I wonder what you're
> referring to (and hence what alternative ways of dealing with the
> situation there might be that I'm presently not seeing).

Sorry, I wasn't clear.  Before there was compiler support for
compile-time assertions, people used horrible macros that expanded to
things like int x[(p)?0:-1].  (I don't remember which exact flavour we
had in Xen.)  Those worked fine with static consts because the
predicates only had to be compile-time constant in practice, but now
they have to be constant in principle too.

So I don't think there was a better way of adding these assertions in
90629587e16e, I'm just generally grumbling that the official
compile-time assertions are not quite as useful as the hacks they
replaced.

And I am definitely *not* suggesting that we go back to those kind of
hacks just to get around the compiler's insistence on the letter of
the law. :)

Cheers,

Tim.

