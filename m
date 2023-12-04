Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4A8030ED
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 11:51:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646804.1009365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6Xj-0004Vc-07; Mon, 04 Dec 2023 10:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646804.1009365; Mon, 04 Dec 2023 10:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6Xi-0004TQ-TW; Mon, 04 Dec 2023 10:51:14 +0000
Received: by outflank-mailman (input) for mailman id 646804;
 Mon, 04 Dec 2023 10:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwcF=HP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rA6Xh-0004T0-D6
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 10:51:13 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09ca9f08-9293-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 11:51:11 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50bf898c43cso624501e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 02:51:11 -0800 (PST)
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
X-Inumbo-ID: 09ca9f08-9293-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701687071; x=1702291871; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQfKHH9xUr8JCrXz0Ts9i93STXhIm5hp1tSVgCQAGws=;
        b=GVuYb8RQtAlABI3cMkagOw38R9knBmxPhB5BlaAT4/jSk99ZN0nfceYxGgcn6RSEZl
         WNJYIfG/Jx5ihPnVrAjNWMffj4oq32FQDHVAuC26ApZJtpqx+9swGk9jMQSx6J6yL3ZO
         MPh7k9rbbTGH7hee8ji6ft+qTARmKQyILBv8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701687071; x=1702291871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQfKHH9xUr8JCrXz0Ts9i93STXhIm5hp1tSVgCQAGws=;
        b=XQCSwWhD6e4cU2ODQ625JgyTklkqBRjh7VScPuQ5Xhz3uKfCLZJRUQEZY6gH4x3oCR
         j46SRF+84jobX6jcLbq3b99nl6oyA7ckWEFC/AUva0I9m3zD/Tsx07+XZ4UtaUqpurbV
         zU2tmJcBuv636oRs+1NR0yhS2q2LokHPlQlulv2LbJWho5EoQ/dxvJFz7XCn0WgMYXdu
         fpQTerI+IKxcTWxiWNGUvZMHs2xdMoBIQRqNvNIBOoN+rfLZmjbNuGRX8Yv8ZnS2e7nh
         p4VG1c8cPqL8Bm4SjZ12ETgS/lBswi/ILrpCS7qj2qFf0WYDjOy1RnsHxhbuhrxXEwou
         Hn1A==
X-Gm-Message-State: AOJu0Yxs2W4PeCNpAzaCNYnNX0CFtGjlFjZZPJ3C4ObvHGbpQyla6Zfp
	2O2RqL52uUXuAVz+/IlomlR+h9N8/RKvKXwNw4IqWwywpuZPNIOe
X-Google-Smtp-Source: AGHT+IGYrVbIO6XP3f7valwb25yxyv8aGnRQjCZxkQLWclqLKHQAI6bTlc7ycMHqm7bkRJ+ajlFNKcdoQJx3VKjHiNE=
X-Received: by 2002:a05:6512:6ca:b0:50b:d764:28ec with SMTP id
 u10-20020a05651206ca00b0050bd76428ecmr2401029lff.132.1701687071291; Mon, 04
 Dec 2023 02:51:11 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
 <alpine.DEB.2.22.394.2312011253390.110490@ubuntu-linux-20-04-desktop> <1978d259-1531-4dcc-a106-d87f6f26885d@suse.com>
In-Reply-To: <1978d259-1531-4dcc-a106-d87f6f26885d@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 4 Dec 2023 10:51:00 +0000
Message-ID: <CA+zSX=YNcjDZHF-gx8C8owEpyyjSEtj-MKDAqRwp9woHzEFtUg@mail.gmail.com>
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Kelly Choi <kelly.choi@cloud.com>, 
	xen-devel@lists.xenproject.org, committers@xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 8:16=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
> > I am in favor on moving faster and nitpicking less. Also, Andy put the
> > effort to produce the patch so he should have the default choice in the
> > wording. If the choice is taking the patch as is or rejecting it, I
> > would take it as is.
>
> I'm afraid there's also disagreement about where nitpicking starts. To me
> "broken" in the context here is technically incorrect. Hence asking for
> the wording to be changed wouldn't count as nitpicking to me. When badly
> worded comments of mine are commented upon, I also don't count this as
> nitpicking (there's always a grey area, of course).

Whether something is nitpicking or not is a value judgement; different
people come to different conclusions.  I'm afraid even the argument
about whether "broken" is appropriate to use in this context is a
matter of judgement: there are arguments both ways, and different
people have come to different conclusions.  The problem here is that
some people definitely think "broken" is the wrong word; and others
definitely think "broken" is the right word (some +2 and some -2).

Given that we're always going to have differences of judgement, we
need ways to move forward in spite of that.  Ideally the maintainers
should be implementing things according to the value of the community
as a whole: we should not be quibbling over things that the community
as a whole doesn't want quibbled over.

The basic mechanisms we have, voting (with the ability to appeal to
the committers) is meant to be a quick way to approximate that.  The
assumption is that with 6 active people in the leadership team ("the
committers" at the moment), from different companies and backgrounds,
the chance of a vote of the committers being out of sync with the
community is fairly small.

But of course, small is not impossible.  The list of committers hasn't
changed significantly in a while; it's entirely possible in this sort
of case for the values of committers and the values of the community
as a whole to drift.  How do we determine whether that's the case or
not?  Hence the community-wide survey.

The problem with "nitpicking" goes a bit deeper.  By its nature,
nitpicking doesn't really rise to the level of "something obviously
wrong"; it's more "too much time spent asking for changes to code
which is not obviously wrong".  How much is "too much"?  Again, it's a
value judgment.  If someone is nitpicking your patch, it's not really
that obvious what to do about it -- to ask for a formal vote of the
committers about a tiny change request is just as "nitpicky" or
"petty" as the tiny change request itself; it's not this or that
change which causes the problem with nitpicks, but the cumulative
effect.  How can this be "calibrated", so that we can ensure that
maintainers are just the right level if picky -- neither letting
sloppy / ugly code get checked in, nor wasting people's time and
emotional effort asking for changes which aren't worth the effort?
And how do we give people practical options to respond to a maintainer
who they think is being "picky", such that they can either be
convinced that he code changes are worth asking, or that the
maintainer can stop asking for minor changes that aren't worth the
benefits?

The last one I don't really have an answer for.

 -George

