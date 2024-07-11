Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC84292E1A4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 10:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757155.1165886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRotk-0000eo-TE; Thu, 11 Jul 2024 08:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757155.1165886; Thu, 11 Jul 2024 08:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRotk-0000cS-Pj; Thu, 11 Jul 2024 08:11:28 +0000
Received: by outflank-mailman (input) for mailman id 757155;
 Thu, 11 Jul 2024 08:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRotj-0000cM-I0
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 08:11:27 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2abe373e-3f5d-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 10:11:25 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso776118a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 01:11:25 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6e58fasm231991866b.71.2024.07.11.01.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 01:11:24 -0700 (PDT)
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
X-Inumbo-ID: 2abe373e-3f5d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720685485; x=1721290285; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ski3KaAASaMixjFW/NtulBZ/LZy5KVyx+BCDyESJ1Ks=;
        b=RriGjRgrhr0h4LdNWom0NrxYSFZeO5S6hTFyEE1sYDAQ34zBqUnlAjStrtaCIxnen0
         /AG4tnAbMBq5+g01FxCY+OkTGjKAfT/mUkr7JW/XNVjgPcMABCLaQnylc+FxgwRza9HZ
         0GQAKZ2jS8wbnLkDgYviRBaLXqcFiW2A9ZgNPwMGU2muroTGSpLsADLUGRhEzTkcDUjo
         cixdKeq7FU40VwAKgozsE9XKfUlkMSEcsIMGZlln809Mqbnm/wtR0yEXiyC+fHxRUd5U
         eOuf5kDKITKRhP24Yx7/5Zg8XZ4b41wOt5og1TGHUnpFOxQ4dCDQWfOZd6TvXECdCW3J
         9ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720685485; x=1721290285;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ski3KaAASaMixjFW/NtulBZ/LZy5KVyx+BCDyESJ1Ks=;
        b=d2uUA5XMG6Iq9tdf+JdpRwpRYn8YqKpL2ismP9nHLqpZH5kYnnuNrAePUZPsFCsLsW
         G67UE2pOwiefh5RewMM2KCDEkgYNgGz2KD4/VNdaEXEUEiGQ7NcdnFMxmhntnRKOYhPP
         FP9+GNGkqR7/sDwDPzI9+QQDcGCCXq4JvS8GpOYufQPXvV1fChD25iQ5oCtZnUknCdDA
         283a8BBUKR+6E7Y2TFbdkJ7xh/rx8DRTvI7CQZtzeb0YDP2BUx2AFRblZomnj3+V90HO
         r0ZJ7iUZ6QZyFq7jj6t5Y2lqsJr/gX4IfWmPFoqzrrQmYHbgy/hk+o75SosSzGZYL2fU
         fpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnK6ZXefNKVazsCeeNl1EZw1W+kiNwnFKDI061sYgWtg3iBjtZaoYdIe/Td0888Vzd1UlI5MYl+2eMTCuWrAPfvmfhb3KbA3WJBlu2sxY=
X-Gm-Message-State: AOJu0YxZ18zN4miN6aIkODXCgdWYP3RiTOLquj7r8BeMHCI5HfulFkOp
	YczfND9sHVuX0IbqEvRsc68PV5ztvCEhh6zUeS65eXwKzhDIQrmd
X-Google-Smtp-Source: AGHT+IF5IRSklCAJD8fLYA7HCrbi+oW0loAUWpSzNZZSpI8X1S5o7AF77L+rrrDuU3+ElyGFsUgPrw==
X-Received: by 2002:a17:906:d105:b0:a72:7245:ec0a with SMTP id a640c23a62f3a-a780b881ccfmr471630366b.58.1720685484484;
        Thu, 11 Jul 2024 01:11:24 -0700 (PDT)
Message-ID: <c26ee4258d9bc83ad69db3d4b4c10d1dc920c071.camel@gmail.com>
Subject: Re: [PATCH for-4.20 v2] automation: Use a different ImageBuilder
 repository URL
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Michal Orzel
	 <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>
Date: Thu, 11 Jul 2024 10:11:23 +0200
In-Reply-To: <98fecf96-ab8e-4514-a3e9-a1f0b15519c1@citrix.com>
References: <20240710093751.25154-1-michal.orzel@amd.com>
	 <98fecf96-ab8e-4514-a3e9-a1f0b15519c1@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-10 at 10:44 +0100, Andrew Cooper wrote:
> On 10/07/2024 10:37 am, Michal Orzel wrote:
> > Switch to using
> > https://gitlab.com/xen-project/imagebuilder.git=C2=A0which
> > should be considered official ImageBuilder repo.
> >=20
> > Take the opportunity to truncate the git history when cloning using
> > --depth 1.
> >=20
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> Given the current overhaul I'm (still) doing for CI in 4.19, I'd
> suggest
> taking this.

-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone https://gitlab.com/xen-project/imagebuilder.git

But is it the same imagebuilders and only location is changed?

~ Oleksii

>=20
> It will mean an 8-month improvement in switching over fully.
>=20
> ~Andrew


