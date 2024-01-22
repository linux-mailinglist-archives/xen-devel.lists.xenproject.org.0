Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582283632E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 13:26:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669811.1042259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtNW-00053J-Gg; Mon, 22 Jan 2024 12:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669811.1042259; Mon, 22 Jan 2024 12:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtNW-00051Z-Dw; Mon, 22 Jan 2024 12:26:14 +0000
Received: by outflank-mailman (input) for mailman id 669811;
 Mon, 22 Jan 2024 12:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBCN=JA=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rRtNU-00051T-VN
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 12:26:13 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c5a3bd4-b921-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 13:26:09 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cd1232a2c7so40224701fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 04:26:09 -0800 (PST)
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
X-Inumbo-ID: 6c5a3bd4-b921-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705926369; x=1706531169; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TF2q+4ijXl7Qd26J+2z+A9aEQDavlu2PRyo3ae06Ynw=;
        b=KWxnZ8uxF7xXyYG/UD6UhZN/ig8kDKMlO5hgTjamtgKAAeyFeORshRQAX23I3we09K
         UBrfTVYrRcn2PbkCdyVD4H6VOrYNA1CzUXszYqhjxvGnGZRf2u4R/+1zjsf1dKZ+2jLc
         /P3HW2hh13O5URGk9opv6+JuBRQmsQJ+okSn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705926369; x=1706531169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TF2q+4ijXl7Qd26J+2z+A9aEQDavlu2PRyo3ae06Ynw=;
        b=rNF/XjvGzgmhxlxaj4rKE3AqtHtddpCEDYgJbXO4TmpJ63BbMC53Wz3M62u26woxaC
         hykdqoC4a4+pQWg5paUYsDW2CzuR9y1C2PGlwjh3QFPS4K4lNGupD8M5bOb9Y+MlwOvQ
         +7x9M+mgK/U7G+DL9k7ze5g9Ww0iaC3eyFY4BIpqOY2Uzdqg98Y7vgzqpZj5UbwnYd2H
         aSHesUhy0DDHhQvwMsqlSDhBhAke2OgoQ1QN5WzkMpHBMDoIZ5y9lf1kd7VgzTXEY/3J
         1inBNPZga3d0df3gEjcqzEL7pzRuDBwQtigQVhfKl7SO2wsbAeWawzHVFBAvQuRGxg/6
         yAZg==
X-Gm-Message-State: AOJu0Yxop/f4k+rkm43shErXjt5rzfwBcf4/C42dCF6ctlBbCNPJ6GoS
	Uv2+YwPRPV6orr4pEArH1v4ZTPtmLUkJKwSxBwH+U6lQCtKWoYKETd9kQzzVkvPIt6UhvWFFaBT
	MlUtFTNAvCoT2ed6YTTfiLKTo4BILXeSb88lPyg==
X-Google-Smtp-Source: AGHT+IGC5VPyxeJos5mzEVceRgjhL0DuAMvmLsAMwoqKkb59+yuE0J3T4LoAa8FPayBHvvjpLaKDccxeowzOTGwMIuY=
X-Received: by 2002:a2e:b711:0:b0:2cd:217:4602 with SMTP id
 j17-20020a2eb711000000b002cd02174602mr1688005ljo.36.1705926369380; Mon, 22
 Jan 2024 04:26:09 -0800 (PST)
MIME-Version: 1.0
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
 <Za23cKyEOl1WTvhZ@itl-email> <CA+zSX=YNjVaGn8=kio=2iT8onHAP61pzP-dicMrr4pKJQ827gw@mail.gmail.com>
 <Za5c5pm9Qai82zvf@mail-itl>
In-Reply-To: <Za5c5pm9Qai82zvf@mail-itl>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 22 Jan 2024 12:25:58 +0000
Message-ID: <CA+zSX=Zu1e1JSkje9=s5jtEsoT8vmNVhSbC3bJY5Nu-UWTA+gw@mail.gmail.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 12:17=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Mon, Jan 22, 2024 at 11:54:14AM +0000, George Dunlap wrote:
> > The other issue I have with this (and essentially where I got stuck
> > developing credit2 in the first place) is testing: how do you ensure
> > that it has the properties that you expect?
>
> Audio is actually quite nice use case at this, since it's quite
> sensitive for scheduling jitter. I think even a simple "PCI passthrough a
> sound card and play/record something" should show results. Especially
> you can measure how hard you can push the system (for example artificial
> load in other domains) until it breaks.

Are we going have a gitlab runner which says, "Marek sits in front of
his test machine and listens to audio for pops"? :-)

>
> > How do you develop a
> > "regression test" to make sure that server-based workloads don't have
> > issues in this sort of case?
>
> For this I believe there are several benchmarking methods already,
> starting with old trusty "Linux kernel build time".

First of all, AFAICT "Linux kernel bulid time" is not representative
of almost any actual server workload; and the end-to-end throughput
completely misses what most server workloads will actually care about,
like latency.

Secondly, what you're testing isn't the performance of a single
workload on an empty system; you're testing how workloads *interact*.
If you want ideal throughput for a single workload on an empty system,
use the null scheduler; more complex schedulers are only necessary
when multiple different workloads interact.

FWIW this was my first stab at trying to be systematic about testing
the scheduler:

https://github.com/gwd/schedbench

The rump kernel project has basically died AFAIK, so anyone trying to
resurrect this would probably have to try to rebase that bit of it
against something like XTF or unikernels.

 -George

