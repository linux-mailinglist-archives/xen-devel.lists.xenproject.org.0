Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBCD7839D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 05:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hrw87-0007cI-18; Mon, 29 Jul 2019 03:15:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wN/v=V2=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hrw84-0007cD-UW
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 03:15:16 +0000
X-Inumbo-ID: 1541c1a1-b1af-11e9-8980-bc764e045a96
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1541c1a1-b1af-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 03:15:14 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s145so43163449qke.7
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jul 2019 20:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cqELUuUgn6xF1hqWiHemT+K7u4rAfejW/+c7WkSqNuQ=;
 b=gjSYH7rp2F1geaSX8dKZ8/NWM6liQyOKJ70hSwa55wdHiAEMVYw4WPG0ty9Do0zXV3
 G65NnguvkWYyNxrc8q3QnQmo9PVLQEf/gk4UrduNRPvnFsfV3jeOjSPYRTAKe0Hg+zJQ
 9LNvMDOSfrQqj7/kTExdVW28sYBtIMm7kLLrntEAHH5a6inQE+dlS1AMjVHTQmWsgQEH
 gFzWcMhRuKQ0eUFLk1dAeaUQnKn/l+6Z979aGJI2FgDjXTD/3VD+bpAqhwhma8vjJQ3O
 OinDuB9Dh6ep+I2ETLew/qouuxt6jTSGy8qD9bydEg4s4zkNqedvsJmdZgl7yRuSwYhy
 UHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cqELUuUgn6xF1hqWiHemT+K7u4rAfejW/+c7WkSqNuQ=;
 b=dv7/pYXYAe9RWV6mvDj4PQ6RcLbJ3vSwNvEUWPFhjf7EMJZDmvpIMP4t06bO8WFeGq
 PokJ4SJCs8BQp2K8Bt6vWj2Rb4u3ItBr2kprW3FvtLOdYHrMpFQmb0qJ717wypm4IX2X
 dnLiJp7rpCZzN9SUIdT9Jn5FivKQAyxQq1TG7lH0edYj/rx65Wtc5OfIRpHucUTQGSlq
 1fvYc4LIG6FAHSDlSew3MWz5TzPNUk8UMXZKiwTpyszHUfRdj8h+gfwbmjvJRXV5i5fm
 2WT4d6kjBvpc4Ia+IP9wa9on88vqWTxMzPCAr2iQcuFMWR25nLRf8+qPTDR68iHjh/fV
 vbwA==
X-Gm-Message-State: APjAAAUQYTg8exJW5SCxfZOEqd2mthL8p7tBrWUTYy+qvkrcCoNkt5Rx
 HztMYzT1i7GDMZCCi/RL/OY=
X-Google-Smtp-Source: APXvYqxU0mtmBiLL9cFOu8Ut6CAawETc4A9ITuJ5d4SVaFR9K80MM69TFzIs4Aem5xdVx3ZPAStUaA==
X-Received: by 2002:ae9:ec0d:: with SMTP id h13mr71426461qkg.26.1564370114177; 
 Sun, 28 Jul 2019 20:15:14 -0700 (PDT)
Received: from [192.168.50.2] (cpe-24-90-150-194.nyc.res.rr.com.
 [24.90.150.194])
 by smtp.gmail.com with ESMTPSA id b4sm24684196qtp.77.2019.07.28.20.15.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2019 20:15:13 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G77)
In-Reply-To: <20190722192056.15816-1-andrew.cooper3@citrix.com>
Date: Sun, 28 Jul 2019 23:15:12 -0400
Message-Id: <C1FD9748-EC91-4786-B4BA-1B04280C7926@gmail.com>
References: <20190722192056.15816-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] [PATCH] docs/sphinx: todo/wishlist
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7169474232152767511=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7169474232152767511==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-83056C63-A861-4B1A-9742-3898A3BDBAA1
Content-Transfer-Encoding: 7bit


--Apple-Mail-83056C63-A861-4B1A-9742-3898A3BDBAA1
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Jul 22, 2019, at 15:20, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> a.k.a. (at least in this form) Andrew's "work which might be offloadable t=
o
> someone else" list.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Tim Deegan <tim@xen.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien.grall@arm.com>
> CC: Lars Kurth <lars.kurth@citrix.com>
> CC: Paul Durrant <paul.durrant@citrix.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> RFC for obvious reasons.
>=20
> A rendered version of this can be found at:
> https://andrewcoop-xen.readthedocs.io/en/docs-wishlist/misc/wishlist.html
>=20
> During XenSummit in Chicago, it was expressed several times that having so=
me
> todo lists would be a benefit, to help coordinate work in related areas.
>=20
> Here is an attempt to start one.  For now, it covers one single
> item (xenstored's use of non-stable APIs) to get some feedback about the
> general approach.  I have plenty to get stuck into in Xen itself if this w=
ay
> of expressing them isn't deemed unacceptable.
>=20
> As for the wishlist itself, I think it is important that it be restricted t=
o
> concrete actions (i.e. already partially groomed, if you speak agile), whi=
ch
> are identified problems, and suggested fixes.
>=20
> In particular, I don't think it is appropriate to devolve into a bullet po=
int
> list of new features, or tasks like "document $whotsit".  It should be
> restricted to things which are real problems, on existing systems, which h=
ave
> some forward plan of action.  That way, any developer should be able to
> cross-reference at least at a high level, and see if there are areas of
> overlapping work, or whether a slightly tweaked approach might be suitable=
 for
> multiple areas.
>=20
> Anyway - thoughts from the peanut gallery?

Would you consider a permissive, documentation-oriented license, e.g. Creati=
ve Commons CC-BY 4.0, for Xen's Sphinx/RST documentation?
https://creativecommons.org/licenses/by/4.0/

As Xen moves beyond cloud computing into multi-vendor, edge/embedded supply c=
hains [1], the audience and context for Xen's technical docs is expanding.  B=
eyond operating system user/dev/admin, there may be: nested hypervisor user/=
dev/admin, certification (FuSA), security, firmware/device/accelerator dev, p=
rocessor architects, formal verification (e.g. TLA+ models), ecosystem build=
ing (e.g. blogs, books, videos, training, research) and commercial maintenan=
ce manuals for long-lived products with multiple Xen configs and embedded pr=
ocessors.

A permissive license would encourage reuse and tailoring of Xen docs.  With h=
ealthy OSS projects, there will remain an incentive to contribute long-lived=
 improvements upstream, even if those improvements are not mandated by the C=
C license. The Xen wiki license is historically CC-BY-SA 3.0, so that conten=
t would be incompatible with CC-BY 4.0.  But Xen's Sphinx/RST docs appear to=
 be focused on new content, so we have an opportunity to choose a license wh=
ich reflects current community priorities.

Rich

[1] https://dornerworks.com/blog/high-performance-space-computing-platform-n=
asa-sbir


--Apple-Mail-83056C63-A861-4B1A-9742-3898A3BDBAA1
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><div dir=3D"ltr"></div><div dir=3D"ltr">On Jul 22, 2019, at 15:20,=
 Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.coope=
r3@citrix.com</a>&gt; wrote:</div><div dir=3D"ltr"><br></div><blockquote typ=
e=3D"cite"><div dir=3D"ltr"><span>a.k.a. (at least in this form) Andrew's "w=
ork which might be offloadable to</span><br><span>someone else" list.</span>=
<br><span></span><br><span>Signed-off-by: Andrew Cooper &lt;<a href=3D"mailt=
o:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt;</span><br><sp=
an>---</span><br><span>CC: George Dunlap &lt;<a href=3D"mailto:George.Dunlap=
@eu.citrix.com">George.Dunlap@eu.citrix.com</a>&gt;</span><br><span>CC: Ian J=
ackson &lt;<a href=3D"mailto:ian.jackson@citrix.com">ian.jackson@citrix.com<=
/a>&gt;</span><br><span>CC: Jan Beulich &lt;<a href=3D"mailto:JBeulich@suse.=
com">JBeulich@suse.com</a>&gt;</span><br><span>CC: Stefano Stabellini &lt;<a=
 href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt;</span=
><br><span>CC: Tim Deegan &lt;<a href=3D"mailto:tim@xen.org">tim@xen.org</a>=
&gt;</span><br><span>CC: Wei Liu &lt;<a href=3D"mailto:wl@xen.org">wl@xen.or=
g</a>&gt;</span><br><span>CC: Julien Grall &lt;<a href=3D"mailto:julien.gral=
l@arm.com">julien.grall@arm.com</a>&gt;</span><br><span>CC: Lars Kurth &lt;<=
a href=3D"mailto:lars.kurth@citrix.com">lars.kurth@citrix.com</a>&gt;</span>=
<br><span>CC: Paul Durrant &lt;<a href=3D"mailto:paul.durrant@citrix.com">pa=
ul.durrant@citrix.com</a>&gt;</span><br><span>CC: Roger Pau Monn=C3=A9 &lt;<=
a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt;</span><b=
r><span></span><br><span>RFC for obvious reasons.</span><br><span></span><br=
><span>A rendered version of this can be found at:</span><br><span><a href=3D=
"https://andrewcoop-xen.readthedocs.io/en/docs-wishlist/misc/wishlist.html">=
https://andrewcoop-xen.readthedocs.io/en/docs-wishlist/misc/wishlist.html</a=
></span><br><span></span><br><span>During XenSummit in Chicago, it was expre=
ssed several times that having some</span><br><span>todo lists would be a be=
nefit, to help coordinate work in related areas.</span><br><span></span><br>=
<span>Here is an attempt to start one. &nbsp;For now, it covers one single</=
span><br><span>item (xenstored's use of non-stable APIs) to get some feedbac=
k about the</span><br><span>general approach. &nbsp;I have plenty to get stu=
ck into in Xen itself if this way</span><br><span>of expressing them isn't d=
eemed unacceptable.</span><br><span></span><br><span>As for the wishlist its=
elf, I think it is important that it be restricted to</span><br><span>concre=
te actions (i.e. already partially groomed, if you speak agile), which</span=
><br><span>are identified problems, and suggested fixes.</span><br><span></s=
pan><br><span>In particular, I don't think it is appropriate to devolve into=
 a bullet point</span><br><span>list of new features, or tasks like "documen=
t $whotsit". &nbsp;It should be</span><br><span>restricted to things which a=
re real problems, on existing systems, which have</span><br><span>some forwa=
rd plan of action. &nbsp;That way, any developer should be able to</span><br=
><span>cross-reference at least at a high level, and see if there are areas o=
f</span><br><span>overlapping work, or whether a slightly tweaked approach m=
ight be suitable for</span><br><span>multiple areas.</span><br><span></span>=
<br><span>Anyway - thoughts from the peanut gallery?</span><br></div></block=
quote><br><div>Would you consider a permissive, documentation-oriented licen=
se, e.g. Creative Commons CC-BY 4.0, for Xen's Sphinx/RST documentation?</di=
v><div><a href=3D"https://creativecommons.org/licenses/by/4.0/">https://crea=
tivecommons.org/licenses/by/4.0/</a></div><div><br></div><div>As Xen moves b=
eyond cloud computing into multi-vendor, edge/embedded supply chains [1], th=
e audience and context for Xen's technical docs is expanding. &nbsp;Beyond o=
perating system user/dev/admin, there may be: nested hypervisor user/dev/adm=
in, certification (FuSA), security, firmware/device/accelerator dev, process=
or architects, formal verification (e.g. TLA+ models), ecosystem building (e=
.g. blogs, books, videos, training, research) and commercial maintenance man=
uals for long-lived products with multiple Xen configs and embedded processo=
rs.</div><div><br></div><div>A permissive license would encourage reuse and t=
ailoring of Xen docs. &nbsp;With healthy OSS projects, there will remain an i=
ncentive to contribute long-lived improvements upstream, even if those impro=
vements are not mandated by the CC license. The Xen wiki license is historic=
ally CC-BY-SA 3.0, so that content would be incompatible with CC-BY 4.0. &nb=
sp;But Xen's Sphinx/RST docs appear to be focused on new content, so we have=
 an opportunity to choose a license which reflects current community priorit=
ies.</div><div><br></div><div>Rich</div><div><br></div><div>[1]&nbsp;<a href=
=3D"https://dornerworks.com/blog/high-performance-space-computing-platform-n=
asa-sbir">https://dornerworks.com/blog/high-performance-space-computing-plat=
form-nasa-sbir</a></div><div><br></div><div></div></div></body></html>=

--Apple-Mail-83056C63-A861-4B1A-9742-3898A3BDBAA1--


--===============7169474232152767511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7169474232152767511==--

