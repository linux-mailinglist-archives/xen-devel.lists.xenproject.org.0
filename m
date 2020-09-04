Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 243E425D564
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 11:47:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE8Jl-0005TK-W3; Fri, 04 Sep 2020 09:47:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qam=CN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kE8Jj-0005T8-Tn
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 09:47:35 +0000
X-Inumbo-ID: 60be002f-f91c-4af0-a542-1fa9f6b42639
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60be002f-f91c-4af0-a542-1fa9f6b42639;
 Fri, 04 Sep 2020 09:47:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e11so7150872wme.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2020 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=k7+uv95vSWCfYY1cvgXJXIzUO42P7G0T5aDoqt8dY7U=;
 b=XsvOut0yAOoqR+8YjAmjDVXMznECJEL+4IcguP97t4jjEFyVlKwMen0Dl/kGiLNiZx
 7i50vQ5nu4R66StJqGqN7+9gQFoIQcT24oVMrkfbdA92wIRDVSpUlXkxU42dei1lSrz7
 lL+pmIhzPgNOICtJsTCNm3nRoUcjpFYw9b/OSkCOJ7AySdt+e4PVE3nULpTptiYXQkK6
 1vhJNWXej7jsoTV48BaEsui3e4zyHWw3j2ff15zB4tB3RxirRbFdvZ3IHpZh/7uMjqgq
 xmg8xAnW1RooDDHW2ESBlWwsl83UDKE0+9bNnpI5JUuaHcHyne3SnG0L5rT08iuCxxYH
 +ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=k7+uv95vSWCfYY1cvgXJXIzUO42P7G0T5aDoqt8dY7U=;
 b=CeZ6iCijWJvGp8KSnrsNcw/6e9vyd9kp4qHg1+95bcgkDQax6ikTz3HoFjxPtzdWl1
 3QLIapz28VAH5Uo4sy+hTy6Vtay+tk2UEcraqQY8TjCYlijxs4azFtiV25SpkFnTbavy
 yWX5X4IfSfCDs7qhH7bJYLQ/Ln+np1R3wO07dcYUXcFa8kMjzXoS/MV6hGddl/81CQ+x
 5ebXtD3IRhkOgRoSrFD9VHYWgbiTokr9KNRx2U77EwXLIKveuNtwBUSVnJeCaPeEB+st
 WcH/zjFdjeAQb103bIzaJJFMVJKyARClBqUkur5AkxQEF9AOaQFhhwfI/TzeiToITzZm
 CzyQ==
X-Gm-Message-State: AOAM530xCkjVSRCWuSi1KrfJ4TcCy2UpMPSdOwiYGYy90sfudBDkFp7r
 2G6sZ8Y6eij+0xZ0aX0KJGQ=
X-Google-Smtp-Source: ABdhPJwgd6+GvMmu5q6DfzZnE9u+QNh+NJke+A+qRBuXjG8ZEmSFX1XVzQXKv2yQw5Ksf0ikHUXxwA==
X-Received: by 2002:a1c:cc0c:: with SMTP id h12mr6420220wmb.57.1599212854314; 
 Fri, 04 Sep 2020 02:47:34 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:c940:c3c6:26f0:df49])
 by smtp.gmail.com with ESMTPSA id r13sm10494541wrj.83.2020.09.04.02.47.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 02:47:33 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Ian Jackson'" <iwj@xenproject.org>, "'Wei Liu'" <wl@xen.org>,
 "'Anthony PERARD'" <anthony.perard@citrix.com>
References: <20200903100537.1337-1-paul@xen.org>
 <20200903100537.1337-3-paul@xen.org> <20200904085244.GO753@Air-de-Roger>
In-Reply-To: <20200904085244.GO753@Air-de-Roger>
Subject: RE: [PATCH 2/2] libxl: do not automatically force detach of block
 devices
Date: Fri, 4 Sep 2020 10:47:37 +0100
Message-ID: <002501d682a0$6c930140$45b903c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHGz3syrbMjORisLydTb23Y+s+HEQGeZO2qAplJL+6pVePY0A==
Content-Language: en-gb
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 04 September 2020 09:53
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Ian Jackson
> <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Anthony PERARD =
<anthony.perard@citrix.com>
> Subject: Re: [PATCH 2/2] libxl: do not automatically force detach of =
block devices
>=20
> On Thu, Sep 03, 2020 at 11:05:37AM +0100, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > The manpage for 'xl' documents that guest co-operation is required =
for a (non-
> > forced) block-detach operation and that it may consequently fail. =
Currently,
> > however, the implementation of generic device removal means that a =
time-out
> > of a block-detach is being automatically re-tried with the force =
flag set
> > rather than failing. This patch stops such behaviour.
>=20
> Won't this break cleanup on domain shutdown if the guest doesn't close
> the devices itself?
>=20

I don't think so... AFAIK that's a destroy i.e. it's always forced =
(since there's no way the guest can co-operate at the point).

> I think we need some special-casing on shutdown that keeps the current
> behavior on that case.
>=20
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > ---
> > Cc: Ian Jackson <iwj@xenproject.org>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  tools/libxl/libxl_device.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/libxl/libxl_device.c b/tools/libxl/libxl_device.c
> > index 0381c5d509..d17ca78848 100644
> > --- a/tools/libxl/libxl_device.c
> > +++ b/tools/libxl/libxl_device.c
> > @@ -1092,7 +1092,8 @@ static void device_backend_callback(libxl__egc =
*egc, libxl__ev_devstate *ds,
> >
> >      if (rc =3D=3D ERROR_TIMEDOUT &&
> >          aodev->action =3D=3D LIBXL__DEVICE_ACTION_REMOVE &&
> > -        !aodev->force) {
> > +        !aodev->force &&
> > +        aodev->dev->kind !=3D LIBXL__DEVICE_KIND_VBD) {
>=20
> Doing this differentiation for block only seems weird, we should treat
> all devices equally.
>=20

That is not how things are documented in the xl manpage though; =
block-detach is the only one to have a force option. I assume that was =
deliberate.

  Paul

> Thanks, Roger.


