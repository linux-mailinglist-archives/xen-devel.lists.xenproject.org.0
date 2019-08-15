Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC7D8EEFA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 17:02:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyHDC-0007Qk-Hp; Thu, 15 Aug 2019 14:58:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T442=WL=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hyHDA-0007Qa-Oa
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 14:58:44 +0000
X-Inumbo-ID: 2c85e00a-bf6d-11e9-a661-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c85e00a-bf6d-11e9-a661-bc764e2007e4;
 Thu, 15 Aug 2019 14:58:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l2so1511917wmg.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2019 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:in-reply-to:date:cc:message-id:references
 :to; bh=bj60lLfC9dmHs/fXB6Wh7xYw8KZRgncwn1hYYUquIZw=;
 b=ghyfHpYwJqTklV2TCGFXS4iNbubRXp3oEz4lPTGbX9NYZd4WXQkNO1i6/cAfKDbThu
 ZnF9lMUBaFoo8Q6XSlsZendy9AJ5c4zuutRN7y1dQfLfIW/xAKF///sXymAVoh535mx/
 J6awhRNuLiTnX8Yi4RrmWXcRNh+YAlyrcdGe6wgCi4mG607oZwKW7jxl1cSAhHKQyO1w
 e7mRVRlihYu5fsQqgfxQzITPdqf1Tgr0BomxuCNuKIO5Gv2BQsAjyzS8+U0BTAcm3SN8
 m/jvF/JKA9CTWu8jUcGaZ8Dpm3hi4fT7tI5OWhVqq0uwo0G7Nj1mPoNkfFc0hoaPrGXz
 kV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :message-id:references:to;
 bh=bj60lLfC9dmHs/fXB6Wh7xYw8KZRgncwn1hYYUquIZw=;
 b=ncev4UkL7WC4zwTv5dubC125Ky34M5OUuqCSh9knifmQsQ3+tMOYPVZu1gb+JGqj/p
 BcOejIWgcZpzk+gnnn4TRzON7Pe1Uvn5QucJ5I5vUbub3hz7n7C27Qvu8xeREnkUlNSK
 nEaq0OZQWpEDpQzhxWfo8y5aPUAIpk6iL9p7lmnXfxaUGJJTUkFyJ6758S/TL+rBTQYK
 8rTSjhWVnd5Pi+GPqWGzvWG72zjnu4KUqJq7BruBMEdvoGqwGOlTwhN/LazU7/mmkVvW
 4HGxQhLhB8wI1RSOpSTMEEz9RxqMUxmbQ7sW70BxO+JnfyhGMj9KRcDNrG8vD/8o+IeU
 jNSQ==
X-Gm-Message-State: APjAAAVGqgoMH6cCH/2vZuOZow/4rkXg1rJplj0gCAfEZCMUgmAspD0E
 yr1VQwB/1JJmfk0uJL7L6U8=
X-Google-Smtp-Source: APXvYqyQkvDu+CSrx/VGzf8YRE3ih55Jg2+0IxOeI6dSEptM0/ZM+SR4K4V7SLd+0/mujNbqVcNoig==
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr2905076wmi.61.1565881122100; 
 Thu, 15 Aug 2019 07:58:42 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:2846:9773:abb7:590b?
 ([2a02:c7f:ac18:da00:2846:9773:abb7:590b])
 by smtp.gmail.com with ESMTPSA id u129sm2298049wmb.12.2019.08.15.07.58.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 07:58:41 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
In-Reply-To: <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
Date: Thu, 15 Aug 2019 15:58:40 +0100
Message-Id: <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
To: Julien Grall <julien.grall@arm.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
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
 mpohlack@amazon.de, Ross Lagerwall <ross.lagerwall@citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3036786367618834208=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3036786367618834208==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C5C3E986-C106-4B44-9D65-177B085477CB"


--Apple-Mail=_C5C3E986-C106-4B44-9D65-177B085477CB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 15 Aug 2019, at 12:38, Julien Grall <julien.grall@arm.com> wrote:
>=20
> Hi,
>=20
> I am not going to answer on the patch itself but the process.
>=20
> Any series (i.e more than one patch) should contain a cover letter =
with a rough summary of the goal of the series.
>=20
> Furthermore, this 3 patches series has been received as 3 separate =
threads (i.e in-reply-to is missing). This is making difficult to know =
that all the patches belongs to the same series. In general, all patches =
are send as in-reply-to the cover letter. So all the patches sticks =
together in one thread.
>=20
> The cover letter can be generated via git format-patch --cover-letter. =
Threading is done automatically with git-send-email when all the patches =
as passed in arguments.
>=20
> For more details how to do it, you can read:
>=20
> =
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a_=
Patch_Series =
<https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a=
_Patch_Series>
>=20
> Cheers,

Hi Pawel,=20

thank you for submitting the patch series.=20

We had a couple of new starters recently who followed a similar pattern =
to you. As a result of this, I recently updated the following docs

https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches =
<https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches> - =
Definitions and general workflow
The bit which saves the most work is =
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a_=
Patch_Series =
<https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a=
_Patch_Series>
As for Julien's comment on the threading: see the --thread and =
--cover-letter option as described in the Sending a Patch Series

https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git =
<https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git> - Basic =
Git commands fitting into the workflow, including how to deal with =
reviews
https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_StGit =
<https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_StGit> - =
Basic StGit commands fitting into the workflow, including how to deal =
with reviews
I have not had time to play with git series yet. If anyone in your team =
uses it let me know

In any case: if you follow the instructions the entire submission =
process and dealing with review comments becomes much easier.=20

As a newcomer, to contributing to Xen, I would greatly appreciate if you =
could let me know of any issues with the docs, such that we can fix them

Regards
Lars




--Apple-Mail=_C5C3E986-C106-4B44-9D65-177B085477CB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 15 Aug 2019, at 12:38, Julien Grall &lt;<a =
href=3D"mailto:julien.grall@arm.com" =
class=3D"">julien.grall@arm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Hi,</span><br =
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
none; float: none; display: inline !important;" class=3D"">I am not =
going to answer on the patch itself but the process.</span><br =
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
none; float: none; display: inline !important;" class=3D"">Any series =
(i.e more than one patch) should contain a cover letter with a rough =
summary of the goal of the series.</span><br style=3D"caret-color: =
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
class=3D"">Furthermore, this 3 patches series has been received as 3 =
separate threads (i.e in-reply-to is missing). This is making difficult =
to know that all the patches belongs to the same series. In general, all =
patches are send as in-reply-to the cover letter. So all the patches =
sticks together in one thread.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
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
class=3D"">The cover letter can be generated via git format-patch =
--cover-letter. Threading is done automatically with git-send-email when =
all the patches as passed in arguments.</span><br style=3D"caret-color: =
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
class=3D"">For more details how to do it, you can read:</span><br =
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
none;" class=3D""><a =
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
class=3D"">Cheers,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Hi Pawel,&nbsp;</div><div><br =
class=3D""></div><div>thank you for submitting the patch =
series.&nbsp;</div><div><br class=3D""></div><div>We had a couple of new =
starters recently who followed a similar pattern to you. As a result of =
this, I recently updated the following docs</div><div><br =
class=3D""></div><div><a =
href=3D"https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches" =
class=3D"">https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches=
</a>&nbsp;- Definitions and general workflow</div><div>The bit which =
saves the most work is&nbsp;<a =
href=3D"https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Se=
nding_a_Patch_Series" =
class=3D"">https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches=
#Sending_a_Patch_Series</a></div><div>As for Julien's comment on the =
threading: see the&nbsp;--thread and --cover-letter option as described =
in the Sending a Patch Series</div><div><br class=3D""></div><div><a =
href=3D"https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git" =
class=3D"">https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git<=
/a>&nbsp;- Basic Git commands fitting into the workflow, including how =
to deal with reviews</div><div><a =
href=3D"https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_StGit" =
class=3D"">https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_StGi=
t</a>&nbsp;- Basic StGit commands fitting into the workflow, including =
how to deal with reviews</div><div>I have not had time to play with git =
series yet. If anyone in your team uses it let me know</div><div><br =
class=3D""></div><div>In any case: if you follow the instructions the =
entire submission process and dealing with review comments becomes much =
easier.&nbsp;</div><div><br class=3D""></div><div>As a newcomer, to =
contributing to Xen, I would greatly appreciate if you could let me know =
of any issues with the docs, such that we can fix them</div><div><br =
class=3D""></div><div>Regards</div><div>Lars</div><div><br =
class=3D""></div><div><br class=3D""></div><div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_C5C3E986-C106-4B44-9D65-177B085477CB--


--===============3036786367618834208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3036786367618834208==--

