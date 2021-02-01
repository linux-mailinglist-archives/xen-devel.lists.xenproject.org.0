Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0972730ACBF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 17:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80013.146117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6cCW-0007Mw-RW; Mon, 01 Feb 2021 16:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80013.146117; Mon, 01 Feb 2021 16:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6cCW-0007MV-Ms; Mon, 01 Feb 2021 16:37:20 +0000
Received: by outflank-mailman (input) for mailman id 80013;
 Mon, 01 Feb 2021 16:37:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mXSv=HD=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1l6cCU-0007MQ-NP
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 16:37:18 +0000
Received: from MTA-08-4.privateemail.com (unknown [198.54.122.58])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82bfd945-ae78-43aa-a983-8b0dd615e2b3;
 Mon, 01 Feb 2021 16:37:17 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id D819D60078
 for <xen-devel@lists.xenproject.org>; Mon,  1 Feb 2021 11:37:16 -0500 (EST)
Received: from mail-wm1-f51.google.com (unknown [10.20.151.218])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 99DC16004C
 for <xen-devel@lists.xenproject.org>; Mon,  1 Feb 2021 16:37:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id y187so13747274wmd.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 08:37:16 -0800 (PST)
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
X-Inumbo-ID: 82bfd945-ae78-43aa-a983-8b0dd615e2b3
X-Gm-Message-State: AOAM530wT7WKzgXQ0VxX+C+nqWRnttcqIbvgjQMmyqcydibKv7mk5R4M
	l4q8vHjg+OGTfjsKgXCQMmQFMILKfOmuSU0qmS8=
X-Google-Smtp-Source: ABdhPJw55lAGPsvAzoKS/Wj+V4tSwCJ0BZJtsGajVfpkkEG3OevZhCKSlbEXLcZ2c79xzskQFoWBEBHXqvl4ooD0YRc=
X-Received: by 2002:a05:600c:214d:: with SMTP id v13mr15950431wml.186.1612197435173;
 Mon, 01 Feb 2021 08:37:15 -0800 (PST)
MIME-Version: 1.0
References: <caba05850df644814d75d5de0574c62ce90e8789.1611971959.git.tamas@tklengyel.com>
 <74f3263a-fe12-d365-ad45-e5556b575539@citrix.com> <044823b7-1bbd-6405-7371-2b06e49cc147@suse.com>
 <0dc1f3c9-6837-ce12-8826-11354346b3c1@citrix.com> <65ded62d-9f57-85ed-c333-e301d195c9f2@suse.com>
In-Reply-To: <65ded62d-9f57-85ed-c333-e301d195c9f2@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 1 Feb 2021 11:36:39 -0500
X-Gmail-Original-Message-ID: <CABfawhk6ob5Az6p++-uCwBDkL+nC_SvtWWyHOuGF1WzJabirnA@mail.gmail.com>
Message-ID: <CABfawhk6ob5Az6p++-uCwBDkL+nC_SvtWWyHOuGF1WzJabirnA@mail.gmail.com>
Subject: Re: [PATCH] x86/debug: fix page-overflow bug in dbg_rw_guest_mem
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Feb 1, 2021 at 7:29 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 01.02.2021 12:44, Andrew Cooper wrote:
> > On 01/02/2021 09:37, Jan Beulich wrote:
> >> On 30.01.2021 03:59, Andrew Cooper wrote:
> >>> On 30/01/2021 01:59, Tamas K Lengyel wrote:
> >>>> When using gdbsx dbg_rw_guest_mem is used to read/write guest memory. When the
> >>>> buffer being accessed is on a page-boundary, the next page needs to be grabbed
> >>>> to access the correct memory for the buffer's overflown parts. While
> >>>> dbg_rw_guest_mem has logic to handle that, it broke with 229492e210a. Instead
> >>>> of grabbing the next page the code right now is looping back to the
> >>>> start of the first page. This results in errors like the following while trying
> >>>> to use gdb with Linux' lx-dmesg:
> >>>>
> >>>> [    0.114457] PM: hibernation: Registered nosave memory: [mem
> >>>> 0xfdfff000-0xffffffff]
> >>>> [    0.114460] [mem 0x90000000-0xfbffffff] available for PCI demem 0
> >>>> [    0.114462] f]f]
> >>>> Python Exception <class 'ValueError'> embedded null character:
> >>>> Error occurred in Python: embedded null character
> >>>>
> >>>> Fixing this bug by taking the variable assignment outside the loop.
> >>>>
> >>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> I have to admit that I'm irritated: On January 14th I did submit
> >> a patch ('x86/gdbsx: convert "user" to "guest" accesses') fixing this
> >> as a side effect. I understand that one was taking care of more
> >> issues here, but shouldn't that be preferred? Re-basing isn't going
> >> to be overly difficult, but anyway.
> >
> > I'm sorry.  That was sent during the period where I had no email access
> > (hence I wasn't aware of it - I've been focusing on 4.15 work and this
> > series wasn't pinged.),
>
> Oh, so you had actually lost emails, rather than (as I did
> understand so far) only getting them in a very delayed fashion?
>
> Anyway, the first part of that series having been pretty close
> to getting an XSA, I thought you were well aware that at least
> that part is very clearly intended for 4.15. (I also did
> mention it to you last week on irc, when you asked what wants
> specifically looking at for 4.15.) Plus, besides the bringing
> up of the topic on the last two or three community calls, over
> all of January I've specifically avoided pinging _any_ of the
> many patches I have pending, to avoid giving you the feel of
> even more pressure.
>
> > but it also isn't identified as a bugfix, or
> > suitable for backporting in that form.
> >
> > I apologise for the extra work caused unintentionally, but I think this
> > is the correct way around WRT backports, is it not?
>
> It didn't occur to me that there could be a consideration of
> backporting here. But yes, if so wanted, maybe the split is
> helpful. Otoh then the full change could as well be taken,
> to stop the abuse of "user" accesses also in the stable trees.

IMHO this should be backported cause it breaks use of gdbsx for all
affected releases.

Tamas

