Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE2878EF2E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 16:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593970.927127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbiG3-0005EX-VB; Thu, 31 Aug 2023 14:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593970.927127; Thu, 31 Aug 2023 14:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbiG3-0005CF-Rx; Thu, 31 Aug 2023 14:02:51 +0000
Received: by outflank-mailman (input) for mailman id 593970;
 Thu, 31 Aug 2023 14:02:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zVM6=EQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qbiG2-0005C9-RZ
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 14:02:50 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ff61bbc-4807-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 16:02:46 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bcbfb3705dso15569781fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 07:02:46 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a2e978d000000b002b9e5fe86dasm331649lji.81.2023.08.31.07.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 07:02:45 -0700 (PDT)
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
X-Inumbo-ID: 0ff61bbc-4807-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693490566; x=1694095366; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RKusNiLGhC54xT8qApIWwLD4LPu8qm0tjxyXWy+ACH4=;
        b=lr8JZcfEj0skFwTkXHdd2dSi6AZvTZsRjmpJY/yJkBcgafVzC6thfrSYR2I6StJVfF
         iO3ZpJk/DSndDwRtn1GttrczIO/5R99VMJGSCW2lUgb82ywW2gUmpq7OohREG05Uk3p8
         DtRkgE2qOeI/34cJnbPmy6UBkqTBGsiB33ndGkI0KaONnSGzJt6am//7JG6/dPjC+JhU
         SNMNYR9e0UkOYYLvWZp56UGueyqaQIjTQpCBRZTJNuUa1OeYm8pDLtTaZrYpHxHqLwBe
         9Fa6wb1UsllWFoirX5Bov5eQYSwBokFPlT7gl40E68LMqV3UnrFJ1R9Crix8NpAZ7g5Q
         /vkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693490566; x=1694095366;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RKusNiLGhC54xT8qApIWwLD4LPu8qm0tjxyXWy+ACH4=;
        b=HcF6phK4n1umGoo7nbOWerMnrHc5fvctjZqvcPeksAT6ZKSUoHxw/FBbnLw8/huD1f
         AjtdDtavYjyZEiTmHoLUlASjKXW9GUqG7pO0O2ztcMmA5a7VrBP7RiRrAbHfXeSLL2CP
         t57xoylR1VPt//eEdCmFVDeIcnVTOEBSPrIOqTM0YLdltNQva0phBK9tBGkxNwXG8bx0
         6o3ED9igPJKZ0iuIDjkaha8CxN4KysB7q++qkl55iHWqz+Fz7iecRnVALumUn2FiS3dz
         rdV7YiPBKGmigEoZgafqnT6A4/Io2KBzCWNjEtr9NTKPayoSnRfIzzEgEUYSrBUmwyfU
         D1jw==
X-Gm-Message-State: AOJu0YyPGNQY/XiQxM1yq5Ebtq1T5XZbe8IQPm65LEIYcZsdl9VAqlLR
	bU0KuGKMk2clK09wN+pOFzswMekxkHw=
X-Google-Smtp-Source: AGHT+IHmri82q4TSQ6ryjgQlKytPr4A/bzHFJhdQAbnE64Rgif4MmuqMrtifFWJpvlDBd410FSge9w==
X-Received: by 2002:a2e:910e:0:b0:2bc:ed80:46e with SMTP id m14-20020a2e910e000000b002bced80046emr4331290ljg.31.1693490565732;
        Thu, 31 Aug 2023 07:02:45 -0700 (PDT)
Message-ID: <03d68a602592d9f542936ec7b5fc3b33777720cf.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 31 Aug 2023 17:02:44 +0300
In-Reply-To: <3a165375-0dd2-9a3b-403d-2306acd60b92@suse.com>
References: <cover.1693414172.git.oleksii.kurochko@gmail.com>
	 <ee7c3aa566dadd9350f39f5aedbfce3ae72ba663.1693414172.git.oleksii.kurochko@gmail.com>
	 <3a165375-0dd2-9a3b-403d-2306acd60b92@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-08-31 at 11:46 +0200, Jan Beulich wrote:
> On 30.08.2023 18:57, Oleksii Kurochko wrote:
> > asm/vm_event.h is common for ARM and RISC-V so it will be moved to
> > asm-generic dir.
> >=20
> > Original asm/vm_event.h from ARM was updated:
> > =C2=A0* use SPDX-License-Identifier.
> > =C2=A0* update comment messages of stubs.
> > =C2=A0* update #ifdef.
> > =C2=A0* change public/domctl.h to public/vm_event.h.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> > Changes in V3:
> > =C2=A0- add Acked-by: Stefano Stabellini <sstabellini@kernel.org> for
> > "xen: move arm/include/asm/vm_event.h to asm-generic"
> > =C2=A0- update SPDX tag.
> > =C2=A0- move asm/vm_event.h to asm-generic.
> > ---
> > Changes in V2:
> > =C2=A0- change public/domctl.h to public/vm_event.h.
> > =C2=A0- update commit message of [PATCH v2 2/2] xen: move
> > arm/include/asm/vm_event.h to stubs
> > ---
> > =C2=A0xen/arch/arm/include/asm/vm_event.h=C2=A0=C2=A0=C2=A0 | 66 ------=
----------------
> > ----
> > =C2=A0xen/include/asm-generic/asm/vm_event.h | 55 +++++++++++++++++++++
> > =C2=A02 files changed, 55 insertions(+), 66 deletions(-)
> > =C2=A0delete mode 100644 xen/arch/arm/include/asm/vm_event.h
> > =C2=A0create mode 100644 xen/include/asm-generic/asm/vm_event.h
>=20
> While it's a comment on the first patch, it's really better making
> here:
> Did you look at Linux? They don't put an intermediate asm/ here.
> Instead
> see their scripts/Makefile.asm-generic. That way an arch still has
> control which generic headers it gets access to, without duplicating
> any
> of them.

IIUC scripts/Makefile.asm-generic script is needed to generate a
wrapper for a header which will contain:
#include <asm-generic/some.h>
if it is mentioned generic-y +=3D some.h in
arch/${ARCH}/include/asm/Kbuild.

But do we need this generated wrapper header?
Do we need all the support of generic-y in Kbuild, etc.?

In the previous patch of this patch series, it was added inclusion of
$(srctree)/include/asm-generic after the inclusion of
$(srctree)/arch/$(SRCARCH)/include so it will first look if the arch-
specific header exists, and if not then use generic one.

Probably I misunderstood you and your suggestion was to have
scripts/Makefile.asm-generic which will generate folder asm/ with
necessary headers in arch specific folder? So basically it was just a
question if asm/ folder should exist in $(srctree)/include/asm-generic
or not?

One more thing I would like to clarify is the duplicating of the
headers you mentioned above.
But if the architecture doesn't want to use a generic header, then it
still needs to add the header to arch/${ARCH}/include/asm and remove
mention of the header from arch/${ARCH}/include/asm/Kbuild.

~ Oleksii



