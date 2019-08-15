Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B08EF72
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 17:36:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyHky-0002vN-F2; Thu, 15 Aug 2019 15:33:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T442=WL=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hyHkw-0002v6-Ux
 for xen-devel@lists.xen.org; Thu, 15 Aug 2019 15:33:39 +0000
X-Inumbo-ID: 0ca3beec-bf72-11e9-b90c-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ca3beec-bf72-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 15:33:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s18so1822915wrn.1
 for <xen-devel@lists.xen.org>; Thu, 15 Aug 2019 08:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=BgMb6kuCtA2+6OKaC6dRpzpEPePkMR9cM8ZszLs3Zok=;
 b=eceirhu6hcpIQFLIUfDS4bEYcZuv/RYr1I5GUoMlFrt2c8uMxNGYmAfhgtW7Uyjkn3
 51nqLlnfWvECqrV68vKsIjMVUKHtSoQ2djpPGduzJHc0MIslYDpZywvnqQvhTJgEHMcE
 cDPPTe5I+oHKdCnEkbyOMK2lsGE4CloTJFhUzaPNY0gc63UHvrZd/HbSPCvzrAZU3+PF
 tVghM8Alw+zqcrd+C7oimLmBD2Typg5yCG4VnunA9436FJ5HgcPi7c2FYngVmEGLFimJ
 It0GqlzFLjv9gq4E63xzNMF791xQ8l9Xo0yB531AyHWZBhkvmcLMf2Lk0MM3f6cDatnM
 +0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=BgMb6kuCtA2+6OKaC6dRpzpEPePkMR9cM8ZszLs3Zok=;
 b=TepJYMDn7dMVV997RlGus2Mjja15MhlkY7MoZqH2GnpMIHluqs5OV2/yBPQXgyTviq
 zAApQBFQDX9++jioyc/0e9P4FgVrFXgJ2Ls2BfQLaZOimb8KzZK1T/nVb7lHYA/1SP+f
 YdnjzGkFYBvCuaRKH7RtN3xMhczvz0E7d8zKroWNOfdR2sT5ymix3XXoagBa2Nk61Gsy
 5/2ssy1Y30P+D7QSsqFc1879pTGwxaShIU+uZRUgSf2lmdLUBGj7B3yLmIuFov4EeHRg
 Du7MRs7U2YYdigCJHjcntGsLAsUi2x2pZzoaAhr3brXtf1uv7GvmRGBcMBnhhLEBHjJq
 g9GQ==
X-Gm-Message-State: APjAAAXvOR1mgHVADZmYbvOv7GuwmglPa8gT7lQbhM6fMR9JQQnFoKdu
 HcK1X1FdlFI6PeRgmapuKmE=
X-Google-Smtp-Source: APXvYqwUWn9yqTCg/cu5KsQ7SytNx+fOlaSog+MqKtYeuVsvxwfpHQv4SPKm+cUERaQRYhKJGSKZzg==
X-Received: by 2002:adf:82d4:: with SMTP id 78mr5666355wrc.85.1565883216060;
 Thu, 15 Aug 2019 08:33:36 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:401e:f277:3894:a225?
 ([2a02:c7f:ac18:da00:401e:f277:3894:a225])
 by smtp.gmail.com with ESMTPSA id w5sm1828674wmm.43.2019.08.15.08.33.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 08:33:35 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <18CBBC37-9027-41B7-8375-44FE3E56F79F@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Thu, 15 Aug 2019 16:33:34 +0100
In-Reply-To: <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
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
Cc: "Tim \(Xen.org\)" <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============4589688821352873947=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4589688821352873947==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_9A1AFB74-CC39-4993-B300-774065B6539E"


--Apple-Mail=_9A1AFB74-CC39-4993-B300-774065B6539E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 15 Aug 2019, at 16:19, Wieczorkiewicz, Pawel <wipawel@amazon.de> =
wrote:
>=20
> Hi Lars, Julien,
>=20
> Thanks for the pointers, I will read them up and follow the =
recommendations with my future contributions.
> Sorry for the mess=E2=80=A6

It's not really a mess: it must have been quite a pain to put the mails =
together manually
And it would become more painful for a second revision
I have been through this myself

> But, let me ask first before reading the wikis, how do you prefer =
submitting series that contain patches belonging to 2 distinct repos =
(e.g. xen and livepatch-build-tools)?

That's a good question and a very rare use-case. We split them, as all =
the tools such as git format-patch only work on one repo
Applying patches also only works on a per repo basis

So, I would send two series. But mention the relationship in the cover =
letter (and/or patch if it is a single one)

The tools in the docs currently may not work on =
livepatch-build-tools.git
* First: there is no MAINTAINERS file in livepatch-build-tools.git, =
which really should be added
* Second: using xen.git:/scripts/add_maintainers.pl may not work when =
called from within livepatch-build-tools.git

I am going to play with this and update the docs and if needed the tools =
accordingly
You may have to improvise in the meantime:
* Step 1 & 3 will work: Step 2, option 1 will probably not (which means =
until I have done this, you may have to follow option 2 and make sure =
that the right people are CC'ed)

You can also use: https://patchew.org/Xen/ <https://patchew.org/Xen/>, =
https://patchwork.kernel.org/project/xen-devel/list/ =
<https://patchwork.kernel.org/project/xen-devel/list/> or =
https://lore.kernel.org/xen-devel/ <https://lore.kernel.org/xen-devel/> =
to track some of the changes. I have not had time to add this to the =
docs yet

Lars

>=20
> Best Regards,
> Pawel Wieczorkiewicz
>=20
>=20
>=20
>> On 15. Aug 2019, at 16:58, Lars Kurth <lars.kurth.xen@gmail.com =
<mailto:lars.kurth.xen@gmail.com>> wrote:
>>=20
>>=20
>>=20
>>> On 15 Aug 2019, at 12:38, Julien Grall <julien.grall@arm.com =
<mailto:julien.grall@arm.com>> wrote:
>>>=20
>>> Hi,
>>>=20
>>> I am not going to answer on the patch itself but the process.
>>>=20
>>> Any series (i.e more than one patch) should contain a cover letter =
with a rough summary of the goal of the series.
>>>=20
>>> Furthermore, this 3 patches series has been received as 3 separate =
threads (i.e in-reply-to is missing). This is making difficult to know =
that all the patches belongs to the same series. In general, all patches =
are send as in-reply-to the cover letter. So all the patches sticks =
together in one thread.
>>>=20
>>> The cover letter can be generated via git format-patch =
--cover-letter. Threading is done automatically with git-send-email when =
all the patches as passed in arguments.
>>>=20
>>> For more details how to do it, you can read:
>>>=20
>>> =
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a_=
Patch_Series =
<https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a=
_Patch_Series>
>>>=20
>>> Cheers,
>>=20
>> Hi Pawel,=20
>>=20
>> thank you for submitting the patch series.=20
>>=20
>> We had a couple of new starters recently who followed a similar =
pattern to you. As a result of this, I recently updated the following =
docs
>>=20
>> https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches =
<https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches> - =
Definitions and general workflow
>> The bit which saves the most work is =
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a_=
Patch_Series =
<https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a=
_Patch_Series>
>> As for Julien's comment on the threading: see the --thread and =
--cover-letter option as described in the Sending a Patch Series
>>=20
>> https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git =
<https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git> - Basic =
Git commands fitting into the workflow, including how to deal with =
reviews
>> https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_StGit =
<https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_StGit> - =
Basic StGit commands fitting into the workflow, including how to deal =
with reviews
>> I have not had time to play with git series yet. If anyone in your =
team uses it let me know
>>=20
>> In any case: if you follow the instructions the entire submission =
process and dealing with review comments becomes much easier.=20
>>=20
>> As a newcomer, to contributing to Xen, I would greatly appreciate if =
you could let me know of any issues with the docs, such that we can fix =
them
>>=20
>> Regards
>> Lars
>>=20
>>=20
>>=20
>=20
>=20
>=20
>=20
> Amazon Development Center Germany GmbH=20
> Krausenstr. 38=20
> 10117 Berlin=20
> Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich=20
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B=20
> Sitz: Berlin=20
> Ust-ID: DE 289 237 879=20
>=20
>=20


--Apple-Mail=_9A1AFB74-CC39-4993-B300-774065B6539E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 15 Aug 2019, at 16:19, Wieczorkiewicz, Pawel &lt;<a =
href=3D"mailto:wipawel@amazon.de" class=3D"">wipawel@amazon.de</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D"">

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D"">

<div style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D"">
Hi Lars, Julien,
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Thanks for the pointers, I will read them up and follow =
the recommendations with my future contributions.</div>
<div class=3D"">Sorry for the =
mess=E2=80=A6</div></div></div></blockquote><div><br =
class=3D""></div><div>It's not really a mess: it must have been quite a =
pain to put the mails together manually</div><div>And it would become =
more painful for a second revision</div><div>I have been through this =
myself</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D"">

<div class=3D"">But, let me ask first before reading the wikis, how do =
you prefer submitting series that contain patches belonging to 2 =
distinct repos (e.g. xen and =
livepatch-build-tools)?</div></div></div></blockquote><div><br =
class=3D""></div>That's a good question and a very rare use-case. We =
split them, as all the tools such as&nbsp;git format-patch only work on =
one repo</div><div>Applying patches also only works on a per repo =
basis</div><div><br class=3D""></div><div>So, I would send two series. =
But mention the relationship in the cover letter (and/or patch if it is =
a single one)</div><div><br class=3D""></div><div>The tools in the docs =
currently may not work on livepatch-build-tools.git</div><div>* First: =
there is no MAINTAINERS file in livepatch-build-tools.git, which really =
should be added</div><div>* Second: using =
xen.git:/scripts/add_maintainers.pl may not work when called from within =
livepatch-build-tools.git</div><div><br class=3D""></div><div>I am going =
to play with this and update the docs and if needed the tools =
accordingly</div><div>You may have to improvise in the =
meantime:</div><div>* Step 1 &amp; 3 will work: Step 2, option 1 will =
probably not (which means until I have done this, you may have to follow =
option 2 and make sure that the right people are CC'ed)</div><div><br =
class=3D""></div><div>You can also use:&nbsp;<a =
href=3D"https://patchew.org/Xen/" =
class=3D"">https://patchew.org/Xen/</a>,&nbsp;<a =
href=3D"https://patchwork.kernel.org/project/xen-devel/list/" =
class=3D"">https://patchwork.kernel.org/project/xen-devel/list/</a>&nbsp;o=
r&nbsp;<a href=3D"https://lore.kernel.org/xen-devel/" =
class=3D"">https://lore.kernel.org/xen-devel/</a>&nbsp;to track some of =
the changes. I have not had time to add this to the docs =
yet</div><div><br class=3D""></div><div>Lars</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;" class=3D"">
<div class=3D""><br class=3D"">
<div class=3D"">
<div dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D"">
<div style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
Best Regards,<br class=3D"">
Pawel Wieczorkiewicz</div>
<br class=3D"Apple-interchange-newline">
</div>
<br class=3D"Apple-interchange-newline">
</div>
<div class=3D""><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 15. Aug 2019, at 16:58, Lars Kurth &lt;<a =
href=3D"mailto:lars.kurth.xen@gmail.com" =
class=3D"">lars.kurth.xen@gmail.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D"">
<br class=3D"">
<div class=3D""><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 15 Aug 2019, at 12:38, Julien Grall &lt;<a =
href=3D"mailto:julien.grall@arm.com" =
class=3D"">julien.grall@arm.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Hi,</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I
 am not going to answer on the patch itself but the process.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Any
 series (i.e more than one patch) should contain a cover letter with a =
rough summary of the goal of the series.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Furthermore,
 this 3 patches series has been received as 3 separate threads (i.e =
in-reply-to is missing). This is making difficult to know that all the =
patches belongs to the same series. In general, all patches are send as =
in-reply-to the cover letter. So all the patches
 sticks together in one thread.</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">The
 cover letter can be generated via git format-patch --cover-letter. =
Threading is done automatically with git-send-email when all the patches =
as passed in arguments.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">For
 more details how to do it, you can read:</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<a =
href=3D"https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Se=
nding_a_Patch_Series" style=3D"font-family: Menlo-Regular; font-size: =
11px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches=
#Sending_a_Patch_Series</a><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">Cheers,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">
</div>
</blockquote>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Hi Pawel,&nbsp;</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">thank you for submitting the patch series.&nbsp;</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">We had a couple of new starters recently who followed a =
similar pattern to you. As a result of this, I recently updated the =
following docs</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D""><a =
href=3D"https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches" =
class=3D"">https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches=
</a>&nbsp;- Definitions and general workflow</div>
<div class=3D"">The bit which saves the most work is&nbsp;<a =
href=3D"https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Se=
nding_a_Patch_Series" =
class=3D"">https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches=
#Sending_a_Patch_Series</a></div>
<div class=3D"">As for Julien's comment on the threading: see =
the&nbsp;--thread and --cover-letter option as described in the Sending =
a Patch Series</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D""><a =
href=3D"https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git" =
class=3D"">https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git<=
/a>&nbsp;- Basic Git commands fitting into the workflow, including how =
to deal with reviews</div>
<div class=3D""><a =
href=3D"https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_StGit" =
class=3D"">https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_StGi=
t</a>&nbsp;- Basic StGit commands fitting into the workflow, including =
how to deal with reviews</div>
<div class=3D"">I have not had time to play with git series yet. If =
anyone in your team uses it let me know</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">In any case: if you follow the instructions the entire =
submission process and dealing with review comments becomes much =
easier.&nbsp;</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">As a newcomer, to contributing to Xen, I would greatly =
appreciate if you could let me know of any issues with the docs, such =
that we can fix them</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Regards</div>
<div class=3D"">Lars</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D""><br class=3D"">
</div>
</div>
</div>
</div>
</blockquote>
</div>
<br class=3D"">
</div>
<br class=3D""><br class=3D""><br class=3D"">Amazon Development Center =
Germany GmbH
<br class=3D"">Krausenstr. 38
<br class=3D"">10117 Berlin
<br class=3D"">Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
<br class=3D"">Eingetragen am Amtsgericht Charlottenburg unter HRB =
149173 B
<br class=3D"">Sitz: Berlin
<br class=3D"">Ust-ID: DE 289 237 879
<br class=3D""><br class=3D""><br class=3D"">
</div>

</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_9A1AFB74-CC39-4993-B300-774065B6539E--


--===============4589688821352873947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4589688821352873947==--

