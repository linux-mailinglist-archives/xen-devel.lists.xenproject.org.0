Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9338A2B0130
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 09:27:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25530.53343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd7wH-0007Cm-Dz; Thu, 12 Nov 2020 08:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25530.53343; Thu, 12 Nov 2020 08:26:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd7wH-0007CQ-Ac; Thu, 12 Nov 2020 08:26:41 +0000
Received: by outflank-mailman (input) for mailman id 25530;
 Thu, 12 Nov 2020 08:26:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYe4=ES=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
 id 1kd7wG-0007CK-7t
 for xen-devel@lists.xen.org; Thu, 12 Nov 2020 08:26:40 +0000
Received: from mail-vs1-xe2e.google.com (unknown [2607:f8b0:4864:20::e2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca3e4887-efc0-4377-8209-46c2b5ed791b;
 Thu, 12 Nov 2020 08:26:39 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id t8so2767880vsr.2
 for <xen-devel@lists.xen.org>; Thu, 12 Nov 2020 00:26:39 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=AYe4=ES=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
	id 1kd7wG-0007CK-7t
	for xen-devel@lists.xen.org; Thu, 12 Nov 2020 08:26:40 +0000
X-Inumbo-ID: ca3e4887-efc0-4377-8209-46c2b5ed791b
Received: from mail-vs1-xe2e.google.com (unknown [2607:f8b0:4864:20::e2e])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ca3e4887-efc0-4377-8209-46c2b5ed791b;
	Thu, 12 Nov 2020 08:26:39 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id t8so2767880vsr.2
        for <xen-devel@lists.xen.org>; Thu, 12 Nov 2020 00:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=KxYhA8URFOUVcC0n9xmCpT8QbAW4X/j6MTL50w9Xv+Y=;
        b=JyazXarXJkKXpgjS4XKdjHJi3hq/cbDovM1p7LULp/Xl7trXAiqDBEHiCRaF+5R9QH
         K+BLQ+LvljnFxFbho8s0NqBsGIZS4aCq0vjSJsqyvkiycRqdXmV1MrNWxUmjb8jMe+Hb
         FDIVoRxI1GgljYxcPAHD3d9uaIu8uqC6EAC/ncerHoSBsC6CmUfgLVtiGbvWzGQ2chtP
         v/S037TMDRUBvDnhVSyhby6aq+ZzA3nwaM57nyKXo6EVihAvz5EkZVAOW6lsbGeH9+uZ
         OCp4ocGP20R148Z/1n7HKy2UJQPtjYN8lAAJz9+zuA9Yk08BY1uwGa+yIhw/1q8RIAhq
         UC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=KxYhA8URFOUVcC0n9xmCpT8QbAW4X/j6MTL50w9Xv+Y=;
        b=KMt9abQCb1XDXJRxFCZoZR94ZnFe18TPmFc0ylILfzOXlmFWanXrJzjAsl7Fa5lgul
         o3hZWzo6rt2rGV9wC9309Q/67ht6iIC4dpKeCgKqUByyi+pajtNfIl2bLNHscdKi0Usq
         jMrp23QtKvagrH1Tu48zaFvgmeaqs6wjVAIf6feVGkIwEeLRTgTlHa0COWEaSnkRim6/
         AMvdd7H39rXAfCOVVInYBtmLrvQFyQru393vYjpCOOug1eVxhP5ARiVFg6cUyRlr3YEP
         XBWHXTwociMTejXqS6vv6uo4yHYtrdDPvIx791d9FdVqZ9eBTiRMIVLOi+hULJWf5LN3
         IuQQ==
X-Gm-Message-State: AOAM530Q//dHNPVwcOah0HoZT2qcyZzNB7zq/3zBtCXq1/9XfwxuqjEz
	IK1kcRB2KbO7zttFuIVM0LyXkNQZmSANbhdWoGoN9KGksh+J+g==
X-Google-Smtp-Source: ABdhPJzQE3tiJQZNmAjPnQ1wb6Lraey1Do5/fs85bFNEmek/z6CTzHURxnPJveTvm6etSr1EU8zVxPqUtPv+qFdGFkw=
X-Received: by 2002:a67:ff10:: with SMTP id v16mr17617590vsp.40.1605169598624;
 Thu, 12 Nov 2020 00:26:38 -0800 (PST)
MIME-Version: 1.0
References: <CACJ1ZNuJCgDkRHvH2gXqC5gWTJHdUQ9J4G-HBNFwKYZFaWpWuw@mail.gmail.com>
In-Reply-To: <CACJ1ZNuJCgDkRHvH2gXqC5gWTJHdUQ9J4G-HBNFwKYZFaWpWuw@mail.gmail.com>
From: Olivier Lambert <lambert.olivier@gmail.com>
Date: Thu, 12 Nov 2020 09:26:27 +0100
Message-ID: <CACJ1ZNupvRX_fcGPWn3mm+3Lm4gT38M088tUc_sSUu8JeQg3Fg@mail.gmail.com>
Subject: Re: Schedule for OpenPOWER/Xen meeting
To: "<xen-devel@lists.xen.org>" <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="000000000000baf5ef05b3e4aba9"

--000000000000baf5ef05b3e4aba9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks to everyone who participated in the poll. Due to the limited number
of answers, I think it's wiser to go for the second option (Thursday the
19th), because everyone who already answered seems available that day. I'll
confirm that to OpenPOWER. When it's confirmed, I'll do a recap here
ideally with the meeting place.

Thanks,

Olivier.


Le mar. 10 nov. 2020 =C3=A0 13:41, Olivier Lambert <lambert.olivier@gmail.c=
om> a
=C3=A9crit :

> Hi everyone,
>
> We got 2 potential dates for the initial tech meeting with at least one
> OpenPOWER expert, so we can discuss the effort needed to port Xen on this
> architecture.
>
> Because of time zones (on OpenPower side, there's one guy in Australia),
> we got 2 possible schedules in November:
>
> 1. 3pm CT on this Thursday the 12th (! this week)
> 2. Or next week Thursday the 19th
>
> I made a doodle-like so everyone can vote on their preferred schedule:
> https://framadate.org/QQu5rYEOEYr4ZHc4
>
> Note: 3pm CT would mean 9pm UTC, 10pm UTC+1 (CET). But correct me if I'm
> wrong.
>
> Reminder: the Cryptpad of the last Xen Community meeting contains the lis=
t
> of people interested. If you are aware of someone interested that could
> miss this email on this devel list, feel free to forward it. Cryptpad lin=
k:
> https://cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/
>
> Thank you and see you soon!
>
> Olivier.
>

--000000000000baf5ef05b3e4aba9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks to everyone who participated in the poll. Due =
to the limited number of answers, I think it&#39;s wiser to go for the seco=
nd option (Thursday the 19th), because everyone who already answered seems =
available that day. I&#39;ll confirm that to OpenPOWER. When it&#39;s confi=
rmed, I&#39;ll do a recap here ideally with the meeting place.</div><div><b=
r></div><div>Thanks,</div><div><br></div><div>Olivier.<br></div><br></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=
=A0mar. 10 nov. 2020 =C3=A0=C2=A013:41, Olivier Lambert &lt;<a href=3D"mail=
to:lambert.olivier@gmail.com">lambert.olivier@gmail.com</a>&gt; a =C3=A9cri=
t=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div>Hi everyone,</div><div><br></div><div>We got 2 potential dat=
es for the initial tech meeting with at least one OpenPOWER expert, so we c=
an discuss the effort needed to port Xen on this architecture.</div><div><b=
r></div><div>Because of time zones (on OpenPower side, there&#39;s one guy =
in Australia), we got 2 possible schedules in November:</div><div><br></div=
><div>1. 3pm CT on this Thursday the 12th (! this week)<br></div><div>2. Or=
 next week Thursday the 19th</div><div><br></div><div>I made a doodle-like =
so everyone can vote on their preferred schedule: <a href=3D"https://framad=
ate.org/QQu5rYEOEYr4ZHc4" target=3D"_blank">https://framadate.org/QQu5rYEOE=
Yr4ZHc4</a></div><div><br></div><div>Note: 3pm CT would mean 9pm UTC, 10pm =
UTC+1 (CET). But correct me if I&#39;m wrong.</div><div><br></div><div>Remi=
nder: the Cryptpad of the last Xen Community meeting contains the list of p=
eople interested. If you are aware of someone interested that could miss th=
is email on this devel list, feel free to forward it. Cryptpad link: <a hre=
f=3D"https://cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/" target=
=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/<=
/a></div><div><br></div><div>Thank you and see you soon!</div><div><br></di=
v><div>Olivier.<br></div></div>
</blockquote></div>

--000000000000baf5ef05b3e4aba9--

