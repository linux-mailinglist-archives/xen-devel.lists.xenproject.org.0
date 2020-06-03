Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489131ED1B2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 16:07:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgU2b-0001DG-Vl; Wed, 03 Jun 2020 14:06:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecxI=7Q=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jgU2a-0001DB-4V
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 14:06:48 +0000
X-Inumbo-ID: 761d2a08-a5a3-11ea-81bc-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 761d2a08-a5a3-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 14:06:47 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id e2so2277564eje.13
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rdDXsiPxGSJU2BtwbPhpcMj2P5mFJwWwZcKY6DLpIbw=;
 b=HSnDEB2SMNO4n9KsnRD//6k/52vtDufIxaSIpwL/58X6YZDCZpHaCMoY74Ki4C+EP5
 36RajTCquG2qBIK+W5IV5LL4tTXO7ePdJlPTITDQXOeeSrTsnqqb1SL877kewz6hIo3B
 koLMs83qaGmwPBrOpQHGfrmxzlK/eD/1W1+Oho9g2Db7CdpAjlqGnwx9W+iLC0RGyxOn
 au3OYlccTtMUYt1n4UByJNav/hNMS3J5dY1g74yV3Wur6qBrLkgsUmC663aVKugJgEn0
 A158lSvknQVVyf1CXOEbIB0/7xlEmnG12XihepuDUsieYI5tGrJ1+vbKsSsQYKnkcbnG
 6WdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rdDXsiPxGSJU2BtwbPhpcMj2P5mFJwWwZcKY6DLpIbw=;
 b=lWljiaJfAown907s31AOrNcKE4mXOBcyGss0IZNhZtNIxz3oOL6pVA/srlLhjfwYUd
 C8kHgc+UmHuKJTtHJCROVRqZ/Mjq6DAS255tEKhwDHgN4UWPmCo5i9DDsUKkSZopkFUP
 12MVRaUZnNCRCTXbfaF4W2QSujZ2ackv6VgblcawuCtM7uk40pK5qCyxtZH+6Z1M13e+
 bCWTW75uIY2K6y9ny9Bl7xeOjUnlYgWLSLBWvvDQCYVT9QsDZFn6jTiVVtYklCGP65RK
 f/hixjuFUSiunWBwJEex3NoPDxSgKy4D0LpRR2d92XBWnw/hLk8v9wrK6DT6il799tMY
 UpCQ==
X-Gm-Message-State: AOAM532nseEmS7cT31vBBfy7ig8VlEJDPg4308bwFvQ1URNjXAHo+wS8
 8q/Gmsmv2yYiK+Dhyru5MSIRyPrfOf8=
X-Google-Smtp-Source: ABdhPJwXWaFYtdEiDKU2C6gfDcx03M6ZL22N6597CHY8WoN/KbdNPamfdEi8WVptWt5qJaAtm6cS0w==
X-Received: by 2002:a17:906:1d5b:: with SMTP id
 o27mr20959702ejh.344.1591193206082; 
 Wed, 03 Jun 2020 07:06:46 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id ce23sm1276985edb.79.2020.06.03.07.06.45
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 07:06:45 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id e1so2530281wrt.5
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 07:06:45 -0700 (PDT)
X-Received: by 2002:adf:f0c6:: with SMTP id x6mr33671775wro.301.1591193204812; 
 Wed, 03 Jun 2020 07:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200602134909.66581-1-tamas@tklengyel.com>
 <20200603082824.GC1195@Air-de-Roger>
 <CABfawhnfwMrEYhhsQik_SjVZ2qqL2L2UaSQ6zdR5uBEWvvN8=g@mail.gmail.com>
 <20200603135656.GE1195@Air-de-Roger>
In-Reply-To: <20200603135656.GE1195@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 3 Jun 2020 08:06:08 -0600
X-Gmail-Original-Message-ID: <CABfawh=tNFvb3_v0jHbMmtKhfHHz5Ok4cmXHDAQntGymgbC2Qg@mail.gmail.com>
Message-ID: <CABfawh=tNFvb3_v0jHbMmtKhfHHz5Ok4cmXHDAQntGymgbC2Qg@mail.gmail.com>
Subject: Re: [PATCH v3 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 3, 2020 at 7:57 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Wed, Jun 03, 2020 at 06:25:31AM -0600, Tamas K Lengyel wrote:
> > On Wed, Jun 3, 2020 at 2:28 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.c=
om> wrote:
> > >
> > > On Tue, Jun 02, 2020 at 07:49:09AM -0600, Tamas K Lengyel wrote:
> > > > diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.=
c
> > > > index 8aa14137e2..36894b33a4 100644
> > > > --- a/xen/arch/x86/hvm/monitor.c
> > > > +++ b/xen/arch/x86/hvm/monitor.c
> > > > @@ -53,11 +53,11 @@ bool hvm_monitor_cr(unsigned int index, unsigne=
d long value, unsigned long old)
> > > >              .u.write_ctrlreg.old_value =3D old
> > > >          };
> > > >
> > > > -        if ( monitor_traps(curr, sync, &req) >=3D 0 )
> > > > -            return 1;
> > > > +        return monitor_traps(curr, sync, &req) >=3D 0 &&
> > > > +            curr->domain->arch.monitor.control_register_values;
> > >
> > > Nit (it can be fixed while committing IMO): curr should be aligned to
> > > monitor.
> >
> > This is the established style already in-place, see
> > http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/arch/x86/hv=
m/monitor.c;h=3D8aa14137e25a47d3826843441e244decf81dc855;hb=3Drefs/heads/st=
aging#l76:
> >
> >   76     return curr->domain->arch.monitor.emul_unimplemented_enabled &=
&
> >   77         monitor_traps(curr, true, &req) =3D=3D 1;
> >
> > I don't really care either way but at least we should be consistent.
>
> Oh, OK. This is slightly different from the indentation that I tend to
> use, sorry for the request then.

I made the change regardless. Feel free to re-adjust the style or
change the alignment of the above return on commit.

Thanks,
Tamas

