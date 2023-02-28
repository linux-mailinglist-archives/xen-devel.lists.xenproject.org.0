Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ED26A5932
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 13:39:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503326.775561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzFz-0004HY-5A; Tue, 28 Feb 2023 12:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503326.775561; Tue, 28 Feb 2023 12:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzFz-0004Fe-12; Tue, 28 Feb 2023 12:38:59 +0000
Received: by outflank-mailman (input) for mailman id 503326;
 Tue, 28 Feb 2023 12:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pWzFx-0004BO-15
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 12:38:57 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd9b0f51-b764-11ed-9694-2f268f93b82a;
 Tue, 28 Feb 2023 13:38:56 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id m7so12948183lfj.8
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 04:38:56 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 u15-20020ac24c2f000000b004d863fa8681sm1314849lfq.173.2023.02.28.04.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 04:38:55 -0800 (PST)
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
X-Inumbo-ID: dd9b0f51-b764-11ed-9694-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xNJvH0eJn3IyuWFVpPtxQEwz8b5SHgd1l7W6efLmLs0=;
        b=fYXz1RY3ClCZnHXkTcXLziPFUfRTGJVGeocI3zHDx310pI0I/wL71KRPXvPy2bWMJS
         s/rZPVd4G8cglTTcgavt9HLjRNX7kUsPA6Dt0nplymjyFjLMMDMbMVBO1f8i0WfmTaxV
         pUDps0wzqxpm6pUGDPmAKBuRgakaG5RegrHFo4VOmXF4bYO9/FIWkyG+m2hauflYfvuk
         Yun3t5xmyA0nPKJh+fnK6cyUmJKrzmRn/A0lbJqU9N2HXUhp3ngaLr0aC6H5iyXirjnB
         GbNYZ8KLfQdOM5s9dej0ri7vOqHrQ/dBtnvfwaUT8uZuRo0X+vRomYcAOlkME7SVzuXh
         jfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNJvH0eJn3IyuWFVpPtxQEwz8b5SHgd1l7W6efLmLs0=;
        b=L+kpvDI4gHFLEMoQgpuP1SqJohFjIaWFjBEtkSZ/jl0NMeQ4+N3MRGeHmIKJvkNN7T
         5PPPpcS+O6qa3vJwmRa/DN26DDdXd89TRJ+8KsKBHXkSE370rkIaTtZ1RyZL8D1vDWxm
         ZrmjmuHTJXwXh0S8I4nkWTXOgj4P8SVuitrPatWYcJ3DwKo+GqQCmjzXkAYvY7pmOHJt
         5lTX6JIl1bVosXaK6eYgU0K35FsSqBSKn6VkZM9qs+qNzyqljyWH4DjvCE6c0fuBjMul
         sfEM61fVU67KcykEzhDfKoXEm6iocW6gSvSNoBeymGj7BbFa9c11pCjduA3OdJVMP7Hd
         fUMA==
X-Gm-Message-State: AO0yUKXkP3NR2eAdwT3KM3dJDuuFKEMk5GNl4njPQLf+eN87HdXKxWzd
	ooHZ0mxKTejL+gc/rUetN3U=
X-Google-Smtp-Source: AK7set84iPbVDf0DTkNNPz8iqyXRMkfTvr6hXvIWkk+ynLEHv19F6To2JXG3611+kbfs6sBvdhaL4w==
X-Received: by 2002:ac2:4e66:0:b0:4dc:4e1e:ebfc with SMTP id y6-20020ac24e66000000b004dc4e1eebfcmr543243lfs.62.1677587935446;
        Tue, 28 Feb 2023 04:38:55 -0800 (PST)
Message-ID: <319ddd67bca2291afe7f27cba3cf8eb4e1307747.camel@gmail.com>
Subject: Re: [PATCH v3 2/4] xen: change <asm/bug.h> to <xen/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
  George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Tue, 28 Feb 2023 14:38:53 +0200
In-Reply-To: <468d6130-739e-4b0e-44e7-5aab520a0cac@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <19404db4a577e17dffef85a101449a507965be19.1677233393.git.oleksii.kurochko@gmail.com>
	 <468d6130-739e-4b0e-44e7-5aab520a0cac@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Sat, 2023-02-25 at 16:47 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 24/02/2023 11:31, Oleksii Kurochko wrote:
> > Since the generic version of bug.h stuff was introduced use
> > <xen/bug.h>
> > instead of unnecessary <asm/bug.h>
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0 * Update patch 2 not to break compilation: move some parts from
> > patches 3 and 4
> > =C2=A0=C2=A0=C2=A0 to patch 2:
> > =C2=A0=C2=A0=C2=A0 * move some generic parts from <asm/bug.h> to <xen/b=
ug.h>
> > =C2=A0=C2=A0=C2=A0 * add define BUG_FRAME_STRUCT in ARM's <asm/bug.h>
> > ---
> > Changes in V2:
> > =C2=A0 * Put [PATCH v1 4/4] xen: change <asm/bug.h> to <xen/bug.h> as
> > second patch,
> > =C2=A0=C2=A0=C2=A0 update the patch to change all <asm/bug.h> to <xen/b=
ug.h> among
> > the whole project
> > =C2=A0=C2=A0=C2=A0 to not break build.
> > =C2=A0 * Update the commit message.
> > ---
> > =C2=A0 xen/arch/arm/include/asm/bug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 19 +++----------------
> > =C2=A0 xen/arch/arm/include/asm/div64.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 +-
> > =C2=A0 xen/arch/arm/vgic/vgic-v2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 xen/arch/arm/vgic/vgic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 xen/arch/x86/acpi/cpufreq/cpufreq.c=C2=A0 |=C2=A0 2 +-
> > =C2=A0 xen/arch/x86/include/asm/asm_defns.h |=C2=A0 2 +-
> > =C2=A0 xen/arch/x86/include/asm/bug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 19 ++-----------------
> > =C2=A0 xen/drivers/cpufreq/cpufreq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 xen/include/xen/lib.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 9 files changed, 12 insertions(+), 40 deletions(-)
> >=20
> > diff --git a/xen/arch/arm/include/asm/bug.h
> > b/xen/arch/arm/include/asm/bug.h
> > index f4088d0913..cacaf014ab 100644
> > --- a/xen/arch/arm/include/asm/bug.h
> > +++ b/xen/arch/arm/include/asm/bug.h
> > @@ -1,6 +1,8 @@
> > =C2=A0 #ifndef __ARM_BUG_H__
> > =C2=A0 #define __ARM_BUG_H__
> > =C2=A0=20
> > +#include <xen/types.h>
>=20
> You are not adding new code in bug.h, so can you explain why this is
> now=20
> necessary?
>=20
> > +
> > =C2=A0 #if defined(CONFIG_ARM_32)
> > =C2=A0 # include <asm/arm32/bug.h>
> > =C2=A0 #elif defined(CONFIG_ARM_64)
> > @@ -9,9 +11,7 @@
> > =C2=A0 # error "unknown ARM variant"
> > =C2=A0 #endif
> > =C2=A0=20
> > -#define BUG_DISP_WIDTH=C2=A0=C2=A0=C2=A0 24
> > -#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> > -#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>=20
> Even if the values are the same as the one you defined in the common=20
> bug.h, it doesn't feel right to remove them as long as...
>=20
> > +#define BUG_FRAME_STRUCT
>=20
> the arch is defining BUG_FRAME_STRUCT. So I would say the generic one
> should be defined within BUG_FRAME_STRUCT.
>=20
One of the reason BUG_DISP_WIDTH, BUG_LINE_* were removed is that they
don't use in ARM at all...

But generally I agree that it should be part of "#ifndef
BUG_FRAME_STRUCT" as it is=C2=A0'struct bug_frame is dependent on it and
these defines look 'struct bug_frame' specific.

I'll update that in new version of the patch.
> Cheers,
>=20
~ Oleksii

