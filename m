Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE05C8D2E95
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731560.1137120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDwB-0003QT-Ct; Wed, 29 May 2024 07:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731560.1137120; Wed, 29 May 2024 07:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDwB-0003Nw-A5; Wed, 29 May 2024 07:41:31 +0000
Received: by outflank-mailman (input) for mailman id 731560;
 Wed, 29 May 2024 07:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCDw9-0003Nl-Rh
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:41:29 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dadd8a22-1d8e-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:41:26 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52449b7aa2bso2073515e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:41:28 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52970c33134sm1174378e87.209.2024.05.29.00.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:41:27 -0700 (PDT)
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
X-Inumbo-ID: dadd8a22-1d8e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716968487; x=1717573287; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EmVBLTKuy8j8dtHnds1qPYPeZejP9VO3PNdXIxBa3Wk=;
        b=KJbXrDpvEl8MsJOuodirz0DaePpJf6e6OdKZM9Y7CB7zFcGgxBeQdpOEcebjU3lpkD
         W2S/kmPvAQ855/YStikYY5FPn0j+o18wcvmjcav8y+pO1cI3eXd/cm4/mIFwwxbIAxSH
         drcxNogL9YqFUTt+y62TF1oAUX59XT8mk5OgdD0NvU21sMA9mCoEWDKC9iNsCcSoOte/
         0J7JaDWrC/tr1Jx9ILJH6SUGBvGvuM3hmeSVvvP5kwqL4eXYN5f/U6igdVbZcURLrV5D
         uodxpfqti5iVE+kLfNOE0p/tb7JcLPTFEYGZA9EdtGlSwM1yHxOukXZVzTHBdEP2+oXV
         hXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968487; x=1717573287;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EmVBLTKuy8j8dtHnds1qPYPeZejP9VO3PNdXIxBa3Wk=;
        b=G6FT7ePwn//OCQ2hxoGdpjZh6PLCMDcpYDA7ibGqmwDVluB2X6caNMtyeI2/80ygn7
         vge1yc9HRwt5czRn6lIcOT5J3j0nIDKSWZbAn22OPlA26eKuFQRyWUPzukeQzzLOCwYI
         9D6QY26O9wr4oK7GQwi/RISqTQb62Sf4BhVBtqKmGpwR+ewc/WoacET6yJ56k0VZ+i8Q
         kW5vXtx35VHt0RZ/iyNwyERdji1indAqWTWpGWOHsQ4o6l+QPX/v5tDRoOvf3+tGXGaw
         fpgqCLgjh37HdgOrrUD3UuRYSPI9Z2CGp+2ivQLi5w85v7uonzmURg2sRarjuZww3mMM
         nBJg==
X-Forwarded-Encrypted: i=1; AJvYcCVi16dkCO4Gz1v/aCXldzuz6JaMbghoDEOINB0941X3ZV38JWk5pbcfTjLXbMuGYAWbvxTQHnX12aqP0K1J8oBZK2ivkN1K/1hpJeSkHh0=
X-Gm-Message-State: AOJu0YxlzeveX3z7rCwE5zne2BTZE4/M4pt6Ny20vqrsNO01HyCYFMjD
	9zVqoSavs7eDMy2frKFqSOSK4IwmhHHN1V0tjlxZZqQcJAd/aeAS
X-Google-Smtp-Source: AGHT+IFyEe3UWPlnQQCU8RbG8XouxBCGr6j3dVJmpk/qxzpfnxCZHElvGFXzAy4G4sORVHhT33Cf2g==
X-Received: by 2002:a05:6512:3f09:b0:529:ac49:45d1 with SMTP id 2adb3069b0e04-529ac494708mr8471955e87.66.1716968487354;
        Wed, 29 May 2024 00:41:27 -0700 (PDT)
Message-ID: <8e9a563f1e0f45883502bc47c4942081a5d66e1a.camel@gmail.com>
Subject: Re: [PATCH for-4.19 v3 0/3] xen/x86: support foreign mappings for
 HVM/PVH
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
 <christian.lindig@citrix.com>,  David Scott <dave@recoil.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,  "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, Community Manager
 <community.manager@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Wed, 29 May 2024 09:41:26 +0200
In-Reply-To: <0c4a9a00-b8de-4472-afb4-0a8d70c7aada@suse.com>
References: <20240517133352.94347-1-roger.pau@citrix.com>
	 <0c4a9a00-b8de-4472-afb4-0a8d70c7aada@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-29 at 09:24 +0200, Jan Beulich wrote:
> On 17.05.2024 15:33, Roger Pau Monne wrote:
> > Hello,
> >=20
> > The following series attempts to solve a shortcoming of HVM/PVH
> > guests
> > with the lack of support for foreign mappings.=C2=A0 Such lack of
> > support
> > prevents using PVH based guests as stubdomains for example.
> >=20
> > Add support in a way similar to how it's done on Arm, by iterating
> > over
> > the p2m based on the maximum gfn.
> >=20
> > Patch 2 is not strictly needed.=C2=A0 Moving the enablement of altp2m
> > from an
> > HVM param to a create domctl flag avoids any possible race with the
> > HVM
> > param changing after it's been evaluated.=C2=A0 Note the param can only
> > be
> > set by the control domain, and libxl currently sets it at domain
> > create.=C2=A0 Also altp2m enablement is different from activation, as
> > activation does happen during runtime of the domain.
> >=20
> > Thanks, Roger.
> >=20
> > Roger Pau Monne (3):
> > =C2=A0 xen/x86: account number of foreign mappings in the p2m
> > =C2=A0 xen/x86: enable altp2m at create domain domctl
> > =C2=A0 xen/x86: remove foreign mappings from the p2m on teardown
>=20
> Here, too, I'd like to ask whether to keep this as a candidate for
> 4.19, or
> whether to postpone. Afaict what's still missing are Arm and tool
> chain acks
> on patch 2.
We can consider to have this patch series in 4.19:
 Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
> Jan
>=20
> > =C2=A0CHANGELOG.md=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0tools/libs/light/libxl_create.c=C2=A0=C2=A0=C2=A0=C2=A0 | 23 ++++=
+++++-
> > =C2=A0tools/libs/light/libxl_x86.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 26 +++++------
> > =C2=A0tools/ocaml/libs/xc/xenctrl_stubs.c |=C2=A0 2 +-
> > =C2=A0xen/arch/arm/domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++
> > =C2=A0xen/arch/x86/domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28 ++++++++++++
> > =C2=A0xen/arch/x86/hvm/hvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +++++++++-
> > =C2=A0xen/arch/x86/include/asm/p2m.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32=
 +++++++++-----
> > =C2=A0xen/arch/x86/mm/p2m-basic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 18 ++++++++
> > =C2=A0xen/arch/x86/mm/p2m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 68
> > +++++++++++++++++++++++++++--
> > =C2=A0xen/include/public/domctl.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 20 ++++++++-
> > =C2=A0xen/include/public/hvm/params.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9=
 +---
> > =C2=A012 files changed, 215 insertions(+), 41 deletions(-)
> >=20
>=20


