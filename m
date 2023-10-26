Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D77D87AE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 19:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623951.972269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw4NP-0001sP-6B; Thu, 26 Oct 2023 17:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623951.972269; Thu, 26 Oct 2023 17:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw4NP-0001qk-2t; Thu, 26 Oct 2023 17:42:35 +0000
Received: by outflank-mailman (input) for mailman id 623951;
 Thu, 26 Oct 2023 17:42:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ivkI=GI=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qw4NN-0001qe-UI
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 17:42:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ab02ac8-7427-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 19:42:32 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40839807e82so7316255e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 10:42:32 -0700 (PDT)
Received: from smtpclient.apple ([90.243.16.33])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a05600c46c900b004083bc9ac90sm3119104wmo.24.2023.10.26.10.42.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Oct 2023 10:42:32 -0700 (PDT)
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
X-Inumbo-ID: 0ab02ac8-7427-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698342152; x=1698946952; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRBY+tAoZb/J4M2ctNQ/DZ35UQBlaca1qsKrvfykeKc=;
        b=SCyOGtGCxMavn6wSxIHfHQ302yt0li07lTrDv5P3q5+ZLTbdduTZb9tLXaU+Hu75EI
         ACjSKybaaL2lfS5mqB/Y+YqvX9ywJQpqdjzo2YPnY5/NIk2h9YvLCBHe0HdjoTB3mSMM
         CrR6viPs0HkHio5GBu5c6d+/6zj34ZvnmvlkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698342152; x=1698946952;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRBY+tAoZb/J4M2ctNQ/DZ35UQBlaca1qsKrvfykeKc=;
        b=Nq9Vd0+7XSusg/SirUrq69X0kqU1prCU8KMPIrQMbtJF1yovKwo3AcG3a8P/GqvUWJ
         9vehv2jwyTGuBEGHLWxnGnQ/Zlsu5nj0KuK5ppbo/91BunfwVFPis48E11jEpmivrc3r
         9iVbOSvKtNRRTTzLbdyVlhBA9E0EHjUDP/JXhEIe+36PvLvjHRayYADlbENjDyekbX/X
         FudMTL68nOpD7o2p3KqSxCsdh6EHo6iE4O4c6vxvMH0BTWLCONzHjx6yTCLoEawmt0se
         1LfJPo8FX1XnhpSemiGH9S2FX615wX0n2U0+xhg6Ut8XzddaapJx6bbrbsdJkgm4NPtM
         yKJA==
X-Gm-Message-State: AOJu0YwjTgY+K/hVIaIue+FhtYAcVfMS3h3EMxTciYTM4BDYLbs2/8dC
	46Kai+AH/3MxF4sYJX7iH9neyA==
X-Google-Smtp-Source: AGHT+IFRx/TGnECZAcKm9mY28TMpyzQCkyEktKtfDyKFK9Mkc3Gu08i9d/gKm5gAj79BiPY/T5LO4g==
X-Received: by 2002:a05:600c:512a:b0:405:19dd:ad82 with SMTP id o42-20020a05600c512a00b0040519ddad82mr562509wms.16.1698342152331;
        Thu, 26 Oct 2023 10:42:32 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [PATCH] tools/ocaml/Makefile.rules: use correct C flags when
 compiling OCaml C stubs
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <531503CD-6082-43FE-92AF-FFB9B829B5C5@cloud.com>
Date: Thu, 26 Oct 2023 18:42:21 +0100
Cc: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5DF59773-9816-42CB-BC89-1CC2EE064CBD@cloud.com>
References: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
 <531503CD-6082-43FE-92AF-FFB9B829B5C5@cloud.com>
To: Christian Lindig <christian.lindig@cloud.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 25 Oct 2023, at 15:02, Christian Lindig =
<christian.lindig@cloud.com> wrote:
>=20
>=20
>=20
>> On 25 Oct 2023, at 14:52, Edwin T=C3=B6r=C3=B6k =
<edvin.torok@citrix.com> wrote:
>>=20
>> From: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>>=20
>> The code currently uses GCC to compile OCaml C stubs directly,
>> and although in most cases this works, it is not entirely correct.
>>=20
>> This will fail if the OCaml runtime has been recompiled to use and =
link with ASAN for example
>> (or other situations where a flag needs to be used consistently in =
everything that is linked into the same binary).
>>=20
>> Use the OCaml compiler instead, which knows how to invoke the correct =
C compiler with the correct flags,
>> and append the Xen specific CFLAGS to that instead.
>>=20
>> Drop the explicit -fPIC and -I$(ocamlc -where): these will now be =
provided by the compiler as needed.
>>=20
>> Use -verbose so we see the actuall full C compiler command line =
invocation done by the OCaml compiler.
>>=20
>> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>=20
> Acked-by: Christian Lindig <christian.lindig@cloud.com>
>=20
> I like using the OCaml compiler to compile stubs as it knows how to =
handle C files and will invoke the C compiler with the correct flags. =
However, this is the kind of change that would be good to have tested on =
all supported platforms. I therefore invite comments from those who =
maintain the build process.


There was a CI failure. I've pushed an updated version of this patch =
here:
=
https://gitlab.com/xen-project/people/edwintorok/xen/-/commit/137ffad324eb=
82884e7ac6f46f618459d365693e

If it passes the CI this time I'll send out a V2, looks like the -fPIC =
flag is needed on some platforms and is not automatically added by the =
OCaml compiler.


Best regards,
--Edwin=

