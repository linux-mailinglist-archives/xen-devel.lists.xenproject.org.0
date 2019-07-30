Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA58A7A6DA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 13:26:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsQDa-0000EG-9R; Tue, 30 Jul 2019 11:22:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hds6=V3=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hsQDY-0000D9-CL
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 11:22:56 +0000
X-Inumbo-ID: 5f638104-b2bc-11e9-8980-bc764e045a96
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5f638104-b2bc-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 11:22:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w9so45075799wmd.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2019 04:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=4bF5vM9T08woYuiTJqde+/KYjqB30EqNWqNaZccXHOo=;
 b=cdGQWvFD6g/DOBU3yMInuyZFZzbC1hPmUj5ycvct9PY8+yAQ2oq82Ki7NovJAXRwcz
 05BHjETlbGoBmpoInSwd97eElPIlcjLM2SMdJq68lNbxSIpINUudgyP64V1lkIi8CAf/
 7DLH3DVgHrt9Uq5iPkCUiRofuHkf+dv0XgPqt8JT0UhM7Iuu6UGHlD/awpAaci34W8jo
 8hhGmnjIlzUuPQvUCdtgCzSyV2Cvy7EgoyOgOvEzUfAzMGd5JNi6zaPsGK4UcHWNFwuf
 ejhRj9DCRPTRyF296Fb82gxD6vsCXlVQGR6WCbGZDYuMIhzBdEgFFLQYsvXSZpDbHM3w
 a97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=4bF5vM9T08woYuiTJqde+/KYjqB30EqNWqNaZccXHOo=;
 b=t3ipc+l54y5rYB0QY4aCWLDkGNX6nKbHNkmUmbDxnI6EkmFRlosRfVTyVzozr1Thw5
 TsUfpwKeVpRhqLGhKMIrCUHX5F4WrNGTouTR4bGry288r1FW55j82nf7M49b4rmJ8vn+
 05cgTKgry5WdPWuBVm54vlmZSoOTvWj/hHBBuTOLsYV26js+sDV4PsRuts7AQOaFxNT6
 Bgj69Ij1x3XqW3oupoGXrsojpOgjke4zzRRG14G0t8+j/ncxdg2UsoyIycbIW215x89n
 8dUmzflMWuiCYz2Kz2AqYEWY8dWSI9KQL0LB1fqujZbz1yPSjnbRQpSCOMfM5y1pddZA
 IDtw==
X-Gm-Message-State: APjAAAV6hVCNGPmII2hIhDN2W1CX4FjHNcKMSKTsTaxVqzRxc3xLVdir
 jVVmp4IoXqaa/wCnzJ8iXok=
X-Google-Smtp-Source: APXvYqzH5R7YfP4RYvP+fIclRAYXSW3J9UtzFCnrTZ/PHB4hde3VvtBO+3dyNabt4zH9Hww3Vjg5pA==
X-Received: by 2002:a1c:9a4b:: with SMTP id c72mr4921601wme.102.1564485772355; 
 Tue, 30 Jul 2019 04:22:52 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:a16d:67c8:4916:3a70?
 ([2a02:c7f:ac18:da00:a16d:67c8:4916:3a70])
 by smtp.gmail.com with ESMTPSA id u18sm51296667wmd.19.2019.07.30.04.22.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 04:22:51 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Message-Id: <9BB67D01-4F6E-43DA-B080-2EA26AA67C43@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Tue, 30 Jul 2019 12:22:49 +0100
In-Reply-To: <47da6b72-614f-b29b-7357-ec6ea0bd3a17@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
 <5e5c945a-6bdb-2776-e2db-b11bbeb74bf5@suse.com>
 <d216b609-353d-e4c7-fdea-e2e63b175bb8@arm.com>
 <6b786dc3-f6d0-8536-0291-4f0de7f673b8@suse.com>
 <3dc11cbc-97a1-dae7-eba0-1bb0f8151244@arm.com>
 <47da6b72-614f-b29b-7357-ec6ea0bd3a17@citrix.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] [PATCH] Intel TXT: add reviewer,
 move to Odd Fixes state
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Committers <committers@xenproject.org>,
 'Jan Beulich' <JBeulich@suse.com>, Lukasz Hawrylko <lukasz.hawrylko@intel.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1482323938107808492=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1482323938107808492==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_994F8CAF-50DA-44E2-9332-AE1E191FFCFE"


--Apple-Mail=_994F8CAF-50DA-44E2-9332-AE1E191FFCFE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 30 Jul 2019, at 11:08, George Dunlap <george.dunlap@citrix.com> =
wrote:
>=20
> On 7/30/19 10:54 AM, Julien Grall wrote:
>> Hi Jan,
>>=20
>> On 30/07/2019 10:05, Jan Beulich wrote:
>>> On 30.07.2019 10:54, Julien Grall wrote:
>>>> On 7/30/19 9:29 AM, Jan Beulich wrote:
>>>>> On 30.07.2019 08:56, Lukasz Hawrylko wrote:
>>>>>> Support for Intel TXT has orphaned status right now because
>>>>>> no active maintainter is listed. Adding myself as reviewer
>>>>>> and moving it to Odd Fixes state.
>>>>>>=20
>>>>>> Signed-off-by: Lukasz Hawrylko <lukasz.hawrylko@intel.com>
>>>>>> ---
>>>>>>     MAINTAINERS | 3 ++-
>>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>=20
>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>> index 89a01b710b..ca300e87c8 100644
>>>>>> --- a/MAINTAINERS
>>>>>> +++ b/MAINTAINERS
>>>>>> @@ -240,7 +240,8 @@ S:    Maintained
>>>>>>   F:    tools/golang
>>>>>>   INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
>>>>>> -S:    Orphaned
>>>>>> +R:    Lukasz Hawrylko <lukasz.hawrylko@intel.com>
>>>>>> +S:    Odd Fixes
>>>>>=20
>>>>> I guess we should give it a few days for objections to be raised
>>>>> against this slightly inconsistent state, but I think that's the
>>>>> best way to express the current state of things (hence my
>>>>> suggestion to this effect). If no objections turn up, I've queued
>>>>> this onto my to-be-committed list.
>>>>=20
>>>> I have some objections regarding the process itself... On the first
>>>> version of this patch, it was pointed out that the e-mail shouldn't
>>>> be sent with disclaimer. This is now the third version and the
>>>> disclaimer is still present.
>>>=20
>>> Okay, I must have missed both earlier requests to this effect. I've
>>> gone back to the list archives though, and I couldn't find any such
>>> request either from July or June. Therefore ...
>>=20
>> The first version was sent from March [1].
>>=20
>>>=20
>>>> Technically, no patch should be applied when there are a =
disclaimer.
>>>=20
>>> ... I'd also like to ask for the background of this. It would never
>>> have occurred to me that I should pay attention to possible
>>> disclaimers or alike on patch submissions.
>>=20
>> The disclaimer tell you this patch may contain confidential =
information
>> and you are not allowed to distribute it... While I agree this makes =
no
>> sense for public ML, we still have to stay on the safe side. How do =
you
>> know this was not sent by mistake? Note that this question makes =
little
>> sense on MAINTAINERS file...
>>=20
>> In general, I am following Greg KH advice here [2] and refrain to =
answer
>> any e-mail with disclaimer. I would actually advocate xen-devel to
>> completely block those e-mails.
>=20
> I think "refraining from answering" and "blocking from the list" is a
> bit too strong: after all, the disclamer does say "may", and it should
> be pretty clear that the "intended recipients" includes anyone on =
xen-devel.
>=20
> But for code itself, which will end up being used in the products of
> large corporations with deep pockets, I agree should be absolutely =
clear
> of legal doubt; as such, having such a disclaimer on the patches =
should
> be disallowed.  We get lots of patches from Intel folks which don't =
have
> the disclaimer at the bottom.
>=20
> Sorry to delay this simple change yet again.

+full committers list and Juergen=20

OK. We should have a separate discussion related to disclaimers: make a =
formal decision and afterwards document it in the contribution workflow. =
I agree that this makes sense, and this has been raised by Julien in the =
past privately related to questions on xen-devel@. It then turned out =
that Arm folks from China have consistently used disclaimers on =
contributions to mini-os and unikraft. This has stopped now, which is to =
Julien's credit. I suggested than that Julien should raise this issue =
formally as a policy change, which never happened.

I do not believe that we should block any patches from being applied due =
to disclaimers in absence of an agreed policy. Contributors sign a DCO =
and that may well override a disclaimer (we do not have access to the =
legal advice that Greg KH refers to). If there was a serious legal =
issue, the LF would have contacted all of its projects. And I also could =
not find any public reference to such an issue. This definitely =
something where the Advisory Board should have some input.

And in particular this patch also contains no code and should not be =
blocked on these grounds.

@Lukasz: please take note of this issue for the next time round. It =
should be easy enough to disable the disclaimer when sending to certain =
lists

To move forward:=20
* There should be a policy discussion
* There should be AB input
* The outcome should be documented in =
https://xenproject.org/help/contribution-guidelines/ =
<https://xenproject.org/help/contribution-guidelines/> and the git =
contribution workflow

Lars




--Apple-Mail=_994F8CAF-50DA-44E2-9332-AE1E191FFCFE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 30 Jul 2019, at 11:08, George Dunlap &lt;<a =
href=3D"mailto:george.dunlap@citrix.com" =
class=3D"">george.dunlap@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
7/30/19 10:54 AM, Julien Grall wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Hi Jan,<br class=3D""><br class=3D"">On =
30/07/2019 10:05, Jan Beulich wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">On 30.07.2019 10:54, Julien Grall wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">On 7/30/19 9:29 AM, Jan =
Beulich wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">On =
30.07.2019 08:56, Lukasz Hawrylko wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Support for Intel TXT has orphaned status right =
now because<br class=3D"">no active maintainter is listed. Adding myself =
as reviewer<br class=3D"">and moving it to Odd Fixes state.<br =
class=3D""><br class=3D"">Signed-off-by: Lukasz Hawrylko &lt;<a =
href=3D"mailto:lukasz.hawrylko@intel.com" =
class=3D"">lukasz.hawrylko@intel.com</a>&gt;<br class=3D"">---<br =
class=3D"">&nbsp;&nbsp;&nbsp; MAINTAINERS | 3 ++-<br =
class=3D"">&nbsp;&nbsp;&nbsp; 1 file changed, 2 insertions(+), 1 =
deletion(-)<br class=3D""><br class=3D"">diff --git a/MAINTAINERS =
b/MAINTAINERS<br class=3D"">index 89a01b710b..ca300e87c8 100644<br =
class=3D"">--- a/MAINTAINERS<br class=3D"">+++ b/MAINTAINERS<br =
class=3D"">@@ -240,7 +240,8 @@ S:&nbsp;&nbsp;&nbsp; Maintained<br =
class=3D"">&nbsp; F:&nbsp;&nbsp;&nbsp; tools/golang<br class=3D"">&nbsp; =
INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)<br =
class=3D"">-S:&nbsp;&nbsp;&nbsp; Orphaned<br =
class=3D"">+R:&nbsp;&nbsp;&nbsp; Lukasz Hawrylko &lt;<a =
href=3D"mailto:lukasz.hawrylko@intel.com" =
class=3D"">lukasz.hawrylko@intel.com</a>&gt;<br =
class=3D"">+S:&nbsp;&nbsp;&nbsp; Odd Fixes<br class=3D""></blockquote><br =
class=3D"">I guess we should give it a few days for objections to be =
raised<br class=3D"">against this slightly inconsistent state, but I =
think that's the<br class=3D"">best way to express the current state of =
things (hence my<br class=3D"">suggestion to this effect). If no =
objections turn up, I've queued<br class=3D"">this onto my =
to-be-committed list.<br class=3D""></blockquote><br class=3D"">I have =
some objections regarding the process itself... On the first<br =
class=3D"">version of this patch, it was pointed out that the e-mail =
shouldn't<br class=3D"">be sent with disclaimer. This is now the third =
version and the<br class=3D"">disclaimer is still present.<br =
class=3D""></blockquote><br class=3D"">Okay, I must have missed both =
earlier requests to this effect. I've<br class=3D"">gone back to the =
list archives though, and I couldn't find any such<br class=3D"">request =
either from July or June. Therefore ...<br class=3D""></blockquote><br =
class=3D"">The first version was sent from March [1].<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D""><blockquote=
 type=3D"cite" class=3D"">Technically, no patch should be applied when =
there are a disclaimer.<br class=3D""></blockquote><br class=3D"">... =
I'd also like to ask for the background of this. It would never<br =
class=3D"">have occurred to me that I should pay attention to =
possible<br class=3D"">disclaimers or alike on patch submissions.<br =
class=3D""></blockquote><br class=3D"">The disclaimer tell you this =
patch may contain confidential information<br class=3D"">and you are not =
allowed to distribute it... While I agree this makes no<br =
class=3D"">sense for public ML, we still have to stay on the safe side. =
How do you<br class=3D"">know this was not sent by mistake? Note that =
this question makes little<br class=3D"">sense on MAINTAINERS file...<br =
class=3D""><br class=3D"">In general, I am following Greg KH advice here =
[2] and refrain to answer<br class=3D"">any e-mail with disclaimer. I =
would actually advocate xen-devel to<br class=3D"">completely block =
those e-mails.<br class=3D""></blockquote><br class=3D"">I think =
"refraining from answering" and "blocking from the list" is a<br =
class=3D"">bit too strong: after all, the disclamer does say "may", and =
it should<br class=3D"">be pretty clear that the "intended recipients" =
includes anyone on xen-devel.<br class=3D""><br class=3D"">But for code =
itself, which will end up being used in the products of<br =
class=3D"">large corporations with deep pockets, I agree should be =
absolutely clear<br class=3D"">of legal doubt; as such, having such a =
disclaimer on the patches should<br class=3D"">be disallowed. &nbsp;We =
get lots of patches from Intel folks which don't have<br class=3D"">the =
disclaimer at the bottom.<br class=3D""><br class=3D"">Sorry to delay =
this simple change yet again.<br class=3D""></div></div></blockquote><br =
class=3D""></div><div>+full committers list and =
Juergen&nbsp;</div><div><br class=3D""></div><div>OK. We should have a =
separate discussion related to disclaimers: make a formal decision and =
afterwards document it in the contribution workflow. I agree that this =
makes sense, and this has been raised by Julien in the past privately =
related to questions on xen-devel@. It then turned out that Arm folks =
from China have consistently used disclaimers on contributions to =
mini-os and unikraft. This has stopped now, which is to Julien's credit. =
I suggested than that Julien should raise this issue formally as a =
policy change, which never happened.</div><div><br class=3D""></div><div>I=
 do not believe that we should block any patches from being applied due =
to disclaimers in absence of an agreed policy. Contributors sign a DCO =
and that may well override a disclaimer (we do not have access to the =
legal advice that Greg KH refers to). If there was a serious legal =
issue, the LF would have contacted all of its projects. And I also could =
not find any public reference to such an issue. This definitely =
something where the Advisory Board should have some input.</div><div><br =
class=3D""></div><div>And in particular this patch also contains no code =
and should not be blocked on these grounds.</div><div><br =
class=3D""></div><div>@Lukasz: please take note of this issue for the =
next time round. It should be easy enough to disable the disclaimer when =
sending to certain lists</div><div><br class=3D""></div><div>To move =
forward:&nbsp;</div><div>* There should be a policy =
discussion</div><div>* There should be AB input</div><div>* The outcome =
should be documented in&nbsp;<a =
href=3D"https://xenproject.org/help/contribution-guidelines/" =
class=3D"">https://xenproject.org/help/contribution-guidelines/</a>&nbsp;a=
nd the git contribution workflow</div><div><br =
class=3D""></div><div>Lars</div><div><br class=3D""></div><div><br =
class=3D""></div><div class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_994F8CAF-50DA-44E2-9332-AE1E191FFCFE--


--===============1482323938107808492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1482323938107808492==--

