Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B7DB242
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 18:24:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL8Wg-0000lZ-BM; Thu, 17 Oct 2019 16:21:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL8Wf-0000lU-2N
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 16:21:21 +0000
X-Inumbo-ID: 271915c4-f0fa-11e9-beca-bc764e2007e4
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 271915c4-f0fa-11e9-beca-bc764e2007e4;
 Thu, 17 Oct 2019 16:21:20 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c10so2388505otd.9
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mdvV1MJ9vbmguRopOY7RzixX0dFrk6bLj+zB/Mf7OlI=;
 b=TiyN4x/mlQS1ut3OscYEOuG2MuDtmT0kkDZA+izAjyCOn84oJ37p5gznUdNBWWECXg
 wQIG2baUdh1Zg2q7TJBLTw1f49iyN07vRUXIbvC9RIfTrHRRC/u87cY4jw3pSObAyybI
 FRxAhH+QUxyT0wBccisPlvaBgU+aPrvC4+LUICMHT93jmS1MlY6wnUReN4WE3QMRj21x
 pq6N2kWr13GV5O6+UyjBVuWFi9AEKodB7n2h21TfKf+DpZxGchobNdWlKXp14+6BmIZJ
 LNzrz9gWSBU9CcVif2O3VUUcDtPU4dO7t8yiTGx7HTCUpIB2cMJFUA6siYIYS/IxiJ+q
 xEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mdvV1MJ9vbmguRopOY7RzixX0dFrk6bLj+zB/Mf7OlI=;
 b=JMFWsPrAd3DmD0qwr3UOhbVLfMkCsAO/tpTdMlpqVYSiSvFRNBYUzu4uAEPC5DhaIM
 gYFcZYCpaFxmaeg9lxzephPrYOlVYOSdUwh7Y06oqBRpRxZVQLnbUpKFrUXCn5MGfBNm
 WRdqApcf/hXRlcOc2wzVwvDJ3P6c+eSfi8R1svVIaNndfiJi4Sd9GqBYd5dLKUqaEL7k
 tT9gjMU8X/C6ErFkhdtNRuYe1+fc4fMahfoU0VXkQQVlzhy+jwUNSJfs7J6+Rn5sc5xz
 58k8W4O6/uSClWDl8Eehh6LpSX7tmMehWhf0VaRPZrl3bomUsxf7O14wvx4K1SgGWD4U
 7PFw==
X-Gm-Message-State: APjAAAXbDLTAt3OnJdtONUFB8ag65yzRnV9MAF/S/bUKi9LYSScuaVWk
 rGG1+h8EtkR9o9m1A8aTxSuSNMOiM0QdUbE6grcZ7g==
X-Google-Smtp-Source: APXvYqxwl8OjwvMtj3/L18E83XJdrk+Ga7+vS3bhMSv/uc58naNDuhYqfQhgQIfEVzEDQ142A368k0axqE7nSwDGGeQ=
X-Received: by 2002:a05:6830:452:: with SMTP id
 d18mr3850352otc.295.1571329279681; 
 Thu, 17 Oct 2019 09:21:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 09:21:19
 -0700 (PDT)
In-Reply-To: <8bcf9189-efbe-1575-7e57-fd7bdd202547@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-22-philmd@redhat.com>
 <CAL1e-=hLUDDqFiV8W1f2PFGYJMomvmZUXmjA55X7WEEYMykjHQ@mail.gmail.com>
 <8bcf9189-efbe-1575-7e57-fd7bdd202547@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 18:21:19 +0200
Message-ID: <CAL1e-=g4nA1iCWYgoCSK4v53r+_dywkbf8_jfEVShrYyDDxZgg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 21/32] hw/i386/pc: Reduce gsi_handler scope
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============5234844938260993345=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5234844938260993345==
Content-Type: multipart/alternative; boundary="0000000000008a8c0005951d9bf8"

--0000000000008a8c0005951d9bf8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thursday, October 17, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> On 10/17/19 5:16 PM, Aleksandar Markovic wrote:
>
>> On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com
>> <mailto:philmd@redhat.com>> wrote:
>>
>>     pc_gsi_create() is the single function that uses gsi_handler.
>>     Make it a static variable.
>>
>>     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
>>     <mailto:philmd@redhat.com>>
>>     ---
>>       hw/i386/pc.c         | 2 +-
>>       include/hw/i386/pc.h | 2 --
>>       2 files changed, 1 insertion(+), 3 deletions(-)
>>
>>     diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>     index a7597c6c44..59de0c8a1f 100644
>>     --- a/hw/i386/pc.c
>>     +++ b/hw/i386/pc.c
>>     @@ -346,7 +346,7 @@ GlobalProperty pc_compat_1_4[] =3D {
>>       };
>>       const size_t pc_compat_1_4_len =3D G_N_ELEMENTS(pc_compat_1_4);
>>
>>     -void gsi_handler(void *opaque, int n, int level)
>>     +static void gsi_handler(void *opaque, int n, int level)
>>       {
>>           GSIState *s =3D opaque;
>>
>>     diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>>     index d0c6b9d469..75b44e156c 100644
>>     --- a/include/hw/i386/pc.h
>>     +++ b/include/hw/i386/pc.h
>>     @@ -172,8 +172,6 @@ typedef struct GSIState {
>>           qemu_irq ioapic_irq[IOAPIC_NUM_PINS];
>>       } GSIState;
>>
>>     -void gsi_handler(void *opaque, int n, int level);
>>     -
>>       GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled);
>>
>>
>> Philippe, this 2-line deletion seems not to belong to this patch. If
>> true, please place it in another or a separate patch.
>>
>
> It does, this is the point of the change, make it static and remove its
> declaration :)
>


OK, I see.

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

--0000000000008a8c0005951d9bf8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, October 17, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On 10/17/19 5:16 PM, Aleksandar Markovic wrote:<br=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a> &lt;mailto:=
<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a=
>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 pc_gsi_create() is the single function that uses gsi_handler.=
<br>
=C2=A0 =C2=A0 Make it a static variable.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mai=
lto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a><br>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:philmd@redhat.com" target=3D"_bl=
ank">philmd@redhat.com</a>&gt;&gt;<br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0hw/i386/pc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
 +-<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/i386/pc.h | 2 --<br>
=C2=A0 =C2=A0 =C2=A0=C2=A02 files changed, 1 insertion(+), 3 deletions(-)<b=
r>
<br>
=C2=A0 =C2=A0 diff --git a/hw/i386/pc.c b/hw/i386/pc.c<br>
=C2=A0 =C2=A0 index a7597c6c44..59de0c8a1f 100644<br>
=C2=A0 =C2=A0 --- a/hw/i386/pc.c<br>
=C2=A0 =C2=A0 +++ b/hw/i386/pc.c<br>
=C2=A0 =C2=A0 @@ -346,7 +346,7 @@ GlobalProperty pc_compat_1_4[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0const size_t pc_compat_1_4_len =3D G_N_ELEMENTS(p=
c_compat_1_4);<br>
<br>
=C2=A0 =C2=A0 -void gsi_handler(void *opaque, int n, int level)<br>
=C2=A0 =C2=A0 +static void gsi_handler(void *opaque, int n, int level)<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0GSIState *s =3D opaque;<br>
<br>
=C2=A0 =C2=A0 diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
=C2=A0 =C2=A0 index d0c6b9d469..75b44e156c 100644<br>
=C2=A0 =C2=A0 --- a/include/hw/i386/pc.h<br>
=C2=A0 =C2=A0 +++ b/include/hw/i386/pc.h<br>
=C2=A0 =C2=A0 @@ -172,8 +172,6 @@ typedef struct GSIState {<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0qemu_irq ioapic_irq[IOAPIC_NUM_PINS=
];<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0} GSIState;<br>
<br>
=C2=A0 =C2=A0 -void gsi_handler(void *opaque, int n, int level);<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0GSIState *pc_gsi_create(qemu_irq **irqs, bool pci=
_enabled);<br>
<br>
<br>
Philippe, this 2-line deletion seems not to belong to this patch. If true, =
please place it in another or a separate patch.<br>
</blockquote>
<br>
It does, this is the point of the change, make it static and remove its dec=
laration :)<br>
</blockquote><div><br></div><div><br></div><div>OK, I see.</div><div><div i=
d=3D"cvcmsg_16dbfeb33c93ed97" class=3D"yh  " style=3D"border-top-left-radiu=
s:0px;border-top-right-radius:0px;margin-bottom:11px;overflow:visible"><div=
 class=3D"Vh" id=3D"cvcfullmsg_16dbfeb33c93ed97"><div id=3D"cvcmsgbod_16dbf=
eb33c93ed97" class=3D"aj"><div class=3D"Ni"><div class=3D"ni pi " dir=3D"lt=
r"><p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:am=
arkovic@wavecomp.com" target=3D"_blank">amarkovic@wavecomp.com</a>&gt;</p><=
div style=3D"clear:both"></div></div><div style=3D"clear:both"></div><div><=
div class=3D"M j T b hc Aj S" tabindex=3D"0"><div class=3D"V j hf"></div></=
div></div><div style=3D"clear:both"></div></div></div></div></div><div id=
=3D"cvcmsg_16dbfecd588da1f7" class=3D"yh" style=3D"margin-bottom:11px"><div=
 class=3D"Vh" id=3D"cvcfullmsg_16dbfecd588da1f7"><div class=3D"M j Zi Mi  "=
 tabindex=3D"0"><div id=3D"cvcreply_16dbfecd588da1f7" class=3D"M j T b hc x=
h S  " tabindex=3D"0"><div class=3D"V j td"></div></div></div></div></div><=
/div><div>=C2=A0</div>

--0000000000008a8c0005951d9bf8--


--===============5234844938260993345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5234844938260993345==--

