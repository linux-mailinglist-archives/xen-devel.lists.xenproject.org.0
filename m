Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49D115864
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 22:02:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idKgc-0008Rq-Le; Fri, 06 Dec 2019 20:58:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvRm=Z4=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1idKga-0008Rl-QY
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 20:58:48 +0000
X-Inumbo-ID: 329a9506-186b-11ea-88e7-bc764e2007e4
Received: from mail-vs1-xe43.google.com (unknown [2607:f8b0:4864:20::e43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 329a9506-186b-11ea-88e7-bc764e2007e4;
 Fri, 06 Dec 2019 20:58:47 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id y195so6058721vsy.5
 for <xen-devel@lists.xenproject.org>; Fri, 06 Dec 2019 12:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=V0sHoTMct+rcHTs0HcKhyEZesbFppY0ZrPewCkgUGZI=;
 b=H66sLqnEOTVF7hurW3YXHAGMdgyhFTSC/qh7AewD7IECZo2u10ReLy5vetQy25doiP
 w08yIhYiUQHkoZjeuaxZtB6SquJ9v/zgPVWffS7794Ilw8QULQpDjey914EhltBebrFm
 0OJafVyixphMfbT0nLw6cp/hHI4rXogyqLGXDxvZvhm2OF/oP5+FJXQpD/I4xK7uYCHK
 fwzu6o+1KZIsbbs82/OVWxtTSMsWoGIAkzJKA9lZ0ZsBe2YY4dfeb16DNln+4uKOuOhC
 sNPdu0iWJlhgZTbgEDqZWVeydP1qTmpLdFhscHf8GBeLIrPgcxOLtA8gy+/4F7REGxhg
 Q1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=V0sHoTMct+rcHTs0HcKhyEZesbFppY0ZrPewCkgUGZI=;
 b=QrGaJv/pdUEjbAq2M1FeHcER/M+HNNWO3FKfy3upCAQgu2eqX+lXUypyDocu2pj4M3
 o4VNY/7qcBL/eVP+j/HTX9n3h3Jqbya43Dkn4rYIWQRxtw4hQTnZCWLnL28ESsZtVQnW
 9AGviU88JW/xMhY17XVAp43ZSBFYkP+fBizUFTrf7Z8dBYie6ofjjfMpfYu7t78erPNR
 sKQhNGdCbycp3+ivDm3wRaV7X5v90vyZxGUS58DAW+L9/EkALqSdd8KSqy3g25BfEahO
 VMfDXSeNyYj4bHCIhnxz2q0dVknrQd53TQNPagaWh1dsJviLzw6XQQTFh43H+kTBaxWO
 Hykw==
X-Gm-Message-State: APjAAAVUuxlmkc3IvzIy1eAlzIAEbhq/84wApKu5VWQIAWmU2x35dWSb
 8C+J6MNsWuvVDzcnB92UrzI=
X-Google-Smtp-Source: APXvYqw9msuymfZhG0OSICYsjH1JpVoVOFHLW9E4cLNLUaqpsCLFz1h5fZ2RB+30d0TeOj/EIs6Jhw==
X-Received: by 2002:a67:bb19:: with SMTP id m25mr10238195vsn.68.1575665926907; 
 Fri, 06 Dec 2019 12:58:46 -0800 (PST)
Received: from [10.30.1.130] ([181.193.15.54])
 by smtp.gmail.com with ESMTPSA id y16sm6821920uag.20.2019.12.06.12.58.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Dec 2019 12:58:45 -0800 (PST)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Message-Id: <9F65329A-48F4-4560-9ED8-96C2A2261B93@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Fri, 6 Dec 2019 14:58:38 -0600
In-Reply-To: <1ed9f7e0-4523-215f-b40e-70ff8b28f811@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191127160108.12490-1-roger.pau@citrix.com>
 <38400e64-4ace-77a9-6b95-58f1754ca690@suse.com>
 <9154ab98-8bb7-d8c7-5310-61c865040ed4@citrix.com>
 <55667545-7298-e4ef-8022-ca3c05009719@suse.com>
 <aac11d8f-7945-1126-e5f8-9cacaef69614@suse.com>
 <5d59c68c-6246-9ece-a786-a9d0647b34b9@citrix.com>
 <20191202155332.GA17893@char.us.oracle.com>
 <db8386cf-1309-b24a-59a8-e0bd96f3749d@citrix.com>
 <20191202170119.GA18997@char.us.oracle.com>
 <FD2CFC15-D051-4D3D-A878-66D31E6A1F9C@citrix.com>
 <1ed9f7e0-4523-215f-b40e-70ff8b28f811@citrix.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [PATCH for-4.13] clang: do not enable live-patching
 support
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============5547119034415476260=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5547119034415476260==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2C84293F-6A1A-4F9B-893C-B20D7D6EB018"


--Apple-Mail=_2C84293F-6A1A-4F9B-893C-B20D7D6EB018
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 6 Dec 2019, at 14:21, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> On 03/12/2019 09:17, George Dunlap wrote:
>>=20
>>> On Dec 2, 2019, at 5:01 PM, Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com> wrote:
>>>=20
>>> On Mon, Dec 02, 2019 at 03:55:04PM +0000, Andrew Cooper wrote:
>>>> On 02/12/2019 15:53, Konrad Rzeszutek Wilk wrote:
>>>>>>> I plan to release ack the patch in case the missing maintainer's =
acks
>>>>>>> are not coming in too late.
>>>>>> I think Andy's objection was that there has been zero testing of
>>>>>> livepatching on gcc.  Maybe we can find someone to do a =
smoke-test.
>>>>> As in integrate livepatch-build tools in osstest smoke-tests?
>>>>> Because the livepatch test cases are in osstest, unless something =
went awry?
>>>> The sum total of livepatch testing in OSSTest is using the =
hand-coded
>>>> ELF objects from the tests/ directory.
>>>>=20
>>>> This is perhaps ok for the basic mechanism, but its not =
representative
>>>> of actually building real livepatches using livepatch build tools.
>>> True. But it tests the _hypervisor_ livepatch code.
>>>=20
>>> I am thinking that this discussion about "oh, but livepatch-build =
tools don't work b/c"
>>> is well <shrug> sucks but should never block an release as the core
>>> livepatch functionality is OK.
>> I think a parallel is if Xen doesn=E2=80=99t build with a particular =
version of the compiler, or can=E2=80=99t build on a particular distro =
for some reason.  We should certainly *try* to make things work with =
other projects, but if the issue is clearly with the other project, we =
shouldn=E2=80=99t have to block to wait for that other project to get =
things sorted out.
>=20
> This isn't a valid comparison.
>=20
> livepatch-build-tools is a concrete thing, built and maintained by us
> (the Xen community), explicitly for the purpose generating livepatches
> between two versions of Xen.  It lives at
> https://xenbits.xen.org/gitweb/?p=3Dlivepatch-build-tools.git;a=3Dsummar=
y =
<https://xenbits.xen.org/gitweb/?p=3Dlivepatch-build-tools.git;a=3Dsummary=
> on
> xenbits, just like xen.git.


First a couple of questions: I noticed that neither Ross to xen-devel is =
on this thread

I agree with Andy: we got away lucky so far, as there have been few =
changes to the live patch-build-tools


> It *should* be used in OSSTest, have a push gate, and block breaking
> changes either to Xen or to the tools themselves, before the breaking
> changes get accepted into master of either repo.

Although I agree with you, we should not block 4.13 for it and do some =
manual testing for this release
But we should have a plan in place for 4.14 to address this and maybe =
agree to block 4.14 if that has not happened

Lars=

--Apple-Mail=_2C84293F-6A1A-4F9B-893C-B20D7D6EB018
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 6 Dec 2019, at 14:21, Andrew Cooper &lt;<a =
href=3D"mailto:andrew.cooper3@citrix.com" =
class=3D"">andrew.cooper3@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On 03/12/2019 =
09:17, George Dunlap wrote:</span><br style=3D"caret-color: rgb(0, 0, =
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
type=3D"cite" class=3D"">On Dec 2, 2019, at 5:01 PM, Konrad Rzeszutek =
Wilk &lt;<a href=3D"mailto:konrad.wilk@oracle.com" =
class=3D"">konrad.wilk@oracle.com</a>&gt; wrote:<br class=3D""><br =
class=3D"">On Mon, Dec 02, 2019 at 03:55:04PM +0000, Andrew Cooper =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">On 02/12/2019 =
15:53, Konrad Rzeszutek Wilk wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote =
type=3D"cite" class=3D"">I plan to release ack the patch in case the =
missing maintainer's acks<br class=3D"">are not coming in too late.<br =
class=3D""></blockquote>I think Andy's objection was that there has been =
zero testing of<br class=3D"">livepatching on gcc. &nbsp;Maybe we can =
find someone to do a smoke-test.<br class=3D""></blockquote>As in =
integrate livepatch-build tools in osstest smoke-tests?<br =
class=3D"">Because the livepatch test cases are in osstest, unless =
something went awry?<br class=3D""></blockquote>The sum total of =
livepatch testing in OSSTest is using the hand-coded<br class=3D"">ELF =
objects from the tests/ directory.<br class=3D""><br class=3D"">This is =
perhaps ok for the basic mechanism, but its not representative<br =
class=3D"">of actually building real livepatches using livepatch build =
tools.<br class=3D""></blockquote>True. But it tests the _hypervisor_ =
livepatch code.<br class=3D""><br class=3D"">I am thinking that this =
discussion about "oh, but livepatch-build tools don't work b/c"<br =
class=3D"">is well &lt;shrug&gt; sucks but should never block an release =
as the core<br class=3D"">livepatch functionality is OK.<br =
class=3D""></blockquote>I think a parallel is if Xen doesn=E2=80=99t =
build with a particular version of the compiler, or can=E2=80=99t build =
on a particular distro for some reason. &nbsp;We should certainly *try* =
to make things work with other projects, but if the issue is clearly =
with the other project, we shouldn=E2=80=99t have to block to wait for =
that other project to get things sorted out.<br =
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
class=3D"">This isn't a valid comparison.</span><br style=3D"caret-color: =
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
class=3D"">livepatch-build-tools is a concrete thing, built and =
maintained by us</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">(the Xen community), explicitly for the purpose generating =
livepatches</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">between two =
versions of Xen.&nbsp; It lives at</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><a =
href=3D"https://xenbits.xen.org/gitweb/?p=3Dlivepatch-build-tools.git;a=3D=
summary" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://xenbits.xen.org/gitweb/?p=3Dlivepatch-build-tools.git;a=
=3Dsummary</a><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span>on</span><br =
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
none; float: none; display: inline !important;" class=3D"">xenbits, just =
like xen.git.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div><div><br =
class=3D""></div><div class=3D"">First a couple of questions: I noticed =
that neither Ross to xen-devel is on this thread</div><div class=3D""><br =
class=3D""></div><div class=3D"">I agree with Andy: we got away lucky so =
far, as there have been few changes to the live =
patch-build-tools</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><blockquote type=3D"cite" class=3D""><div =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">It *should* =
be used in OSSTest, have a push gate, and block breaking</span><br =
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
none; float: none; display: inline !important;" class=3D"">changes =
either to Xen or to the tools themselves, before the breaking</span><br =
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
none; float: none; display: inline !important;" class=3D"">changes get =
accepted into master of either repo.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Although I agree with you, we should not block 4.13 for =
it and do some manual testing for this release</div><div>But we should =
have a plan in place for 4.14 to address this and maybe agree to block =
4.14 if that has not happened</div><div><br =
class=3D""></div><div>Lars</div></body></html>=

--Apple-Mail=_2C84293F-6A1A-4F9B-893C-B20D7D6EB018--


--===============5547119034415476260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5547119034415476260==--

