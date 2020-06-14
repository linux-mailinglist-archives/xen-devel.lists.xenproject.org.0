Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD361F891F
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2020 16:07:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkTGI-0001we-PL; Sun, 14 Jun 2020 14:05:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iuHb=73=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jkTGH-0001wZ-Jp
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 14:05:25 +0000
X-Inumbo-ID: 176a0a50-ae48-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 176a0a50-ae48-11ea-bb8b-bc764e2007e4;
 Sun, 14 Jun 2020 14:05:24 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n24so16021755lji.10
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2020 07:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ek51lNfJOUVZmpl2borP2GO2sHVw7RV31/wY1xuTfEs=;
 b=uPNqlx98V+AbSyvg85S8YWWT5gjWwLAClLqgTX1GEk6aqoVWFSG/EivrYB0/vMk5Gx
 /H2K5okIge2zaoqU0690RhB3HQ5Kzd/OFO1yOxzrkZ54sWIxiaTdJsSdQOcykESPrCNe
 rHrHEhX9LtuRoya+mLR3se8a/buFZoLM/U6ejPW9UOhM2lgSXOlwInBFJ/z0EdfDqeoP
 /WihJBd/GbvUeEjH/b13SpB4I8pigHiNTEixLOc8WV/LaNjLQZkohdMYNQevbuFQv7qJ
 kooiPeGNnyhUskIs2gx6t43XlpiEjcuO4x5W7DeUoIfpY5nIjeU/oFd5tmyTTiHc/eJ6
 PN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ek51lNfJOUVZmpl2borP2GO2sHVw7RV31/wY1xuTfEs=;
 b=D+9v9NwCff4zndnhuH9R2e2ADLA8jwcUbuZBdv0tjIlafEQ2nnQsq9J+BP2LPa4pOL
 LKsW9w8W6LyCoq1VSJS+hRZYrKa+GsHjo4fW+Nq2M9/70jbgORMne7CfisVCi6DJXLnC
 pEPIQYhOCaC5pn3aguVG11d7fZIifPaQPeQaBS0E+FKuj/iF2sn9wtqm/XRhTk+IsJ50
 alB/rYCNN4SInHQF0rI/kRYfYSV7mRDhwLafMUYNkaLWOnYUkPz+/KkUc/i55Ewg2GHO
 IC3OpgXra67v5taaNhTP3zpSybtXtjqaqJqQ97K9xmkAooZBwc+v/lB3jvFCmNxG9sqF
 t0Pg==
X-Gm-Message-State: AOAM532tiXVQIUV3sEg56BY05eWphClHMTR+JB8SRG2/dxibRW6Erosw
 uvUb5p5HvjaZIF2NUd4Yxp+gEf0R4ccjmxiOWDY8ng==
X-Google-Smtp-Source: ABdhPJy7WHpJUIREpkkt1SiJoFuv7VMQeDJC7nvP/4yoTRC3ZslxlQX6Wq1GTot8v3nG8mxeJZIeO+idZwfyz+tHoSA=
X-Received: by 2002:a2e:b88c:: with SMTP id r12mr10794956ljp.266.1592143523722; 
 Sun, 14 Jun 2020 07:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200525024955.225415-1-jandryuk@gmail.com>
 <CAKf6xpvRxeUdOOogacDvncC3yogcTN4gALVWO+V8ZJ8x__RafA@mail.gmail.com>
 <CAKf6xps9j=bszbw5SAYeZdrGS9jP-3Hu9RCGT45ifNR6qdAX3Q@mail.gmail.com>
 <20200613124044.GN6329@mail-itl>
In-Reply-To: <20200613124044.GN6329@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 14 Jun 2020 10:05:12 -0400
Message-ID: <CAKf6xpsF53j7G1d5Ckq-b4x6ef7WxQZcvvQ8wtEm1-yvgzCiJw@mail.gmail.com>
Subject: Re: [PATCH 0/8] Coverity fixes for vchan-socket-proxy
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jun 13, 2020 at 8:40 AM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Wed, May 27, 2020 at 10:59:55PM -0400, Jason Andryuk wrote:
> > On Mon, May 25, 2020 at 6:36 PM Jason Andryuk <jandryuk@gmail.com> wrot=
e:
> > >
> > > On Sun, May 24, 2020 at 10:50 PM Jason Andryuk <jandryuk@gmail.com> w=
rote:
> > > >
> > > > This series addresses some Coverity reports.  To handle closing FDs=
, a
> > > > state struct is introduced to track FDs closed in both main() and
> > > > data_loop().
> > >
> > > I've realized the changes here are insufficient to handle the FD
> > > leaks.  That is, the accept()-ed FDs need to be closed inside the for
> > > loop so they aren't leaked with each iteration.  I'll re-work for a
> > > v2.
> >
> > So it turns out this series doesn't leak FDs in the for loop.  FDs are
> > necessarily closed down in data_loop() when the read() returns 0.  The
> > only returns from data_loop() are after the FDs have been closed.
> > data_loop() and some of the functions it calls will call exit(1) on
> > error, but that won't leak FDs.
> >
> > Please review this series.  Sorry for the confusion.
>
> For the whole series:
>
> Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
.com>

Thanks for the review.  Sorry for forgetting to CC you on this series
and the v2 posted on Jun 10th as well.  For v2, patch 1 now also
changes strncpy to strcpy to avoid a gcc-10 warning reported by Olaf
Hering.  Patches 2 & 3 are new to move some perror calls.  v1 patches
2-8 shifted to 4-10 in v2, but are unchanged.

Thanks,
Jason

