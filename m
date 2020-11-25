Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA362C37BE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37129.69323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khm01-0007Dm-DG; Wed, 25 Nov 2020 04:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37129.69323; Wed, 25 Nov 2020 04:01:45 +0000
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
	id 1khm01-0007DN-AB; Wed, 25 Nov 2020 04:01:45 +0000
Received: by outflank-mailman (input) for mailman id 37129;
 Wed, 25 Nov 2020 04:01:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=al8A=E7=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1khm00-0007DI-EB
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:01:44 +0000
Received: from mail-qk1-x72a.google.com (unknown [2607:f8b0:4864:20::72a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33bb8c92-daab-452b-8a39-7520ae97d78b;
 Wed, 25 Nov 2020 04:01:43 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id v143so2142462qkb.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 20:01:43 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=al8A=E7=zededa.com=roman@srs-us1.protection.inumbo.net>)
	id 1khm00-0007DI-EB
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:01:44 +0000
X-Inumbo-ID: 33bb8c92-daab-452b-8a39-7520ae97d78b
Received: from mail-qk1-x72a.google.com (unknown [2607:f8b0:4864:20::72a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 33bb8c92-daab-452b-8a39-7520ae97d78b;
	Wed, 25 Nov 2020 04:01:43 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id v143so2142462qkb.2
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 20:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cwBJSzcLltCkr02NOG52BIl8E1NR/1H/uKp+rG9k5s0=;
        b=EWHp3YHqeX1qCRwKJKRh95HKQNYKswbd9wRrXAR9kXwLihmHoe+JPaYgHLJ170IcRP
         UXjg+q+A6Xy1rQavbVjcGr0aMjrpvdLCZefGLiiL3TL/8vDWKgoutu+wa32D6vFCwK4L
         JPOTYcZcXIlV9xwO2mXdVzOra6lqbAeqIAwVG3p6I6Kv+7feKGRsTXniwL0U7PnftpaP
         rQk84uq34mSSjl6+RxDgbCFwByh1HonCmue84SE0aPA2dDidJXtvmmg6h7zrcvd5dJ5g
         rXo9M53GVlvMa2LMPaaPcfL6BugzChhFpFe7TvhXo8ldMtN9DZ0Jfntijg05QAXlN3oD
         8nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cwBJSzcLltCkr02NOG52BIl8E1NR/1H/uKp+rG9k5s0=;
        b=CO9gHlF65OTT3aKMLTggrqWFMraDgeQWMkK6Zlq2jauyzqOAFT8gIxrlvHXaSLJHkm
         FWuKtQfPYu2pR4pBNhDK5BYnUKmOb+x80Xr61fD52WSZh50zTXTDOSAWuno7CNdbTXQr
         GXBMRtykvAeaiMkvK4WZ2Kh9oOU7AZdBWAJzBbXtdUlRBCXOiaUep64j6UMLSAo6MDH4
         PJDDhgB+ApQowCeAUPeKLq5nJDctWjjEHQBKm+SLadBUDt65fzYpN5Kh59q8GDv5rW2o
         pCAvv5ReXpaupn46O5U+e++5Ubjdd8KZ4Z5dcRV1dO3H18OVRH4eQXi2f9DF3t/Ab35q
         MnQQ==
X-Gm-Message-State: AOAM530/i0/smRRZ1D4h9quhVo5MuNUOp7/eDU/3BSEAG7XfaOEe5dML
	Gwbraq8i2fOTIcDyLPvDumNUZ1xdKg8yT+UoZoSzpw==
X-Google-Smtp-Source: ABdhPJz10E/GEK4JzRUMT1KGKTT8tKoUJgRjpcfJG0w+ztjdMWqmb+vE7dyJbHxKj665OdNAQSxYa+J2HPEMwBpSvHk=
X-Received: by 2002:a37:a907:: with SMTP id s7mr1525786qke.157.1606276903217;
 Tue, 24 Nov 2020 20:01:43 -0800 (PST)
MIME-Version: 1.0
References: <X73RfHfRfBRLKkvB@mattapan.m5p.com>
In-Reply-To: <X73RfHfRfBRLKkvB@mattapan.m5p.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 24 Nov 2020 20:01:32 -0800
Message-ID: <CAMmSBy8dtUQotUeX2MVke7d2nWS0shvKPL_S=4tUeF0UKh4vgA@mail.gmail.com>
Subject: Re: Xen on RP4
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 7:37 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>
> I finally have U-Boot -> GRUB -> Xen sort-of operational as an

Yup -- same as what we're using in EVE -- we're now on the same page ;-)

> alternative to Tianocore -> GRUB -> Xen on a Raspberry PI 4B.
>
> Stefano Stabellini, how much of the Raspberry PI 4B hardware have you
> observed being operational under Linux on Xen?  In particular, have you
> ever observed operational graphical output from a Raspberry Pi 4B running
> Xen?

Pretty much everything is fully operational including graphics (but
not native one -- the default LK one)

> Presently I'm using a 5.8 kernel with your patches and haven't seen
> graphical output under Xen with either boot stack.  I've confirmed fully
> operational graphics without Xen on Tianocore, I've confirmed operational
> virtual terminals with U-Boot and not Xen.
>
> I had been planning to wait a bit before moving to 5.9, but if that is
> the crucial ingredient I'll move early.

We're still using 5.4 -- but it seems that the next LTS 5.10 is also functional.

I can bet $10 whatever it is -- it is DT related ;-)

Thanks,
Roman.

