Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6659ED6D15
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 04:00:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKC6N-00079p-Qp; Tue, 15 Oct 2019 01:58:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Zjly=YI=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iKC6M-00079i-C6
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 01:58:18 +0000
X-Inumbo-ID: 410009fa-eeef-11e9-8aca-bc764e2007e4
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 410009fa-eeef-11e9-8aca-bc764e2007e4;
 Tue, 15 Oct 2019 01:58:16 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id q10so42437506iop.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2019 18:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=DRd6GE0as3jLiLIQTCV2hSW2SsS5kO05HkOJtryoFtE=;
 b=ukER5NHQ0GlYkT85BBge5JlG7Cev3LOKTu4WMTugB6pkK03IFqv03dKL/fl98B+uiT
 fVgORfD4SqRgIzdJCuaAlvQ2lBrWCPzgNYHMWbMkxsJWNrraaHHFhvMnG3/lDfLV8b3d
 reVwODGevsF88zNZUi1fX3DuRtyvZ+ugEsengUymm5lAAKom+P276FD9RUUfkpEu5TGM
 mD4NWigh6kEDfXpX3FDcHRbgJDcWr8eSKqcQdKXBP6/AYUL+8qln1HrskHWJSRGUKHUn
 LAwXPC+O4OfYLRvIP3MkPP3ckNnpj16A5inr9QOCIRgB52b93xg4+JwwYAwuLJVNfvfA
 WZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=DRd6GE0as3jLiLIQTCV2hSW2SsS5kO05HkOJtryoFtE=;
 b=eyPTlUcH9hex/ed8fMv+RTNUtC372XfHHRUl7ED/Fy/SC3WayEJEZ+MvzZlKGUgzFI
 OD10J/dqyKqg+Jo1IUnN2eOG7Mj2SnXgO3U8Bbz9b4dz9Dy1NPeiXNT8UkqfjyjYV+aM
 AKtlELQ9S4/H90yAueChixkp7QHvFiEYi31y/PPtQ0ST9emIgNDVYan1F6GjRvaV5yvm
 k+6B/3UbEcLPn1WlMVoO8F97IHe3xvDF10ce5dy8Rxa93ySjPvcFkGDjeU3bLwP0LMkH
 wEviXSn3u0x2oLSQKXwfdU6TVZUJReoiAG54LBgV905h9fAbSEKOjTPWouIDQ2LlmOrM
 IQZQ==
X-Gm-Message-State: APjAAAV31XSEzZIpZg98i44sxxTQOTOc0PUTRA0MbCSUrsE0zCx7IcnO
 srABC/IwIAUF/m8r1GdeuPA=
X-Google-Smtp-Source: APXvYqyoJCFRQ7oNg2UiamX/BrzBIrWFCSr+jYBtqI6vKVgd3jtKdea1JKM3DhODBUTD17NGxbJhOA==
X-Received: by 2002:a05:6638:297:: with SMTP id
 c23mr40889328jaq.87.1571104696276; 
 Mon, 14 Oct 2019 18:58:16 -0700 (PDT)
Received: from [100.64.72.56] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id i26sm17144475ion.40.2019.10.14.18.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2019 18:58:15 -0700 (PDT)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 14 Oct 2019 21:58:15 -0400
Message-Id: <02DB5697-C169-434C-BFCD-422A9E150A1A@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2968947029518535433=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2968947029518535433==
Content-Type: multipart/alternative; boundary=Apple-Mail-D148CF3B-F44D-4011-A57F-9B2CC4F71EE9
Content-Transfer-Encoding: 7bit


--Apple-Mail-D148CF3B-F44D-4011-A57F-9B2CC4F71EE9
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Oct 11, 2019, at 07:11, Lars Kurth <lars.kurth@citrix.com> wrote:
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

--Apple-Mail-D148CF3B-F44D-4011-A57F-9B2CC4F71EE9
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div style=3D"font-family: -webkit-standard=
; -webkit-text-size-adjust: auto; padding: 13px 0px 0px;"><blockquote type=3D=
"cite" __apple_fixed_attribute=3D"true" style=3D"font-family: UICTFontTextSt=
yleTallBody;"><div dir=3D"ltr">On Oct 11, 2019, at 07:11, Lars Kurth &lt;<a h=
ref=3D"mailto:lars.kurth@citrix.com" dir=3D"ltr" x-apple-data-detectors=3D"t=
rue" x-apple-data-detectors-type=3D"link" x-apple-data-detectors-result=3D"1=
" style=3D"color: currentcolor;">lars.kurth@citrix.com</a>&gt; wrote:</div><=
/blockquote><div dir=3D"ltr" style=3D"font-family: UICTFontTextStyleTallBody=
;"><blockquote type=3D"cite"><br></blockquote></div><blockquote type=3D"cite=
" style=3D"font-family: UICTFontTextStyleTallBody;"><div dir=3D"ltr">=EF=BB=BF=
On&nbsp;<a href=3D"x-apple-data-detectors://2" dir=3D"ltr" x-apple-data-dete=
ctors=3D"true" x-apple-data-detectors-type=3D"calendar-event" x-apple-data-d=
etectors-result=3D"2" style=3D"color: currentcolor; text-decoration-color: r=
gba(52, 49, 206, 0.380392);">11/10/2019, 02:24</a>, "Stefano Stabellini" &lt=
;<a href=3D"mailto:sstabellini@kernel.org" dir=3D"ltr" x-apple-data-detector=
s=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-detectors-resul=
t=3D"3" style=3D"color: currentcolor;">sstabellini@kernel.org</a>&gt; wrote:=
<br><br><blockquote type=3D"cite" __apple_fixed_attribute=3D"true">&nbsp;&nb=
sp;&nbsp;On Thu, 10 Oct 2019, Lars Kurth wrote:<br></blockquote><blockquote t=
ype=3D"cite">* Would we ever include API docs generated from GPLv2 code? E.g=
. for safety use-cases?<br></blockquote><blockquote type=3D"cite">@Stefano, @=
Artem: I guess this one is for you.&nbsp;<br></blockquote><blockquote type=3D=
"cite">I suppose if we would have a similar issue for a safety manual<br></b=
lockquote><blockquote type=3D"cite">I am also assuming we would want to use s=
phinx docs and rst to generate a future safety manual<br></blockquote><br>&n=
bsp;&nbsp;&nbsp;Hi Lars,<br><br>&nbsp;&nbsp;&nbsp;Thanks for putting this em=
ail together.<br><br>&nbsp;&nbsp;&nbsp;In terms of formats, I don't have a p=
reference between rst and pandoc,<br>&nbsp;&nbsp;&nbsp;but if we are going t=
o use rst going forward, I'd say to try to use rst<br>&nbsp;&nbsp;&nbsp;for e=
verything, including converting all the old stuff. The fewer<br>&nbsp;&nbsp;=
&nbsp;different formats, the better.<br><br>I think the proposal that needs t=
o follow on from this (which would at some<br>point need to be voted on) wou=
ld then be to go for rst.&nbsp;<br><br>&nbsp;&nbsp;&nbsp;As I mentioned duri=
ng the FuSa call, I agree with you, Andrew, and<br>&nbsp;&nbsp;&nbsp;others t=
hat it would be best to have the docs under a CC license. I do<br>&nbsp;&nbs=
p;&nbsp;expect that we'll end up copy/pasting snippets of in-code comments i=
nto<br>&nbsp;&nbsp;&nbsp;the docs, so I think it is important that we are al=
lowed to do that from<br>&nbsp;&nbsp;&nbsp;a license perspective. It is grea=
t that GPLv2 allows it (we need to be<br>&nbsp;&nbsp;&nbsp;sure about this).=
<br><br>The GPL does *not* allow this, but (c) law and fair use clauses do. S=
o typically<br>stuff such as<br>* Referring to function names, signatures, e=
tc. tend to be all fine<br>* Copying large portions of in-line comments woul=
d not be fine, but<br>If they are large, they would in most cases be re-writ=
ten in a more suitable<br>language.&nbsp;<br><br>So, I think overall, we sho=
uld be fine. It's a bit of a grey area though.<br><br>And as you point out b=
elow, most of the code in question is typically BSD&nbsp;<br><br>&nbsp;&nbsp=
;&nbsp;Yes, I expect that some docs might be automatically generated, but fr=
om<br>&nbsp;&nbsp;&nbsp;header files, not from source code. Especailly publi=
c/ header files,<br>&nbsp;&nbsp;&nbsp;which are typically BSD, not GPLv2. I c=
annot come up with examples of<br>&nbsp;&nbsp;&nbsp;docs we need to generate=
d from GPLv2-only code at the moment, hopefully<br>&nbsp;&nbsp;&nbsp;there w=
on't be any.<br><br>That makes things a lot easier. &nbsp;&nbsp;&nbsp;<br><b=
r><blockquote type=3D"cite">&nbsp;&nbsp;&nbsp;I wasn't planning on reusing a=
ny of the markup, and wasn't expecting to<br></blockquote><blockquote type=3D=
"cite">&nbsp;&nbsp;&nbsp;use much of the text either. &nbsp;I'm still consid=
ering the option of<br></blockquote><blockquote type=3D"cite">&nbsp;&nbsp;&n=
bsp;defining that xen/public/* isn't the canonical description of the ABI,<b=
r></blockquote><blockquote type=3D"cite">&nbsp;&nbsp;&nbsp;because C is the w=
rong tool for the job.<br></blockquote><blockquote type=3D"cite"><br></block=
quote><blockquote type=3D"cite">&nbsp;&nbsp;&nbsp;Its fine to provide a C se=
t of headers implementing an ABI, but there is<br></blockquote><blockquote t=
ype=3D"cite">&nbsp;&nbsp;&nbsp;a very deliberate reason why the canonical mi=
gration v2 spec is in a<br></blockquote><blockquote type=3D"cite">&nbsp;&nbs=
p;&nbsp;text document.<br></blockquote><blockquote type=3D"cite"><br></block=
quote><blockquote type=3D"cite">@Stefano: as you and I believe Brian will be=
 spending time on improving the<br></blockquote><blockquote type=3D"cite">AB=
I docs, I think we need to build some agreement here on what/how<br></blockq=
uote><blockquote type=3D"cite">to do it. I was assuming that generally the c=
onsensus was to have<br></blockquote><blockquote type=3D"cite">docs close to=
 the code in source, but this does not seem to be the case.<br></blockquote>=
<blockquote type=3D"cite"><br></blockquote><blockquote type=3D"cite">But if w=
e do have stuff separately, ideally we would have a tool that helps<br></blo=
ckquote><blockquote type=3D"cite">point people editing headers to also look a=
t the relevant docs. Otherwise it will<br></blockquote><blockquote type=3D"c=
ite">be hard to keep them in sync.<br></blockquote><br>&nbsp;&nbsp;&nbsp;In g=
eneral, it is a good idea to keep the docs close to the code to make<br>&nbs=
p;&nbsp;&nbsp;it easier to keep them up to date. But there is no one-size-fi=
ts-all<br>&nbsp;&nbsp;&nbsp;here. For public ABI descriptions, I agree with A=
ndrew that ideally they<br>&nbsp;&nbsp;&nbsp;should not be defined as C head=
er files.<br><br>&nbsp;&nbsp;&nbsp;But it is not an issue: any work that we d=
o here won't be wasted. For<br>&nbsp;&nbsp;&nbsp;instance, we could start by=
 adding more comments to the current header<br>&nbsp;&nbsp;&nbsp;files. Then=
, as a second step, take all the comments and turn them into<br>&nbsp;&nbsp;=
&nbsp;a proper ABI description document without any C function declarations.=
<br>&nbsp;&nbsp;&nbsp;It is easy to move English text around, as long as the=
 license allows it<br>&nbsp;&nbsp;&nbsp;-- that is the only potential blocke=
r I can see.<br><br>This is likely to be problematic. First of all, we are t=
alking about BSD-3-Clause<br>or BSD-2-Clause code (the latter is more domina=
nt in headers I believe) in<br>all known cases.<br><br>The main properties o=
f the BSD are<br>1: Can be pretty much used anywhere for any purpose<br>2: C=
an be modified for any purpose&nbsp;<br>3: But the original license header m=
ust be retained in derivates<br></div></blockquote><div style=3D"font-family=
: UICTFontTextStyleTallBody;"><br></div><div style=3D"font-family: UICTFontT=
extStyleTallBody;">This is equivalent to attribution of the copyright owner o=
f the originally created file.</div><br style=3D"font-family: UICTFontTextSt=
yleTallBody;"><blockquote type=3D"cite" style=3D"font-family: UICTFontTextSt=
yleTallBody;"><div dir=3D"ltr">Does *not* have requirements around attributi=
on as CC-BY-4: however,<br>as we store everything in git attribution is hand=
led by us by default<br></div></blockquote><div style=3D"font-family: UICTFo=
ntTextStyleTallBody;"><br></div><div style=3D"font-family: UICTFontTextStyle=
TallBody;">See above, the license header attributes copyright, since BSD was=
 created for "software" and people who work on "software" would typically be=
 looking at source code, hence the primary attribution takes place there, wi=
th secondary attribution in EULAs, "About" panels, etc.</div><br style=3D"fo=
nt-family: UICTFontTextStyleTallBody;"><blockquote type=3D"cite" style=3D"fo=
nt-family: UICTFontTextStyleTallBody;"><div dir=3D"ltr">CC-BY-4 also has pro=
perties 1-3<br>In addition: it does require that&nbsp;<br>4: Derived works a=
re giving appropriate credit to authors&nbsp;<br>&nbsp;&nbsp;&nbsp;We could c=
larify in a COPYING how we prefer to do this<br>&nbsp;&nbsp;&nbsp;4.1: We co=
uld say that "referring to the Xen Project community"&nbsp;<br>&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;is sufficient to comply=
 with the attribution clause<br></div></blockquote><div style=3D"font-family=
: UICTFontTextStyleTallBody;"><br></div><div style=3D"font-family: UICTFontT=
extStyleTallBody;">One motivation for CC-BY (with attribution) is to create a=
n incentive (credit) for the creation of documentation, which is not commonl=
y a favorite pastime of developers. &nbsp; Credit typically goes at least to=
 the original author of a section of documentation, with varying ways of cre=
diting subsequent contributors. &nbsp;The documentation can be structured to=
 make crediting easier. &nbsp;The mechanism for crediting can be designed to=
 encourage specific outcomes, along our projected doc lifecycle for safety c=
ertification, contributors, evaluators and commercial investors.</div><br st=
yle=3D"font-family: UICTFontTextStyleTallBody;"><blockquote type=3D"cite" st=
yle=3D"font-family: UICTFontTextStyleTallBody;"><div dir=3D"ltr">&nbsp;&nbsp=
;&nbsp;4.2: We could require individual authors to be credited: in that<br>&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case we pro=
bably ought to lead by example and list the authors<br>&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;in a credit/license section and=
 extract the information from<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;git logs when we generate it (at some point in the fu=
ture)<br>5: You give an indication whether you made changes ... in practice<=
br>this means you have to state significant changes made to the works<br></d=
iv></blockquote><div style=3D"font-family: UICTFontTextStyleTallBody;"><br><=
/div><div style=3D"font-family: UICTFontTextStyleTallBody;">This is also hel=
pful for provenance of changes, which is relevant in safety-oriented documen=
tation. &nbsp;It can be used to clearly delineate CC-licensed content (which=
 may be reused by many companies) from "All Rights Reserved" commercial cont=
ent that may be added for a specific commercial audience or purpose.</div><d=
iv style=3D"font-family: UICTFontTextStyleTallBody;"><br></div><div style=3D=
"font-family: UICTFontTextStyleTallBody;">There is a difference between "sof=
tware" which "runs on machines" and "documentation" which "runs on humans". &=
nbsp;Combined software (e.g. BSD code from two origins) is executed identica=
lly, despite origin. &nbsp;Humans make value judgements based on the author/=
origin of content, hence the focus on attribution. &nbsp;Yes, there is a pro=
venance graph in git (software/data), but that's not typically visible to hu=
man readers, except as a generated report, i.e. documentation.</div><br styl=
e=3D"font-family: UICTFontTextStyleTallBody;"><blockquote type=3D"cite" styl=
e=3D"font-family: UICTFontTextStyleTallBody;"><div dir=3D"ltr">As such, BSD-=
2/3-Clause in our context works similarly to CC-BY-4<br>from a downstream's p=
erspective. In fact CC-BY-4 is somewhat stricter<br></div></blockquote><div s=
tyle=3D"font-family: UICTFontTextStyleTallBody;"><br></div><div style=3D"fon=
t-family: UICTFontTextStyleTallBody;">If we don't want the incentives and pr=
ovenance properties of CC-BY, there is the option of CC0, which is the equiv=
alent of public domain. &nbsp;This would delegate the task of separating com=
mercial vs CC content to each reader, without any license-required attributi=
on or separation.</div><div style=3D"font-family: UICTFontTextStyleTallBody;=
"><br></div><div style=3D"font-family: UICTFontTextStyleTallBody;">Some back=
ground on licenses designed for documentation, which has different legal req=
uirements than software:</div><div style=3D"font-family: UICTFontTextStyleTa=
llBody;"><br></div><div style=3D"font-family: UICTFontTextStyleTallBody;"><a=
 href=3D"https://www.dreamsongs.com/IHE/IHE-50.html">https://www.dreamsongs.=
com/IHE/IHE-50.html</a></div><div style=3D"font-family: UICTFontTextStyleTal=
lBody;"><a href=3D"https://creativecommons.org/faq/#what-are-creative-common=
s-licenses">https://creativecommons.org/faq/#what-are-creative-commons-licen=
ses</a>&nbsp;(not for s/w)</div><div style=3D"font-family: UICTFontTextStyle=
TallBody;"><br></div><div style=3D"font-family: UICTFontTextStyleTallBody;">=
Rich</div></div></body></html>=

--Apple-Mail-D148CF3B-F44D-4011-A57F-9B2CC4F71EE9--


--===============2968947029518535433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2968947029518535433==--

