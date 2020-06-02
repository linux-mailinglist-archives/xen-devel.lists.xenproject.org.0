Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F371EBC8E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:09:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6fl-0004Kj-Vz; Tue, 02 Jun 2020 13:09:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr0K=7P=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jg6fk-0004KU-GS
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:09:40 +0000
X-Inumbo-ID: 50deddee-a4d2-11ea-9947-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50deddee-a4d2-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 13:09:40 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id k11so12681099ejr.9
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y0VI3BFaJ2TpWY0+LCvNtzL2bHJDl3kh0XWsQa1fc7Q=;
 b=c/6K4uTPOziyS0c5akldbuiokBOj9ahySML4TFYdwByyqZAnkT2IzIXOYkBTP8u1Mg
 mjZh32ABUg5lBo2XVTGHKzKGYiA9YEgR7dHWye+bddFpO883fMJfKb/bXY1Pf1flYZRm
 DJK8x/PwZCvmmoUrOsxeZ6tqlMxHy+QEOsNZ6Y/ApVWsB+8JVJ1rqbp2yLlGQaOKDxln
 W0enF2ThtIuPXEwjR8+RYmVuh9WlTIH9HcyqxE5CYyj0BnuUvCRxlg1krX9TBh3xB3/4
 4Ezc3XRmQXX2UVor0HkKa6Yq0+KULtTo0bXdME0BvLhcWcT+52q9yr9bHm1IBtxvRCNN
 OsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y0VI3BFaJ2TpWY0+LCvNtzL2bHJDl3kh0XWsQa1fc7Q=;
 b=OJssEOjjqnfWbe2XqXDHIEVvEYYbWbOtDRO7Bf8TUeTp87KUltSd3GLSAq4VOppJTZ
 xti8DJgdLEvWhiGslvzwp/a9ZqS70kntGIHYvuZMgxmh73FIJmTJL792sWWWQ0cND/4e
 4xDXNwWHgNjpaQMMw5D0/rzvyGgVsEFTEVIMZX+SsOXiwGEUzMFfl87I3GyymlAu9Qwj
 FHZ/t0B5PEM6dVtJtQVweiRAAU9Fmp5kGjpDbe4r1SWqiqAP/5Djt4vtbxCArEmpERBE
 GvQkkwtvAlUpCD+QJTFyWvFBuesTnkH94Igd8Us4JQcvaBIRXtS6PSWROavaNcjtxdvZ
 z9Ew==
X-Gm-Message-State: AOAM531Afov3sSes2CAoQNVEkMRzYY+YgBkILUqLkkROiieYIPvi5gcm
 GNflz5heUVYjhUbZ13zucbzDrPwxn8o=
X-Google-Smtp-Source: ABdhPJzgc419qfArCFHDWP4/MrHBSYYCoWpyikl8SJOghuN2dKYU7AahlElj6EtYdMFVBZZgCHwnEw==
X-Received: by 2002:a17:906:c7da:: with SMTP id
 dc26mr1875344ejb.500.1591103378756; 
 Tue, 02 Jun 2020 06:09:38 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id bs1sm1535751edb.43.2020.06.02.06.09.38
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 06:09:38 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id v19so2883266wmj.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 06:09:38 -0700 (PDT)
X-Received: by 2002:a05:600c:23ce:: with SMTP id
 p14mr4108328wmb.77.1591103377846; 
 Tue, 02 Jun 2020 06:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590028160.git.tamas@tklengyel.com>
 <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
 <20200602110223.GW1195@Air-de-Roger>
 <CABfawh=NST0Vq+O5UCqyCxt1z2O9pcES_DQon4-cs9w0TPOuJQ@mail.gmail.com>
 <20200602130114.GZ1195@Air-de-Roger>
In-Reply-To: <20200602130114.GZ1195@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 2 Jun 2020 07:09:01 -0600
X-Gmail-Original-Message-ID: <CABfawhkkSuFdSNp9vNSjrp7j5X5gTeBxn2mcnWXcnyhq-NqOdA@mail.gmail.com>
Message-ID: <CABfawhkkSuFdSNp9vNSjrp7j5X5gTeBxn2mcnWXcnyhq-NqOdA@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
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

On Tue, Jun 2, 2020 at 7:01 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Tue, Jun 02, 2020 at 06:40:12AM -0600, Tamas K Lengyel wrote:
> > On Tue, Jun 2, 2020 at 5:08 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.c=
om> wrote:
> > >
> > > On Wed, May 20, 2020 at 08:31:52PM -0600, Tamas K Lengyel wrote:
> > > > Extend the monitor_op domctl to include option that enables
> > > > controlling what values certain registers are permitted to hold
> > > > by a monitor subscriber.
> > >
> > > I think the change could benefit for some more detail commit message
> > > here. Why is this useful?
> >
> > You would have to ask the Bitdefender folks who made the feature. I
> > don't use it. Here we are just making it optional as it is buggy so it
> > is disabled by default.
> >
> > >
> > > There already seems to be some support for gating MSR writes, which
> > > seems to be expanded by this commit?
> >
> > We don't expand on any existing features, we make an existing feature o=
ptional.
> >
> > >
> > > Is it solving some kind of bug reported?
> >
> > It does, please take a look at the cover letter.
>
> Please copy the relevant bits here for reference.

Sure. As things stand I'm dropping patch 2 & 3 anyway so I'll just use
the cover letter as the commit message.

Tamas

