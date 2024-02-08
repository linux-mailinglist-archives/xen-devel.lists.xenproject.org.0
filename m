Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C64884DB18
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 09:10:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678031.1055053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXzTy-0006Is-0t; Thu, 08 Feb 2024 08:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678031.1055053; Thu, 08 Feb 2024 08:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXzTx-0006F2-U9; Thu, 08 Feb 2024 08:10:05 +0000
Received: by outflank-mailman (input) for mailman id 678031;
 Thu, 08 Feb 2024 08:10:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCg7=JR=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXzTx-0005lh-89
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 08:10:05 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74e6fe78-c659-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 09:10:01 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-511717231bfso90488e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 00:10:01 -0800 (PST)
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
X-Inumbo-ID: 74e6fe78-c659-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707379800; x=1707984600; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dikZXvOrvcq8ZB5trjy0EP7GCY4EkWanEfHrJyxj5gc=;
        b=bW3SDMRS8wTZHoK8ZHAFXBAForZ/FYwAHVJv3Yo78FN02ioqg2PjlJMKhf3ouYjspa
         iZnNtrKurUn6T+srKVuKEea1pnS0+sQ/2XxZpUDnilyBjiZB0r+G7HB/J0s8ABXUZES5
         bqmp76CwsgUQ0TbFyVwK18BR1VUpZBCHlGRsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707379800; x=1707984600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dikZXvOrvcq8ZB5trjy0EP7GCY4EkWanEfHrJyxj5gc=;
        b=QCeZmUo2KqPnEILhrOBUF0X0VjxNl1Tb6JYMqHsuG8UkJTzjn0o+Mue0UmuBKG68Q6
         cO99TA89bFf52xv3g+xk/4fyRDQJDldU7XImFceecWfcAI118OfoV9ZkGSnh6Gls+1Gj
         6xP2eZZCQ3EzolUQe+ZwvZJxBh4qXqdA19z92/CJLRG752GoXtglLOkHP3q1KHQy5QsH
         nqPtWzRX2Iio7siGW3W1StPJu4bTKpGFNPm9ciFerIA/u9QIRG2dZDoXvW1EJyfUjodY
         2WEd841nr7vhKd5fb/R6oDf1Ipxh0+eFtnIWk8KQHkuBJAHsBTcYW2M0LJ8DZATijVat
         GKqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyqH+/v8CsIw9ImfG/eviK9XCWpFrphpK5ill2FtZ4VkwPzbCF1JsgKDr93SYV0+KvkZ7YwgwER1iKSRnQg46FmMWZumS5hsxU7Izc7Z0=
X-Gm-Message-State: AOJu0YxG3dSUmPcTZqISeldpRwQ7/t+tZMWDs4fuClq4uN0LBJmlPOB2
	MfjIgBVl8ODqWa0WdBfV2H77dW8qEB9MxjCrXSlEYvvw7T6XNdIQLp37O7mWcG7FGNbj0IHTeYv
	SHRc88ArdFvojwF7Swh2JyzkLCCTeMP8C5vZV5g==
X-Google-Smtp-Source: AGHT+IHdtj7v3m80PJGjkqfdPRAXnXTQs85KLSz21ZfIeyG0K5G3j+0dj+4ruYiBRV1Wen9Nij2Ps/d7gL/Vsu8N7i4=
X-Received: by 2002:a05:6512:b88:b0:511:54ab:9bed with SMTP id
 b8-20020a0565120b8800b0051154ab9bedmr6838357lfv.2.1707379800584; Thu, 08 Feb
 2024 00:10:00 -0800 (PST)
MIME-Version: 1.0
References: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com>
 <8d5df1f4-74ca-27cc-99f0-7e7a82050de1@suse.com> <CAFLBxZbO2-f3rdgVhu2j_7sRWSeL5oMZt6pit=6nRvhPn=pqoQ@mail.gmail.com>
 <bb2533df-dbb6-4836-bfe9-3611cd11b7f9@suse.com>
In-Reply-To: <bb2533df-dbb6-4836-bfe9-3611cd11b7f9@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 8 Feb 2024 08:09:49 +0000
Message-ID: <CA+zSX=ZPq+AXjUqytiOCwzfBc3xYF1GfTc4hELHz0oPagZsurw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86/p2m: make p2m_get_page_from_gfn() handle grant
 case correctly
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <dunlapg@umich.edu>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 4:02=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.02.2024 07:32, George Dunlap wrote:
> > On Thu, Jun 23, 2022 at 7:54=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >
> >> Grant P2M entries, which are covered by p2m_is_any_ram(), wouldn't pas=
s
> >> the get_page() unless the grant was a local one. These need to take th=
e
> >> same path as foreign entries. Just the assertion there is not valid fo=
r
> >> local grants, and hence it triggering needs to be avoided.
> >>
> >
> > I think I'd say:
> >
> > ---
> > The 'fast' path of p2m_get_page_from_gfn handles three cases: normal ra=
m,
> > foreign p2m entries, and grant map entries.  For normal ram and grant t=
able
> > entries, get_page() is called, but for foreign entries,
> > page_get_owner_and_reference() is called, since the current domain is
> > expected not to be the owner.
> >
> > Unfortunately, grant maps are *also* generally expected to be owned by
> > foreign domains; so this function will fail for any p2m entry containin=
g a
> > grant map that doesn't happen to be local.
> >
> > Have grant maps take the same path as foreign entries.  Since grants ma=
y
> > actually be either foreign or local, adjust the assertion to allow for =
this.
> > ---
>
> Sure, thanks, I can use this, but then I'd perhaps ought to add your
> S-o-b instead of ...
<snip>
> ... R-b, requiring yet someone else's ack?

Legally I think the SoB is more for the provenance of the code than
the commit messages; so it would mainly be to credit me, which I'm not
particularly fussed by.

That said, we did just put something in MAINTAINERS about how to deal
with this situation; You sending the patch implicitly approves all the
changes I made, so then if I give an R-b, that approves all the
changes you made, satisfying the requirements.

 -George

