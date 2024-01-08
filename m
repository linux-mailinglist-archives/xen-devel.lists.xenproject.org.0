Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A82948271C5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 15:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663563.1033530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMquo-00028G-Sm; Mon, 08 Jan 2024 14:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663563.1033530; Mon, 08 Jan 2024 14:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMquo-00025A-Q1; Mon, 08 Jan 2024 14:47:46 +0000
Received: by outflank-mailman (input) for mailman id 663563;
 Mon, 08 Jan 2024 14:47:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HHUo=IS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rMqun-0001gA-3v
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 14:47:45 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1e8a316-ae34-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 15:47:44 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cd0c151cdcso20925841fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 06:47:44 -0800 (PST)
Received: from [192.168.223.212] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a2ea711000000b002c9f75a48fcsm1648509lje.16.2024.01.08.06.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 06:47:43 -0800 (PST)
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
X-Inumbo-ID: e1e8a316-ae34-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704725264; x=1705330064; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bx+FvAES2crKFitUdJ/cluZjjjxfEPDjcz5e7ln5OeA=;
        b=NqXa6AeEmhlf/a4HveUMJw11JgsOhqRhAWDj6IVwaymJKsifQgYQSHkc1bd/Ug4cmj
         g193pTQtGa0+Hmks+VuriaprpPhCVzzpErLOQCzzbTY3SY6qW4fhpI+rIymIk137wTES
         1mSrkI92Ea1zHHKRLDIGvA/S2pWPjSydXFnq19l+FX+kuCCHI+B3tNZNiI3i37dn+S9k
         gcr/wspjR1Wjfsbp/1VKq4ffsEozR5iHOXh4d8AS/Km1XByWn7X8ClupoXyyy3zBz23P
         h/60uXC07Z5kZYnnQqWvsNHkvBf6XfPpReAdYTU4JAnVBC8TBUseYUx0rf2tO5A0FVId
         OXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704725264; x=1705330064;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bx+FvAES2crKFitUdJ/cluZjjjxfEPDjcz5e7ln5OeA=;
        b=ULsBLAM4RU+Uu6BmADx+C9jBGSOwn0vBsRB+EDtX6/DFw/Qcr2CxWNvogziOunMY+Y
         sUjVwkPUrR3jSyEn8gZvjkJMrfxTlyS4nE9JRUR4HNnH5qBrAb3dfPse+OSGuseLucbD
         1vOCONixbjSKtE4ebXd0AxrHN7fTSZRwD+FPgYkFSZWrL+TWWKbxlSTJb8dNRb+9EFJM
         KKqAtpfYr0HDLnFNo2uVcoscJGKV4+hJo0QMbNko4/VzwCPAu3nno00g9+ZehlEy1jZ7
         uLR3bSqqjzpX7D2M2fxC64YaIqx/r0kUGh8vGwuBI+A7oP85/Der+ml0mFxPZPszQrId
         5AiA==
X-Gm-Message-State: AOJu0YzLhY7m+RduxUEOhm7VDHIuqrlRLzY2uLNjQ7vKMjhO9vaXxR2K
	xund795ZWI58xk5NyoMLW9g=
X-Google-Smtp-Source: AGHT+IHUReX77pOihoppwpJnMWAF4utlzWnN8BH5Rd8rM/5LeG8sNet4hjvf7TeG5qdlYwo7exkQCA==
X-Received: by 2002:a2e:8e99:0:b0:2cd:2333:d104 with SMTP id z25-20020a2e8e99000000b002cd2333d104mr1472552ljk.14.1704725264197;
        Mon, 08 Jan 2024 06:47:44 -0800 (PST)
Message-ID: <4093021516122490884f892dcc7210a6377afcef.camel@gmail.com>
Subject: Re: [PATCH v3 06/34] xen: avoid generation of empty asm/iommu.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Mon, 08 Jan 2024 16:47:40 +0200
In-Reply-To: <b1731dc3-96e3-4763-9bd4-978f44e3a6a9@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <e2a51f6197fce8f2ad636885ed231a6725d4cd8a.1703255175.git.oleksii.kurochko@gmail.com>
	 <b1731dc3-96e3-4763-9bd4-978f44e3a6a9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-01-04 at 12:04 +0100, Jan Beulich wrote:
> On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> The change looks okay-ish, but again needs a description: You want to
> explain why you use the absolute minimum of the scopes the two (or,
> in principle, possibly more) #ifdef-s cover.
Sure, I'll add a description to the commit message.

~ Oleksii

> > --- a/xen/include/xen/iommu.h
> > +++ b/xen/include/xen/iommu.h
> > @@ -337,7 +337,9 @@ extern int
> > iommu_add_extra_reserved_device_memory(unsigned long start,
> > =C2=A0extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t
> > *func,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 void *ctxt);
> > =C2=A0
> > +#ifdef CONFIG_HAS_PASSTHROUGH
> > =C2=A0#include <asm/iommu.h>
> > +#endif
> > =C2=A0
> > =C2=A0#ifndef iommu_call
> > =C2=A0# define iommu_call(ops, fn, args...) ((ops)->fn(args))
> > @@ -345,7 +347,9 @@ extern int
> > iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
> > =C2=A0#endif
> > =C2=A0
> > =C2=A0struct domain_iommu {
> > +#ifdef CONFIG_HAS_PASSTHROUGH
> > =C2=A0=C2=A0=C2=A0=C2=A0 struct arch_iommu arch;
> > +#endif
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 /* iommu_ops */
> > =C2=A0=C2=A0=C2=A0=C2=A0 const struct iommu_ops *platform_ops;
>=20


