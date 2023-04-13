Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D8A6E17D3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 01:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520985.809199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn5wd-0006Hi-FV; Thu, 13 Apr 2023 23:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520985.809199; Thu, 13 Apr 2023 23:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn5wd-0006G1-CO; Thu, 13 Apr 2023 23:01:35 +0000
Received: by outflank-mailman (input) for mailman id 520985;
 Thu, 13 Apr 2023 23:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pvsx=AE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pn5wb-0006Fv-W4
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 23:01:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 208ff823-da4f-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 01:01:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5C5863341;
 Thu, 13 Apr 2023 23:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13AFC433EF;
 Thu, 13 Apr 2023 23:01:27 +0000 (UTC)
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
X-Inumbo-ID: 208ff823-da4f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681426889;
	bh=HkfMfx/YlMGO+2U+jZmIS1g1NsyaL0g6VbZzS6yZE1I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V4hEkSmqMgJiHk18bhxF4FAXOuzAkGR1+sp1kueeZJLrC0/JkH9ZniLuj4aQBlCF/
	 tde5AVOVrgEIpTKizMg0v49bbTB0PYeoi7rIiyYbY77lJ2CUuIGxr1Lm81y6NYiVix
	 hNF7cyRF5FuMgPKSxIq5rYinBzTjQNU6oRI8kj8c+3dmNHchnPL5ZDUZ1hu44lIYaL
	 ZcSZ8QjhrziEAh2UlLTp0XsMlxcjx4IQGTYz+/zLNyE66+WY7Mc+S/jKjDWz6xMS+x
	 6xxRdQt33Mma7rs2P3QsSLeSe/CtIBgRX9ztcz41pUwCpwIz8PuyKZmDyb8H+aVgmg
	 zzclo+F+UCD1g==
Date: Thu, 13 Apr 2023 16:01:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: Fold exit paths in find_text_region()
In-Reply-To: <dcdc1e90-77f0-16d2-e83a-dc9c12158975@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2304131514430.15580@ubuntu-linux-20-04-desktop>
References: <20230413192201.3255984-1-andrew.cooper3@citrix.com> <bd8f0ed2-586f-02f6-1f16-dc3b3b9c82a8@xen.org> <dcdc1e90-77f0-16d2-e83a-dc9c12158975@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-616007622-1681424106=:15580"
Content-ID: <alpine.DEB.2.22.394.2304131515550.15580@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-616007622-1681424106=:15580
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304131515551.15580@ubuntu-linux-20-04-desktop>

On Thu, 13 Apr 2023, Andrew Cooper wrote:
> On 13/04/2023 9:13 pm, Julien Grall wrote:
> >
> > On 13/04/2023 20:22, Andrew Cooper wrote:
> >> Despite rcu_read_unlock() being fully inlineable, the optimiser
> >> cannot fold
> >> these exit paths, because of the various compiler barriers providing RCU
> >> safety.  Help the compiler out.
> >
> > Please mention which compiler(s) (including version) you used.
> >
> >>
> >> This compiles to marginally better code in all cases.
> > So the code itself is fine with me. But this raises a few questions.
> > If this is marginal, then why are you doing it? What's your end goal?
> 
> I happened to be working in the area while fixing a bug.  But am not
> justifying "because I judged it to be worth doing" further; it is
> entirely self evident from the fact I sent the patch.
> 
> Whether you meant it to be or not, the request comes across as
> insulting, and is not something which should be made of any submitter.
> 
> But as this kind of thing has come up before, any further debate on the
> matter can be made to the code of conduct board.
> 
> A better phrasing might have been "I'm sorry, I don't understand.  Why
> is this an improvement?"  But I'm only guessing as to what this issue is.

Hi Andrew,

I don't think Julien's comment was insulting. You probably thought this
was a two steps process:
step1: Why?
step2: Gotcha! NACK!

But Julien's question should be taken at face value. Julien even wrote
that he thinks the code is OK. "Why is this an improvement?" is a nicer
way to phrase it but both are OK in my view.


When we make code improvements (not bug fixes or new features) and the
improvement is marginal, I think it is an OK question to ask why you
thought it was worth doing.

For instance, could it be that there are other additional benefits that
you didn't write down in the commit message? Such as, is the code more
readable, easier to maintain, more resilient to attacks?

It is also OK if it is only a marginal improvement but in any case "why
are you doing it" should be or be seen as a challenge.


> But moving to the technicals aspects, in an attempt to help this along.
> 
> Do you understand what folding the exit paths means?  It's a term which
> is used frequently enough on list that it ought to be taken for granted,
> and is what in my opinion makes the patch entirely self-evident.
> 
> > Lastly what do you mean by "all cases"? Is it all arch? All compilers?
> 
> Yes.
> 
> >
> > Anyway, if this pattern is important (TBD why), then I think we should
> > update the CODING_STYLE with some guidance. Otherwise, we may
> > introduce similar patterns (we already have some).
> 
> Perhaps, but I don't have the time, energy, or willing to dive into the
> viper pit which is trying to make any changes to that document at all. 
> Especially when there's a laundry list of more important topics that
> ought to take priority...

Also here, I don't think Julien meant to put one more
potentially-blocking obstacle in your path to upstreaming the
improvement.

If folding the exit paths is an important pattern it is a good idea to
make it a recommended guideline project-wide under CODING_STYLE. It
makes your idea more generally applicable.

Otherwise we end up with, let's say, xen/arch/x86 with good exit paths
and xen/arch/arm with bad exit paths.
 
It should not be taboo to update CODING_STYLE. In the past it was
difficult, but now we have a process in place. Specifically, I am happy
to add it to the agenda for the next MISRA C meeting, where we can make
a snap decision on this guideline in few minutes. 

Once it is in CODING_STYLE, you won't have to discuss on the mailing
list why you are doing this sort of things anymore, and you can follow
up with dozen of patches improving exit paths everywhere.

I don't think you need to wait for the next MISRA C meeting (or other
calls) before following up on this one patch, but suggesting an update
of CODING_STYLE I think it is positive.
--8323329-616007622-1681424106=:15580--

