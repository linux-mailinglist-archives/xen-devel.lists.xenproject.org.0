Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BB386DB7
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 01:09:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvrSs-0002Ht-UX; Thu, 08 Aug 2019 23:04:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qeg/=WE=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hvrSr-0002Ho-N5
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 23:04:57 +0000
X-Inumbo-ID: f06bcab4-ba30-11e9-8980-bc764e045a96
Received: from mail-qk1-x735.google.com (unknown [2607:f8b0:4864:20::735])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f06bcab4-ba30-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 23:04:56 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id r6so70314740qkc.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 16:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=EVWy5uMjqmWi86cf+GZW6r+YQ3KByJreN2MqQZrZfrA=;
 b=KzTZSAY//ox7QGczCdc5drUZCGunhGqZteyLIF5/BxtiQ+NaQVtioFSqB2poV0hzCu
 ZhVq8Tiheh8q8x7HALdlTM54iapp2uO+ozvSUMeoAy2fVzKVxL3Cqy+aVhHyhZn0Ikno
 80YmoVktlF5wIOcTSi/uiVLUHWlc1R5NkbO5w7WA8+NgfuSxjq0cI1OyliNHlYmSmjsP
 OxnZJo0qXPv2fhdw+pzMhhCvXrebxUaWdiWnyYfeVNSjeGGTf12XU6XpWLOCzjmbCcK0
 GcrKsYwqKFLlo08lbmMCROnkcUtB/weH9UJlzC9havYiAKXXQJ0Gb50rTgR84Vic6/Nk
 L4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=EVWy5uMjqmWi86cf+GZW6r+YQ3KByJreN2MqQZrZfrA=;
 b=kyahdbE9iwqHE35C7dIbbJLMgvOQnIMpkGaWkZVVb4R7iV1gkHKPwaQ7QnhRaXESIc
 VzbnlETLe+MDkcDXUUtv0SXfCfMwg7vLvBl3lOVq0KV0NAbN6PeixMWSm3SuZhyfQ6/q
 rfFH0Xk3d7E3feOvMbDwRcthjObJzQ5E2IUl1qd3vuubP0Jk2F+OunQNAG/57lXzKf4k
 YeWb1aS2DJxcBNmU+DSO25pKqmxJGG0R5FZSP7edXzwNhML2+hQntnNvgrvMGIHPdYWr
 jTW8/8kDuTg3gjPLRSkRtfsF/pJO9T4JrR3E16TtFAW6iFh+P52fJaUnKNwGU3UDBRwi
 xD2w==
X-Gm-Message-State: APjAAAVGZy4WhIW2ApKheu/qr5x011WC+Pz+ogR9sKjFM04IYR3vDP/S
 ZyKzmnbnnJUth1ChmiaHTl5Lq3oj
X-Google-Smtp-Source: APXvYqw3gpkRfiZB+WoykGQwBSeZrqZ3J5LfxdEk4C+cTqj4BG8OMZ7sMkNPFh7zVA8alin9yLhQ2w==
X-Received: by 2002:a37:660d:: with SMTP id a13mr16036169qkc.36.1565305496203; 
 Thu, 08 Aug 2019 16:04:56 -0700 (PDT)
Received: from ?IPv6:2607:fb90:7a2b:d242:65:d72:882:e0a9?
 ([2607:fb90:7a2b:d242:65:d72:882:e0a9])
 by smtp.gmail.com with ESMTPSA id g25sm35829761qto.45.2019.08.08.16.04.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 16:04:55 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPhone Mail (16G77)
In-Reply-To: <ef1133c1-6e6e-c80f-168d-2bebb0df23d5@citrix.com>
Date: Thu, 8 Aug 2019 19:04:54 -0400
Message-Id: <6B785E19-4580-4BD6-90FA-E2823C510B1C@gmail.com>
References: <ef1133c1-6e6e-c80f-168d-2bebb0df23d5@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] Design session notes: Build system gripe session
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: multipart/mixed; boundary="===============8315810245656552441=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8315810245656552441==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-DE1B363F-C381-44B6-9355-0571E3DAA43A
Content-Transfer-Encoding: 7bit


--Apple-Mail-DE1B363F-C381-44B6-9355-0571E3DAA43A
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On Jul 15, 2019, at 09:27, George Dunlap <george.dunlap@citrix.com> wrote:=

> ...
> https://hackmd.io/mAGT5bU9T6-aXJVj88deYw
> ...
>=20
> 3. meta virtualization build system (yocto) needs to pull simlink
> tricks, xen's build system stomp on that

Are more details available on this item?

This script can be used to cross-compile Xen for x86 or Arm, using OE/Yocto m=
eta-virtualization:  https://github.com/dozylynx/oe-build-xen

Rich=

--Apple-Mail-DE1B363F-C381-44B6-9355-0571E3DAA43A
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"></div><div dir=3D"ltr">On Jul 15, 2019, at 09:27, Ge=
orge Dunlap &lt;<a href=3D"mailto:george.dunlap@citrix.com">george.dunlap@ci=
trix.com</a>&gt; wrote:<br></div><blockquote type=3D"cite"><div dir=3D"ltr">=
<span>...</span><br><span><a href=3D"https://hackmd.io/mAGT5bU9T6-aXJVj88deY=
w">https://hackmd.io/mAGT5bU9T6-aXJVj88deYw</a></span><br><span>...</span><b=
r><br><span>3. meta virtualization build system (yocto) needs to pull simlin=
k</span><br><span>tricks, xen's build system stomp on that</span><br></div><=
/blockquote><div><br></div>Are more details available on this item?<br><div>=
<br></div><div>This script can be used to cross-compile Xen for x86 or Arm, u=
sing OE/Yocto meta-virtualization: &nbsp;<a href=3D"https://github.com/dozyl=
ynx/oe-build-xen">https://github.com/dozylynx/oe-build-xen</a></div><div><br=
></div><div>Rich</div></div></body></html>=

--Apple-Mail-DE1B363F-C381-44B6-9355-0571E3DAA43A--


--===============8315810245656552441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8315810245656552441==--

