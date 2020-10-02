Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E690C28105D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1802.5522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHzd-0001xR-79; Fri, 02 Oct 2020 10:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1802.5522; Fri, 02 Oct 2020 10:08:49 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHzd-0001x2-3c; Fri, 02 Oct 2020 10:08:49 +0000
Received: by outflank-mailman (input) for mailman id 1802;
 Fri, 02 Oct 2020 10:08:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=plqz=DJ=dilos.org=igor@srs-us1.protection.inumbo.net>)
 id 1kOHzb-0001ww-GK
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:08:47 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03a37920-58cb-4e82-8cc4-909f5c3a8658;
 Fri, 02 Oct 2020 10:08:46 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w11so1185451lfn.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 03:08:46 -0700 (PDT)
Received: from [192.168.88.253] ([91.204.57.91])
 by smtp.gmail.com with ESMTPSA id q4sm210805lfm.46.2020.10.02.03.08.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Oct 2020 03:08:44 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=plqz=DJ=dilos.org=igor@srs-us1.protection.inumbo.net>)
	id 1kOHzb-0001ww-GK
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:08:47 +0000
X-Inumbo-ID: 03a37920-58cb-4e82-8cc4-909f5c3a8658
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 03a37920-58cb-4e82-8cc4-909f5c3a8658;
	Fri, 02 Oct 2020 10:08:46 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w11so1185451lfn.2
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilos-org.20150623.gappssmtp.com; s=20150623;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=AVLPKaf/ll8ruIkLPEyi4ykMpD9tbEcswH/W2g/8Crc=;
        b=qcpOJg7bMrCv4SFg3oLpZvHqTewi8WLdafQJ+p8p3K/EZEFgQNrRYVO7hX2JyW0dNR
         vWeqLpEAqlmFBFcYGqpfV5wdyNW4fDaO2GyKtXHSLgsb6zInhgVul9CKhYmElhpbDZsW
         zhyCLB6q4/PYOuTbasCmnhkpP3OOCIPYvbcd7PNKwN9KZ75WK3gYFqJs+8gv8F9c3KuN
         rsVpzW1J7R1Ifwo18veRzXl1vQgaqgGBpaOSTNgruj/4aXvatGdgFV2Nigm+jUPE7yUF
         XW1q/uDgUg3XPF2Ysy021wSgQCHZY4T6Chk9ZgZDeXt511RBqGn68I1vzcltBypvwwGg
         IOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=AVLPKaf/ll8ruIkLPEyi4ykMpD9tbEcswH/W2g/8Crc=;
        b=jWnc96bZ+/BnaBH1Q6peX6dvyaMKugfP4kUxt4UL/aYz4bKK5hTixA6a4ejVbGvHM+
         HPDE+XEQBIgyDYcMY0frpj8jOS8rKQSpHkOylivplrIYGrNnrNZ4XMNWIX2aDgPqBkg6
         wZNt9wKtpbOHtBKrJ8ql2dYR+uplHrsdsa8LZ9Jhu4Yaw7bX2hZA4PPoqpUUA4VAiF3I
         /9Je1LPQRSYLx+ch+CqVimtkrHaCLEOJ1lEVSN/iMqwSo191JL9tunkcPQrLh4rUphFa
         igIsaZb5o80wRaDcKL9daJP6TiwYn7NiLhn8Uybg9e5xOjyU8DzzPkTXqi1VRsfcANEM
         1ojQ==
X-Gm-Message-State: AOAM531iwoITF0VbES5uVM4+WELSNVjp2wVLLKrKqyK6snqAliF2bnpw
	ODro0wWrZJFdSkpMPKve7J9/ag==
X-Google-Smtp-Source: ABdhPJwR7oiK03OrBs3M4/3TlQcSntyKKZo+oaIUeF2ga2X5dOhHdDTsBZ+0q/AuTI09vHLl1so67g==
X-Received: by 2002:a19:c157:: with SMTP id r84mr541731lff.34.1601633324907;
        Fri, 02 Oct 2020 03:08:44 -0700 (PDT)
Received: from [192.168.88.253] ([91.204.57.91])
        by smtp.gmail.com with ESMTPSA id q4sm210805lfm.46.2020.10.02.03.08.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Oct 2020 03:08:44 -0700 (PDT)
From: Igor Kozhukhov <igor@dilos.org>
Message-Id: <01D5E481-0221-440F-865C-F362F344295C@dilos.org>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F890F14A-34A2-4694-B9AD-946C1BC81686"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [Xen-devel] Xen Solaris support still required? Illumos/Dilos Xen
Date: Fri, 2 Oct 2020 13:08:43 +0300
In-Reply-To: <746d05db-cbe0-4013-41fb-a4a5b9b71d5c@suse.com>
Cc: =?utf-8?B?UGFzaSBLw6Rya2vDpGluZW4=?= <pasik@iki.fi>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <9ee9bda5-0333-0482-75aa-81a4d352a77e@suse.com>
 <20161103135632.GF28824@reaktio.net> <20161204165715.GN28824@reaktio.net>
 <E1236D3A-24CA-4ECF-B7C8-547406C54911@dilos.org>
 <642cf596-12bc-6f94-3e2a-e0343a250abc@suse.com>
 <746d05db-cbe0-4013-41fb-a4a5b9b71d5c@suse.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)


--Apple-Mail=_F890F14A-34A2-4694-B9AD-946C1BC81686
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi All,

sorry for long delay with XEN.

we have plans with Xen support on DilOS.
i have made some changes on dilos-illumos side for it.
but we have some priority to OpenZFS updates and XEN support will be a =
little bit later.

we have plans for XEN on 2021 year, but all depends on business needs =
and investments.

best regards,
-Igor

> On 2 Oct 2020, at 12:53, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> =
wrote:
>=20
> On 05.12.16 06:32, Juergen Gross wrote:
>> On 04/12/16 18:11, Igor Kozhukhov wrote:
>>> Hi Pasi,
>>>=20
>>> i=E2=80=99m using both addresses, but probably @gmale missed some =
emails with
>>> maillist.
>>>=20
>>> About DilOS + Xen.
>>>=20
>>> i=E2=80=99m using xen-3.4 - old version what i backported to DilOS =
based on old
>>> opensolaris varsion and upadted it to use python2.7 and some others =
zfs
>>> updates - more updates :)
>>> i tried to port Xen-4.3, but not finished it yet because i have no =
found
>>> sponsors and i have been moved to some aonther job without =
DilOS/illumos
>>> activities.
>>> try to do it by free time was/is overhead.
>>>=20
>>> i have plans try to return back and look at latest Xen.
>>>=20
>>> right now i try to move DilOS bulid env to use more Debian style =
build
>>> env and to use gcc-5.4 as primary compiler.
>>> Also, i have SPARC support with DilOS and it eat some additional =
free time.
>>> please do not drop solaris support :) - i=E2=80=99ll use and update =
it soon -
>>> probably on next year.
>> Got it. Thanks for the note and good luck for the port!
>=20
> As a followup after nearly 4 years:
>=20
> It seems nothing has happened, and Solaris specific coding in Xen is
> bit-rotting further. Last example is xenstored, which lost an =
interface
> mandatory for Solaris about 1 year ago (nobody noticed, as Solaris
> specific parts are neither built nor tested).
>=20
> I stumbled over this one as I did some reorg of the Xen libraries and
> checked all the dependencies between those.
>=20
> I think at least the no longer working Solaris stuff in xenstored =
should
> be removed now (in theory it would still be possible to use xenstore-
> stubdom in Solaris), but I honestly think all the other Solaris cruft =
in
> Xen tools should go away, too, in case nobody is really showing some
> interest in it (e.g. by doing some basic build tests and maybe a small
> functional test for each release of Xen).
>=20
> So how does the realistic future of a Solaris dom0 look like? Is there
> a non-neglectable chance it will be revived in the near future, or can
> we remove the Solaris abstractions?
>=20
>=20
> Juergen


--Apple-Mail=_F890F14A-34A2-4694-B9AD-946C1BC81686
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
All,<div class=3D""><br class=3D""></div><div class=3D"">sorry for long =
delay with XEN.</div><div class=3D""><br class=3D""></div><div =
class=3D"">we have plans with Xen support on DilOS.</div><div class=3D"">i=
 have made some changes on dilos-illumos side for it.</div><div =
class=3D"">but we have some priority to OpenZFS updates and XEN support =
will be a little bit later.</div><div class=3D""><br class=3D""></div><div=
 class=3D"">we have plans for XEN on 2021 year, but all depends on =
business needs and investments.</div><div class=3D""><br =
class=3D""></div><div class=3D"">best regards,</div><div =
class=3D"">-Igor<br class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 2 Oct 2020, at 12:53, =
J=C3=BCrgen Gro=C3=9F &lt;<a href=3D"mailto:jgross@suse.com" =
class=3D"">jgross@suse.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On 05.12.16 06:32, Juergen Gross =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">On =
04/12/16 18:11, Igor Kozhukhov wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Hi Pasi,<br class=3D""><br class=3D"">i=E2=80=99m=
 using both addresses, but probably @gmale missed some emails with<br =
class=3D"">maillist.<br class=3D""><br class=3D"">About DilOS + Xen.<br =
class=3D""><br class=3D"">i=E2=80=99m using xen-3.4 - old version what i =
backported to DilOS based on old<br class=3D"">opensolaris varsion and =
upadted it to use python2.7 and some others zfs<br class=3D"">updates - =
more updates :)<br class=3D"">i tried to port Xen-4.3, but not finished =
it yet because i have no found<br class=3D"">sponsors and i have been =
moved to some aonther job without DilOS/illumos<br =
class=3D"">activities.<br class=3D"">try to do it by free time was/is =
overhead.<br class=3D""><br class=3D"">i have plans try to return back =
and look at latest Xen.<br class=3D""><br class=3D"">right now i try to =
move DilOS bulid env to use more Debian style build<br class=3D"">env =
and to use gcc-5.4 as primary compiler.<br class=3D"">Also, i have SPARC =
support with DilOS and it eat some additional free time.<br =
class=3D"">please do not drop solaris support :) - i=E2=80=99ll use and =
update it soon -<br class=3D"">probably on next year.<br =
class=3D""></blockquote>Got it. Thanks for the note and good luck for =
the port!<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">As a followup after nearly 4 years:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">It seems nothing has happened, =
and Solaris specific coding in Xen is</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">bit-rotting further. Last example is xenstored, which lost an =
interface</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">mandatory for =
Solaris about 1 year ago (nobody noticed, as Solaris</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">specific parts are neither built =
nor tested).</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I stumbled =
over this one as I did some reorg of the Xen libraries and</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">checked all the dependencies =
between those.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I think at least the no longer working Solaris stuff in =
xenstored should</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">be removed now (in theory it would still be possible to use =
xenstore-</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">stubdom in =
Solaris), but I honestly think all the other Solaris cruft in</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Xen tools should go away, too, =
in case nobody is really showing some</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">interest in it (e.g. by doing some basic build tests and =
maybe a small</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">functional =
test for each release of Xen).</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">So how does the realistic future of a Solaris dom0 look like? =
Is there</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">a =
non-neglectable chance it will be revived in the near future, or =
can</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">we remove the =
Solaris abstractions?</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Juergen</span></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_F890F14A-34A2-4694-B9AD-946C1BC81686--

