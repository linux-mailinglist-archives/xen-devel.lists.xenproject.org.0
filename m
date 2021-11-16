Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F0451F9C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 01:41:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226055.390543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmmXe-0000uv-IT; Tue, 16 Nov 2021 00:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226055.390543; Tue, 16 Nov 2021 00:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmmXe-0000rv-FM; Tue, 16 Nov 2021 00:41:42 +0000
Received: by outflank-mailman (input) for mailman id 226055;
 Tue, 16 Nov 2021 00:41:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMVQ=QD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mmmXc-0000Wv-Te
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 00:41:40 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f590bb4f-4675-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 01:41:39 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 545B0619EA;
 Tue, 16 Nov 2021 00:41:38 +0000 (UTC)
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
X-Inumbo-ID: f590bb4f-4675-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637023298;
	bh=C3upJzX6Q1e3zMPk2YW2dIezpZ0wVVheV1q1lvp+Y+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BugDHag3koAFCi310v7EWwt7m8oBhxTiZ68L4Teay6eHqdSwDdTo2LjnMQdMT7qfO
	 6+6IqX68DHWJLpdcj+zl3OY1Sc+KV5UXApjRxYlURkdfz6sAJc4rZAwgT0y0V8UeuK
	 1y+iPRM2f7OsZ0xEAt/eYPP9/8UbW3UoHxToV+o+r4z5gwVvX4tvlrSA7P6tJiqIIn
	 JsQ209JKiew/xu+VX+kjee3Y45KNcW9L949AJVDQT0f1TkhhkEJvnKylm5IOxOswco
	 OKd6zvPVsguKZ04OsBz0h+FslLBGXHQCpR31rAaszEzlY6HxViGklY98Ob2dQq1Dqu
	 teShnnVkguFEw==
Date: Mon, 15 Nov 2021 16:41:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
In-Reply-To: <fc9fd8d6-7461-367c-01c6-f4c852e13f54@suse.com>
Message-ID: <alpine.DEB.2.22.394.2111151637330.1412361@ubuntu-linux-20-04-desktop>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com> <20211111175740.23480-2-andrew.cooper3@citrix.com> <D0965ED8-C1FE-473F-91C7-3EE18ABAB3C4@arm.com> <a1b2aa1b-7d8a-4ab6-cde5-25581ee9841c@suse.com> <C3FB48C2-F619-48A2-9268-F0938405133C@arm.com>
 <fc9fd8d6-7461-367c-01c6-f4c852e13f54@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Nov 2021, Jan Beulich wrote:
> On 15.11.2021 11:23, Bertrand Marquis wrote:
> > Hi Jan,
> > 
> >> On 15 Nov 2021, at 10:20, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 15.11.2021 11:13, Bertrand Marquis wrote:
> >>>> On 11 Nov 2021, at 17:57, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>>> --- a/xen/common/domain.c
> >>>> +++ b/xen/common/domain.c
> >>>> @@ -1234,15 +1234,18 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
> >>>>    return 0;
> >>>> }
> >>>>
> >>>> -static void do_domain_pause(struct domain *d,
> >>>> -                            void (*sleep_fn)(struct vcpu *v))
> >>>> +static void _domain_pause(struct domain *d, bool sync /* or nosync */)
> >>>
> >>> Here you use comments inside the function definition.
> >>> I think this is something that should be avoided and in this specific case a
> >>> boolean sync is clear enough not to need to explain that false is nosing.
> >>
> >> While I agree the comment here isn't overly useful, I think ...
> >>
> >>>> @@ -1250,12 +1253,12 @@ static void do_domain_pause(struct domain *d,
> >>>> void domain_pause(struct domain *d)
> >>>> {
> >>>>    ASSERT(d != current->domain);
> >>>> -    do_domain_pause(d, vcpu_sleep_sync);
> >>>> +    _domain_pause(d, true /* sync */);
> >>> Same here.
> >>
> >> ... comments like this one are pretty useful to disambiguate the plain
> >> "true" or "false" (without the reader needing to go look at the function
> >> declaration or definition).
> > 
> > I agree with that but the comment here is useful, it could be added before
> > the call instead of inside it.
> 
> Except the form Andrew has used is the one we've been using elsewhere
> for some time.

Bertrand's comment about MISRA aside, this style of comments doesn't
seem to be covered/allowed by our current CODING_STYLE. It would be good
to keep the CODING_STYLE document up to date: not only it helps us
during reviews, it also helps contributors making sure they don't
violate our guidelines. Moreover CODING_STYLE will certainly turn out
useful when we are going to have MISRA discussion so that we can have an
up-to-date reference of what we currently do and support.

