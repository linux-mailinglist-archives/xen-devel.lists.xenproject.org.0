Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E209319D66
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 14:44:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP4q2-0007pK-K9; Fri, 10 May 2019 12:41:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0ItA=TK=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hP4q0-0007pF-Fs
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 12:41:20 +0000
X-Inumbo-ID: e8a18a32-7320-11e9-8980-bc764e045a96
Received: from mail-ua1-x92d.google.com (unknown [2607:f8b0:4864:20::92d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e8a18a32-7320-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 12:41:19 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id e9so1598698uar.9
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2019 05:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=lz4FTuA1Kpsfrb0LVtI3te0tftqX2lByF7rd59c4G5c=;
 b=iK14YNTiLtTq8zMwcr9D99HX4TbzhZYilYSg163UXP8aaUTZiDcI7x2d3MH02QliKy
 A1KrUBP0CAm2WgVWvMcjAOZJKMD1+3Enaa8tVEACZIQcup8f+dvLHlYCOcazqsQzX2Qo
 65lT59OZaksSyCBA068aSu4qMgpH42swVQ7VSOmMXTPTd16oOEEqUAwyYxNNNQ+Um0IW
 ExEyktX1yvAKe26Op8pYdnpOchaxUT4RhcmBoXt0BPpebu+EzMPwgeMFHmuXSpXd0JvT
 P7/986if2wL+zHzsJaIeVT2IsuC4jjnLjsxUuTqhaO3KJ9ii4WEeY9XOhPE9lU5WcD0M
 k3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=lz4FTuA1Kpsfrb0LVtI3te0tftqX2lByF7rd59c4G5c=;
 b=syq3HMxg+SlUoya/JvsvKTrRxDpmcJd5gUj1p0t2bkTTyU6FJeXcvXNhbkt8vR85mL
 jgbSluGU2MAh4trh30nnWBbYjKL2b21cnvQZ4OcrIbWLAqSdBejBEgEn1jp+MNgWVN4a
 FJ9VUOjU37CLCxzhdniZOZvtEVWTmqJfGpjut+0Ws+7c+7WBUWn29TGleNLBfFg2ElhN
 MXttoDotJ5CZGKzbfCFgIqk9Cuh5K9Jr0KKnM+lDnjAaOt8ybUr7Zap6ahm2VjnSUZk4
 ZbalJLrQ+Dx9XdNsfN9IsD2vJVAcX2bNJGTnDmU6QkHJlDf/1zNygq09b8AZMZulTaRS
 SrOg==
X-Gm-Message-State: APjAAAWvrKkW05vlBiat7mMyZk6jri4FixqGezuyHL0JhU83JDd6RKar
 NwmCRFLB8FDjllq7BEBydgE=
X-Google-Smtp-Source: APXvYqw8L8Jm47RLaV2v4f6vjKpUn/LI8i6zSYfrU9Ayk7wGB1xeCk9NI17ApoSDD7swrItQscHBqQ==
X-Received: by 2002:ab0:d89:: with SMTP id i9mr5186960uak.96.1557492078340;
 Fri, 10 May 2019 05:41:18 -0700 (PDT)
Received: from [192.168.0.100] (ip133-193-64-186.ct.co.cr. [186.64.193.133])
 by smtp.gmail.com with ESMTPSA id u72sm1327502vku.23.2019.05.10.05.41.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 05:41:17 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <BADFED47-270A-4F72-BB50-AE9BD6D77A76@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Fri, 10 May 2019 06:41:13 -0600
In-Reply-To: <5CD52CEA020000780022D6B1@prv1-mh.provo.novell.com>
To: 'Jan Beulich' <JBeulich@suse.com>
References: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
 <5CD52CEA020000780022D6B1@prv1-mh.provo.novell.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] Guest Testing in OSSTEST - What distros and
 versions should we test against
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Committers <committers@xenproject.org>
Content-Type: multipart/mixed; boundary="===============1584144193327860742=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1584144193327860742==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_989C9DD9-FA26-45A3-9BEF-EC79DF18AD3B"


--Apple-Mail=_989C9DD9-FA26-45A3-9BEF-EC79DF18AD3B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 10 May 2019, at 01:48, Jan Beulich <JBeulich@suse.com> wrote:
>>=20
>> With regards to Windows testing we have some restrictions. We have =
tried=20
>> several times to buy additional test licenses, but this never went =
anywhere=20
>> (some of the VM licenses are not available for our environment, =
unless you=20
>> bulk buy, which is very expensive). The only approach that would =
allow us to=20
>> test against different windows versions would be to require everyone =
who may=20
>> touch OSSTEST which is not doable.
>>=20
>> I can bring this up with the MS open source office, if there are =
strong=20
>> feelings about this and try again
>=20
> If there's at least a (not overly) small chance of succeeding, I think =
this
> may be worth it, unless Rich's suggestion already helps.
>=20

I will try again. Let's work on the basis that this is possible and see =
where it goes
Lars=

--Apple-Mail=_989C9DD9-FA26-45A3-9BEF-EC79DF18AD3B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 10 May 2019, at 01:48, Jan Beulich &lt;<a =
href=3D"mailto:JBeulich@suse.com" class=3D"">JBeulich@suse.com</a>&gt; =
wrote:</div><div class=3D""><div style=3D"" class=3D""><blockquote =
type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"">With regards to Windows testing we have some restrictions. We =
have tried<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">several times to buy additional test licenses, but this never =
went anywhere<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">(some of the VM licenses are not available for our =
environment, unless you<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">bulk buy, =
which is very expensive). The only approach that would allow us to<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">test against =
different windows versions would be to require everyone who may<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">touch =
OSSTEST which is not doable.<br class=3D""><br class=3D"">I can bring =
this up with the MS open source office, if there are strong<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">feelings =
about this and try again<br class=3D""></blockquote><br =
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
none; float: none; display: inline !important;" class=3D"">If there's at =
least a (not overly) small chance of succeeding, I think this</span><br =
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
none; float: none; display: inline !important;" class=3D"">may be worth =
it, unless Rich's suggestion already helps.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br class=3D""></div></div></blockquote><br =
class=3D""></div>I will try again. Let's work on the basis that this is =
possible and see where it goes<div class=3D""><div =
class=3D"">Lars</div></div></body></html>=

--Apple-Mail=_989C9DD9-FA26-45A3-9BEF-EC79DF18AD3B--


--===============1584144193327860742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1584144193327860742==--

