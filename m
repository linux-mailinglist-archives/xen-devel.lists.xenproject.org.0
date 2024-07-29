Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785A293F27C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 12:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766559.1177053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYNUI-0001uG-FN; Mon, 29 Jul 2024 10:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766559.1177053; Mon, 29 Jul 2024 10:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYNUI-0001rY-C1; Mon, 29 Jul 2024 10:20:18 +0000
Received: by outflank-mailman (input) for mailman id 766559;
 Mon, 29 Jul 2024 10:20:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrP=O5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYNUH-0001rS-3a
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 10:20:17 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 249a25bc-4d94-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 12:20:13 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52efc60a6e6so5160723e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 03:20:13 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bc445esm1427615e87.30.2024.07.29.03.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 03:20:12 -0700 (PDT)
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
X-Inumbo-ID: 249a25bc-4d94-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722248413; x=1722853213; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8CfzeXNdrnFUcdHxmlWuXj+M7D2UCsOLZToHACCAJ1k=;
        b=Dub8ohfuWPGodkuJwdIOiPTDdG5Rv1vw8ojiWj6RsacLZmEpIBzkhuxbgz459KcsPu
         LtqLjHPpX6zcDdDvqiXoYwqjN0xCECDseRhaig5Ke+I0mu6QQOTDaDS0LpdYIgKfnuwQ
         tVSwSlMiyolamVK0rPUszvGsfb2JtuuqkLGBiYUgx9Hp1PcJEJrAa8Z4ML0L+QXKRatJ
         zH43BgpzQUXf8hkr9pmEmhIacnpPhHaiVcvKRmoewhpdALnSr+MbSMWFIBLOmujzP3IA
         c5WU1Aeyzowu3iyseDtWC0UMea6dUWFOd1g0pCM6iKgUVN0K7icF3hK6yrU3txK77t4/
         hxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722248413; x=1722853213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CfzeXNdrnFUcdHxmlWuXj+M7D2UCsOLZToHACCAJ1k=;
        b=taUTf/dPTV1yetY730sY8sKEMfCqU46mObq4NeaXV4m4qJSOBE9yTPOT7PlcoGBmcQ
         HPNS56BIPgxsyS5/ceyQt34nq68v40T2ioGnQ7QEYzgaDCcYCpaUp+1dOM7zGr0CuvrG
         cma3nZVnKC5TlDZSyCyFrRrSzVzJYdNzGaqtWzAwK3vwPKIxJSg5MFSch/KjSrdm6ue7
         qk71aCnOpXmZxc5KTn/ySRTTJWyAqHkFbPqLBWgHHeEyMS3/DgedIq8LPHz8vPSRtKxa
         RStkZDTV3KZ5sWVjwL3YTPsGRY76fsQVZuG/4c22WLszp5Kx1j48VNprT1bsp8xn6tXB
         f06w==
X-Forwarded-Encrypted: i=1; AJvYcCW5+OicqxHbbRNSfNrTtSO52t3s/vWPBf4InbnAGYq71VHkF9igItiH/70MqQ+blPl+vtsPHYr/KjoMiYbt2WDRXtB/dElixZ8lXwVdupw=
X-Gm-Message-State: AOJu0YyA9Yqu26mlkhmmEA48RSKYBaAn2sXH/TT3F+j9qfls2qAnFDu+
	FT60eFbOYYtO7ZcL2eITWZMe7YG0Z4SVOAvei/nLjEbdORGO/NZl
X-Google-Smtp-Source: AGHT+IH4HcTozjOmk8xBFK9leXtLFkOvJ5l8I7zd8/4xYyqKznbgQ6Lt+SV976afkBxMVIad0HUpaA==
X-Received: by 2002:a05:6512:b96:b0:52e:767a:ada7 with SMTP id 2adb3069b0e04-5309b2c3ad6mr5645626e87.50.1722248412692;
        Mon, 29 Jul 2024 03:20:12 -0700 (PDT)
Message-ID: <843c1b340e153cb535f28872a95623cf46a35981.camel@gmail.com>
Subject: Re: [PATCH for 4.19] CHANGELOG.md: Finalize changes in 4.19 release
 cycle
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Community Manager <community.manager@xenproject.org>, "committers @
 xenproject . org" <committers@xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,  Michal Orzel
 <michal.orzel@amd.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 29 Jul 2024 12:20:11 +0200
In-Reply-To: <f2450b46-3542-4e1c-b7d7-8735b1839791@suse.com>
References:
	  <0c93b49ac00fa92721035b4f9eb2ae76175fe886.1722237887.git.oleksii.kurochko@gmail.com>
	 <f2450b46-3542-4e1c-b7d7-8735b1839791@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-29 at 10:11 +0200, Jan Beulich wrote:
> On 29.07.2024 09:31, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Since no-one else cared to reply so far, I will (I tried to avoid
> doing so,
> because - I'm sorry for that - feedback is mostly negative, in part
> following
> what I said for some 4.18 entries last time already, iirc):
Any feedback is good!

>=20
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -15,6 +15,17 @@ The format is based on [Keep a
> > Changelog](https://keepachangelog.com/en/1.0.0/)
> > =C2=A0=C2=A0=C2=A0 - Reduce IOMMU setup time for hardware domain.
> > =C2=A0=C2=A0=C2=A0 - Allow HVM/PVH domains to map foreign pages.
> > =C2=A0=C2=A0=C2=A0 - Declare PVH dom0 supported with caveats.
> > + - On Arm:
> > +=C2=A0=C2=A0 - Reworking the logic so all the MMU-off code is now self=
-
> > contained for
> > +=C2=A0=C2=A0=C2=A0=C2=A0 secondary boot CPUs on arm64.
>=20
> This is an implementation detail aiui nothing people using Xen would
> actually
> stumble across or notice. Imo such doesn't belong here. Same goes for
> the
> entire PPC part of this hunk further down.
>=20
> > +=C2=A0=C2=A0 - Code symbol annotations and MISRA compliance improvemen=
ts.
>=20
> This isn't Arm-specific, is it?
Agree, this is not Arm-specific, so I will move it to "Changed".

>=20
> > +=C2=A0=C2=A0 - Addressing issues of the static shared memory feature.
>=20
> Along the lines of the above, I don't think individual features' bug
> fixes
> want/need mentioning here.
>=20
> > @@ -23,6 +34,11 @@ The format is based on [Keep a
> > Changelog](https://keepachangelog.com/en/1.0.0/)
> > =C2=A0=C2=A0=C2=A0 using a standalone library implementation.
> > =C2=A0 - xenalyze no longer requires `--svm-mode` when analyzing traces
> > =C2=A0=C2=A0=C2=A0 generated on AMD CPUs
> > + - CI updates:
> > +=C2=A0=C2=A0 - Minimum fixes to rebuild the containers, following the
> > HEREDOC problems.
> > +=C2=A0=C2=A0 - Rebuild containers to have testing with up-to-date LTS
> > distros.
> > +=C2=A0=C2=A0 - Few build system checks, and strip the obsolete content=
s of
> > +=C2=A0=C2=A0=C2=A0=C2=A0 the build containers.
>=20
> This again doesn't concern people using Xen, does it?
What about people who are building Xen themselves? This part of the
changelog informs them that we have verified Xen builds with the latest
up-to-date LTS.

>=20
> > @@ -31,6 +47,14 @@ The format is based on [Keep a
> > Changelog](https://keepachangelog.com/en/1.0.0/)
> > =C2=A0 - Add a new 9pfs backend running as a daemon in dom0. First user
> > is
> > =C2=A0=C2=A0=C2=A0 Xenstore-stubdom now being able to support full Xens=
tore trace
> > capability.
> > =C2=A0 - libxl support for backendtype=3Dtap with tapback.
> > + - On Arm:
> > +=C2=A0=C2=A0 - FF-A notification support.
> > +=C2=A0=C2=A0 - Introduction of dynamic node programming using overlay =
dtbo.
>=20
> This is fine to have. I wonder though if the per-arch sections
> wouldn't
> better sit next to each other (all at the top or all at the bottom).
I didn't get you here. Everything in "### Added" is sorted per-arch.

>=20
> > + - On PPC:
> > +=C2=A0=C2=A0 - Basic exception handler implementation.
> > + - On RISCV:
> > +=C2=A0=C2=A0 - Identity mapping implementation.
> > +=C2=A0=C2=A0 - Introduction of architecture-specific headers.
>=20
> These again don't concern people using Xen, do they?
Well, I agree that PPC/RISCV is far away from being used but still it
shows that progress is going on.

Do we have the document which tell what should be in CHANGELOG and what
shouldn't?

~ Oleksii

