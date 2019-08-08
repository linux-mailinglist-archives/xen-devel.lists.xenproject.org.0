Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A8860D2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 13:26:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvgVU-0007Ck-D5; Thu, 08 Aug 2019 11:22:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qeg/=WE=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hvgVT-0007Cf-7D
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 11:22:55 +0000
X-Inumbo-ID: dd1d7749-b9ce-11e9-8980-bc764e045a96
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dd1d7749-b9ce-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 11:22:53 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id b7so66825071otl.11
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 04:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=MD4f29dvf9+aC42IDgak+nTcN5GXEG5vBb0DGDwRcbY=;
 b=Ge+tHhhfXihXw4LmsoyeJvIzSt4vVfqzQpn3256INKjPOux0Zvj21zzk6lzRz0KU+9
 frw8ggi8s+NhazC8StZHPJC74b33pr6WqHFsnFeIGdMsYs67NMToU/Iub3XzJrNzwyGI
 IPPT0K1pGkcAwNnfAT6Kh4iV1vFYfYOnv3N+J5QLdvjfQHuFKtfg6aoeXESmUSoifQd0
 AUwTThX/NEvcQSI8Mw4kYoMc5TtVi18QueOot+jmXZaUl+Ufv+dbQaYfawmjTMsJV3DO
 32z+GT/kMukKdNTKpgh+p7AmkWQx8tFNZYJbpxXe4BRUyfWls0a6nXr9U1qNVA7IHmBh
 6YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=MD4f29dvf9+aC42IDgak+nTcN5GXEG5vBb0DGDwRcbY=;
 b=ZeYxVgQVKfMz6FNhTDKMrWD/Ismm4ua8kOYzN23RQI7AxSRRinFCD2lETqOFo9Eua5
 QNFNhNkMDGAQF2P2nO6pvkA8CZxoGjtv1P5LtDrx5vZbok43LTr58+chZypagrT9n5NO
 oRhOijiEIkLeSaD5MqJzhZD0VqZwoPuY9mmH31wuDrgt9JvqQ8RCSb+9Xe/Z6mLScNwD
 54vETM4pWPgo/pc88D0M4Z/EnOAAcwLRH5ojGP54xFCAYYHxPcBUI2nz2bez4Z8ueBOb
 vEjjn+jsEFBTLc89w+K5FOeWIsXkgGKwyMG625+DDexeAcX2TQ8OByUC8FdewPzsrT6+
 5S/g==
X-Gm-Message-State: APjAAAX4X2hPQDYMi5vqFZjEaKUAIjFJqO7Vugy0jn9D74d0OnhAHoN+
 UjF8ByTOAPExRSIPKgFeRuM=
X-Google-Smtp-Source: APXvYqwiVUWA/Mr7dv4PPHVS+V2sj3jXu1RFJkjncUHIcl1Yk2K8FmCau705kno6RiQa2kmW8cCa/w==
X-Received: by 2002:a6b:f906:: with SMTP id j6mr14562369iog.26.1565263373279; 
 Thu, 08 Aug 2019 04:22:53 -0700 (PDT)
Received: from [100.64.77.56] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id s3sm76527726iob.49.2019.08.08.04.22.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 04:22:52 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G77)
In-Reply-To: <c2654c96-3236-70ae-70cb-581cfa193aff@suse.com>
Date: Thu, 8 Aug 2019 07:22:51 -0400
Message-Id: <F650D65F-2397-4DEA-89B1-B8924A09D111@gmail.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
 <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
 <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
 <c2654c96-3236-70ae-70cb-581cfa193aff@suse.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============9111207234785156758=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============9111207234785156758==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-48F7C60D-96AB-4BAD-987D-877BF4E1D4A2
Content-Transfer-Encoding: 7bit


--Apple-Mail-48F7C60D-96AB-4BAD-987D-877BF4E1D4A2
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Aug 8, 2019, at 06:49, Jan Beulich <JBeulich@suse.com> wrote:
>=20
>> On 08.08.2019 11:13, Julien Grall wrote:
>> Hi Jan,
>>=20
>>> On 08/08/2019 10:04, Jan Beulich wrote:
>>>> On 08.08.2019 10:43, Andrew Cooper wrote:
>>>>> On 08/08/2019 07:22, Jan Beulich wrote:
>>>>>> On 07.08.2019 21:41, Andrew Cooper wrote:
>>>>>> --- /dev/null
>>>>>> +++ b/docs/glossary.rst
>>>>>> @@ -0,0 +1,37 @@
>>>>>> +Glossary
>>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> +
>>>>>> +.. Terms should appear in alphabetical order
>>>>>> +
>>>>>> +.. glossary::
>>>>>> +
>>>>>> +   control domain
>>>>>> +     A :term:`domain`, commonly dom0, with the permission and
>>>>>> responsibility
>>>>>> +     to create and manage other domains on the system.
>>>>>> +
>>>>>> +   domain
>>>>>> +     A domain is Xen's unit of resource ownership, and generally has=

>>>>>> at the
>>>>>> +     minimum some RAM and virtual CPUs.
>>>>>> +
>>>>>> +     The terms :term:`domain` and :term:`guest` are commonly used
>>>>>> +     interchangeably, but they mean subtly different things.
>>>>>> +
>>>>>> +     A guest is a single virtual machine.
>>>>>> +
>>>>>> +     Consider the case of live migration where, for a period of
>>>>>> time, one
>>>>>> +     guest will be comprised of two domains, while it is in transit.=

>>>>>> +
>>>>>> +   domid
>>>>>> +     The numeric identifier of a running :term:`domain`.  It is
>>>>>> unique to a
>>>>>> +     single instance of Xen, used as the identifier in various APIs,=

>>>>>> and is
>>>>>> +     typically allocated sequentially from 0.
>>>>>> +
>>>>>> +   guest
>>>>>> +     See :term:`domain`
>>>>>=20
>>>>> I think you want to mention the usual distinction here: Dom0 is,
>>>>> while a domain, commonly not considered a guest.
>>>>=20
>>>> To be honest, I had totally forgotten about that.  I guess now is the
>>>> proper time to rehash it in public.
>>>>=20
>>>> I don't think the way it currently gets used has a clear or coherent se=
t
>>>> of rules, because I can't think of any to describe how it does get used=
.
>>>>=20
>>>> Either there are a clear and coherent (and simple!) set of rules for
>>>> what we mean by "guest", at which point they can live here in the
>>>> glossary, or the fuzzy way it is current used should cease.
>>>=20
>>> What's fuzzy about Dom0 not being a guest (due to being a part of the
>>> host instead)?
>> Dom0 is not part of the host if you are using an hardware domain.
>=20
> It's still the control domain then, and hence still part of the host.

With disaggregation and dom0less (how might we describe that term in the int=
ro?) for edge/embedded Xen systems, there could be a mode where the control d=
omain has never had privilege over the domain that handles the physical TPM,=
 or the provider of the virtual TPM: =20

  https://lists.gt.net/xen/devel/557782

Rich=

--Apple-Mail-48F7C60D-96AB-4BAD-987D-877BF4E1D4A2
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">On A=
ug 8, 2019, at 06:49, Jan Beulich &lt;<a href=3D"mailto:JBeulich@suse.com">J=
Beulich@suse.com</a>&gt; wrote:</div><div dir=3D"ltr"><br></div><blockquote t=
ype=3D"cite"><div dir=3D"ltr"><span>On 08.08.2019 11:13, Julien Grall wrote:=
</span><br><blockquote type=3D"cite"><span>Hi Jan,</span><br></blockquote><b=
lockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"ci=
te"><span>On 08/08/2019 10:04, Jan Beulich wrote:</span><br></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>On 08.08.2019 10:43, A=
ndrew Cooper wrote:</span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>On 08/08/201=
9 07:22, Jan Beulich wrote:</span><br></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>On 07.08.2019 21:41, Andrew Cooper wrote:=
</span><br></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>--- /dev/null</span><br></blo=
ckquote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>+++ b/docs/glossary.rst</span><b=
r></blockquote></blockquote></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>@@ -0,0 +1,37 @@</span><b=
r></blockquote></blockquote></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>+Glossary</span><br></blo=
ckquote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>+=3D=3D=3D=3D=3D=3D=3D=3D</span>=
<br></blockquote></blockquote></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>+</span><br></blockquot=
e></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>+.. Terms should appear in alphabetica=
l order</span><br></blockquote></blockquote></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+</span><br=
></blockquote></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>+.. glossary::</span><br><=
/blockquote></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>+</span><br></blockquote></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>+&nbsp;&nbsp; control domain</span><br></blo=
ckquote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp; A :ter=
m:`domain`, commonly dom0, with the permission and</span><br></blockquote></=
blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>responsibility</span><br></blockquote></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp; to create and mana=
ge other domains on the system.</span><br></blockquote></blockquote></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>+</span><br></blockquote></blockquote></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+&=
nbsp;&nbsp; domain</span><br></blockquote></blockquote></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>+&nbsp;&nbsp;&nbsp;&nbsp; A domain is Xen's unit of resource ownership, an=
d generally has</span><br></blockquote></blockquote></blockquote></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>a=
t the</span><br></blockquote></blockquote></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+&nbsp;&nbs=
p;&nbsp;&nbsp; minimum some RAM and virtual CPUs.</span><br></blockquote></b=
lockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>+</span><br></blockquote></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp; The terms :term:`domain` and :te=
rm:`guest` are commonly used</span><br></blockquote></blockquote></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp; interchangeably, but they mean subtly d=
ifferent things.</span><br></blockquote></blockquote></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
+</span><br></blockquote></blockquote></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+&nbsp;&nbsp;&n=
bsp;&nbsp; A guest is a single virtual machine.</span><br></blockquote></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>+</span><br></blockquote></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp; Consider the case of live migration w=
here, for a period of</span><br></blockquote></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>time, one</span><br></blockquote></blockquote></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+&=
nbsp;&nbsp;&nbsp;&nbsp; guest will be comprised of two domains, while it is i=
n transit.</span><br></blockquote></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+</spa=
n><br></blockquote></blockquote></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>+&nbsp;&nbsp; domid</=
span><br></blockquote></blockquote></blockquote></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp=
;&nbsp; The numeric identifier of a running :term:`domain`.&nbsp; It is</spa=
n><br></blockquote></blockquote></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>unique to a</span><br=
></blockquote></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp; s=
ingle instance of Xen, used as the identifier in various APIs,</span><br></b=
lockquote></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>and is</span><br></blockquote><=
/blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp; typically alloc=
ated sequentially from 0.</span><br></blockquote></blockquote></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>+</span><br></blockquote></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+&nbsp=
;&nbsp; guest</span><br></blockquote></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+&n=
bsp;&nbsp;&nbsp;&nbsp; See :term:`domain`</span><br></blockquote></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span><=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>I think you want to mention the usual distinction here: D=
om0 is,</span><br></blockquote></blockquote></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span>while a domain, commonly not considered a guest.=
</span><br></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></spa=
n><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>To be honest, I had tot=
ally forgotten about that.&nbsp; I guess now is the</span><br></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>proper time to rehash it in public.</span><=
br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>I don't think the way it currently gets used=
 has a clear or coherent set</span><br></blockquote></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>of rules, because I can't think of any to describe how it does get=
 used.</span><br></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>Either there are a clear and co=
herent (and simple!) set of rules for</span><br></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>what we mean by "guest", at which point they can live her=
e in the</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>glossary, o=
r the fuzzy way it is current used should cease.</span><br></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>What's fuzzy about Dom0 not being a guest (due to bei=
ng a part of the</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>host instead)?</span><br></blockquote></b=
lockquote><blockquote type=3D"cite"><span>Dom0 is not part of the host if yo=
u are using an hardware domain.</span><br></blockquote><span></span><br><spa=
n>It's still the control domain then, and hence still part of the host.</spa=
n></div></blockquote><br><div>With disaggregation and dom0less (how might we=
 describe that term in the intro?) for edge/embedded Xen systems, there coul=
d be a mode where&nbsp;<span style=3D"background-color: rgba(255, 255, 255, 0=
);">the control domain has&nbsp;</span><span style=3D"background-color: rgba=
(255, 255, 255, 0);">never had privilege over the domain that handles the ph=
ysical TPM, or the</span><span style=3D"background-color: rgba(255, 255, 255=
, 0);">&nbsp;</span><span style=3D"background-color: rgba(255, 255, 255, 0);=
">provider of the virtual TPM: &nbsp;</span></div><div><br></div><div>&nbsp;=
&nbsp;<a href=3D"https://lists.gt.net/xen/devel/557782">https://lists.gt.net=
/xen/devel/557782</a></div><div><br></div><div>Rich</div></body></html>=

--Apple-Mail-48F7C60D-96AB-4BAD-987D-877BF4E1D4A2--


--===============9111207234785156758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9111207234785156758==--

