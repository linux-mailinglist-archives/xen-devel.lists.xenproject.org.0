Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E083854917
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 13:21:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680716.1058796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raEGf-0004vf-6i; Wed, 14 Feb 2024 12:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680716.1058796; Wed, 14 Feb 2024 12:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raEGf-0004t1-3X; Wed, 14 Feb 2024 12:21:37 +0000
Received: by outflank-mailman (input) for mailman id 680716;
 Wed, 14 Feb 2024 12:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raEGd-0004rR-Fz
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 12:21:35 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97001d7e-cb33-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 13:21:33 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2d7e2e7fe0so131400366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 04:21:33 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 qb35-20020a1709077ea300b00a3840fbeef9sm2257224ejc.70.2024.02.14.04.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 04:21:32 -0800 (PST)
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
X-Inumbo-ID: 97001d7e-cb33-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707913293; x=1708518093; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Aqu1pzReXGCcQGJ62RxsKSX1lKOwf9R4esB0hrUWg7E=;
        b=Fu8bbS/DWa0slUos+Kz1cRsJUhrCyX2p0EBiT2srf12lAW5OAEzmehwnxetENrTFVp
         WaNiHmSqufJQ3unxr6qZ1SQczgezWJL1UPCSsLMf8K6PXUCJZKIuE48XHOvztTBNpMf3
         PoIO7w1DD8ZtBvK0WoPySoc//OS1yvCSNXBJooZRL4KpD7RvXi5Nh25fKU+GPNPVKdD3
         U9/riYSSbcw9vdIr8XIfPTpBf0i11JQyGSJCzdScIlk0m6OIzKkbVxrHc9Uha0QSft9V
         D4Ia8avh6g/SXblMIFI1sx4OMBXIv/EzDtqVni+23bhJwJ+qeM4v01ieSMME5BGC7CdZ
         H/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707913293; x=1708518093;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aqu1pzReXGCcQGJ62RxsKSX1lKOwf9R4esB0hrUWg7E=;
        b=jSZ80dFphu4CNLah9MVPFNgCSC5VKzGt9oDaRe/7fZUpJ03YIgV74zXWwxHsGv5wjS
         RZT6eFGbZXy59jleMx1VjbIIdUstznhA3wmMosd4BhPYS0Umw4Ctwag2npf9kDnr41gk
         wU5g76LNSWtYHDJiXcHQJTPZTojEm1ZTvl1toj72Hu+uL5Rc9yHg0NBLLwkAE6jaEFQt
         c+U2DWU2LvfEY5R7Ch5gl1cf4MXSAH4NTPegpydTh3j4uvPaQ1fUfr224Z9IEW+0+nQu
         gGY4g0cRq1wi3iRdTPQe5XzLOnTamXAWrtWtvmtmglabfnpW+poMoth9qeoK0TSwbpm+
         OIiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtraxhbAGVUdN2pu+SCKvFzs/GNOTaAPHuVCMcRVaaGmrl+HoJLTJASk8GURalnIKV1MzaxTP4CCUp7H6eW+oVEE8UCsV4HQL21bgHaIs=
X-Gm-Message-State: AOJu0YzISFhGiBEIa//DytAEsBFHbaaqSTWZDOrJMEGHqVw1A/CFU9NJ
	U9TyNckG46O2QF/N+/04unz7gVu5/w5sR2ydnSYLjUM0hAj6WmDk
X-Google-Smtp-Source: AGHT+IHgSyZjknsoS3eVmO0IjIwoFtHC61etgbM/wfT5AYEt/1d/GZ+pG3DoS/J76TIZoHf2lxZ1CQ==
X-Received: by 2002:a17:906:2614:b0:a3c:698:635f with SMTP id h20-20020a170906261400b00a3c0698635fmr1496045ejc.28.1707913292778;
        Wed, 14 Feb 2024 04:21:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNkUa3gWujoZTuqWzPYaCRP+QxwMjBUyik8pAgbXd5daCCThMKgTC5mnmWY1Abwue02IuKSfGq89s40F3Y86IUNbekuOOIpaUqDCfjI0dsri2nzp+O40i/JEFSq/WgGy3UxpZiNOo05qv6TuruKO0DyjL2J/a2m1f9SayTZbxOvAqlnosDUvQcUKTKM9f0fAxAVvyhrdBqZWEx3nY=
Message-ID: <4b7ff366d58089a1c755c01cef21c503f408464b.camel@gmail.com>
Subject: Re: [PATCH v4 30/30] xen/README: add compiler and binutils versions
 for RISC-V64
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 13:21:31 +0100
In-Reply-To: <16162577-dc0f-4c4b-acd5-9c2519f94c9a@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <d62dff38ee661f3fb713554d544c966fa889fd83.1707146506.git.oleksii.kurochko@gmail.com>
	 <16162577-dc0f-4c4b-acd5-9c2519f94c9a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-02-14 at 10:52 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0Changes in V4:
> > =C2=A0 - Update version of GCC (12.2) and GNU Binutils (2.39) to the
> > version
> > =C2=A0=C2=A0=C2=A0 which are in Xen's contrainter for RISC-V
> > ---
> > =C2=A0Changes in V3:
> > =C2=A0 - new patch
> > ---
> > =C2=A0README | 3 +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/README b/README
> > index c8a108449e..9a898125e1 100644
> > --- a/README
> > +++ b/README
> > @@ -48,6 +48,9 @@ provided by your OS distributor:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For ARM 64-bit:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 5.1 or later
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.24 or=
 later
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For RISC-V 64-bit:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 12.2 or later
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.39 or late=
r
>=20
> And neither gcc 12.1 nor binutils 2.38 are good enough? Once again
> the
> question likely wouldn't have needed raising if there was a non-empty
> description ...
I haven't verified gcc 12.1 and binutils 2.38. gcc 12.2 and binutils
2.39 were chosen because this veriosn is used in Xen contrainer for
RISC-V, on my system I have newer versions. So this is the minimal
versions which would be always tested and I can't be sure that the
lessser version will work fine, as there is not any compilation testing
for that.

>=20
> Also - Clang pretty certainly supports RISC-V, too. Any information
> on
> a minimally required version there?
I haven't verified that. I am only testing gcc for now.
I can add this information to commit message.

~ Oleksii

