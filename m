Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FFCC05F0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 15:03:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpr5-0003PH-JT; Fri, 27 Sep 2019 13:00:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RM3i=XW=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1iDpr3-0003P5-Q8
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 13:00:13 +0000
X-Inumbo-ID: b79dc088-e126-11e9-bf31-bc764e2007e4
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by localhost (Halon) with ESMTPS
 id b79dc088-e126-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 13:00:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q17so2612646wrx.10;
 Fri, 27 Sep 2019 06:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=JRwer4ub6sga6pyeKqL5ybYknSoUcbtDi5EoZxGNs3M=;
 b=G4HmCNUD57Xp4RIjeLozDULrtPLLsqW2/A8tsPFRkSIuCcdxLOB2y5lLwTsXDvAMx4
 OWEQNfOJZQV4GzHjRJ02rmH2NRAOgNFhA/dxFR3zA68vLqoMKSYJW3+4DqEf4JURKmvk
 CWFRwLtJh3LjiDsN+ULnGn+X6u3Ljl75wznXNPU+AEEKWSA2qNijyL5cxqz0xny3dcIM
 M+3F0Un2YckwWE1fmuKI854meU1muVZGr/jgJnmSYhQKaxos60yeeFVEHAGVs/QnYXOk
 YvsOCth+wn/aZBmg0FK7LH+DFyTWZRMbVuXbkcPVaNiLDb3LdHztJc/5JVnMs+bxBZYV
 jaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=JRwer4ub6sga6pyeKqL5ybYknSoUcbtDi5EoZxGNs3M=;
 b=HKMFHy/cQc8/QMC0FX4nTc/sH6VJeyphRRQFiqOGkh680TFOrV/Og1shaS1v+kzWGh
 7bUcXQPko7JUlP9ieeRxt2ghUMb6xBeom+q9wezBtpfD78FJJgAtILf2xi37BfSJTZd4
 io/6Tn57Uv+gzuFeWWoyznaJYmGUACNTae25yz8tN3cqs9watLJ0EXrrgWUi0XrxcyU8
 Ir9/HCgGrHgg5XLc8V0gsU3RNfWKGrgeLXyjBRszDi189J4cOsho3kuv1F4qsiUvdKxt
 1NxnL0LJ6pOAm3Qkt9FKlUglUl59fLwvNoduH6YO5U2LmSb4z28foZsrtavET6LsD7kR
 DufQ==
X-Gm-Message-State: APjAAAXRf1EveHA6nan+O9uToRgjg8h5wcxzdbPEGgebrGh9bYPQ+i8w
 Eaa4YD8F7S9WrCeIwg/LIPN6ph6g
X-Google-Smtp-Source: APXvYqzbaJ+lyJc48tlfPAHy+hAmPl1oAB0PB+QvJaXwGIxMWmxpYaONBy6w2zQD8JRAwVkTCDeAag==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr2815691wrq.165.1569589200562; 
 Fri, 27 Sep 2019 06:00:00 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:9c4b:3230:1bc4:d181?
 ([2a02:c7f:ac18:da00:9c4b:3230:1bc4:d181])
 by smtp.gmail.com with ESMTPSA id e18sm4170975wrv.63.2019.09.27.05.59.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 05:59:59 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Message-Id: <DE57D4C8-B621-4BDC-B0E5-7F59E812EC66@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Fri, 27 Sep 2019 13:59:58 +0100
In-Reply-To: <E8A267E0-2E8F-4C2A-A280-99E8C7684721@xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-api@lists.xenproject.org, win-pv-devel@lists.xenproject.org
References: <CACJ1ZNsXOP-NHHhVTvxnsLvMx1FdJQgEibTsH4nj01b0WrO7fA@mail.gmail.com>
 <E8A267E0-2E8F-4C2A-A280-99E8C7684721@xenproject.org>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [Vote] XCP-ng subproject proposal
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
Cc: olivier.lambert@vates.fr
Content-Type: multipart/mixed; boundary="===============0994352433138876545=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0994352433138876545==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_56E299A4-40F1-433F-BF40-ACCF8AF6DF16"


--Apple-Mail=_56E299A4-40F1-433F-BF40-ACCF8AF6DF16
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 9 Sep 2019, at 15:44, Lars Kurth <lars.kurth@xenproject.org> wrote:
>=20
> Hello everyone,
>=20
> Olivier had posted an RFC for this proposal on xen-devel@- see =
https://xen.markmail.org/thread/ermnrb3ps3okvnjr =
<https://xen.markmail.org/thread/ermnrb3ps3okvnjr>=20
>=20
> The proposal also has been discussed by the Advisory Board and was =
approved
>=20
> However, for the proposal to fully pass the proposal must be run by =
past all mature subproject, which are Hypervisors, Windows PV Drivers =
and XAPI (see =
https://xenproject.org/developers/governance/#project-decisions =
<https://xenproject.org/developers/governance/#project-decisions>). =
People listed under Project team visible on the right columns of =
following pages can vote
> * https://xenproject.org/developers/teams/xen-hypervisor/ =
<https://xenproject.org/developers/teams/xen-hypervisor/> - already =
voted: Jan, Ian, Wei, George
> * https://xenproject.org/developers/teams/windows-pv-drivers/ =
<https://xenproject.org/developers/teams/windows-pv-drivers/>
> * https://xenproject.org/developers/teams/xen-api/ =
<https://xenproject.org/developers/teams/xen-api/>
>=20
> The RFC proposal has passed the Hypervisor team with 4/8 votes (see =
https://xen.markmail.org/thread/ermnrb3ps3okvnjr =
<https://xen.markmail.org/thread/ermnrb3ps3okvnjr>), but more support =
would be appreciated
>=20
> The proposal is attached below. Please vote before next Tuesday
>=20
> Best Regards
> Lars

Hi all.
so no more votes which means the proposal has passed
Lard


--Apple-Mail=_56E299A4-40F1-433F-BF40-ACCF8AF6DF16
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 9 Sep 2019, at 15:44, Lars Kurth &lt;<a =
href=3D"mailto:lars.kurth@xenproject.org" =
class=3D"">lars.kurth@xenproject.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"">Hello everyone,</div><div class=3D""></div><div=
 class=3D""><div class=3D""><br =
class=3D"webkit-block-placeholder"></div><div class=3D"">Olivier had =
posted an RFC for this proposal on xen-devel@- see&nbsp;<a =
href=3D"https://xen.markmail.org/thread/ermnrb3ps3okvnjr" =
class=3D"">https://xen.markmail.org/thread/ermnrb3ps3okvnjr</a>&nbsp;</div=
><div class=3D""><br class=3D""></div><div class=3D"">The proposal also =
has been discussed by the Advisory Board and was approved</div><div =
class=3D""><br class=3D""></div><div class=3D"">However, for the =
proposal to fully pass the proposal must be run by past all mature =
subproject, which are Hypervisors, Windows PV Drivers and XAPI =
(see&nbsp;<a =
href=3D"https://xenproject.org/developers/governance/#project-decisions" =
class=3D"">https://xenproject.org/developers/governance/#project-decisions=
</a>). People listed under Project team visible on the right columns of =
following pages can vote</div><div class=3D"">*&nbsp;<a =
href=3D"https://xenproject.org/developers/teams/xen-hypervisor/" =
class=3D"">https://xenproject.org/developers/teams/xen-hypervisor/</a>&nbs=
p;- already voted: Jan, Ian, Wei, George</div><div class=3D"">*&nbsp;<a =
href=3D"https://xenproject.org/developers/teams/windows-pv-drivers/" =
class=3D"">https://xenproject.org/developers/teams/windows-pv-drivers/</a>=
</div><div class=3D"">*&nbsp;<a =
href=3D"https://xenproject.org/developers/teams/xen-api/" =
class=3D"">https://xenproject.org/developers/teams/xen-api/</a></div><div =
class=3D""><br class=3D""></div><div class=3D"">The RFC proposal has =
passed the Hypervisor team with&nbsp;4/8 votes (see&nbsp;<a =
href=3D"https://xen.markmail.org/thread/ermnrb3ps3okvnjr" =
class=3D"">https://xen.markmail.org/thread/ermnrb3ps3okvnjr</a>), but =
more support would be appreciated</div><div class=3D""><br =
class=3D""></div><div class=3D"">The proposal is attached below. Please =
vote before next Tuesday</div><div class=3D""><br class=3D""></div><div =
class=3D"">Best Regards</div><div =
class=3D"">Lars</div></div></div></div></div></blockquote><br =
class=3D""></div><div>Hi all.</div><div>so no more votes which means the =
proposal has passed</div><div>Lard</div><br class=3D""></body></html>=

--Apple-Mail=_56E299A4-40F1-433F-BF40-ACCF8AF6DF16--


--===============0994352433138876545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0994352433138876545==--

