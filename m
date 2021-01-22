Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B15300DB3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 21:29:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73095.131780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l333Y-0001C6-Gc; Fri, 22 Jan 2021 20:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73095.131780; Fri, 22 Jan 2021 20:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l333Y-0001Bh-Cn; Fri, 22 Jan 2021 20:29:20 +0000
Received: by outflank-mailman (input) for mailman id 73095;
 Fri, 22 Jan 2021 20:29:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRHJ=GZ=gmail.com=arthurborsboom@srs-us1.protection.inumbo.net>)
 id 1l333W-0001Bb-Ut
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 20:29:19 +0000
Received: from mail-yb1-xb29.google.com (unknown [2607:f8b0:4864:20::b29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fed0390f-eab8-4ca8-8acd-4641dd5ccfd8;
 Fri, 22 Jan 2021 20:29:18 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id y128so6649405ybf.10
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jan 2021 12:29:18 -0800 (PST)
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
X-Inumbo-ID: fed0390f-eab8-4ca8-8acd-4641dd5ccfd8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=00n2hrND1c+2yc6bRKCXZsmM9chMlRVzMA68fmp8a9Q=;
        b=KAh/3Gnwj/k+vxMnlmuVhuOzZIHVPwKl3PCpGu0lrp0r8Hv/Aor/Kw2/fQKHToJlZH
         LCUaMJdnY06/dQ7Dqx7ZnO816fvPmCyQbZvToDmMzy4cK270t66My3atYRWQoVget3hI
         WjM+SbDwtUgPfHn6jDCDbyZuepDqDaT/TBrc2GJFHVN4kqw/MjakjBhbWkRd3vT7W81Y
         yhd9BEMOAeG15ATofHPHgJZW8i7fDRALtOuaf5Njfwo84Dw82/Ovwp4iEg4GsX5s8HjU
         LrMjqogcIHg9xhBwg0MUUqkMELJqMx5O//sLs3PBusZbtLLyKdUQajmrqptAD12kD1xo
         yDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=00n2hrND1c+2yc6bRKCXZsmM9chMlRVzMA68fmp8a9Q=;
        b=QLOOPA+S1072VmFRk8Aka5shqnOvpF6+vrilplkLkcuhGEIYKwfJBMjxLaqVgtq0QI
         7ykuRQl3uNjCgblPi6Q6qtDL39yv4Rl5vN7JjKYvnnQS+JRhR/OH7y1pD8DWlNI8YIFq
         JF1HzlVIKNHMYXZ2japgrAPrpObugdEoeEf+YTJCOiuVQAwfkKzwt0wvW6kWaFeN4WLz
         URgrZhUT0qSjCvIwgpqMXDn5Ic/BTeY5WiFg7bmmXr7wKgiirgyEf+7LEwdfYqERcOIv
         YOB3/wXdllqyfpovYsTNRXbXLP2x94gcHg/2OF5HlRCfuOqKtrTA6c3TeoRbDapnMlCV
         KPFA==
X-Gm-Message-State: AOAM531u08ZgOxfZjIToWojaWmT6x4JQN0gODcEU42GgUtsBOk9sfkM0
	T696n7hOZIdJO0e0kbHpZ8Iu0tJqz0vv3b4k/i8=
X-Google-Smtp-Source: ABdhPJwMnRSh9Qy9DsHqtNZ1ALa5pnNf6DxZ3rfBDbNwLZjYn4s2wgLwFuRLXFgf1umRiAd3cn3milbx8byEhWxRmbg=
X-Received: by 2002:a25:5583:: with SMTP id j125mr8289674ybb.307.1611347357428;
 Fri, 22 Jan 2021 12:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20210119105727.95173-1-roger.pau@citrix.com> <CALUcmUkd9Eeau6tC9ZWHbLdvHTYfY34LvK6KKpOOxreYF67Myg@mail.gmail.com>
 <20210120143515.v2vgyhcxrhnnng6r@Air-de-Roger> <CALUcmU=6aAUrkg8KkJQvsQvNr1yL3E88Uy5xsD+u+XOrbUAhCQ@mail.gmail.com>
In-Reply-To: <CALUcmU=6aAUrkg8KkJQvsQvNr1yL3E88Uy5xsD+u+XOrbUAhCQ@mail.gmail.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Fri, 22 Jan 2021 21:29:01 +0100
Message-ID: <CALUcmUmBz76p_kHy2yA1v-F_vuTtMwORsqH4gtS04wvV4nQosw@mail.gmail.com>
Subject: Re: [PATCH v2] xen-blkfront: allow discard-* nodes to be optional
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org, 
	linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any chance of getting this backported to stable?
I believe the previous attempt by CC-ing stable was not following the
correct procedure and probably rejected.

https://lkml.org/lkml/2021/1/19/543

On Wed, 20 Jan 2021 at 16:17, Arthur Borsboom <arthurborsboom@gmail.com> wr=
ote:
>
> This time the patch applied cleanly.
>
> The trim command seems to work as well, meaning no error messages and
> a certain amount of blocks (5GB) is trimmed.
> The trimming did consume a bit of time (10-20 seconds), assuming it is
> actually discarding the blocks at the host.
>
> First run:
>
> [arthur@test-arch ~]$ sudo fstrim -v /
> /: 5.7 GiB (6074368000 bytes) trimmed
>
> Second run:
>
> [arthur@test-arch ~]$ sudo fstrim -v /
> /: 0 B (0 bytes) trimmed
>
> No errors were reported in the dmesg of the VM; no errors in Dom0 and
> no errors in dmesg of Xen (xl dmesg).
>
> Based on this single test, it seems to work.
> You can add me as Tested-By.
>
> On Wed, 20 Jan 2021 at 15:35, Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
> >
> > On Wed, Jan 20, 2021 at 03:23:30PM +0100, Arthur Borsboom wrote:
> > > Hi Roger,
> > >
> > > I have set up a test environment based on Linux 5.11.0-rc4.
> > > The patch did not apply clean, so I copied/pasted the patch manually.
> > >
> > > Without the patch the call trace (as reported) is visible in dmesg.
> > > With the patch the call trace in dmesg is gone, but ... (there is alw=
ays a
> > > but) ...
> > >
> > > Now the discard action returns the following.
> > >
> > > [arthur@test-arch ~]$ sudo fstrim -v /
> > > fstrim: /: the discard operation is not supported
> > >
> > > It might be correct, but of course I was hoping the Xen VM guest woul=
d pass
> > > on the discard request to the block device in the Xen VM host, which =
is a
> > > disk partition.
> > > Any suggestions?
> >
> > Hm, that's not what I did see on my testing, the operation worked OK,
> > and that's what I would expect to happen in your case also, since I
> > know the xenstore keys.
> >
> > I think it's possible your email client has mangled the patch, I'm
> > attaching the same patch to this email, could you try to apply it
> > again and report back? (this time it should apply cleanly)
> >
> > Thanks, Roger.
>
>
>
> --
> Arthur Borsboom



--=20
Arthur Borsboom

