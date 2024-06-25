Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784C79160FD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747421.1154820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1R7-0006sW-GZ; Tue, 25 Jun 2024 08:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747421.1154820; Tue, 25 Jun 2024 08:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1R7-0006pV-DB; Tue, 25 Jun 2024 08:21:57 +0000
Received: by outflank-mailman (input) for mailman id 747421;
 Tue, 25 Jun 2024 08:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM1R5-0006pN-Ve
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:21:55 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fac82f09-32cb-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 10:21:54 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a724e067017so254830366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:21:54 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725a3f205esm150093466b.183.2024.06.25.01.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 01:21:53 -0700 (PDT)
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
X-Inumbo-ID: fac82f09-32cb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719303713; x=1719908513; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R0ffmTi0s2FGhhi1iP+Zu5mUuAAdzqMTZa3D4ssqzRE=;
        b=TZntTmvWGXYxqQzFoM0NuICldAAZDciRaS4IoSowyKTP16JW9DBXV5doMo8FwPGZU5
         wdzE/KMMLnKXiOB0U4niDO0jR+12LJ+V/lpaPknkbKZfMgby/m0hVqJFtSM61bRiHeaE
         wF9C7ACF/z0tSG6ZFcuxvkU+B1iLF6XMbejK+2s+suHqEgIgrwcDPfYN3vE8XICdcI1u
         t9zKhPIpzhNfyS2EthMWo0v+X/i1bX38oeXPmg3fa0PKkMf4p8IZ+JZpXAcDMIJsoXGU
         cAi72SGx/FH89N3uFW/S7odDiTfsq3tb7z+1Y1mLWDb5fbIK/LLi9E9yoVi3D21m/D1b
         SmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719303713; x=1719908513;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0ffmTi0s2FGhhi1iP+Zu5mUuAAdzqMTZa3D4ssqzRE=;
        b=UIOnFnFz1cCGKd9QdTmvA829asUiFxibZaQzDvwTizMPYmwgA1gYiFF0OZMaSEuSTX
         4J8KoO3q0UZkJznbuNQArItGU9r+UQVqcNFcH1vtZxKJdO+8tmZX+no/kw3zwFfOc6Ww
         PKp5mQRIeDjCY0PqssLNPMWiLxIJ25my4aayPVmQGH7oy3VYy0/gIjM6b7IMJNH5y8NJ
         S2uGKkFccxLLfgH8/h3PQa6da00l2JWfLHVHA0lWjp2awsiCRMIEpiB23Gm1p89Y5tx+
         Xyum44msaU8LK+xi8CTOSNYz0ZaQ9OTt/4xanPuuSecQT/BHxyIbdw53AYsEfH2vle4Q
         S/JA==
X-Gm-Message-State: AOJu0YxNrx2iCkuj6qlIt/Jutr/mg/4wO8AiKQ7T9HyIqhkJ0Y96zAEC
	zM8A2NHV9ROMrAtdn7rHtnlJYwShujq/U6hvvi2rgIRMxGFKeDOenaQjgPD7
X-Google-Smtp-Source: AGHT+IFCEkPhnauN69b59dX4hx+Tp2QCej6gyQt5hpZWbCQLI1B6z7prFNwMV1TCKXRiqLhAFc/Mfg==
X-Received: by 2002:a17:906:d99:b0:a6f:5318:b8f0 with SMTP id a640c23a62f3a-a7245b80ea1mr382802866b.37.1719303713249;
        Tue, 25 Jun 2024 01:21:53 -0700 (PDT)
Message-ID: <f92d296c2a43cfb23c2547791df6053183231796.camel@gmail.com>
Subject: Re: [PATCH v3] automation/eclair_analysis: deviate and|or|xor|not
 for MISRA C Rule 21.2
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Alessandro Zucchelli
	 <alessandro.zucchelli@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
	 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Tue, 25 Jun 2024 10:21:52 +0200
In-Reply-To: <alpine.DEB.2.22.394.2406241721270.3870429@ubuntu-linux-20-04-desktop>
References: 
	<f21ea3734857e0cf26afff00befb179b10d02158.1719213594.git.alessandro.zucchelli@bugseng.com>
	 <alpine.DEB.2.22.394.2406241721270.3870429@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-06-24 at 17:22 -0700, Stefano Stabellini wrote:
> On Mon, 24 Jun 2024, Alessandro Zucchelli wrote:
> > Rule 21.2 reports identifiers reserved for the C and POSIX standard
> > libraries: or, and, not and xor are reserved identifiers because
> > they
> > constitute alternate spellings for the corresponding operators
> > (they are
> > defined as macros by iso646.h); however Xen doesn't use standard
> > library
> > headers, so there is no risk of overlap.
> >=20
> > This addresses violations arising from x86_emulate/x86_emulate.c,
> > where
> > label statements named as or, and and xor appear.
> >=20
> > No functional change.
> >=20
> > Signed-off-by: Alessandro Zucchelli
> > <alessandro.zucchelli@bugseng.com>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> Hi Oleksii,
Hi Stefano,

>=20
> I am asking for a release-ack as this patch adds a deviation, the
> only
> impact is fewer violations from the ECLAIR analysis
Looks good to me:
 Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>=20
>=20
> > ---
> > Changes from v2:
> > Fixed patch contents as the changes from v1 and v2 were not
> > squashed together.
> > ---
> > Changes from v1:
> > Added deviation for 'not' identifier.
> > Added explanation of where these identifiers are defined,
> > specifically in the
> > 'iso646.h' file of the Standard Library.
> > ---
> > =C2=A0automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index 9fa9a7f01c..14c7afb39e 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -498,6 +498,12 @@ still remain available."
> > =C2=A0-config=3DMC3R1.R21.2,declarations+=3D{safe, "!^__builtin_.*$"}
> > =C2=A0-doc_end
> > =C2=A0
> > +-doc_begin=3D"or, and and xor are reserved identifiers because they
> > constitute alternate
> > +spellings for the corresponding operators (they are defined as
> > macros by iso646.h).
> > +However, Xen doesn't use standard library headers, so there is no
> > risk of overlap."
> > +-config=3DMC3R1.R21.2,reports+=3D{safe,
> > "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
> > +-doc_end
> > +
> > =C2=A0-doc_begin=3D"Xen does not use the functions provided by the
> > Standard Library, but
> > =C2=A0implements a set of functions that share the same names as their
> > Standard Library equivalent.
> > =C2=A0The implementation of these functions is available in source form=
,
> > so the undefined, unspecified
> > --=20
> > 2.34.1
> >=20


