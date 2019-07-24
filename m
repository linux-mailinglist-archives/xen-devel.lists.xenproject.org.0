Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B13E735C5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 19:46:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqLHv-0007hv-LD; Wed, 24 Jul 2019 17:42:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5Jwp=VV=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hqLHt-0007hq-MD
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 17:42:49 +0000
X-Inumbo-ID: 7358565f-ae3a-11e9-8980-bc764e045a96
Received: from mail-qk1-x72c.google.com (unknown [2607:f8b0:4864:20::72c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7358565f-ae3a-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 17:42:48 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id r21so34426619qke.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2019 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=QnJlXJm/uzDmuCiODV37HDdxuhhV3thqi5q4ZugVUyY=;
 b=MQMPqBp7OqtLTsw96VHI+B4k3AXg/iFcfCklfizCgZSZjCrOsdQQnEJyeFYjQ7PfFt
 GY3vxZxJzFMx4zhWc9iqxmlnlgW70VDJMDWOdMhUwT18WkmqmL+EnDwzU46R7AGt+9g6
 M9p6rp6PRiKWnn9NrnEfXDfv4cMbNPm3lyiZ3l8qn+sQVu8cqxghHaNXp/s+nNDSpWn3
 ehzbCv24d6sVj9AzKf28+do1M8uTTYskOH2Grgs5J+hJeUI1QV1X+TfnqSL1ildd3+Jf
 D8yfeFotedbHknzF1wnWJ7EU6yPhab/jQy2FcggriseYkVNbxeWBPmgclCe33xiXZkOB
 sGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=QnJlXJm/uzDmuCiODV37HDdxuhhV3thqi5q4ZugVUyY=;
 b=s123A9e0eIEGqOJuwVpzi5yVgRQjHoeU7ZEuvxQhWglWv4n7Fl1RsJ73HGbFgQA9kC
 cTv6gL1AkoJZ7eLhlAMTAQjLh2jluybslG/pSKQBWaFbj0YS5K9Qltj0oku7yHg7kSHf
 uMRZFyYcjyeSsL1AFPvfBAtkhUyZvTeG6GJrlxpEpPCrTlF9bVs5e3uothf6NkAY//Ks
 02kyy9B9eq8qwIsnSjG2zMeDCS3DCpwF1PfClykN0zWwf7UqLrlsICa0tlnhXe6OUjnU
 bba+S+DzwpBC6paypi3wHPKwUlYeROuDB5joLtHmlpdWDrEVevgR7NlPdtICGAKpLBSx
 lIsA==
X-Gm-Message-State: APjAAAU8xTlLrlRtuuaADaK15iqXDdpkgM6wIkxNExI+184b6GQ6XoR8
 JDGm+WVlRCze2dZYqL0tG/A=
X-Google-Smtp-Source: APXvYqw9veFEggavrGIVIQ8s70mfaY76Hb21zgKUm4Dv047g2DZUQbS9nSzhB/fgPCEWDYxWHopVaw==
X-Received: by 2002:a05:620a:62b:: with SMTP id
 11mr53577378qkv.282.1563990167420; 
 Wed, 24 Jul 2019 10:42:47 -0700 (PDT)
Received: from ?IPv6:2607:fb90:24a1:a61b:35c8:207e:1332:8c4e?
 ([2607:fb90:24a1:a61b:35c8:207e:1332:8c4e])
 by smtp.gmail.com with ESMTPSA id l5sm20907724qte.9.2019.07.24.10.42.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 10:42:46 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPhone Mail (16G77)
In-Reply-To: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
Date: Wed, 24 Jul 2019 13:42:46 -0400
Message-Id: <56D3EEF5-A08A-4894-B21F-9FDA1717B566@gmail.com>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
To: Roman Shaposhnik <roman@zededa.com>
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: Daniel Smith <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1069722416013997961=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1069722416013997961==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-5CCAF58C-ADDF-4ACE-ABE7-C9955DA2E016
Content-Transfer-Encoding: 7bit


--Apple-Mail-5CCAF58C-ADDF-4ACE-ABE7-C9955DA2E016
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On Jul 19, 2019, at 15:31, Roman Shaposhnik <roman@zededa.com> wrote:
>=20
> Hi!
>=20
> we're using Xen on Advantech ARK-2250 Embedded Box PC:
>    https://www.elmark.com.pl/web/uploaded/karty_produktow/advantech/ark-22=
50l/ark-2250l_instrukcja-uzytkownika.pdf

Roman,=20

Good to see Xen being used on fanless devices.  Does the AMI BIOS for the i7=
 6600U Skylake CPU [1] variant of ARK-2250 [2] support Intel TXT DRTM and di=
screte TPM, which would enable boot integrity [3] protection for Xen, read-o=
nly dom0 and stateless VMs?  Boot integrity is valuable on edge devices.

Rich


[1] CPU spec: https://ark.intel.com/content/www/us/en/ark/products/88192/int=
el-core-i7-6600u-processor-4m-cache-up-to-3-40-ghz.html

[2] PC spec: https://www.advantech.com/products/ark-2000_series_embedded_box=
_pcs/ark-2250l/mod_66ebc4e0-9a0c-489c-96a5-70a8054e9037

[3] TrenchBoot, Xen Summit 2019, https://youtube.com/watch?v=3Df0LZFSq4Ack


--Apple-Mail-5CCAF58C-ADDF-4ACE-ABE7-C9955DA2E016
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-equiv=
=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"></=
div><div dir=3D"ltr">On Jul 19, 2019, at 15:31, Roman Shaposhnik &lt;<a href=
=3D"mailto:roman@zededa.com">roman@zededa.com</a>&gt; wrote:<br><br></div><b=
lockquote type=3D"cite"><div dir=3D"ltr"><span>Hi!</span><br><span></span><b=
r><span>we're using Xen on Advantech ARK-2250 Embedded Box PC:</span><br><sp=
an> &nbsp;&nbsp;&nbsp;<a href=3D"https://www.elmark.com.pl/web/uploaded/kart=
y_produktow/advantech/ark-2250l/ark-2250l_instrukcja-uzytkownika.pdf">https:=
//www.elmark.com.pl/web/uploaded/karty_produktow/advantech/ark-2250l/ark-225=
0l_instrukcja-uzytkownika.pdf</a></span><br></div></blockquote><div><br></di=
v>Roman,&nbsp;</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Good to see X=
en being used on fanless devices. &nbsp;Does the AMI BIOS for the i7 6600U S=
kylake CPU [1] variant of ARK-2250 [2] support Intel TXT DRTM and discrete T=
PM, which would enable boot integrity [3] protection for Xen, read-only dom0=
 and stateless VMs? &nbsp;Boot integrity is valuable on edge devices.</div><=
div dir=3D"ltr"><br></div><div dir=3D"ltr">Rich<br><div><br></div><div><br><=
/div><div>[1] CPU spec:&nbsp;<a href=3D"https://ark.intel.com/content/www/us=
/en/ark/products/88192/intel-core-i7-6600u-processor-4m-cache-up-to-3-40-ghz=
.html">https://ark.intel.com/content/www/us/en/ark/products/88192/intel-core=
-i7-6600u-processor-4m-cache-up-to-3-40-ghz.html</a></div><div><br></div><di=
v><div><font color=3D"#000000" style=3D"caret-color: rgb(0, 0, 0); backgroun=
d-color: rgba(255, 255, 255, 0);">[2] PC spec:&nbsp;<a href=3D"https://www.a=
dvantech.com/products/ark-2000_series_embedded_box_pcs/ark-2250l/mod_66ebc4e=
0-9a0c-489c-96a5-70a8054e9037" style=3D"caret-color: rgb(0, 0, 0); backgroun=
d-color: rgba(255, 255, 255, 0);">https://www.advantech.com/products/ark-200=
0_series_embedded_box_pcs/ark-2250l/mod_66ebc4e0-9a0c-489c-96a5-70a8054e9037=
</a></font></div><div><br></div></div><div>[3] TrenchBoot, Xen Summit 2019,&=
nbsp;<a href=3D"https://m.youtube.com/watch?v=3Df0LZFSq4Ack">https://youtube=
.com/watch?v=3Df0LZFSq4Ack</a></div><div><br></div></div></div></body></html=
>=

--Apple-Mail-5CCAF58C-ADDF-4ACE-ABE7-C9955DA2E016--


--===============1069722416013997961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1069722416013997961==--

