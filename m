Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822AF1D962A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 14:21:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb1F7-0000dW-P2; Tue, 19 May 2020 12:21:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zPhu=7B=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1jb1F6-0000dQ-7A
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 12:21:08 +0000
X-Inumbo-ID: 34951ae8-99cb-11ea-9887-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34951ae8-99cb-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 12:21:02 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id s198so12118372oie.6
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8/gZGNNUOMV0cNspyJua+QUzz3j0JQh8jq+6Z4+9XIc=;
 b=xl/C5nmsn8hHP41gZxCIkruWmIRYKYMIGB/O2pJclNNg9Bjms3yD5E94NP3Id5qdco
 GPw/Ynq+Fep0xOXtMn1sLFHVXhzxys4yyoPG/b6kwlJow8Bh6cKofVUI40ByKa7GPtZ+
 Pj4TlLl0GyoBfItBXQoMAPCBva6lUpO7qJPVCb49PEvGZUIgivzZxAq1MzG87JAfJ9rQ
 vzIZgKyyuxBSu5SBr9u2FjMW/yGpop/Fby8yw6HZkcv8JC3hf7FZFNyhwA5TmK4XtPP4
 jFkF3rO48HnEDxGpIN5OwlcFHNZfCvKcOG9NkRIeQ3HfoWZtaDybARA8GEKkSqBBmWIb
 987Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8/gZGNNUOMV0cNspyJua+QUzz3j0JQh8jq+6Z4+9XIc=;
 b=Zqck0Z8oBMgtA4cZhQxhYGuGdOm+X4FdqV6MeWcOFN2w6x2MFNM3e4DI5BupsdQ1LD
 YLXyQ6dalsVxz0Gp0JPiIaV+SV0r7jDGtGvEzWfHdKnut1TppmTm8/PyM8dlQVrVmyu5
 R5Dei1x41QJDrmS6mhnKyjeM6V4QqPABPyQKqpxRc/Opp7cBQyweQCTlJ4Dokgi07GPt
 9Kgf6Hgj3oY1vWZHh3xWPa3qF1hfZJSifwiMbaKaJjpQiETmXuvyu3GnumpLKfm8rFtz
 XtUSX2WmEzjayLqgmBYDMuXbYj9uNZBl4X1fKOJvFQ6X9s/w3x7Kr4P3J/sGngwXaPze
 DbvQ==
X-Gm-Message-State: AOAM5300sUfB/pq3vzBrh9FyPqctFlDyLYm63gQOE8HkmJ9sSr6QyqD0
 KZ3van7+M5VQk3X2ghatfxsRAm3GiiPSOJOxpm7g3Q==
X-Google-Smtp-Source: ABdhPJx62nq7PczRR5OTY9N7Lsn/a95RAsGm383b2c1f/a8hDbeSIXlAn2Pv9r6UoqPXa+cO48FDwyBRhljHs04F5Bg=
X-Received: by 2002:aca:eb96:: with SMTP id j144mr2711690oih.48.1589890862477; 
 Tue, 19 May 2020 05:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200504101443.3165-1-roger.pau@citrix.com>
 <20200511134043.GH2116@perard.uk.xensource.com>
 <20200519112806.GF54375@Air-de-Roger>
In-Reply-To: <20200519112806.GF54375@Air-de-Roger>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 May 2020 13:20:51 +0100
Message-ID: <CAFEAcA-RWR_6OQV1EgeYj0WmE89FDKqcywTpgfrMyr8FrELN+Q@mail.gmail.com>
Subject: Re: [PATCH] xen: fix build without pci passthrough
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 19 May 2020 at 12:28, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:
>
> On Mon, May 11, 2020 at 02:40:43PM +0100, Anthony PERARD wrote:
> > On Mon, May 04, 2020 at 12:14:43PM +0200, Roger Pau Monne wrote:
> > > diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> > > index 179775db7b..660dd8a008 100644
> > > --- a/hw/xen/xen_pt.h
> > > +++ b/hw/xen/xen_pt.h
> > > @@ -1,6 +1,7 @@
> > >  #ifndef XEN_PT_H
> > >  #define XEN_PT_H
> > >
> > > +#include "qemu/osdep.h"
> >
> > Why do you need osdep?
>
> For CONFIG_XEN_PCI_PASSTHROUGH IIRC.

All .c files should always include osdep as the first include
in the file, and .h files should never include osdep (we note
this in CODING_STYLE.rst).

If you added this #include to fix a compile issue that would
suggest that there's a .c file somewhere that's missing the
mandatory osdep include. I did a quick eyeball of all the files
that include xen_pt.h, though, and none of them are missing the
osdep include. So I think you should be able to simply drop the
osdep include here. If that produces an error, let us know what
fails and we can work out what's gone wrong.

thanks
-- PMM

