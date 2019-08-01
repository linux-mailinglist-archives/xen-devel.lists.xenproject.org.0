Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672827DD34
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:02:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htBby-0002Eu-8c; Thu, 01 Aug 2019 13:59:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ofpL=V5=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1htBbw-0002Eh-5m
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 13:59:16 +0000
X-Inumbo-ID: 8b0c6985-b464-11e9-8980-bc764e045a96
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8b0c6985-b464-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 13:59:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w20so69246784edd.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 06:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=rv/H/hMyQhghpYVpHdsZPv4+DPLjl0X8Toc4ot4uRxU=;
 b=XSmpfaFCaTFaUlifI2cSKybCPucvt24mmaS/SjEjdwkkDJ9vLsDWMqeIzJOrE/lbBD
 vnJyvK7hjTGFMevD6cagxlj0HIEz/8/4kbiC5FJnidWo59hZeG7jurMeZUWI0vHBgIIB
 iTAsVrQr0HLc9NW5++Gf1wfip8Y7USXLblC+h4KgHbbnPmFZ2fHGzztRtgG9uD6X7IFZ
 T4EqAR/FGROtTflc0K8u8DMspVgts06VFWbu75GVz+Pf9Ry1r7uzHGX3n06rBwUGI2/1
 PEqA7PNAjZ/L8B531IZ5i5kFlFTAqXg6YsguzQ1LyUbftXshgqt1RhO0fFpseu7uiYkU
 XFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=rv/H/hMyQhghpYVpHdsZPv4+DPLjl0X8Toc4ot4uRxU=;
 b=mlHW4TKDpsJrNYrU4P8a/rgDLQ6NPbg+F9c1tMDM7yKhNsoQdvGTaO5xeMFfHOQasR
 KA6SIukaHZfkiImLfke6SHn8qIUOXwtJY2k+X/DovT6MM49lc2xqcEBGp8jsWwHkGCmM
 9IpEL7VeNLHGRPrzbV9OTm8f5QlFKZdDKFYsRkaXVMYRWtrRwnFAULyAF6sgoKGLUew6
 bcrKEbKOlvzL/EuF+t9o4wwERJZKAWwDNhC8VHzV9/Y5DULYGp5/orxYhCtYZZ/v4zYg
 KJYvhWnED2qSrAUkXRWZjCarxK5K22NSiMAvMGk1UZJGeBC9t0WBPi/RH/hVaaMW2GPf
 0K/Q==
X-Gm-Message-State: APjAAAVnvpnLh0SVRNnEj71u4yLCOOKIfRs42uAW0C/g8O9p86Iu3LT+
 TukzdmGIBD2Fx+O10ngLDFs=
X-Google-Smtp-Source: APXvYqwZsipA5ZK1hGtLE+mIPxXKNxGEkZNwUsXB52Pb0ewjH1DeSM5JIki/DyR2HUHwasFwNcfbfg==
X-Received: by 2002:a17:907:447e:: with SMTP id
 oo22mr80313110ejb.169.1564667952614; 
 Thu, 01 Aug 2019 06:59:12 -0700 (PDT)
Received: from [10.80.118.76] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id j30sm17672355edb.8.2019.08.01.06.59.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 06:59:12 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Message-Id: <269AA3CE-4B2D-4651-B65D-907E64B43473@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Thu, 1 Aug 2019 14:59:10 +0100
In-Reply-To: <c7ce6c8d-3b79-8510-a4df-9d95e3adc6c0@arm.com>
To: Julien Grall <julien.grall@arm.com>
References: <20190731102856.23215-1-viktor.mitin.19@gmail.com>
 <878sseieu1.fsf@epam.com>
 <CAOcoXZatOXLnvYjum+EGCwnxDRUG1eGJbeENQcSyNYX6JXFizw@mail.gmail.com>
 <15e988be-80bd-f729-ea39-8e7cbc16007f@arm.com>
 <CAOcoXZZbu5-RSJxM8jzDh4EQbq8O11prOkJfrrzqWT45ppCzFQ@mail.gmail.com>
 <c7ce6c8d-3b79-8510-a4df-9d95e3adc6c0@arm.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/arm: extend
 fdt_property_interrupts
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <Viktor_Mitin@epam.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: multipart/mixed; boundary="===============4821651692112625668=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4821651692112625668==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_92857747-0EC5-4B90-8B59-184AC2F50A9D"


--Apple-Mail=_92857747-0EC5-4B90-8B59-184AC2F50A9D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 1 Aug 2019, at 13:41, Julien Grall <julien.grall@arm.com> wrote:
>=20
> Hi Viktor,
>=20
> On 01/08/2019 13:26, Viktor Mitin wrote:
>> Hi Julien and Volodymyr,
>> On Wed, Jul 31, 2019 at 3:52 PM Julien Grall <julien.grall@arm.com> =
wrote:
>>>=20
>>> Hi,
>>>=20
>>>>> It is recommended (and probably required, but I can't find exact =
place
>>>>> in the rules) to include cover letter if you are sending more that =
one
>>>>> patch in series. This will ease up review process, because =
reviewer will
>>>>> know what to expect in the series.
>>>>  > There is no such requirement, only recommendation.
>>>=20
>>> It is a strong recommendation: "If you need to send more than one =
patches (which
>>> normally means you're sending a patch series with cover letter),".
>>>=20
>>>> I did not put it since this is simple short patch series and both
>>>> patches in this series have been discussed previously, so it is =
known
>>>> what it is about.
>>>=20
>>> For a first, if you don't have a cover letter then the threading in =
e-mail
>>> client would look weird:
>>>     [PATCH v4 1/2] xen/arm: extend fdt_property_interrupts
>>>        |-> [PATCH v4 2/2] xen/arm: merge make_timer_node and =
make_timer_domU_node
>>>=20
>>> I tend to hid anything within the thread so I have only one title. =
For the title
>>> it is not clear to me what's the purpose of the e-mail.
>>>=20
>>> The cover letter is also used to keep a summary of what was =
discussed and the
>>> overall goal. It does not matter if it is just a few lines. This is =
also a good
>>> place to have a discussion of the overall series (i.e not specific =
to a patch).
>>>=20
>>> Lastly, you may have new reviewers that haven't followed the =
previous
>>> discussion. You have also reviewers like me which receive a few =
hundreds e-mails
>>> per week (just counting my inbox so e-mail I am CCed to). While I =
have a good
>>> memory, I can't possibly remember everything single e-mails.
>>>=20
>>> So the cover letter is a good place to explain what changes have =
been done
>>> between series. You can also do that per-patch.
>>>=20
>>> Speaking about changelog, I would highly recommend to keep all the =
changelog
>>> from v1. This gives us an idea what happen over the review.
>> Thank you for this great and detailed argumentation provided. It =
makes
>> sense, so probably Xen patches wiki should be updated with this
>> information and cover letter should become not a recommendation, but =
a
>> rule.
>=20
> Update to the wiki are always welcomed.

I still have an action to rework =
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches =
<https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches>=C2=A0and=
 <https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patchesand> =
migrate the content to the sphinx docs

@Victor: can you quickly point out where we recommend to use cover =
letters (if you remember). I thought it was a requirement

Lars


--Apple-Mail=_92857747-0EC5-4B90-8B59-184AC2F50A9D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 1 Aug 2019, at 13:41, Julien Grall &lt;<a =
href=3D"mailto:julien.grall@arm.com" =
class=3D"">julien.grall@arm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Hi =
Viktor,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
none; float: none; display: inline !important;" class=3D"">On 01/08/2019 =
13:26, Viktor Mitin wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Hi Julien and Volodymyr,<br =
class=3D"">On Wed, Jul 31, 2019 at 3:52 PM Julien Grall &lt;<a =
href=3D"mailto:julien.grall@arm.com" =
class=3D"">julien.grall@arm.com</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D""><br class=3D"">Hi,<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D"">It is recommended (and probably required, but I can't find =
exact place<br class=3D"">in the rules) to include cover letter if you =
are sending more that one<br class=3D"">patch in series. This will ease =
up review process, because reviewer will<br class=3D"">know what to =
expect in the series.<br class=3D""></blockquote>&nbsp;&gt; There is no =
such requirement, only recommendation.<br class=3D""></blockquote><br =
class=3D"">It is a strong recommendation: "If you need to send more than =
one patches (which<br class=3D"">normally means you're sending a patch =
series with cover letter),".<br class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D"">I did not put it since this is simple short =
patch series and both<br class=3D"">patches in this series have been =
discussed previously, so it is known<br class=3D"">what it is about.<br =
class=3D""></blockquote><br class=3D"">For a first, if you don't have a =
cover letter then the threading in e-mail<br class=3D"">client would =
look weird:<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;[PATCH v4 1/2] =
xen/arm: extend fdt_property_interrupts<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-&gt; [PATCH v4 =
2/2] xen/arm: merge make_timer_node and make_timer_domU_node<br =
class=3D""><br class=3D"">I tend to hid anything within the thread so I =
have only one title. For the title<br class=3D"">it is not clear to me =
what's the purpose of the e-mail.<br class=3D""><br class=3D"">The cover =
letter is also used to keep a summary of what was discussed and the<br =
class=3D"">overall goal. It does not matter if it is just a few lines. =
This is also a good<br class=3D"">place to have a discussion of the =
overall series (i.e not specific to a patch).<br class=3D""><br =
class=3D"">Lastly, you may have new reviewers that haven't followed the =
previous<br class=3D"">discussion. You have also reviewers like me which =
receive a few hundreds e-mails<br class=3D"">per week (just counting my =
inbox so e-mail I am CCed to). While I have a good<br class=3D"">memory, =
I can't possibly remember everything single e-mails.<br class=3D""><br =
class=3D"">So the cover letter is a good place to explain what changes =
have been done<br class=3D"">between series. You can also do that =
per-patch.<br class=3D""><br class=3D"">Speaking about changelog, I =
would highly recommend to keep all the changelog<br class=3D"">from v1. =
This gives us an idea what happen over the review.<br =
class=3D""></blockquote>Thank you for this great and detailed =
argumentation provided. It makes<br class=3D"">sense, so probably Xen =
patches wiki should be updated with this<br class=3D"">information and =
cover letter should become not a recommendation, but a<br =
class=3D"">rule.<br class=3D""></blockquote><br style=3D"caret-color: =
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
class=3D"">Update to the wiki are always welcomed.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><br class=3D""></div><div>I still =
have an action to rework&nbsp;<a =
href=3D"https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches" =
class=3D"">https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches=
</a><a =
href=3D"https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patchesand=
" class=3D"">&nbsp;and</a>&nbsp;migrate the content to the sphinx =
docs</div><div><br class=3D""></div><div>@Victor: can you quickly point =
out where we recommend to use cover letters (if you remember). I thought =
it was a requirement</div><div><br class=3D""></div><div>Lars</div><br =
class=3D""></body></html>=

--Apple-Mail=_92857747-0EC5-4B90-8B59-184AC2F50A9D--


--===============4821651692112625668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4821651692112625668==--

