Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE59013F2
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jun 2024 01:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736779.1142840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sG5BI-0007S5-BL; Sat, 08 Jun 2024 23:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736779.1142840; Sat, 08 Jun 2024 23:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sG5BI-0007Q8-8c; Sat, 08 Jun 2024 23:09:04 +0000
Received: by outflank-mailman (input) for mailman id 736779;
 Sat, 08 Jun 2024 23:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ovq7=NK=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sG5BH-0007Q2-EL
 for xen-devel@lists.xenproject.org; Sat, 08 Jun 2024 23:09:03 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 168b6bb5-25ec-11ef-b4bb-af5377834399;
 Sun, 09 Jun 2024 01:09:01 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-250e4c4d650so1660471fac.2
 for <xen-devel@lists.xenproject.org>; Sat, 08 Jun 2024 16:09:00 -0700 (PDT)
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
X-Inumbo-ID: 168b6bb5-25ec-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717888139; x=1718492939; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7L9vV3dhgZONH3ptEOr5Jmb57jUsakuPocb/rHAHRgc=;
        b=cZEeijQNcTPfuQVLAaTCqDyaqruVqTDJP7Kq7f4q+WjoqNVhhetTcYz9p9wuKTUOUS
         wS4UeVYzJyIe+LK7DzAFuKitNK6+XxpEOkryo9JG9ZIJz1T5fwqX5lJpa2bUyCETB2bV
         adsIN1HwTQzjMhfxrRq9alEXItmcuvr2Z47Mzl99xvGNpndJ0/DxP9iwodtFVinfTdXr
         h8ROFZXsmsg/+RdJcGlw+AlB2+Gzv8w2s0nJUzHMgSHWPfs4du+yEtQ27Kxp9y+TwzMV
         nSirtzfFMlA5Jpa7recpTcNFVyWj0BD3leGTvJ6d+D3w4zEcTbmhsytcCqskxr7TmHTZ
         O0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717888139; x=1718492939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7L9vV3dhgZONH3ptEOr5Jmb57jUsakuPocb/rHAHRgc=;
        b=ghzVFSV4up26w8EIu9vH8VAaypZlV5R7Vq67RqfijeEFXRuhHvBrF85mTczK6xGZND
         WPBJVvpGamxzf3WLDCkKZVdtzeuViWxTTaUaP3vGvtyTB25/J1zf/k3frpcnvqwTxGCZ
         49Nz48+yUJNVxpYaG645VnmzOHefmjOgim82TREe/E3z48rN7EXkrPv0fA2qI0ekLepX
         9PeRwX3r5oYGUWfaXApvzLZJDV/LHLTXJWG9/DUopwsllR0ZxfDR9VLXiN1jWK+G3c4H
         7O1P20Wym8GwgSwrTs6ymqERVHDtZIEXVXaH/h2wrTrb3XQZ2/uXQHbJFnbqBir8XrYo
         oZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCUAo0eYahVl7MV67HvpyBqVC6WkoZ+q0WFw/BJL47j/jI6LwQtDSnJHA9t98hsbIzJKfe8wb1OMmSTHlIn/8Vpc0LpDVhtz4hYT+EmX1Qg=
X-Gm-Message-State: AOJu0YxicZafcR9wh17AHAbv59iikRkvErT069ekDIXw9VnD1CW8Qn7I
	yvKm1RYG7zb4IBYFlTXHQYSt2HO8q0FdA6zWxzmmIURLTJTa9LCV/uPex3TaCw1xYoL55tAD3jX
	3x8t0XvcjPADDsRel4L0sJBXC63g=
X-Google-Smtp-Source: AGHT+IEDK8jNM0ovWLj5srWB7RE/aLhEQEu5+m518NFjLnGw/1Vb1QW5LfwMsbE7NROQeyMwblzud3wlY4M9+c2crbA=
X-Received: by 2002:a05:6870:3107:b0:24c:b0ca:9650 with SMTP id
 586e51a60fabf-254644641edmr7126863fac.1.1717888138542; Sat, 08 Jun 2024
 16:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717356829.git.w1benny@gmail.com> <d6fd97b66b5f1a974e317c9d3f72fb139b39118f.1717356829.git.w1benny@gmail.com>
 <8936b5ef-1ef7-4606-9f19-c75287aa88fa@suse.com>
In-Reply-To: <8936b5ef-1ef7-4606-9f19-c75287aa88fa@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Sun, 9 Jun 2024 01:08:47 +0200
Message-ID: <CAKBKdXi9uiADe+rXyHSd6HV3A-MvT04fgJAdJA=LNuYOr2Eedw@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v5 09/10] xen/x86: Disallow creating domains
 with altp2m enabled and altp2m.nr == 0
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The flag isn't bool. It can hold one of 3 values (besides 0).

P.

On Thu, Jun 6, 2024 at 9:57=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.06.2024 22:04, Petr Bene=C5=A1 wrote:
> > From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >
> > Since libxl finally sends the altp2m.nr value, we can remove the previo=
usly
> > introduced temporary workaround.
> >
> > Creating domain with enabled altp2m while setting altp2m.nr =3D=3D 0 do=
esn't
> > make sense and it's probably not what user wants.
>
> Yet: Do we need separate count and flag anymore? Can't "nr !=3D 0"
> take the place of the flag being true?
>
> Jan

