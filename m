Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3CD3067A
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 04:11:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWWxt-000050-Eq; Fri, 31 May 2019 02:08:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=o+12=T7=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hWWxs-00004v-Fx
 for xen-devel@lists.xen.org; Fri, 31 May 2019 02:08:16 +0000
X-Inumbo-ID: f296aec1-8348-11e9-8980-bc764e045a96
Received: from mail-it1-x12d.google.com (unknown [2607:f8b0:4864:20::12d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f296aec1-8348-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 02:08:14 +0000 (UTC)
Received: by mail-it1-x12d.google.com with SMTP id i63so8469861ita.3
 for <xen-devel@lists.xen.org>; Thu, 30 May 2019 19:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=OW/vZQwn7hx4peITZTfzFD9UbpunUlokEP5WUBXMjQo=;
 b=bqdy49Gsbydj72KfEDlcBapOhHP4tpyuo7uw/bumwKHNbcQxZip96+vfvwRsemp4Zm
 4Td4FP/vw/mOJfAbAcSPqIQ3lOGu+8Ox/dkFZsiWvEzEN4IwLMSbuQhFUaBrPBG8EU6Z
 nn4PsUdGlQuH5u6/4hrF+/sUsMjBC1JNNc7iE4Gr0KRibvEyOJREr07DtTVv79kwTnqh
 BzB5r4C96aNdeC6stLWx6lh8uN+RG5GUTxIt9CzL0Y+afThnOZLCrvOAzgnuQKsp0+J1
 ANdp0VKrNIkVYHXr13Q+x41GTvNT1tZa+/GLns1wzPUsHD+m5zDiOB2ZE41rd0asUiEa
 /3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=OW/vZQwn7hx4peITZTfzFD9UbpunUlokEP5WUBXMjQo=;
 b=mAwE+Z08xpkAxxWRtOycO9KeztguKt8qtmxFseAxAsOhPL+Jg7GMJAceh9aTmmsRSh
 TspUWRw+sTZaThLy8k2QQUpj+OZMKb2PLg9PTPqh1Z2OOFJEUwRLdVOu4c+EIpI29Bgl
 qX5IhcMvu/WpNIBV1icvX1ft0rqe4u+FeVS7tu+Tz5I8Q3QMtnt3zRdvt+jDuRVzYfR0
 /+i1N5ya6scih7iJPisjA5HhbWO9t6fCAuaOK0OWMWba0JfFcKmar3DnCyeBfKnRweWK
 albC/AfqMq83XB1hwleVuhL4gw4ajJpuytmvOgm0U/wNA2QaFl84mDUOVccE/u5f+hAk
 FakA==
X-Gm-Message-State: APjAAAXSwUXSWMPCQhOkfZNt8m+FV6vqTULGF2iZNlBA7tjoHRuhv5LW
 8QhyKo0IQFpdsJrZwJuHQHbCZNA9VXo=
X-Google-Smtp-Source: APXvYqwQq9XLCZvvOkHo9tYwRXkdL0JWIEoQvs/aOf/o+eHMrUQy0k9uR5m6vas86+a8R7jCjKRDDA==
X-Received: by 2002:a05:660c:492:: with SMTP id
 a18mr5233897itk.48.1559268493784; 
 Thu, 30 May 2019 19:08:13 -0700 (PDT)
Received: from [100.64.75.141] ([205.185.206.126])
 by smtp.gmail.com with ESMTPSA id b196sm1869772itb.30.2019.05.30.19.08.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 19:08:13 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16F203)
In-Reply-To: <20190328150426.7295-1-brian.woods@amd.com>
Date: Thu, 30 May 2019 22:08:12 -0400
Message-Id: <A38EA0E1-3AB5-4816-82C5-8540D28D3D1B@gmail.com>
References: <20190328150426.7295-1-brian.woods@amd.com>
To: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [Xen-devel] [PATCH v2 0/3] mwait support for AMD processors
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
Cc: Wei Liu <wei.liu2@citrix.com>, Lars Kurth <lars.kurth.xen@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8308525488054331651=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8308525488054331651==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-76E8C706-775A-4326-98CF-EED54F445B95
Content-Transfer-Encoding: 7bit


--Apple-Mail-76E8C706-775A-4326-98CF-EED54F445B95
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On Mar 28, 2019, at 11:04, Woods, Brian <Brian.Woods@amd.com> wrote:
>=20
> This patch series add support and enablement for mwait on AMD Naples
> and Rome processors.  Newer AMD processors support mwait, but only for
> c1, and for c2 halt is used.  The mwait-idle driver is modified to be
> able to use both mwait and halt for idling.

Would you mind if I create a Xen Project JIRA ticket, or a wiki page, to tra=
ck requirements and implementations related to this patch series?

=46rom the initial thread [1]:
>>> On certain AMD families that support mwait, only c1 can be reached by
>>> + * mwait and to reach c2, halt has to be used.
>>> + */
>>> +#define CPUIDLE_FLAG_USE_HALT        0x2
>>=20
>> Could you point us at where in the manuals this behavior is described?
>> While PM Vol 2 has a chapter talking about P-states, I can't seem to
>> find any mention of C-states there.
>=20
> IIRC it's in the NDA PPR and internally it's in some other documents.=20
> We don't have support to use mwait while in CC6 due to caches being=20
> turned off etc.  If we did have mwait suport for CC6, we'd use that here=20=

> (basically mirroring Intel).  Sadly I don't think we have any public=20
> information directly detailing this information. =20

Can this be documented in the patch comment, or an AMD-specific page on wiki=
.xenproject.org?  It's a requirement/input to all possible implementations. =
=20

=46rom a comment in the April 2018 Linux patch by Yazen [2]:
> x86/smpboot: Don't use mwait_play_dead() on AMD systems
> Recent AMD systems support using MWAIT for C1 state. However, MWAIT will
> not allow deeper cstates than C1 on current systems.
>=20
> play_dead() expects to use the deepest state available.  The deepest state=

> available on AMD systems is reached through SystemIO or HALT. If MWAIT is
> available, it is preferred over the other methods, so the CPU never reache=
s
> the deepest possible state.
>=20
> Don't try to use MWAIT to play_dead() on AMD systems. Instead, use CPUIDLE=

> to enter the deepest state advertised by firmware. If CPUIDLE is not
> available then fallback to HALT.

For the ticket/wiki: what are the expected benefits of the proposed Xen chan=
ge?  Would it reduce idle power consumption on Ryzen 1000/2000/3000? Epyc 30=
00/7000? Any sample data available for idle power before/after the v2 patch?=


=46rom a thread [3] posted by Jan this week, "x86/AMD: make C-state handling=
 independent of Dom0":
> The 3rd patch is my counterproposal to Brian's intended abuse (as I would c=
all it) of the mwait-idle driver.=20

Do we need a new, patch-independent, thread for convergence of candidate imp=
lementations which address the requirements (documented in ticket/wiki)?  Sh=
ould discussion move from the initial thread [1] to the counter-proposal thr=
ead [3]?  Or this thread?

Rich

[1] https://lists.gt.net/xen/devel/545688

[2] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3D=
x86-urgent-for-linus&id=3Dda6fa7ef67f07108a1b0cb9fd9e7fcaabd39c051

[3] https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg01894.ht=
ml


--Apple-Mail-76E8C706-775A-4326-98CF-EED54F445B95
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><div dir=3D"l=
tr"><span></span></div><div dir=3D"ltr"><meta http-equiv=3D"content-type" co=
ntent=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"><span></span></div><di=
v dir=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dutf-8"><div dir=3D"ltr"></div><div dir=3D"ltr">On Mar 28, 2019, at 11:04=
, Woods, Brian &lt;<a href=3D"mailto:Brian.Woods@amd.com">Brian.Woods@amd.co=
m</a>&gt; wrote:</div><div dir=3D"ltr"><br></div><blockquote type=3D"cite"><=
div dir=3D"ltr"><span>This patch series add support and enablement for mwait=
 on AMD Naples</span><br><span>and Rome processors. &nbsp;Newer AMD processo=
rs support mwait, but only for</span><br><span>c1, and for c2 halt is used. &=
nbsp;The mwait-idle driver is modified to be</span><br><span>able to use bot=
h mwait and halt for idling.</span></div></blockquote><br><div>Would you min=
d if I create a Xen Project JIRA ticket, or a wiki page, to track requiremen=
ts and implementations related to this patch series?</div><div><br></div><di=
v>=46rom the initial thread [1]:</div><div><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><font color=3D"#000000"><span style=3D"caret-color: rgb(0=
, 0, 0); background-color: rgba(255, 255, 255, 0);"></span></font></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><font color=3D"#000000"><span style=3D"caret-color: rgb(0,=
 0, 0); background-color: rgba(255, 255, 255, 0);">On certain AMD families t=
hat support mwait, only c1 can be reached by<br></span></font></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><font color=3D=
"#000000"><span style=3D"caret-color: rgb(0, 0, 0); background-color: rgba(2=
55, 255, 255, 0);">+ * mwait and to reach c2, halt has to be used.<br></span=
></font></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><font color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0); b=
ackground-color: rgba(255, 255, 255, 0);">+ */<br></span></font></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><font colo=
r=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0); background-color: rg=
ba(255, 255, 255, 0);">+#define CPUIDLE_FLAG_USE_HALT &nbsp; &nbsp; &nbsp; &=
nbsp;0x2<br></span></font></blockquote></blockquote><blockquote type=3D"cite=
"><font color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0); backgrou=
nd-color: rgba(255, 255, 255, 0);"><br></span></font></blockquote><blockquot=
e type=3D"cite"><font color=3D"#000000"><span style=3D"caret-color: rgb(0, 0=
, 0); background-color: rgba(255, 255, 255, 0);">Could you point us at where=
 in the manuals this behavior is described?<br></span></font></blockquote><b=
lockquote type=3D"cite"><font color=3D"#000000"><span style=3D"caret-color: r=
gb(0, 0, 0); background-color: rgba(255, 255, 255, 0);">While PM Vol 2 has a=
 chapter talking about P-states, I can't seem to<br></span></font></blockquo=
te><blockquote type=3D"cite"><font color=3D"#000000"><span style=3D"caret-co=
lor: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0);">find any menti=
on of C-states there.<br></span></font></blockquote><span style=3D"backgroun=
d-color: rgba(255, 255, 255, 0);"><br>IIRC it's in the NDA PPR and internall=
y it's in some other documents.&nbsp;<br>We don't have support to use mwait w=
hile in CC6 due to caches being&nbsp;<br>turned off etc. &nbsp;If we did hav=
e mwait suport for CC6, we'd use that here&nbsp;<br>(basically mirroring Int=
el). &nbsp;Sadly I don't think we have any public&nbsp;<br>information direc=
tly detailing this information. &nbsp;</span></blockquote><br></div><div>Can=
 this be documented in the patch comment, or an AMD-specific page on <a href=
=3D"http://wiki.xenproject.org">wiki.xenproject.org</a>? &nbsp;It's a requir=
ement/input to all possible implementations. &nbsp;</div><div><br></div><div=
>=46rom a comment in the April 2018 Linux patch by Yazen [2]:</div><div><div=
>&gt; x86/smpboot: Don't use mwait_play_dead() on AMD systems</div><div>&gt;=
 Recent AMD systems support using MWAIT for C1 state. However, MWAIT will</d=
iv><div>&gt; not allow deeper cstates than C1 on current systems.</div><div>=
&gt;&nbsp;</div><div>&gt; play_dead() expects to use the deepest state avail=
able. &nbsp;The deepest state</div><div>&gt; available on AMD systems is rea=
ched through SystemIO or HALT. If MWAIT is</div><div>&gt; available, it is p=
referred over the other methods, so the CPU never reaches</div><div>&gt; the=
 deepest possible state.</div><div>&gt;&nbsp;</div><div>&gt; Don't try to us=
e MWAIT to play_dead() on AMD systems. Instead, use CPUIDLE</div><div>&gt; t=
o enter the deepest state advertised by firmware. If CPUIDLE is not</div><di=
v>&gt; available then fallback to HALT.</div></div><div><br></div><div>For t=
he ticket/wiki: what are the expected benefits of the proposed Xen change? &=
nbsp;Would it reduce idle power consumption on Ryzen 1000/2000/3000? Epyc 30=
00/7000? Any sample data available for idle power before/after the v2 patch?=
</div><div><br></div><div>=46rom a thread [3] posted by Jan this week, "x86/=
AMD: make C-state handling independent of Dom0":</div><div>&gt;&nbsp;The 3rd=
 patch is my counterproposal to Brian's intended abuse (as I would call it) o=
f the mwait-idle driver.&nbsp;</div><div><br></div><div>Do we need a new, pa=
tch-independent, thread for convergence of candidate implementations which a=
ddress the requirements (documented in ticket/wiki)? &nbsp;Should discussion=
 move from the initial thread [1] to the counter-proposal thread [3]? &nbsp;=
Or this thread?</div><div><br></div><div>Rich</div><div><br></div><div>[1]<s=
pan style=3D"background-color: rgba(255, 255, 255, 0);">&nbsp;<a href=3D"htt=
ps://lists.gt.net/xen/devel/545688">https://lists.gt.net/xen/devel/545688</a=
></span></div><div><br></div><div>[2]&nbsp;<a href=3D"https://git.kernel.org=
/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dx86-urgent-for-linus&amp;i=
d=3Dda6fa7ef67f07108a1b0cb9fd9e7fcaabd39c051&amp;utm_source=3Danz">https://g=
it.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dx86-urgent-fo=
r-linus&amp;id=3Dda6fa7ef67f07108a1b0cb9fd9e7fcaabd39c051</a></div><div><br>=
</div><div>[3]&nbsp;<a href=3D"https://lists.xenproject.org/archives/html/xe=
n-devel/2019-05/msg01894.html" style=3D"caret-color: rgb(0, 0, 0); backgroun=
d-color: rgba(255, 255, 255, 0);"><font color=3D"#000000">https://lists.xenp=
roject.org/archives/html/xen-devel/2019-05/msg01894.html</font></a></div><di=
v><br></div></div></div></div></div></body></html>=

--Apple-Mail-76E8C706-775A-4326-98CF-EED54F445B95--


--===============8308525488054331651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8308525488054331651==--

