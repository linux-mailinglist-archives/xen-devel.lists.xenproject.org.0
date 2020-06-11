Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D461F6BC8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 18:03:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjPfM-00070O-Nt; Thu, 11 Jun 2020 16:02:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XPau=7Y=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jjPfK-00070F-H5
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 16:02:54 +0000
X-Inumbo-ID: 01aea7d6-abfd-11ea-8496-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01aea7d6-abfd-11ea-8496-bc764e2007e4;
 Thu, 11 Jun 2020 16:02:53 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e12so4317445eds.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2020 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=fieSuTKybFsX234xt5yqCEbzbTy1MXTi84Hn9pJEors=;
 b=Uiuf3tZN4skgKQB1nX/HFdSPYYIFdFv6wD7IrueQt2ZTqHWEk6lis7HWv55IMX4tui
 kXYNIjUGfwwQ42xCMwRGjDEa7ZnuKsGZPuVfVl2Pp6Cdxr37ko7f5opuT3HG9iYRjtgJ
 TatyXIMDvW/9qNhmu+nnrL2HbsQWGw5YZm8PLXLjr/wtc+8ATpZrJuT9JWuWYzXPIjZg
 l6qwtzl/5/WInHYeNbSEZEQGjI5uJWgKauty0IZ6iSBOa0g3EtqHOu9Rczr/0/f1Co1R
 hVVRHaVGzg1DwRXGj55qfn2+YZu2EJWVpQuiX/DMoT4d+SN8ycPbS9FD3fz0iAAAKcYP
 lwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=fieSuTKybFsX234xt5yqCEbzbTy1MXTi84Hn9pJEors=;
 b=rrsj1RN7uBEzBjAQhcj3LzqChKpKAcl2L621uUBdgwNK+HNnMRLKKx1Wm48fiwGGTe
 s4ewjatbRDDk0GJCrZT6Ho+DNdR22CECv8wQ8Bl56iLm+lPnuGxedaDd/IUL1PxCJeHM
 vPiX7JYEpVOgA8yKeRad0ZHNjpR9q5IECCtrhOROuc7gdepMyu/YmzKaEbLiJT4eo44B
 d+qUBEg6anfRUjgXn5HoG/RDWovY/nqb3tdTphy6DTnuMVgY5A3sI6Ph0C9YcUd6tN0o
 hYIfJ8crcbIdQUYdKffihFpoZJu4d2MNqN2s+ZFoT00+FLOBjqDuDeC4hHWvduMRe1Ha
 q/qw==
X-Gm-Message-State: AOAM532bvfqXWr822feSqibVF0/0v/NwNqlFvEIhVbYRM9IqXA1c3Itx
 RBBKVUjtuG/lTzwgxTdnSgdBRCSu2as=
X-Google-Smtp-Source: ABdhPJx+9edIOgqhkS/lV90/2BfA6PZasUQjZkl/M17rcSXIHLOplT7XtZgfcxF4+eSmG3GvAxPbXg==
X-Received: by 2002:aa7:da42:: with SMTP id w2mr7438090eds.176.1591891372778; 
 Thu, 11 Jun 2020 09:02:52 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.177])
 by smtp.gmail.com with ESMTPSA id r6sm1745935edq.44.2020.06.11.09.02.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jun 2020 09:02:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Ian Jackson'" <ian.jackson@citrix.com>
References: <20200520083501.31704-1-jgross@suse.com>
 <24261.17303.413916.29534@mariner.uk.xensource.com>
 <20200520155621.GN54375@Air-de-Roger>
 <05eac1e1-63a3-1d03-9f91-d0ffdcc44f23@suse.com>
In-Reply-To: <05eac1e1-63a3-1d03-9f91-d0ffdcc44f23@suse.com>
Subject: RE: [PATCH] tools/libxengnttab: correct size of allocated memory
Date: Thu, 11 Jun 2020 17:02:50 +0100
Message-ID: <00f701d64009$c2c10000$48430000$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIVhxV/SuXpRtXvUPa7QsiXjxPi4QIA6nlWAgDMDjIBt3lgyKgnO6jA
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
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
J=C3=BCrgen Gro=C3=9F
> Sent: 11 June 2020 16:26
> To: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Ian Jackson =
<ian.jackson@citrix.com>
> Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH] tools/libxengnttab: correct size of allocated =
memory
>=20
> On 20.05.20 17:56, Roger Pau Monn=C3=A9 wrote:
> > On Wed, May 20, 2020 at 03:49:59PM +0100, Ian Jackson wrote:
> >> Juergen Gross writes ("[PATCH] tools/libxengnttab: correct size of =
allocated memory"):
> >>> The size of the memory allocated for the =
IOCTL_GNTDEV_MAP_GRANT_REF
> >>> ioctl() parameters is calculated wrong, which results in too much
> >>> memory allocated.
> >>
> >> Added Roger to CC.
> >>
> >> Firstly,
> >>
> >> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> >
> > For the FreeBSD bits:
> >
> > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Any reason the patch didn't go in yet?
>=20

I'd be quite happy for this to go in now, consider it

Release-acked-by: Paul Durrant <paul@xen.org>

>=20
> Juergen



