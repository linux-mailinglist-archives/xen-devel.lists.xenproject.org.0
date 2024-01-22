Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC7A8363ED
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669857.1042306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtwq-0008BJ-6b; Mon, 22 Jan 2024 13:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669857.1042306; Mon, 22 Jan 2024 13:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtwq-000893-2j; Mon, 22 Jan 2024 13:02:44 +0000
Received: by outflank-mailman (input) for mailman id 669857;
 Mon, 22 Jan 2024 13:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBCN=JA=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rRtwo-00088x-Js
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:02:42 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 869bfe0a-b926-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 14:02:41 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cd04078ebeso40654481fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 05:02:41 -0800 (PST)
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
X-Inumbo-ID: 869bfe0a-b926-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705928561; x=1706533361; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxrhJ24YsQUhtbQ+c5UTIN74NkZAeFWwdadziIC8J+c=;
        b=WpK/8ACiLVB7B7kXsvwNC92ZL3Ds9yagXU2vcx5eXNZRiQrhAsxgya30eFcJQZIGie
         c5TDf0J8u3CwTu5Oo4uoQ74OZKslhP+Tb43NcDg1S3rD1X+dUdVlLZbYNWLV2ZiazWOr
         gDF9aWHK1LflGZWtBhr7SkpejU7l++KXgooxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705928561; x=1706533361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxrhJ24YsQUhtbQ+c5UTIN74NkZAeFWwdadziIC8J+c=;
        b=TFjOE7DgLZ/B0JT8m1+YCTOs/f/JfrYWI7OX+qHb37BZB/i1afu96ddNNTBZzRHibL
         P5rdwSh+uRft4Gdj0q11RO5hMkHAyOFhqM9z97ozqhqyAgLfvuH0ESz5QLDEUXFw/AdT
         7yqwYffvYbBQZV3ZpluSXT0+VA4SgARlea8TzYhb8N+QtpphSlrxSogEfQ8WLUyOqe1z
         9y9qOABIpBhhhDBrhW7rGgHxoS5M7igG1ndD5zRnNM9JyQ8dy0mGhMFTLIAXDk0aAWY+
         ZKMPCT67Gkoj7FPmpHaeUQncpAM0pEiewzxWOC8gAZ3gOZVlxybFjyfrQ/WGJ99CHT8t
         IIUQ==
X-Gm-Message-State: AOJu0Yze/+HA/tF0/Drgxh434AMYBkSPYK/UfBUEH4GfUKQSJaIXIdLD
	XhTUlShChxVgagAEzR7argXF/dhHREDG0FK6dqZuZY3pyVtq5Ymw52RL6d+7fB1hsEiJPEGyrcT
	H6mjs7ck/ghoyKBHXx9MdcZ6TkzY87CaLGa2c1r6ipcws5cLh
X-Google-Smtp-Source: AGHT+IG1qv9ChX7cyD8nkxtEL89j43adfyN0OEYqZ8l/pFJD+YjJaULFE8prvE5uUITCyFC/1nt9iQ8eoxnw4AIRFBo=
X-Received: by 2002:a2e:7a09:0:b0:2cd:1aa5:db82 with SMTP id
 v9-20020a2e7a09000000b002cd1aa5db82mr2026468ljc.21.1705928560656; Mon, 22 Jan
 2024 05:02:40 -0800 (PST)
MIME-Version: 1.0
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
 <Za23cKyEOl1WTvhZ@itl-email> <CA+zSX=YNjVaGn8=kio=2iT8onHAP61pzP-dicMrr4pKJQ827gw@mail.gmail.com>
 <Za5c5pm9Qai82zvf@mail-itl> <CA+zSX=Zu1e1JSkje9=s5jtEsoT8vmNVhSbC3bJY5Nu-UWTA+gw@mail.gmail.com>
 <Za5kqtWZ4mXCFvzf@mail-itl>
In-Reply-To: <Za5kqtWZ4mXCFvzf@mail-itl>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 22 Jan 2024 13:02:29 +0000
Message-ID: <CA+zSX=agZbyZNsS2ca9bEm8p+z=Y53moVfOz57Mrs-AJZmSdmg@mail.gmail.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 12:50=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Mon, Jan 22, 2024 at 12:25:58PM +0000, George Dunlap wrote:
> > On Mon, Jan 22, 2024 at 12:17=E2=80=AFPM Marek Marczykowski-G=C3=B3reck=
i
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Mon, Jan 22, 2024 at 11:54:14AM +0000, George Dunlap wrote:
> > > > The other issue I have with this (and essentially where I got stuck
> > > > developing credit2 in the first place) is testing: how do you ensur=
e
> > > > that it has the properties that you expect?
> > >
> > > Audio is actually quite nice use case at this, since it's quite
> > > sensitive for scheduling jitter. I think even a simple "PCI passthrou=
gh a
> > > sound card and play/record something" should show results. Especially
> > > you can measure how hard you can push the system (for example artific=
ial
> > > load in other domains) until it breaks.
> >
> > Are we going have a gitlab runner which says, "Marek sits in front of
> > his test machine and listens to audio for pops"? :-)
>
> Kinda ;)
> We have already audio tests in qubes CI. They do more or less the above,
> but using our audio virtualization. Play something, record in another
> domain, and compare. Running the very same thing in gitlab-ci may be too
> complicated (require bringing in some qubes infrastructure to make PV
> audio work), but maybe similar test can be done based on qemu-emulated
> audio or other pv audio solution?
>
> > > > How do you develop a
> > > > "regression test" to make sure that server-based workloads don't ha=
ve
> > > > issues in this sort of case?
> > >
> > > For this I believe there are several benchmarking methods already,
> > > starting with old trusty "Linux kernel build time".
> >
> > First of all, AFAICT "Linux kernel bulid time" is not representative
> > of almost any actual server workload; and the end-to-end throughput
> > completely misses what most server workloads will actually care about,
> > like latency.
> >
> > Secondly, what you're testing isn't the performance of a single
> > workload on an empty system; you're testing how workloads *interact*.
> > If you want ideal throughput for a single workload on an empty system,
> > use the null scheduler; more complex schedulers are only necessary
> > when multiple different workloads interact.
>
> I should have clarified I meant `make -jNN`. But still, that's the same
> workload on multiple vCPUs.

See, you're still not getting it. :-)

What you need is not multiple vcpus across a single VM, but multiple
instances of different workloads across different VMs.  For example:

1. One VM running kernbench
2. two VMs running kernbench, but not competing for vcpu
3. four VMs running kernbench, competing for vcpus
4. three VMs running kernbench, and one playing audio
5. four VMs running kernbench, one of which is *also* playing audio

And then you have to collect several metrics:

1. Total kernbench throughput of entire system
2. Kernbench performance of each VM, compared with expected "fair share"
3. Some measure of latency for the audio VM

And figure out how to compare trade-offs -- how much total throughput
hit should we tolerate to increase fairness?  How much fairness hit
should we take to decrease latency?

And as I said, kernbench isn't really a great server workload; you
should do something request-based, measuring both throughput and
latency.

 -George

