Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BCD7DE84
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 17:12:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htCht-000063-Ir; Thu, 01 Aug 2019 15:09:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qR5W=V5=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1htChs-00005y-Ch
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 15:09:28 +0000
X-Inumbo-ID: 5a79fc7c-b46e-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5a79fc7c-b46e-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 15:09:27 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id f4so145118366ioh.6
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=isZJtBCnyYW9uRVRkj1VaS3h/54h0j5vWT4OCyIVLwI=;
 b=Y6cpWo++meaYdNARqvrQDFLiFh329JcI+0VdyotM05Bp+C33jeSNeAL2ibt2Gln+MS
 vHssrtuVjuBzysViON+W2c2v/N2ATYU17XCag0X5bMOC97nEssHXqzbTVMTg0s+n/TRp
 TX/yLChYh2jcKJq1DfoCAYa0V3fA1yoAFXDQmR9JLSZ6os879wGYfNCx5Rm2REqwJzHw
 o16b5CU2In2xDNVx9JYHTTjY5lWdYTYsERD0xrI0XmzIIGZpqrQ+9aDHCGk8XqzEwg4x
 raruy/c1KcWJeZijBV3Yb7hU3qnUYRa4KUghGGGiuMeV3TN7+7ob3+oyurLQwMGtfWEg
 dtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=isZJtBCnyYW9uRVRkj1VaS3h/54h0j5vWT4OCyIVLwI=;
 b=kfVSazUfb03JAKrE7VNGxh1fieq3NIFZkIWX3zeIgPxifZ8JTwu400ZxdNBqBEbuhv
 BMyAKrhc6oIGdVjIczWNk9i0skd+8OUmSGPP1VWmuvk6vsPMzpa+ltNMxi8a57ePT1jZ
 VgKGFlFCXMlhP2/U0wtOrx8Is6hU7gwXvf33+y7NM7BnPVZEd9+2rPz9xji3oQSTlVD3
 i1g2ZronHuGRojMQgyZoFDmc/nT4AbwNe8Z6D0sC5KvW3YDg57wet49v5tXqhonz3HUV
 ub7z3wlAugypNI+5DV1asnXUPXTqstZrUtHzlfVniMHMKcXG0dh3cO9lSgZMmX/N3GPD
 lbig==
X-Gm-Message-State: APjAAAXdy4hVlRGq4koytkM4kUucIC03jhf8/2MrF8VTn2VglIIxDopI
 yFnNiiUqkct2C4lb+cKTPmo=
X-Google-Smtp-Source: APXvYqwnLZ7KTLpRhA0OXKmecDycgGwc++dXwEGQJ+X7p1ESRCFRh5x7xlaSidvWFUJd3ybJsi13oQ==
X-Received: by 2002:a05:6638:691:: with SMTP id
 i17mr133428840jab.70.1564672166465; 
 Thu, 01 Aug 2019 08:09:26 -0700 (PDT)
Received: from [100.64.77.56] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id 8sm58256375ion.26.2019.08.01.08.09.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 08:09:25 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G77)
In-Reply-To: <05253a48-a077-ff8d-120b-7bf1356b94cc@suse.com>
Date: Thu, 1 Aug 2019 11:09:24 -0400
Message-Id: <8287457D-848A-4FFF-B542-37B792033FBF@gmail.com>
References: <20190729143910.2389-1-lukasz.hawrylko@intel.com>
 <05253a48-a077-ff8d-120b-7bf1356b94cc@suse.com>
To: Jan Beulich <JBeulich@suse.com>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>, lars.kurth@xenproject.org
Subject: Re: [Xen-devel] [PATCH] Adding Intel TXT maintainter
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Brian Woods <Brian.Woods@amd.com>
Content-Type: multipart/mixed; boundary="===============1943867777946947491=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1943867777946947491==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-8105DF8F-1245-4A56-911C-6EF0A178C69A
Content-Transfer-Encoding: 7bit


--Apple-Mail-8105DF8F-1245-4A56-911C-6EF0A178C69A
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On Jul 29, 2019, at 10:45, Jan Beulich <JBeulich@suse.com> wrote:
>=20
>> On 29.07.2019 16:39, Lukasz Hawrylko wrote:
>> Support for Intel TXT has orphaned status right now because
>> no active maintainter is listed. Adding myself as active maintainter,
>> so it could be reverted to supported state.
>=20
> Which you should then do ...
>=20
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -240,6 +240,7 @@ S:    Maintained
>>  F:    tools/golang
>>=20
>>  INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
>> +M:    Lukasz Hawrylko <lukasz.hawrylko@intel.com>
>>  S:    Orphaned
>=20
> ... right here. The question is what new state you want to put
> it into. But it was suggested anyway that you add yourself as
> reviewer first, at which point the new state would probably be
> "Odd Fixes".

There is no status for Intel TXT documented in SUPPORT.md [1].  What's the e=
stablished mapping between "Odd Fixes" in Maintainers and support status in S=
UPPORT.md?

At present, MAINTAINERS generalizes "tboot support" to "Intel TXT".  This wi=
ll change with TrenchBoot (discussed at Xen Summit) [2] and "secure launch" [=
3] for the Linux kernel, which will support Intel TXT and AMD SKINIT variant=
s of DRTM.  At that point, there will be tboot and TrenchBoot for Intel TXT,=
 with different Xen maintainers and potentially different levels of support.=


We will eventually need to document Xen's DRTM status on Intel, AMD and Arm/=
Qualcomm, in both SUPPORT.md and MAINTAINERS.

Rich


[1] SUPPORT.md, https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3DSUP=
PORT.md;hb=3Drefs/heads/stable-4.12

[2] TrenchBoot, https://youtube.com/watch?v=3Df0LZFSq4Ack

[3] kernel_info, https://lkml.org/lkml/2019/5/24/330


--Apple-Mail-8105DF8F-1245-4A56-911C-6EF0A178C69A
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-equiv=
=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"></=
div><div dir=3D"ltr">On Jul 29, 2019, at 10:45, Jan Beulich &lt;<a href=3D"m=
ailto:JBeulich@suse.com">JBeulich@suse.com</a>&gt; wrote:</div><div dir=3D"l=
tr"><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><span>On 29.07.2019=
 16:39, Lukasz Hawrylko wrote:</span><br><blockquote type=3D"cite"><span>Sup=
port for Intel TXT has orphaned status right now because</span><br></blockqu=
ote><blockquote type=3D"cite"><span>no active maintainter is listed. Adding m=
yself as active maintainter,</span><br></blockquote><blockquote type=3D"cite=
"><span>so it could be reverted to supported state.</span><br></blockquote><=
span></span><br><span>Which you should then do ...</span><br><span></span><b=
r><blockquote type=3D"cite"><span>--- a/MAINTAINERS</span><br></blockquote><=
blockquote type=3D"cite"><span>+++ b/MAINTAINERS</span><br></blockquote><blo=
ckquote type=3D"cite"><span>@@ -240,6 +240,7 @@ S: &nbsp; &nbsp;Maintained</=
span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;F: &nbsp; &nbsp=
;tools/golang</span><br></blockquote><blockquote type=3D"cite"><span></span>=
<br></blockquote><blockquote type=3D"cite"><span> &nbsp;INTEL(R) TRUSTED EXE=
CUTION TECHNOLOGY (TXT)</span><br></blockquote><blockquote type=3D"cite"><sp=
an>+M: &nbsp; &nbsp;Lukasz Hawrylko &lt;<a href=3D"mailto:lukasz.hawrylko@in=
tel.com">lukasz.hawrylko@intel.com</a>&gt;</span><br></blockquote><blockquot=
e type=3D"cite"><span> &nbsp;S: &nbsp; &nbsp;Orphaned</span><br></blockquote=
><span></span><br><span>... right here. The question is what new state you w=
ant to put</span><br><span>it into. But it was suggested anyway that you add=
 yourself as</span><br><span>reviewer first, at which point the new state wo=
uld probably be</span><br><span>"Odd Fixes".</span><br></div></blockquote><d=
iv><br></div><div><span style=3D"background-color: rgba(255, 255, 255, 0);">=
There is no status for Intel TXT documented in SUPPORT.md [1]. &nbsp;What's t=
he established mapping between "Odd Fixes" in Maintainers and support status=
 in SUPPORT.md?</span><div></div></div><div><br></div><div><div>At present, M=
AINTAINERS generalizes "tboot support" to "Intel TXT". &nbsp;This will chang=
e with TrenchBoot (discussed at Xen Summit) [2] and "secure launch" [3] for t=
he Linux kernel, which will support Intel TXT and AMD SKINIT variants of DRT=
M. &nbsp;At that point, there will be tboot and TrenchBoot for Intel TXT, wi=
th different Xen maintainers and potentially different levels of support.</d=
iv><div><br></div><div>We will eventually<span style=3D"background-color: rg=
ba(255, 255, 255, 0);">&nbsp;need to document Xen's DRTM status on Intel, AM=
D and Arm/Qualcomm, in both SUPPORT.md and MAINTAINERS.</span></div><div><br=
></div><div>Rich</div><div><br></div><div><br></div><div>[1] SUPPORT.md,&nbs=
p;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3DSUPPOR=
T.md;hb=3Drefs/heads/stable-4.12">https://xenbits.xen.org/gitweb/?p=3Dxen.gi=
t;a=3Dblob;f=3DSUPPORT.md;hb=3Drefs/heads/stable-4.12</a></div></div><div><b=
r></div><div>[2] TrenchBoot,&nbsp;<a href=3D"https://youtube.com/watch?v=3Df=
0LZFSq4Ack">https://youtube.com/watch?v=3Df0LZFSq4Ack</a></div><div><br></di=
v><div>[3] kernel_info, <a href=3D"https://lkml.org/lkml/2019/5/24/330">http=
s://lkml.org/lkml/2019/5/24/330</a></div><div><br></div></div></div></body><=
/html>=

--Apple-Mail-8105DF8F-1245-4A56-911C-6EF0A178C69A--


--===============1943867777946947491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1943867777946947491==--

