Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5430C62C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 17:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80656.147667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yl1-0002ut-Db; Tue, 02 Feb 2021 16:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80656.147667; Tue, 02 Feb 2021 16:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yl1-0002uU-AR; Tue, 02 Feb 2021 16:42:27 +0000
Received: by outflank-mailman (input) for mailman id 80656;
 Tue, 02 Feb 2021 16:42:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtUW=HE=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l6yl0-0002uO-9b
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 16:42:26 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a09bd907-abea-44ab-8d69-0271c9986d12;
 Tue, 02 Feb 2021 16:42:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z6so21121453wrq.10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 08:42:25 -0800 (PST)
Received: from CBGR90WXYV0 (host86-190-149-163.range86-190.btcentralplus.com.
 [86.190.149.163])
 by smtp.gmail.com with ESMTPSA id b4sm32480479wrn.12.2021.02.02.08.42.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2021 08:42:23 -0800 (PST)
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
X-Inumbo-ID: a09bd907-abea-44ab-8d69-0271c9986d12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=STneyShm0vCPYM4l3wpr4D69jWlxGiJ4g4tzZ7/33lE=;
        b=Z8h1xH9LrCIPbnUzDhB6+8OgUVkaq3lMCCgyLN0ZPUv8uKh1CGeCtexXpijdWGeEdR
         GmuMpknz9Xi/KKlCXJNdmCykqb7XMrDbl1hQeONsplw0h5K7DxwcmeBHPTqhf/n1FwSl
         twSkencRK6PL1ThnkyhuV9IKTwtSLwmBLvCqYEzPgYOevXeJRrABOjSSgyK7nG+nfMv7
         LDAUDusE6mxPyKTsXFh2FcyPBev6/DzxmoHcZbXvChChWJxHY74FbieBOcnEIessfNAs
         mk6DBnsjmySGjFkdSOqoy39WYd6OgG1pU+/6SX5SG2SNErZj1nSPVoQdbah0wjMck+ji
         b7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=STneyShm0vCPYM4l3wpr4D69jWlxGiJ4g4tzZ7/33lE=;
        b=brBOZpxpdZz3PUytMXP9WfMnRBt6ODFu2GX4Gx/GC3ZdOd1gS719SnSEDmf3SLfvYi
         pxZuMyMPLwUIZBntECg/o8GkgK0js+GWgBMHdXDxCUmAiv1cEZ3NQaiffSguNnJrOC03
         rW3yWJwVM9HECGKLeOnfi0zhwVbKL9gS8Dp+tOVRHbi1qGb5RgLTONOAyTbt8p7y2utt
         Ya5Q4gP3UsZTNK1kaT7u0/VA2ZvQ6VSO1km/7vZQvXLDSQn/IOrywfApql2vRmQnvGCu
         e7dunp47unJY8hfEluSUeBAtQvyQ3h8IT++LPwnrUSDpck7kMaLqnZ4ZCGxfcaomAgOx
         qyEQ==
X-Gm-Message-State: AOAM530Km5r1M5KDaxm/vKnsOKwjzOqGMjQcDZ8efp4rFfdT1Iv5IZOl
	B7ilq+P17DUKkXTbtwzuUFU=
X-Google-Smtp-Source: ABdhPJy2nnGmtTJ3TUqoRthgCxgYu0/DthvxcvL9h7iYFq5Z3OEkSPZ7bmrdl5r8eH8nbB7nJSHkNg==
X-Received: by 2002:adf:f891:: with SMTP id u17mr24929982wrp.253.1612284144489;
        Tue, 02 Feb 2021 08:42:24 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
	<linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	"'Paul Durrant'" <pdurrant@amazon.com>,
	"'Konrad Rzeszutek Wilk'" <konrad.wilk@oracle.com>,
	"'Jens Axboe'" <axboe@kernel.dk>,
	"'Dongli Zhang'" <dongli.zhang@oracle.com>
References: <20210128130441.11744-1-paul@xen.org> <YBl9ycif3bG/Y+eR@Air-de-Roger>
In-Reply-To: <YBl9ycif3bG/Y+eR@Air-de-Roger>
Subject: RE: [PATCH v2] xen-blkback: fix compatibility bug with single page rings
Date: Tue, 2 Feb 2021 16:42:22 -0000
Message-ID: <037601d6f982$61e34f80$25a9ee80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQESWKuFsxkk/iz7Hd1VT64wNwq0EAFvpAqOq8LV10A=
Content-Language: en-gb

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 02 February 2021 16:29
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; linux-block@vger.kernel.org; =
linux-kernel@vger.kernel.org; Paul
> Durrant <pdurrant@amazon.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; Jens Axboe
> <axboe@kernel.dk>; Dongli Zhang <dongli.zhang@oracle.com>
> Subject: Re: [PATCH v2] xen-blkback: fix compatibility bug with single =
page rings
>=20
> On Thu, Jan 28, 2021 at 01:04:41PM +0000, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to =
avoid
> > inconsistent xenstore 'ring-page-order' set by malicious blkfront"), =
the
> > behaviour of xen-blkback when connecting to a frontend was:
> >
> > - read 'ring-page-order'
> > - if not present then expect a single page ring specified by =
'ring-ref'
> > - else expect a ring specified by 'ring-refX' where X is between 0 =
and
> >   1 << ring-page-order
> >
> > This was correct behaviour, but was broken by the afforementioned =
commit to
> > become:
> >
> > - read 'ring-page-order'
> > - if not present then expect a single page ring (i.e. =
ring-page-order =3D 0)
> > - expect a ring specified by 'ring-refX' where X is between 0 and
> >   1 << ring-page-order
> > - if that didn't work then see if there's a single page ring =
specified by
> >   'ring-ref'
> >
> > This incorrect behaviour works most of the time but fails when a =
frontend
> > that sets 'ring-page-order' is unloaded and replaced by one that =
does not
> > because, instead of reading 'ring-ref', xen-blkback will read the =
stale
> > 'ring-ref0' left around by the previous frontend will try to map the =
wrong
> > grant reference.
> >
> > This patch restores the original behaviour.
> >
> > Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid =
inconsistent xenstore 'ring-page-
> order' set by malicious blkfront")
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > ---
> > Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Cc: Dongli Zhang <dongli.zhang@oracle.com>
> >
> > v2:
> >  - Remove now-spurious error path special-case when nr_grefs =3D=3D =
1
> > ---
> >  drivers/block/xen-blkback/common.h |  1 +
> >  drivers/block/xen-blkback/xenbus.c | 38 =
+++++++++++++-----------------
> >  2 files changed, 17 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/block/xen-blkback/common.h =
b/drivers/block/xen-blkback/common.h
> > index b0c71d3a81a0..524a79f10de6 100644
> > --- a/drivers/block/xen-blkback/common.h
> > +++ b/drivers/block/xen-blkback/common.h
> > @@ -313,6 +313,7 @@ struct xen_blkif {
> >
> >  	struct work_struct	free_work;
> >  	unsigned int 		nr_ring_pages;
> > +	bool                    multi_ref;
>=20
> You seem to have used spaces between the type and the variable name
> here, while neighbors also use hard tabs.
>=20

Oops. Xen vs. Linux coding style :-( I'll send a v3 with the whitespace =
fixed.

> The rest LGTM:
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> We should have forbidden the usage of ring-page-order =3D 0 and we =
could
> have avoided having to add the multi_ref variable, but that's too late
> now.

Thanks. Yes, that cat is out of the bag and has been for a while =
unfortunately.

  Paul

>=20
> Thanks, Roger.


