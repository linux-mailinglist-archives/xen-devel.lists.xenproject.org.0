Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4C3B42654
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 18:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108735.1458790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utq6F-0000YJ-0i; Wed, 03 Sep 2025 16:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108735.1458790; Wed, 03 Sep 2025 16:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utq6E-0000WK-Tm; Wed, 03 Sep 2025 16:12:42 +0000
Received: by outflank-mailman (input) for mailman id 1108735;
 Wed, 03 Sep 2025 16:12:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1utq6D-0000WE-7k
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 16:12:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1utq6C-004fHW-2r
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 16:12:41 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1utq6D-00EXUO-08
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 16:12:41 +0000
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-54494c3f7e3so32897e0c.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 09:12:41 -0700 (PDT)
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
	d=xenproject.org; s=20200302mail; h=Content-Type:To:Subject:Message-ID:Date:
	From:MIME-Version; bh=3T7ONl120rt7DynkOWZgU7o776H43FGtrof5fUbU7LA=; b=qzByZ+l
	2GDdpm0b+cdsyy7RumekVpg0XDA+vNFkDgnax2g537ZgK9EDBB+xfN58KYY7ykqTTVj2dYzmm+2hU
	fsTJTDBPkAWp0I6/2tn0qmZqT6jmATk/cgxRqATF88MOAkjMetbXGvgebBZgHv2K6XSsaX4gMvwal
	JPhFYFkMvQ=;
X-Gm-Message-State: AOJu0YwSV54FGYL+PHbj1mvdTqausRsKqIv6esuFtgwZpSegyv4+EtR/
	6TcK7sP6OWF/gGQuEP9Ve6nJ6jaPzmfQWJQdQWAIfVD8IjQ9mcBHmjxZQH9tZXrqueiEtdiVlW0
	wGIQP6i/jAFlbODYgzMXLIELqHJVY1aI=
X-Google-Smtp-Source: AGHT+IHCodRux8M1NXNWf8JeRJcZlYsRRpueRkIgXc/lGyzE7MXMY2YOr8QwwIlTEJ91gmPYTXc7RJpQHF++Y/Xfysc=
X-Received: by 2002:a05:6122:1350:b0:531:4041:c4c5 with SMTP id
 71dfb90a1353d-544a01cf405mr4619082e0c.7.1756915960513; Wed, 03 Sep 2025
 09:12:40 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Wed, 3 Sep 2025 18:12:29 +0200
X-Gmail-Original-Message-ID: <CAJbE=Kw75D_qHMUsYOhtBAkXmtRaGAuGu0CoU4JK__sskFJ1dQ@mail.gmail.com>
X-Gm-Features: Ac12FXxrBDs_tIPltVir-IgbDTf1hDntl1d40dzIpp9ePjRfu9kXuuXUqqW2bVQ
Message-ID: <CAJbE=Kw75D_qHMUsYOhtBAkXmtRaGAuGu0CoU4JK__sskFJ1dQ@mail.gmail.com>
Subject: Xen Summit Updates
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000ba0ca7063de7df41"

--000000000000ba0ca7063de7df41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Xen Summit in Silicon Valley is starting in less than 2 weeks (September
15-17). I hope you're ready for the big event!

Here are a few quick updates:

   - *Schedule:* The schedule is live <https://xensummit2025.sched.com/>!
   We may make last-minute adjustments, so check back regularly.
   - *Registration:* If you are attending, please register as soon as
   possible. This helps us plan badges and meals. Attendees receive a daily
   hot breakfast and lunch, plus an invitation to the Tuesday evening dinne=
r
   at Loma Brewing Co. <https://lomabrew.com/>.
   - *Speakers:* You=E2=80=99ll receive a registration code and link.
   - *Sponsors:* If your employer is a sponsor, ask for the sponsor
   registration codes.
   - *All others:* Please register here
   <https://register.linuxfoundation.org/xen-summit-2025>.
   - *International travelers*: Let me know if you need a visa letter or
   formal invitation.
   - *Diversity scholarship:* There=E2=80=99s still time to apply
   <https://forms.gle/FepJ6sZ9tbxXRQo98>!
   - *Design sessions:* Once you=E2=80=99re registered, watch for an email =
with
   details on how to suggest and vote for design sessions (or ask me). Thes=
e
   sessions are a great way to shape the future of Xen. Don=E2=80=99t miss =
out!

As always, don't hesitate to reach out if you have any questions. I'm here
to help!

Have a great day,


Cody Zuschlag
Xen Project - Community Manager

--000000000000ba0ca7063de7df41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,<br clear=3D"all"></div><div><br></div><d=
iv>Xen Summit in Silicon Valley is starting in less than 2 weeks (September=
 15-17).=C2=A0I hope you&#39;re ready for the big event!</div><div><br></di=
v><div>Here are a few quick updates:</div><div><ul><li><b>Schedule:</b> The=
 <a href=3D"https://xensummit2025.sched.com/">schedule is live</a>! We may =
make last-minute adjustments, so check back regularly.</li><li><b>Registrat=
ion:</b> If you are attending, please register as soon as possible. This he=
lps us plan badges and meals. Attendees receive a daily hot breakfast and l=
unch, plus an invitation to the Tuesday evening dinner at <a href=3D"https:=
//lomabrew.com/">Loma Brewing Co.</a>.</li><li><b>Speakers:</b> You=E2=80=
=99ll receive a registration code and link.</li><li><b>Sponsors:</b> If you=
r employer is a sponsor, ask for the sponsor registration codes.</li><li><b=
>All others:</b> Please register <a href=3D"https://register.linuxfoundatio=
n.org/xen-summit-2025">here</a>.</li><li><b>International travelers</b>: Le=
t me know if you need a visa letter or formal invitation.</li><li><b>Divers=
ity scholarship:</b> There=E2=80=99s still time to <a href=3D"https://forms=
.gle/FepJ6sZ9tbxXRQo98">apply</a>!</li><li><b>Design sessions:</b> Once you=
=E2=80=99re registered, watch for an email with details on how to suggest a=
nd vote for design sessions (or ask me). These sessions are a great way to =
shape the future of Xen. Don=E2=80=99t miss out!</li></ul></div><div><div>A=
s always, don&#39;t hesitate to reach out if you have any questions. I&#39;=
m here to help!</div></div><div><br></div><div>Have a great day,</div><div>=
<br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><img src=3D"https://ci3.googleuserconten=
t.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBm=
J2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div><div>Xen Project - Co=
mmunity Manager</div></div></div></div></div>

--000000000000ba0ca7063de7df41--

