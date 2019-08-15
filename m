Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164F8F483
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 21:28:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyLNh-0000pf-7g; Thu, 15 Aug 2019 19:25:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T442=WL=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hyLNf-0000pS-1W
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 19:25:51 +0000
X-Inumbo-ID: 7a82aa2a-bf92-11e9-b90c-bc764e2007e4
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a82aa2a-bf92-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 19:25:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id z23so2171748wmf.2;
 Thu, 15 Aug 2019 12:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=x2xkfNYyRBqPxJBlNUWe6lAyTYyakR+DiV8ZYbfs+D8=;
 b=rUkZOZhG0um7f+8fhro0LAcRijo+LFTUfgU87kuSzg1m7MsBqL2mhliLOooaCNkvDv
 NQHgm5NWqmZXRmMeX9rXIS13cVSyNk42oKb3DflmgB+CUAAlc8we5ZrtsEj3VXOnbnxo
 PYC0RUWH+r5xNaRL9rn/7RmBoXmuO/06TNa62ZElY86mMxBUz0t4X1AbkeJHFO3QAF7D
 wlyzz2v9btu4/aQ6slmdXPbYN7+/Q5vp3LB/F2VHzlKWz7kr+Qy6CN0znuSpagX1xweN
 61jnSBj7r1m/DIiBBO6Ce4ccyeibIeIISZoEN3AuXiUcgu3G+Bdg9cDxByZ8Q1sk0m+D
 m+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=x2xkfNYyRBqPxJBlNUWe6lAyTYyakR+DiV8ZYbfs+D8=;
 b=rJruN3qjtSf4ZpjG+MaLdz4QRgdaFRRxIabKS0ZGOrh46HUECudW1AIFKll0ugRYjB
 Qp9ab1B+nI2/9/kIn5uG0rLkLg2J1CvT4kBpmPdB87O/puefynZF7MPq66K26/PFkzMG
 291w8gYqAzHsFR/ZSnOiyRannaTMdkxksYioL+KJ0GepnVYPlQwoM6RG5mXSczIHUfM/
 9lTsrjBsERkAcU3/J0twigMDjKopVefRI5tjtOl2JRF1f2OL0a31bpkH1MVUEo8d41ia
 0ML0otZpE3EN1SsLh5zrSGLFDN05Uu9BHNaazdErzoWcGtBXT1ncMGhGd+V09qndzbjH
 ICXg==
X-Gm-Message-State: APjAAAXtRSYl3kf3SveypmM4IWoK24qI4gqzXlq59RXgRYruoq0k04Cp
 3uS5rx2ZOWGIpS46Xp/4qVN3OsR0URc=
X-Google-Smtp-Source: APXvYqzqXbxQa2FKuHupXG49dknUAZxUP8o0PClzT2Jo73WCznmQ25EfTM+ZoQQcXt65xNF9VcfGvA==
X-Received: by 2002:a1c:18a:: with SMTP id 132mr4168718wmb.15.1565897144255;
 Thu, 15 Aug 2019 12:25:44 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:2846:9773:abb7:590b?
 ([2a02:c7f:ac18:da00:2846:9773:abb7:590b])
 by smtp.gmail.com with ESMTPSA id f192sm2404620wmg.30.2019.08.15.12.25.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 12:25:43 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <4A2B03F4-9E6B-4BE3-B694-2C18F107ABB9@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Thu, 15 Aug 2019 20:25:42 +0100
In-Reply-To: <AB4A2D57-529C-42A1-8173-9C893BC348DE@gmail.com>
To: Rich Persaud <persaur@gmail.com>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com>
 <6785899F-48FE-4977-81D1-3AA700241857@gmail.com>
 <E85126B0-E13C-4DBE-AB85-5C1DF3836B42@citrix.com>
 <3963D85D-BCF6-49CC-A04E-00A03E6D6C9F@gmail.com>
 <B1A585DE-144B-466F-BC35-3E68E6469D96@xenproject.org>
 <AB4A2D57-529C-42A1-8173-9C893BC348DE@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [RFC] Code of Conduct
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5797867263751825702=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5797867263751825702==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_748D99A3-F002-4690-AF5E-8DE682EE08C6"


--Apple-Mail=_748D99A3-F002-4690-AF5E-8DE682EE08C6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 15 Aug 2019, at 20:08, Rich Persaud <persaur@gmail.com> wrote:
>>>>>=20
>>>>> Following the discussion we had at the Developer Summit (see =
https://wiki.xenproject.org/wiki/Design_Sessions_2019#Community_Issues_.2F=
_Improvements_-_Communication.2C_Code_of_Conduct.2C_etc =
<https://wiki.xenproject.org/wiki/Design_Sessions_2019#Community_Issues_.2=
F_Improvements_-_Communication.2C_Code_of_Conduct.2C_etc>. for notes) I =
put together a draft for the Code of Conduct which can be found here as =
well as inlined below
>>>>> =
https://docs.google.com/document/d/1NnWdU_VnC1N_ZzxQG6jU9fnY2GPVCcfPJT5KY6=
1WXJM/edit?usp=3Dsharing =
<https://docs.google.com/document/d/1NnWdU_VnC1N_ZzxQG6jU9fnY2GPVCcfPJT5KY=
61WXJM/edit?usp=3Dsharing>
>>>>>=20
>>>>> It is based on the LF Events CoC as we agreed on (the diff is =
attached). I took the scope and enforcement sections from =
https://www.contributor-covenant.org/version/1/4/code-of-conduct.html =
<https://www.contributor-covenant.org/version/1/4/code-of-conduct.html> =
and simplified it rather than inventing something new.
>>>>=20
>>>>   Is there precedent for applying a legal contract (Code of =
Conduct) that was designed for physical space (conference event) to an =
online context?   Is there an existing Code of Conduct that was legally =
designed for a similar, online open-source community context, e.g. =
operating system or hypervisor or other systems-level software dev?
>>>>=20
>>>> If you look at =
https://www.contributor-covenant.org/version/1/4/code-of-conduct.html =
<https://www.contributor-covenant.org/version/1/4/code-of-conduct.html> =
or many other examples, what we ended up with is almost identical. The =
same is true for most other CoCs which are used as =E2=80=9Cgold =
standard=E2=80=9D.
>>>=20
>>> Thanks for the pointer, that's exactly what I was hoping to find.  =
Here is some text from Contributor Covenant:
>>>=20
>>> "Instances of abusive, harassing, or otherwise unacceptable behavior =
may be reported by contacting the project team at [INSERT EMAIL =
ADDRESS]. All complaints will be reviewed and investigated and will =
result in a response that is deemed necessary and appropriate to the =
circumstances. The project team is obligated to maintain confidentiality =
with regard to the reporter of an incident. Further details of specific =
enforcement policies may be posted separately.
>>> Project maintainers who do not follow or enforce the Code of Conduct =
in good faith may face temporary or permanent repercussions as =
determined by other members of the project=E2=80=99s leadership."
>>>=20
>>> This is different from the proposed CoC, because:
>>>=20
>>> (a) repercussions are not specified, i.e. they can be contextual
>>> (b) there is a confidentiality provision
>>> (c) decisions are made by open-source project leadership, not a =
separate "CoC team" with TBD members, electoral process and governance=20=

>>>=20
>>> Can Xen Project adopt Contributor Covenant directly?  It has a large =
base of adopters, including Intel and Google projects, so we would =
benefit from upstream improvements as the CoC is tested in the real =
world:  https://www.contributor-covenant.org/adopters =
<https://www.contributor-covenant.org/adopters>
>>=20
>> We most definitely could and I am open to the idea. However, when =
Linux adopted it, there was significant controversy because of the =
origin of the Contributor Covenant
>>=20
>> See https://itsfoss.com/linux-code-of-conduct/ =
<https://itsfoss.com/linux-code-of-conduct/>
>>=20
>> I am not sure what the risk would be if we followed Linux
>>=20
>> However, we can address all of the above with what we have: The =
section you quoted was indeed from the covenant (see attribution) and I =
simply modified it based on the discussion we had at the summit.=20
>>=20
>>=20
>> a) We could leave the repercussion section out - I think it is =
clearer to have one, but we can clearly debate the pros and cons of not =
having one
>> b) There is a confidentiality provision: "The Xen Project=E2=80=99s =
CoC team is obligated to maintain confidentiality with regard to the =
reporter of an incident."
>> c) In the design session at the summit the present project leadership =
team members felt we should have a CoC team, which is why I changed it
>>=20
>> In any case, the Covenant suggested to customise the template to our =
needs. And that's what I have done.
>>=20
>> It was also interesting that when I started with the LF events CoC, I =
still ended up with something very similar to most of the other CoCs out =
there
>=20
> Differences remain, e.g. Contributor Covenant has a whitelist and =
blacklist of acceptable behaviors, the proposed Xen CoC only has a =
blacklist.  Although you say the CoC is not a legal document, the =
proposed Xen statement of acceptable behaviors does mention "applicable =
laws", which is absent from Contributor Covenant.

> Without getting into the merits of Contributor Covenant, there is =
value in reusing an "upstream CoC" that has been vetted by many =
organizations and is being continually tested in the real world. =20
>=20
> Similar to the "macro supply chain" topic:  if Xen Project must make =
changes to the upstream CoC, these can be done as a logical patch =
(rather than an orphaned fork) so we can incorporate upstream =
improvements.  The rationale for each diff against the upstream CoC can =
be in a revision-controlled doc, so that future CoC maintainers =
understand the reasoning behind each diff, as communities and =
contributors evolve.

I think at this stage I would like to hear the opinions of others, as =
there was quite a bit of discussion that led us to where we are and some =
people looked into this aside from me

I think all of your concerns can be addressed either way by modifying =
the proposal or modifying the covenant

> Are there upstream examples of electoral governance for "CoC teams", =
or would we need to develop that from scratch? =20

We don't need to invent anything, we can use our standard election =
process if we need too. It's designed to be applicable for all kind of =
roles in the community

> Xen Summit design session notes say:=20
> "An area for discussion which was not quite agreed upon pending an =
initial proposal was how we would approach the handling of issues
> A committee
> Probably 2-3 people of different backgrounds maybe from different =
subprojects"
>=20
> Could we also include existing Xen project leadership in the CoC team? =
 How would selection of people for a CoC team differ from the existing =
process for selecting committers, etc?


I was actually thinking that the CoC team would be made up of members of
* Xen project leadership from different sub-projects (not just the =
Hypervisor committers).=20
  Rationale: the CoC is project wide, not specific to xen-devel@
  And we have some leadership team members which do not want to have to =
deal with CoC issues
* Advisory Board members (if one wanted to volunteer)=20
* Optionally we could use the normal election process to elect someone =
who is not a leadership team member. Rationale: diversity - it would be =
nice to have a women on the team such that we don't get blind sighted =
should an issue occur. But we don't currently have female leadership =
team members. Mirage OS is an exception, but Mirage OS does not fully =
follow our conventions in electing leadership team members

In any case: I think I need to hear more different views

Lars




--Apple-Mail=_748D99A3-F002-4690-AF5E-8DE682EE08C6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 15 Aug 2019, at 20:08, Rich Persaud &lt;<a =
href=3D"mailto:persaur@gmail.com" class=3D"">persaur@gmail.com</a>&gt; =
wrote:</div><div class=3D""><div dir=3D"ltr" style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D""></span><br =
class=3D""></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D"">Following the discussion we had at the Developer Summit =
(see<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://wiki.xenproject.org/wiki/Design_Sessions_2019#Community_Is=
sues_.2F_Improvements_-_Communication.2C_Code_of_Conduct.2C_etc" =
class=3D"">https://wiki.xenproject.org/wiki/Design_Sessions_2019#Community=
_Issues_.2F_Improvements_-_Communication.2C_Code_of_Conduct.2C_etc</a>. =
for notes) I put together a draft for the Code of Conduct which can be =
found here as well as inlined below</span><br =
class=3D""></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D""><a =
href=3D"https://docs.google.com/document/d/1NnWdU_VnC1N_ZzxQG6jU9fnY2GPVCc=
fPJT5KY61WXJM/edit?usp=3Dsharing" =
class=3D"">https://docs.google.com/document/d/1NnWdU_VnC1N_ZzxQG6jU9fnY2GP=
VCcfPJT5KY61WXJM/edit?usp=3Dsharing</a></span><br =
class=3D""></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D""></span><br =
class=3D""></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D"">It is based on the LF Events CoC as we agreed on (the diff is =
attached). I took the scope and enforcement sections from<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://www.contributor-covenant.org/version/1/4/code-of-conduct.h=
tml" =
class=3D"">https://www.contributor-covenant.org/version/1/4/code-of-conduc=
t.html</a><span class=3D"Apple-converted-space">&nbsp;</span>and =
simplified it rather than inventing something new.</span><br =
class=3D""></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D""><span class=3D""></span><br =
class=3D""></blockquote></blockquote></blockquote><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote =
type=3D"cite" class=3D""><span class=3D"">&nbsp;&nbsp;Is there precedent =
for applying a legal contract (Code of Conduct) that was designed for =
physical space (conference event) to an online context? &nbsp;&nbsp;Is =
there an existing Code of Conduct that was legally designed for a =
similar, online open-source community context, e.g. operating system or =
hypervisor or other systems-level software dev?</span><br =
class=3D""></blockquote></blockquote></blockquote><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote =
type=3D"cite" class=3D""><span class=3D""></span><br =
class=3D""></blockquote></blockquote></blockquote><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote =
type=3D"cite" class=3D""><span class=3D"">If you look at<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://www.contributor-covenant.org/version/1/4/code-of-conduct.h=
tml" =
class=3D"">https://www.contributor-covenant.org/version/1/4/code-of-conduc=
t.html</a><span class=3D"Apple-converted-space">&nbsp;</span>or many =
other examples, what we ended up with is almost identical. The same is =
true for most other CoCs which are used as =E2=80=9Cgold =
standard=E2=80=9D.</span><br =
class=3D""></blockquote></blockquote></blockquote><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D""></span><br class=3D""></blockquote></blockquote><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D"">Thanks for the pointer, that's exactly what I was hoping to =
find. &nbsp;Here is some text from Contributor Covenant:</span><br =
class=3D""></blockquote></blockquote><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D""></span><br class=3D""></blockquote></blockquote><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D"">"Instances of abusive, harassing, or otherwise unacceptable =
behavior may be reported by contacting the project team at [INSERT EMAIL =
ADDRESS]. All complaints will be reviewed and investigated and will =
result in a response that is deemed necessary and appropriate to the =
circumstances. The project team is obligated to maintain confidentiality =
with regard to the reporter of an incident. Further details of specific =
enforcement policies may be posted separately.</span><br =
class=3D""></blockquote></blockquote><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D""><span class=3D"">Project =
maintainers who do not follow or enforce the Code of Conduct in good =
faith may face temporary or permanent repercussions as determined by =
other members of the project=E2=80=99s leadership."</span><br =
class=3D""></blockquote></blockquote><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D""></span><br class=3D""></blockquote></blockquote><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D"">This is different from the proposed CoC, because:</span><br =
class=3D""></blockquote></blockquote><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D""></span><br class=3D""></blockquote></blockquote><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D"">(a) repercussions are not specified, i.e. they can be =
contextual</span><br class=3D""></blockquote></blockquote><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D"">(b) there is a confidentiality provision</span><br =
class=3D""></blockquote></blockquote><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D""><span class=3D"">(c) =
decisions are made by open-source project leadership, not a separate =
"CoC team" with TBD members, electoral process and governance<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
class=3D""></blockquote></blockquote><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D""></span><br class=3D""></blockquote></blockquote><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D"">Can Xen Project adopt Contributor Covenant directly? &nbsp;It =
has a large base of adopters, including Intel and Google projects, so we =
would benefit from upstream improvements as the CoC is tested in the =
real world: &nbsp;<a =
href=3D"https://www.contributor-covenant.org/adopters" =
class=3D"">https://www.contributor-covenant.org/adopters</a></span><br =
class=3D""></blockquote></blockquote><blockquote type=3D"cite" =
class=3D""><span class=3D""></span><br class=3D""></blockquote><blockquote=
 type=3D"cite" class=3D""><span class=3D"">We most definitely could and =
I am open to the idea. However, when Linux adopted it, there was =
significant controversy because of the origin of the Contributor =
Covenant</span><br class=3D""></blockquote><blockquote type=3D"cite" =
class=3D""><span class=3D""></span><br class=3D""></blockquote><blockquote=
 type=3D"cite" class=3D""><span class=3D"">See<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://itsfoss.com/linux-code-of-conduct/" =
class=3D"">https://itsfoss.com/linux-code-of-conduct/</a></span><br =
class=3D""></blockquote><blockquote type=3D"cite" class=3D""><span =
class=3D""></span><br class=3D""></blockquote><blockquote type=3D"cite" =
class=3D""><span class=3D"">I am not sure what the risk would be if we =
followed Linux</span><br class=3D""></blockquote><blockquote type=3D"cite"=
 class=3D""><span class=3D""></span><br =
class=3D""></blockquote><blockquote type=3D"cite" class=3D""><span =
class=3D"">However, we can address all of the above with what we have: =
The section you quoted was indeed from the covenant (see attribution) =
and I simply modified it based on the discussion we had at the =
summit.<span class=3D"Apple-converted-space">&nbsp;</span></span><br =
class=3D""></blockquote><blockquote type=3D"cite" class=3D""><span =
class=3D""></span><br class=3D""></blockquote><blockquote type=3D"cite" =
class=3D""><span class=3D""></span><br class=3D""></blockquote><blockquote=
 type=3D"cite" class=3D""><span class=3D"">a) We could leave the =
repercussion section out - I think it is clearer to have one, but we can =
clearly debate the pros and cons of not having one</span><br =
class=3D""></blockquote><blockquote type=3D"cite" class=3D""><span =
class=3D"">b) There is a confidentiality provision: "The Xen Project=E2=80=
=99s CoC team is obligated to maintain confidentiality with regard to =
the reporter of an incident."</span><br =
class=3D""></blockquote><blockquote type=3D"cite" class=3D""><span =
class=3D"">c) In the design session at the summit the present project =
leadership team members felt we should have a CoC team, which is why I =
changed it</span><br class=3D""></blockquote><blockquote type=3D"cite" =
class=3D""><span class=3D""></span><br class=3D""></blockquote><blockquote=
 type=3D"cite" class=3D""><span class=3D"">In any case, the Covenant =
suggested to customise the template to our needs. And that's what I have =
done.</span><br class=3D""></blockquote><blockquote type=3D"cite" =
class=3D""><span class=3D""></span><br class=3D""></blockquote><blockquote=
 type=3D"cite" class=3D""><span class=3D"">It was also interesting that =
when I started with the LF events CoC, I still ended up with something =
very similar to most of the other CoCs out there</span><br =
class=3D""></blockquote><span class=3D""></span><br class=3D""><span =
class=3D"">Differences remain, e.g. Contributor Covenant has a whitelist =
and blacklist of acceptable behaviors, the proposed Xen CoC only has a =
blacklist. &nbsp;Although you say the CoC is not a legal document, the =
proposed Xen statement of acceptable behaviors does mention "applicable =
laws", which is absent from Contributor =
Covenant.</span></div></div></blockquote><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Without=
 getting into the merits of Contributor Covenant, there is value in =
reusing an "upstream CoC" that has been vetted by many organizations and =
is being continually tested in the real world. &nbsp;</div><div =
dir=3D"ltr" style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br class=3D""></div><div dir=3D"ltr" =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Similar=
 to the "macro supply chain" topic: &nbsp;if Xen Project must make =
changes to the upstream CoC, these can be done as a logical patch =
(rather than an orphaned fork) so we can incorporate upstream =
improvements. &nbsp;The rationale for each diff against the upstream CoC =
can be in a revision-controlled doc, so that future CoC maintainers =
understand the reasoning behind each diff, as communities and =
contributors evolve.</div></div></blockquote><div><br =
class=3D""></div><div>I think at this stage I would like to hear the =
opinions of others, as there was quite a bit of discussion that led us =
to where we are and some people looked into this aside from =
me</div><div><br class=3D""></div><div>I think all of your concerns can =
be addressed either way by modifying the proposal or modifying the =
covenant</div><div><br class=3D""></div><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span class=3D""></span><span =
class=3D"">Are there upstream examples of electoral governance for "CoC =
teams", or would we need to develop that from scratch? =
&nbsp;</span></div></div></blockquote><div><br class=3D""></div><div>We =
don't need to invent anything, we can use our standard election process =
if we need too. It's designed to be applicable for all kind of roles in =
the community</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span class=3D"">Xen Summit design =
session notes say:&nbsp;</span></div><div dir=3D"ltr" =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">"<span =
style=3D"background-color: rgba(255, 255, 255, 0);" class=3D"">An area =
for discussion which was not quite agreed upon pending an initial =
proposal was how we would approach the handling of =
issues</span></div><div dir=3D"ltr" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><ul style=3D"list-style-type: square; =
margin: 0.3em 0px 0px 1.6em; padding: 0px; list-style-image: =
url(&quot;data:image/svg+xml,%3Csvg =
xmlns=3D%22http://www.w3.org/2000/svg%22 width=3D%225%22 height=3D%2213%22=
 viewBox=3D%220 0 1.323 3.44%22%3E %3Cpath fill=3D%22%23638c9c%22 =
d=3D%22M0 1.852v1.323h1.323V1.852z%22/%3E %3C/svg%3E&quot;);" =
class=3D""><li style=3D"margin-bottom: 0.1em;" class=3D""><span =
style=3D"background-color: rgba(255, 255, 255, 0);" class=3D"">A =
committee</span></li><li style=3D"margin-bottom: 0.1em;" class=3D""><span =
style=3D"background-color: rgba(255, 255, 255, 0);" class=3D"">Probably =
2-3 people of different backgrounds maybe from different =
subprojects"</span></li></ul><div class=3D""><br class=3D""></div><div =
class=3D"">Could we also include existing Xen project leadership in the =
CoC team? &nbsp;How would selection of people for a CoC team differ from =
the existing process for selecting committers, =
etc?</div></div></div></blockquote></div><div><br class=3D""></div><div>I =
was actually thinking that the CoC team would be made up of members =
of</div><div>* Xen project leadership from different sub-projects (not =
just the Hypervisor committers).&nbsp;</div><div>&nbsp; Rationale: the =
CoC is project wide, not specific to xen-devel@</div><div>&nbsp; And we =
have some leadership team members which do not want to have to deal with =
CoC issues</div><div>* Advisory Board members (if one wanted to =
volunteer)&nbsp;</div><div>* Optionally we could use the normal election =
process to elect someone who is not a leadership team member. Rationale: =
diversity - it would be nice to have a women on the team such that we =
don't get blind sighted should an issue occur. But we don't currently =
have female leadership team members. Mirage OS is an exception, but =
Mirage OS does not fully follow our conventions in electing leadership =
team members</div><div><br class=3D""></div><div>In any case: I think I =
need to hear more different views</div><div><br =
class=3D""></div><div>Lars</div><div><br class=3D""></div><div><br =
class=3D""></div><br class=3D""></body></html>=

--Apple-Mail=_748D99A3-F002-4690-AF5E-8DE682EE08C6--


--===============5797867263751825702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5797867263751825702==--

