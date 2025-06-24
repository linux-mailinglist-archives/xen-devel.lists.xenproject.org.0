Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57FEAE6AFE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 17:29:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023876.1399951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5ac-0003mI-V2; Tue, 24 Jun 2025 15:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023876.1399951; Tue, 24 Jun 2025 15:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5ac-0003jE-Pj; Tue, 24 Jun 2025 15:29:38 +0000
Received: by outflank-mailman (input) for mailman id 1023876;
 Tue, 24 Jun 2025 15:29:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yl0=ZH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1uU5ab-0003j8-BY
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 15:29:37 +0000
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [2607:f8b0:4864:20::932])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 081c4e09-5110-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 17:29:35 +0200 (CEST)
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-87edd8f4e9fso158126241.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 08:29:35 -0700 (PDT)
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
X-Inumbo-ID: 081c4e09-5110-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750778974; x=1751383774; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5CUv+qZ7XYmxSv8jilZY9A4Naqfa47fR+1/XJ1ZKe8=;
        b=PpXkIGFYTapV35pCVbs92GgCdTMRbXQshzyCq7oWmo4GkzAjRsHS6Pi36Bqy00IXrv
         FXYzhsZfx+QbHig8cHEm+oEXLEfT2k23F0epbfTVdkgS3pJix8faYhkG9Yy57Z1C7xIX
         ss7/XBkuweOW+k07jtJfU8pELYQt5SNGKJqwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778974; x=1751383774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5CUv+qZ7XYmxSv8jilZY9A4Naqfa47fR+1/XJ1ZKe8=;
        b=NOiYsR3Xta/cYFs1JHJa0uIR7sE1kuhSjkc9OaB1WNh9OyfTgvViIh7hsZ6RyDPGMM
         fTQdnwpWeI+I8UUC8gI3GNAI//z27QCBA7vK9G0wntDMMFZLaecmLbGxw/afXuBviunZ
         5QyLGEWE1qELtd0Od6dCKXop+QT+kA+19A4EfJx+HG1nres2QyHozDV+Z6DYFeEK0dCN
         UqCejLdn6SaiiTa/JA9NHF5tf1U3ejkf6kp/8Kz0XS+zUQ1maBD9/zs1wZ/kObZO3KBL
         vSxXG3TV0D4xM/hpPHvw75/9gbAsMM/WmAsFlRdXGCKuGDGm1Shczb6Abf4U7iwktxvN
         3afA==
X-Forwarded-Encrypted: i=1; AJvYcCXSinpjRM0PMI8eeFi0Wgnitf7tmGmkW0iaHaaTpsVTrbiJMJVWZ49XvYpF6kHqkfwg2BduLmi4Osg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAhQMelC36NBMxIQTQ2r9rJGmdauJbmZ4jVQ7gVRR6zxUhKvvL
	jOOxIG9JQiWvz/fvtgIeSWFKMtBOP4yI8QptmQ5zNUxNLU9yrz8auHg6mmHuPw62pxwXb1Wiqul
	Xi4sLP9oDzhDdkGSzcGvCZeaSVWkzo9AYQipDbd4ZYA==
X-Gm-Gg: ASbGncu1RSwSd8wAUY2ld6ay8h615jhNHF02IMfQhcCy7Ej4oa46/OfsGUpvxEuigyQ
	VTeH1vdYyPdhp+8/zamFsjrKkBXoC4TEd1fqbCcO3ZwbsGokW1i3WFjwGn54pbnOUDEMtrnbuSM
	l0hBobkt7gsv0N9WHz47DO47L3XxgT8VLnv0oZcuaZWnar2w==
X-Google-Smtp-Source: AGHT+IFJQ9gSxKG844xagbwUMVABeOtkjGjq9IfuqRh18kKVFfHuxToqr0nmfzAW97xmU/p3nhqUNRaNF0Yibk3pHTM=
X-Received: by 2002:a05:6122:4145:b0:530:65b3:4920 with SMTP id
 71dfb90a1353d-531ad58aaaamr9591284e0c.5.1750778973875; Tue, 24 Jun 2025
 08:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com> <955F5D37-20D3-4B33-867E-78A0B83A4FB2@cloud.com>
In-Reply-To: <955F5D37-20D3-4B33-867E-78A0B83A4FB2@cloud.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Tue, 24 Jun 2025 16:29:22 +0100
X-Gm-Features: AX0GCFt4uagbeG36GDdVovC6o4Tkl0UZzSUs2zsqnnzveieYN6fgRhu2sgoYZTE
Message-ID: <CAEfZLvmOh8ZX9Bf+UDfNS4FYn5gL-NtEeidQvKK6M3ejJoC0LQ@mail.gmail.com>
Subject: Re: xenstore - Suggestion of batching watch events
To: Christian Lindig <christian.lindig@cloud.com>
Cc: Andriy Sultanov <sultanovandriy@gmail.com>, xen-devel@lists.xenproject.org, 
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, ngoc-tu.dinh@vates.tech, 
	Christian Lindig <christian.lindig@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 4:21=E2=80=AFPM Christian Lindig
<christian.lindig@cloud.com> wrote:
>
> I believe what you observe is a major source of inefficiency for the reas=
on you describe: changes are acted upon too early because there is no way t=
o observe that they are part of a transaction. So now heuristics come in li=
ke waiting for more changes before acting on the ones observed. I wonder ho=
w the tree structure plays into this. Clients watch different sub trees and=
 we don=E2=80=99t exploit this knowledge. I do agree that some protocol or =
syntax to batch updates would be useful.

This is probably where the Irmin-based prototype had an advantage,
pulling batched updates is something that 'git' is good at, and in
many ways Irmin was similar to git.
When I joined XenServer I've been told that all the improvements from
the Irmin prototype got integrated back into the mainline one, but
that clearly isn't true, because:
* the mainline one had a lot of security issues that the Irmin based one di=
dn't
* batching of updates is completely absent

Since this "high-bandwidth" event mechanism is only needed by Dom0 I
think we can avoid sending these using the xenstore PV ring protocol,
and even if we don't use Irmin to implement or send the updates, we
shouldn't be constrained anymore by the 4K limitation of a xenstore
packet on the socket interface in Dom0.

If this is a new kind of API message then clients can opt-in (older
clients who can't cope with such larger responses won't know to make
the new API call either).
That would avoid the problem we had with the directory protocol where
O and C versions assigned different semantics *to the same API call*
(O version used >4k packets, C version failed and only worked with the
PARTIAL protocol). Now we finally have behaviour parity on that, so
any change we make, I suggest we do by introducing a new API call that
doesn't inherit legacy limitations like 4K packets sizes on unix
domain sockets at least.

Best regards,
--Edwin
>
> =E2=80=94 C
>
>
> > On 24 Jun 2025, at 15:51, Andriy Sultanov <sultanovandriy@gmail.com> wr=
ote:
> >
> > Currently, as far as I am aware, the ability of xenstore clients to pro=
perly
> > handle and detect batch updates is somewhat lacking. Transactions are n=
ot
> > directly visible to the clients watching a particular directory - they =
will
> > receive a lot of individual watch_event's once the transaction is commi=
tted,
> > without any indication when such updates are going to end.
> >
> > Clients such as xenopsd from the xapi toolstack are reliant on xenstore=
 to
> > track their managed domains, and a flood of individual updates most oft=
en
> > results in a flood of events raised from xenopsd to xapi (There are
> > consolidation mechanisms implemented there, with updates getting merged
> > together, but if xapi picks up update events from the queue quickly eno=
ugh, it
> > will only get more update events later)
> >
> > The need for batching is fairly evident from the fact that XenServer's =
Windows
> > PV drivers, for example, adopted an ad-hoc "batch" optimization (not do=
cumented
> > anywhere, of course), where some sequence of writes is followed by a wr=
ite of
> > the value "1" to "data/updated". This used to be honoured by xapi, whic=
h would
> > not consider the guest agent update done until it received notice of su=
ch a
> > "batch ended" update, but it caused xapi to miss updates that were not =
followed
> > by such a write, so xapi now ignores this ad-hoc batching. One could im=
agine
> > many workarounds here (for example, some sort of a mechanism where xeno=
psd
> > stalls an update for a second to see if any more related updates show u=
p and
> > only then notifies xapi of it, with obvious trade-offs), but IMO it cou=
ld be
> > worth considering making this easier on the xenstore side for different
> > use-cases.
> >
> > Suggestion:
> > WATCH_EVENT's req_id and tx_id are currently 0. Could it be possible, f=
or
> > example, to modify this such that watch events coming as a result of a
> > transaction commit (a "batch") have tx_id of the corresponding transact=
ion
> > and req_id of, say, 2 if it's the last such watch event of a batch and =
1
> > otherwise? Old clients would still ignore these values, but it would al=
low
> > some others to detect if an update is part of a logical batch that does=
n't end
> > until its last event.
> >
> > Is this beyond the scope of what xenstored wants to do? From a first gl=
ance,
> > this does not seem to introduce obvious unwanted information leaks eith=
er, but
> > I could be wrong. I would love to hear if this is something that could =
be
> > interesting to others and if this could be considered at all.
> >
> > Thank you!
> >
> >
>

