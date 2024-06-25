Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE434916DF5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 18:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747966.1155501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM8wq-00008r-Lz; Tue, 25 Jun 2024 16:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747966.1155501; Tue, 25 Jun 2024 16:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM8wq-00005w-Ig; Tue, 25 Jun 2024 16:23:12 +0000
Received: by outflank-mailman (input) for mailman id 747966;
 Tue, 25 Jun 2024 16:23:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM8wo-00005q-LX
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 16:23:10 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34bbe37e-330f-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 18:23:07 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57d1679ee6eso9846501a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 09:23:07 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3006d36bsm6126479a12.0.2024.06.25.09.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 09:23:06 -0700 (PDT)
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
X-Inumbo-ID: 34bbe37e-330f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719332587; x=1719937387; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hMqCIJfKMUq9PKoff/Nt6wmO4mUo/wjOqMlKbEmwtjE=;
        b=gECnxRqqAC+B7pQE9kNgrmiF8UYVhix6jLta0AWl5MUVOyjDEuFa2vHEOSDbjxs1Pm
         bxEcQXgXeSYXGMqEsfQq58RYUUt5vkatwPTVWz3jdG3ZScYXU/3Psru1Z2wvS7d2cMpW
         D6M++1T1DJPTIa5Cs3N2fFeG5s6GhUwDiMadq25oOhdbCUskWy8PuaP1L7gJCgQ8y9Mu
         +1ig2yF2+gH1XLEEQUxW7CIrQ4mMaR2p/2m+Akuov0LjYwjkiyubURU5Al5Vv3pU2LKt
         XG2Sdqs6PchQQG5jRMLuis07N8iX+nEz0ro3+eqXCNslEc6U9CZ8FdAbp8e+3lTmAL1K
         3r4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719332587; x=1719937387;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hMqCIJfKMUq9PKoff/Nt6wmO4mUo/wjOqMlKbEmwtjE=;
        b=CtP/P29B3ZlRGZpRaPyZlphjeRLpyODDRQXh7kyvRMeXI2nQzvBXrApxX9x9QVTyC1
         ujkmc5KpX/5aJbLsKpmgcXeRAUt+ydSZgVmZwx9BVpEX/GwVAeQ1oV5MGrqHuffF7+G2
         YnonERpMl5ztRGYyUkgY9a1dD5KemoZsMCw65AV5BVzXN6T/fcpG++KwhQzMWO5sjmOR
         EBFN9EueUDCCRAhwVLiYTRr2+uc1OPqWhBkj7LEAXI9b+5Kud1rBQ/i3HYAffgQl05o1
         CvaGE+GOPvrSsbCMkcXxSjfPF8TaOdba6ktziq1cJYjRGDUjQkDW60ShVaZvtDBL9x6L
         Aosw==
X-Forwarded-Encrypted: i=1; AJvYcCU/0mfKmOlQv6RCo8HC/V2jobkJ7b6W77GWh+D2La0XsNJQxVI7lrp2W0peROOLUeohbGYPGZeqAu4peQajMyIZEigYwub5NatrrL/yKXY=
X-Gm-Message-State: AOJu0YwC4pmvl0ZSxQKnFJsiYvLtbcRzogokOtLFKBeLJHmLNbwwWKdy
	y1ozbFPqp2yD5v2Q2QrlVPkbrGQxENYq5XZBi0uvFBadDZ8sTAISrGkB2lGA
X-Google-Smtp-Source: AGHT+IHiT0gOZZWWLswYD4JqPq7CYXAQTF+yGDIF4NafhSWkwOgUjKaqIpKoHct4Nfw1YrBcH/u/eQ==
X-Received: by 2002:a50:d65e:0:b0:57c:a4a3:f1fe with SMTP id 4fb4d7f45d1cf-57d7022c35bmr2618737a12.17.1719332586723;
        Tue, 25 Jun 2024 09:23:06 -0700 (PDT)
Message-ID: <c52181a7aca8b56716d7ee354ebda9d32e67816c.camel@gmail.com>
Subject: Re: [PATCH v13 07/10] xen/common: fix build issue for common/trace.c
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Date: Tue, 25 Jun 2024 18:23:05 +0200
In-Reply-To: <4a4e37a9-eac7-4e72-8845-6b4bbd7bafe6@suse.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <f14f2c5629a75856f4bafdbff3cc165c373f8dc2.1719319093.git.oleksii.kurochko@gmail.com>
	 <4a4e37a9-eac7-4e72-8845-6b4bbd7bafe6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 16:25 +0200, Jan Beulich wrote:
> On 25.06.2024 15:51, Oleksii Kurochko wrote:
> > During Gitlab CI randconfig job for RISC-V failed witn an error:
> > =C2=A0common/trace.c:57:22: error: expected '=3D', ',', ';', 'asm' or
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '__attribute__' before
> > '__read_mostly'
> > =C2=A0=C2=A0 57 | static u32 data_size __read_mostly;
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> If you give a release-ack, this can go in right away, I think.
Release-Acked-by: Oleksii Kurochko  <oleksii.kurochko@gmail.com>

~ Oleksii

