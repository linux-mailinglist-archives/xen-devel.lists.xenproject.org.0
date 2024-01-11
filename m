Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FDD82A7AA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 07:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665849.1036175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNogl-0003Pw-Pa; Thu, 11 Jan 2024 06:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665849.1036175; Thu, 11 Jan 2024 06:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNogl-0003OM-Mm; Thu, 11 Jan 2024 06:37:15 +0000
Received: by outflank-mailman (input) for mailman id 665849;
 Thu, 11 Jan 2024 02:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wP2G=IV=gmail.com=simonpatp@srs-se1.protection.inumbo.net>)
 id 1rNkok-0006Dh-Lc
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 02:29:14 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3597a8f6-b029-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 03:29:13 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cd5c55d6b8so40304861fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 18:29:13 -0800 (PST)
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
X-Inumbo-ID: 3597a8f6-b029-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704940153; x=1705544953; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IMYtyjnz9qMfdlVNuO9e6CGKE+/OquWGdy8V+qQvres=;
        b=jkdgf2yIdzWW2l3isMUANapUVXe/1d6RLRRkwOYNz7aef5NF4gtlUOKD3pFncuM6y6
         UfoL6uaNGcYjfqoe+wJMA910yqgrH5GiuAnEQpfsMnhLGozCyN9s/BbzmfNGz/xehAUp
         UqZW+p2zfrFmnYY/hKmjDhWTswXfX2TVw94xJarsySXojGMEQ8ePafnwutYEskeQigwQ
         1gRYkGr25Ui/oP46tzpZ9mN/ugS+JRa+V6G21f0o2iduUor9LO7PLn9Ac6m9DszdDi5e
         bA27qmQ7sm06ySktbwXuGau9lTG8uAOK4g3KmICFfzgwr1H3G8oPv26ovdqNq/dEsugy
         YWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704940153; x=1705544953;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMYtyjnz9qMfdlVNuO9e6CGKE+/OquWGdy8V+qQvres=;
        b=vcWJOfCVhxm0UZgix0pZUJhmswSlJoMNKh05zr8qxZDlfAGdyE4edOZGErM9EzUBjO
         H7njgsF9sa5lyFN5QT4+UuI+dp3vqxj2xkdjbqoTM5NNKr1Cg/wP7PA7du41IfjhYLzC
         StiWC39VuN1RYOgxHuY/aJ4CAq9QLCRSRVfRppvJ0cl3C5HdBmIV7h2mwGP+6Y42Qd1f
         ZUU4unEwy4tEAtur4CmLdst2f/Rc9S3Wheq9ib5xraMCDc9iYHDamLesWg5QfAQO7QNP
         Djey2rrV/u2wSRpmWo1NZz26PnXsz0v/RP0OIRsWiGbTSS6Ny4av6M2X9gpS1m/hn3k/
         7JHQ==
X-Gm-Message-State: AOJu0Yy7c1HDS2kH8SjvdnFUxILlUwYV0dfNnqPy66vlYJzxQBZnL1bn
	HZBh8NOaPV85U/mJTnQc84uMrIGQ5vQ+HFYIU6qdQ2VXu8I=
X-Google-Smtp-Source: AGHT+IHs8gX3igEkX2lpDOhXsbbNTqem7y2fMol2HW4/xuIzc6UpVI41ZGZDNiuZzj4KUeQJK2EKFcFxJfFEHgMXvl4=
X-Received: by 2002:a2e:9245:0:b0:2cd:65f9:570d with SMTP id
 v5-20020a2e9245000000b002cd65f9570dmr137942ljg.40.1704940152637; Wed, 10 Jan
 2024 18:29:12 -0800 (PST)
MIME-Version: 1.0
From: Patrick Plenefisch <simonpatp@gmail.com>
Date: Wed, 10 Jan 2024 21:29:01 -0500
Message-ID: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
Subject: E820 memory allocation issue on Threadripper platforms
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000294dde060ea2500f"

--000000000000294dde060ea2500f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I ran into a memory allocation issue, I think. It is the same as
https://github.com/QubesOS/qubes-issues/issues/8791 and I saw at the end it
was recommended (by marmarek) that the issue reporter forward the issue to
this list. I searched the list, but as I didn't see it in the list already,
I'm doing that now.

Hardware:
I have an AMD Threadripper 7960X on a ASRock TRX50 WS motherboard. The
Qubes reporter had a Threadripper 3970X on an ASUS Prime TRX40-Pro
Motherboard. I saw a 3rd issue report of a similar issue on another
Threadripper, so I think this may be Threadripper-specific.

Setup:
The QuebesOS reporter was using Qubes Installer.
My install was that I had a fresh install of Debian 12 (no gui), and then
did `apt install xen-system-amd64` and rebooted.

The issue:
Any boot of Xen on the hardware results in a halted machine. When
monitoring the logs with `vga=3D,keep`, we get:

(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 644kB init memory
mapping kernel into physical memory
about to get started=E2=80=A6
xen hypervisor allocated kernel memory conflicts with E820
(XEN) Hardware Dom0 halted: halting machine

None of the settings I or the Qubes reporter have tried have been able to
get past this failure.

I am happy to provide debugging support.

Patrick

--000000000000294dde060ea2500f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I ran into a memory allocation issue, I think. =
It is the same as <a href=3D"https://github.com/QubesOS/qubes-issues/issues=
/8791">https://github.com/QubesOS/qubes-issues/issues/8791</a> and I saw at=
 the end it was recommended (by marmarek) that the issue reporter forward t=
he issue to this list. I searched the list, but as I didn&#39;t see it in t=
he list already, I&#39;m doing that now.<br><br>Hardware:<br>I have an AMD =
Threadripper 7960X on a ASRock TRX50 WS motherboard. The Qubes reporter had=
 a Threadripper 3970X on an ASUS Prime TRX40-Pro Motherboard. I saw a 3rd i=
ssue report of a similar issue on another Threadripper, so I think this may=
 be Threadripper-specific.<br><br>Setup:<br>The QuebesOS reporter was using=
 Qubes Installer.<br>My install was that I had a fresh install of Debian 12=
 (no gui), and then did `apt install xen-system-amd64` and rebooted.<br><br=
>The issue:<br>Any boot of Xen on the hardware results in a halted machine.=
 When monitoring the logs with `vga=3D,keep`, we get:<br><br>(XEN) *** Seri=
al input to DOM0 (type &#39;CTRL-a&#39; three times to switch input)<br>(XE=
N) Freed 644kB init memory<br>mapping kernel into physical memory<br>about =
to get started=E2=80=A6<br>xen hypervisor allocated kernel memory conflicts=
 with E820<br>(XEN) Hardware Dom0 halted: halting machine<br><br>None of th=
e settings I or the Qubes reporter have tried have been able to get past th=
is failure.<br><br><div>I am happy to provide debugging support.</div><div>=
<br></div><div>Patrick<br></div></div>

--000000000000294dde060ea2500f--

