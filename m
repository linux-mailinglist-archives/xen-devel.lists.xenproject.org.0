Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA6E99864
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 17:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0pEq-0008Rb-Td; Thu, 22 Aug 2019 15:43:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CkEv=WS=amazon.de=prvs=1301474af=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0pEp-0008RM-G5
 for xen-devel@lists.xen.org; Thu, 22 Aug 2019 15:42:59 +0000
X-Inumbo-ID: 837461bc-c4f3-11e9-adda-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 837461bc-c4f3-11e9-adda-12813bfff9fa;
 Thu, 22 Aug 2019 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566488577; x=1598024577;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=Ai/ATEVNpL4IatvswiOIvK6oBSkpMR1WxyRuejALFpY=;
 b=cV3qeK6xOlAOB0gYqCBD4A2gbuS2GoGZySlK7/wz6vKqABvd+MN9WoVv
 0RVJcN504X2QWQ8DGhmqYHkYOPMBTNsxDaAhN9MjUcdjmw/fczYU6hS/s
 ihta+B6s8AR7H2qikVJ0ZUMhkaCYXQsgF2eOWzLUVhcUWZrO19bK41iBT k=;
X-IronPort-AV: E=Sophos;i="5.64,417,1559520000"; 
 d="scan'208,217";a="696508207"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 22 Aug 2019 15:42:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 29AA6A2AFF; Thu, 22 Aug 2019 15:42:53 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 22 Aug 2019 15:42:52 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 22 Aug 2019 15:42:51 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Thu, 22 Aug 2019 15:42:51 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 09/14] livepatch: Add per-function applied/reverted state
 tracking marker
Thread-Index: AQHVV/lI+OhiRe5NgkKqw74UV0kjMKcG+QKAgAAJKoCAAEr8AIAAA2cA
Date: Thu, 22 Aug 2019 15:42:51 +0000
Message-ID: <FA06107F-58B8-4D1F-9D1A-15908E049F57@amazon.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-10-wipawel@amazon.de>
 <d5aca603-3b30-e3ea-1256-51de8ca40eaf@arm.com>
 <DB27F58E-DA27-4A5D-BE23-4CDB5D9736A2@amazon.com>
 <9a2a6d52-f247-ff18-0cce-593162e33755@arm.com>
In-Reply-To: <9a2a6d52-f247-ff18-0cce-593162e33755@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 09/14] livepatch: Add per-function
 applied/reverted state tracking marker
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Jan
 Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8041065327198157842=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8041065327198157842==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_FA06107F58B84D1F9D1A15908E049F57amazoncom_"

--_000_FA06107F58B84D1F9D1A15908E049F57amazoncom_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 22. Aug 2019, at 17:30, Julien Grall <julien.grall@arm.com<mailto:julien=
.grall@arm.com>> wrote:

Hi Pawel,

On 22/08/2019 12:02, Wieczorkiewicz, Pawel wrote:
On 22. Aug 2019, at 12:29, Julien Grall <julien.grall@arm.com<mailto:julien=
.grall@arm.com> <mailto:julien.grall@arm.com>> wrote:
On 21/08/2019 09:19, Pawel Wieczorkiewicz wrote:
More generally, I am not very comfortable to see panic() in the middle of t=
he code. Could you explain why panic is the best solution over reverting th=
e work?

Yes. Production-ready hotpatches must not contain inconsistent hooks or fun=
ctions-to-be-applied/reverted.
The goal here is to detect such hotpatches and fail hard immediately highli=
ghting the fact that such hotpatch
is broken.

Aside the len =3D 0 that you are going to fix. How would this condition hap=
pen? Are you going to add code that will potentially trigger the panic?


The default livepatch code path is very conservative (to the extent it does=
 not even need this check and panic).
But, with the changes of this series, one can potentially construct a hotpa=
tch that upon load would trigger the panic
(or without the panic, would silently leave the Xen code in memory in an in=
consistent state). This obviously must not
happen in production, so the new livepatch feature should be used with care=
.The changes make livepatch more
flexible and universal, yet when using new features, more care is needed.

However, when someone is developing a hotpatch or is using the new feature =
for debugging or for whatever
non-production-related reason, it is very helpful to detect immediately any=
 sort of undefined state.
I have been there myself when I was working on the changes presented here, =
and thought that would be a good idea
to add this checks permanently.
Also, when something changes in the future in the livepatch implementation,=
 those checks could potentially highlight
any inconsistencies.

The inconsistent application of a hotpatch (some function applied, some rev=
erted while other left behined) leaves
the system in a very bad state. I think the best what we could do here is p=
anic() to enable post-mortem analysis
of what went wrong and avoid leaking such system into production.

Thank you for the explanation here (and on IRC). May I ask some documentati=
on regarding the panic in at least commit message? Ideally, this would expl=
ain why the panic the most sensible solution.


Yes, certainly. I will add that.

Cheers,

--
Julien Grall

Best Regards,
Pawel Wieczorkiewicz






Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_000_FA06107F58B84D1F9D1A15908E049F57amazoncom_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: <B2F1ABCC1CD6C84FBB26BEF95EE29C4B@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 22. Aug 2019, at 17:30, Julien Grall &lt;<a href=3D"mail=
to:julien.grall@arm.com" class=3D"">julien.grall@arm.com</a>&gt; wrote:</di=
v>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">Hi Pawel,<br class=3D"">
<br class=3D"">
On 22/08/2019 12:02, Wieczorkiewicz, Pawel wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<blockquote type=3D"cite" class=3D"">On 22. Aug 2019, at 12:29, Julien Gral=
l &lt;<a href=3D"mailto:julien.grall@arm.com" class=3D"">julien.grall@arm.c=
om</a> &lt;<a href=3D"mailto:julien.grall@arm.com" class=3D"">mailto:julien=
.grall@arm.com</a>&gt;&gt; wrote:<br class=3D"">
On 21/08/2019 09:19, Pawel Wieczorkiewicz wrote:<br class=3D"">
More generally, I am not very comfortable to see panic() in the middle of t=
he code. Could you explain why panic is the best solution over reverting th=
e work?<br class=3D"">
<br class=3D"">
</blockquote>
Yes. Production-ready hotpatches must not contain inconsistent hooks or fun=
ctions-to-be-applied/reverted.<br class=3D"">
The goal here is to detect such hotpatches and fail hard immediately highli=
ghting the fact that such hotpatch<br class=3D"">
is broken.<br class=3D"">
</blockquote>
<br class=3D"">
Aside the len =3D 0 that you are going to fix. How would this condition hap=
pen? Are you going to add code that will potentially trigger the panic?<br =
class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>The default livepatch code path is very conservative (to the extent it=
 does not even need this check and panic).</div>
<div>But, with the changes of this series, one can potentially construct a =
hotpatch that upon load would trigger the panic</div>
<div>(or without the panic, would silently leave the Xen code in memory in =
an inconsistent state). This obviously must not</div>
<div>happen in production, so the new livepatch feature should be used with=
 care.The changes make livepatch more</div>
<div>flexible and universal, yet when using new features, more care is need=
ed.</div>
<div><br class=3D"">
</div>
<div>However, when someone is developing a hotpatch or is using the new fea=
ture for debugging or for whatever</div>
<div>non-production-related reason, it is very helpful to detect immediatel=
y any sort of undefined state.</div>
<div>I have been there myself when I was working on the changes presented h=
ere, and thought that would be a good idea</div>
<div>to add this checks permanently.</div>
<div>Also, when something changes in the future in the livepatch implementa=
tion, those checks could potentially highlight</div>
<div>any inconsistencies.&nbsp;</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">
<blockquote type=3D"cite" class=3D"">The inconsistent application of a hotp=
atch (some function applied, some reverted while other left behined) leaves=
<br class=3D"">
the system in a very bad state. I think the best what we could do here is p=
anic() to enable post-mortem analysis<br class=3D"">
of what went wrong and avoid leaking such system into production.<br class=
=3D"">
</blockquote>
<br class=3D"">
Thank you for the explanation here (and on IRC). May I ask some documentati=
on regarding the panic in at least commit message? Ideally, this would expl=
ain why the panic the most sensible solution.<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Yes, certainly. I will add that.</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">Cheers,<br class=3D"">
<br class=3D"">
-- <br class=3D"">
Julien Grall<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">
<div dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space;=
 line-break: after-white-space;" class=3D"">
<div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration: none;">
Best Regards,<br class=3D"">
Pawel Wieczorkiewicz</div>
<br class=3D"Apple-interchange-newline">
</div>
<br class=3D"Apple-interchange-newline">
</div>
<br class=3D"">
<br><br><br>Amazon Development Center Germany GmbH
<br>Krausenstr. 38
<br>10117 Berlin
<br>Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
<br>Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
<br>Sitz: Berlin
<br>Ust-ID: DE 289 237 879
<br><br><br>
</body>
</html>

--_000_FA06107F58B84D1F9D1A15908E049F57amazoncom_--



--===============8041065327198157842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8041065327198157842==--


