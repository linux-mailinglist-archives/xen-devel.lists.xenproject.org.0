Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C07C8B3
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 18:31:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsrSK-0001xm-Cg; Wed, 31 Jul 2019 16:28:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7/lg=V4=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hsrSI-0001xh-40
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 16:27:58 +0000
X-Inumbo-ID: 2617b851-b3b0-11e9-8980-bc764e045a96
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2617b851-b3b0-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 16:27:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id u25so50052970wmc.4
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=84vadojVfPSerICFPqTIiSt5y1ok0UPSYvSgzqpJGr0=;
 b=KkacPp5akLoQEnwu9GnNqYvo2HbY1roamHkvPJIEJ+dFWm1/jlJuVRqQr+7rOBEdOr
 zCNFbSMpFWE8SqjA5yOvFmMlDH7qPP1Mlbm+WOMcIFWenWEHcFHb5o++Hrv7P3wxmA7Y
 b5YovJXMhpFwCpsHzJsNZe3DIctx2Je/n2saX5TpcOrZxPpiYfu9UsK27OEkk6sbMoIZ
 qxmecFCXAjdcUq6AG3zyzOXN6EADDgEJ91wnQx0vwpnqA4pVrARlOEZh68xCRUgqeouE
 5trw5rEEcl6VMxJ/5m71Id7EjN+lXctMecT0tcMpiTaNXLfucra8HFIhhKE66CYpgdhm
 H1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=84vadojVfPSerICFPqTIiSt5y1ok0UPSYvSgzqpJGr0=;
 b=pjH1ZzfMGOmGiUAF47VjhXNc5dn0K2tebPCeZAe9wsydMD3T2hrJMvpNzmF/VhHM3q
 8q6tRaONZfvQ21NYOeQCKqrAvQBMiGmkpJbRjxaMi89SQYent5yP1p5yN1l0lugZBVcy
 TQn0DoXnii4eW+y31RvPCGCSjBVtAJtttK2BF+HtV7oUwVkgVfBy3+/pGzEsGq4Z1FWO
 t3Ds05qZmXQNMXNd51cRp21oTQXAs8cw5qZgWMA9MRRE7DxT+EvrBwFPKDkbiiOuCfuM
 XYIzWYMkGxUvwBmzfcFiH3xdFGawQSFrauTUYnrI2wIUPliVjOIP/KtUBuSqT/thbeKs
 c0Tg==
X-Gm-Message-State: APjAAAWTHmeO3a6r3A7OxuqJCZnH6NOKhQPdUiHEgxstn+48dbd7eyob
 gn9mnRjxU6ZCz8LkU/OoRfo=
X-Google-Smtp-Source: APXvYqysWRxWVCk8PKIjjeXPysoYUTaPQnzJKQja699EYOecI70hgpsImjMGh2BmxfXinyXtOSeHSw==
X-Received: by 2002:a7b:c212:: with SMTP id x18mr109431921wmi.77.1564590473592; 
 Wed, 31 Jul 2019 09:27:53 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:10bb:ca7d:8e54:3e74?
 ([2a02:c7f:ac18:da00:10bb:ca7d:8e54:3e74])
 by smtp.gmail.com with ESMTPSA id v5sm83561437wre.50.2019.07.31.09.27.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 09:27:52 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <1CE4B542-C03C-4B21-AC92-145F7B9B63BB@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Wed, 31 Jul 2019 17:27:51 +0100
In-Reply-To: <CAOcoXZYKXqXa=M2LvcGMDrufh9snhSQvCX_qBFr63sn=fgDo=w@mail.gmail.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
 <ab635236-6dac-0f8f-8bab-46ccbc9d47e2@arm.com>
 <CAOcoXZYw0uC+2c5KAVMhvXRukYomAuhSVW=jWU3HH1sX6zgkaQ@mail.gmail.com>
 <685e081c-b374-7d66-4645-d6ee7a02f655@arm.com>
 <CAOcoXZZ5HWYrDEy966BN-Esaci2XD=H98kn1JNwjAU_DUW_Egg@mail.gmail.com>
 <d5e1b66e-4d94-6ec5-96e4-54fb77c44eaa@arm.com>
 <CAOcoXZbapuZ3FhDP2cZ+C9JEJwCZUp03h-6eTbynqk5RGWF+3g@mail.gmail.com>
 <efbb6de5-3454-ad61-e3e6-07c7bdb0def7@arm.com>
 <CAOcoXZYKXqXa=M2LvcGMDrufh9snhSQvCX_qBFr63sn=fgDo=w@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1436286670586541748=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1436286670586541748==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DBAC8EEE-2455-4A1C-A14B-C3EEFFABF734"


--Apple-Mail=_DBAC8EEE-2455-4A1C-A14B-C3EEFFABF734
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 31 Jul 2019, at 12:43, Viktor Mitin <viktor.mitin.19@gmail.com> =
wrote:
>=20
> On Wed, Jul 31, 2019 at 2:25 PM Julien Grall <julien.grall@arm.com =
<mailto:julien.grall@arm.com>> wrote:
>>=20
>>=20
>>=20
>> On 31/07/2019 12:16, Viktor Mitin wrote:
>>> On Mon, Jul 29, 2019 at 3:35 PM Julien Grall <julien.grall@arm.com> =
wrote:
>>>> On 7/29/19 1:21 PM, Viktor Mitin wrote:
>>>>> On Mon, Jul 29, 2019 at 1:49 PM Julien Grall =
<julien.grall@arm.com> wrote:
>>>>>> On 7/29/19 10:13 AM, Viktor Mitin wrote:
>>>>>>> On Fri, Jul 26, 2019 at 3:50 PM Julien Grall =
<julien.grall@arm.com> wrote:
>>>>>>>>=20
>>>>>>>> *****
>>>>>>>>=20
>>>>>>>> -    /* See linux
>>>>>>>> =
Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt */
>>>>>>>> +    /* See linux
>>>>>>>> +     * =
Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt */
>>>>>>>>=20
>>>>>>>> Multi-lines comment on Xen are using
>>>>>>>> /*
>>>>>>>>     * Foo
>>>>>>>>     * Bar
>>>>>>>>     */
>>>>>>>=20
>>>>>>> See my comment about clang-format supports only comments =
indentation for now.
>>>>>>=20
>>>>>> I saw it and I will reply here for simplicity. Having a automatic
>>>>>> checker that will do the wrong things is not ideal.
>>>>>>=20
>>>>>> Imagine we decide to use this checker as a part of the commit =
process.
>>>>>> This means that the code will be modified to checker coding style =
and
>>>>>> not Xen one.
>>>>>=20
>>>>> Well, you are right. Even more, unfortunately, there is no such =
coding
>>>>> style as 'bsd' in clang-format.
>>>>> So 'xen' clang-format style is based on the 'llvm' style.
>>>>=20
>>>> Do you have a pointer to the LLVM style?
>>>=20
>>> Sure, see the next links:
>>> =
https://github.com/viktor-mitin/xen-clang-format-example/blob/master/.clan=
g-format_llvm
>>> =
https://github.com/viktor-mitin/xen-clang-format-example/blob/master/.clan=
g-format_xen
>>=20
>> That's clang-format configuration not a write-up easily readable by =
human. It is
>> also does not say what will happen for the rest of the things not =
configured (if
>> there are any).
>=20
> Here is Clang-Format Style Options documentation:
> https://clang.llvm.org/docs/ClangFormatStyleOptions.html =
<https://clang.llvm.org/docs/ClangFormatStyleOptions.html>
>=20
> And LLVM Coding Standards documetation:
> https://llvm.org/docs/CodingStandards.html#introduction =
<https://llvm.org/docs/CodingStandards.html#introduction>
>=20
> Unfortunately, it seems it does not answer "what will happen for the
> rest of the things not configured (if there are any)"...
>=20
>=20
>>=20
>>>=20
>>>>=20
>>>> As I pointed out in a different thread, it woudl be easier to start =
from
>>>> an existing coding style (LLVM, BSD...) and decide whether you want =
to
>>>> fully adopt it or make changes.
>>>>=20
>>>> So someone needs to be pick one and look at the difference in style =
with
>>>> Xen. It seems you already done that job as you tweak it for Xen. Do =
you
>>>> have a write-up of the differences?
>>>=20
>>> Yes, it is done exactly this way you mentioned. New 'xen' format =
style
>>> is based on 'llvm'.
>>=20
>> Can you give a link to this write-up in a human readable way?
>=20
> The summary I wrote in the original mail in this thread describes what
> was done based on 'llvm' coding style of clang-format.
> I'm putting it here with update: added BreakStringLiterals thing to be =
fixed.
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
> - Set BreakStringLiterals to false (not explicitly covered by Xen
> coding style document for now)
>=20
>>=20
>>>=20
>>>>=20
>>>>>>>> I am not sure why clang-format decided to format like that. Do =
you know why?
>>>>>>>=20
>>>>>>> The reason is that there are two strings in one line. It would =
not
>>>>>>> change it if it were
>>>>>>> not "arm,psci-1.0""\0", but "arm,psci-1.0\0".
>>>>>>=20
>>>>>> I would like to see the exact part of the clang-format coding =
style
>>>>>> documentation that mention this requirements... The more that in =
an
>>>>>> example above (copied below for simplicity), there are two =
strings in on
>>>>>> line.
>>>>>=20
>>>>> The closest found seems BinPackParameters BinPackArguments,
>>>>> however, it is about function calls according to manual...
>>>>=20
>>>> Above, you mention the work is based on the LLVM coding style. Is =
there
>>>> anything in that coding style about the string?
>>>=20
>>> Well, not much. See clang-format configurator mentioned above.
>>> However, there is a useful clang BreakStringLiterals option.
>>> It should be turned off to follow your suggestion not to break =
string
>>> literal for grep use case.
>>=20
>> I am not speaking about clang-format itself but the LLVM coding =
style. I assume
>> there is a human readable coding style for LLVM, right? If so, is =
there any
>> section in it about string?
>=20
> See the link above. Unfortunately, it is about C++ and not about C.
> Seems there is no pure C support in clang-format.
>=20
>>=20
>>>=20
>>>>=20
>>>>>=20
>>>>>>=20
>>>>>>>> +    D11PRINT("Allocated %#" PRIpaddr "-%#" PRIpaddr
>>>>>>=20
>>>>>>=20
>>>>>>>=20
>>>>>>>>=20
>>>>>>>> *****
>>>>>>>>=20
>>>>>>>> -    clock_valid =3D dt_property_read_u32(dev, =
"clock-frequency",
>>>>>>>> -                                       &clock_frequency);
>>>>>>>> +    clock_valid =3D
>>>>>>>> +        dt_property_read_u32(dev, "clock-frequency", =
&clock_frequency);
>>>>>>>>=20
>>>>>>>> I am not sure why clang-format decide to format like that. The =
current version
>>>>>>>> is definitely valid.
>>>>>>>=20
>>>>>>> The current version is not valid as it takes 81 chars, while 79 =
is
>>>>>>> allowed according to coding style.
>>>>>>=20
>>>>>> Really? I looked at the code and this is 62 characters... It =
would be 81
>>>>>> characters if "&clock_frequency);" were on the same line. But see =
how it
>>>>>> is split in 2 lines.
>>>>>=20
>>>>> You are right, there are two lines. So it needs to find out how to
>>>>> configure or implement such a feature to ignore such cases.
>>>>=20
>>>> What's the LLVM coding style policy about this?
>>>=20
>>> Well, LLVM formats it as shown above. All the other 'native'
>>> clang-format styles behave similarly.
>>=20
>> This does not answer to my question. You pointed me how clang-format =
is
>> configured, not how the behavior of clang format for this particular =
case and
>> the developer documentation related to this.
>=20
> See the link above, hopefully it answers your question.
>=20
> Thanks

Viktor: thank you for spending time on this

I added an item to community call tomorrow and CC'ed you in the invite. =
So I think what we need to do is figure out a way on how to make the =
coding standard enforceable by a coding standard checker such as =
proposed here. AFAICT
* It seems there are some undocumented coding standard rules, which are =
essentially causing problems with the tool
* In addition, the fact that the LLVM coding style is the baseline for =
the checks may also create some problems with false standard violations

My instinct would be to try and document any undocumented rules on a =
scratch space (e.g. google doc), look at differences between Xen and =
LLVM formatting style and then make decisions using a voting mechanism =
to avoid bike-shedding. In some cases discussion may be necessary though

It would be good if you could attend, but I think we can do without you, =
if needed

Regards
Lars


--Apple-Mail=_DBAC8EEE-2455-4A1C-A14B-C3EEFFABF734
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 31 Jul 2019, at 12:43, Viktor Mitin &lt;<a =
href=3D"mailto:viktor.mitin.19@gmail.com" =
class=3D"">viktor.mitin.19@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On Wed, Jul =
31, 2019 at 2:25 PM Julien Grall &lt;</span><a =
href=3D"mailto:julien.grall@arm.com" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">julien.grall@arm.com</a><span =
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
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D""><br class=3D""><br class=3D"">On 31/07/2019 12:16, Viktor =
Mitin wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">On Mon, =
Jul 29, 2019 at 3:35 PM Julien Grall &lt;<a =
href=3D"mailto:julien.grall@arm.com" =
class=3D"">julien.grall@arm.com</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">On 7/29/19 1:21 PM, Viktor Mitin wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">On Mon, Jul 29, 2019 at =
1:49 PM Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com" =
class=3D"">julien.grall@arm.com</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">On 7/29/19 10:13 AM, Viktor Mitin wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">On Fri, Jul 26, 2019 at =
3:50 PM Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com" =
class=3D"">julien.grall@arm.com</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D""><br class=3D"">*****<br class=3D""><br =
class=3D"">- &nbsp;&nbsp;&nbsp;/* See linux<br =
class=3D"">Documentation/devicetree/bindings/interrupt-controller/arm,gic.=
txt */<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* See linux<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;* =
Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt */<br =
class=3D""><br class=3D"">Multi-lines comment on Xen are using<br =
class=3D"">/*<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;* Foo<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;* Bar<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;*/<br class=3D""></blockquote><br =
class=3D"">See my comment about clang-format supports only comments =
indentation for now.<br class=3D""></blockquote><br class=3D"">I saw it =
and I will reply here for simplicity. Having a automatic<br =
class=3D"">checker that will do the wrong things is not ideal.<br =
class=3D""><br class=3D"">Imagine we decide to use this checker as a =
part of the commit process.<br class=3D"">This means that the code will =
be modified to checker coding style and<br class=3D"">not Xen one.<br =
class=3D""></blockquote><br class=3D"">Well, you are right. Even more, =
unfortunately, there is no such coding<br class=3D"">style as 'bsd' in =
clang-format.<br class=3D"">So 'xen' clang-format style is based on the =
'llvm' style.<br class=3D""></blockquote><br class=3D"">Do you have a =
pointer to the LLVM style?<br class=3D""></blockquote><br class=3D"">Sure,=
 see the next links:<br class=3D""><a =
href=3D"https://github.com/viktor-mitin/xen-clang-format-example/blob/mast=
er/.clang-format_llvm" =
class=3D"">https://github.com/viktor-mitin/xen-clang-format-example/blob/m=
aster/.clang-format_llvm</a><br =
class=3D"">https://github.com/viktor-mitin/xen-clang-format-example/blob/m=
aster/.clang-format_xen<br class=3D""></blockquote><br class=3D"">That's =
clang-format configuration not a write-up easily readable by human. It =
is<br class=3D"">also does not say what will happen for the rest of the =
things not configured (if<br class=3D"">there are any).<br =
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
class=3D"">Here is Clang-Format Style Options documentation:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><a =
href=3D"https://clang.llvm.org/docs/ClangFormatStyleOptions.html" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://clang.llvm.org/docs/ClangFormatStyleOptions.html</a><br=
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
none; float: none; display: inline !important;" class=3D"">And LLVM =
Coding Standards documetation:</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><a =
href=3D"https://llvm.org/docs/CodingStandards.html#introduction" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://llvm.org/docs/CodingStandards.html#introduction</a><br =
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
none; float: none; display: inline !important;" class=3D"">Unfortunately, =
it seems it does not answer "what will happen for the</span><br =
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
none; float: none; display: inline !important;" class=3D"">rest of the =
things not configured (if there are any)"...</span><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D""><blockquote=
 type=3D"cite" class=3D""><br class=3D"">As I pointed out in a different =
thread, it woudl be easier to start from<br class=3D"">an existing =
coding style (LLVM, BSD...) and decide whether you want to<br =
class=3D"">fully adopt it or make changes.<br class=3D""><br class=3D"">So=
 someone needs to be pick one and look at the difference in style =
with<br class=3D"">Xen. It seems you already done that job as you tweak =
it for Xen. Do you<br class=3D"">have a write-up of the differences?<br =
class=3D""></blockquote><br class=3D"">Yes, it is done exactly this way =
you mentioned. New 'xen' format style<br class=3D"">is based on =
'llvm'.<br class=3D""></blockquote><br class=3D"">Can you give a link to =
this write-up in a human readable way?<br class=3D""></blockquote><br =
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
none; float: none; display: inline !important;" class=3D"">The summary I =
wrote in the original mail in this thread describes what</span><br =
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
none; float: none; display: inline !important;" class=3D"">was done =
based on 'llvm' coding style of clang-format.</span><br =
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
none; float: none; display: inline !important;" class=3D"">I'm putting =
it here with update: added BreakStringLiterals thing to be =
fixed.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
none; float: none; display: inline !important;" class=3D"">Summary of =
the changes:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">- Added 3 new =
formatting styles to cover all the cases mentioned in</span><br =
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
none; float: none; display: inline !important;" class=3D"">Xen coding =
style document: Xen, Libxl, Linux;</span><br style=3D"caret-color: =
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
class=3D"">- Added list of the files and corresponding style name =
mappings;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">- Added =
indentation according to Xen coding style;</span><br style=3D"caret-color:=
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
class=3D"">- Added white space formatting according to Xen coding =
style;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">- Added =
bracing support exception for do/while loops;</span><br =
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
none; float: none; display: inline !important;" class=3D"">Added to =
clang-format, however, probably this logic should be moved to</span><br =
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
none; float: none; display: inline !important;" class=3D"">python part =
(see known clang-format limitations above):</span><br =
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
none; float: none; display: inline !important;" class=3D"">- Braces =
should be omitted for blocks with a single statement. Note:</span><br =
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
none; float: none; display: inline !important;" class=3D"">these braces =
will be required by MISRA, for example, so it is probably</span><br =
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
none; float: none; display: inline !important;" class=3D"">worth adding =
such a requirement to the coding style.</span><br style=3D"caret-color: =
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
class=3D"">- Comments format requirements. Note: //-style comments are =
defined in</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">C99 as well, =
and not just in the case of C++. C99 standard is 20-years</span><br =
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
none; float: none; display: inline !important;" =
class=3D"">old=E2=80=A6</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">To be added:</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">- Emacs local variables. Open points: Why to keep emacs =
local</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">variables in =
Xen code? What about other editors' comments (vim)?</span><br =
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
none; float: none; display: inline !important;" class=3D"">- Warning to =
stderr in the case when =E2=80=98unfixable=E2=80=99 line/s =
detected.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
none; float: none; display: inline !important;" class=3D"">To be =
fixed:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">- Max line =
length from 80 to 79 chars;</span><br style=3D"caret-color: rgb(0, 0, =
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
class=3D"">- Disable // comments;</span><br style=3D"caret-color: rgb(0, =
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
class=3D"">- Set BreakStringLiterals to false (not explicitly covered by =
Xen</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">coding style =
document for now)</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
text-decoration: none;" class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D"">I am not sure why clang-format decided to =
format like that. Do you know why?<br class=3D""></blockquote><br =
class=3D"">The reason is that there are two strings in one line. It =
would not<br class=3D"">change it if it were<br class=3D"">not =
"arm,psci-1.0""\0", but "arm,psci-1.0\0".<br class=3D""></blockquote><br =
class=3D"">I would like to see the exact part of the clang-format coding =
style<br class=3D"">documentation that mention this requirements... The =
more that in an<br class=3D"">example above (copied below for =
simplicity), there are two strings in on<br class=3D"">line.<br =
class=3D""></blockquote><br class=3D"">The closest found seems =
BinPackParameters BinPackArguments,<br class=3D"">however, it is about =
function calls according to manual...<br class=3D""></blockquote><br =
class=3D"">Above, you mention the work is based on the LLVM coding =
style. Is there<br class=3D"">anything in that coding style about the =
string?<br class=3D""></blockquote><br class=3D"">Well, not much. See =
clang-format configurator mentioned above.<br class=3D"">However, there =
is a useful clang BreakStringLiterals option.<br class=3D"">It should be =
turned off to follow your suggestion not to break string<br =
class=3D"">literal for grep use case.<br class=3D""></blockquote><br =
class=3D"">I am not speaking about clang-format itself but the LLVM =
coding style. I assume<br class=3D"">there is a human readable coding =
style for LLVM, right? If so, is there any<br class=3D"">section in it =
about string?<br class=3D""></blockquote><br style=3D"caret-color: =
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
class=3D"">See the link above. Unfortunately, it is about C++ and not =
about C.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Seems there =
is no pure C support in clang-format.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
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
text-decoration: none;" class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D""><blockquote=
 type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D"">+ =
&nbsp;&nbsp;&nbsp;D11PRINT("Allocated %#" PRIpaddr "-%#" PRIpaddr<br =
class=3D""></blockquote></blockquote><br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D""><blockquote=
 type=3D"cite" class=3D""><br class=3D"">*****<br class=3D""><br =
class=3D"">- &nbsp;&nbsp;&nbsp;clock_valid =3D dt_property_read_u32(dev, =
"clock-frequency",<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&amp;clock_frequency);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;clock_valid =3D<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dt_property_read_u32(dev, =
"clock-frequency", &amp;clock_frequency);<br class=3D""><br class=3D"">I =
am not sure why clang-format decide to format like that. The current =
version<br class=3D"">is definitely valid.<br class=3D""></blockquote><br =
class=3D"">The current version is not valid as it takes 81 chars, while =
79 is<br class=3D"">allowed according to coding style.<br =
class=3D""></blockquote><br class=3D"">Really? I looked at the code and =
this is 62 characters... It would be 81<br class=3D"">characters if =
"&amp;clock_frequency);" were on the same line. But see how it<br =
class=3D"">is split in 2 lines.<br class=3D""></blockquote><br =
class=3D"">You are right, there are two lines. So it needs to find out =
how to<br class=3D"">configure or implement such a feature to ignore =
such cases.<br class=3D""></blockquote><br class=3D"">What's the LLVM =
coding style policy about this?<br class=3D""></blockquote><br =
class=3D"">Well, LLVM formats it as shown above. All the other =
'native'<br class=3D"">clang-format styles behave similarly.<br =
class=3D""></blockquote><br class=3D"">This does not answer to my =
question. You pointed me how clang-format is<br class=3D"">configured, =
not how the behavior of clang format for this particular case and<br =
class=3D"">the developer documentation related to this.<br =
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
class=3D"">See the link above, hopefully it answers your =
question.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
class=3D"">Thanks</span><br class=3D""></div></blockquote><br =
class=3D""></div><div>Viktor: thank you for spending time on =
this</div><div><br class=3D""></div><div>I added an item to community =
call tomorrow and CC'ed you in the invite. So I think what we need to do =
is figure out a way on how to make the coding standard enforceable by a =
coding standard checker such as proposed here. AFAICT</div><div>* It =
seems there are some undocumented coding standard rules, which are =
essentially causing problems with the tool</div><div>* In addition, the =
fact that the LLVM coding style is the baseline for the checks may also =
create some problems with false standard violations</div><div><br =
class=3D""></div><div>My instinct would be to try and document any =
undocumented rules on a scratch space (e.g. google doc), look at =
differences between Xen and LLVM formatting style and then make =
decisions using a voting mechanism to avoid bike-shedding. In some cases =
discussion may be necessary though</div><div><br class=3D""></div><div>It =
would be good if you could attend, but I think we can do without you, if =
needed</div><div><br class=3D""></div><div>Regards</div><div>Lars</div><br=
 class=3D""></body></html>=

--Apple-Mail=_DBAC8EEE-2455-4A1C-A14B-C3EEFFABF734--


--===============1436286670586541748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1436286670586541748==--

