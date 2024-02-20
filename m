Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A0485B96C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 11:45:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683385.1062870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNct-0004rE-9D; Tue, 20 Feb 2024 10:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683385.1062870; Tue, 20 Feb 2024 10:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNct-0004pA-6T; Tue, 20 Feb 2024 10:45:27 +0000
Received: by outflank-mailman (input) for mailman id 683385;
 Tue, 20 Feb 2024 10:45:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvC9=J5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rcNcr-0004p1-E0
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 10:45:25 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26d5e8a2-cfdd-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 11:45:24 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-512a96e44e2so3450350e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 02:45:24 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 cs1-20020a0564020c4100b005617cebd051sm3531686edb.78.2024.02.20.02.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 02:45:23 -0800 (PST)
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
X-Inumbo-ID: 26d5e8a2-cfdd-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708425924; x=1709030724; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XeAtqMosQ2BTmzAb3KiVdCjPDLekNTwtpeI5gDo9Euk=;
        b=jy4a2sViA+ruDGkMl8DnAdhOF82VGTZCiJ34PL4iPMW3mD5Sj4DHHHpKxppt0sAkRj
         FPSxPx+AN+RJ/BG3HIGOGxTNTbxtj89EQOD8kAV3P4L1+W+iE9JVhrfDeGe0UG4F0acY
         zFzu4gi/2ZHUxvnx5vuCjMyl1KmAqRLIaAS71qWSFUc9Eu3Q6AvqjWXankeyP3aifV7j
         WqkCbVhRoe4jhiIzzoSxTAFNpaQ5IMUcLQdJof7YIO3qphnt7hy4ZkuNZ+YNOdO7hSPO
         wZL5cHk4pIRy0ko5NT6506HbkDyv4mej80moIMtGtl+RFAmZM/ilZ8dWLt/GlHBM5Pq3
         8mKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708425924; x=1709030724;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XeAtqMosQ2BTmzAb3KiVdCjPDLekNTwtpeI5gDo9Euk=;
        b=kYxmF9EvuEBd6lhc/L/4Ebstzi1DZ7b5RC5SN4ajHOcP9Bz/nqQFvd/f33svhtvWf+
         5lN9CtrDrf4swrCbxzp3ui6b4jOjHZWZHrgibRFm3ML9nXM4j0XQCct9wkteG/UjAmkR
         bvV5JmrtU7GbzWwonoNLkyKxp+7Si7U42yo/XHvh39hBIf900xlgzTqm51M4T+NQyTgD
         huNJVLVUvv+ZvUjkvWqpl8NXR+FAD3hafb5tQorkMx4jWyH7W3JpkK4VCNvW2dClX55E
         g66npyV4dsWxEZ5QitV4mMko8Pqk8NnllV1CsRQ/nyVFn5XzsCMMZqHnfnxmwdAEREYx
         QTzA==
X-Forwarded-Encrypted: i=1; AJvYcCVy3p2L8sjBIwEo6/HIAdt4lQZGjlzTvYP97oW+R9UlG1hYr/ehPx8DpFJvDHzbBZVG+Lf/A0sh/kpQEpu1pEc9iZW0JvYgG4ZjSCOqpwg=
X-Gm-Message-State: AOJu0YwUu0dJV8a3QUUy62SlRV2Zb2ZTypeoFAzu9p0s9EhDj5QIeqik
	FpI3+K2LwtXurmX+vEdcVZRhhuLTxZGDAJ2lim90PiDJH7Ql0D2u
X-Google-Smtp-Source: AGHT+IHc4cvjQ6hx+yVLRYVGLgvmVH/olkOmZzFEsfL6OPWz8qUEiRQAjUOcwpYNVLDFiN1EOxnhtg==
X-Received: by 2002:a05:6512:238c:b0:512:caa2:23da with SMTP id c12-20020a056512238c00b00512caa223damr653221lfv.22.1708425923461;
        Tue, 20 Feb 2024 02:45:23 -0800 (PST)
Message-ID: <806552bc18430cdc9e6dae9fa3321e4f77b22317.camel@gmail.com>
Subject: Re: [PATCH v9 7/7] xen/asm-generic: fold struct devarch into struct
 dev
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Date: Tue, 20 Feb 2024 11:45:22 +0100
In-Reply-To: <7a2ed74d-a773-4dc1-8331-a1ee28b17f4a@xen.org>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
	 <3a5bf394a9d95a28cecac996f6e0decb788c19fd.1708086092.git.oleksii.kurochko@gmail.com>
	 <7a2ed74d-a773-4dc1-8331-a1ee28b17f4a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Mon, 2024-02-19 at 19:00 +0000, Julien Grall wrote:
> Hi,
>=20
> On 16/02/2024 12:39, Oleksii Kurochko wrote:
> > The current patch is a follow-up to the patch titled:
> > =C2=A0=C2=A0=C2=A0=C2=A0 xen/asm-generic: introduce generic device.h
> > Also, a prerequisite for this patch is, without which a compilation
> > error will occur:
> > =C2=A0=C2=A0=C2=A0=C2=A0 xen/arm: switch Arm to use asm-generic/device.=
h
> >=20
> > The 'struct dev_archdata' is exclusively used within 'struct
> > device',
> > so it could be merged into 'struct device.'
> >=20
> > After the merger, it is necessary to update the 'dev_archdata()'
> > macros and the comments above 'struct arm_smmu_xen_device' in
> > drivers/passthrough/arm/smmu.c.
> > Additionally, it is required to update instances of
> > "dev->archdata->iommu" to "dev->iommu".
> >=20
> > Suggested-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0=C2=A0 This patch can be merged with patches 4 and 5 of this patc=
h
> > series.
>=20
> I am a bit puzzled with this comment. If this is the case, then why
> was=20
> it done in a separate patch?
>=20
> I know I suggested to create the separate patch but this was only in
> the=20
> case you decided to handle it after this series is merged. So this=20
> should have been merged when sending. Maybe I should have been
> clearer.
I can submit a new version of the patch series in which this patch will
be incorporated into patches 4 and 5, respectively.

In this case, should all the "reviewed-by" and "acked-by" tags for
patch 4 be removed?

>=20
> Anyway, regardless that:
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>
Thanks.

~ Oleksii

