Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E2843D18
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 11:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673892.1048441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV84z-0002w9-Sc; Wed, 31 Jan 2024 10:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673892.1048441; Wed, 31 Jan 2024 10:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV84z-0002tc-Pw; Wed, 31 Jan 2024 10:44:29 +0000
Received: by outflank-mailman (input) for mailman id 673892;
 Wed, 31 Jan 2024 10:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UyAi=JJ=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1rV84y-0002tS-JS
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 10:44:28 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ec2b61-c025-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 11:44:27 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so628240266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 02:44:27 -0800 (PST)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 hw20-20020a170907a0d400b00a2b1a20e662sm6051072ejc.34.2024.01.31.02.44.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jan 2024 02:44:27 -0800 (PST)
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
X-Inumbo-ID: b4ec2b61-c025-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706697867; x=1707302667; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9xYwjpFTBl2Zy2qetzGXiASmifk2rE7lsmZclrwvaA=;
        b=AnqmVZX83iYDmcBmnXC/g7IC1bdG3AUpGg/VCw0tqfqxH84mvOx2+JiRfGMgeyFK9v
         Yncre/SNk16YZ6UNY1kIImI8SkXykUitAQcDXJXHLgGeYOVWlfctzKUCA4jzUAx8/9J2
         i+vfFSIlg63Q6eO6JslyBmyI1I34Kz21aUIGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706697867; x=1707302667;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9xYwjpFTBl2Zy2qetzGXiASmifk2rE7lsmZclrwvaA=;
        b=Vj0+BnunJwjrgQLFA0ai43HKIgG66NLZvuREaKWlH+mRVyeJ9VuKgoZ9RtDjpzZrfb
         cBXWjeeVItPi3qBPtGefTuaCqquoyuamGXt1069P8JbdGl11BXNy204UxRbr5ZV2BUBi
         03AarfftG+flaSV7EmFauB3z2hGmW1/wXNn/YdNv2hW6aLuTSCEvh4U25ELpIR3poYUz
         vowHJuQBJ7a/+4LnguJIBKBGADAaY4+Wn0p8ZZqWllt6ngUxVizqJZv8Y6/7AXBmk3E8
         MR1miB2ZuhITaoZrNQXaYTvFm4HuOEZEwydCDMQgCyCSTxRxaZ0Iag+2I8yQm/nIGFTM
         oehw==
X-Gm-Message-State: AOJu0YwI7rOV66ZsQLgcT7OvdmC0GIxR3u0Sh8k58mJlH/MqxspAoNxA
	XkSpR/KWtQWI+T/2Jmi6xdR/UZJwc4SXa17tBp1+Y86Nh1e8FTt4r9PyUgs0mLI=
X-Google-Smtp-Source: AGHT+IF8JUacnjeqbcVtvg6IBhr3Kn9OLU2/DFgoAcwslBGGjnduPvvAwdsnzD/Iow7nTFyzj9J37Q==
X-Received: by 2002:a17:906:7fc2:b0:a35:6601:e401 with SMTP id r2-20020a1709067fc200b00a356601e401mr864196ejs.5.1706697867257;
        Wed, 31 Jan 2024 02:44:27 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH v1 0/2] tools/ocaml: support OCaml 5.x, drop support for
 <=4.05
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <cover.1706697216.git.edwin.torok@cloud.com>
Date: Wed, 31 Jan 2024 10:44:16 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E9A23AB-5745-4A71-9013-156B6648025A@cloud.com>
References: <cover.1706697216.git.edwin.torok@cloud.com>
To: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)



> On 31 Jan 2024, at 10:42, Edwin T=C3=B6r=C3=B6k =
<edwin.torok@cloud.com> wrote:
>=20
> Fix building oxenstored with OCaml 5.x.
> OCaml 5.x has removed some functions that have been deprecated for =
many years,
> in order to support OCaml 5.x we need to drop support for OCaml 4.02.
>=20
> Tested in gitlab CI (together with my other series):
> =
https://gitlab.com/xen-project/people/edwintorok/xen/-/pipelines/115830282=
7
>=20
> Edwin T=C3=B6r=C3=B6k (2):
>  oxenstored: fix build on OCaml 5.x
>  tools/ocaml: bump minimum version to OCaml 4.05
>=20
> tools/configure               | 2 +-
> tools/configure.ac            | 2 +-
> tools/ocaml/xenstored/disk.ml | 2 +-
> 3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> --=20
> 2.43.0
>=20

Acked-by: Christian Lindig <christian.lindig@cloud.com>


