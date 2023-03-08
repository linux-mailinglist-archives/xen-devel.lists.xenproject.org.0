Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CAE6B1028
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 18:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508117.782441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZxXy-0003TN-2C; Wed, 08 Mar 2023 17:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508117.782441; Wed, 08 Mar 2023 17:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZxXx-0003RH-Vb; Wed, 08 Mar 2023 17:25:49 +0000
Received: by outflank-mailman (input) for mailman id 508117;
 Wed, 08 Mar 2023 17:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Glg8=7A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZxXv-0003RB-Lz
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 17:25:47 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 421aae46-bdd6-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 18:25:45 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id k37so10314251wms.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Mar 2023 09:25:44 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003eb68bb61c8sm101982wmo.3.2023.03.08.09.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 09:25:44 -0800 (PST)
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
X-Inumbo-ID: 421aae46-bdd6-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678296344;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bc5SxwVUq/AURDOxo5AtyxuCAn1vYl2BhbqLvKDEjD8=;
        b=dmGo/X2bOtR2fQTAsSJUwuXq4DbO52AP/43gwozQIrY6nvDJmqBDMtOz5ZLK8a8f0B
         I3OzypcmFmr6W2dAtePaSToI4cGsaFNZCL4BQESoOYibPg+c5zcCsHMv6oB0Eo9Nsrfy
         8WjZZRCYBl6kowI6c4OkJEHF+2meX24qfRxWNgwT2saxGnEShzXd/tpfY5WhC0In0pyq
         7a/J5VLKoOaJ7pRuL8MIydIwQWgGKnqKD2CqhySzvv3oWb6UwnJcdorr2MMLcpCcU/hN
         ISjK2/7WHI40SJJqRVMdT1ly242W6LnhlpSUeV6m41dgY9k3Lft+LdxHw2kNPv+9U7V9
         jaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678296344;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bc5SxwVUq/AURDOxo5AtyxuCAn1vYl2BhbqLvKDEjD8=;
        b=Ej836XS/nKjw0Og4RkY0b2SvvBvCTZ0GKBaGuIYb5yX9xOAGFhdYjuewvP0I8tUyMm
         6zklIusv/p5SBZD6vhWLZAX2QYzIZqa51Qs4eSSIwvtaD73MZ392MYLnhMFjUC/G9tq1
         HnSFKJVpKrct3+RhPOqHuEuBrl+uqyvKRiSPSg4qdvGPSTiKXh+r+37MoaRPCAluQq4+
         bDScnZX99yBIXrCAZAr21JOQKkdR3rxH/uWsTJQey/HglSVpIUFidFR5BIJyK1h75ZRS
         JrhIEAf56j5ICW0nyLyNOufibRQQOazRImKpwxFmf+ERuWIjPu7d80Sgv3wSQigmaaIj
         VGqw==
X-Gm-Message-State: AO0yUKWeLEO6DYk2FggZr1CQNTSav7VdQKDUvt70F0lf92+knynHkoh/
	5+wiR6SKDEI5bvBKq2cTg34=
X-Google-Smtp-Source: AK7set+EIFAW9raq6rhZEKPK53BoPcRkO9OtG+/+u+SG9bPl2q4HS+fUbTvvxjAaI5OBb5i3POB42Q==
X-Received: by 2002:a05:600c:470b:b0:3e0:98c:dd93 with SMTP id v11-20020a05600c470b00b003e0098cdd93mr17754222wmo.29.1678296344403;
        Wed, 08 Mar 2023 09:25:44 -0800 (PST)
Message-ID: <cfe7b79c02bd5a9686a3018654627cade1c9e2f9.camel@gmail.com>
Subject: Re: [PATCH v6 2/4] xen: change <asm/bug.h> to <xen/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
  George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Wed, 08 Mar 2023 19:25:42 +0200
In-Reply-To: <7c7ca139-a77d-c5f1-e8ae-d819656725f1@suse.com>
References: <cover.1678202233.git.oleksii.kurochko@gmail.com>
	 <d8722046783462504d5396f7f880ff62b1ef9a90.1678202233.git.oleksii.kurochko@gmail.com>
	 <7c7ca139-a77d-c5f1-e8ae-d819656725f1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-08 at 16:27 +0100, Jan Beulich wrote:
> On 07.03.2023 16:50, Oleksii Kurochko wrote:
> > --- a/xen/arch/arm/include/asm/bug.h
> > +++ b/xen/arch/arm/include/asm/bug.h
> > @@ -1,6 +1,8 @@
> > =C2=A0#ifndef __ARM_BUG_H__
> > =C2=A0#define __ARM_BUG_H__
> > =C2=A0
> > +#include <xen/types.h>
> > +
> > =C2=A0#if defined(CONFIG_ARM_32)
> > =C2=A0# include <asm/arm32/bug.h>
> > =C2=A0#elif defined(CONFIG_ARM_64)
> > @@ -9,10 +11,16 @@
> > =C2=A0# error "unknown ARM variant"
> > =C2=A0#endif
> > =C2=A0
> > +#undef BUG_DISP_WIDTH
> > +#undef BUG_LINE_LO_WIDTH
> > +#undef BUG_LINE_HI_WIDTH
>=20
> Why? For Arm ...
>=20
> > =C2=A0#define BUG_DISP_WIDTH=C2=A0=C2=A0=C2=A0 24
> > =C2=A0#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> > =C2=A0#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>=20
> ... you could purge these as unused, even in a standalone prereq
> patch.
> And on x86 ...
>=20
> > --- a/xen/arch/x86/include/asm/bug.h
> > +++ b/xen/arch/x86/include/asm/bug.h
> > @@ -1,19 +1,18 @@
> > =C2=A0#ifndef __X86_BUG_H__
> > =C2=A0#define __X86_BUG_H__
> > =C2=A0
> > +#undef BUG_DISP_WIDTH
> > +#undef BUG_LINE_LO_WIDTH
> > +#undef BUG_LINE_HI_WIDTH
> > +
> > =C2=A0#define BUG_DISP_WIDTH=C2=A0=C2=A0=C2=A0 24
> > =C2=A0#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> > =C2=A0#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>=20
> ... there's no reason to #undef just to the #define again to the same
> values. All of this would be removed in a subsequent patch anyway,
> and
> it's less code churn (with code nevertheless being correct) if you
> get
> rid of the #define-s right away (as iirc you had it in an earlier
> version). If you agree then with these adjustments
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

It won't be compilation issue (redefinition) in the current one case
because defines are the same as in <xen/bug.h> so it is possible to not
add #undef in this patch.

~ Oleksii

