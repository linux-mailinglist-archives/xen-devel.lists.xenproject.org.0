Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A37A0F5A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 22:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602703.939438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgtLQ-0007cZ-1J; Thu, 14 Sep 2023 20:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602703.939438; Thu, 14 Sep 2023 20:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgtLP-0007ar-Td; Thu, 14 Sep 2023 20:53:47 +0000
Received: by outflank-mailman (input) for mailman id 602703;
 Thu, 14 Sep 2023 20:53:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K7SL=E6=gmail.com=pryorm09@srs-se1.protection.inumbo.net>)
 id 1qgtLN-0007Za-Tp
 for xen-devel@lists.xen.org; Thu, 14 Sep 2023 20:53:45 +0000
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [2607:f8b0:4864:20::936])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id caac4068-5340-11ee-8788-cb3800f73035;
 Thu, 14 Sep 2023 22:53:44 +0200 (CEST)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7a7d7a3d975so706386241.3
 for <xen-devel@lists.xen.org>; Thu, 14 Sep 2023 13:53:44 -0700 (PDT)
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
X-Inumbo-ID: caac4068-5340-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694724823; x=1695329623; darn=lists.xen.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2mOvvlqWA+AKUW19DqEpbmZAH94qZibDsH3zwHATfUw=;
        b=O7e6slW2OUV5RWPckigdsLpusVV8XTdAIc436FkCcCtlA8RaEBLhEEz7FcTisJ5eH3
         Fo2IEdStuBEvPMvyq7eFH9Lk8Jm5hukEBOJYHU/vXdG4Vuufr6BGM6ELgvd0226SAykp
         WlUJjcX4Ngj1Ql6FH04CHBx0Nz8cEciIkU64Dxx31ITesoJ/dCgTOUA8f1XD4KD4XgAq
         sRto+Ahr3bK5kAzTmRB6KjnTF5C3ouB+JTlHsSTX1aP1J1sboctqovkOH8KaP0ul4g9q
         EjstTdtEW0SoejIzl6x/1hdAK1siq2Lh7RN7IDDyNaDKjlVKFOuCCgJzIX0yguS1r5if
         qtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694724823; x=1695329623;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2mOvvlqWA+AKUW19DqEpbmZAH94qZibDsH3zwHATfUw=;
        b=UhmJpuBXbhEIQVfIHMWwyYgIuHjE+NX/mw1li+H1rChfou6QP85dSj6QJVrTDQsJza
         XEr+LWj7sigzlQ4hvTkw/F4LC5AAuvSyL7UUXJW59iEsEyv379T54nWgw5CVw1GDXEig
         bVBVwpX+S7ZS11Y9j8oFDSotzRnd367+A44u74kWH6kOmoXx0J+4qjA02greIf7fhOVc
         xeMoifSNkJl469uHh6ad2W+z7fhBIslCys3j5wZ7YBmVxWx/d5UFJw4vBL1c9Ce9Ipkn
         mgej2iBWjKwJj2oEm1WwhHYpk7v5xQTb1Qu7DouWlLaf6auWKSvxtVbjWGxKKrYliWqc
         o3SQ==
X-Gm-Message-State: AOJu0YxFlL9p3feL2Td3Y0LSIWGYw0iIeFY0+iTRXv5E01U7NNTqTlsm
	Yb3dDqBiWIosLn9gdBJydECmFiIcb3lO9tWfbyVxBZ9lFPU=
X-Google-Smtp-Source: AGHT+IEgIeYWSnij5g6FsUJegUkYmVfZkZqAOIe1MysHzP4uEdTLwxBQWi9MRulj7RLS1YDfJGZlL2E04ToRatETxdI=
X-Received: by 2002:a1f:e783:0:b0:48d:5af8:b9d0 with SMTP id
 e125-20020a1fe783000000b0048d5af8b9d0mr6836666vkh.6.1694724823058; Thu, 14
 Sep 2023 13:53:43 -0700 (PDT)
MIME-Version: 1.0
From: Pry Mar <pryorm09@gmail.com>
Date: Thu, 14 Sep 2023 13:53:31 -0700
Message-ID: <CAHnBbQ_KTWXQiw7PuxzsiH563uCCNaJL6+VkmcK+V_n5M8RaPA@mail.gmail.com>
Subject: 4.8-unstable: building firmware/hvmloader errors in Bookworm with gcc-12.2
To: xen-devel <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="000000000000120d59060557df8e"

--000000000000120d59060557df8e
Content-Type: text/plain; charset="UTF-8"

Hello,

First attempt to build xen-4.18-unstabl in deb12 (Bookworm):
/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.asl
  9851:             Name ( SLT, 0x0 )
Remark   2173 -          Creation of named objects within a method is
highly inefficient, use globals or method local variables instead ^
 (\_GPE._L03)

/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.asl
  9852:             Name ( EVT, 0x0 )
Remark   2173 -          Creation of named objects within a method is
highly inefficient, use globals or method local variables instead ^
 (\_GPE._L03)

ASL Input:
/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.asl
-  397476 bytes   8140 keywords  11139 source lines
AML Output:
 /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.aml
-   73130 bytes   5541 opcodes    2599 named objects
Hex Dump:
 /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.hex
-  686160 bytes

Compilation successful. 0 Errors, 129 Warnings, 2 Remarks, 2762
Optimizations
sed -e 's/AmlCode/dsdt_anycpu/g' -e 's/_aml_code//g'
/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.hex
> /home/mockbuild/pbdeps/xen-4.18~rc0/debi>
echo "int dsdt_anycpu_len=sizeof(dsdt_anycpu);" >>
/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.c.tmp
mv -f
/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.c.tmp
/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmlo>
rm -f
/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.aml
/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmload>
make[9]: Leaving directory
'/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/libacpi'
make[8]: Leaving directory
'/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader'
make[7]: ***
[/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/../../tools/Rules.mk:206:
subdir-all-hvmloader] Error 2
make[7]: Leaving directory
'/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware'
make[6]: ***
[/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/../../tools/Rules.mk:201:
subdirs-all] Error 2
make[6]: Leaving directory
'/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware'
make[5]: *** [Makefile:37: all] Error 2
make[5]: Leaving directory
'/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware'
make[4]: ***
[/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/../tools/Rules.mk:206:
subdir-all-firmware] Error 2
make[4]: Leaving directory
'/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools'
make[3]: ***
[/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/../tools/Rules.mk:201:
subdirs-all] Error 2
make[3]: Leaving directory
'/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools'
make[2]: *** [debian/rules.real:218: debian/stamps/build-utils_amd64] Error
2
make[2]: Leaving directory '/home/mockbuild/pbdeps/xen-4.18~rc0'
make[1]: *** [debian/rules.gen:57: build-arch_amd64_real] Error 2
make[1]: Leaving directory '/home/mockbuild/pbdeps/xen-4.18~rc0'
make: *** [debian/rules:24: build-arch] Error 2
dpkg-buildpackage: error: debian/rules build subprocess returned exit
status 2

any help is appreciated,
PryMar56

--000000000000120d59060557df8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>First attempt to buil=
d xen-4.18-unstabl in deb12 (Bookworm):<br></div><div>/home/mockbuild/pbdep=
s/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt=
_anycpu.asl =C2=A0 9851: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name ( S=
LT, 0x0 )<br>Remark =C2=A0 2173 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Creatio=
n of named objects within a method is highly inefficient, use globals or me=
thod local variables instead ^ =C2=A0(\_GPE._L03)<br><br>/home/mockbuild/pb=
deps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/d=
sdt_anycpu.asl =C2=A0 9852: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name =
( EVT, 0x0 )<br>Remark =C2=A0 2173 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Crea=
tion of named objects within a method is highly inefficient, use globals or=
 method local variables instead ^ =C2=A0(\_GPE._L03)<br><br>ASL Input: =C2=
=A0 =C2=A0 /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd=
64/tools/firmware/hvmloader/dsdt_anycpu.asl - =C2=A0397476 bytes =C2=A0 814=
0 keywords =C2=A011139 source lines<br>AML Output: =C2=A0 =C2=A0/home/mockb=
uild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvml=
oader/dsdt_anycpu.aml - =C2=A0 73130 bytes =C2=A0 5541 opcodes =C2=A0 =C2=
=A02599 named objects<br>Hex Dump: =C2=A0 =C2=A0 =C2=A0/home/mockbuild/pbde=
ps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsd=
t_anycpu.hex - =C2=A0686160 bytes<br><br>Compilation successful. 0 Errors, =
129 Warnings, 2 Remarks, 2762 Optimizations<br>sed -e &#39;s/AmlCode/dsdt_a=
nycpu/g&#39; -e &#39;s/_aml_code//g&#39; /home/mockbuild/pbdeps/xen-4.18~rc=
0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.hex &=
gt; /home/mockbuild/pbdeps/xen-4.18~rc0/debi&gt;<br>echo &quot;int dsdt_any=
cpu_len=3Dsizeof(dsdt_anycpu);&quot; &gt;&gt; /home/mockbuild/pbdeps/xen-4.=
18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.=
c.tmp<br>mv -f /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils=
_amd64/tools/firmware/hvmloader/dsdt_anycpu.c.tmp /home/mockbuild/pbdeps/xe=
n-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmlo&gt;<br>rm -f=
 /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/f=
irmware/hvmloader/dsdt_anycpu.aml /home/mockbuild/pbdeps/xen-4.18~rc0/debia=
n/build/build-utils_amd64/tools/firmware/hvmload&gt;<br>make[9]: Leaving di=
rectory &#39;/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_a=
md64/tools/libacpi&#39;<br>make[8]: Leaving directory &#39;/home/mockbuild/=
pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader=
&#39;<br>make[7]: *** [/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/bui=
ld-utils_amd64/tools/firmware/../../tools/Rules.mk:206: subdir-all-hvmloade=
r] Error 2<br>make[7]: Leaving directory &#39;/home/mockbuild/pbdeps/xen-4.=
18~rc0/debian/build/build-utils_amd64/tools/firmware&#39;<br>make[6]: *** [=
/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/fi=
rmware/../../tools/Rules.mk:201: subdirs-all] Error 2<br>make[6]: Leaving d=
irectory &#39;/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_=
amd64/tools/firmware&#39;<br>make[5]: *** [Makefile:37: all] Error 2<br>mak=
e[5]: Leaving directory &#39;/home/mockbuild/pbdeps/xen-4.18~rc0/debian/bui=
ld/build-utils_amd64/tools/firmware&#39;<br>make[4]: *** [/home/mockbuild/p=
bdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/../tools/Rules.mk:2=
06: subdir-all-firmware] Error 2<br>make[4]: Leaving directory &#39;/home/m=
ockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools&#39;<br>m=
ake[3]: *** [/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_a=
md64/tools/../tools/Rules.mk:201: subdirs-all] Error 2<br>make[3]: Leaving =
directory &#39;/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils=
_amd64/tools&#39;<br>make[2]: *** [debian/rules.real:218: debian/stamps/bui=
ld-utils_amd64] Error 2<br>make[2]: Leaving directory &#39;/home/mockbuild/=
pbdeps/xen-4.18~rc0&#39;<br>make[1]: *** [debian/rules.gen:57: build-arch_a=
md64_real] Error 2<br>make[1]: Leaving directory &#39;/home/mockbuild/pbdep=
s/xen-4.18~rc0&#39;<br>make: *** [debian/rules:24: build-arch] Error 2<br>d=
pkg-buildpackage: error: debian/rules build subprocess returned exit status=
 2</div><div><br></div><div>any help is appreciated,</div><div>PryMar56<br>=
</div></div>

--000000000000120d59060557df8e--

