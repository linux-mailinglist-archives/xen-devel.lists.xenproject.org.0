Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F7692E2D3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 10:56:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757189.1165956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRpay-0001Oi-Dy; Thu, 11 Jul 2024 08:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757189.1165956; Thu, 11 Jul 2024 08:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRpay-0001Lt-B3; Thu, 11 Jul 2024 08:56:08 +0000
Received: by outflank-mailman (input) for mailman id 757189;
 Thu, 11 Jul 2024 08:56:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRpax-0001Ln-3a
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 08:56:07 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 679a7241-3f63-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 10:56:05 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a77af4cd570so50561866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 01:56:05 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff238sm235328966b.138.2024.07.11.01.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 01:56:03 -0700 (PDT)
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
X-Inumbo-ID: 679a7241-3f63-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720688164; x=1721292964; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aX22Hi2Iuek7kmHUsMQZ/wQTZYyIy6jVS7sp9HZJ18E=;
        b=TWRZowPNe85cNvDN+RseFQjtyi6ry10JpU+dpvDwem7SSi2tLEgxm0zjPboyaK/IvJ
         eRO2ECb26zKoi5dLQ+/tgetV04r2WsqEVDjK0Gbc5QGu6q/FeehyM3aVDFeWYEHisl0B
         Gj6Pr8d7mDNcq/i+XffoKAaFQ/GSJd9m+NzO/MfADTiWLhnKtiORnjAJ3aTVg6wHe8Sc
         /l6hucmODCIUhudteL6fGlh0ks8u9H/NSZibf+mro6w/jI4gGU2s4W8T8feBzA51Upig
         Nkwc3mFW7FuYlTY2BSQtA6t+Ga9t7UzNsEaEqeEJBfFLkkK76fEhdGM4bqXlzQrnSX7G
         P/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720688164; x=1721292964;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aX22Hi2Iuek7kmHUsMQZ/wQTZYyIy6jVS7sp9HZJ18E=;
        b=PI2vpKIBH8mLzTqvbv0mEVTg16KUQhbCPWXsZzIhlcwIzeLMtfwExOsV3q5zx55kZO
         ZYwaxdjOT8wAdbbdZfXNbr3626APSolAhGc/DXLOUtJ4s17uP9cT2lfXXBFuhUlxGXbp
         GZlvqEmulMgtzmo01y7eas1kxWHFYuL2Xdkgdo1REg06268ea0oY3v3RB8/b+DGccBAz
         e3W++UowAl67WorX5iOn8fJcNlIEh2FPy/zWIOmRInmgFnF8AlZNI00uaxLb7zeY+xob
         ufiNEb+ntOkBAs+C3esPphCvgcfuNSKF6HziFJrla7DE8fGywyGUscmJfDEWB5Lh14Cn
         ahfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp/GhfcpO6Wg16F3SpubVQopuSknHH40iKa7OR4SJnA7jXMmchD4N3yW89Jm7lgfFs2P0YI9t4xj/knlEE1Gwgsq8rPykYJcfGmpyZqA0=
X-Gm-Message-State: AOJu0Yz52KUsJz1ICWL6KiSs0cmbLhV9sV+59yW/Y6xAcHVUGfaS+LET
	YUZ6d3bNlmOyYut3Wc5p0C4uA0UiJ4i/N9wkSX8bDjogGguQLh9d
X-Google-Smtp-Source: AGHT+IGrSv+4RNW2DUgQsR+WCxh7Oqj8Id1lsZHQez1fGovmn0ime0UCOGL5W5/aRPMn2Xf/8B93pQ==
X-Received: by 2002:a05:6402:6c6:b0:587:2dd1:4b6c with SMTP id 4fb4d7f45d1cf-594bc7cabe8mr7310242a12.30.1720688163907;
        Thu, 11 Jul 2024 01:56:03 -0700 (PDT)
Message-ID: <350bf2a96c38e02016e40a7f81a0b65501225f7e.camel@gmail.com>
Subject: Re: [PATCH for-4.20 v2] automation: Use a different ImageBuilder
 repository URL
From: Oleksii <oleksii.kurochko@gmail.com>
To: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>
Date: Thu, 11 Jul 2024 10:56:03 +0200
In-Reply-To: <be1517ee-bd5c-42b0-8328-aa277680b935@amd.com>
References: <20240710093751.25154-1-michal.orzel@amd.com>
	 <98fecf96-ab8e-4514-a3e9-a1f0b15519c1@citrix.com>
	 <c26ee4258d9bc83ad69db3d4b4c10d1dc920c071.camel@gmail.com>
	 <be1517ee-bd5c-42b0-8328-aa277680b935@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-07-11 at 10:14 +0200, Michal Orzel wrote:
> Hi Oleksii,
>=20
> On 11/07/2024 10:11, Oleksii wrote:
> >=20
> >=20
> > On Wed, 2024-07-10 at 10:44 +0100, Andrew Cooper wrote:
> > > On 10/07/2024 10:37 am, Michal Orzel wrote:
> > > > Switch to using
> > > > https://gitlab.com/xen-project/imagebuilder.git=C2=A0which
> > > > should be considered official ImageBuilder repo.
> > > >=20
> > > > Take the opportunity to truncate the git history when cloning
> > > > using
> > > > --depth 1.
> > > >=20
> > > > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > >=20
> > > Given the current overhaul I'm (still) doing for CI in 4.19, I'd
> > > suggest
> > > taking this.
> >=20
> > -git clone https://gitlab.com/ViryaOS/imagebuilder
> > +git clone https://gitlab.com/xen-project/imagebuilder.git
> >=20
> > But is it the same imagebuilders and only location is changed?
> That's the same project but the repo under xen-project is more up-to-
> date and we decided
> that it should be considered the official repo location.
Then I am okay to have this change in 4.19:
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

