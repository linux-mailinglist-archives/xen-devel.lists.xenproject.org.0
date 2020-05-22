Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B751DE371
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:44:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4Dt-0006sg-SF; Fri, 22 May 2020 09:44:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPHd=7E=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jc4Ds-0006sa-GW
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:44:12 +0000
X-Inumbo-ID: ca42b8f6-9c10-11ea-ae69-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca42b8f6-9c10-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 09:44:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f5so952114wmh.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2020 02:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=HlFVZYh5Hqq/NcSIeyeKR6lcWbBcZlAZWkWZy73uudo=;
 b=IqjZtBPLKjZ9qWS4u1si/Sxr//dDLqoKplPOKWFMOtZviYSjnsSNK9Bb/i8AbarPhK
 nMGkcA91U0Zbsr4RGdBTd59ml/O4B08NW9R85TepHoVMGuZOZFlXZZEvZ38WUlfgHROm
 PFNtmOWH2yv0Jdo1h02AcJTjJ1G4t+4tWGdxwsCZj2Zdc8RIOSfvyaV95tSsr+psJua8
 le5vDEhc7bolR9jKozSekBOGOlBFhi4yXaReAF1jEfCwFxfn2OuKzAW/URUQ4/mtgv+0
 0+V0Ow4QCtQZP7kFOMTZx3BdZtjEgzXIJu6hKITqp49t4Sredav/x+ebH3IPX+aApcLL
 wE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=HlFVZYh5Hqq/NcSIeyeKR6lcWbBcZlAZWkWZy73uudo=;
 b=LB9BaYuiHlHIW2gIO/QKXydSrC7Rvag1+72PsXrItNyGf4Sy9sKD/+gwC4QGNWlqz7
 RlO/Fhp2tZtbYwf3buYJf/wKucOzmSNAs4asHMeZNMM4I9mvOLIXRzch2Pygi0WkCIDB
 woXgo5j2Zu0CpFc89eJtK8QqY9qYLoGMLMFig4DWJY31c1tv/PUs6aXmPor6kFQ7HSsL
 fsgp7EDj4CNUxNgmQA4pQ+sBJq6vIvTUDKZow0GqEBlLZ90Q0/GvnXfl3qHr++UifEMg
 FPEKGcCXwce2L7YEqddS1JMvsgbweqZJADc76bLXpRZRFTOz5VmJEk6q7J7qgviMj0m0
 vgig==
X-Gm-Message-State: AOAM533WUXpePdReVPF+t1t39bGhC9hXmsehdLEwtVM9+Rd7HoJHD8dy
 nxicq0LNu244E57tO1HSG5U=
X-Google-Smtp-Source: ABdhPJwNt5X1nPCncv2PWpGLlfk5nvCfgV8zHpWsObLiRojTmpfCOJ0cnNsR2x9jy9u1udVrapNbyA==
X-Received: by 2002:a1c:6142:: with SMTP id v63mr12075838wmb.61.1590140651124; 
 Fri, 22 May 2020 02:44:11 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id d9sm9076260wmd.10.2020.05.22.02.44.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 02:44:10 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'George Dunlap'" <George.Dunlap@citrix.com>,
 "'Nick Rosbrook'" <rosbrookn@gmail.com>
References: <49cc21c24b65ef5e1ce9810397c0fcd9d43f77f4.1590072675.git.rosbrookn@ainfosec.com>
 <D90B93AD-977A-468E-840E-2E2354905968@citrix.com>
In-Reply-To: <D90B93AD-977A-468E-840E-2E2354905968@citrix.com>
Subject: RE: [PATCH] golang/xenlight: add an empty line after DO NOT EDIT
 comment
Date: Fri, 22 May 2020 10:44:09 +0100
Message-ID: <001201d6301d$8b6364a0$a22a2de0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKRHSeOjHTtxvPh0rbQyb/gF3wxUQKaoV/+pykrGdA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Nick Rosbrook' <rosbrookn@ainfosec.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Ian Jackson' <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: George Dunlap <George.Dunlap@citrix.com>
> Sent: 22 May 2020 10:14
> To: Nick Rosbrook <rosbrookn@gmail.com>
> Cc: xen-devel <xen-devel@lists.xenproject.org>; Nick Rosbrook =
<rosbrookn@ainfosec.com>; Ian Jackson
> <Ian.Jackson@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> Subject: Re: [PATCH] golang/xenlight: add an empty line after DO NOT =
EDIT comment
>=20
> CC=E2=80=99ing the release manager, since we=E2=80=99re past the last =
posting date
>=20
> > On May 21, 2020, at 3:55 PM, Nick Rosbrook <rosbrookn@gmail.com> =
wrote:
> >
> > When generating documentation, pkg.go.dev and godoc.org assume a =
comment
> > that immediately precedes the package declaration is a "package
> > comment", and should be shown in the documentation. Add an empty =
line
> > after the DO NOT EDIT comment in generated files to prevent these
> > comments from appearing as "package comments."
> >
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
>=20
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>
>=20
> Paul, I would classify this as a bug fix: It won=E2=80=99t have any =
functional effect on the code itself, but
> it fixes how it=E2=80=99s displayed; e.g.:
>=20
> =
https://pkg.go.dev/xenbits.xenproject.org/git-http/xen.git/tools/golang/x=
enlight?tab=3Ddoc
>=20

Since it is apparently a pure whitespace change I have no problem with =
this going in. We're not at freeze yet so technically you don't need my =
release-ack as yet :-)

  Paul


