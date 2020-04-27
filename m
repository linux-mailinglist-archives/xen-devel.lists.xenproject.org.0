Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C551B98F0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 09:45:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSyRi-0002jd-TD; Mon, 27 Apr 2020 07:44:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbbE=6L=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jSyRh-0002jV-BU
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 07:44:53 +0000
X-Inumbo-ID: faad5060-885a-11ea-ae69-bc764e2007e4
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id faad5060-885a-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 07:44:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id y24so19322482wma.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 00:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=g6pM6x7gWp0YETTZ6dn06MEPiM8VR9+qkaMRBEgIvJ8=;
 b=SRigLwwr5De/BO6748ot9+kpyuTZSu4QNyYz64rvaYfop2GrQFP0nXrArxWeJP0l54
 0mxivZSX1OJjB8csrkB/dpfMIoUaxRKwo9wS/A4Bxwrj0Rf7tT26VZHK27y8x4655Av1
 yNd5qAlW4WFZaRQvJEDgeHaeUE08FWfAc62PTUJ4Ds8eOOVFjmCtukTVxw+ydtfsqPed
 8AX3V3Rhzrlqig+MQkZYCcZtmkIa3H+SB/zhAy3G6EWafnnClegZm/Qmkcjkxz8KWimN
 y+orwc8R6EZ8au8oKqUWkyGEbh0orhj948/0EjGGc14+ZilTy2GgNs2uTMjQdkpzx8cW
 sJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=g6pM6x7gWp0YETTZ6dn06MEPiM8VR9+qkaMRBEgIvJ8=;
 b=dCz2LhZ6IWTlPogjHbKiCZ6LujLn9kQ3tPZFQpLn/AISh1ekCuf7E4MauXE2w4t8ci
 f4Z6aJHaS4yQL3xyKucH/Q8CufguH0gtkLDlcXiiYl1UpL2aR3gyT28hXPfjvKgSc7I1
 z2Y68n3xkTxFLYii4gt8hwU4Bps0ziCVGrSy2YJeiTVcAvNKHVwGumbttIni/5pGj6RX
 93FmRYVbjvBw3Qh7SsqQwOD1zIyKy1IVaySaBSCitPkEsTKbWV5/XpwAHKeCszdf3/mf
 EXmGIRUUlSCwP5J4EC8VHFH1lWSwzR2j5/CfwpTwz/RZXYsL5Rajq02Obech3D6ZBvgM
 OxVA==
X-Gm-Message-State: AGi0PuYKz0f3T3KnhomQnK54SB3qoTH/S5PLM4mLbEcdzg6HPPzZ7F1v
 wxbseL2C8LGfimoRektAouc=
X-Google-Smtp-Source: APiQypIwhbHAz3bXtuMpMSJgb+iC889k2+S14nqii22IxN8UVSobf2zmihJ2q7mpqMinL6X6LnZcPg==
X-Received: by 2002:a1c:dc55:: with SMTP id t82mr26327745wmg.12.1587973491882; 
 Mon, 27 Apr 2020 00:44:51 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id v7sm13126966wmg.3.2020.04.27.00.44.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 00:44:51 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200424133736.737-1-paul@xen.org>
 <0736f34f-77a1-6e75-138f-06806c970d9b@suse.com>
In-Reply-To: <0736f34f-77a1-6e75-138f-06806c970d9b@suse.com>
Subject: RE: [PATCH] docs/designs: re-work the xenstore migration document...
Date: Mon, 27 Apr 2020 08:44:50 +0100
Message-ID: <000601d61c67$bbd647c0$3382d740$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIqV5bkCWemUTYZznnWnEmKpB0tyAGsFIK3p9a/THA=
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
Reply-To: paul@xen.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 27 April 2020 08:42
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>
> Subject: Re: [PATCH] docs/designs: re-work the xenstore migration =
document...
>=20
> On 24.04.20 15:37, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > ... to specify a separate migration stream that will also be =
suitable for
> > live update.
> >
> > The original scope of the document was to support non-cooperative =
migration
> > of guests [1] but, since then, live update of xenstored has been =
brought into
> > scope. Thus it makes more sense to define a separate image format =
for
> > serializing xenstore state that is suitable for both purposes.
> >
> > The document has been limited to specifying a new image format. The =
mechanism
> > for acquiring the image for live update or migration is not covered =
as that
> > is more appropriately dealt with by a patch to =
docs/misc/xenstore.txt. It is
> > also expected that, when the first implementation of live update or =
migration
> > making use of this specification is committed, that the document is =
moved from
> > docs/designs into docs/specs.
>=20
> Can we please add a general remark:
>=20
> Records depending other records (e.g. watch records referencing a
> connection record via a connection-id, or node records for a node
> being a child of another node in the stream) must always be located
> after the record they depend on.
>=20

Sure. I'll call that out at the beginning of the records section.

  Paul

>=20
> Juergen


