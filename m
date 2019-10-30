Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39828E9CAB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 14:51:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPoKp-0005ot-Fr; Wed, 30 Oct 2019 13:48:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oM5k=YX=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iPoKo-0005oo-20
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 13:48:26 +0000
X-Inumbo-ID: f1d21e8e-fb1b-11e9-beca-bc764e2007e4
Received: from mail-ot1-x333.google.com (unknown [2607:f8b0:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1d21e8e-fb1b-11e9-beca-bc764e2007e4;
 Wed, 30 Oct 2019 13:48:25 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id m19so2170704otp.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2019 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2zh8JjZPUctX/SZScHGxXckuRmiT2URzg8kX6f7h5Zs=;
 b=TkizCbrja8yiZjZYG9BbSpwCdbZLjnf5jrKGwxMj14zBgxLDjry03D04XI2sSI4cde
 mokB7IAGdZP03u4Rvm95x/gqUof3U4I2inNtpo/XU7X4XDtjA5O3P/WKVDU4xw7rn+Yz
 osvioVyRO8lUxreLTKiCTjrfWyvV5NzonSD1Aec7mblUV3KyFKZy0hNrb91IiS/wxUqd
 /lnurAScjVGaosCgteA9S74g7fKUJv8LBju+gewT4hRHtmrzLi42oKTtKnrArmJGozaH
 wi/LsKW2lyev9Igk8pi0GxG1vD9zr1of0QcR6EakaeTwPjh8OTwtsFb3yZH82rVNFAyb
 bnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2zh8JjZPUctX/SZScHGxXckuRmiT2URzg8kX6f7h5Zs=;
 b=mwYI6u467vuzDaQswqJr9nErTgp4p8a6nYvfnFwlPbVN5ySbQySL1tSzzq/0nMOSrE
 o/3XDulSEPafRtn74TBVXiK0NjVuQOCAQfm0Z1UNq7ok3vWvCeP3VP84DrynoSIvWJ59
 GybBuAjd2E/w27+QHp1HcyOUevUdFelCbpZkJU2KdkF9vr22/uaFwf9NENAf9I9uumNQ
 0208fKrXA1hikNI81Y6okofFGf2zlTXwIVdvxw3bNzKi0VjTcErygRgw7/z4i6UFoBNT
 zUcim8ufhbL5dyh7odvJG519Y68L5nUnWC7wLffOSLPSeeUIcks5XrOMnlArkzJmNXFt
 6UHg==
X-Gm-Message-State: APjAAAVygEmS4hBniqLANbSMeJ4Tm8h3jeCOJiaqA/tEcgaFM296hYjd
 OakQ0vBEpfoRPnfjIFcVAKgg5ebvWelNn8PwLsU=
X-Google-Smtp-Source: APXvYqyQY4D4xeq3ZoY3WkfJp3BcfqIWFqjjXyVnVd3NmRm58FKZQbPX+HbNYDiRgWOcTeKXDfDVtAB6oJc04gvI89A=
X-Received: by 2002:a9d:5914:: with SMTP id t20mr5359504oth.306.1572443304744; 
 Wed, 30 Oct 2019 06:48:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Wed, 30 Oct 2019 06:48:24
 -0700 (PDT)
In-Reply-To: <a635330c-0ef0-b4e1-53ff-b5bca3d2ffa0@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
 <CAL1e-=jW0Jmk=Y9o_UpdeOo6vfTm-qXyPVtk4O+RLOUN_5Y_cw@mail.gmail.com>
 <a635330c-0ef0-b4e1-53ff-b5bca3d2ffa0@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 30 Oct 2019 14:48:24 +0100
Message-ID: <CAL1e-=hxzXNxFXj_9HD-zs2xHgEvKSmkC354i5Ar030VFUr=qw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v3 00/20] hw/i386/pc: Split PIIX3
 southbridge from i440FX northbridge
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============1488466707202998516=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1488466707202998516==
Content-Type: multipart/alternative; boundary="0000000000009bdb32059620fc59"

--0000000000009bdb32059620fc59
Content-Type: text/plain; charset="UTF-8"

>
> In case you, for any reason, can't complete this by softfreeze, I advice
>> you not to rush, and postpone the integration to 5.0.
>>
>
> This series doesn't provide any useful feature, it is a simple cleanup,
> posted and reviewed before soft freeze, so we still have 1 week (until
> hard freeze) to have it merged, or postpone. No need to stress out for
> a cleanup ;)
>
>
I sounded too tight, and I apologize.

You submitted the pull request before softfreeze, so, in my understanding,
it should be merged, after some integration hickups are resolved. And I am
positive you will resolve them.

By 'completing' I meant 'sending the pull request', so you are on time in
my book.

Take it easy, and I welcome this fine work of yours to be integrated.

Aleksandar



> Regards,
>
> Phil.
>

--0000000000009bdb32059620fc59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
In case you, for any reason, can&#39;t complete this by softfreeze, I advic=
e you not to rush, and postpone the integration to 5.0.<br>
</blockquote>
<br>
This series doesn&#39;t provide any useful feature, it is a simple cleanup,=
<br>
posted and reviewed before soft freeze, so we still have 1 week (until<br>
hard freeze) to have it merged, or postpone. No need to stress out for<br>
a cleanup ;)<br>
<br></blockquote><div><br></div><div>I sounded too tight, and I apologize.<=
/div><div><br></div><div>You submitted the pull request before softfreeze, =
so, in my understanding, it should be merged, after some integration hickup=
s are resolved. And I am positive you will resolve them.</div><div><br></di=
v><div>By &#39;completing&#39; I meant &#39;sending the pull request&#39;, =
so you are on time in my book.</div><div><br></div><div>Take it easy, and I=
 welcome this fine work of yours to be integrated.</div><div><br></div><div=
>Aleksandar</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
Regards,<br>
<br>
Phil.<br>
</blockquote>

--0000000000009bdb32059620fc59--


--===============1488466707202998516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1488466707202998516==--

