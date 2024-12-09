Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922789E9913
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 15:36:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851438.1265511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKerL-0002qu-43; Mon, 09 Dec 2024 14:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851438.1265511; Mon, 09 Dec 2024 14:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKerL-0002oU-0X; Mon, 09 Dec 2024 14:35:39 +0000
Received: by outflank-mailman (input) for mailman id 851438;
 Mon, 09 Dec 2024 14:35:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJmG=TC=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1tKerK-0002oO-1C
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 14:35:38 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dad28a21-b63a-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 15:35:37 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d122cf8dd1so7223563a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 06:35:37 -0800 (PST)
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
X-Inumbo-ID: dad28a21-b63a-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733754936; x=1734359736; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MgJHBj8dWe6d+WY6U/eQkzjv4lbdNoswat5wV0xftN0=;
        b=hQVQR/M2tPwiitbeNRG53277fzwoSgOrp8Ry+HNOnbrF29Id0cIFkd17WO/AkZWp6H
         x+oNejMPu50MvSJbTQtFKuvw9h8uqN7xkM9b9EFzZbxAADqZJP99OOdvbC/sFi7ic/6/
         mY67kduXxJHC69VORygS7hNqKNfz61dOLWgAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754936; x=1734359736;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MgJHBj8dWe6d+WY6U/eQkzjv4lbdNoswat5wV0xftN0=;
        b=jox+bzNOzae/M3q7BbbM7iV00gDBJjrwf56MXlLh2gNZoJSfNvrsUWMbhH/+cf2ou6
         FWJZVB1fwfxlOJrZf2ixKykjrUyvvh8LZ7EOPujVfX4zWALm3mFIJduPVR8oUidoVeKl
         lNWiUvqyszyPwT5g3KO2Sf6FggzniHm/EJGxlGs1/k6O4v015kgNJ8DajRrb7AJj2X9A
         wm99ulNln+aO3sen3tmyKTN+kThQcW2l4XH0qQV0TtwLf845NodxRGJEvYhntETX6BGG
         zZS7JSBPYoLmTwyObXorv5YEGCtdEM5mf046JgG0BLIfzqEq5ZAiCY0mWKmGhq5wCWUY
         BU7A==
X-Gm-Message-State: AOJu0YylEIRRZgt6ZhhYQyTMoSWClqXGneaUBVXVSHPEl5Wk9ioTlFtF
	LR1S439jv8HjkjDcVnINEGrzF4SxnNYqWFsA9Cv2rUNaueJsOupewPBruU/0IUAdLlpgB1vdZuR
	Wo2sUhdXhaYwf80nyleC8z0E8Vu5cqcJg8YShC3kW/weRfNn0jhQ=
X-Gm-Gg: ASbGncvxzQi1JbAyPAbqmgW1b5BIx/cVqgWTtNovU86S8y1knrYJy/J6I3jzlGpnQFi
	3pnvEaJaqhcLIC3r3SK3EiC7utxo83nnfWnb82COqXZI4bH23Sz6R99d5s36KzLfTUhgf9w==
X-Google-Smtp-Source: AGHT+IELReHT6avVznhXJY7M6bz6KB4XMluedWzWmHuvu66Hc6YP1D2WPJzf7BLZVas6+sQVY8wO9bkWrOJzfudou3c=
X-Received: by 2002:a05:6402:390a:b0:5d1:43e4:bcaf with SMTP id
 4fb4d7f45d1cf-5d3be4656bemr13941689a12.0.1733754935795; Mon, 09 Dec 2024
 06:35:35 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 9 Dec 2024 14:34:59 +0000
Message-ID: <CAO-mL=xGGvJSyh2u8pv4ORtuB2mkCZzWrJ=02WUnZUsHSX4cPg@mail.gmail.com>
Subject: Welcome Honda to the Xen Project Board
To: xen-devel <xen-devel@lists.xenproject.org>, xen-announce@lists.xenproject.org, 
	"committers @ xenproject . org" <committers@xenproject.org>, 
	Xen Project Advisory Board <advisory-board@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000137f070628d747c8"

--000000000000137f070628d747c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

We're excited to announce our newest Advisory Board Member Honda, to the
Xen Project.

Since its foundation, Honda has been committed to "creating a society that
is useful to people" by utilizing its technologies and ideas. Honda also
focuses on environmental responsiveness and traffic safety, and continue to
take on the challenge of realizing a sustainable future.

I am sure that the community will agree that this is a huge step and
achievement for our open source project. Honda's investment into supporting
Xen means we are expanding our efforts to create a more secure and
versatile hypervisor, with real world applications. Their commitment and
partnership with Xen only increase the capabilities that our virtualization
technology has achieved so far.

With Honda joining, their insights will help us navigate new challenges,
expand our outreach to new contributors and enhance policies surrounding
our community.

Their unique perspective will be invaluable as we tackle goals for the
future, and we=E2=80=99re thrilled to have their voice guiding our strategy=
 and
vision.

Please join us in giving a warm welcome to Honda! We=E2=80=99re eager to se=
e how
their leadership and technical teams will help shape the future of the Xen
Project.

Together, we=E2=80=99ll continue building a strong, inclusive, and innovati=
ve
community.

Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--000000000000137f070628d747c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div><div dir=3D"ltr" cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">=
We&#39;re excited to announce our newest Advisory Board Member Honda, to th=
e Xen Project.<br><br>Since its foundation, Honda has been committed to &qu=
ot;creating a society that is useful to people&quot; by utilizing its techn=
ologies and ideas. Honda also focuses on environmental responsiveness and t=
raffic safety, and continue to take on the challenge of realizing a sustain=
able future.<br><br>I am sure that the community will agree that this is a =
huge step and achievement for our open source project. Honda&#39;s investme=
nt into supporting Xen means we are expanding our efforts to create a more =
secure and versatile hypervisor, with real world applications. Their commit=
ment and partnership with Xen only increase the capabilities that our virtu=
alization technology has achieved so far.<br><br>With Honda joining, their =
insights will help us navigate new challenges, expand our outreach to new c=
ontributors and enhance policies surrounding our community.<br><br>Their un=
ique perspective will be invaluable as we tackle goals for the future, and =
we=E2=80=99re thrilled to have their voice guiding our strategy and vision.=
<br><br>Please join us in giving a warm welcome to Honda! We=E2=80=99re eag=
er to see how their leadership and technical teams will help shape the futu=
re of the Xen Project.=C2=A0</div><div dir=3D"ltr"><br></div><div dir=3D"lt=
r">Together, we=E2=80=99ll continue building a strong, inclusive, and innov=
ative community.<br><div><br></div><div>Kelly Choi<br></div><div><div style=
=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(=
136,136,136)"><a href=3D"https://xenproject.org/" target=3D"_blank">Xen Pro=
ject</a><br></div></div></div></div></div></div>

--000000000000137f070628d747c8--

