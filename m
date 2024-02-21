Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE885CE5D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 03:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683775.1063373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rccj8-00045k-BA; Wed, 21 Feb 2024 02:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683775.1063373; Wed, 21 Feb 2024 02:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rccj8-00044W-8U; Wed, 21 Feb 2024 02:52:54 +0000
Received: by outflank-mailman (input) for mailman id 683775;
 Wed, 21 Feb 2024 02:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rccj7-00044Q-02
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 02:52:53 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d4f2409-d064-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 03:52:50 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d21a68dd3bso61303381fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 18:52:50 -0800 (PST)
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
X-Inumbo-ID: 4d4f2409-d064-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708483970; x=1709088770; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzN08dfURlX5uofvO0Xj4FiOZNs4wbcnJfxRfrsSU80=;
        b=lHXV+CJqQvW5VdxpKZS3cvTdYVh8GLXXx1rAtREK5QTv6A4+60orZLlevCF4sRLl94
         4jeew1zmMD1ZUKQeIEKcQuIrJvEszWWgquyrzm73bFGc4Fbd4Tls/b3cM7tAug16YFgE
         CHP5IrsNmVkauSgczAPp7B2tMNPEJK1DSKdRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708483970; x=1709088770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzN08dfURlX5uofvO0Xj4FiOZNs4wbcnJfxRfrsSU80=;
        b=gYnI0skUXrTmoIUw4r41vxoPv+ShjxTDrjLwB3uOzHPbPL9Z88tt0T8Kww33aqdvJ8
         3r92FcEZADo5AYkVV3g/aExzpi2JNmkmvfdNpXrOHsMaZw3d12XQLqqpVkz+YTh4yNF5
         GtiJ2HHwTauoYKwQM+A+V6l7r0rEO2JBB/16+Uzam112Ol0GWpdjB8++p8Ro07e1QWaH
         YC/XhOZaQHG3VyaIKkiSMjoydkO9498huvIo4n4IS/2SfxzdQww5MJcP1dW3SX64rcQM
         pujYLLpuk8WiB6r3ppxsd2N81y7t70el/djAyAf1HGri7lkEXqB247ndFQtyQAbBPbTZ
         osbQ==
X-Gm-Message-State: AOJu0Yy+U2sJabZ2u65RIKbQRvdlugWtpVyvbwGxEw4ZeDgijojcCPFf
	iNfgAZJcZ4uW3ZuAvO6Wpoi8Fs4bWh9B1Q3bneAtQMDUWFlYx8iV1bYjKFe8O/+8UiFg1GKfDDz
	fMdWgLSdwlBKhxjmselXQl9wmXLBiG/qfxf2pEcOBdR9A8jmfXmQ=
X-Google-Smtp-Source: AGHT+IGpDhcZ8opn9LBoHgxEWsHqspX4nd8HJr69NFgJlL8vMKOv6Ldu704rOF3QE85MYOf2LFxFLK43Hf02Y+I/R0k=
X-Received: by 2002:ac2:538a:0:b0:512:bce5:1e0f with SMTP id
 g10-20020ac2538a000000b00512bce51e0fmr3843407lfh.64.1708483970241; Tue, 20
 Feb 2024 18:52:50 -0800 (PST)
MIME-Version: 1.0
References: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>
 <ZdN06v1k3E8xarLY@mattapan.m5p.com>
In-Reply-To: <ZdN06v1k3E8xarLY@mattapan.m5p.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 10:52:39 +0800
Message-ID: <CA+zSX=aFyoJCZVbj4u5m3Rm1dTQDH_fLfuWuV5ms04qhc38Q7w@mail.gmail.com>
Subject: Re: Stats on Xen tarball downloads
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org, 
	Kelly Choi <kelly.choi@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 11:34=E2=80=AFPM Elliott Mitchell <ehem+xen@m5p.com=
> wrote:
>
> On Mon, Feb 19, 2024 at 06:01:54PM +0800, George Dunlap wrote:
> >
> > Looking at the *non*-4.18 downloads, nearly all of them have user
> > agents that make it clear they're part of automated build systems:
> > user agents like curl and wget, but also "Go-http-client", "libfetch",
>                    ^^^^     ^^^^
>
> I reject this claim.  `curl` or `wget` could be part of an interactive
> operation.  Telling a browser to copy a URL into the paste buffer, then
> using `wget`/`curl` is entirely possible.  I may be the outlier, but I
> routinely do this.

It's not just the user agent; there are certain statistical
regularities that make me think it's automated.  e.g., a specific
version of curl always downloading a specific version of the tarball,
the tar.gz and the tar.gz.sig being downloaded exactly the same time
distance apart.  There certainly *are* manual wget / curl invocations,
but the majority of them look to me like they're part of automated
systems.

(And the "Go-http-client" instances are kind of fascinating to me --
someone wrote something on golang to download the Xen tarball?  And
always 4.15.1?  And it's being run from both NH, USA and from Finland,
and a handful of other places that seem unrelated?  What project is
this?)

> > It's not really clear to me why we'd be getting 300-ish people
> > downloading the Xen 4.18.0 tarball, 2/3 of which are on Windows.  But
> > then I'm also not sure why someone would *fake* hundreds of downloads
> > a week from unique IP addresses; and in particular, if you were going
> > to fake hundreds of downloads a week, I'm not sure why you'd only fake
> > the most recent release.
>
> Remember the browser wars?  At one point many sites were looking for
> IE/Windows and sending back error messages without those.  Getting the
> tarball on Windows doesn't seem too likely, faking the browser was
> pretty common for a while.

Right, which is why I wanted to look more into the rest of the data to
see if I could get a feel for it.  There are very few Windows user
agents for the other versions; the handful of browser agents for
non-4.18.0 tarballs look very normal and unix-y.  So the question is,
why would you fake loads of downloads for Chrome / Firefox / Edge on
Windows *only* for 4.18.0?

I agree that none of the current explanations make a lot of sense; but
I continue to believe that the "We have loads of actual humans
downloading the 4.18.0 tarball via browsers, even on Windows" is the
least-bad fit.  (Feel free to propose others, though.)

 -George

