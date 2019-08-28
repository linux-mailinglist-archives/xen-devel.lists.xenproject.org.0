Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A69FC14
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 09:40:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2sWI-0007DX-Sg; Wed, 28 Aug 2019 07:37:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2Mhn=WY=amazon.de=prvs=136b4528f=wipawel@srs-us1.protection.inumbo.net>)
 id 1i2sWG-0007DN-WD
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 07:37:29 +0000
X-Inumbo-ID: afb15b3c-c966-11e9-ac23-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afb15b3c-c966-11e9-ac23-bc764e2007e4;
 Wed, 28 Aug 2019 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566977848; x=1598513848;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=vpcaGeVo4uG4Phzx2Ixsm0pv81yTlnShN69He7TMkv0=;
 b=RLYymFWVACAw5tyWJMcXDru5+3ZGBzyVOt8/h+Lqd4Njlc7Gsfku6fiH
 PyaYzU2HX0eenmc9CH6jYWFOzUMYUG/IVGoLmd3yYBFDvbOYZCzpeZ0fL
 lGGM5gMDTZtEJ/q2m/Azw32WIj0vlt8A5mQ4cyOJEwXnIVTzjRjOkZ+cW g=;
X-IronPort-AV: E=Sophos;i="5.64,440,1559520000"; 
 d="scan'208,217";a="412295527"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 28 Aug 2019 07:37:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 49D3FA2848; Wed, 28 Aug 2019 07:37:23 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 28 Aug 2019 07:37:23 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 28 Aug 2019 07:37:22 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 28 Aug 2019 07:37:22 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [PATCH v2 05/12] livepatch: Add support for apply|revert action
 replacement hooks
Thread-Index: AQHVXLP1qR0zlpw7DEKYpJOeJAPUVKcPN+eAgAD1i4A=
Date: Wed, 28 Aug 2019 07:37:22 +0000
Message-ID: <F3A43E49-6F04-49A8-A5AD-5BABC14A02F2@amazon.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
 <20190827084624.116917-6-wipawel@amazon.de>
 <AC4BE922-88D7-47B9-9CEC-D9413B22AB61@oracle.com>
In-Reply-To: <AC4BE922-88D7-47B9-9CEC-D9413B22AB61@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.11]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 05/12] livepatch: Add support for
 apply|revert action replacement hooks
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7409567032924073740=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7409567032924073740==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_F3A43E496F0449A8A5AD5BABC14A02F2amazoncom_"

--_000_F3A43E496F0449A8A5AD5BABC14A02F2amazoncom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 27. Aug 2019, at 18:58, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com<ma=
ilto:konrad.wilk@oracle.com>> wrote:

On August 27, 2019 4:46:17 AM EDT, Pawel Wieczorkiewicz <wipawel@amazon.de<=
mailto:wipawel@amazon.de>> wrote:
By default, in the quiescing zone, a hotpatch payload is applied with
apply_payload() and reverted with revert_payload() functions. Both of
the functions receive the payload struct pointer as a parameter. The
functions are also a place where standard 'load' and 'unload' module
hooks are executed.

To increase hotpatching system's agility and provide more flexiable
long-term hotpatch solution, allow to overwrite the default apply
and revert action functions with hook-like supplied alternatives.
The alternative functions are optional and the default functions are
used by default.

Is there sense in having the old ones anymore? We could just remove them al=
together and just use the new ones instead from the start?


Yes, I believe there is. The old ones represent well-tested, proven way of
payload application (or revert) which preserves conservative behavior of th=
e system
via enforcing certain assumptions.
The old ones cover 99% of the production use cases, so I would insist on ke=
eping
them in (at least for now).

Later, we could modify livepatch-build-tools to always generate the original
apply|revert functions (in a default case) as part of payloads (hooks).
But, I would not do it just now.

Best Regards,
Pawel Wieczorkiewicz






Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_000_F3A43E496F0449A8A5AD5BABC14A02F2amazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <CA0BB94E04688D4ABCBCD2A25CA89CF3@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 27. Aug 2019, at 18:58, Konrad Rzeszutek Wilk &lt;<a hre=
f=3D"mailto:konrad.wilk@oracle.com" class=3D"">konrad.wilk@oracle.com</a>&g=
t; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">On August 27, 2019 4:46:17 AM EDT, Pawel Wieczorkiewicz &lt=
;<a href=3D"mailto:wipawel@amazon.de" class=3D"">wipawel@amazon.de</a>&gt; =
wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">By default, in the quiescing zone, a h=
otpatch payload is applied with<br class=3D"">
apply_payload() and reverted with revert_payload() functions. Both of<br cl=
ass=3D"">
the functions receive the payload struct pointer as a parameter. The<br cla=
ss=3D"">
functions are also a place where standard 'load' and 'unload' module<br cla=
ss=3D"">
hooks are executed.<br class=3D"">
<br class=3D"">
To increase hotpatching system's agility and provide more flexiable<br clas=
s=3D"">
long-term hotpatch solution, allow to overwrite the default apply<br class=
=3D"">
and revert action functions with hook-like supplied alternatives.<br class=
=3D"">
The alternative functions are optional and the default functions are<br cla=
ss=3D"">
used by default.<br class=3D"">
</blockquote>
<br class=3D"">
Is there sense in having the old ones anymore? We could just remove them al=
together and just use the new ones instead from the start?<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
</div>
<div class=3D""><br class=3D"">
</div>
Yes, I believe there is. The old ones represent well-tested, proven way of
<div class=3D"">payload application (or revert) which preserves conservativ=
e behavior of the system</div>
<div class=3D"">via enforcing certain assumptions.</div>
<div class=3D"">The old ones cover 99% of the production use cases, so I wo=
uld insist on keeping
<div class=3D"">them in (at least for now).</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Later, we could modify livepatch-build-tools to always gene=
rate the original</div>
<div class=3D"">apply|revert functions (in a default case) as part of paylo=
ads (hooks).</div>
<div class=3D"">But, I would not do it just now.</div>
<div class=3D""><br class=3D"">
</div>
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
</div>
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

--_000_F3A43E496F0449A8A5AD5BABC14A02F2amazoncom_--



--===============7409567032924073740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7409567032924073740==--


