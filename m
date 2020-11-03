Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3972A47C9
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 15:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18341.43333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZx5O-0006Qt-12; Tue, 03 Nov 2020 14:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18341.43333; Tue, 03 Nov 2020 14:14:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZx5N-0006QU-UC; Tue, 03 Nov 2020 14:14:57 +0000
Received: by outflank-mailman (input) for mailman id 18341;
 Tue, 03 Nov 2020 14:14:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UbT5=EJ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kZx5M-0006QP-5t
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 14:14:56 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bb6a2ad-fda9-4f5a-84cf-420f02f1a27f;
 Tue, 03 Nov 2020 14:14:55 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 126so22343094lfi.8
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 06:14:54 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UbT5=EJ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kZx5M-0006QP-5t
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 14:14:56 +0000
X-Inumbo-ID: 5bb6a2ad-fda9-4f5a-84cf-420f02f1a27f
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5bb6a2ad-fda9-4f5a-84cf-420f02f1a27f;
	Tue, 03 Nov 2020 14:14:55 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 126so22343094lfi.8
        for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 06:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y4scG6pUiFINvPm6eKyKAnfnRZPW9pBwBTyJ9KNQu5Q=;
        b=VmyHQS9mChaxsl90FnoFH9+rrTqn0jq2qilY53BjZBwYH2XR1TNUtDLunezPjsUZaE
         UZjLI3iUZ05iFirN4ZrlMKcZQBqMQFKZ+MdOHoUjXKGPdfaup4trry8leSNKxckcABD/
         gOSF5dh6ioQV+/+QI3+V2+EUPXZuDzHH6vM4CDVcvZIZnkjTb4RB3yMEdKS0KQ9xSPPZ
         sw0AUdmamS9oIe5jF7URKJFdAkGF89nyfUQsWKsUUD1yNrRCEwREleNZqt9MeKZZbwUI
         dMOoz3npURlBx/mjBjcE7DThOt94JJli0wC9riPs5Bzy3zAdutZ9FkrGwEEHQOplqvxo
         hHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4scG6pUiFINvPm6eKyKAnfnRZPW9pBwBTyJ9KNQu5Q=;
        b=NPnK4gb4gud6PrK4KgHsKfr5p9r1QMu/IcGHZbz5KMEZfkwAJ/QnCNPUucNz/0DgYG
         OJ+thJF3DUgM4G+Fhv3aOtMNRU6f5GuKxqlY9G3HF5a36NDTao0KMsITbwnIv7dlNFWK
         Kc0+qyZVVeaUhNJED3YZf5MXHg4ydYNUvg3f0bnluFIAm1FSELdwYovhwE15ap5ly7Q7
         XRQeUONqZ0DjUqQfJGJls06rxenTAxxTDFwOXO/Mh1BENwKKOtvVIIJ9/Rc/Wm8F7pR6
         kzb7x/wuYZ06Frb1wDtZE8vftXa2ndJKwExdnHHpYnmCubsj0r/XKwylI0R+RtD3uSLb
         v/0Q==
X-Gm-Message-State: AOAM532xQAkkcOSIGRwPvZIBWoP0GXyxPre3L6pEYI5BYuhoObNlB8wC
	BbaHZQt8rtJDWon6FFvyanAdyGA3H07KiKfKbSk=
X-Google-Smtp-Source: ABdhPJzawSsh37agbgRkhMRYqz0NpLWGwTIn7QqM8AiqHUkmdqP0WyDDF2ZNo/a+nODYqbiNGbgR5Pvs2BLeG69QEhI=
X-Received: by 2002:ac2:47fc:: with SMTP id b28mr7422181lfp.454.1604412893787;
 Tue, 03 Nov 2020 06:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20201029190332.31161-1-jandryuk@gmail.com> <20201103104844.t73k4rukp7jezk7d@liuwe-devbox-debian-v2>
 <20201103110629.GH2214@perard.uk.xensource.com>
In-Reply-To: <20201103110629.GH2214@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 3 Nov 2020 09:14:41 -0500
Message-ID: <CAKf6xpv9JZPhUjCFKj_gneSqMsiWQ99LFUgwE9-wQtUXZw-Q0Q@mail.gmail.com>
Subject: Re: [PATCH v2] libxl: Add suppress-vmdesc to QEMU machine
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Ian Jackson <iwj@xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2020 at 6:06 AM Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> On Tue, Nov 03, 2020 at 10:48:44AM +0000, Wei Liu wrote:
> > On Thu, Oct 29, 2020 at 03:03:32PM -0400, Jason Andryuk wrote:
> > > The device model state saved by QMP xen-save-devices-state doesn't
> > > include the vmdesc json.  When restoring an HVM, xen-load-devices-state
> > > always triggers "Expected vmdescription section, but got 0".  This is
> > > not a problem when restore comes from a file.  However, when QEMU runs
> > > in a linux stubdom and comes over a console, EOF is not received.  This
> > > causes a delay restoring - though it does restore.
> > >
> > > Setting suppress-vmdesc skips looking for the vmdesc during restore and
> > > avoids the wait.
> > >
> > > QEMU 5.2 enables suppress-vmdesc by default for xenfv, but this change
> > > sets it manually for xenfv and xen_platform_pci=0 when -machine pc is
> > > use.
> > >
> > > QEMU commit 9850c6047b8b "migration: Allow to suppress vmdesc
> > > submission" added suppress-vmdesc in QEMU 2.3.
> > >
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> :-(, sorry, I never received that email.

Sorry about that.  I included your address , but Gmail said:
"""
Address not found

Your message wasn't delivered to anthony.perard@citrix.com because the
address couldn't be found, or is unable to receive mail.

The response from the remote server was:

550 Too many invalid recipients
"""

> > > ---
> > > QEMU 2.3 came out in 2015, so setting suppress-vmdesc unilaterally
> > > should be okay...  Is this okay?
>
>
> > Anthony, what is your opinion on this?
>
> That it's fine, and I actually asked for the libxl patch. For reference,
> QEMU 2.3 is in qemu-xen-4.7.
>
> So,
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

Jason

