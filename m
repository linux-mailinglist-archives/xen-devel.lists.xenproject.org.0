Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4090A1D686F
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2020 16:30:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaKIG-0003bi-8w; Sun, 17 May 2020 14:29:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSDI=67=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaKIE-0003bd-H4
 for xen-devel@lists.xenproject.org; Sun, 17 May 2020 14:29:30 +0000
X-Inumbo-ID: d0fe3d2e-984a-11ea-b9cf-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0fe3d2e-984a-11ea-b9cf-bc764e2007e4;
 Sun, 17 May 2020 14:29:29 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a4so5710653lfh.12
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLe9QjRHmo2wHbxFgAhempcBpvA9GW7nyuL0G9e0F84=;
 b=jRONCA69hkrBtMCzGcdaUC4+SSR7YNf7YbVy8UdxEEpzrqwDQDS2LQopjKIXpl8RLX
 BCo05Ev/rZWIsWCbKuJcjyIZoRSXlR4FqKV3LFaX/FWAProreyMNNaRaNHJDPELiWVtC
 yegfdiD853phYRyK9n0Bx3blFT30OfDw829qKxZMowKGKppoU41NJpwEQlbfAkznXxnX
 jSb0REU1qreo5U8C5+Sjp4KHp++QgytwdQz8JZaNA9CL9Y7zecje3BT6AhetxDyEk0u/
 D+3S5lNg/IX1k6648aUdrXJfRrqUDg/mhtw+B08AFzxxViPHJEbRR7QLhDUfKZt54E95
 QYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLe9QjRHmo2wHbxFgAhempcBpvA9GW7nyuL0G9e0F84=;
 b=LHuUf8TOFhxKG4EISNiJZkz2WA9HqRH1Cz3V/B5gRwqC/h29OWWY9sSPLuoui/bUyH
 X8dfVxdiO4wt8jIWHTnijvmPeXJdocl3dDhicvFzwBDG7sfxGj16C6khWVkmCoBIro17
 3krltJPTl05mrQFb36d6y8X8Kd1Ocx/zGtv1mSFo4DbObyoU1PFHmkbgT/5+87vX+P7D
 2kdC+BEKsx1Mv1K/ijcI1UO+h6MxtaR2oMdRTyay0HPCbOaz+zKYwT7KMF6QZy/QVtSf
 XF7weW/qUhfAx6l0UGGsJsxbVe+lAst/ThT3nUm0uEQXiMfXRgaIlJxjRPcOK3uDfiAQ
 0npg==
X-Gm-Message-State: AOAM530NmJLb2eDa+2+1DVcsr2pza/f8NnCZIYVoHg0ZbxJ5I4X//jTg
 Jibx7TwdJXZ7WOIE3QCB/PF+L0WlEIfk2iZOeeo=
X-Google-Smtp-Source: ABdhPJwwJFlHwqPZEA9SglFzpte6WGuUMUZ9KCxv61ADcl/NrjP3dE3ipCsvkBDHAwpFETYNX7RE2wZHgETNlyRrIwM=
X-Received: by 2002:ac2:5a11:: with SMTP id q17mr8325254lfn.44.1589725768470; 
 Sun, 17 May 2020 07:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-7-jandryuk@gmail.com>
 <24253.28914.656817.996478@mariner.uk.xensource.com>
In-Reply-To: <24253.28914.656817.996478@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 17 May 2020 10:29:17 -0400
Message-ID: <CAKf6xptx3jk6VT3L6VS4e8pZhURFiLE+P8AzwP0TrHdX2q7EYA@mail.gmail.com>
Subject: Re: [PATCH v5 06/21] libxl: write qemu arguments into separate
 xenstore keys
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 14, 2020 at 12:25 PM Ian Jackson <ian.jackson@citrix.com> wrote:
>
> Jason Andryuk writes ("[PATCH v5 06/21] libxl: write qemu arguments into separate xenstore keys"):

> > +    xs_set_permissions(ctx->xsh, t, GCSPRINTF("%s/rtc/timeoffset", vm_path), roperm, ARRAY_SIZE(roperm));
>
> This line seems out of place.  At least, it is not mentioned in the
> commit message.  If it's needed, can you please split it out - and, of
> course, then, provide an explanation :-).

This was copied over from the mini-os version.  It looks like it is
unused by qemu-xen, so it can be dropped.

Thanks,
Jason

