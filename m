Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609E7B7EEB1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 15:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124936.1467076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyk6h-0002Fy-2e; Wed, 17 Sep 2025 04:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124936.1467076; Wed, 17 Sep 2025 04:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyk6g-0002D9-Uz; Wed, 17 Sep 2025 04:49:26 +0000
Received: by outflank-mailman (input) for mailman id 1124936;
 Wed, 17 Sep 2025 04:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0j/D=34=edera.dev=alexander@srs-se1.protection.inumbo.net>)
 id 1uyk6e-0002Bk-TM
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 04:49:24 +0000
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [2607:f8b0:4864:20::d2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adcb2818-9381-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 06:49:23 +0200 (CEST)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-8876de33c86so450432939f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 21:49:23 -0700 (PDT)
Received: from localhost ([2605:9480:312:2031:4ed7:17ff:feaa:a013])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f2f32facsm6630066173.19.2025.09.16.21.49.20
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 21:49:20 -0700 (PDT)
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
X-Inumbo-ID: adcb2818-9381-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1758084562; x=1758689362; darn=lists.xenproject.org;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jZ7hBKPepBdLWV/w2l/ZIF3GaLF0WRrNhLtwU/RtH5o=;
        b=NI7vofzrrHwMTjsvbf1RBUxy015t3Tag7wot9C2hS9tygExFhyN3Yq+4eFKA++OkqW
         SQzxchZRA6t3qtNdF1t0zAIVTYU6DnqQNzIEigl0fkACq2VwpWcvdQmlaCOdoxuKq810
         z4/RWsMEJQOAro8OeOk/5Iv+aT9uEioQnH2xLZzxpddFf4uGDHRb+EnMl6g51CHByHzx
         dbbVp6NWgPr1bK8TNI7+E23onotqn2UNwWeZ0OLfwYEi43jiEj77S0yBNAr0GxpKd87R
         dQPbhHvQo7pLay6JdGnGPtiM5n1Ms6j5uGJb4BwcTY9GUCJmEiFatYmmUfSiayS80vdJ
         JqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758084562; x=1758689362;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZ7hBKPepBdLWV/w2l/ZIF3GaLF0WRrNhLtwU/RtH5o=;
        b=j6q6z18diVFxJISi0bYvbHyRB0+Zj9/helwL8J+cBVgJeADXkIXo5+B7YCdbd1EKgq
         lX5yDHu7BCYAJyPEckZbmnADWZBY3S59/EnCubXLCkdPkKqpQkfmGsbjdnYpAuvHtGK3
         xWRoc7ZIavtxdNZVo6fjZXudVZvusBT9BvZe6IlXUe3RW8A7+ROHHQ1JW7e/USOUhQkm
         PUcZAmPM1jdv3BMZIgwnXDWQxGri6a2dE1danu0taRmrO/ZQLLPzXZTGvEunfpfxiEVu
         6anmkdr9pt6iUPGt4ELAOmf25gLNmJpWwwyOK3RO+480HSYDLMX7sONu7xrCMovty824
         kFJA==
X-Gm-Message-State: AOJu0YyKg9AApxrnUcTyZJkH12+DR7+bOwelgnXRO0A9MbBZH9X9Lt3a
	Uy5ZiUqzGr9+ZO/iRU+NjqUYI557A9y3utIhIn8mET2nyR7TeG6Abw5qyWHbFyQcaJQ08GoVbQb
	gBifMrSY=
X-Gm-Gg: ASbGnctW/C2+oY+itRRs78spFevAxKBtrHRFwEFQ3bnPgYVckdxqp2YtHcJ9G/VIxok
	jjl5DY01fDX0Rcj3+qb/no+mQ0Y+hTZb572PPJhgT7a1b8EKDF0U59q2IbgtegilDkO6EuFwC2D
	UHs9mpDhPZFf/wtKPUrVT8DH5MSxl3T8bL+JdQGCMfcydp6jRj1qPZjC+FGMIsCosEoYYq4r0vh
	X+a+MDJ+CXUjw8aGTEnWwA1hmvZHdWAwo76UDGnLm94mFTVFYgH9M1G9JymgI2wMZJPiMNglwQb
	9SVXB2uTPjigXfEmGu0OjWurxyjAxBxHka/HlBQPc6jB3Ne10d3enZUaRKDFuV98sU684p0G+WL
	XNKd6Mq2MW6B8+cyHsY9Lug==
X-Google-Smtp-Source: AGHT+IHFrx3ohwYyBFJhKdBb2A5tBp0OwGtFKYm3ziHVzlPekfmHeNiENSxmKXS9+ItdnEFy7AC3cA==
X-Received: by 2002:a05:6602:3412:b0:890:1f62:492c with SMTP id ca18e2360f4ac-89d1bfab247mr130671639f.8.1758084561635;
        Tue, 16 Sep 2025 21:49:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 23:49:19 -0500
Message-Id: <DCUSYP0Y5FYU.37Q6RNEA7AMZQ@edera.dev>
Subject: Xen Summit 2025 - Design Discussion Notes - Xen ABI
From: "Alexander M. Merritt" <alexander@edera.dev>
To: <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2

Hi all, it was requested I send the notes I took during the design discussi=
on on the ABI / APIs to the list.

Normally I keep this as personal notes, so there may be errors (esp if I di=
d not hear correctly), so please feel free to correct or expand. Details ma=
y be missing where I am unaware of the history behind something.

-Alex Merritt




Design Discussion: Xen ABIs and APIs

- Chris on remote: Andrew has been and wants to work on a new ABI
- Andrew: put together a collection of documents to understand what we have
to work with, what we want to improve, before starting the work on any
design or iterations on interfaces we currently have
- link to document in the design session
        =E2=80=90 https://design-sessions.xenproject.org/uid/discussion/dis=
c_3IEQbyaCTkqLf2fFzoze/view
- number of things we have been aware of for a while
- some attempts to address them on the list
- one problem: if you only try to fix one of them, it brings in discussion =
of
fixing many other items
- everyone has opinion on what the end result will look like
- existing designs only fix subsets, not the whole thing
- we want to address all the problems from the start, before deciding on a =
plan
to fix them
- enumerate the ABIs and APIs that currently exist
        =E2=80=90 problems not apparent if you just think about this
        =E2=80=90 many folks think this is just the hypercalls
        =E2=80=90 there is the enumeration information
        =E2=80=90 xen has many bugs - originally monorepo with xen, linux, =
qemu, BSDs,
        bochs, ... with =E2=80=9Cmake world=E2=80=9D you got a system. All =
guests were
        required to have event channel - no discovery exists because they a=
ll
        had it
        =E2=80=90 grant table v2, migrate old version of xen to new, exerci=
se new code
        paths, then kernel crashed
        =E2=80=90 initial state of vcpus - many folks don=E2=80=99t think a=
bout them, but what
        xen presents, we have bugs describing those via the hypercalls we u=
se
        =E2=80=90 the hypercalls themselves -- 46? -- half of them specific=
 for PV guests
                - x86 HVM / ARM HVM are only a small fraction of the total
                hypercalls that exist
- the reason the hypercalls look like this now, Xen started with pv guests =
on
x86, a VAS system made sense
        =E2=80=90 when HVM guests came along, we have hacks fitting PV gues=
ts into HVM
        =E2=80=90 Xen has to walk the page tables of the guest just to get =
the
        information it needs, you cannot do that in encrypted VMs by design
        =E2=80=90 need to change the way we deal with pointers in the API
- evtchn send, pass pointer information on the stack
        =E2=80=90 get interrupt for someone else!
- look over all APIs and ABIs that exist because they have different proble=
ms in
different areas
- XenServer cares most about right now host UEFI secure boot
        =E2=80=90 new priv boundary that does not exist previously
        =E2=80=90 admin with root cannot (should not) violate security boun=
dary, cannot
        read/write arbitrary memroy
        =E2=80=90 hypercalls: open /dev/xen/privcmd and pointers into user =
space
        memory, nothing stops passing kernel pointer memory
                - giant privilege escalation hole in UEFI secure boot
                - root user space is not priv enough to execute arbitrary c=
ode
        =E2=80=90 all problems compound, thus we want to look at all of the=
m before we
        start figuring out what to do
- another example: being based on x86 originally, large hypercalls have a s=
hift
by 12, assume 4k pages, problem with ARM wanting 64k page tables
        =E2=80=90 event the data layout wants to change
- if you change the version of Xen, you break the user space (library versi=
ons)
        =E2=80=90 was intentional choice early on, doesn=E2=80=99t scale
        =E2=80=90 get rid of unstable APIs -- killing xen
- security hotfix - recompile QEMU
        =E2=80=90 ABI rules say any change in hypervisor, thus rebuilding u=
ser space,
        and QEMU -- anything that links against the xen packages!
- Bertrand: look at problem yesterday: how we create and configure a guest,
coherency to reach dom0less
        =E2=80=90 twice code to create a guest, duplicated code
        =E2=80=90 duplicate configuration format
        =E2=80=90 if we modify ABI between dom0 and Xen, need to look at ha=
ve
        coherent format so we can reuse the same code
- Alex M: can we hide hypercalls via libraries?
        =E2=80=90 yes but currently the versions for a break
        =E2=80=90 definitely an option forward
        =E2=80=90 still doesn=E2=80=99t solve the issue, because other libr=
aries in other languages
        won=E2=80=99t be shielded from unstable ABIs
- Jan: both knowing what to do and where we go is useful
        =E2=80=90 Andrew: have to have broad idea where to go....
- Jan: carrying out hypercall is independent of the mechansim we define
        =E2=80=90 Andrew: still needs backwards compatibility
        =E2=80=90 Andrew: use higher op numbers
- Alex M: is our problem unique to us?
        =E2=80=90 Andrew: we have enough corner cases that yes
        =E2=80=90 Bertrand: PV guests require a large number of hypercalls
        =E2=80=90 Jan: keep VA for PV hypercalls
- Rich on call: work together with Chris to write down something difficult =
in
scope
        =E2=80=90 any work written down, useful for folks on other side whe=
re we may
        encounter failures
        =E2=80=90 newcomers: xen forked by HP (?)
        =E2=80=90 everyone tried to narrow to verticle markets, focus on sp=
ecific markets
        =E2=80=90 Xen: is last entity standing, still trying to pull all st=
akeholders together,
        but not sure how long it will last
        =E2=80=90 if collapses: accidental or intentional interoperability,=
 carve out the
        pieces so that the ppl at table today have a chance to know what
        results from it
        =E2=80=90 what will last longest: certified entities that have long=
 lifecycles,
        decades or more
        =E2=80=90 certified snapshots will become longest lived design choi=
ces
- Andrew: shared info page
        =E2=80=90 layout was done with unsigned longs which changed sizes
        =E2=80=90 layout of the shared info page changes
        =E2=80=90 different vcpus can be in different modes at a time
        =E2=80=90 we cache the mode of the cpu at the point which it makes =
one of two
        types of hypercalls
- another design session tomorrow

