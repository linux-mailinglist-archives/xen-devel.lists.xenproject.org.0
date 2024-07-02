Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E02923ADD
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 11:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752204.1160348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaFf-0000Ln-Vy; Tue, 02 Jul 2024 09:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752204.1160348; Tue, 02 Jul 2024 09:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaFf-0000Is-Se; Tue, 02 Jul 2024 09:56:43 +0000
Received: by outflank-mailman (input) for mailman id 752204;
 Tue, 02 Jul 2024 09:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOaFe-0008C8-Pj
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 09:56:42 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61a8953a-3859-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 11:56:42 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-44639c3d8e7so23086511cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 02:56:42 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-446514cdd81sm38854311cf.97.2024.07.02.02.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 02:56:40 -0700 (PDT)
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
X-Inumbo-ID: 61a8953a-3859-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719914201; x=1720519001; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gffgVbdNigongINpAx1TItOgFzDT1kwTcILI218UL0A=;
        b=bV4LHPMHpXHdyYQTp4ObNQGbNf92Gc5HVotYMWWDTBB4EnGrncf4IkuSMCm6VD1tIL
         wKQwM6nygg8rw/RseSlukkIVjS9KdZ9tRE7nQvA3pDcI/eq13G6elaRU3M9NpQsJR7tS
         n67Hwfb5bcvZXIQZ1wGyX298KJNjNYjOcoIeAbv7GOq2HON2oYItCrNTYwIGpnqBSTLw
         UpsXjXY9DcZGz+QsWF1MEBVgWRTPLjgX+EpqZg2lHibZkEsL6rGCKWfp8H/lsPf+oTrn
         JIydAFYSdodOvm0ve4Xav+6dZlvisB80Dx/sKDvuT1H7j6mrYipHbWt7bPoC0wCE6df9
         dtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719914201; x=1720519001;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gffgVbdNigongINpAx1TItOgFzDT1kwTcILI218UL0A=;
        b=gpSkilDuMEIJJufgsx7qjcGKMyYyQZhP2XxMlaYi4geD6947wx/Z4UQZp40QvUHKFb
         LZtBNBptSw8eoz+bXXzp9zPALAA4CLtBMi/1vUhHk5+e88aRZ6ba7qMM/oBnkhLhI+Fr
         HtW22B6J0yJqp5bZTk/RBbGrv73Xz3W6o2tYkhbzYaRIq6JZtR/aVBDi02U5PYAZ+A25
         zTEcnR71DLJThKPDLQAHR895hh7H4CFOy+quo5/y0yb/VGL2rEEuzOFEiujvilKabrS0
         BJh2E29KfreXzJ2SsSXnkmBCrSm1jDGxKnz5xiM9Qnj7LGCi8NCc08oYu41iDGy1ae+g
         z7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyiGFKuLWK6dY3KS5YSwUp6dDgbSVW8pD4Zz4xGx2HFVx//gI2W9Ii9ZKnL9CuWgbohppUBddXSdPju6zAI42wqmMYRXWTJyL3puUndnI=
X-Gm-Message-State: AOJu0Yx34L9bFjDRxLf9c0hddmmy/nepe08Tlq0V0z/sK4GcGdMbJsYl
	nRzwhQLQ0uRHmhn8D/NC0V6/62RW9JapUtdgHCwSsobAYoaynTED
X-Google-Smtp-Source: AGHT+IGx0MHJ5c7Pt2TBcarogedOld/1sNI+cXwqTWi3CuNYqmAyd1fmxSBJdKP40PQZGRaxEHBESQ==
X-Received: by 2002:a05:622a:1a29:b0:446:493b:d2b9 with SMTP id d75a77b69052e-44662dfccacmr102846501cf.11.1719914200859;
        Tue, 02 Jul 2024 02:56:40 -0700 (PDT)
Message-ID: <0551e31b19bbdad8aeacb6c76e7651abe1b8ca4d.camel@gmail.com>
Subject: Re: [PATCH v1] automation: add findutils to suse images
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>,
  xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>
Date: Tue, 02 Jul 2024 11:56:37 +0200
In-Reply-To: <6231910f-b4c9-4604-83dc-c53e53d30409@citrix.com>
References: <20240701151512.10187-1-olaf@aepfle.de>
	 <6231910f-b4c9-4604-83dc-c53e53d30409@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-01 at 16:20 +0100, Andrew Cooper wrote:
> On 01/07/2024 4:15 pm, Olaf Hering wrote:
> > The build system uses find(1). Make sure it is available.
> >=20
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> CC Oleksii.=C2=A0 This is probably non-optional to take.
>=20
> I suspect it means we can't rebuild the OpenSUSE dockerfiles any
> more...
Are we going to rebuild the OpenSUSE dockerfiles in this release?

~ Oleksii
>=20
> > ---
> > =C2=A0automation/build/suse/opensuse-leap.dockerfile=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A0automation/build/suse/opensuse-tumbleweed.dockerfile | 1 +
> > =C2=A02 files changed, 2 insertions(+)
> >=20
> > diff --git a/automation/build/suse/opensuse-leap.dockerfile
> > b/automation/build/suse/opensuse-leap.dockerfile
> > index 3ef33458a0..1344cbb0d1 100644
> > --- a/automation/build/suse/opensuse-leap.dockerfile
> > +++ b/automation/build/suse/opensuse-leap.dockerfile
> > @@ -20,6 +20,7 @@ RUN zypper install -y --no-recommends \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev86 \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 diffutils \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 discount \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 findutils \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flex \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gawk \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc \
> > diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile
> > b/automation/build/suse/opensuse-tumbleweed.dockerfile
> > index a793601c87..2587a3fa4f 100644
> > --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> > +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> > @@ -18,6 +18,7 @@ RUN zypper install -y --no-recommends \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmake \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 diffutils \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 discount \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 findutils \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flex \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gawk \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc \
> >=20
>=20


