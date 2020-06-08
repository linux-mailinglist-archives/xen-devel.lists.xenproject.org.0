Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF01F18F6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 14:44:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiH8H-0000jK-Hd; Mon, 08 Jun 2020 12:44:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bRRk=7V=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jiH8G-0000jF-0j
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 12:44:04 +0000
X-Inumbo-ID: bb542078-a985-11ea-96fb-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb542078-a985-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 12:44:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c21so10112791lfb.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 05:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K1cmkpiwWtTyJU+MoXtjIgUD1hAfBA2Tmbv3Dr830FI=;
 b=Q/wiWVXboF5iFyb+I2r2x3x/7CsIPSGJt4tsYiGTvJY4mAV5U/4+B5E7tp/U6zDa8t
 WoFjcADDb9Jt9CmJt8m+3COVfLAf8nm+88k7rljPWqa9aSt4BSeQ923CMoXvFQfM544b
 9gQPJYXlRH51rFYHKsxFXdjJxiH1TNEIusf6EAJfoNqyajlavKc2WuQOge7mbvtH34Ti
 RPW2aLYWcA5orheBUXUXP7k2for1wzIJWbWhqmV1xMcEbTVvXaABPHTXaQ0AioC5ayLX
 I5tSBGz7lQHEBrat6e2C3xefvyQMwSeoMR+O0wMdf8C1xV2Mo3LQ60GMWVlqDiE1cKYS
 XkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K1cmkpiwWtTyJU+MoXtjIgUD1hAfBA2Tmbv3Dr830FI=;
 b=COwlxudS+VG2BLSVyKftGjyySUNyFn9haZNesMt3JSbirRJZckIoVzl+zy9xTNVdWc
 8rzTSQyEkbLXHaFeayre3/odkDduASkoBjU2H/pCAPk9RVzlKdV06PF4t7hAyXe+qLSB
 uDgM7CorrIwPHfmVaCOEJm1wVsbmgq/F/IIDzqexOj6OQ42/dojeRSYOA+dcP+vJd+LF
 GAX/hs/6f+LQSdD117yeQ2ogkDbHhkXltbuBYCj8etbb+yBRX9puV7aR9J+nsCTDmTPO
 dsa2b4TqIwIK/H90gC8a2hvRFDBm1/JXYkAdUIeSvJXKquFnYJwQxJbkt7IuvC82YapJ
 Qs8A==
X-Gm-Message-State: AOAM530WOwf9CdUpmdxgjwcDGBSaZGhLNCZdr0pvKXCmyr8jlkngObyD
 PuA9pGC2fHBGeRPAtWVILIbs4YToF4DfCmDtibg=
X-Google-Smtp-Source: ABdhPJzGi3lv8F/kbuSYpdXDMrgtdwvxnGSD9UOAJsV3HIgYNqQGQLZXc6pxbkDJgOzERjniz13heoPcsJ8ACMnoy2I=
X-Received: by 2002:a05:6512:31d1:: with SMTP id
 j17mr11798171lfe.148.1591620242241; 
 Mon, 08 Jun 2020 05:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200608072855.26589-1-olaf@aepfle.de>
 <20200608100051.16be834e.olaf@aepfle.de>
 <24286.6790.983312.672969@mariner.uk.xensource.com>
In-Reply-To: <24286.6790.983312.672969@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 8 Jun 2020 08:43:50 -0400
Message-ID: <CAKf6xpusrQaMb3ET_HJyrreSPvvogEQORSWUG1X2H5oa-HUZiA@mail.gmail.com>
Subject: Re: [PATCH v1] tools: fix usage of strncpy
To: Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 8, 2020 at 7:03 AM Ian Jackson <ian.jackson@citrix.com> wrote:
>
> Olaf Hering writes ("Re: [PATCH v1] tools: fix usage of strncpy"):
> > Am Mon,  8 Jun 2020 09:28:54 +0200
> > schrieb Olaf Hering <olaf@aepfle.de>:
> > > off-by-one error in libxl__prepare_sockaddr_un
> >
> > There is none, I had read the code backwards...
>
> I have just had the same thoughts but in the opposite order.  That is
> at first I thought this was not a problem, but now I think there is.
>
> There are some kernel interfaces where a fixed-size buffer is
> provided, and the kernel will tolerate a null-terminated string, but
> will in any case not read beyond the end of the buffer.  Anything
> involving IFNAMSIZ comes to mind.
>
> But I think sun_path is not one of those.  The manpage I have here
> says that to be portable you must null-terminate sun_path.  I know
> that there are some implementations where it is possible to pass a
> longer path, effectively treating sun_path as a trailing vla.
>
> Looking at your diff, its effect seems to be to ensure
> null-termination by truncating overlong paths.
>
> I think the right approach is to return an error, not to silently
> truncate.

I added a length check in this patch:

https://lore.kernel.org/xen-devel/20200525024955.225415-2-jandryuk@gmail.com/

Regards,
Jason

