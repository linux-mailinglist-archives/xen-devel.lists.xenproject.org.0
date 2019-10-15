Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F7D6D11
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 04:00:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKC4H-00072f-8a; Tue, 15 Oct 2019 01:56:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NU+A=YI=gmail.com=pairspace@srs-us1.protection.inumbo.net>)
 id 1iKC4F-00072a-2x
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 01:56:07 +0000
X-Inumbo-ID: f2ad2184-eeee-11e9-bbab-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2ad2184-eeee-11e9-bbab-bc764e2007e4;
 Tue, 15 Oct 2019 01:56:05 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id c25so42230386iot.12
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2019 18:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=eQpvab9/Nes0vwvD8AHRCFoP7s+oRzntdbwVUiaYXfc=;
 b=jPtrbPPfbvHNpuZ01tuCeXBIZI3uFaQSka5349RkWeoJd97R1b0vb0dHgBN80YZxLH
 KTQzTjF7ThhSI6QenC7ZpN1DCTrddJrYrfb4EmY8vI1Z6VgdMQSjBSj11ZahVH/wpkDO
 z3SVVeSmiv+APlJPAqNiD8+U41epGlpAoNeltP/uw9zLPzGSr0QasHZBgDaZBIaeiyYY
 4ecDkbkuCvzYkL4Q19YOuo0ENzp8r1Zt36jiWkpQx+g1HTNggwtTN3wg20GeFM6e3VZG
 wod7sC1v8dZZhj5grltzc/TwPGtvbnmZcsajf9gSdZlFH4qITshCdh5LBLGjuZkt1C4g
 AcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=eQpvab9/Nes0vwvD8AHRCFoP7s+oRzntdbwVUiaYXfc=;
 b=dUN+gxrbaudq5s7Kjnsj97fXr9diYcFdHhbEpQaQOH3p1IhF+wmD5OjSoTR7612S9Y
 fUJImyQXcJ94DeX1Qiu7dZ380QWJi9aQgFN+3bRh5Jr5K0kSLfJ9D6PkdhKZP9/osYxt
 GMqwvZAXUxXqFLAypYVYolzB6vNKTwTLLJ+8ZDynRpOY1waTYIM2NcJovs9aOCzLGONo
 MAAf6VG57v1N0rmX50mQtuqQng5ASbC8UGgyDufnO/72TDqtAdLrMukfV/ImNJfFneIO
 xHcqg6CRS/TFoaZQhhDqiEUx0x0lbni3R/Zt8dZmri1DOWsH58PFxXLcqEFVCijKmq64
 UmGw==
X-Gm-Message-State: APjAAAWp+Ni8GKY/9vgajnK0IfaNGf0c/VUickXq961L1iwjpDRLE+dR
 nnW4I6mQHcPEw93+mcvoScI=
X-Google-Smtp-Source: APXvYqz7Rwl9UY96c3SLadplpoK+D1c9LMTVqyrqRHXlnZ9wVIzNzR4miUJ96hjrpRuPDDUawufVBA==
X-Received: by 2002:a05:6638:3a6:: with SMTP id
 z6mr23985655jap.33.1571104564866; 
 Mon, 14 Oct 2019 18:56:04 -0700 (PDT)
Received: from [100.64.72.56] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id q74sm25424402iod.72.2019.10.14.18.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2019 18:56:04 -0700 (PDT)
From: P S <pairspace@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 14 Oct 2019 21:56:03 -0400
Message-Id: <32554931-9D4C-48BC-B86E-C29673D2D8AE@gmail.com>
References: <85313DBD-6C0F-4154-99D5-211C849FA3E1@citrix.com>
In-Reply-To: <85313DBD-6C0F-4154-99D5-211C849FA3E1@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
X-Mailer: iPad Mail (17A860)
Subject: Re: [Xen-devel] [RFC] Documentation formats,
 licenses and file system structure
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Rich Persaud <persaur@gmail.com>,
 Committers <committers@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============6480751723917723324=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6480751723917723324==
Content-Type: multipart/alternative; boundary=Apple-Mail-4285942D-D7BB-4AD9-A295-E0F6ACEF95A1
Content-Transfer-Encoding: 7bit


--Apple-Mail-4285942D-D7BB-4AD9-A295-E0F6ACEF95A1
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Oct 11, 2019, at 07:11, Lars Kurth <lars.kurth@citrix.com> wrote:
>=20
> =EF=BB=BFOn 11/10/2019, 02:24, "Stefano Stabellini" <sstabellini@kernel.or=
g> wrote:
>=20
>>    On Thu, 10 Oct 2019, Lars Kurth wrote:
>> * Would we ever include API docs generated from GPLv2 code? E.g. for safe=
ty use-cases?
>> @Stefano, @Artem: I guess this one is for you.=20
>> I suppose if we would have a similar issue for a safety manual
>> I am also assuming we would want to use sphinx docs and rst to generate a=
 future safety manual
>=20
>    Hi Lars,
>=20
>    Thanks for putting this email together.
>=20
>    In terms of formats, I don't have a preference between rst and pandoc,
>    but if we are going to use rst going forward, I'd say to try to use rst=

>    for everything, including converting all the old stuff. The fewer
>    different formats, the better.
>=20
> I think the proposal that needs to follow on from this (which would at som=
e
> point need to be voted on) would then be to go for rst.=20
>=20
>    As I mentioned during the FuSa call, I agree with you, Andrew, and
>    others that it would be best to have the docs under a CC license. I do
>    expect that we'll end up copy/pasting snippets of in-code comments into=

>    the docs, so I think it is important that we are allowed to do that fro=
m
>    a license perspective. It is great that GPLv2 allows it (we need to be
>    sure about this).
>=20
> The GPL does *not* allow this, but (c) law and fair use clauses do. So typ=
ically
> stuff such as
> * Referring to function names, signatures, etc. tend to be all fine
> * Copying large portions of in-line comments would not be fine, but
> If they are large, they would in most cases be re-written in a more suitab=
le
> language.=20
>=20
> So, I think overall, we should be fine. It's a bit of a grey area though.
>=20
> And as you point out below, most of the code in question is typically BSD=20=

>=20
>    Yes, I expect that some docs might be automatically generated, but from=

>    header files, not from source code. Especailly public/ header files,
>    which are typically BSD, not GPLv2. I cannot come up with examples of
>    docs we need to generated from GPLv2-only code at the moment, hopefully=

>    there won't be any.
>=20
> That makes things a lot easier.   =20
>=20
>>    I wasn't planning on reusing any of the markup, and wasn't expecting t=
o
>>    use much of the text either.  I'm still considering the option of
>>    defining that xen/public/* isn't the canonical description of the ABI,=

>>    because C is the wrong tool for the job.
>>=20
>>    Its fine to provide a C set of headers implementing an ABI, but there i=
s
>>    a very deliberate reason why the canonical migration v2 spec is in a
>>    text document.
>>=20
>> @Stefano: as you and I believe Brian will be spending time on improving t=
he
>> ABI docs, I think we need to build some agreement here on what/how
>> to do it. I was assuming that generally the consensus was to have
>> docs close to the code in source, but this does not seem to be the case.
>>=20
>> But if we do have stuff separately, ideally we would have a tool that hel=
ps
>> point people editing headers to also look at the relevant docs. Otherwise=
 it will
>> be hard to keep them in sync.
>=20
>    In general, it is a good idea to keep the docs close to the code to mak=
e
>    it easier to keep them up to date. But there is no one-size-fits-all
>    here. For public ABI descriptions, I agree with Andrew that ideally the=
y
>    should not be defined as C header files.
>=20
>    But it is not an issue: any work that we do here won't be wasted. For
>    instance, we could start by adding more comments to the current header
>    files. Then, as a second step, take all the comments and turn them into=

>    a proper ABI description document without any C function declarations.
>    It is easy to move English text around, as long as the license allows i=
t
>    -- that is the only potential blocker I can see.
>=20
> This is likely to be problematic. First of all, we are talking about BSD-3=
-Clause
> or BSD-2-Clause code (the latter is more dominant in headers I believe) in=

> all known cases.
>=20
> The main properties of the BSD are
> 1: Can be pretty much used anywhere for any purpose
> 2: Can be modified for any purpose=20
> 3: But the original license header must be retained in derivates

This is equivalent to attribution of the copyright owner of the originally c=
reated file.

> Does *not* have requirements around attribution as CC-BY-4: however,
> as we store everything in git attribution is handled by us by default

See above, the license header attributes copyright, since BSD was created fo=
r "software" and people who work on "software" would typically be looking at=
 source code, hence the primary attribution takes place there, with secondar=
y attribution in EULAs, "About" panels, etc.

> CC-BY-4 also has properties 1-3
> In addition: it does require that=20
> 4: Derived works are giving appropriate credit to authors=20
>    We could clarify in a COPYING how we prefer to do this
>    4.1: We could say that "referring to the Xen Project community"=20
>            is sufficient to comply with the attribution clause

One motivation for CC-BY (with attribution) is to create an incentive (credi=
t) for the creation of documentation, which is not commonly a favorite pasti=
me of developers.   Credit typically goes at least to the original author of=
 a section of documentation, with varying ways of crediting subsequent contr=
ibutors.  The documentation can be structured to make crediting easier.  The=
 mechanism for crediting can be designed to encourage specific outcomes, alo=
ng our projected doc lifecycle for safety certification, contributors, evalu=
ators and commercial investors.

>    4.2: We could require individual authors to be credited: in that
>            case we probably ought to lead by example and list the authors
>            in a credit/license section and extract the information from
>            git logs when we generate it (at some point in the future)
> 5: You give an indication whether you made changes ... in practice
> this means you have to state significant changes made to the works

This is also helpful for provenance of changes, which is relevant in safety-=
oriented documentation.  It can be used to clearly delineate CC-licensed con=
tent (which may be reused by many companies) from "All Rights Reserved" comm=
ercial content that may be added for a specific commercial audience or purpo=
se.

There is a difference between "software" which "runs on machines" and "docum=
entation" which "runs on humans".  Combined software (e.g. BSD code from two=
 origins) is executed identically, despite origin.  Humans make value judgem=
ents based on the author/origin of content, hence the focus on attribution. =
 Yes, there is a provenance graph in git (software/data), but that's not typ=
ically visible to human readers, except as a generated report, i.e. document=
ation.

> As such, BSD-2/3-Clause in our context works similarly to CC-BY-4
> from a downstream's perspective. In fact CC-BY-4 is somewhat stricter

If we don't want the incentives and provenance properties of CC-BY, there is=
 the option of CC0, which is the equivalent of public domain.  This would de=
legate the task of separating commercial vs CC content to each reader, witho=
ut any license-required attribution or separation.

Some background on licenses designed for documentation, which has different l=
egal requirements than software:

https://www.dreamsongs.com/IHE/IHE-50.html
https://creativecommons.org/faq/#what-are-creative-commons-licenses (not for=
 s/w)

Rich=

--Apple-Mail-4285942D-D7BB-4AD9-A295-E0F6ACEF95A1
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On Oct 11, 2019, at 07:11,=
 Lars Kurth &lt;lars.kurth@citrix.com&gt; wrote:</div><div dir=3D"ltr"><bloc=
kquote type=3D"cite"><br></blockquote></div><blockquote type=3D"cite"><div d=
ir=3D"ltr"><span>=EF=BB=BFOn 11/10/2019, 02:24, "Stefano Stabellini" &lt;sst=
abellini@kernel.org&gt; wrote:</span><br><span></span><br><span> &nbsp;&nbsp=
;&nbsp;On Thu, 10 Oct 2019, Lars Kurth wrote:</span><br><blockquote type=3D"=
cite"><span>* Would we ever include API docs generated from GPLv2 code? E.g.=
 for safety use-cases?</span><br></blockquote><blockquote type=3D"cite"><spa=
n>@Stefano, @Artem: I guess this one is for you. </span><br></blockquote><bl=
ockquote type=3D"cite"><span>I suppose if we would have a similar issue for a=
 safety manual</span><br></blockquote><blockquote type=3D"cite"><span>I am a=
lso assuming we would want to use sphinx docs and rst to generate a future s=
afety manual</span><br></blockquote><span></span><br><span> &nbsp;&nbsp;&nbs=
p;Hi Lars,</span><br><span></span><br><span> &nbsp;&nbsp;&nbsp;Thanks for pu=
tting this email together.</span><br><span></span><br><span> &nbsp;&nbsp;&nb=
sp;In terms of formats, I don't have a preference between rst and pandoc,</s=
pan><br><span> &nbsp;&nbsp;&nbsp;but if we are going to use rst going forwar=
d, I'd say to try to use rst</span><br><span> &nbsp;&nbsp;&nbsp;for everythi=
ng, including converting all the old stuff. The fewer</span><br><span> &nbsp=
;&nbsp;&nbsp;different formats, the better.</span><br><span></span><br><span=
>I think the proposal that needs to follow on from this (which would at some=
</span><br><span>point need to be voted on) would then be to go for rst. </s=
pan><br><span></span><br><span> &nbsp;&nbsp;&nbsp;As I mentioned during the =
FuSa call, I agree with you, Andrew, and</span><br><span> &nbsp;&nbsp;&nbsp;=
others that it would be best to have the docs under a CC license. I do</span=
><br><span> &nbsp;&nbsp;&nbsp;expect that we'll end up copy/pasting snippets=
 of in-code comments into</span><br><span> &nbsp;&nbsp;&nbsp;the docs, so I t=
hink it is important that we are allowed to do that from</span><br><span> &n=
bsp;&nbsp;&nbsp;a license perspective. It is great that GPLv2 allows it (we n=
eed to be</span><br><span> &nbsp;&nbsp;&nbsp;sure about this).</span><br><sp=
an></span><br><span>The GPL does *not* allow this, but (c) law and fair use c=
lauses do. So typically</span><br><span>stuff such as</span><br><span>* Refe=
rring to function names, signatures, etc. tend to be all fine</span><br><spa=
n>* Copying large portions of in-line comments would not be fine, but</span>=
<br><span>If they are large, they would in most cases be re-written in a mor=
e suitable</span><br><span>language. </span><br><span></span><br><span>So, I=
 think overall, we should be fine. It's a bit of a grey area though.</span><=
br><span></span><br><span>And as you point out below, most of the code in qu=
estion is typically BSD </span><br><span></span><br><span> &nbsp;&nbsp;&nbsp=
;Yes, I expect that some docs might be automatically generated, but from</sp=
an><br><span> &nbsp;&nbsp;&nbsp;header files, not from source code. Especail=
ly public/ header files,</span><br><span> &nbsp;&nbsp;&nbsp;which are typica=
lly BSD, not GPLv2. I cannot come up with examples of</span><br><span> &nbsp=
;&nbsp;&nbsp;docs we need to generated from GPLv2-only code at the moment, h=
opefully</span><br><span> &nbsp;&nbsp;&nbsp;there won't be any.</span><br><s=
pan></span><br><span>That makes things a lot easier. &nbsp;&nbsp;&nbsp;</spa=
n><br><span></span><br><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;I w=
asn't planning on reusing any of the markup, and wasn't expecting to</span><=
br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;use much o=
f the text either. &nbsp;I'm still considering the option of</span><br></blo=
ckquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;defining that xen=
/public/* isn't the canonical description of the ABI,</span><br></blockquote=
><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;because C is the wrong t=
ool for the job.</span><br></blockquote><blockquote type=3D"cite"><span></sp=
an><br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;Its f=
ine to provide a C set of headers implementing an ABI, but there is</span><b=
r></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;a very del=
iberate reason why the canonical migration v2 spec is in a</span><br></block=
quote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;text document.</spa=
n><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><=
blockquote type=3D"cite"><span>@Stefano: as you and I believe Brian will be s=
pending time on improving the</span><br></blockquote><blockquote type=3D"cit=
e"><span>ABI docs, I think we need to build some agreement here on what/how<=
/span><br></blockquote><blockquote type=3D"cite"><span>to do it. I was assum=
ing that generally the consensus was to have</span><br></blockquote><blockqu=
ote type=3D"cite"><span>docs close to the code in source, but this does not s=
eem to be the case.</span><br></blockquote><blockquote type=3D"cite"><span><=
/span><br></blockquote><blockquote type=3D"cite"><span>But if we do have stu=
ff separately, ideally we would have a tool that helps</span><br></blockquot=
e><blockquote type=3D"cite"><span>point people editing headers to also look a=
t the relevant docs. Otherwise it will</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>be hard to keep them in sync.</span><br></blockquote><span=
></span><br><span> &nbsp;&nbsp;&nbsp;In general, it is a good idea to keep t=
he docs close to the code to make</span><br><span> &nbsp;&nbsp;&nbsp;it easi=
er to keep them up to date. But there is no one-size-fits-all</span><br><spa=
n> &nbsp;&nbsp;&nbsp;here. For public ABI descriptions, I agree with Andrew t=
hat ideally they</span><br><span> &nbsp;&nbsp;&nbsp;should not be defined as=
 C header files.</span><br><span></span><br><span> &nbsp;&nbsp;&nbsp;But it i=
s not an issue: any work that we do here won't be wasted. For</span><br><spa=
n> &nbsp;&nbsp;&nbsp;instance, we could start by adding more comments to the=
 current header</span><br><span> &nbsp;&nbsp;&nbsp;files. Then, as a second s=
tep, take all the comments and turn them into</span><br><span> &nbsp;&nbsp;&=
nbsp;a proper ABI description document without any C function declarations.<=
/span><br><span> &nbsp;&nbsp;&nbsp;It is easy to move English text around, a=
s long as the license allows it</span><br><span> &nbsp;&nbsp;&nbsp;-- that i=
s the only potential blocker I can see.</span><br><span></span><br><span>Thi=
s is likely to be problematic. First of all, we are talking about BSD-3-Clau=
se</span><br><span>or BSD-2-Clause code (the latter is more dominant in head=
ers I believe) in</span><br><span>all known cases.</span><br><span></span><b=
r><span>The main properties of the BSD are</span><br><span>1: Can be pretty m=
uch used anywhere for any purpose</span><br><span>2: Can be modified for any=
 purpose </span><br><span>3: But the original license header must be retaine=
d in derivates</span><br></div></blockquote><div><br></div><div>This is equi=
valent to attribution of the copyright owner of the originally created file.=
</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span></span><span>Does=
 *not* have requirements around attribution as CC-BY-4: however,</span><br><=
span>as we store everything in git attribution is handled by us by default</=
span><br></div></blockquote><div><br></div><div>See above, the license heade=
r attributes copyright, since BSD was created for "software" and people who w=
ork on "software" would typically be looking at source code, hence the prima=
ry attribution takes place there, with secondary attribution in EULAs, "Abou=
t" panels, etc.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span></=
span><span>CC-BY-4 also has properties 1-3</span><br><span>In addition: it d=
oes require that </span><br><span>4: Derived works are giving appropriate cr=
edit to authors </span><br><span> &nbsp;&nbsp;&nbsp;We could clarify in a CO=
PYING how we prefer to do this</span><br><span> &nbsp;&nbsp;&nbsp;4.1: We co=
uld say that "referring to the Xen Project community" </span><br><span> &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;is sufficient t=
o comply with the attribution clause</span><br></div></blockquote><div><br><=
/div><div>One motivation for CC-BY (with attribution) is to create an incent=
ive (credit) for the creation of documentation, which is not commonly a favo=
rite pastime of developers. &nbsp; Credit typically goes at least to the ori=
ginal author of a section of documentation, with varying ways of crediting s=
ubsequent contributors. &nbsp;The documentation can be structured to make cr=
editing easier. &nbsp;The mechanism for crediting can be designed to encoura=
ge specific outcomes, along our projected doc lifecycle for safety certifica=
tion, contributors, evaluators and commercial investors.</div><br><blockquot=
e type=3D"cite"><div dir=3D"ltr"><span> &nbsp;&nbsp;&nbsp;4.2: We could requ=
ire individual authors to be credited: in that</span><br><span> &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case we probably ought=
 to lead by example and list the authors</span><br><span> &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;in a credit/license section a=
nd extract the information from</span><br><span> &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;git logs when we generate it (at some=
 point in the future)</span><br><span>5: You give an indication whether you m=
ade changes ... in practice</span><br><span>this means you have to state sig=
nificant changes made to the works</span><br></div></blockquote><div><br></d=
iv><div>This is also helpful for provenance of changes, which is relevant in=
 safety-oriented documentation. &nbsp;It can be used to clearly delineate CC=
-licensed content (which may be reused by many companies) from "All Rights R=
eserved" commercial content that may be added for a specific commercial audi=
ence or purpose.</div><div><br></div><div>There is a difference between "sof=
tware" which "runs on machines" and "documentation" which "runs on humans". &=
nbsp;Combined software (e.g. BSD code from two origins) is executed identica=
lly, despite origin. &nbsp;Humans make value judgements based on the author/=
origin of content, hence the focus on attribution. &nbsp;Yes, there is a pro=
venance graph in git (software/data), but that's not typically visible to hu=
man readers, except as a generated report, i.e. documentation.</div><br><blo=
ckquote type=3D"cite"><div dir=3D"ltr"><span></span><span>As such, BSD-2/3-C=
lause in our context works similarly to CC-BY-4</span><br><span>from a downs=
tream's perspective. In fact CC-BY-4 is somewhat stricter</span><br></div></=
blockquote><div><br></div><div>If we don't want the incentives and provenanc=
e properties of CC-BY, there is the option of CC0, which is the equivalent o=
f public domain. &nbsp;This would delegate the task of separating commercial=
 vs CC content to each reader, without any license-required attribution or s=
eparation.</div><div><br></div><div>Some background on licenses designed for=
 documentation, which has different legal requirements than software:</div><=
div><br></div><div><a href=3D"https://www.dreamsongs.com/IHE/IHE-50.html">ht=
tps://www.dreamsongs.com/IHE/IHE-50.html</a></div><div><a href=3D"https://cr=
eativecommons.org/faq/#what-are-creative-commons-licenses">https://creativec=
ommons.org/faq/#what-are-creative-commons-licenses</a>&nbsp;(not for s/w)</d=
iv><div><br></div><div><span style=3D"-webkit-text-size-adjust: auto;">Rich<=
/span></div></body></html>=

--Apple-Mail-4285942D-D7BB-4AD9-A295-E0F6ACEF95A1--


--===============6480751723917723324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6480751723917723324==--

