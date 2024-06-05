Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49978FD1D1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 17:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735796.1141915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEsiD-0000Wv-7A; Wed, 05 Jun 2024 15:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735796.1141915; Wed, 05 Jun 2024 15:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEsiD-0000UY-4R; Wed, 05 Jun 2024 15:38:05 +0000
Received: by outflank-mailman (input) for mailman id 735796;
 Wed, 05 Jun 2024 15:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EJva=NH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sEsiB-0000UQ-UB
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 15:38:03 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97a7c53a-2351-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 17:38:01 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-354f14bd80cso1845935f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2024 08:38:01 -0700 (PDT)
Received: from [172.20.145.106] ([62.28.225.65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04cac9asm15009131f8f.34.2024.06.05.08.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 08:38:00 -0700 (PDT)
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
X-Inumbo-ID: 97a7c53a-2351-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717601881; x=1718206681; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ym7yS0328xIlnOfuHV3e2nWXc5hhw5wVpnMaW2renGQ=;
        b=iiYUCycdCQexTx+BAAGu6PvMoKNTm0nV4BwUsevjN1owuVtpsSZX/0vH/LfnKQsH/I
         Kc9Q3T9N+dSw9iety3WLMM5H4wdt3CsUxIWxrG12AVdXP9/V9OACEQ1Y70sHXxeAaN1Q
         +RqQghFHhhuYp1t5nX0uMOTITz7jidJ+6e8RTcVRbSbCv7RWk9+LPCaNTgNcW25u0CO4
         EsOKcgSds7Og0+EezlBPpMr7qnRv8YjAy8ecRMsT9BzdleuNIU+isTu4eubHKWxXZYi0
         j0RmydlbnoVOmZDGhX50vxJcG1/z+KEfZDnmzefxt6FPrOUcQYQLwzhbNn+Ap7UwTeyH
         1JXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717601881; x=1718206681;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ym7yS0328xIlnOfuHV3e2nWXc5hhw5wVpnMaW2renGQ=;
        b=TWdnW+jV2WmnqZdsKRD0Gm75SO0CFG0nMj7XRBZH8i9MODdoCGNT3CKkEZY8x+YHNj
         Cbhspdoli6BteFJdOc8QxjLwvNNSIYrHGOlZ9iQlN+tvm28GFEbYGQJL8zB99C5ehUZS
         3c+jfqqQ50uRp7o3l5+WNgeJS+OEQcnsY5FehG+bH8W3oiRpWANIk03OpFivSCmfLXGu
         Qhrs32jFr3OZFFNv2lDAxVcGsmI9EuIpv1K8p4PsMT2q2XflBf3ufCWhz/FTDlErpTPz
         /IxuCcrl+ImGGkgimaL4Efy4AvgI8EocuMfq97z86VUkU3VYLSF3etT4uATcsZEr/3zH
         Z0Bg==
X-Gm-Message-State: AOJu0Yzq3cdt7J9akOBx8FhcgS812UlS/EGJyy6tefo82iMzYnqO+AlO
	O1AFr+r96/ep9ioqoGpZzT9aO+GBirXtanCEmLAOqTRueKSa/mvj
X-Google-Smtp-Source: AGHT+IG4P9lvgxwKbf2DlQZplABLJgH4D6fK78+E5+vYen2ih/l99muF0YbMMHS3mybqPWBdZ/GBlg==
X-Received: by 2002:a05:6000:400f:b0:354:c934:efa0 with SMTP id ffacd0b85a97d-35e8ef86d40mr2870062f8f.48.1717601880760;
        Wed, 05 Jun 2024 08:38:00 -0700 (PDT)
Message-ID: <d9252ecebbbc21f6498876ed845c32eea863cc80.camel@gmail.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: add more clean MISRA
 guidelines
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
	michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
	consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>
Date: Wed, 05 Jun 2024 17:37:59 +0200
In-Reply-To: <06615fc65a59dbe950bc462030a54906@bugseng.com>
References: 
	<3af20044d2906a6f873aac1b6dd2b41c5b9e0507.1717269049.git.nicola.vetrini@bugseng.com>
	 <11c999212a75ea0f043e90128d5321b41a79c305.camel@gmail.com>
	 <06615fc65a59dbe950bc462030a54906@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-06-04 at 14:01 +0200, Nicola Vetrini wrote:
> On 2024-06-04 13:39, Oleksii K. wrote:
> > On Sat, 2024-06-01 at 21:13 +0200, Nicola Vetrini wrote:
> > > Rules 20.9, 20.12 and 14.4 are now clean on ARM and x86, so they
> > > are
> > > added
> > > to the list of clean guidelines.
> > >=20
> > > Some guidelines listed in the additional clean section for ARM
> > > are
> > > also
> > > clean on x86, so they can be removed from there.
> > >=20
> > > No functional change.
> > >=20
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > ---
> > > +Cc Oleksii for an opinion on the inclusion for 4.19
> > >=20
> > > This is a follow-up to series
> > > https://lore.kernel.org/xen-devel/cover.1717236930.git.nicola.vetrini=
@bugseng.com/
> > > and depends on it (otherwise the gitlab MISRA analysis would fail
> > > on
> > > violations of Rule 20.12).
> > > If it is decided that the dependent series should go in for 4.19,
> > > then
> > > my suggestion is to include this as well, to the gating on more
> > > guidelines.
> > > ---
> > I just want to clarify if I understand you correctly. Do you mean
> > taht
> > the current one patch will be merged without dependent series that
> > gitlab MISRA analysis would fail? IIUUC then I am not sure that we
> > have
> > an option to have this patch without the dependent patch series.
> >=20
>=20
> Exactly, that's why I specified the dependency. This patch should
> have=20
> been part of the series, but I forgot to include it.
I am okay to consider this patches in Xen 4.19, but only in case it the
dependencies will be resolved properly and necessary Acked will be
recieved.

~ Oleksii
>=20
> > ~ Oleksii
> > > =C2=A0automation/eclair_analysis/ECLAIR/tagging.ecl | 4 +++-
> > > =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl
> > > b/automation/eclair_analysis/ECLAIR/tagging.ecl
> > > index a354ff322e03..b829655ca0bc 100644
> > > --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> > > +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> > > @@ -60,6 +60,7 @@ MC3R1.R11.7||
> > > =C2=A0MC3R1.R11.9||
> > > =C2=A0MC3R1.R12.5||
> > > =C2=A0MC3R1.R14.1||
> > > +MC3R1.R14.4||
> > > =C2=A0MC3R1.R16.7||
> > > =C2=A0MC3R1.R17.1||
> > > =C2=A0MC3R1.R17.3||
> > > @@ -73,6 +74,7 @@ MC3R1.R20.4||
> > > =C2=A0MC3R1.R20.6||
> > > =C2=A0MC3R1.R20.9||
> > > =C2=A0MC3R1.R20.11||
> > > +MC3R1.R20.12||
> > > =C2=A0MC3R1.R20.13||
> > > =C2=A0MC3R1.R20.14||
> > > =C2=A0MC3R1.R21.3||
> > > @@ -105,7 +107,7 @@ if(string_equal(target,"x86_64"),
> > > =C2=A0)
> > > =C2=A0
> > > =C2=A0if(string_equal(target,"arm64"),
> > > -=C2=A0=C2=A0=C2=A0
> > > service_selector({"additional_clean_guidelines","MC3R1.R14.4||MC3
> > > R1.R
> > > 16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.
> > > 3||M
> > > C3R1.R8.6||MC3R1.R9.3"})
> > > +=C2=A0=C2=A0=C2=A0
> > > service_selector({"additional_clean_guidelines","MC3R1.R16.6||MC3
> > > R1.R
> > > 2.1||MC3R1.R5.3||MC3R1.R7.3"})
> > > =C2=A0)
> > > =C2=A0
> > > =C2=A0-
> > > reports+=3D{clean:added,"service(clean_guidelines_common||additiona
> > > l_cl
> > > ean_guidelines)"}
>=20


