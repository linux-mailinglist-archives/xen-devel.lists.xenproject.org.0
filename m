Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD026E369
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 20:22:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIyXJ-0001zs-K3; Thu, 17 Sep 2020 18:21:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5geh=C2=gmail.com=dav.sec.lists@srs-us1.protection.inumbo.net>)
 id 1kIyXI-0001zn-NX
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 18:21:36 +0000
X-Inumbo-ID: b8b082c7-7252-4342-ba53-77eaa196d600
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8b082c7-7252-4342-ba53-77eaa196d600;
 Thu, 17 Sep 2020 18:21:35 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id lo4so4591605ejb.8
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 11:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZEGHTc4M8PuwR8kJT5SSftjybOGkBNx5wZ3/V9BKdN8=;
 b=GSIQNg0i0NJeWCY8a0EtVcvY3EOzRca6OOB0SiNH1GBEUPDSi10IOwxzPtRoeipNVA
 SM4mFJgQjg6yXrsl2/YfClKpnxHLtdYu/1QP8aw20aqqVzN5tL3SFBNEaby4ltKvlb97
 7GqfnHSVqUJiw10BKhq0tWum5H8WpcaVAvEbsCRpFe6zV0uXvPQUFfDIlWEIFhdQyaDF
 NDHLh6G1MOspLeIObaphHkpXNf4Z1lPMa4wF5JyiY9uyLZtvrVUnOemFe09e1ZhApSzy
 sHmTQn9noeBDvRA7DfusDb4+xDip7eWMq56LUDHlWCZ1LN/Rltq4g3m+HKNa+2m4laVa
 1KeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZEGHTc4M8PuwR8kJT5SSftjybOGkBNx5wZ3/V9BKdN8=;
 b=Z8bHp8xLxX8wr8uv1c8DDGQ1S4crEifErfuaeCxIy8qCR6XkFVAVjhleBHd0T6jYHt
 Z65WNEHJYG7NKuXZO5shiKS2luS6vz6N4s6BptNghZMl6eU6R+a2nhr3KnK0wcP3iCut
 R7+RFtP0DkAMR7Qa+nOtra0PLb/PQmfrOZu07NIONCBFmK+3hFZlPtnEJDYSpSqCxdr2
 iZlVgJZghFtoYYUtVu/9Cz+twJx6BTVg8wsn5yo0SUhr3IO7I6XLFy0onRPE1J/PMWaz
 d19PJyUJgSQWBQKJlw4oxRMc0CII4XpWS9H13K4QqRMn/UhQavrtpZprNCdNL7QFeWDd
 tUkg==
X-Gm-Message-State: AOAM531IC8TXOcwB5EdaIQoynchdRKAWhdfe8FXHAGcc/w+1QIaeEgoW
 Jgnq/P50uJRagTYdPQo9j+2xVYjSX68l9RBFGYx//WTg00eqOQ==
X-Google-Smtp-Source: ABdhPJztOHsM4eUgECnjcjhd9Yqy0WJVnsLJ0IMsdxyH0BlT2fsyksl/dfqoBu9c7E+w4tKIiD8kCufYdPkgAD39hJI=
X-Received: by 2002:a17:906:6d92:: with SMTP id
 h18mr31451342ejt.405.1600366894390; 
 Thu, 17 Sep 2020 11:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+js8Lk2f99BqeNgSyAh1jh5gH1iC2BZyz+AY7mGTqPTX_Qf=w@mail.gmail.com>
 <58e3421c-6939-831f-8f0e-0c83fa9f1366@citrix.com>
 <7217a50c-d1f7-8160-2405-c04a84abf61f@knorrie.org>
 <CA+js8L=dCJkE6y=GO2WNc0ufLaOXkx1BsMg3soCw+=wyDduPMQ@mail.gmail.com>
 <CA+js8LnzTkPtQXhQ-N85rM4Qd3HC2SpRQ5ZoSzh4CVx92tNYNQ@mail.gmail.com>
 <20200916161206.GA20338@aepfle.de>
 <e68fd134-bb40-8646-89f0-dd8241737342@knorrie.org>
 <CA+js8L=53vMAEG2aU=_EoJoL2yZBRvxmKC0wkqSqv8pDEGH3Tg@mail.gmail.com>
In-Reply-To: <CA+js8L=53vMAEG2aU=_EoJoL2yZBRvxmKC0wkqSqv8pDEGH3Tg@mail.gmail.com>
From: David I <dav.sec.lists@gmail.com>
Date: Thu, 17 Sep 2020 20:21:23 +0200
Message-ID: <CA+js8Ln+P++jP9u5N_r8xQYfq1MEdZWTHHgfSh6Br=VnU5zhtA@mail.gmail.com>
Subject: Re: Compiling Xen from source
To: Hans van Kranenburg <hans@knorrie.org>
Cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org, 
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/alternative; boundary="0000000000004020f805af8674f6"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000004020f805af8674f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

update (for Hans and Ian):

I encounter the same issue when compiling the 4.14 branch:


git checkout -b stable-4.14 origin/stable-4.14
./configure && make

make[8]: Entering directory '/root/xen/tools/firmware/etherboot/ipxe/src'
  [BUILD] bin/flexboot_nodnic.o
drivers/infiniband/flexboot_nodnic.c: In function
'flexboot_nodnic_create_qp':
drivers/infiniband/flexboot_nodnic.c:368:53: error: implicit conversion
from 'enum ib_queue_pair_type' to 'nodnic_queue_pair_type'
[-Werror=3Denum-conversion]

this is with gcc 10 indeed.
Anyway I'm trying to compile under xen4.11 (binary debian package) that is
working perfectly.
But the compiling process of xen tools is bugged because of the drivers.
for example i have tried to comment the enum-conversion warning in the
Makefile, but i encounter other bugs with other drivers.

David

Le jeu. 17 sept. 2020 =C3=A0 20:05, David I <dav.sec.lists@gmail.com> a =C3=
=A9crit :

> Ok, thanks.
> So I have done a fresh checkout of the master branch, but unfortunately,
> there's a bug in infiniband drivers.
> the error is : "drivers/infiniband/flexboot_nodnic.c:368:53: error:
> implicit conversion from 'enum ib_queue_pair_type' to
> 'nodnic_queue_pair_type' [-Werror=3Denum-conversion]".
> this occurs with gcc 10 and developers seem to be aware of this:
>
> https://lists.ipxe.org/pipermail/ipxe-devel/2020-May/007049.html
>
> but it seems the master branch has not been patched yet.
>
> Anyway now I will concentrate on 4.14 if I need to compile from source :-=
)
>
> David
>
>
> Le mer. 16 sept. 2020 =C3=A0 22:59, Hans van Kranenburg <hans@knorrie.org=
> a
> =C3=A9crit :
>
>> On 9/16/20 6:12 PM, Olaf Hering wrote:
>> > On Wed, Sep 16, David I wrote:
>> >
>> >> So, how did the debian package was compiled ? is this the same source
>> code with
>> >> different options ?
>> >
>> > Xen 4.11 is from 2018. Use also a compiler from that year.
>> > Using this years compiler will lead to errors...
>>
>> In Debian, Buster with Xen 4.11 uses gcc 8.
>>
>> The Xen 4.11 that is in Debian unstable now does not compile any more
>> with gcc 10. That's why we really need to get Xen 4.14 in there now to
>> un-stuck that (even with additional picked patches again already).
>>
>> Hans
>>
>>

--0000000000004020f805af8674f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">update (for Hans and Ian):<div><br></div><div>I encounter =
the same issue when compiling the 4.14 branch:</div><div><br></div><div><br=
></div><div>git checkout -b stable-4.14 origin/stable-4.14</div><div>./conf=
igure &amp;&amp; make</div><div><br></div><div>make[8]: Entering directory =
&#39;/root/xen/tools/firmware/etherboot/ipxe/src&#39;<br>=C2=A0 [BUILD] bin=
/flexboot_nodnic.o<br>drivers/infiniband/flexboot_nodnic.c: In function &#3=
9;flexboot_nodnic_create_qp&#39;:<br>drivers/infiniband/flexboot_nodnic.c:3=
68:53: error: implicit conversion from &#39;enum ib_queue_pair_type&#39; to=
 &#39;nodnic_queue_pair_type&#39; [-Werror=3Denum-conversion]<br></div><div=
><br></div><div>this is with gcc 10 indeed.=C2=A0</div><div>Anyway I&#39;m =
trying to compile under xen4.11 (binary debian package) that is working per=
fectly.</div><div>But the compiling process of xen tools is bugged because=
=C2=A0of the drivers.=C2=A0</div><div>for example i have tried to comment t=
he enum-conversion warning in the Makefile, but i encounter=C2=A0other=C2=
=A0bugs with other drivers.</div><div><br></div><div>David</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu=
. 17 sept. 2020 =C3=A0=C2=A020:05, David I &lt;<a href=3D"mailto:dav.sec.li=
sts@gmail.com">dav.sec.lists@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Ok, tha=
nks.<div>So I have done a fresh checkout of the master branch, but unfortun=
ately, there&#39;s a bug in infiniband=C2=A0drivers.</div><div>the error is=
 : &quot;drivers/infiniband/flexboot_nodnic.c:368:53: error: implicit conve=
rsion from &#39;enum ib_queue_pair_type&#39; to &#39;nodnic_queue_pair_type=
&#39; [-Werror=3Denum-conversion]&quot;.<br></div><div>this occurs with gcc=
 10 and developers seem to be aware of this:</div><div><br></div><div><a hr=
ef=3D"https://lists.ipxe.org/pipermail/ipxe-devel/2020-May/007049.html" tar=
get=3D"_blank">https://lists.ipxe.org/pipermail/ipxe-devel/2020-May/007049.=
html</a><br></div><div><br></div><div>but it seems the master branch has no=
t been patched yet.</div><div><br></div><div></div><div>Anyway now I will c=
oncentrate on 4.14 if I need to compile from source :-)</div><div><br></div=
><div>David</div><div><br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 16 sept. 2020 =C3=A0=C2=A022:5=
9, Hans van Kranenburg &lt;<a href=3D"mailto:hans@knorrie.org" target=3D"_b=
lank">hans@knorrie.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On 9/16/20 6:12 PM, Olaf Hering wrote:<b=
r>
&gt; On Wed, Sep 16, David I wrote:<br>
&gt; <br>
&gt;&gt; So, how did the debian package was compiled ? is this the same sou=
rce code with<br>
&gt;&gt; different options ?<br>
&gt; <br>
&gt; Xen 4.11 is from 2018. Use also a compiler from that year.<br>
&gt; Using this years compiler will lead to errors...<br>
<br>
In Debian, Buster with Xen 4.11 uses gcc 8.<br>
<br>
The Xen 4.11 that is in Debian unstable now does not compile any more<br>
with gcc 10. That&#39;s why we really need to get Xen 4.14 in there now to<=
br>
un-stuck that (even with additional picked patches again already).<br>
<br>
Hans<br>
<br>
</blockquote></div>
</blockquote></div>

--0000000000004020f805af8674f6--

