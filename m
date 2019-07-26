Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A417661A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:45:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzYD-0001UV-Kk; Fri, 26 Jul 2019 12:42:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxDH=VX=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hqzYB-0001UK-Vj
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:42:20 +0000
X-Inumbo-ID: ccf77ed6-afa2-11e9-8980-bc764e045a96
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ccf77ed6-afa2-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:42:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id f17so47559354wme.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=BBeXhhWWdtCiT/zh6IMeNWC5ux7yEYvgjLD6Jahkr0w=;
 b=QuHMq/SJbwU3wvx/EtszeGfvxeJD0IF+V36ZKEljrNJKwCgu12qAPs1nKC6RF5uOJz
 gT23waLJFSghL52caKuiqa6HZDGQvz14TRaA7dqOmv2Cujhm9QHmtHxZtOLvM7miApCQ
 oknls2tIrZ1UGpyPMfpAEgBeO+RnuAt+oY+fIzJC3jMelR4q+7w8BLLLoHCICQAmtyxY
 kSp34SPCPDUGSin2Bfi5SYNZl6/M4hD3EFOR8pCfZhLzo0x8S/A3kuipdXGe21laOp+3
 2U0HLnhppN8m6N7+WN//UKJLhL9VH1OJkbsTVOWGWgAk8D6CKeXSpS2ai0ZKcdRF5yM1
 cOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=BBeXhhWWdtCiT/zh6IMeNWC5ux7yEYvgjLD6Jahkr0w=;
 b=e6A8xG7Vurbf1fUHV19cZxgzxx08iB+qGuSOHIBuwepTOCejz0jqDjwNv8gQxQZihi
 gzaDU8bVVnvQwP1Tj3aIunU+TSMRKVaBefwYLOmTmtcIpjyn+HqvMy2xQfu5z8UMb/5H
 6GvbGsBNmkV+B6Rw3lZyhzU1N2D+bxqGqxP9dmgTbII3sNrNaXkmzvuPotsfP5TBhiQ7
 5ZHjGVY9o8i1ZOSBYSxsgD70j+JrpHGxBYQZi+J3MLZmuILE1QhtiWCZJtzqNrAwyHgr
 kMpyC3riOw7qTYa1pZtd4J0F0uU007eWNGk6Lk4jFimvoBac+C41N9YiuH246qIbtxkL
 z52w==
X-Gm-Message-State: APjAAAWIUxl6X37gJkhgBWHYks2+bDvPSbjxVVmQksoPpX3iF7DaM+eK
 TOU1sTBJzoYIazC9lceE11A=
X-Google-Smtp-Source: APXvYqzKS4qJjUbtzlo8CkiCwE0KyS8E/bCgEMzTlQMK9fyvgZEWzF/oTzR+Hw3uJswQVLrKu2kHvw==
X-Received: by 2002:a1c:a6d3:: with SMTP id p202mr87149465wme.26.1564144935757; 
 Fri, 26 Jul 2019 05:42:15 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:1d44:aeab:d929:303?
 ([2a02:c7f:ac18:da00:1d44:aeab:d929:303])
 by smtp.gmail.com with ESMTPSA id q18sm62800418wrw.36.2019.07.26.05.42.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 05:42:15 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Fri, 26 Jul 2019 13:42:13 +0100
In-Reply-To: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] Xen Coding style and clang-format
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Committers <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: multipart/mixed; boundary="===============1662302336456006072=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1662302336456006072==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A654EEF1-CC2E-4450-9E17-A421CBFE49E9"


--Apple-Mail=_A654EEF1-CC2E-4450-9E17-A421CBFE49E9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 26 Jul 2019, at 13:30, Viktor Mitin <viktor.mitin.19@gmail.com> =
wrote:
>=20
> Hi All,
>=20
> The Xen Project has a coding standard in place, but like many
> projects, the standard is only enforced through peer review. Such
> mistakes slip through and code is imported from other projects which
> may not follow the same standard. The goal would be to come up with a
> tool that can audit the code base as part of a CI loop for code style
> inconsistencies and potentially provide corrections. This tool is to
> embed as a part of the continuous integration loop. For clarity, =
let=E2=80=99s
> call such a tool as =E2=80=98Xen checkpatch tool=E2=80=99.
>=20
> References for those who are interested in the background are in [5].
>=20
> The idea of the new tool is to use the clang-format approach as a base
> for Xen =E2=80=98checkpatch=E2=80=99 process. The new tool consists of =
modified
> clang-format binary and modified clang-format-diff.py python script to
> automate Xen patches format checking and reformatting. The tool can be
> used as a pre-commit hook to check and format every patch
> automatically. See the tool code under [1].
>=20
> Known limitations:
>=20
> Xen coding style
> Xen coding style is defined in two 'CODING_STYLE' documents in Xen
> code: Xen common coding style and Xen libxl coding style. The
> documents describe some of the coding style rules. However, there is
> no information about =E2=80=98base=E2=80=99 coding style used (i.e. =
K&R, Linux, LLVM,
> Google, Chromium, Mozilla, WebKit=E2=80=A6). For this reason, it is =
unclear
> how to deal with some of the coding style rules not described in the
> Xen coding style documents. See examples of the tool output under [2].
>=20
> Clang-format
> Generally, the design of clang-format is to only make formatting
> changes, not adding or removing tokens (there are some exceptions to
> this, like wrapping string literals). It means that clang-format can't
> add or remove braces or change the style of the comments from C89 to
> C++. Tool clang-tidy can make syntactic changes to the code. However,
> unfortunately, clang-tidy is a heavyweight tool as it needs the
> compile options to parse the file (See [3] and [4])
>=20
> This can be clang generic limitation, e.g. we might want to add a
> possibility to clang to alter the code, e.g. adding braces,
> characters, etc". The concern here is that it seems it is against main
> clang-format design principles, so those changes will not be
> integrated into clang-format mainstream. It should be checked with
> clang-format community first.
>=20
> As an option, to overcome the limitations of clang-format tool in the
> case of Xen coding style, it is possible to move some Xen code format
> logic to the modified clang-format-diff.py tool.
>=20
> Summary
> To sum up, it is possible to automate Xen patches format checking and
> corrections with some known clang-format limitations. Ideally, it
> would be good to slowly migrate the entire code-base to be conforming,
> thus eliminating the need for discussing and enforcing style issues
> manually on the mailing list. The =E2=80=98Xen checkpatch tool=E2=80=99 =
provides the
> closest approximation of the established Xen style (including styles
> not formally spelled out by CODING_STYLE, but commonly requested).
> The tool can be used as-is at the moment and improved later in case of
> necessity.
>=20
> The tool allows achieving automation of Xen patches format checking
> and corrections with some known clang-format limitations (see below).
> All the xen/*.c files have been tested with it.
> See the results of the tool output under [2].
>=20
> Summary of the changes:
> - Added 3 new formatting styles to cover all the cases mentioned in
> Xen coding style document: Xen, Libxl, Linux;
> - Added list of the files and corresponding style name mappings;
> - Added indentation according to Xen coding style;
> - Added white space formatting according to Xen coding style;
> - Added bracing support exception for do/while loops;
>=20
> Added to clang-format, however, probably this logic should be moved to
> python part (see known clang-format limitations above):
> - Braces should be omitted for blocks with a single statement. Note:
> these braces will be required by MISRA, for example, so it is probably
> worth adding such a requirement to the coding style.
> - Comments format requirements. Note: //-style comments are defined in
> C99 as well, and not just in the case of C++. C99 standard is 20-years
> old=E2=80=A6
>=20
> To be added:
> - Emacs local variables. Open points: Why to keep emacs local
> variables in Xen code? What about other editors' comments (vim)?
> - Warning to stderr in the case when =E2=80=98unfixable=E2=80=99 =
line/s detected.
>=20
> To be fixed:
> - Max line length from 80 to 79 chars;
> - Disable // comments;
>=20
>=20
> The links:
> [1] =
https://github.com/xen-troops/Xen-Clang-format/blob/devel/clang-format.pat=
ch
> [2] =
https://raw.githubusercontent.com/viktor-mitin/xen-clang-format-example/ma=
ster/0001-clang-format-checkpatch-output-example.patch
> [3] https://developer.blender.org/T53211
> [4] =
http://clang-developers.42468.n3.nabble.com/clang-format-add-around-statem=
ent-after-if-while-for-td4049620.html
>=20
> [5]
> Project status:
> =
https://docs.google.com/document/d/10NJn-QvO1TvyJJJGE2PD6FtElYCT3neBAffIqe=
WHdiE/edit =
<https://docs.google.com/document/d/10NJn-QvO1TvyJJJGE2PD6FtElYCT3neBAffIq=
eWHdiE/edit>
This seems to be an old outreachy document

> =
https://docs.google.com/document/d/1tCcwZ9K38ToLGTPHZkfs2sS4s4YulrGoH8LIHw=
BMbg4/edit =
<https://docs.google.com/document/d/1tCcwZ9K38ToLGTPHZkfs2sS4s4YulrGoH8LIH=
wBMbg4/edit>

I suppose this is the project status?

> Mailing list discussions:
> =
https://lists.xenproject.org/archives/html/xen-devel/2016-09/msg02848.html=

> =
https://lists.xenproject.org/archives/html/xen-devel/2017-04/msg00131.html=

> =
https://lists.xenproject.org/archives/html/xen-devel/2017-04/msg01739.html=

>=20
> Original implementation on GitHub:
> https://github.com/sam5125/Xen-Clang-format =
<https://github.com/sam5125/Xen-Clang-format>

Hi Viktor,

thank you for putting this mail together and driving this forward. I =
added committers@ as well as Doug. I am going to let others respond =
first.=20
I am assuming we are looking for some testing?

Is there a simple set of instructions to get started and test the tool?

Regards
Lars



--Apple-Mail=_A654EEF1-CC2E-4450-9E17-A421CBFE49E9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 26 Jul 2019, at 13:30, Viktor Mitin &lt;<a =
href=3D"mailto:viktor.mitin.19@gmail.com" =
class=3D"">viktor.mitin.19@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hi =
All,<br class=3D""><br class=3D"">The Xen Project has a coding standard =
in place, but like many<br class=3D"">projects, the standard is only =
enforced through peer review. Such<br class=3D"">mistakes slip through =
and code is imported from other projects which<br class=3D"">may not =
follow the same standard. The goal would be to come up with a<br =
class=3D"">tool that can audit the code base as part of a CI loop for =
code style<br class=3D"">inconsistencies and potentially provide =
corrections. This tool is to<br class=3D"">embed as a part of the =
continuous integration loop. For clarity, let=E2=80=99s<br class=3D"">call=
 such a tool as =E2=80=98Xen checkpatch tool=E2=80=99.<br class=3D""><br =
class=3D"">References for those who are interested in the background are =
in [5].<br class=3D""><br class=3D"">The idea of the new tool is to use =
the clang-format approach as a base<br class=3D"">for Xen =
=E2=80=98checkpatch=E2=80=99 process. The new tool consists of =
modified<br class=3D"">clang-format binary and modified =
clang-format-diff.py python script to<br class=3D"">automate Xen patches =
format checking and reformatting. The tool can be<br class=3D"">used as =
a pre-commit hook to check and format every patch<br =
class=3D"">automatically. See the tool code under [1].<br class=3D""><br =
class=3D"">Known limitations:<br class=3D""><br class=3D"">Xen coding =
style<br class=3D"">Xen coding style is defined in two 'CODING_STYLE' =
documents in Xen<br class=3D"">code: Xen common coding style and Xen =
libxl coding style. The<br class=3D"">documents describe some of the =
coding style rules. However, there is<br class=3D"">no information about =
=E2=80=98base=E2=80=99 coding style used (i.e. K&amp;R, Linux, LLVM,<br =
class=3D"">Google, Chromium, Mozilla, WebKit=E2=80=A6). For this reason, =
it is unclear<br class=3D"">how to deal with some of the coding style =
rules not described in the<br class=3D"">Xen coding style documents. See =
examples of the tool output under [2].<br class=3D""><br =
class=3D"">Clang-format<br class=3D"">Generally, the design of =
clang-format is to only make formatting<br class=3D"">changes, not =
adding or removing tokens (there are some exceptions to<br =
class=3D"">this, like wrapping string literals). It means that =
clang-format can't<br class=3D"">add or remove braces or change the =
style of the comments from C89 to<br class=3D"">C++. Tool clang-tidy can =
make syntactic changes to the code. However,<br class=3D"">unfortunately, =
clang-tidy is a heavyweight tool as it needs the<br class=3D"">compile =
options to parse the file (See [3] and [4])<br class=3D""><br =
class=3D"">This can be clang generic limitation, e.g. we might want to =
add a<br class=3D"">possibility to clang to alter the code, e.g. adding =
braces,<br class=3D"">characters, etc". The concern here is that it =
seems it is against main<br class=3D"">clang-format design principles, =
so those changes will not be<br class=3D"">integrated into clang-format =
mainstream. It should be checked with<br class=3D"">clang-format =
community first.<br class=3D""><br class=3D"">As an option, to overcome =
the limitations of clang-format tool in the<br class=3D"">case of Xen =
coding style, it is possible to move some Xen code format<br =
class=3D"">logic to the modified clang-format-diff.py tool.<br =
class=3D""><br class=3D"">Summary<br class=3D"">To sum up, it is =
possible to automate Xen patches format checking and<br =
class=3D"">corrections with some known clang-format limitations. =
Ideally, it<br class=3D"">would be good to slowly migrate the entire =
code-base to be conforming,<br class=3D"">thus eliminating the need for =
discussing and enforcing style issues<br class=3D"">manually on the =
mailing list. The =E2=80=98Xen checkpatch tool=E2=80=99 provides the<br =
class=3D"">closest approximation of the established Xen style (including =
styles<br class=3D"">not formally spelled out by CODING_STYLE, but =
commonly requested).<br class=3D"">The tool can be used as-is at the =
moment and improved later in case of<br class=3D"">necessity.<br =
class=3D""><br class=3D"">The tool allows achieving automation of Xen =
patches format checking<br class=3D"">and corrections with some known =
clang-format limitations (see below).<br class=3D"">All the xen/*.c =
files have been tested with it.<br class=3D"">See the results of the =
tool output under [2].<br class=3D""><br class=3D"">Summary of the =
changes:<br class=3D"">- Added 3 new formatting styles to cover all the =
cases mentioned in<br class=3D"">Xen coding style document: Xen, Libxl, =
Linux;<br class=3D"">- Added list of the files and corresponding style =
name mappings;<br class=3D"">- Added indentation according to Xen coding =
style;<br class=3D"">- Added white space formatting according to Xen =
coding style;<br class=3D"">- Added bracing support exception for =
do/while loops;<br class=3D""><br class=3D"">Added to clang-format, =
however, probably this logic should be moved to<br class=3D"">python =
part (see known clang-format limitations above):<br class=3D"">- Braces =
should be omitted for blocks with a single statement. Note:<br =
class=3D"">these braces will be required by MISRA, for example, so it is =
probably<br class=3D"">worth adding such a requirement to the coding =
style.<br class=3D"">- Comments format requirements. Note: //-style =
comments are defined in<br class=3D"">C99 as well, and not just in the =
case of C++. C99 standard is 20-years<br class=3D"">old=E2=80=A6<br =
class=3D""><br class=3D"">To be added:<br class=3D"">- Emacs local =
variables. Open points: Why to keep emacs local<br class=3D"">variables =
in Xen code? What about other editors' comments (vim)?<br class=3D"">- =
Warning to stderr in the case when =E2=80=98unfixable=E2=80=99 line/s =
detected.<br class=3D""><br class=3D"">To be fixed:<br class=3D"">- Max =
line length from 80 to 79 chars;<br class=3D"">- Disable // comments;<br =
class=3D""><br class=3D""><br class=3D"">The links:<br class=3D"">[1] <a =
href=3D"https://github.com/xen-troops/Xen-Clang-format/blob/devel/clang-fo=
rmat.patch" =
class=3D"">https://github.com/xen-troops/Xen-Clang-format/blob/devel/clang=
-format.patch</a><br class=3D"">[2] <a =
href=3D"https://raw.githubusercontent.com/viktor-mitin/xen-clang-format-ex=
ample/master/0001-clang-format-checkpatch-output-example.patch" =
class=3D"">https://raw.githubusercontent.com/viktor-mitin/xen-clang-format=
-example/master/0001-clang-format-checkpatch-output-example.patch</a><br =
class=3D"">[3] <a href=3D"https://developer.blender.org/T53211" =
class=3D"">https://developer.blender.org/T53211</a><br class=3D"">[4] <a =
href=3D"http://clang-developers.42468.n3.nabble.com/clang-format-add-aroun=
d-statement-after-if-while-for-td4049620.html" =
class=3D"">http://clang-developers.42468.n3.nabble.com/clang-format-add-ar=
ound-statement-after-if-while-for-td4049620.html</a><br class=3D""><br =
class=3D"">[5]<br class=3D"">Project status:<br class=3D""><a =
href=3D"https://docs.google.com/document/d/10NJn-QvO1TvyJJJGE2PD6FtElYCT3n=
eBAffIqeWHdiE/edit" =
class=3D"">https://docs.google.com/document/d/10NJn-QvO1TvyJJJGE2PD6FtElYC=
T3neBAffIqeWHdiE/edit</a></div></div></blockquote><div><br =
class=3D""></div>This seems to be an old outreachy document<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div class=3D""><a =
href=3D"https://docs.google.com/document/d/1tCcwZ9K38ToLGTPHZkfs2sS4s4Yulr=
GoH8LIHwBMbg4/edit" =
class=3D"">https://docs.google.com/document/d/1tCcwZ9K38ToLGTPHZkfs2sS4s4Y=
ulrGoH8LIHwBMbg4/edit</a><br class=3D""></div></div></blockquote><div><br =
class=3D""></div>I suppose this is the project status?</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D"">Mailing list discussions:<br class=3D""><a =
href=3D"https://lists.xenproject.org/archives/html/xen-devel/2016-09/msg02=
848.html" =
class=3D"">https://lists.xenproject.org/archives/html/xen-devel/2016-09/ms=
g02848.html</a><br =
class=3D"">https://lists.xenproject.org/archives/html/xen-devel/2017-04/ms=
g00131.html<br =
class=3D"">https://lists.xenproject.org/archives/html/xen-devel/2017-04/ms=
g01739.html<br class=3D""><br class=3D"">Original implementation on =
GitHub:<br class=3D""><a =
href=3D"https://github.com/sam5125/Xen-Clang-format" =
class=3D"">https://github.com/sam5125/Xen-Clang-format</a><br =
class=3D""></div></div></blockquote><br class=3D""></div><div>Hi =
Viktor,</div><div><br class=3D""></div><div>thank you for putting this =
mail together and driving this forward. I added committers@ as well as =
Doug. I am going to let others respond first.&nbsp;</div><div>I am =
assuming we are looking for some testing?</div><div><br =
class=3D""></div><div>Is there a simple set of instructions to get =
started and test the tool?</div><div><br =
class=3D""></div><div>Regards</div><div>Lars</div><div><br =
class=3D""></div><div><br class=3D""></div></body></html>=

--Apple-Mail=_A654EEF1-CC2E-4450-9E17-A421CBFE49E9--


--===============1662302336456006072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1662302336456006072==--

