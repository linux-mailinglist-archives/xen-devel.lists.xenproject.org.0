Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DF9117104
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 17:02:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieLR3-0008Ul-Pl; Mon, 09 Dec 2019 15:58:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gN7q=Z7=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1ieLR2-0008Ug-HL
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 15:58:56 +0000
X-Inumbo-ID: c4fc5c12-1a9c-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4fc5c12-1a9c-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 15:58:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f129so15538162wmf.2;
 Mon, 09 Dec 2019 07:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=LEuoM7nnt1N9Lh3gamW0moyVXB37WDZYFE/ywR0vLcs=;
 b=NkN3aTvvgEh0Y00tu9B+LXkYt7ISEBtWoIENfPGUO2GrGxuKj5meMr/9RDNnwZFvYn
 7CMI+UeZZyTQtrY7j1CAvhuAjv/G8yg7wPCsn0dkAMFUSb7TJqUdpE5A2nZbsgSqrfIJ
 lsMq7nSmNsS4FBHE0NPOa5LODZPaBPfK9G7hDYtlKpu2AzXzZoM987Lpfvyz41B+RmoD
 WjsNMRy4XJNTSOdZIF/DliLUv0cBjUb8gFkrt0bzSkKLCm+bXNPk36iz47OE8rj1c7QD
 onNOc1/c66OAeGKPssmBPP5Bjr9801awPTBshDX8DMNKRAYohBkcxPr/Jo9QMRVLYQlN
 /7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=LEuoM7nnt1N9Lh3gamW0moyVXB37WDZYFE/ywR0vLcs=;
 b=hlavfCN5m1QW2rv/zpFcQbNNGmIWawSLVTB7lCSK7j54YmxJZPuKoEN4cSPO+2gzLH
 1yT0ce+T+lg5iWMKZoPg6eYBO+6AmTZLGF9FEgbHq7FEANfQgj8fD3E8aNcMOQP0Obg+
 97t6OCytcQtePaN6sPaV0yrUbdNx9X3yacRE6PZWm2bCnyeqyAhYK4KLXOKwmcyJYdI3
 kPPdTckim/GbG9sOwrvBmUDw1qXXN6YsKvbXjl0bcHi3SZhMrEa7gPjGENcbaEOoW3NL
 ODnlz3WB9D82WejGe9KHBjQU/wF4a31dZrPGpfpGRpwdYcENNrv6z2k/+fPUUPD9712g
 b/Dw==
X-Gm-Message-State: APjAAAW3f0oRmJ2ogXSUaUx79sdlnNXytDK91YIPK5kNRzIo8o3hekyf
 V0RhIQOlLWYZUxaT1VvgRCY=
X-Google-Smtp-Source: APXvYqwOG7Ko5tSjikioPUkz6Dh8/vxmWjCJjgSF/eGDrLbQvZ2CAGrVpwdItGQkjFog3gM9DM0gfA==
X-Received: by 2002:a1c:6456:: with SMTP id y83mr26025587wmb.48.1575907119867; 
 Mon, 09 Dec 2019 07:58:39 -0800 (PST)
Received: from ?IPv6:2a02:c7f:ac18:da00:ed1d:96bc:504f:4472?
 ([2a02:c7f:ac18:da00:ed1d:96bc:504f:4472])
 by smtp.gmail.com with ESMTPSA id z6sm29228987wrw.36.2019.12.09.07.58.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Dec 2019 07:58:39 -0800 (PST)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Message-Id: <D7D92602-99D6-4530-8915-0A4C037A505D@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Mon, 9 Dec 2019 15:58:38 +0000
In-Reply-To: <001E0CF6-AD75-4A97-948D-C8240F9D5145@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
References: <BE78F496-8B9C-490F-A500-204E3305C950@citrix.com>
 <6DC58DC2-5F2F-4496-A0F5-A91F11FD931B@gmail.com>
 <FDC64A08-D894-44CB-9244-9752D0FD17CD@citrix.com>
 <97079765-88F1-4F0C-95B1-B729B4AA93AA@citrix.com>
 <da6ab25f-6996-703e-66d1-11757136da11@suse.com>
 <001E0CF6-AD75-4A97-948D-C8240F9D5145@citrix.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
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
 "mirageos-devel@lists.xenproject.org"
 <mirageos-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 Rich Persaud <persaur@gmail.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 'Jan Beulich' <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============2257197914275255408=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2257197914275255408==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_086483F7-9100-4156-A917-C1AC5ED6F3D3"


--Apple-Mail=_086483F7-9100-4156-A917-C1AC5ED6F3D3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 9 Dec 2019, at 11:02, Lars Kurth <lars.kurth@citrix.com> wrote:
>=20
>=20
>=20
> =EF=BB=BFOn 06/12/2019, 09:51, "Jan Beulich" <jbeulich@suse.com =
<mailto:jbeulich@suse.com>> wrote:
>=20
>    On 06.12.2019 00:41, Lars Kurth wrote:
>> I propose to add the following section to code-review-guide.md
>>=20
>> ----
>> ## <a name=3D"problems"></a>Problematic Patch Reviews
>>=20
>> A typical waterfall software development process is sequential with =
the following=20
>> steps: define requirements, analyse, design, code, test and deploy. =
Problems=20
>> uncovered by code review or testing at such a late stage can cause =
costly redesign=20
>> and delays. The principle of **[Shift =
Left](https://devopedia.org/shift-left)** is to take a=20
>> task that is traditionally performed at a late stage in the process =
and perform that task=20
>> at earlier stages. The goal is to save time by avoiding refactoring.
>>=20
>> Typically, problematic patch reviews uncover issues such as wrong or =
missed=20
>> assumptions, a problematic architecture or design, or other bugs that =
require=20
>> significant re-implementation of a patch series to fix the issue.
>>=20
>> The principle of **Shift Left** also applies in code reviews. Let's =
assume a series has
>> a major flaw: ideally, this flaw would be picked up in the **first or =
second iteration** of=20
>> the code review. As significant parts of the code may have to be =
re-written, it does not=20
>> make sense for reviewers to highlight minor issues (such as style =
issues) until major=20
>> flaws have been addressed. By providing feedback on minor issues =
reviewers cause=20
>> the code author and themselves extra work by asking for changes to =
code, which=20
>> ultimately may be changed later.
>>=20
>> The question then becomes, how do code reviewers identify major =
issues early?=20
>> ----
>> This is where I really need help. Are there any tips and =
recommendations that we could give?
>> I can clearly highlight that we have RFC series, but in practice that =
does not solve the problem as RFCs don=E2=80=99t get prioritized
>> How do reviewers normally approach a series: do you a) take a big =
picture view first, or b) do most of you work through a series =
sequentially
>=20
>    Afaic - depends heavily on the patch / series. I wouldn't typically
>    peek ahead in a series, but it has happened. But as you say
>    (elsewhere) the cover letter should put in place the "big picture".
>    A series should generally be reviewable going from patch to patch,
>    having the cover letter in mind.
>=20
> I am wondering what others do.=20
>=20
> I think explaining the basic work-flow from the viewpoint of a =
reviewer and code author maybe in a separate section, which is not tied =
to the problem case would make sense. More input from other maintainers =
would be valuable. My gut-feel is that most reviewers "read and review" =
series sequentially, which has implications for the author. E.g.
> - docs/design docs should be at the beginning of a series
> - key header files or changes to them should be at the beginning of a =
series
> - Etc
>=20
>> I then propose to change the following section in =
communication-practice.md
>> ----
>> ### Prioritize significant flaws
>> If a patch or patch series has significant flaws, such as
>> * It is built on wrong assumptions
>> * There are issues with the architecture or the design
>=20
>    In such a case a full review of course doesn't make much sense. But
>    this is far from the typical situation. Way more often you have =
some
>    _part_ of a patch or series which has a bigger issue, but other
>    parts are in need of no or just minor changes.
>=20
> I know that this is an unusual situation. But it has happened in =
clusters frequently in the past.
>=20
> I am wondering whether we should introduce some informal convention to =
mark _part_ of a series as problematic. A simple example of how to do =
this in the cover letter would do
>=20
>> it does not make sense to do a detailed code review. In such cases, =
it is best to
>> focus on the major issues first and deal with style and minor issues =
in a subsequent
>> review. Not all series have significant flaws, but most series have =
different classes of=20
>> changes that are required for acceptance: covering a range of major =
code=20
>> modifications to minor code style fixes. To avoid misunderstandings =
between=20
>> reviewers and contributors, it is important to establish and agree =
whether a series or=20
>> part of a series has a significant flaw and agree a course of action.=20=

>>=20
>> A pragmatic approach would be to
>> * Highlight problematic portions of a series in the cover letter=20
>> * For the patch author and reviewer(s) to agree that for problematic =
to omit style and
>> minor issues in the review, until the significant flaw is addressed
>>=20
>> This saves both the patch author and reviewer(s) time. Note that some =
background
>> is covered in detail in [Problematic Patch =
Reviews](resolving-disagreement.md#problems).
>=20
>    I have no issues with the suggested text in general, but I also =
don't
>    think it makes much of a difference wrt what I had mentioned =
before.
>    I guess part of the problem here is that there are things which imo
>    you can't really give recipes for how to approach, if the =
expectation
>    is that it would fit at least the vast majority of cases.=20
>=20
> I think the document covers most of the common cases, plus some areas =
which are problematic
> * =46rom a people-interaction point-of-view - in other words there =
could be unnecessary conflict, which is bad for the community but also =
wastes time
> * =46rom an efficient usage of time point-of-view
>=20
> For example: the whole thing about thanking, appreciation, ... is =
something targeted at newcomers and a desire to treat them with more =
thought and awareness.=20
> Granted it takes more time to do a review with a newcomer, but it =
should make subsequent reviews easier=20
>=20
> It happens regularly, but not that frequently
>=20
>    For code
>    reviews this means that I don't think there should be any wording
>    suggesting they should be done in a certain form; there may be =
wording
>    suggesting they _could_ be done in a certain form (e.g. to help
>    people not knowing at all how to get started).
>=20
> That was definitely my intention. Maybe I have not succeeded in making =
this clear enough

Adding the log of a very productive IRC conversation for reference. =
Sorry for the formatting
Regards
Lars

=E2=80=B9lars_kurth=E2=80=BA     It would also be good if some =
maintainers could have a look at =
https://lists.xenproject.org/archives/html/xen-devel/2019-12/threads.html#=
00348

=E2=80=B9gwd=E2=80=BA		lars_kurth: What exactly more feedback =
did you want?

=E2=80=B9lars_kurth=E2=80=BA     gwd: primarily about maintainers =
workflow. How do you approach a review. Is there anything a code author =
can do. Right now, I have one data point from Jan. I basically want to =
validate my assumptions before I send out another revision

=E2=80=B9lars_kurth=E2=80=BA     gwd: a code author can do to make your =
life easier =3D> e.g. by putting big picture stuff at the beginning of a =
series

=E2=80=B9lars_kurth=E2=80=BA     e.g by putting potentially =
controversial elements of it at the beginning, etc

=E2=80=B9lars_kurth=E2=80=BA     Obviously, this would only help if most =
reviewers approach a review sequentially, which is a reasonable =
assumption, but I am not actually 100% sure this is true

=E2=80=B9royger=E2=80=BA           lars_kurth: patch series must be =
reviewed sequentially, that's why it's numbered

=E2=80=B9gwd=E2=80=BA		lars_kurth: Actually it's often the case =
that you find uncontroversial side clean-up things in the course of =
doing a series; putting those at the beginning means they can be checked =
in independently of the whole series, which makes less work for everyone

=E2=80=B9gwd=E2=80=BA		They can be checked in after v1 or v2, =
and then 1) less work for authors to rebase, 2) less cognitive overhead =
for reviewers to see what's going on.

=E2=80=B9lars_kurth=E2=80=BA     royger: That is not a necessarily =
obvious conclusion - at least for me. But if it is true, we should =
clearly state that

=E2=80=B9lars_kurth=E2=80=BA     gwd: that's interesting. I guess there =
are differing objectives

=E2=80=B9royger=E2=80=BA           I don't think any maintainer/reviewer =
does review non-sequentially, as it would lead to extreme confusion. =
It's quite common for patches on a patch series to rely on the previous =
ones

=E2=80=B9royger=E2=80=BA           lars_kurth: I think it can be safely =
stated

=E2=80=B9lars_kurth=E2=80=BA     1) get uncontroversial / easy to do =
stuff first

=E2=80=B9lars_kurth=E2=80=BA     2) then put more complex things, but =
start with documents/headers/anything that is substantial to understand =
the rest of the changes - if they fit into logical units maybe repeat =
that pattern

=E2=80=B9gwd=E2=80=BA		I think every situation if different.

=E2=80=B9royger=E2=80=BA           the only time you can get non-ordered =
review is if your patch series touches multiple subsystems and you have =
properly splitted this into different patches, in that case each =
subsystem maintainer is likelky to review his ares without looking at =
other patches

=E2=80=B9gwd=E2=80=BA  royger: You're talking about checking in, not =
review I think?

=E2=80=B9gwd=E2=80=BA		Sometimes in a long series, {1,2}/10 =
will be clean-ups; {3-6}/10 will be general reorganisations which don't =
really seem to do anything; and then 7/10 will be the "meat", which =
helps you understand what {3-6}/10 were about.

=E2=80=B9lars_kurth=E2=80=BA     royger, gwd: "It's quite common for =
patches on a patch series to rely on the previous ones" - is an =
important point.

=E2=80=B9gwd=E2=80=BA		Usually it's not possible to put 7/10 =
earlier without making it far more complicated.

=E2=80=B9lars_kurth=E2=80=BA     I think the way how to best structure =
patch series is an important one, and there is practically NO =
information about this. So people learn stuff by trial and error. So I =
think it is worth exploring that

=E2=80=B9gwd=E2=80=BA		It's a bit like saying, "How do you =
teach someone something", or "How do you make an argument to convince =
someone of something". There are patterns, but it's so broad a topic you =
can't really give direct advice.

=E2=80=B9lars_kurth=E2=80=BA     gwd: maybe showing some examples will =
help. I think the problem is that cover letters frequently don't help =
much

=E2=80=B9Diziet=E2=80=BA 		I think what you just said above =
"Sometimes in a long series," would be a very useful thing to put in as =
a general rule.

=E2=80=B9Diziet=E2=80=BA 		gwd: ^

=E2=80=B9Diziet=E2=80=BA 		Sometimes some of these pieces =
will be empty.

=E2=80=B9Diziet=E2=80=BA 		1. cleanups 2. reorgs 3. =
headers/docs/etc. 4. meat 5. cleaning up any infelicities introduced =
temporarily 6. deleting old code

=E2=80=B9Diziet=E2=80=BA 		If there are multiple subsystems =
involved, then these are best separated out where possible, so you end =
up with those 6 categories x N subsystems.

=E2=80=B9gwd=E2=80=BA  		Of course, sometimes there are several =
"meat" patches, which could be ordered in different ways; and then you =
may want to put reorgs in between the meat patches.

=E2=80=B9gwd=E2=80=BA  		The XSA-299 series is an example of =
that.

=E2=80=B9Diziet=E2=80=BA 		In this context I am reminded of =
https://www.chiark.greenend.org.uk/pipermail/sgo-software-discuss/2019/000=
616.html My main achievement for the weekend, in a personal project.

=E2=80=B9gwd=E2=80=BA  		And lars_kurth could probably go back =
over the history and see the series develop; the "meat" patches were =
reorganized several times to try to find out which order created the =
most comprehensible series of individual patches.

=E2=80=B9Diziet=E2=80=BA 		Subject:  New signature key =
arrangements

=E2=80=B9gwd=E2=80=BA  		lars_kurth: And say, if you take a look =
at the golang xenlight bindings series; v1 would have been useless =
without the entire thing being checked in. It's likely that v3 I'll be =
able to check in {1..16}/22, meaning v4 will have a lot fewer patches to =
rebase / recheck.

=E2=80=B9Diziet=E2=80=BA 		I'm not suggesting it as an =
example in this context because I have done much less squashing than =
would be usual in a community like Xen where we have many more reviewers =
so the goal of making review easy and comprehensible is more important =
relative to the goal of later understanding what the original programmer =
was thinking when they wrote soemthing.

=E2=80=B9lars_kurth=E2=80=BA     This is very useful. I think this is =
the missing piece

=E2=80=B9Diziet=E2=80=BA 		But we should provide some =
examples. Do we have good example cover letters we could use ?

=E2=80=B9Diziet=E2=80=BA 		I'm sure there are some libxl =
ones but ideally we would have an example touching multiple subsystems. =
And one which wasn't affected by release constraints.

=E2=80=B9lars_kurth=E2=80=BA     That would be good. Maybe I can write =
something up and put a place-holder in place for good examples, if we =
can't think of one now

=E2=80=B9jbeulich=E2=80=BA         gwd, lars_kurth: The opposite case =
(cleanups last) would often be preferable for series where the "meat" =
one(s) are to be backported, but the cleanups aren't.

=E2=80=B9lars_kurth=E2=80=BA     jbeulich: interesting point. Do you =
have an example?

=E2=80=B9jbeulich=E2=80=BA         An example of what? A series where we =
asked for re-ordering because of the above? If so, I don't think I could =
easily spot one.

=E2=80=B9jbeulich=E2=80=BA         I can tell you though that the above =
is what I would typically do. Most prominently for security fixes *where =
the cleanup is being held back altogether).

=E2=80=B9lars_kurth=E2=80=BA     jbeulich: I will try and put something =
together. I think I have enough to go on

=20




--Apple-Mail=_086483F7-9100-4156-A917-C1AC5ED6F3D3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 9 Dec 2019, at 11:02, Lars Kurth &lt;<a =
href=3D"mailto:lars.kurth@citrix.com" =
class=3D"">lars.kurth@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">=EF=BB=BFOn =
06/12/2019, 09:51, "Jan Beulich" &lt;</span><a =
href=3D"mailto:jbeulich@suse.com" style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">jbeulich@suse.com</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">&gt; =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;On 06.12.2019 00:41, Lars Kurth =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">I =
propose to add the following section to code-review-guide.md<br =
class=3D""><br class=3D"">----<br class=3D"">## &lt;a =
name=3D"problems"&gt;&lt;/a&gt;Problematic Patch Reviews<br class=3D""><br=
 class=3D"">A typical waterfall software development process is =
sequential with the following<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">steps: =
define requirements, analyse, design, code, test and deploy. =
Problems<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">uncovered by code review or testing at such a late stage can =
cause costly redesign<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">and delays. =
The principle of **[Shift Left](<a =
href=3D"https://devopedia.org/shift-left" =
class=3D"">https://devopedia.org/shift-left</a>)** is to take a<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">task that is =
traditionally performed at a late stage in the process and perform that =
task<span class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">at =
earlier stages. The goal is to save time by avoiding refactoring.<br =
class=3D""><br class=3D"">Typically, problematic patch reviews uncover =
issues such as wrong or missed<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">assumptions, =
a problematic architecture or design, or other bugs that require<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">significant =
re-implementation of a patch series to fix the issue.<br class=3D""><br =
class=3D"">The principle of **Shift Left** also applies in code reviews. =
Let's assume a series has<br class=3D"">a major flaw: ideally, this flaw =
would be picked up in the **first or second iteration** of<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">the code =
review. As significant parts of the code may have to be re-written, it =
does not<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">make sense for reviewers to highlight minor issues (such as =
style issues) until major<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">flaws have =
been addressed. By providing feedback on minor issues reviewers =
cause<span class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">the=
 code author and themselves extra work by asking for changes to code, =
which<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">ultimately may be changed later.<br class=3D""><br =
class=3D"">The question then becomes, how do code reviewers identify =
major issues early?<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">----<br class=3D"">This is where I really need help. Are =
there any tips and recommendations that we could give?<br class=3D"">I =
can clearly highlight that we have RFC series, but in practice that does =
not solve the problem as RFCs don=E2=80=99t get prioritized<br =
class=3D"">How do reviewers normally approach a series: do you a) take a =
big picture view first, or b) do most of you work through a series =
sequentially<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;Afaic - depends heavily on the patch / =
series. I wouldn't typically</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;peek ahead in a series, but it has =
happened. But as you say</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;(elsewhere) the cover letter should put in =
place the "big picture".</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;A series should generally be reviewable =
going from patch to patch,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;having the cover letter in mind.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I am =
wondering what others do.<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I think =
explaining the basic work-flow from the viewpoint of a reviewer and code =
author maybe in a separate section, which is not tied to the problem =
case would make sense. More input from other maintainers would be =
valuable. My gut-feel is that most reviewers "read and review" series =
sequentially, which has implications for the author. E.g.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">- docs/design =
docs should be at the beginning of a series</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">- key header =
files or changes to them should be at the beginning of a =
series</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">- =
Etc</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">I =
then propose to change the following section in =
communication-practice.md<br class=3D"">----<br class=3D"">### =
Prioritize significant flaws<br class=3D"">If a patch or patch series =
has significant flaws, such as<br class=3D"">* It is built on wrong =
assumptions<br class=3D"">* There are issues with the architecture or =
the design<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;In such a case a full review of course =
doesn't make much sense. But</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;this is far from the typical situation. Way =
more often you have some</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;_part_ of a patch or series which has a =
bigger issue, but other</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;parts are in need of no or just minor =
changes.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I know that =
this is an unusual situation. But it has happened in clusters frequently =
in the past.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I am =
wondering whether we should introduce some informal convention to mark =
_part_ of a series as problematic. A simple example of how to do this in =
the cover letter would do</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">it does not make sense to do a =
detailed code review. In such cases, it is best to<br class=3D"">focus =
on the major issues first and deal with style and minor issues in a =
subsequent<br class=3D"">review. Not all series have significant flaws, =
but most series have different classes of<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">changes that =
are required for acceptance: covering a range of major code<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">modifications =
to minor code style fixes. To avoid misunderstandings between<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">reviewers =
and contributors, it is important to establish and agree whether a =
series or<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">part of a series has a significant flaw and agree a course of =
action.<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""><br class=3D"">A pragmatic approach would be to<br class=3D"">*=
 Highlight problematic portions of a series in the cover letter<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">* For the =
patch author and reviewer(s) to agree that for problematic to omit style =
and<br class=3D"">minor issues in the review, until the significant flaw =
is addressed<br class=3D""><br class=3D"">This saves both the patch =
author and reviewer(s) time. Note that some background<br class=3D"">is =
covered in detail in [Problematic Patch =
Reviews](resolving-disagreement.md#problems).<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;I have no issues with the suggested text in =
general, but I also don't</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;think it makes much of a difference wrt =
what I had mentioned before.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;I guess part of the problem here is that =
there are things which imo</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;you can't really give recipes for how to =
approach, if the expectation</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;is that it would fit at least the vast =
majority of cases.<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I think the =
document covers most of the common cases, plus some areas which are =
problematic</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">* =46rom a =
people-interaction point-of-view - in other words there could be =
unnecessary conflict, which is bad for the community but also wastes =
time</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">* =46rom an =
efficient usage of time point-of-view</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">For example: the whole thing about thanking, appreciation, =
... is something targeted at newcomers and a desire to treat them with =
more thought and awareness.<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Granted it =
takes more time to do a review with a newcomer, but it should make =
subsequent reviews easier<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">It happens =
regularly, but not that frequently</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;For code</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;reviews this means that I don't think there =
should be any wording</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;suggesting they should be done in a certain =
form; there may be wording</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;suggesting they _could_ be done in a =
certain form (e.g. to help</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;people not knowing at all how to get =
started).</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">That was =
definitely my intention. Maybe I have not succeeded in making this clear =
enough</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote></div><br class=3D""><div =
class=3D"">Adding the log of a very productive IRC conversation for =
reference. Sorry for the formatting</div><div class=3D"">Regards</div><div=
 class=3D"">Lars</div><div class=3D""><br class=3D""></div><div =
class=3D"">




<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->


<!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-GB</w:LidThemeOther>
  <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val=3D"Cambria Math"/>
   <m:brkBin m:val=3D"before"/>
   <m:brkBinSub m:val=3D"&#45;-"/>
   <m:smallFrac m:val=3D"off"/>
   <m:dispDef/>
   <m:lMargin m:val=3D"0"/>
   <m:rMargin m:val=3D"0"/>
   <m:defJc m:val=3D"centerGroup"/>
   <m:wrapIndent m:val=3D"1440"/>
   <m:intLim m:val=3D"subSup"/>
   <m:naryLim m:val=3D"undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState=3D"false" DefUnhideWhenUsed=3D"false"
  DefSemiHidden=3D"false" DefQFormat=3D"false" DefPriority=3D"99"
  LatentStyleCount=3D"375">
  <w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" =
Name=3D"Normal"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" =
Name=3D"heading 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 7"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 8"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 9"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"index 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"index 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"index 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"index 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"index 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"index 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"index 7"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"index 8"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"index 9"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 7"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 8"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 9"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Normal Indent"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"footnote text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"annotation text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"header"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"footer"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"index heading"/>
  <w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"table of figures"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"envelope address"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"envelope return"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"footnote reference"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"annotation reference"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"line number"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"page number"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"endnote reference"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"endnote text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"table of authorities"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"macro"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"toa heading"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Bullet"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Number"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Bullet 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Bullet 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Bullet 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Bullet 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Number 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Number 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Number 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Number 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"10" QFormat=3D"true" =
Name=3D"Title"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Closing"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Signature"/>
  <w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"Default Paragraph Font"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Body Text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Body Text Indent"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Continue"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Continue 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Continue 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Continue 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"List Continue 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Message Header"/>
  <w:LsdException Locked=3D"false" Priority=3D"11" QFormat=3D"true" =
Name=3D"Subtitle"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Salutation"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Date"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Body Text First Indent"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Body Text First Indent 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Note Heading"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Body Text 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Body Text 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Body Text Indent 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Body Text Indent 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Block Text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Hyperlink"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"FollowedHyperlink"/>
  <w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D"true" =
Name=3D"Strong"/>
  <w:LsdException Locked=3D"false" Priority=3D"20" QFormat=3D"true" =
Name=3D"Emphasis"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Document Map"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Plain Text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"E-mail Signature"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Top of Form"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Bottom of Form"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Normal (Web)"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Acronym"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Address"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Cite"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Code"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Definition"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Keyboard"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Preformatted"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Sample"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Typewriter"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"HTML Variable"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Normal Table"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"annotation subject"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"No List"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Outline List 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Outline List 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Outline List 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Simple 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Simple 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Simple 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Classic 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Classic 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Classic 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Classic 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Colorful 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Colorful 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Colorful 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Columns 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Columns 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Columns 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Columns 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Columns 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Grid 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Grid 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Grid 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Grid 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Grid 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Grid 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Grid 7"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Grid 8"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table List 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table List 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table List 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table List 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table List 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table List 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table List 7"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table List 8"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table 3D effects 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table 3D effects 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table 3D effects 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Contemporary"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Elegant"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Professional"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Subtle 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Subtle 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Web 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Web 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Web 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Balloon Text"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"Table Grid"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Table Theme"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Placeholder=
 Text"/>
  <w:LsdException Locked=3D"false" Priority=3D"1" QFormat=3D"true" =
Name=3D"No Spacing"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light =
Shading"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium =
Shading 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium =
Shading 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful =
List"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful =
Grid"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium =
Shading 1 Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium =
Shading 2 Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Revision"/>=

  <w:LsdException Locked=3D"false" Priority=3D"34" QFormat=3D"true"
   Name=3D"List Paragraph"/>
  <w:LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" =
Name=3D"Quote"/>
  <w:LsdException Locked=3D"false" Priority=3D"30" QFormat=3D"true"
   Name=3D"Intense Quote"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium =
Shading 1 Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium =
Shading 2 Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium =
Shading 1 Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium =
Shading 2 Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium =
Shading 1 Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium =
Shading 2 Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium =
Shading 1 Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium =
Shading 2 Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium =
Shading 1 Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium =
Shading 2 Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"19" QFormat=3D"true"
   Name=3D"Subtle Emphasis"/>
  <w:LsdException Locked=3D"false" Priority=3D"21" QFormat=3D"true"
   Name=3D"Intense Emphasis"/>
  <w:LsdException Locked=3D"false" Priority=3D"31" QFormat=3D"true"
   Name=3D"Subtle Reference"/>
  <w:LsdException Locked=3D"false" Priority=3D"32" QFormat=3D"true"
   Name=3D"Intense Reference"/>
  <w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true" =
Name=3D"Book Title"/>
  <w:LsdException Locked=3D"false" Priority=3D"37" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"Bibliography"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"TOC Heading"/>
  <w:LsdException Locked=3D"false" Priority=3D"41" Name=3D"Plain Table =
1"/>
  <w:LsdException Locked=3D"false" Priority=3D"42" Name=3D"Plain Table =
2"/>
  <w:LsdException Locked=3D"false" Priority=3D"43" Name=3D"Plain Table =
3"/>
  <w:LsdException Locked=3D"false" Priority=3D"44" Name=3D"Plain Table =
4"/>
  <w:LsdException Locked=3D"false" Priority=3D"45" Name=3D"Plain Table =
5"/>
  <w:LsdException Locked=3D"false" Priority=3D"40" Name=3D"Grid Table =
Light"/>
  <w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table =
2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table =
3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table =
4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark"/>
  <w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful"/>
  <w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table =
2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table =
3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table =
4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark"/>
  <w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful"/>
  <w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Mention"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Smart Hyperlink"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Hashtag"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"
   Name=3D"Unresolved Mention"/>
 </w:LatentStyles>
</xml><![endif]-->

<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
</style>
<![endif]-->



<!--StartFragment--><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
It
would also be good if some maintainers could have a look at
<a =
href=3D"https://lists.xenproject.org/archives/html/xen-devel/2019-12/threa=
ds.html#00348" =
class=3D"">https://lists.xenproject.org/archives/html/xen-devel/2019-12/th=
reads.html#00348</a><o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9gwd=E2=80=BA<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span>lars_kurth: What
exactly more feedback did you want?<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
gwd:
primarily about maintainers workflow. How do you approach a review. Is =
there
anything a code author can do. Right now, I have one data point from =
Jan. I
basically want to validate my assumptions before I send out another =
revision<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
gwd: a
code author can do to make your life easier =3D&gt; e.g. by putting big =
picture
stuff at the beginning of a series<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
e.g by
putting potentially controversial elements of it at the beginning, =
etc<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
Obviously,
this would only help if most reviewers approach a review sequentially, =
which is
a reasonable assumption, but I am not actually 100% sure this is =
true<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9royger=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lars_kurth:
patch series must be reviewed sequentially, that's why it's numbered<o:p =
class=3D""></o:p></p><p class=3D"MsoNormal">=E2=80=B9gwd=E2=80=BA<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>lars_kurth:
Actually it's often the case that you find uncontroversial side clean-up =
things
in the course of doing a series; putting those at the beginning means =
they can
be checked in independently of the whole series, which makes less work =
for
everyone<o:p class=3D""></o:p></p><p class=3D"MsoNormal">=E2=80=B9gwd=E2=80=
=BA<span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>They can be
checked in after v1 or v2, and then 1) less work for authors to rebase, =
2) less
cognitive overhead for reviewers to see what's going on.<o:p =
class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
royger:
That is not a necessarily obvious conclusion - at least for me. But if =
it is
true, we should clearly state that<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
gwd:
that's interesting. I guess there are differing objectives<o:p =
class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9royger=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I
don't think any maintainer/reviewer does review non-sequentially, as it =
would
lead to extreme confusion. It's quite common for patches on a patch =
series to
rely on the previous ones<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9royger=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lars_kurth:
I think it can be safely stated<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
1) get
uncontroversial / easy to do stuff first<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
2)
then put more complex things, but start with documents/headers/anything =
that is
substantial to understand the rest of the changes - if they fit into =
logical
units maybe repeat that pattern<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9gwd=E2=80=BA<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span>I think every
situation if different.<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9royger=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the
only time you can get non-ordered review is if your patch series touches
multiple subsystems and you have properly splitted this into different =
patches,
in that case each subsystem maintainer is likelky to review his ares =
without
looking at other patches<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9gwd=E2=80=BA&nbsp; royger: You're
talking about checking in, not review I think?</p><p =
class=3D"MsoNormal"><o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9gwd=E2=80=BA<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span>Sometimes in a
long series, {1,2}/10 will be clean-ups; {3-6}/10 will be general
reorganisations which don't really seem to do anything; and then 7/10 =
will be
the "meat", which helps you understand what {3-6}/10 were about.<o:p =
class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
royger,
gwd: "It's quite common for patches on a patch series to rely on the
previous ones" - is an important point.<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9gwd=E2=80=BA<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span>Usually it's not
possible to put 7/10 earlier without making it far more complicated.<o:p =
class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
I
think the way how to best structure patch series is an important one, =
and there
is practically NO information about this. So people learn stuff by trial =
and
error. So I think it is worth exploring that<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9gwd=E2=80=BA<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span>It's a bit like
saying, "How do you teach someone something", or "How do you
make an argument to convince someone of something". There are patterns,
but it's so broad a topic you can't really give direct advice.<o:p =
class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
gwd:
maybe showing some examples will help. I think the problem is that cover
letters frequently don't help much<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9Diziet=E2=80=BA <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>I =
think what
you just said above "Sometimes in a long series," would be a very
useful thing to put in as a general rule.<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9Diziet=E2=80=BA <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>gwd: ^<o:p class=3D""></o:p></p><p class=3D"MsoNormal">=E2=80=B9Diz=
iet=E2=80=BA <span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>Sometimes some
of these pieces will be empty.<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9Diziet=E2=80=BA <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>1. cleanups 2.
reorgs 3. headers/docs/etc. 4. meat 5. cleaning up any infelicities =
introduced
temporarily 6. deleting old code<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9Diziet=E2=80=BA <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>If there are
multiple subsystems involved, then these are best separated out where =
possible,
so you end up with those 6 categories x N subsystems.<o:p =
class=3D""></o:p></p><p class=3D"MsoNormal">=E2=80=B9gwd=E2=80=BA&nbsp; =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>Of course, sometimes
there are several "meat" patches, which could be ordered in different
ways; and then you may want to put reorgs in between the meat =
patches.<o:p class=3D""></o:p></p><p class=3D"MsoNormal">=E2=80=B9gwd=E2=80=
=BA&nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>The XSA-299
series is an example of that.<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9Diziet=E2=80=BA <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>In this
context I am reminded of
<a =
href=3D"https://www.chiark.greenend.org.uk/pipermail/sgo-software-discuss/=
2019/000616.html" =
class=3D"">https://www.chiark.greenend.org.uk/pipermail/sgo-software-discu=
ss/2019/000616.html</a>
My main achievement for the weekend, in a personal project.<o:p =
class=3D""></o:p></p><p class=3D"MsoNormal">=E2=80=B9gwd=E2=80=BA&nbsp; =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>And lars_kurth
could probably go back over the history and see the series develop; the
"meat" patches were reorganized several times to try to find out
which order created the most comprehensible series of individual =
patches.<o:p class=3D""></o:p></p><p class=3D"MsoNormal">=E2=80=B9Diziet=E2=
=80=BA <span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>Subject: &nbsp;New signature key arrangements<o:p =
class=3D""></o:p></p><p class=3D"MsoNormal">=E2=80=B9gwd=E2=80=BA&nbsp; =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>lars_kurth: And
say, if you take a look at the golang xenlight bindings series; v1 would =
have
been useless without the entire thing being checked in. It's likely that =
v3
I'll be able to check in {1..16}/22, meaning v4 will have a lot fewer =
patches
to rebase / recheck.<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9Diziet=E2=80=BA <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>I'm not
suggesting it as an example in this context because I have done much =
less
squashing than would be usual in a community like Xen where we have many =
more
reviewers so the goal of making review easy and comprehensible is more
important relative to the goal of later understanding what the original
programmer was thinking when they wrote soemthing.<o:p =
class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
This
is very useful. I think this is the missing piece<o:p =
class=3D""></o:p></p><p class=3D"MsoNormal">=E2=80=B9Diziet=E2=80=BA =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>But we should
provide some examples. Do we have good example cover letters we could =
use ?<o:p class=3D""></o:p></p><p class=3D"MsoNormal">=E2=80=B9Diziet=E2=80=
=BA <span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>I'm sure there
are some libxl ones but ideally we would have an example touching =
multiple
subsystems. And one which wasn't affected by release constraints.<o:p =
class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
That
would be good. Maybe I can write something up and put a place-holder in =
place
for good examples, if we can't think of one now<o:p =
class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9jbeulich=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; gwd,
lars_kurth: The opposite case (cleanups last) would often be preferable =
for
series where the "meat" one(s) are to be backported, but the cleanups
aren't.<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
jbeulich:
interesting point. Do you have an example?<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9jbeulich=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; An
example of what? A series where we asked for re-ordering because of the =
above?
If so, I don't think I could easily spot one.<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9jbeulich=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; I
can tell you though that the above is what I would typically do. Most
prominently for security fixes *where the cleanup is being held back
altogether).<o:p class=3D""></o:p></p><p =
class=3D"MsoNormal">=E2=80=B9lars_kurth=E2=80=BA&nbsp;&nbsp;&nbsp;&nbsp; =
jbeulich:
I will try and put something together. I think I have enough to go =
on<o:p class=3D""></o:p></p><p class=3D"MsoNormal"><o:p =
class=3D"">&nbsp;</o:p></p>

<!--EndFragment--></div><div class=3D""><br class=3D""></div><div =
class=3D""></div><div class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_086483F7-9100-4156-A917-C1AC5ED6F3D3--


--===============2257197914275255408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2257197914275255408==--

