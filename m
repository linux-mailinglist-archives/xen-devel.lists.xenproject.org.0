Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96876914409
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746176.1153153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeZr-0004BI-5u; Mon, 24 Jun 2024 07:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746176.1153153; Mon, 24 Jun 2024 07:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeZr-00049J-2e; Mon, 24 Jun 2024 07:57:27 +0000
Received: by outflank-mailman (input) for mailman id 746176;
 Mon, 24 Jun 2024 07:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLeZq-0002Wx-0W
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:57:26 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 650ce79c-31ff-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 09:57:25 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7245453319so177443966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:57:25 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7247895dddsm169205366b.108.2024.06.24.00.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 00:57:24 -0700 (PDT)
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
X-Inumbo-ID: 650ce79c-31ff-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719215845; x=1719820645; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AYUk6VJ8LmeMR8kwP1c9U4nk7jYUX6EJzys1MYcZb+U=;
        b=ShHWZOyfG2zm66h/uWNGCjOQWdio4gJK5RRFxJj1UYN129QR9DelE3xIIIwYBodkBk
         2UEWdW5lxr+JHZYziKc6x+g4zGn6F1OwmbKnK/9RJDjbOFo5yGe2+uUOjQppUtbljEUe
         ELs56UwGJEtPouC/tg5zv+gyHY0vHZITBVDrjovpRWFn3dL5fRx/JHtUK+0NpI0Kfhyb
         x3Qs46Cymu2ISBMKtK5xkALXijzln5r0HIOEIrtNhy0uLx3g8H9VWIaDRhhiak9vQw/I
         9ttz+UXOgP1uEmx5sqRiKsbKwAe/BzxIfeL45WadcaOX1kxju1WE/MIVXgwqYT8mMZJ1
         xE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215845; x=1719820645;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYUk6VJ8LmeMR8kwP1c9U4nk7jYUX6EJzys1MYcZb+U=;
        b=oK4PIWPy9GEoleuwjDV1C1e+nhCBIbVt/p3ZdWuq6vmUqAST+6wnqk4tP6/nRp5Rcy
         HQ8pFdOpHRwbZDP78sjb8VznSBLvSbk8qkZOSB3MtUx2WUtKhWGS+XzyWvpjMZ8iz/Tm
         TO1UXue6iNBehJ9UdRJZfbh7U8gwzyOQSS9w++8Bu4SuI1gowfzUYWlUdiMiiG/wyBiH
         freXxTGwSvzPHwS2kfB75L07dji0u6cdDREm3ypAKW8rzrO1iEMKRhvxww2Cq62PWFyX
         8dVl2r6L8csfTECBjqdhhL12VMIneXPUKQ9o/8jQ2ZLPJpNJT5TyEWHMOHykgDjvH6vu
         1WjA==
X-Gm-Message-State: AOJu0Yx95bHRMlqIwQiC+DmTrgxgsySekNmQONsw+1YG4Tb4C1vwS/Ep
	3PxgejKjj6/PdZhCOKKSobfe4Iy3yIwBityU5o9UtBQKA3qIV9V8
X-Google-Smtp-Source: AGHT+IFfH6dXRgC75He5i6g61x2sB6RMmncdYKOVT19Q6XyFCVBunqJUWIB/1Quut5riaD7MMlHA4A==
X-Received: by 2002:a17:907:a80e:b0:a72:5471:c2ce with SMTP id a640c23a62f3a-a725471c39fmr154697066b.7.1719215844876;
        Mon, 24 Jun 2024 00:57:24 -0700 (PDT)
Message-ID: <8a712dd59ac767aa7c01701b9743b54b8a612e01.camel@gmail.com>
Subject: Re: [XEN PATCH] automation/eclair: add more guidelines to the
 monitored set
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Federico Serafini
	 <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
	 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Mon, 24 Jun 2024 09:57:23 +0200
In-Reply-To: <alpine.DEB.2.22.394.2406211432140.2572888@ubuntu-linux-20-04-desktop>
References: 
	<f03398504405689413521de1675a33e50cdbc30b.1718983858.git.federico.serafini@bugseng.com>
	 <alpine.DEB.2.22.394.2406211432140.2572888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-21 at 14:33 -0700, Stefano Stabellini wrote:
> On Fri, 21 Jun 2024, Federico Serafini wrote:
> > Add more accepted guidelines to the monitored set to check them at
> > each
> > commit.
> >=20
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>=20
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> Asking for a release ack: this allows us to see more violations in
> the
> regular ECLAIR scanning results. But they are not blocking, so they
> won't cause additional new failures in the pipeline. It is just
> informative.
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>=20
>=20
> > ---
> > =C2=A0automation/eclair_analysis/ECLAIR/monitored.ecl | 5 +++++
> > =C2=A01 file changed, 5 insertions(+)
> >=20
> > diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl
> > b/automation/eclair_analysis/ECLAIR/monitored.ecl
> > index 4daecb0c83..9ffaebbdc3 100644
> > --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> > @@ -18,10 +18,13 @@
> > =C2=A0-enable=3DMC3R1.R12.5
> > =C2=A0-enable=3DMC3R1.R1.3
> > =C2=A0-enable=3DMC3R1.R13.6
> > +-enable=3DMC3R1.R13.1
> > =C2=A0-enable=3DMC3R1.R1.4
> > =C2=A0-enable=3DMC3R1.R14.1
> > =C2=A0-enable=3DMC3R1.R14.4
> > =C2=A0-enable=3DMC3R1.R16.2
> > +-enable=3DMC3R1.R16.3
> > +-enable=3DMC3R1.R16.4
> > =C2=A0-enable=3DMC3R1.R16.6
> > =C2=A0-enable=3DMC3R1.R16.7
> > =C2=A0-enable=3DMC3R1.R17.1
> > @@ -34,6 +37,7 @@
> > =C2=A0-enable=3DMC3R1.R20.13
> > =C2=A0-enable=3DMC3R1.R20.14
> > =C2=A0-enable=3DMC3R1.R20.4
> > +-enable=3DMC3R1.R20.7
> > =C2=A0-enable=3DMC3R1.R20.9
> > =C2=A0-enable=3DMC3R1.R2.1
> > =C2=A0-enable=3DMC3R1.R21.10
> > @@ -58,6 +62,7 @@
> > =C2=A0-enable=3DMC3R1.R5.2
> > =C2=A0-enable=3DMC3R1.R5.3
> > =C2=A0-enable=3DMC3R1.R5.4
> > +-enable=3DMC3R1.R5.5
> > =C2=A0-enable=3DMC3R1.R5.6
> > =C2=A0-enable=3DMC3R1.R6.1
> > =C2=A0-enable=3DMC3R1.R6.2
> > --=20
> > 2.34.1
> >=20


