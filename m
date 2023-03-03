Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16D56A96CC
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 12:56:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505925.778929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY40c-00085L-Rk; Fri, 03 Mar 2023 11:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505925.778929; Fri, 03 Mar 2023 11:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY40c-00083Q-Oj; Fri, 03 Mar 2023 11:55:34 +0000
Received: by outflank-mailman (input) for mailman id 505925;
 Fri, 03 Mar 2023 11:55:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY40b-000831-0k
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 11:55:33 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cd8aaea-b9ba-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 12:55:32 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id z42so2011729ljq.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 03:55:32 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 f20-20020a2e9e94000000b0029573844d03sm267815ljk.109.2023.03.03.03.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 03:55:31 -0800 (PST)
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
X-Inumbo-ID: 4cd8aaea-b9ba-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677844532;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qlYhNSBZAob4jbsatiLLFbnxAljXrHi0a9m8RVeqp3I=;
        b=YkoNOV3vdI2uugmRM0SZa36qG4u8Z/rP7WFjpbjLsMCibLt/1N49C/1OcBA25KnCKz
         90zhfXgRPH3CMQ3VeaGoyfeF8YDW6XcDBC2W807O14vj190hfGx2+aWUnCHUtKnuDd/Q
         6xFCNWiGCgoXFDYdeINhaBr7M4tJk7Q2MU+cS5Y3SEFy5zHEyM1pAukSzmsEWEaIaCfe
         IiX26q+EOvCzqtMqEOaJOwXDfPHLwk69HyS6IA7zEoGiEYd6fb4Zo0ap38QbTWN4w8Ph
         eCmx4DPp35ENH+Qmbu9xpxKhRjV3BC8/SnpljOkEsNj54AXwvtd4+j65qaafVoDdkGTK
         etGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677844532;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlYhNSBZAob4jbsatiLLFbnxAljXrHi0a9m8RVeqp3I=;
        b=aAOPqf7Jc4Wtcajm4rj63a8d6dSWG1GWk0pM6tp0FBZtXFf7T5KzP7eLzR/z1NxeUJ
         TunT7UlNfYiieFEQubD+sfgMwLbtSeYAq9fQXMNaZ0G2oumiXt8vmgwrIsqZaJXKCQ/a
         AXbiv8Om8BGBr32lrZ9Md13mg5hUA4Ez0cESfYd/DXJ1XZmfCGu5Fwpvodu9Etjtn0hn
         ns3Ps3kzxxYp8auJnBdqqtNssihfBXUbk3I2Kj4Tf64W4FCstLYyOMWtWYINO3MEo5WY
         8H619mJetjpitkjxN5iSGGCUoBvaafOQJjnIUCYRmEQuwEh34VupS7IsmvqtUQaHHr5K
         EsqQ==
X-Gm-Message-State: AO0yUKWpeguzVehQ81tGHymZwtoDBRIjyvFw1kuYP//sEAos3bm9UWxF
	Yk3/1iy6819rNa56Fgw7Qzo=
X-Google-Smtp-Source: AK7set952/Dmk2wXALe+K+Pf1Ypgn9LOy/1kM/gZNR0EvhESVkFHJNePHotFh5GsM9S+lyH6Yhf4jQ==
X-Received: by 2002:a2e:5757:0:b0:295:a956:5db1 with SMTP id r23-20020a2e5757000000b00295a9565db1mr470822ljd.18.1677844531578;
        Fri, 03 Mar 2023 03:55:31 -0800 (PST)
Message-ID: <b16b282ceb630dc641babfccd209f12ca4aa9fd5.camel@gmail.com>
Subject: Re: [PATCH v5 3/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
  xen-devel@lists.xenproject.org
Date: Fri, 03 Mar 2023 13:55:30 +0200
In-Reply-To: <b4adc3c2-6356-c552-93a3-c2a66ec53a04@suse.com>
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
	 <9de74cc424d5f198ac76ff46394aa5b99502d24e.1677839409.git.oleksii.kurochko@gmail.com>
	 <b4adc3c2-6356-c552-93a3-c2a66ec53a04@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-03-03 at 12:29 +0100, Jan Beulich wrote:
> On 03.03.2023 11:38, Oleksii Kurochko wrote:
> > The following changes were made:
> > * make GENERIC_BUG_FRAME mandatory for ARM
> > * As do_bug_frame() returns -EINVAL in case something goes wrong
> > =C2=A0 otherwise id of bug frame. Thereby 'if' cases where
> > do_bug_frame() was
> > =C2=A0 updated to check if the returned value is less than 0
> > * Switch ARM's implementation of bug.h macros to generic one
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V5:
> > =C2=A0* Nothing changed
>=20
> I'm glad this isn't true, and the change to common/bug.c ...
>=20
> > ---
> > =C2=A0xen/arch/arm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0xen/arch/arm/arm32/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0xen/arch/arm/include/asm/arm32/bug.h |=C2=A0 2 -
> > =C2=A0xen/arch/arm/include/asm/arm64/bug.h |=C2=A0 2 -
> > =C2=A0xen/arch/arm/include/asm/bug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 75 +-----------------------
> > --
> > =C2=A0xen/arch/arm/include/asm/traps.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 -
> > =C2=A0xen/arch/arm/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 81 +-----------------=
------
> > ----
> > =C2=A07 files changed, 4 insertions(+), 161 deletions(-)
>=20
> ... is gone.
Thanks for clarification.

I had to add this information.

It is gone because the first patch of the patch series was
updated and the changes from common/bug.c which were in
the previous version of the patch has been removed so after
rebase they disappered in the current patch.

~ Oleksii

