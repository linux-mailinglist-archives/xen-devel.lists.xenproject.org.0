Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969436A6C65
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 13:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504006.776471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXLcq-0000iR-DG; Wed, 01 Mar 2023 12:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504006.776471; Wed, 01 Mar 2023 12:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXLcq-0000fX-A4; Wed, 01 Mar 2023 12:32:04 +0000
Received: by outflank-mailman (input) for mailman id 504006;
 Wed, 01 Mar 2023 12:32:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXLco-0000fB-CI
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 12:32:02 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10bd646a-b82d-11ed-96a3-2f268f93b82a;
 Wed, 01 Mar 2023 13:32:01 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id j11so1705932lfg.13
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 04:32:01 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 8-20020ac24848000000b004cc9042c9cfsm1719590lfy.158.2023.03.01.04.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 04:32:00 -0800 (PST)
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
X-Inumbo-ID: 10bd646a-b82d-11ed-96a3-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677673920;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F1SlM21Xj7Xbi21emTWWLykzpC1stJCPZfFjHAhe3hQ=;
        b=M4ou3RdAs37Buu+XtNYZfhG4FFs6CprtIEhS8ErbvlcKSmfCKTd0CdZg+k4D9CzJJE
         lJ9LBx8iFj3YmyKjvka0eSEWHZ+w58u0wkhMR3xgNOCVLWG+geO599o3TcJ2JpeEeUFC
         BxL6XuWVouL3mesta0dbnCaAizPkwTKX9sh+1B8W9gMseJESPNB5LKxncOMWw0JdPNe2
         4ttnNAZ+vsiksidQmcbgO4XGANX09M0SfTXe0iK74AhFwOKYirNXmkX0BPidozwB9OY8
         RnxD+fbA9NIqVZkM/Fiu1UnzZvq/5nvCacJdAzy8AtIIrvrrI9p/aXS8bD5Fx3/9Tt4U
         ZmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677673920;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1SlM21Xj7Xbi21emTWWLykzpC1stJCPZfFjHAhe3hQ=;
        b=68O2HyGFwG9CLuknlgsm7PDxOwgFOCq0LudmEVbC8OBw42mguSofwIfbAm11VKupi+
         pY3CACn3rKBjGtFjlk1SBO026gsIVT8TGFJqovAapWvgS6f7TIX6SiShah06TKoXqAeY
         FlBCxQjJql1NDt1R+J0hBWzjHoWseVnwhOHdr+ZL6SSU8P6cHJr+ZmwJ35z5ckDT6sTF
         wr2ExD9hOI5j8Ude/B6gTwBKk6fGJ1vnF/YfqB5fZ97Wyxkc6i1WJ1fcLKX6HrRYHaji
         LbD/suLBVQa/qAtdfEt59y2FOTPNj1I4z2dVibTB4mex44Wd6qBtWleowmE9eWQNIdkK
         kYyA==
X-Gm-Message-State: AO0yUKUz3DhxnGSzlI9DBskyA0p5TDwAHWm3fErMNVtKIopKgrj2ihUn
	iaAF8nZFB2QnPCeJmbliqGE=
X-Google-Smtp-Source: AK7set+EBr3850jtevbZ2ShTuUK5u1H/aGhnYsDFUKYKCrznlesji5zBbVGkwBUYbl3aoNP5/zrnMQ==
X-Received: by 2002:ac2:5106:0:b0:4e0:6e01:7ebf with SMTP id q6-20020ac25106000000b004e06e017ebfmr1734324lfb.52.1677673920504;
        Wed, 01 Mar 2023 04:32:00 -0800 (PST)
Message-ID: <3f108af54c7d824f59a7dc1daf7d4d0c23f617ec.camel@gmail.com>
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Wed, 01 Mar 2023 14:31:57 +0200
In-Reply-To: <75df5a86-5d64-d219-c25c-644748a88302@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
	 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
	 <ae96eb36-aeba-86f0-3b72-a8b62f4dce60@xen.org>
	 <6735859208c6dcb7320f89664ae298005f70827b.camel@gmail.com>
	 <75df5a86-5d64-d219-c25c-644748a88302@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,
> > >=20
> > > > On 24/02/2023 11:31, Oleksii Kurochko wrote:
> > > > > The following changes were made:
> > > > > * make GENERIC_BUG_FRAME mandatory for ARM
> > > >=20
> > > > I have asked in patch #1 but will ask it again because I think
> > > > this
> > > > should be recorded in the commit message. Can you outline why
> > > > it is
> > > > not
> > > > possible to completely switch to the generic version?
> > >=20
> > > I have just tried to remove it on arm64 and it seems to work.
> > > This
> > > was
> > > only tested with GCC 10 though. But given the generic version is
> > > not
> > > not
> > > using the %c modifier, then I wouldn't expect any issue.
> > >=20
> > > Cheers,
> > >=20
> >=20
> > I tried to switch ARM to generic implementation.
> >=20
> > Here is the patch: [1]
>=20
> This is similar to the patch I wrote to test with generic
> implementation=20
> on Arm (see my other reply).
>=20
> [...]
>=20
> > (it will be merged with patch 3 if it is OK )
> >=20
> > And looks like we can switch ARM to generic implementation as all
> > tests
> > passed:
> > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/791549396
>=20
> Thanks for checking with the gitlab CI!
>=20
> >=20
> > The only issue is with yocto-arm:
> > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/791549396/f=
ailures
> > But I am not sure that it is because of my patch
>=20
> This looks unrelated to me. This is happening because there is a data
> abort before PSCI (used to reboot the platform) is properly setup. I=20
> think we should consider to only print once the error rather than
> every=20
> few iterations (not a request for you).
>=20
> That said, I am a bit puzzled why this issue is only happening in the
> Yocto test (the Debian one pass). Do you know if the test is passing
> in=20
> the normal CI?
I checked several pipelines on the normal CI and it is fine.
>=20
> If yes, what other modifications did you do?
It looks like the issue happens after switch ARM to generic
implementation of bug.h:
-
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792379063/failu=
res
[ failure ]
-
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792381665/failu=
res
[ passed ]

The difference between builds is only in the commit ' check if ARM can
be fully switched to generic implementation '.
For second one it is reverted so it looks like we can't switch ARM to
generic implementation now as it is required addiotional investigation.

There is no other significant changes ( only the changes mentioned in
the current mail thread ).

Could we go ahead without switching ARM to generic implementation to
not block other RISC-V patch series?

~ Oleksii


