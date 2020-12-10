Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7EA2D5D96
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49346.87265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMv6-0003r5-Li; Thu, 10 Dec 2020 14:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49346.87265; Thu, 10 Dec 2020 14:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMv6-0003qh-Hj; Thu, 10 Dec 2020 14:27:48 +0000
Received: by outflank-mailman (input) for mailman id 49346;
 Thu, 10 Dec 2020 14:27:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t4S1=FO=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1knMv5-0003qU-21
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:27:47 +0000
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bee6f3a5-1ecf-4624-87e9-d78374f634e4;
 Thu, 10 Dec 2020 14:27:46 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id bo9so7549825ejb.13
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:27:46 -0800 (PST)
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
X-Inumbo-ID: bee6f3a5-1ecf-4624-87e9-d78374f634e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h0ZkNmdrRk1QmBSvbXHC8b9Yk7HUiLC1aWMMCjxRxnY=;
        b=F4QheKpiJJxVg1rHl8Qc5ltjP127YbCLivdRTsGvE/XgdZc4gFui1VMaywti47I6x+
         wTN6MdEF2x/sMYb8G1GowTyblyKhQyTl/dbsFBnLJk9k0hu0t6QczluJUnNcHp8baCae
         2E0jP0hXt/1s/BKOzp2M5R2JellblkE1jgjiGwETIGouxXMEDxZ4AekqsqCC7gE64ysC
         Rg16qM3W1/LT0hxPqs1JXkaJ/3/pP2QNmgEFeXFLmVsB6eUoiESufJj58d1A5D/6rerG
         X1Ysd5zsc3glD0HXcqM6kom6yR+d52wZwzFm572+S2LeuxOQtu207RB0pOg5bOip5+hZ
         n2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h0ZkNmdrRk1QmBSvbXHC8b9Yk7HUiLC1aWMMCjxRxnY=;
        b=nfWC9/yEZRKVmf3+LWZm1OgofPZn6ElnY+yi6i87PKR2bIPugIojb/BaVIxhLonBlb
         CdsLdSI4+O8z1ZmT1qJ1FlQxDDa1J35nAczeHR3WNXyuLOR1eMbmKFNoCs+spx/YqOMf
         FDlhqyseEo26z5mYmwKUaBnvlSlYqTW+LtF9kXaoQICyq1tZHxbbqVQ+pDGwfxb9wa4o
         RG0Hb20LMzCzBbXvFvnTWz6w01gyKgR2lGpfMWR7FoK4WcRxWTWsq77m7qEc+IHCKR6n
         npZ43xI5mwlE1ocnrVdcfgqkky/KIGLldCasO3IKMUr8HBFel95720FSKhMbXOASi/jX
         dBbA==
X-Gm-Message-State: AOAM532t1nSNJZizuUJai+YwfmEpc+oHRnJ3VELZXpiQMUBLgoLxQdXQ
	08KBq75wpm3RfQuzIPmJeG8yfS+m18q/RXia985mCw==
X-Google-Smtp-Source: ABdhPJxKojA/+/fWdEygGDSNtO/TGC7C2s8P2PjilRSbR6HuRNhJZ6sQ54SA4GXtiOiUK4RRINyXTzehCjna6e5aCn4=
X-Received: by 2002:a17:906:31d2:: with SMTP id f18mr6606354ejf.407.1607610465440;
 Thu, 10 Dec 2020 06:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-9-marcandre.lureau@redhat.com> <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
In-Reply-To: <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 14:27:34 +0000
Message-ID: <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>, 
	"open list:X86" <xen-devel@lists.xenproject.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Dec 2020 at 14:26, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > QEMU requires either GCC or Clang, which both advertize __GNUC__.
> > Drop MSVC fallback path.
> >
> > Note: I intentionally left further cleanups for a later work.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  audio/audio.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/audio/audio.c b/audio/audio.c
> > index 46578e4a58..d7a00294de 100644
> > --- a/audio/audio.c
> > +++ b/audio/audio.c
> > @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
> >
> >  #if defined AUDIO_BREAKPOINT_ON_BUG
> >  #  if defined HOST_I386
> > -#    if defined __GNUC__
> > -        __asm__ ("int3");
> > -#    elif defined _MSC_VER
> > -        _asm _emit 0xcc;
> > -#    else
> > -        abort ();
> > -#    endif
> > +      __asm__ ("int3");
>
> This was 15 years ago... Why not simply use abort() today?

That's what I suggested when I looked at this patch in
the previous version of the patchset, yes...

-- PMM

