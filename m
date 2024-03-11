Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9724877F07
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 12:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691416.1077378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdtu-000483-7B; Mon, 11 Mar 2024 11:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691416.1077378; Mon, 11 Mar 2024 11:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdtu-00045R-4g; Mon, 11 Mar 2024 11:33:02 +0000
Received: by outflank-mailman (input) for mailman id 691416;
 Mon, 11 Mar 2024 11:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJgN=KR=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rjdts-00045H-MR
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 11:33:00 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c75e208-df9b-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 12:32:59 +0100 (CET)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-221e1910c3bso737280fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 04:32:59 -0700 (PDT)
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
X-Inumbo-ID: 1c75e208-df9b-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710156778; x=1710761578; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWI6rhjTQ7kTO17emW9lIPCEDSxGphud145pHZ5LsHg=;
        b=LtyIvvawdpANy2AuowQW2uvrT7Sy0KFCsfGt5Wjge18VfDVEqgsHoVBNPLjLErOUkv
         vaA+ZEpuYEWvLMYTXWoWx+AET8ArRdjF3M0Dnvi+ieNpViP9UqsmD20+TCCDb9KyY3+B
         qaL/JE/XAAQ/tQRB0FPAVAjezSiWPo9tIlMJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156778; x=1710761578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWI6rhjTQ7kTO17emW9lIPCEDSxGphud145pHZ5LsHg=;
        b=TrsZHeM0ZlPRgiTL5i4LLuKZSPuVanMlu64phQbzRW+SzotGrZtDofYe8A7gl0xiOV
         ekOlVcb2BqUou0Y9/kYBLWaCAxVpfYQtqT/RXcswq1PPv9+vG+3mJRbVlFarzPpE6Sif
         XAR1FPhrJoTXKTDkgAgOaRpmORVZR0lhYSSkr3KMfJ98y3ySy3pl1nvcc658gS90TVyV
         DxyTtbkzHYx4+m5AawKtDW9VVryulAny0aI+nHcQ9lY9+Jp0MQXUTaG+jAO++wpm5mLy
         C1GvtpmpXCUALFQ80HWNxfknjjyPFagfDsE6dR45dC/cKuEP7pu0cSc417h8CX/ATPDK
         uXtw==
X-Forwarded-Encrypted: i=1; AJvYcCVZdDdbQlFKl1YAI6chls5OBdzZTG4/4YblHOdBQVhgR9nJMZLfsaQR1dDCZILoyCiKYz1+z0SVyG00AY3AnbyQhi4OMVs711ox/U9b210=
X-Gm-Message-State: AOJu0Yw3I8486Bw39oWyinmIFZe5/XTDNIgCT8ex2f7t8WHbKGJCSnP8
	IxIZY7eo8eXU/+yu7E+A2iaDTqonQVLXm0cU94qK8ANQ9Y/Oo7lcbVgm44ql/ei7KzawaKlKPfs
	wlTuFOVqDgCuj/hhmcfmLdgpp8zNnk/EtVXzaZA==
X-Google-Smtp-Source: AGHT+IELpPt4F0u++9xXEHuSWcKChQnBzcW1yF+YKNcpINgytJoAoCJm3v7vF/u5IVA4ElxJzus9+lo6ngHEhM+QmGM=
X-Received: by 2002:a05:6870:d88d:b0:21e:bd75:1947 with SMTP id
 oe13-20020a056870d88d00b0021ebd751947mr6793099oac.59.1710156778018; Mon, 11
 Mar 2024 04:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com> <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 11 Mar 2024 11:32:47 +0000
Message-ID: <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, federico.serafini@bugseng.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	xen-devel@lists.xenproject.org, michal.orzel@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 9, 2024 at 1:59=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> I would like to resurrect this thread and ask other opinions.
>
>
> On Thu, 23 Nov 2023, Jan Beulich wrote:
> > On 22.11.2023 22:46, Stefano Stabellini wrote:
> > > Two out of three do_multicall definitions/declarations use uint32_t a=
s
> > > type for the "nr_calls" parameters. Change the third one to be
> > > consistent with the other two.
> > >
> > > Link: https://lore.kernel.org/xen-devel/7e3abd4c0ef5127a07a60de1bf090=
a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com/
> > > Link: https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.230825150=
2430.6458@ubuntu-linux-20-04-desktop/
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > ---
> > > Note that a previous discussion showed disagreement between maintaine=
rs
> > > on this topic. The source of disagreements are that we don't want to
> > > change a guest-visible ABI and we haven't properly documented how to =
use
> > > types for guest ABIs.
> > >
> > > As an example, fixed-width types have the advantage of being explicit
> > > about their size but sometimes register-size types are required (e.g.
> > > unsigned long). The C specification says little about the size of
> > > unsigned long and today, and we even use unsigned int in guest ABIs
> > > without specifying the expected width of unsigned int on the various
> > > arches. As Jan pointed out, in Xen we assume sizeof(int) >=3D 4, but
> > > that's not written anywhere as far as I can tell.
> > >
> > > I think the appropriate solution would be to document properly our
> > > expectations of both fixed-width and non-fixed-width types, and how t=
o
> > > use them for guest-visible ABIs.
> > >
> > > In this patch I used uint32_t for a couple of reasons:
> > > - until we have better documentation, I feel more confident in using
> > >   explicitly-sized integers in guest-visible ABIs
> >
> > I disagree with this way of looking at it. Guests don't invoke these
> > functions directly, and our assembly code sitting in between already is
> > expected to (and does) guarantee that (in the case here) unsigned int
> > would be okay to use (as would be unsigned long, but at least on x86
> > that's slightly less efficient), in line with what ./CODING_STYLE says.
> >
> > Otoh structure definitions in the public interface of course need to
> > use fixed with types (and still doesn't properly do so in a few cases).

You didn't address the other argument, which was that all the other
definitions have uint32_t; in particular,
common/multicall.c:do_multicall() takes uint32_t.  Surely that should
match the non-compat definition in include/hypercall-defs.c?

Whether they should both be `unsigned int` or `uint32_t` I don't
really feel like I have a good enough grasp of the situation to form a
strong opinion.

 -George

