Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077A98D2E10
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731492.1137010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDgu-00030W-5T; Wed, 29 May 2024 07:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731492.1137010; Wed, 29 May 2024 07:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDgu-0002y0-2C; Wed, 29 May 2024 07:25:44 +0000
Received: by outflank-mailman (input) for mailman id 731492;
 Wed, 29 May 2024 07:25:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCDgs-0002xp-4N
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:25:42 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5dc5c8d-1d8c-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:25:38 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a626776cc50so181708766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:25:40 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a62c501e85dsm444539966b.117.2024.05.29.00.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:25:39 -0700 (PDT)
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
X-Inumbo-ID: a5dc5c8d-1d8c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716967540; x=1717572340; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cekc9GdArRjBtHvDU3egGvR/lGulkBwka/aFwWcGvjc=;
        b=KT0n7Bmkxfn3DogRARn2snuOFKvRbi/Bq1aCf+0uYW/eppfm1Pj5XYCmNyFzcMMndE
         JkQHg2SHXVz0/tqInWrxDgpl/uXQ6nH3nL80rL/nm3Pob/M3lCkkF6PUumeYPEwzRJVp
         QyQuJyadXGwRInUybies4oCYo5O/3a+UX885KPYUV4I0bdIK63gJNA6+jnID6lc2yiTZ
         Cfa/+4RA0qW8qBDmWKxSyYkSpzaty+bPEny0zB6NQzDHBmSxypTXIl2xxB5SrJUWJHvb
         oJoT38WAfOngInDYZQWCIfkyeIqAN6nbPINIhtgLpsZoVnOaO4kcLeF655IybY6llRL7
         hniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967540; x=1717572340;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cekc9GdArRjBtHvDU3egGvR/lGulkBwka/aFwWcGvjc=;
        b=vPxgB4xneUquicLOxfjfXLWhW6LXhwJYtUeYaeN2/lNel7U1ldJ3etwm7YZi1oY+VS
         MFF27fw3uvL1Gt8lomHSkF88bIXV/dC8EMji2/4fdWiGHHt5w/Y6zy2w68yoU640nkTF
         s+zkZ7FX0Cc5mLTrhPbD5zUXdPtjpHICHqzCV1pzB07HX+EI8bN0XtEiixUYJ+JN0+Bn
         MvEGbFA2cTQaWIqd+CgvICYVYSlIPpDwGpic9c4SwaZAGQBsnR1tDgboEp5ZMBRRSVEZ
         5Z7JFxDOAdfpZBgUTnV4vsGS53QDnKTUSMOjIcCf7OQ2DIgPcywoaPHyokV/9cyxaM/D
         LLng==
X-Forwarded-Encrypted: i=1; AJvYcCWDXgSYIEK17Do7/xTdk0pCBYQBYMho/ZsR5zSMRTbwpnc+W955NxqpdySDxUdVzO+hCerHsPdeIxFDF6uGnKh5w0Gdo++SR1dFO2st2DA=
X-Gm-Message-State: AOJu0YzcBUZzO4H5eatzRilJyrcPCUgXHQJ9QVrbI2iNDCNB2zf28CtY
	SJMmZpOOdT1dkEA5L88Mai/z3q8HqqHi0QIC4BAQntxzjWqM7APr
X-Google-Smtp-Source: AGHT+IG+hNAAaqDhe2WTq0a0yMjwvAezCXiCbkWw2nCvGBSayVfBse6QzLtdRgbDKk0Lwn7tOqMuKA==
X-Received: by 2002:a17:906:3896:b0:a61:bd80:7ba6 with SMTP id a640c23a62f3a-a62641a56c3mr812136266b.3.1716967539441;
        Wed, 29 May 2024 00:25:39 -0700 (PDT)
Message-ID: <371b5bd54da8d77f351c986d1a43d042b869402b.camel@gmail.com>
Subject: Re: [XEN PATCH v4 0/3] x86: make Intel/AMD vPMU & MCE support
 configurable
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 xen-devel@lists.xenproject.org
Date: Wed, 29 May 2024 09:25:38 +0200
In-Reply-To: <9b5890de-ce5b-424c-80f9-3be83e9b94f0@suse.com>
References: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
	 <9b5890de-ce5b-424c-80f9-3be83e9b94f0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-05-27 at 17:47 +0200, Jan Beulich wrote:
> Oleksii,
>=20
> On 22.05.2024 10:37, Sergiy Kibrik wrote:
> > Three remaining patches to separate support of Intel & AMD CPUs in
> > Xen build.
> > Most of related patches from previous series had already been
> > merged.
> > Specific changes since v3 are provided per-patch.
> >=20
> > v3 series here:
> > https://lore.kernel.org/xen-devel/cover.1715673586.git.Sergiy_Kibrik@ep=
am.com/
> >=20
> > =C2=A0 -Sergiy
> >=20
> > Sergiy Kibrik (3):
> > =C2=A0 x86/intel: move vmce_has_lmce() routine to header
> > =C2=A0 x86/MCE: add default switch case in init_nonfatal_mce_checker()
> > =C2=A0 x86/MCE: optional build of AMD/Intel MCE code
>=20
> As I'm apparently confused as to the state 4.19 is in, may I please
> ask
> whether this series is still okay to go in, or whether it should be
> postponed until after branching.
I am okay to go in this release.

Sorry for the confusion with the 4.19 state. I'll send a proper
schedule today.


~ Oleksii

