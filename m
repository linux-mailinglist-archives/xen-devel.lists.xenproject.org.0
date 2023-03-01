Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE536A7061
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 16:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504136.776686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOqR-0005Ek-PF; Wed, 01 Mar 2023 15:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504136.776686; Wed, 01 Mar 2023 15:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOqR-0005CN-MK; Wed, 01 Mar 2023 15:58:19 +0000
Received: by outflank-mailman (input) for mailman id 504136;
 Wed, 01 Mar 2023 15:58:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXOqQ-0005CH-4C
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 15:58:18 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0ce3cb6-b849-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 16:58:16 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id r27so18237507lfe.10
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 07:58:16 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05651c03c300b00293526a0c87sm1725471ljp.41.2023.03.01.07.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:58:15 -0800 (PST)
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
X-Inumbo-ID: e0ce3cb6-b849-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677686296;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZfXnK4d0VeFsg8K1Z4HldwOPmcJHk0PTWHtA3KgsIqA=;
        b=Ahte7p5A86eRrwxlyeuM7kisPOOdizsINjeRExClvhJN30efsfZOJzsd9WFJsd+ZZx
         UKN7pPhOu+cbAGeFPHw6jH4Kk4wrlra8Auh66nikSqjFB9O+Sz8fxzxdU5mfYSG2QzFS
         XZHLJodbiFVrLt6UYWLQZb2425e+zHtiwHCWsM4ilJfTcFmKY/koZDZdsdyu2GJKQ92Z
         8U78Ed+POt//GUbq52qm2+4yEkyrnobhZvQij/wudanmoe/ez7pA94G7vmHQwY0P8Uwp
         Tr7PncLy4eX+KX2kgJsIvb4XNB+pLqwOmd1lmF9OkBT1N8j3SW318sGER5pN5vdPXJRk
         UwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677686296;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfXnK4d0VeFsg8K1Z4HldwOPmcJHk0PTWHtA3KgsIqA=;
        b=fegPqMgguzubbkjfs44A32aVoAPk6ZqVX3CsbJlY2daUZhKYAT+D813oisFDKWm3lR
         6ikLYHsSM1qK7dAC8hWXQpG6jZZQch6aUOatxc6bEYaNRx0tImBQRhn+PbJ/t1rvzrCO
         f0ILCtBntdjT+Ss1scc7CIm/tZXRz7wm9sAx0dESft0zERn18F9W28yTah+f+XcAOC2s
         nEJ74m3KvfPgu7stQKJVEN6+zW3C5lwz8C/SECnauMNmXdiVbDL9BCtAJZb3NReaLWJd
         OVBdpQhAzcIp7ZPTvS3GuySwkNERHqRgxFEtHbJ7KyM6XwHxfbNFU18kq2mUE2K+stoE
         7TxA==
X-Gm-Message-State: AO0yUKWayUg+HVAeRq29+ajpH761F4YvUVJBsOQaZP0HhqHYANZCEWiF
	a34s57WT6mgL8Col9dOVlAA=
X-Google-Smtp-Source: AK7set/P2cLUxDQBs4MUtna0fNNMJXPCuqdHHDyxDAoHThvvFj1WbPFW6HqbuBXh5ks+c1vZQZwUKQ==
X-Received: by 2002:a05:6512:3b84:b0:4dd:8190:a26b with SMTP id g4-20020a0565123b8400b004dd8190a26bmr4422929lfv.13.1677686295846;
        Wed, 01 Mar 2023 07:58:15 -0800 (PST)
Message-ID: <ded901310f0cfc3774d01d6e4d0dd576b086cdae.camel@gmail.com>
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Wed, 01 Mar 2023 17:58:14 +0200
In-Reply-To: <0fd10ac8-6110-8299-b2b1-5e46e0c7b14a@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
	 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
	 <ae96eb36-aeba-86f0-3b72-a8b62f4dce60@xen.org>
	 <6735859208c6dcb7320f89664ae298005f70827b.camel@gmail.com>
	 <75df5a86-5d64-d219-c25c-644748a88302@xen.org>
	 <3f108af54c7d824f59a7dc1daf7d4d0c23f617ec.camel@gmail.com>
	 <297fb314-7752-fdf6-3003-f5bd1396c1e3@xen.org>
	 <bb5105f462a79bc0136348302407574f1d9f792b.camel@gmail.com>
	 <0fd10ac8-6110-8299-b2b1-5e46e0c7b14a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-01 at 15:21 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 01/03/2023 15:16, Oleksii wrote:
> > On Wed, 2023-03-01 at 13:58 +0000, Julien Grall wrote:
> > > On 01/03/2023 12:31, Oleksii wrote:
> > > Given this is an alignment issue (Arm32 is more sensible to this
> > > than
> > > the other architecture, but this is still a potential problem for
> > > the
> > > other archs), I would really like to understand whether this is
> > > an
> > > issue
> > > in the common code or in the Arm linker script.
> > I have a good news.
> >=20
> > Alignment of "*(.proc.info)" helps but I checked only yocto-
> > qemuarm:
> > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792923264
> >=20
> > I ran all tests here:
> > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792953524
> >=20
> > Should I create a separate patch with ALIGN if the tests are
> > passed?
>=20
> Yes please. But, to be honest, I am not entirely sure what is not=20
> aligned before hand. Do you know if it is possible to download the
> Xen=20
> binary from gitlab?
It is possible.

Please go to the link of the job:
https://gitlab.com/xen-project/people/olkur/xen/-/jobs/3856617252
And on the right you will find 'Job artificats' where you can click
'Download'.
Or in  case if you need a particular binary can click 'Browse' and go
to Artifcats/Binaries/:
https://gitlab.com/xen-project/people/olkur/xen/-/jobs/3856617252/artifacts=
/browse/binaries/

~ Oleksii

